uint64_t initializeBufferWithCopyOfBuffer for SQLiteStatement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy192_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 128) = result;
  *(_OWORD *)(a1 + 144) = v9;
  return result;
}

uint64_t sub_259F7BE88(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 192)) {
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

uint64_t sub_259F7BEE4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 184) = 0;
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
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 192) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 192) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for sqlite3_module(uint64_t a1)
{
}

void sub_259F7BF7C()
{
  qword_26A401C58 = -1;
}

uint64_t sub_259F7BF8C(uint64_t a1)
{
  return sub_259F7C050(a1, qword_26A401C60);
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

uint64_t sub_259F7C03C(uint64_t a1)
{
  return sub_259F7C050(a1, qword_26A401C78);
}

uint64_t sub_259F7C050(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_259FA1E60();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  long long v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  long long v10 = (char *)&v16 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  v13 = (char *)&v16 - v12;
  __swift_allocate_value_buffer(v11, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_259FA1E30();
  sub_259FA1E20();
  sub_259FA1E40();
  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v7, v3);
  v14(v10, v3);
  sub_259FA1E50();
  return ((uint64_t (*)(char *, uint64_t))v14)(v13, v3);
}

void type metadata accessor for sqlite3_vtab_cursor(uint64_t a1)
{
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t sub_259F7C208(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_259F7C228(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
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
  *(unsigned char *)(result + 96) = v3;
  return result;
}

void type metadata accessor for sqlite3_index_info(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_259F7C294(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_259F7C2B4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for sqlite3_vtab(uint64_t a1)
{
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void type metadata accessor for sqlite3_index_constraint_usage(uint64_t a1)
{
}

uint64_t sub_259F7C314(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_259F7C334(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

void type metadata accessor for sqlite3_index_orderby(uint64_t a1)
{
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t sub_259F7C384(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_259F7C3A4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(unsigned char *)(result + 12) = v3;
  return result;
}

void type metadata accessor for sqlite3_index_constraint(uint64_t a1)
{
}

void sub_259F7C3E4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteColumnType.getDataType()()
{
  switch(*v1)
  {
    case 1:
      char v2 = 2;
      goto LABEL_6;
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
      char *v0 = 0;
      return result;
    case 6:
    case 7:
    case 8:
      char v2 = 3;
      goto LABEL_6;
    case 0xA:
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v3 = 0xD00000000000003ELL;
      *(void *)(v3 + 8) = 0x8000000259FA2C50;
      *(void *)(v3 + 16) = 0;
      *(unsigned char *)(v3 + 24) = 4;
      return swift_willThrow();
    default:
      char v2 = 1;
LABEL_6:
      char *v0 = v2;
      return result;
  }
}

unint64_t sub_259F7C520()
{
  unint64_t result = qword_26A401778;
  if (!qword_26A401778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401778);
  }
  return result;
}

ValueMetadata *SQLiteColumnType.defaultNativeType.getter()
{
  v1 = (ValueMetadata *)MEMORY[0x263F8D310];
  switch(*v0)
  {
    case 1:
      v1 = (ValueMetadata *)MEMORY[0x263F06F78];
      sub_259F7C6F4();
      break;
    case 2:
      v1 = (ValueMetadata *)MEMORY[0x263F8E548];
      break;
    case 3:
      v1 = (ValueMetadata *)MEMORY[0x263F8E5C0];
      break;
    case 4:
      v1 = (ValueMetadata *)MEMORY[0x263F8E8F8];
      break;
    case 5:
      v1 = (ValueMetadata *)MEMORY[0x263F8E970];
      break;
    case 6:
      v1 = (ValueMetadata *)MEMORY[0x263F8D5C8];
      break;
    case 7:
    case 8:
      v1 = (ValueMetadata *)MEMORY[0x263F8D538];
      break;
    case 9:
      v1 = (ValueMetadata *)MEMORY[0x263F8D4F8];
      break;
    case 0xA:
      v1 = &type metadata for SQLiteUndefined;
      sub_259F7C6A0();
      break;
    default:
      return v1;
  }
  return v1;
}

unint64_t sub_259F7C6A0()
{
  unint64_t result = qword_26A401780;
  if (!qword_26A401780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401780);
  }
  return result;
}

unint64_t sub_259F7C6F4()
{
  unint64_t result = qword_26A401788;
  if (!qword_26A401788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401788);
  }
  return result;
}

PoirotSQLite::SQLiteColumnType_optional __swiftcall SQLiteColumnType.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_259FA23B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 11;
  if (v3 < 0xB) {
    char v5 = v3;
  }
  *char v2 = v5;
  return result;
}

void *static SQLiteColumnType.allCases.getter()
{
  return &unk_2707E6090;
}

uint64_t SQLiteColumnType.rawValue.getter()
{
  uint64_t result = 1415071060;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1112493122;
      break;
    case 2:
      uint64_t result = 0x3233544E49;
      break;
    case 3:
      uint64_t result = 0x3436544E49;
      break;
    case 4:
      uint64_t result = 0x3233544E4955;
      break;
    case 5:
      uint64_t result = 0x3436544E4955;
      break;
    case 6:
      uint64_t result = 0x54414F4C46;
      break;
    case 7:
      uint64_t result = 0x454C42554F44;
      break;
    case 8:
      uint64_t result = 0x454D495445544144;
      break;
    case 9:
      uint64_t result = 0x4E41454C4F4F42;
      break;
    case 0xA:
      uint64_t result = 5852737;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259F7C8D0(unsigned __int8 *a1, char *a2)
{
  return sub_259F7C934(*a1, *a2);
}

unint64_t sub_259F7C8E0()
{
  unint64_t result = qword_26A401790;
  if (!qword_26A401790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401790);
  }
  return result;
}

uint64_t sub_259F7C934(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1415071060;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1415071060;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 1112493122;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x3233544E49;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x3436544E49;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x3233544E4955;
      break;
    case 5:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x3436544E4955;
      break;
    case 6:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x54414F4C46;
      break;
    case 7:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x454C42554F44;
      break;
    case 8:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x454D495445544144;
      break;
    case 9:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x4E41454C4F4F42;
      break;
    case 10:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 5852737;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 1112493122) {
        goto LABEL_31;
      }
      goto LABEL_34;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x3233544E49) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x3436544E49) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x3233544E4955) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 5:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x3436544E4955) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 6:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x54414F4C46) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 7:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x454C42554F44) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 8:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x454D495445544144) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 9:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x4E41454C4F4F42) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 10:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v2 = 5852737;
      goto LABEL_30;
    default:
LABEL_30:
      if (v5 != v2) {
        goto LABEL_34;
      }
LABEL_31:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_34:
      }
        char v7 = sub_259FA2400();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_259F7CC18()
{
  return sub_259FA24A0();
}

uint64_t sub_259F7CC60()
{
  return sub_259F7CC68();
}

uint64_t sub_259F7CC68()
{
  sub_259FA1FD0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_259F7CDC0()
{
  return sub_259FA24A0();
}

PoirotSQLite::SQLiteColumnType_optional sub_259F7CE04(Swift::String *a1)
{
  return SQLiteColumnType.init(rawValue:)(*a1);
}

uint64_t sub_259F7CE10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SQLiteColumnType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_259F7CE3C()
{
  unint64_t result = qword_26A401798;
  if (!qword_26A401798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4017A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401798);
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

void sub_259F7CEE0(void *a1@<X8>)
{
  *a1 = &unk_2707E6090;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteColumnType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SQLiteColumnType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
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
        JUMPOUT(0x259F7D058);
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
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

uint64_t sub_259F7D080(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_259F7D08C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteColumnType()
{
  return &type metadata for SQLiteColumnType;
}

BOOL sub_259F7D0A4(void *a1, uint64_t a2, uint64_t a3)
{
  return SQLiteColumnDescribing.isValid(_:)(a1, a2, a3);
}

BOOL SQLiteColumnDescribing.isValid(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  v21 = *(void (**)(uint64_t, uint64_t))(a3 + 24);
  v21(a2, a3);
  (*(void (**)(char *__return_ptr))(v6 + 24))((char *)&v24 + 2);
  uint64_t v7 = 1;
  char v8 = 1;
  char v9 = 0;
  char v10 = 0;
  char v11 = 0;
  switch(BYTE2(v24))
  {
    case 1:
      char v9 = 0;
      char v8 = 0;
      char v11 = 0;
      char v10 = 1;
      uint64_t v7 = 2;
      goto LABEL_5;
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
      char v9 = 0;
      char v10 = 0;
      char v8 = 0;
      uint64_t v7 = 0;
      char v11 = 1;
      goto LABEL_5;
    case 6:
    case 7:
    case 8:
      char v10 = 0;
      char v8 = 0;
      char v11 = 0;
      char v9 = 1;
      uint64_t v7 = 3;
      goto LABEL_5;
    case 0xA:
LABEL_15:
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v18 = 0xD00000000000003ELL;
      *(void *)(v18 + 8) = 0x8000000259FA2C50;
      *(void *)(v18 + 16) = 0;
      *(unsigned char *)(v18 + 24) = 4;
      swift_willThrow();
      return v14;
    default:
LABEL_5:
      char v23 = v10;
      char v19 = v8;
      char v20 = v11;
      uint64_t v12 = a1[3];
      uint64_t v13 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v12);
      (*(void (**)(char *__return_ptr, uint64_t, uint64_t))(v13 + 40))((char *)&v24 + 1, v12, v13);
      if (!v3)
      {
        int v15 = 1;
        switch(BYTE1(v24))
        {
          case 1:
            int v15 = 3;
            goto LABEL_10;
          case 2:
            int v15 = 4;
            goto LABEL_10;
          case 3:
            int v15 = 2;
            goto LABEL_10;
          case 4:
            v21(a2, a3);
            if ((*(uint64_t (**)(void))(v17 + 32))())
            {
              __swift_project_boxed_opaque_existential_1(a1, a1[3]);
              swift_getDynamicType();
              (*(void (**)(uint64_t *__return_ptr))(a1[4] + 24))(&v24);
              BOOL v14 = v23;
              switch((char)v24)
              {
                case 1:
                  return v14;
                case 2:
                case 3:
                case 4:
                case 5:
                case 9:
                  BOOL v14 = v20;
                  break;
                case 6:
                case 7:
                case 8:
                  BOOL v14 = v9;
                  break;
                case 10:
                  goto LABEL_15;
                default:
                  BOOL v14 = v19;
                  break;
              }
            }
            else
            {
              return 0;
            }
            return v14;
          default:
LABEL_10:
            BOOL v14 = v15 == dword_259FA3BA0[v7];
            break;
        }
      }
      return v14;
  }
}

uint64_t SQLiteColumnDescribing.nullable.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 24))();
  return (*(uint64_t (**)(void))(v2 + 32))() & 1;
}

BOOL static SQLiteColumnDescribing.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  v32 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - v11;
  BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 32);
  uint64_t v31 = v10;
  uint64_t v16 = v14(v15, v13);
  uint64_t v18 = v17;
  uint64_t v33 = a2;
  if (v16 == v14(a3, a4) && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v25(v12, v31, a3);
    char v23 = v32;
    v25(v32, v33, a3);
  }
  else
  {
    char v21 = sub_259FA2400();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v22(v12, v31, a3);
    char v23 = v32;
    v22(v32, v33, a3);
    BOOL v24 = 0;
    if ((v21 & 1) == 0) {
      goto LABEL_9;
    }
  }
  v26 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 24);
  uint64_t v27 = v26(a3, a4);
  BOOL v24 = v27 == v26(a3, a4);
LABEL_9:
  v28 = *(void (**)(char *, uint64_t))(v7 + 8);
  v28(v23, a3);
  v28(v12, a3);
  return v24;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteColumnDescribing.ensureValidSQLNameCharacters()()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 32))();
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  sub_259F7DB70(v1, v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  sub_259F7DBB8(v1, v3);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_6;
  }
  if (qword_26A401720 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_259FA1E60();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A401C78);
  sub_259F7DC38();
  sub_259FA2210();
  char v9 = v8;
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_12:
    sub_259F7C520();
    swift_allocError();
    *(void *)(v13 + 8) = 0;
    *(void *)(v13 + 16) = 0;
    *(void *)uint64_t v13 = 10;
    *(unsigned char *)(v13 + 24) = 5;
    swift_willThrow();
    goto LABEL_13;
  }
  sub_259FA2210();
  char v11 = v10;
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0) {
    goto LABEL_12;
  }
  if (qword_26A401718 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v14, (uint64_t)qword_26A401C60);
  sub_259FA2210();
  if ((v12 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_13:
  swift_bridgeObjectRelease();
}

uint64_t SQLiteColumnDescribing<>.columnName.getter()
{
  sub_259FA20C0();
  return v1;
}

uint64_t SQLiteColumnDescribing<>.init(index:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_259FA22B0();
  if (MEMORY[0x25A2F0DA0](v8, a2) <= a1)
  {
    uint64_t v6 = 1;
  }
  else
  {
    sub_259FA2130();
    uint64_t v6 = 0;
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, v6, 1, a2);
}

uint64_t SQLiteColumnDescribing<>.getColumnIndex()()
{
  sub_259FA22B0();
  sub_259FA2120();
  swift_getWitnessTable();
  sub_259FA2180();
  swift_bridgeObjectRelease();
  if (v3)
  {
    sub_259FA20C0();
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v0 = v2;
    *(void *)(v0 + 8) = v3;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 24) = 1;
    return swift_willThrow();
  }
  uint64_t result = v2;
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v2 > 0x7FFFFFFF) {
LABEL_7:
  }
    __break(1u);
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

uint64_t sub_259F7DB70(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return sub_259FA2090();
  }
  else {
    return 0;
  }
}

uint64_t sub_259F7DBB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  sub_259FA1FF0();
  return sub_259FA2090();
}

unint64_t sub_259F7DC38()
{
  unint64_t result = qword_26A4017A8;
  if (!qword_26A4017A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4017A8);
  }
  return result;
}

uint64_t dispatch thunk of SQLiteColumnDescribing.columnType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SQLiteColumnDescribing.columnName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SQLiteColumnDescribing.isValid(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))() & 1;
}

Swift::OpaquePointer_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteStatement.nextRowValues()()
{
  SQLiteStatement.nextRow()(&v16);
  if (v0) {
    goto LABEL_20;
  }
  uint64_t v3 = v16;
  if (!v16)
  {
    Swift::Int v1 = 0;
    goto LABEL_20;
  }
  unint64_t v4 = sub_259F7DEC0(MEMORY[0x263F8EE78]);
  Swift::Int v15 = v4;
  uint64_t v5 = *(void *)(v3 + 16);
  if (!v5 || !*(void *)(v5 + 16))
  {
LABEL_16:
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 4;
LABEL_19:
    *(void *)uint64_t v13 = v14;
    *(void *)(v13 + 8) = 0;
    *(void *)(v13 + 16) = 0;
    *(unsigned char *)(v13 + 24) = 5;
    swift_willThrow();
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  Swift::Int v1 = v4;
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 24);
  if (!v6)
  {
LABEL_18:
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 3;
    goto LABEL_19;
  }
  uint64_t v7 = sqlite3_column_count(v6);
  if ((v7 & 0x80000000) != 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = (int)v7;
  if (v7)
  {
    Swift::Int v1 = 0;
    while (v8 != v1)
    {
      uint64_t v9 = *(void *)(v3 + 16);
      if (!v9 || !*(void *)(v9 + 16)) {
        goto LABEL_16;
      }
      char v10 = *(sqlite3_stmt **)(v3 + 24);
      if (!v10) {
        goto LABEL_18;
      }
      uint64_t v7 = (uint64_t)sqlite3_column_name(v10, v1);
      if (v7)
      {
        uint64_t v11 = sub_259FA2010();
        sub_259F7DFF0(v1, v11, v12, v3);
        uint64_t v7 = swift_bridgeObjectRelease();
      }
      if (v8 == ++v1)
      {
        swift_release();
        Swift::Int v1 = v15;
        goto LABEL_20;
      }
    }
    __break(1u);
    goto LABEL_24;
  }
  swift_release();
LABEL_20:
  uint64_t v7 = v1;
LABEL_25:
  result.value._rawValue = (void *)v7;
  result.is_nil = v2;
  return result;
}

unint64_t sub_259F7DEC0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017B0);
  uint64_t v2 = sub_259FA2390();
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
    sub_259F80160(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_259F7EC60(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_259F7FD40(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
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

uint64_t sub_259F7DFF0(Swift::Int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v24[0] = a4;
  uint64_t result = SQLiteRow.type(at:)(a1);
  if (!v9)
  {
    uint64_t v10 = MEMORY[0x263F8D310];
    switch(LOBYTE(v21[0]))
    {
      case 1:
        goto LABEL_6;
      case 2:
        sub_259F7C6F4();
        uint64_t v10 = MEMORY[0x263F06F78];
        goto LABEL_6;
      case 3:
        uint64_t v10 = MEMORY[0x263F8D538];
        goto LABEL_6;
      case 4:
        return result;
      default:
        uint64_t v10 = MEMORY[0x263F8E5C0];
LABEL_6:
        uint64_t v11 = swift_conformsToProtocol2();
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        if (v11) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v13 = 0;
        }
        if (v13)
        {
          uint64_t v25 = a4;
          uint64_t v22 = v13;
          uint64_t v23 = v12;
          __swift_allocate_boxed_opaque_existential_1(v21);
          SQLiteRow.get<A>(at:type:)(a1, v13, v13, v12);
LABEL_22:
          uint64_t v17 = v22;
          uint64_t v18 = v23;
          uint64_t v19 = __swift_project_boxed_opaque_existential_1(v21, v22);
          v24[3] = v17;
          v24[4] = *(void *)(v18 + 8);
          boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
          (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(boxed_opaque_existential_1, v19, v17);
          swift_bridgeObjectRetain();
          sub_259F7E218((uint64_t)v24, a2, a3);
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
        }
        uint64_t result = swift_conformsToProtocol2();
        if (result) {
          uint64_t v14 = result;
        }
        else {
          uint64_t v14 = 0;
        }
        if (result) {
          uint64_t v15 = v10;
        }
        else {
          uint64_t v15 = 0;
        }
        if (v15)
        {
          uint64_t v25 = a4;
          uint64_t v22 = v15;
          uint64_t v23 = v14;
          uint64_t v16 = __swift_allocate_boxed_opaque_existential_1(v21);
          SQLiteRow.getNonNull<A>(at:type:)(a1, v15, v14, (uint64_t)v16);
          goto LABEL_22;
        }
        break;
    }
  }
  return result;
}

uint64_t sub_259F7E218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_259F7FD40((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_259F7F3DC(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_259F80104(a1, &qword_26A4017C0);
    sub_259F7EDBC(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_259F80104((uint64_t)v9, &qword_26A4017C0);
  }
}

void SQLiteStatement.nextRowValues(matching:)(void *a1)
{
  uint64_t v4 = *((void *)v1 + 2);
  char v5 = *((unsigned char *)v1 + 40);
  long long v12 = *v1;
  uint64_t v13 = v4;
  long long v14 = *(long long *)((char *)v1 + 24);
  char v15 = v5;
  SQLiteStatement.nextRow()(&v16);
  if (!v2 && v16)
  {
    uint64_t v6 = a1[3];
    uint64_t v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
    swift_retain();
    uint64_t v9 = sub_259F7FB58(v8);
    swift_bridgeObjectRelease();
    swift_release();
    if (*(void *)(v9 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017B0);
      uint64_t v10 = sub_259FA2390();
    }
    else
    {
      uint64_t v10 = MEMORY[0x263F8EE80];
    }
    *(void *)&long long v12 = v10;
    uint64_t v11 = swift_bridgeObjectRetain();
    sub_259F7F790(v11, 1, &v12);
    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t SQLiteStatement.nextRowValues(ifMatching:)(void *a1)
{
  uint64_t v5 = *(void *)(v2 + 16);
  char v6 = *(unsigned char *)(v2 + 40);
  long long v54 = *(_OWORD *)v2;
  uint64_t v55 = v5;
  long long v56 = *(_OWORD *)(v2 + 24);
  char v57 = v6;
  SQLiteStatement.nextRow()(v53);
  if (v3) {
    return v1;
  }
  uint64_t v7 = *(void *)&v53[0];
  if (!*(void *)&v53[0]) {
    return 0;
  }
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v8, v9);
  unint64_t v11 = sub_259F7DEC0(MEMORY[0x263F8EE78]);
  unint64_t v1 = v11;
  uint64_t v12 = *(void *)(v10 + 16);
  if (!v12)
  {
LABEL_33:
    swift_release();
    swift_bridgeObjectRelease();
    return v1;
  }
  unint64_t v44 = v11;
  uint64_t v13 = v10 + 32;
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  uint64_t v46 = v12;
  uint64_t v47 = v7;
  uint64_t v45 = v10 + 32;
  while (1)
  {
    char v15 = (void *)(v13 + 40 * v14);
    uint64_t v16 = v15[3];
    v51 = v15 + 3;
    uint64_t v17 = v15[4];
    __swift_project_boxed_opaque_existential_1(v15, v16);
    v49 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 32);
    uint64_t v50 = v16;
    uint64_t v18 = v49(v16, v17);
    uint64_t v52 = v19;
    uint64_t v20 = *(void *)(v7 + 16);
    if (v20)
    {
      if (*(void *)(v20 + 16)) {
        break;
      }
    }
    sub_259F7C520();
    uint64_t v27 = (void *)swift_allocError();
    *(void *)(v26 + 16) = 0;
    uint64_t v28 = 4;
LABEL_12:
    *(void *)uint64_t v26 = v28;
    *(void *)(v26 + 8) = 0;
    *(unsigned char *)(v26 + 24) = 5;
LABEL_30:
    swift_willThrow();

    swift_bridgeObjectRelease();
LABEL_31:
    if (++v14 == v12)
    {
      swift_bridgeObjectRelease();
      unint64_t v1 = v44;
      goto LABEL_33;
    }
  }
  uint64_t v21 = v18;
  uint64_t v22 = *(sqlite3_stmt **)(v7 + 24);
  if (!v22)
  {
    sub_259F7C520();
    uint64_t v27 = (void *)swift_allocError();
    *(void *)(v26 + 16) = 0;
    uint64_t v28 = 3;
    goto LABEL_12;
  }
  uint64_t v48 = v21;
  uint64_t result = sqlite3_column_count(v22);
  if ((result & 0x80000000) != 0) {
    goto LABEL_37;
  }
  uint64_t v24 = (int)result;
  if (!result)
  {
LABEL_25:
    sub_259F7C520();
    uint64_t v27 = (void *)swift_allocError();
    *(void *)uint64_t v41 = v48;
    *(void *)(v41 + 8) = v52;
    *(void *)(v41 + 16) = 0;
    *(unsigned char *)(v41 + 24) = 1;
    swift_bridgeObjectRetain();
LABEL_29:
    uint64_t v13 = v45;
    uint64_t v12 = v46;
    goto LABEL_30;
  }
  uint64_t v25 = 0;
  while (v24 != v25)
  {
    uint64_t v30 = *(void *)(v7 + 16);
    if (!v30 || !*(void *)(v30 + 16))
    {
      sub_259F7C520();
      uint64_t v27 = (void *)swift_allocError();
      *(void *)(v42 + 16) = 0;
      uint64_t v43 = 4;
LABEL_28:
      *(void *)uint64_t v42 = v43;
      *(void *)(v42 + 8) = 0;
      *(unsigned char *)(v42 + 24) = 5;
      goto LABEL_29;
    }
    uint64_t v31 = *(sqlite3_stmt **)(v7 + 24);
    if (!v31)
    {
      sub_259F7C520();
      uint64_t v27 = (void *)swift_allocError();
      *(void *)(v42 + 16) = 0;
      uint64_t v43 = 3;
      goto LABEL_28;
    }
    uint64_t result = (uint64_t)sqlite3_column_name(v31, v25);
    if (result)
    {
      if (v48 == sub_259FA2010() && v52 == v32)
      {
        swift_bridgeObjectRelease();
        uint64_t v7 = v47;
LABEL_23:
        swift_bridgeObjectRelease();
        uint64_t v33 = v7;
        uint64_t v34 = v49(v50, v17);
        uint64_t v36 = v35;
        uint64_t v37 = *v51;
        uint64_t v38 = v15[4];
        v39 = __swift_project_boxed_opaque_existential_1(v15, *v51);
        *(void *)&v53[0] = v33;
        SQLiteRow.get<A>(from:)((uint64_t)v39, v37, v38);
        sub_259F7FD40(&v54, (uint64_t)v53);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v58 = v44;
        sub_259F7F3DC(v53, v34, v36, isUniquelyReferenced_nonNull_native);
        unint64_t v44 = v58;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v12 = v46;
        uint64_t v7 = v47;
        uint64_t v13 = v45;
        goto LABEL_31;
      }
      char v29 = sub_259FA2400();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v7 = v47;
      if (v29) {
        goto LABEL_23;
      }
    }
    if (v24 == ++v25) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t SQLiteStatement.bind(values:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_259F7EAAC(a1, (void (*)(void, void, _OWORD *))sub_259F7FD58, a2);
}

uint64_t sub_259F7E8F8(uint64_t a1, uint64_t a2, void *a3, long long *a4)
{
  uint64_t v6 = a3[3];
  uint64_t v7 = a3[4];
  uint64_t v8 = __swift_project_boxed_opaque_existential_1(a3, v6);
  v18[3] = v6;
  uint64_t v9 = *(void *)(v7 + 8);
  v18[4] = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, v8, v6);
  *(void *)&long long v16 = 64;
  *((void *)&v16 + 1) = 0xE100000000000000;
  sub_259FA2000();
  long long v11 = a4[1];
  long long v16 = *a4;
  v17[0] = v11;
  *(_OWORD *)((char *)v17 + 9) = *(long long *)((char *)a4 + 25);
  uint64_t v12 = sub_259F8F7CC();
  if (!v4)
  {
    if (v12)
    {
      long long v13 = a4[1];
      long long v16 = *a4;
      v17[0] = v13;
      *(_OWORD *)((char *)v17 + 9) = *(long long *)((char *)a4 + 25);
      (*(void (**)(long long *, uint64_t, uint64_t, uint64_t))(v9 + 8))(&v16, v12, v6, v9);
    }
    else
    {
      sub_259F7C520();
      swift_allocError();
      *(void *)(v14 + 8) = 0;
      *(void *)(v14 + 16) = 0;
      *(void *)uint64_t v14 = 9;
      *(unsigned char *)(v14 + 24) = 5;
      swift_willThrow();
    }
  }
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

uint64_t SQLiteStatement.bindIfAny(values:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_259F7EAAC(a1, (void (*)(void, void, _OWORD *))sub_259F7FFD0, a2);
}

uint64_t sub_259F7EAAC@<X0>(uint64_t a1@<X0>, void (*a2)(void, void, _OWORD *)@<X1>, _OWORD *a3@<X8>)
{
  long long v6 = v3[1];
  long long v9 = *v3;
  v10[0] = v6;
  *(_OWORD *)((char *)v10 + 9) = *(long long *)((char *)v3 + 25);
  uint64_t result = sub_259F7FD74(a1, a2);
  if (!v4)
  {
    long long v8 = v10[0];
    *a3 = v9;
    a3[1] = v8;
    *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v10 + 9);
    return sub_259F7FF98((uint64_t)&v9);
  }
  return result;
}

uint64_t sub_259F7EB18(uint64_t a1, uint64_t a2, void *a3, long long *a4)
{
  uint64_t v6 = a3[3];
  uint64_t v7 = a3[4];
  long long v8 = __swift_project_boxed_opaque_existential_1(a3, v6);
  v17[3] = v6;
  uint64_t v9 = *(void *)(v7 + 8);
  v17[4] = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, v8, v6);
  *(void *)&long long v15 = 64;
  *((void *)&v15 + 1) = 0xE100000000000000;
  sub_259FA2000();
  long long v11 = a4[1];
  long long v15 = *a4;
  v16[0] = v11;
  *(_OWORD *)((char *)v16 + 9) = *(long long *)((char *)a4 + 25);
  uint64_t v12 = sub_259F8F7CC();
  if (!v4 && v12)
  {
    long long v13 = a4[1];
    long long v15 = *a4;
    v16[0] = v13;
    *(_OWORD *)((char *)v16 + 9) = *(long long *)((char *)a4 + 25);
    (*(void (**)(long long *, uint64_t, uint64_t, uint64_t))(v9 + 8))(&v15, v12, v6, v9);
  }
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
}

unint64_t sub_259F7EC60(uint64_t a1, uint64_t a2)
{
  sub_259FA2470();
  sub_259FA1FD0();
  uint64_t v4 = sub_259FA24A0();

  return sub_259F7ECD8(a1, a2, v4);
}

unint64_t sub_259F7ECD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_259FA2400() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_259FA2400() & 1) == 0);
    }
  }
  return v6;
}

double sub_259F7EDBC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_259F7EC60(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_259F7F5A4();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_259F7FD40((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_259F7F1F0(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_259F7EEC8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017B0);
  char v37 = a2;
  uint64_t v6 = sub_259FA2380();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_259F7FD40(v25, (uint64_t)v38);
    }
    else
    {
      sub_259F800A0((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_259FA2470();
    sub_259FA1FD0();
    uint64_t result = sub_259FA24A0();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    long long v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *long long v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_259F7FD40(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_259F7F1F0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_259FA2270();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_259FA2470();
        swift_bridgeObjectRetain();
        sub_259FA1FD0();
        uint64_t v11 = sub_259FA24A0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          unint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          long long v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *unint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          int64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_259F7F3DC(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_259F7EC60(a2, a3);
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
      sub_259F7F5A4();
      goto LABEL_7;
    }
    sub_259F7EEC8(v15, a4 & 1);
    unint64_t v21 = sub_259F7EC60(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_259FA2420();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    __swift_destroy_boxed_opaque_existential_1(v19);
    return sub_259F7FD40(a1, v19);
  }
LABEL_13:
  sub_259F7F534(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_259F7F534(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_259F7FD40(a4, a5[7] + 40 * a1);
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

void *sub_259F7F5A4()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259FA2370();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    uint64_t v20 = 40 * v15;
    sub_259F800A0(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_259F7FD40(v26, *(void *)(v4 + 56) + v20);
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

void sub_259F7F790(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  sub_259F80160(a1 + 32, (uint64_t)&v43);
  uint64_t v7 = v43;
  uint64_t v8 = v44;
  uint64_t v41 = v43;
  uint64_t v42 = v44;
  sub_259F7FD40(v45, (uint64_t)v40);
  int64_t v9 = (void *)*a3;
  unint64_t v11 = sub_259F7EC60(v7, v8);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_259F7F5A4();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v20 = (uint64_t *)(v19[6] + 16 * v11);
    *uint64_t v20 = v7;
    v20[1] = v8;
    sub_259F7FD40(v40, v19[7] + 40 * v11);
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v23;
    uint64_t v24 = v4 - 1;
    if (!v24)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v25 = a1 + 88;
    while (1)
    {
      sub_259F80160(v25, (uint64_t)&v43);
      uint64_t v26 = v43;
      uint64_t v27 = v44;
      uint64_t v41 = v43;
      uint64_t v42 = v44;
      sub_259F7FD40(v45, (uint64_t)v40);
      unint64_t v28 = (void *)*a3;
      unint64_t v29 = sub_259F7EC60(v26, v27);
      uint64_t v31 = v28[2];
      BOOL v32 = (v30 & 1) == 0;
      BOOL v22 = __OFADD__(v31, v32);
      uint64_t v33 = v31 + v32;
      if (v22) {
        break;
      }
      char v34 = v30;
      if (v28[3] < v33)
      {
        sub_259F7EEC8(v33, 1);
        unint64_t v29 = sub_259F7EC60(v26, v27);
        if ((v34 & 1) != (v35 & 1)) {
          goto LABEL_25;
        }
      }
      if (v34) {
        goto LABEL_10;
      }
      uint64_t v36 = (void *)*a3;
      *(void *)(*a3 + 8 * (v29 >> 6) + 64) |= 1 << v29;
      char v37 = (uint64_t *)(v36[6] + 16 * v29);
      *char v37 = v26;
      v37[1] = v27;
      sub_259F7FD40(v40, v36[7] + 40 * v29);
      uint64_t v38 = v36[2];
      BOOL v22 = __OFADD__(v38, 1);
      uint64_t v39 = v38 + 1;
      if (v22) {
        goto LABEL_24;
      }
      v36[2] = v39;
      v25 += 56;
      if (!--v24) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_259F7EEC8(v14, a2 & 1);
  unint64_t v16 = sub_259F7EC60(v7, v8);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v18 = (void *)swift_allocError();
    swift_willThrow();
    id v46 = v18;
    MEMORY[0x25A2F1700](v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017D0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_259FA2420();
  __break(1u);
LABEL_26:
  sub_259FA2290();
  sub_259FA2000();
  sub_259FA2330();
  sub_259FA2000();
  sub_259FA2360();
  __break(1u);
}

uint64_t sub_259F7FB58(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_259F8AA6C(0, v2, 0);
    uint64_t v3 = v20;
    for (i = (void *)(a1 + 32); ; i += 5)
    {
      uint64_t v6 = i[3];
      uint64_t v7 = i[4];
      __swift_project_boxed_opaque_existential_1(i, v6);
      *(void *)&long long v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
      *((void *)&v16 + 1) = v8;
      uint64_t v10 = i[3];
      uint64_t v9 = i[4];
      unint64_t v11 = __swift_project_boxed_opaque_existential_1(i, v10);
      SQLiteRow.get<A>(from:)((uint64_t)v11, v10, v9);
      if (v1) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_259F8AA6C(0, *(void *)(v20 + 16) + 1, 1);
      }
      unint64_t v13 = *(void *)(v20 + 16);
      unint64_t v12 = *(void *)(v20 + 24);
      if (v13 >= v12 >> 1) {
        sub_259F8AA6C(v12 > 1, v13 + 1, 1);
      }
      *(void *)(v20 + 16) = v13 + 1;
      uint64_t v14 = v20 + 56 * v13;
      *(void *)(v14 + 80) = v19;
      *(_OWORD *)(v14 + 48) = v17;
      *(_OWORD *)(v14 + 64) = v18;
      *(_OWORD *)(v14 + 32) = v16;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v3;
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

uint64_t sub_259F7FD40(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_259F7FD58(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_259F7E8F8(a1, a2, a3, *(long long **)(v3 + 16));
}

uint64_t sub_259F7FD74(uint64_t a1, void (*a2)(void, void, _OWORD *))
{
  uint64_t v26 = a2;
  uint64_t v18 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v19 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (v6)
  {
    unint64_t v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_259F800A0(*(void *)(a1 + 56) + 40 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    long long v20 = v23;
    v21[0] = v24[0];
    v21[1] = v24[1];
    uint64_t v22 = v25;
    long long v14 = v23;
    swift_bridgeObjectRetain();
    v26(v14, *((void *)&v14 + 1), v21);
    uint64_t result = sub_259F80104((uint64_t)&v20, &qword_26A4017B8);
    if (v2) {
      return swift_release();
    }
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v8 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v8);
  if (v16)
  {
LABEL_19:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
    goto LABEL_5;
  }
  int64_t v17 = v8 + 1;
  if (v8 + 1 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16) {
    goto LABEL_18;
  }
  int64_t v17 = v8 + 2;
  if (v8 + 2 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16) {
    goto LABEL_18;
  }
  int64_t v17 = v8 + 3;
  if (v8 + 3 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16) {
    goto LABEL_18;
  }
  int64_t v17 = v8 + 4;
  if (v8 + 4 >= v19) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16)
  {
LABEL_18:
    int64_t v8 = v17;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v8 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v8 >= v19) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v18 + 8 * v8);
    ++v17;
    if (v16) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_259F7FF98(uint64_t a1)
{
  return a1;
}

uint64_t sub_259F7FFD0(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_259F7EB18(a1, a2, a3, *(long long **)(v3 + 16));
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

uint64_t sub_259F800A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_259F80104(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_259F80160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x25A2F1860);
  }
  return result;
}

uint64_t sub_259F8021C()
{
  uint64_t v0 = sub_259FA1F20();
  __swift_allocate_value_buffer(v0, qword_26A401C90);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A401C90);
  return sub_259FA1F10();
}

uint64_t sub_259F80294()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SQLiteLogger()
{
  return self;
}

uint64_t SQLiteDataType.defaultNativeType.getter()
{
  uint64_t result = MEMORY[0x263F8D310];
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      sub_259F7C6F4();
      uint64_t result = MEMORY[0x263F06F78];
      break;
    case 3:
      uint64_t result = MEMORY[0x263F8D538];
      break;
    case 4:
      uint64_t result = 0;
      break;
    default:
      uint64_t result = MEMORY[0x263F8E5C0];
      break;
  }
  return result;
}

PoirotSQLite::SQLiteDataType_optional __swiftcall SQLiteDataType.init(rawValue:)(Swift::Int32 rawValue)
{
  unint64_t v2 = 0x40201030005uLL >> (8 * rawValue);
  if (rawValue >= 6) {
    LOBYTE(v2) = 5;
  }
  unsigned char *v1 = v2;
  return (PoirotSQLite::SQLiteDataType_optional)rawValue;
}

uint64_t SQLiteDataType.rawValue.getter()
{
  return dword_259FA3C88[*v0];
}

BOOL sub_259F803B0(char *a1, char *a2)
{
  return dword_259FA3C88[*a1] == dword_259FA3C88[*a2];
}

unint64_t sub_259F803D8()
{
  unint64_t result = qword_26A4017D8[0];
  if (!qword_26A4017D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A4017D8);
  }
  return result;
}

uint64_t sub_259F8042C()
{
  return sub_259FA24A0();
}

uint64_t sub_259F8047C()
{
  return sub_259FA2490();
}

uint64_t sub_259F804B4()
{
  return sub_259FA24A0();
}

PoirotSQLite::SQLiteDataType_optional sub_259F80500(Swift::Int32 *a1)
{
  return SQLiteDataType.init(rawValue:)(*a1);
}

void sub_259F80508(_DWORD *a1@<X8>)
{
  *a1 = dword_259FA3C88[*v1];
}

uint64_t getEnumTagSinglePayload for SQLiteDataType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SQLiteDataType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x259F8067CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteDataType()
{
  return &type metadata for SQLiteDataType;
}

uint64_t SQLiteDatabase.makeCreateStatement(for:in:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  return sub_259F8070C(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SQLiteSchemaDescribing.makeCreateStatementString(for:in:), a6);
}

uint64_t SQLiteDatabase.makeSelectStatement(for:in:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  return sub_259F8070C(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SQLiteSchemaDescribing.makeSelectStatementString(for:in:), a6);
}

uint64_t sub_259F8070C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t a7@<X8>)
{
  uint64_t v15 = a5[3];
  uint64_t v14 = a5[4];
  __swift_project_boxed_opaque_existential_1(a5, v15);
  uint64_t result = a6(a1, a2, a3, a4, v15, v14);
  if (!v7)
  {
    sub_259F8B948(result, v17, 0, a7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t SQLiteDatabase.makeInsertStatement(for:in:with:values:returningRowId:replacingIfNeeded:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, Swift::Bool a7@<W6>, Swift::Bool a8@<W7>, _OWORD *a9@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a5, a5[3]);
  v15._countAndFlagsBits = a1;
  v15._object = a2;
  v16.value._countAndFlagsBits = a3;
  v16.value._object = a4;
  Swift::String v18 = SQLiteSchemaDescribing.makeInsertStatementString(for:in:returningRowId:replacingIfNeeded:)(v15, v16, a7, a8);
  uint64_t result = v18._countAndFlagsBits;
  if (!v19)
  {
    sub_259F8B948(v18._countAndFlagsBits, (uint64_t)v18._object, 0, (uint64_t)&v24);
    uint64_t v20 = swift_bridgeObjectRelease();
    long long v26 = v24;
    v27[0] = v25[0];
    *(_OWORD *)((char *)v27 + 9) = *(_OWORD *)((char *)v25 + 9);
    MEMORY[0x270FA5388](v20);
    uint64_t result = sub_259F7FD74(a6, (void (*)(void, void, _OWORD *))sub_259F7FD58);
    long long v21 = v27[0];
    *a9 = v26;
    a9[1] = v21;
    *(_OWORD *)((char *)a9 + 25) = *(_OWORD *)((char *)v27 + 9);
  }
  return result;
}

uint64_t sub_259F80944(uint64_t a1)
{
  return a1;
}

uint64_t SQLiteRow.get<A>(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  uint64_t v27 = v7;
  uint64_t v29 = v6;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v6 + 16);
  if (!v11 || !*(void *)(v11 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v18 = 4;
LABEL_8:
    *(void *)(v17 + 8) = 0;
    *(void *)(v17 + 16) = 0;
    *(void *)uint64_t v17 = v18;
    *(unsigned char *)(v17 + 24) = 5;
    goto LABEL_9;
  }
  uint64_t v12 = v8;
  uint64_t v13 = *(sqlite3_stmt **)(v6 + 24);
  if (!v13)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v18 = 3;
    goto LABEL_8;
  }
  uint64_t result = sqlite3_column_count(v13);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v28 = v10;
    uint64_t v15 = (int)result;
    if (result)
    {
      uint64_t v16 = 0;
      while (v15 != v16)
      {
        uint64_t v20 = *(void *)(v6 + 16);
        if (!v20 || !*(void *)(v20 + 16))
        {
          sub_259F7C520();
          swift_allocError();
          uint64_t v26 = 4;
LABEL_25:
          *(void *)(v25 + 8) = 0;
          *(void *)(v25 + 16) = 0;
          *(void *)uint64_t v25 = v26;
          *(unsigned char *)(v25 + 24) = 5;
          goto LABEL_9;
        }
        long long v21 = *(sqlite3_stmt **)(v6 + 24);
        if (!v21)
        {
          sub_259F7C520();
          swift_allocError();
          uint64_t v26 = 3;
          goto LABEL_25;
        }
        uint64_t result = (uint64_t)sqlite3_column_name(v21, v16);
        if (result)
        {
          if (v12 == sub_259FA2010() && v28 == v22)
          {
            swift_bridgeObjectRelease();
LABEL_20:
            swift_bridgeObjectRelease();
            char v23 = SQLiteColumnDescribing.nullable.getter(a2, a3);
            return (*(uint64_t (**)(uint64_t *, uint64_t, void))(v27 + 56))(&v29, v16, v23 & 1);
          }
          char v19 = sub_259FA2400();
          uint64_t result = swift_bridgeObjectRelease();
          if (v19) {
            goto LABEL_20;
          }
        }
        if (v15 == ++v16) {
          goto LABEL_22;
        }
      }
      __break(1u);
      goto LABEL_27;
    }
LABEL_22:
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v24 = v12;
    *(void *)(v24 + 8) = v28;
    *(void *)(v24 + 16) = 0;
    *(unsigned char *)(v24 + 24) = 1;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
LABEL_27:
  __break(1u);
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> String.ensureValidSQLNameCharacters()()
{
  unint64_t v2 = v1;
  uint64_t v3 = v0;
  swift_bridgeObjectRetain();
  sub_259F7DB70(v3, v2);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  sub_259F7DBB8(v3, v2);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_6;
  }
  if (qword_26A401720 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_259FA1E60();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A401C78);
  sub_259F7DC38();
  sub_259FA2210();
  char v9 = v8;
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_7:
    sub_259F7C520();
    swift_allocError();
    *(void *)(v10 + 8) = 0;
    *(void *)(v10 + 16) = 0;
    *(void *)uint64_t v10 = 10;
    *(unsigned char *)(v10 + 24) = 5;
    swift_willThrow();
    return;
  }
  sub_259FA2210();
  char v12 = v11;
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0) {
    goto LABEL_7;
  }
  if (qword_26A401718 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v14, (uint64_t)qword_26A401C60);
  sub_259FA2210();
  if ((v13 & 1) == 0) {
    goto LABEL_7;
  }
}

void sub_259F80E8C()
{
}

uint64_t dispatch thunk of SQLiteNamesValidating.ensureValidSQLNameCharacters()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

BOOL UDFColumnSchema.visible.getter(uint64_t a1, uint64_t a2)
{
  return ((*(uint64_t (**)(void))(a2 + 16))() & 1) == 0;
}

uint64_t UDFColumnSchema<>.columnName.getter()
{
  sub_259FA20C0();
  return v1;
}

uint64_t static UDFCaseIterableColumnSchema.allHidden.getter()
{
  return sub_259F80FE4();
}

uint64_t sub_259F80F5C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unsigned char *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + a1 - 8) + 8) + 16))(*(void *)(a2 + a1 - 16));
  *a3 = result & 1;
  return result;
}

uint64_t sub_259F80FAC()
{
  return 16;
}

__n128 sub_259F80FB8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t static UDFCaseIterableColumnSchema.allVisible.getter()
{
  return sub_259F80FE4();
}

uint64_t sub_259F80FE4()
{
  sub_259FA22B0();
  swift_getKeyPath();
  sub_259FA2120();
  swift_getWitnessTable();
  uint64_t v0 = sub_259FA22D0();
  swift_release();
  return v0;
}

BOOL sub_259F810AC@<W0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unsigned char *a3@<X8>)
{
  BOOL result = UDFColumnSchema.visible.getter(*(void *)(a2 + a1 - 16), *(void *)(*(void *)(a2 + a1 - 8) + 8));
  *a3 = result;
  return result;
}

uint64_t sub_259F810E8()
{
  return 16;
}

__n128 sub_259F810F4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_259F81100()
{
  swift_getAtKeyPath();
  return v1;
}

uint64_t sub_259F81134()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t SQLiteTableUDF.__allocating_init(style:)(char *a1)
{
  swift_allocObject();
  char v3 = *a1;
  return SQLiteVTab.init(style:)(&v3);
}

uint64_t SQLiteTableUDF.init(style:)(char *a1)
{
  char v2 = *a1;
  return SQLiteVTab.init(style:)(&v2);
}

uint64_t SQLiteTableUDF.__deallocating_deinit()
{
  SQLiteVTab.deinit();

  return swift_deallocClassInstance();
}

uint64_t static SQLiteTableUDF.getTable(forConnection:)(uint64_t a1)
{
  return sub_259F8127C(a1, sub_259F81CF0);
}

uint64_t static SQLiteTableUDF.getConnection(forCursor:)(uint64_t a1)
{
  return sub_259F8127C(a1, sub_259F81D60);
}

uint64_t sub_259F8127C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (!v2) {
    return swift_retain();
  }
  return result;
}

uint64_t static SQLiteTableUDF.getTable(forCursor:)()
{
  sub_259F81D60();
  if (!v1)
  {
    swift_retain();
    uint64_t v0 = sub_259F81CF0();
    swift_retain();
    swift_release();
  }
  return v0;
}

uint64_t sub_259F81314()
{
  sub_259F81CBC();

  return swift_bridgeObjectRetain();
}

uint64_t sub_259F8133C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_259F81384(uint64_t a1)
{
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  sub_259FA2120();
  swift_getWitnessTable();
  if (sub_259FA2170())
  {
    swift_bridgeObjectRetain();
    swift_beginAccess();
    *(void *)(v1 + 40) = a1;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = sub_259FA2360();
    __break(1u);
  }
  return result;
}

void sub_259F814C8()
{
}

uint64_t sub_259F81524()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_259F81568()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v0;
  swift_beginAccess();
  uint64_t v14 = v2[5];
  uint64_t v4 = *(void *)(v3 + 160);
  uint64_t v5 = *(void *)(v3 + 152);
  swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_259FA2120();
  uint64_t WitnessTable = swift_getWitnessTable();
  if ((sub_259FA2170() & 1) == 0 || (uint64_t v8 = (uint64_t)v2, (*(void (**)(void))(*v2 + 208))(), !v1))
  {
    swift_beginAccess();
    uint64_t v13 = v2[5];
    MEMORY[0x270FA5388](v13);
    v12[2] = v5;
    v12[3] = v4;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_259F87A08((void (*)(char *, char *))sub_259F82078, (uint64_t)v12, v6, MEMORY[0x263F8D310], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v9);
    swift_bridgeObjectRelease();
    uint64_t v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4019E0);
    sub_259F82098();
    uint64_t v8 = sub_259FA1F30();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_259F8177C@<X0>(void *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v3 = *(void *)(AssociatedConformanceWitness + 8);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 32);
  uint64_t v5 = swift_checkMetadataState();
  v4(v5, v3);
  sub_259FA2000();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v5, v3);
  (*(void (**)(uint64_t *__return_ptr))(v6 + 24))(&v9);
  sub_259FA2330();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v5, AssociatedConformanceWitness);
  sub_259FA2000();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  a1[1] = 0xE000000000000000;
  return result;
}

void *SQLiteTableUDF.BaseConnection.__allocating_init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  return SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(a1, a2, a3);
}

void *SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  swift_retain();
  *(void *)(v3 + 40) = sub_259FA20E0();
  swift_release();
  return SQLiteVTab.Connection.init(_:argc:argv:)(a1, a2, a3);
}

uint64_t sub_259F81A48()
{
  return swift_bridgeObjectRelease();
}

uint64_t SQLiteTableUDF.BaseConnection.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SQLiteTableUDF.BaseConnection.__deallocating_deinit()
{
  SQLiteTableUDF.BaseConnection.deinit();

  return swift_deallocClassInstance();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteTableUDF.CaseIterableColumnSchemaConnection.configureColumns()()
{
  swift_getAssociatedTypeWitness();
  sub_259FA22B0();
  sub_259F81384(v0);
  swift_bridgeObjectRelease();
}

void *SQLiteTableUDF.CaseIterableColumnSchemaConnection.__allocating_init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  return SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(a1, a2, a3);
}

void *SQLiteTableUDF.CaseIterableColumnSchemaConnection.init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  return SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(a1, a2, a3);
}

uint64_t SQLiteTableUDF.CaseIterableColumnSchemaConnection.__deallocating_deinit()
{
  SQLiteTableUDF.BaseConnection.deinit();

  return swift_deallocClassInstance();
}

uint64_t SQLiteTableUDF.BaseCursor.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t SQLiteTableUDF.BaseCursor.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = a1;
  return v1;
}

uint64_t SQLiteTableUDF.BaseCursor.deinit()
{
  swift_release();
  return v0;
}

uint64_t SQLiteTableUDF.BaseCursor.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_259F81CBC()
{
  swift_beginAccess();
  return *(void *)(v0 + 40);
}

uint64_t sub_259F81CF0()
{
  uint64_t v0 = swift_dynamicCastClass();
  if (!v0)
  {
    sub_259F820F4();
    swift_allocError();
    *(_DWORD *)uint64_t v1 = 0;
    *(unsigned char *)(v1 + 4) = 1;
    swift_willThrow();
  }
  return v0;
}

uint64_t sub_259F81D60()
{
  swift_getAssociatedTypeWitness();
  uint64_t v0 = swift_dynamicCastClass();
  if (!v0)
  {
    sub_259F820F4();
    swift_allocError();
    *(_DWORD *)uint64_t v1 = 1;
    *(unsigned char *)(v1 + 4) = 1;
    swift_willThrow();
  }
  return v0;
}

uint64_t sub_259F81DF8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_259F81CBC();

  return swift_bridgeObjectRetain();
}

uint64_t sub_259F81E34()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_259F8133C(v0);
}

uint64_t sub_259F81E60()
{
  return 16;
}

__n128 sub_259F81E6C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of UDFColumnSchema.hidden.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_259F81E90()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259F81EE0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF.BaseConnection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for SQLiteTableUDF.BaseConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SQLiteTableUDF.BaseConnection);
}

uint64_t dispatch thunk of SQLiteTableUDF.BaseConnection.allColumns.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SQLiteTableUDF.BaseConnection.setTableSchema(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SQLiteTableUDF.BaseConnection.configureColumns()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t sub_259F81FD8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF.CaseIterableColumnSchemaConnection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259F82028()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF.BaseCursor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259F82078@<X0>(void *a1@<X8>)
{
  return sub_259F8177C(a1);
}

unint64_t sub_259F82098()
{
  unint64_t result = qword_26A4019E8;
  if (!qword_26A4019E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4019E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4019E8);
  }
  return result;
}

unint64_t sub_259F820F4()
{
  unint64_t result = qword_26A4019F0[0];
  if (!qword_26A4019F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A4019F0);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteTableUDFError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SQLiteTableUDFError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_259F821D8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_259F821F4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteTableUDFError()
{
  return &type metadata for SQLiteTableUDFError;
}

uint64_t sub_259F82224()
{
  return sub_259F81100() & 1;
}

uint64_t sub_259F82240(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = (uint64_t *)sqlite3_malloc(32);
  char v3 = v2;
  if (v2)
  {
    *(void *)&long long v7 = 0;
    DWORD2(v7) = 0;
    *(void *)&long long v8 = 0;
    *((void *)&v8 + 1) = a1;
    if (&v7 < (long long *)v2 + 2 && v2 < &v9)
    {
      uint64_t result = sub_259FA23A0();
      __break(1u);
      return result;
    }
    long long v5 = v8;
    *(_OWORD *)int v2 = v7;
    *((_OWORD *)v2 + 1) = v5;
    swift_retain();
  }
  return (uint64_t)v3;
}

uint64_t SQLiteArgument.argument.getter()
{
  return *(void *)v0;
}

uint64_t SQLiteArgument.init(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    *(_OWORD *)uint64_t v2 = xmmword_259FA3EE0;
    *(void *)(v2 + 16) = 0;
    *(unsigned char *)(v2 + 24) = 4;
    return swift_willThrow();
  }
  return result;
}

uint64_t SQLiteArgument.subtype.getter()
{
  return sqlite3_value_subtype(*v0);
}

BOOL SQLiteArgument.isNull.getter()
{
  return sqlite3_value_type(*v0) == 5;
}

uint64_t SQLiteArgument.type.getter()
{
  return sqlite3_value_type(*v0);
}

BOOL SQLiteArgument.isText.getter()
{
  return sqlite3_value_type(*v0) == 3;
}

BOOL SQLiteArgument.isBlob.getter()
{
  uint64_t v1 = *v0;
  return sqlite3_value_type(*v0) == 4 || sqlite3_value_type(v1) == 3;
}

BOOL SQLiteArgument.isInteger.getter()
{
  return sqlite3_value_type(*v0) == 1;
}

BOOL SQLiteArgument.isFloatingPoint.getter()
{
  uint64_t v1 = *v0;
  return sqlite3_value_type(*v0) == 2 || sqlite3_value_type(v1) == 1;
}

Swift::Int32 __swiftcall SQLiteArgument.getInt32()()
{
  return sqlite3_value_int(*v0);
}

Swift::Int64 __swiftcall SQLiteArgument.getInt64()()
{
  return sqlite3_value_int64(*v0);
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getInt()()
{
  return sqlite3_value_int64(*v0);
}

Swift::UInt __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt()()
{
  return sub_259F827C8();
}

Swift::Int8 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getInt8()()
{
  int v1 = sqlite3_value_int(*v0);
  if (v1 >= -128)
  {
    if (v1 > 127) {
      __break(1u);
    }
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    LOBYTE(v1) = swift_willThrow();
  }
  return v1;
}

Swift::UInt8 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt8()()
{
  unsigned int v1 = sqlite3_value_int(*v0);
  if ((v1 & 0x80000000) != 0) {
    goto LABEL_4;
  }
  if (v1 >= 0x100)
  {
    sub_259FA2350();
    __break(1u);
LABEL_4:
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    LOBYTE(v1) = swift_willThrow();
  }
  return v1;
}

Swift::Int16 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getInt16()()
{
  int v1 = sqlite3_value_int(*v0);
  if (v1 >= -32768)
  {
    if (v1 >= 0x8000) {
      __break(1u);
    }
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    LOWORD(v1) = swift_willThrow();
  }
  return v1;
}

Swift::UInt16 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt16()()
{
  unsigned int v1 = sqlite3_value_int(*v0);
  if ((v1 & 0x80000000) != 0) {
    goto LABEL_4;
  }
  if (HIWORD(v1))
  {
    __break(1u);
LABEL_4:
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    LOWORD(v1) = swift_willThrow();
  }
  return v1;
}

Swift::UInt32 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt32()()
{
  Swift::UInt32 v1 = sqlite3_value_int(*v0);
  if ((v1 & 0x80000000) != 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    swift_willThrow();
  }
  return v1;
}

Swift::UInt64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt64()()
{
  return sub_259F827C8();
}

sqlite3_int64 sub_259F827C8()
{
  sqlite3_int64 v1 = sqlite3_value_int64(*v0);
  if (v1 < 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    swift_willThrow();
  }
  return v1;
}

Swift::Bool __swiftcall SQLiteArgument.getBool()()
{
  return sqlite3_value_int(*v0) != 0;
}

Swift::Float __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getFloat()()
{
  double v1 = sqlite3_value_double(*v0);
  if (v1 < 3.40282347e38 || v1 > -3.40282347e38) {
    return v1;
  }
  sub_259F7C520();
  swift_allocError();
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)uint64_t v4 = 8;
  *(unsigned char *)(v4 + 24) = 5;
  swift_willThrow();
  return result;
}

Swift::Double __swiftcall SQLiteArgument.getDouble()()
{
  return sqlite3_value_double(*v0);
}

uint64_t SQLiteArgument.withUnsafeBytes<A>(_:)(uint64_t (*a1)(const void *, uint64_t))
{
  char v3 = *v1;
  uint64_t v4 = sqlite3_value_blob(*v1);
  if (v4)
  {
    long long v5 = v4;
    uint64_t v6 = sqlite3_value_bytes(v3);
    uint64_t v4 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return a1(v4, v6);
}

uint64_t SQLiteArgument.getData()()
{
  double v1 = *v0;
  uint64_t v2 = sqlite3_value_blob(*v0);
  if (v2)
  {
    char v3 = v2;
    int v4 = sqlite3_value_bytes(v1);
    return sub_259F82E14(v3, v4);
  }
  else
  {
    sqlite3_value_type(v1);
    return 0;
  }
}

uint64_t SQLiteArgument.getDataNonNull()()
{
  double v1 = *v0;
  uint64_t v2 = sqlite3_value_blob(v1);
  if (v2)
  {
    char v3 = v2;
    int v4 = sqlite3_value_bytes(v1);
    return sub_259F82E14(v3, v4);
  }
  else if (sqlite3_value_type(v1) == 5)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(void *)uint64_t v6 = 6;
    *(unsigned char *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  else
  {
    return 0;
  }
}

Swift::String_optional __swiftcall SQLiteArgument.getString()()
{
  uint64_t v1 = (uint64_t)sqlite3_value_text(*v0);
  if (v1) {
    uint64_t v1 = sub_259FA2020();
  }
  else {
    uint64_t v2 = 0;
  }
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getStringNonNull()()
{
  if (sqlite3_value_text(*v0))
  {
    uint64_t v1 = sub_259FA2020();
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v3 + 8) = 0;
    *(void *)(v3 + 16) = 0;
    *(void *)uint64_t v3 = 6;
    *(unsigned char *)(v3 + 24) = 5;
    uint64_t v1 = swift_willThrow();
  }
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t SQLiteArgument.getBase64EncodedData()()
{
  uint64_t v1 = *v0;
  if (sqlite3_value_type(*v0) != 4 && sqlite3_value_type(v1) != 3) {
    return 0;
  }
  if (!sqlite3_value_text(v1)) {
    return 0;
  }
  sub_259FA2020();
  uint64_t v2 = sub_259FA1EE0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (v4 >> 60 == 15) {
    return 0;
  }
  return v2;
}

uint64_t Array<A>.init(_:argc:)(uint64_t a1, int a2)
{
  if (!a1)
  {
    sub_259F7C520();
    swift_allocError();
    *(_OWORD *)uint64_t v8 = xmmword_259FA3EF0;
    *(void *)(v8 + 16) = 0;
    *(unsigned char *)(v8 + 24) = 4;
    swift_willThrow();
    return v2;
  }
  if ((a2 & 0x80000000) == 0)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v5 = sub_259FA20F0();
      uint64_t v2 = v5;
      uint64_t v6 = 0;
      *(void *)(v5 + 16) = v3;
      while (v3 != v6)
      {
        uint64_t v7 = *(void *)(a1 + 8 * v6);
        if (!v7)
        {
          sub_259F7C520();
          swift_allocError();
          *(_OWORD *)uint64_t v9 = xmmword_259FA3EE0;
          *(void *)(v9 + 16) = 0;
          *(unsigned char *)(v9 + 24) = 4;
          swift_willThrow();
          *(void *)(v2 + 16) = 0;
          swift_bridgeObjectRelease();
          return v2;
        }
        *(void *)(v5 + 8 * v6++ + 32) = v7;
        if (v3 == v6) {
          goto LABEL_11;
        }
      }
      __break(1u);
      goto LABEL_15;
    }
    uint64_t v2 = MEMORY[0x263F8EE78];
LABEL_11:
    *(void *)(v2 + 16) = v3;
    return v2;
  }
LABEL_15:
  uint64_t result = sub_259FA2350();
  __break(1u);
  return result;
}

uint64_t sub_259F82D50(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_259F82E14(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_259F82D50(__src, &__src[a2]);
  }
  sub_259FA1EB0();
  swift_allocObject();
  sub_259FA1E70();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_259FA1EF0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteArgument(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteArgument(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteArgument()
{
  return &type metadata for SQLiteArgument;
}

uint64_t dispatch thunk of SQLiteUDF.register(_:database:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.type(at:)(Swift::Int at)
{
  int v3 = v1;
  uint64_t v4 = *(void *)(*(void *)v2 + 16);
  if (!v4 || !*(void *)(v4 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    char v9 = 5;
LABEL_10:
    *(unsigned char *)(v7 + 24) = v9;
    LOBYTE(v6) = swift_willThrow();
    return (char)v6;
  }
  uint64_t v6 = *(sqlite3_stmt **)(*(void *)v2 + 24);
  if (!v6)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (at < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (at > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return (char)v6;
  }
  LODWORD(v6) = sqlite3_column_type(v6, at);
  if ((v6 - 1) >= 5)
  {
    sub_259FA2290();
    swift_bridgeObjectRelease();
    sub_259FA23C0();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v7 = 0xD000000000000013;
    *(void *)(v7 + 8) = 0x8000000259FA2F90;
    *(void *)(v7 + 16) = 0;
    char v9 = 4;
    goto LABEL_10;
  }
  *int v3 = 0x402010300uLL >> (8 * (v6 - 1));
  return (char)v6;
}

uint64_t SQLiteRow.get<A>(at:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *v4;
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a4 + 16);
  swift_retain();
  return v8(&v10, a1, a3, a4);
}

{
  uint64_t *v4;
  uint64_t (*v8)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  uint64_t v10 = *v4;
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a4 + 16);
  swift_retain();
  return v8(&v10, a1, a3, a4);
}

uint64_t SQLiteRow.getNonNull<A>(at:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v19 = a4;
  uint64_t v9 = sub_259FA21E0();
  uint64_t v18 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v11 = (char *)&v18 - v10;
  uint64_t v20 = *v4;
  char v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a3 + 16);
  swift_retain();
  uint64_t result = v12(&v20, a1, a2, a3);
  if (!v5)
  {
    uint64_t v15 = v18;
    uint64_t v14 = v19;
    uint64_t v16 = *(void *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
      sub_259F7C520();
      swift_allocError();
      *(void *)(v17 + 8) = 0;
      *(void *)(v17 + 16) = 0;
      *(void *)uint64_t v17 = 6;
      *(unsigned char *)(v17 + 24) = 5;
      return swift_willThrow();
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v14, v11, a2);
    }
  }
  return result;
}

uint64_t SQLiteRow.forEachColumn(_:)(void (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (!v4 || !*(void *)(v4 + 16))
  {
LABEL_16:
    sub_259F7C520();
    swift_allocError();
    uint64_t v15 = 4;
LABEL_18:
    *(void *)uint64_t v14 = v15;
    *(void *)(v14 + 8) = 0;
    *(void *)(v14 + 16) = 0;
    *(unsigned char *)(v14 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t v6 = *(sqlite3_stmt **)(v3 + 24);
  if (!v6)
  {
LABEL_17:
    sub_259F7C520();
    swift_allocError();
    uint64_t v15 = 3;
    goto LABEL_18;
  }
  uint64_t result = sqlite3_column_count(v6);
  if ((result & 0x80000000) != 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v8 = (int)result;
  if (result)
  {
    uint64_t v9 = 0;
    while (v8 != v9)
    {
      uint64_t v10 = *(void *)(v3 + 16);
      if (!v10 || !*(void *)(v10 + 16)) {
        goto LABEL_16;
      }
      char v11 = *(sqlite3_stmt **)(v3 + 24);
      if (!v11) {
        goto LABEL_17;
      }
      uint64_t result = (uint64_t)sqlite3_column_name(v11, v9);
      if (result)
      {
        uint64_t v12 = sub_259FA2010();
        a1(v9, v12, v13);
        if (v2) {
          return swift_bridgeObjectRelease();
        }
        uint64_t result = swift_bridgeObjectRelease();
      }
      if (v8 == ++v9) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.columnIndex(for:)(Swift::String a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (!v4 || !*(void *)(v4 + 16))
  {
LABEL_17:
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 4;
LABEL_19:
    *(void *)(v13 + 8) = 0;
    *(void *)(v13 + 16) = 0;
    *(void *)uint64_t v13 = v14;
    *(unsigned char *)(v13 + 24) = 5;
    goto LABEL_20;
  }
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  a1._uint64_t countAndFlagsBits = *(void *)(v3 + 24);
  if (!a1._countAndFlagsBits)
  {
LABEL_18:
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 3;
    goto LABEL_19;
  }
  object = a1._object;
  Swift::Int result = sqlite3_column_count((sqlite3_stmt *)a1._countAndFlagsBits);
  if ((result & 0x80000000) != 0)
  {
LABEL_24:
    __break(1u);
    return result;
  }
  uint64_t v8 = (int)result;
  if (result)
  {
    Swift::Int v2 = 0;
    while (v8 != v2)
    {
      uint64_t v10 = *(void *)(v3 + 16);
      if (!v10 || !*(void *)(v10 + 16)) {
        goto LABEL_17;
      }
      char v11 = *(sqlite3_stmt **)(v3 + 24);
      if (!v11) {
        goto LABEL_18;
      }
      Swift::Int result = (Swift::Int)sqlite3_column_name(v11, v2);
      if (result)
      {
        if (sub_259FA2010() == countAndFlagsBits && v12 == object)
        {
          swift_bridgeObjectRelease();
          return v2;
        }
        char v9 = sub_259FA2400();
        Swift::Int result = swift_bridgeObjectRelease();
        if (v9) {
          return v2;
        }
      }
      if (v8 == ++v2) {
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_24;
  }
LABEL_22:
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v15 = countAndFlagsBits;
  *(void *)(v15 + 8) = object;
  *(void *)(v15 + 16) = 0;
  *(unsigned char *)(v15 + 24) = 1;
  swift_bridgeObjectRetain();
LABEL_20:
  swift_willThrow();
  return v2;
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.getColumnCount()()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1 && *(void *)(v1 + 16))
  {
    Swift::Int v2 = *(sqlite3_stmt **)(*(void *)v0 + 24);
    if (v2) {
      return sqlite3_column_count(v2);
    }
    sub_259F7C520();
    swift_allocError();
    uint64_t v5 = 3;
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v5 = 4;
  }
  *(void *)uint64_t v4 = v5;
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  *(unsigned char *)(v4 + 24) = 5;
  return swift_willThrow();
}

Swift::String_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.columnName(for:)(Swift::Int a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v6 = 4;
LABEL_9:
    *(void *)uint64_t v5 = v6;
    *(void *)(v5 + 8) = 0;
    *(void *)(v5 + 16) = 0;
    *(unsigned char *)(v5 + 24) = 5;
    uint64_t v4 = (sqlite3_stmt *)swift_willThrow();
    goto LABEL_14;
  }
  Swift::Int v3 = a1;
  uint64_t v4 = *(sqlite3_stmt **)(*(void *)v1 + 24);
  if (!v4)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v6 = 3;
    goto LABEL_9;
  }
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v4 = (sqlite3_stmt *)sqlite3_column_name(v4, v3);
  if (v4) {
    uint64_t v4 = (sqlite3_stmt *)sub_259FA2010();
  }
  else {
    Swift::Int v3 = 0;
  }
LABEL_14:
  result.value._object = (void *)v3;
  result.value._uint64_t countAndFlagsBits = (uint64_t)v4;
  return result;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.type(for:)(Swift::String a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
LABEL_18:
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 4;
LABEL_20:
    *(void *)(v13 + 8) = 0;
    *(void *)(v13 + 16) = 0;
    *(void *)uint64_t v13 = v14;
    *(unsigned char *)(v13 + 24) = 5;
    goto LABEL_21;
  }
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  a1._uint64_t countAndFlagsBits = *(void *)(v2 + 24);
  if (!a1._countAndFlagsBits)
  {
LABEL_19:
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 3;
    goto LABEL_20;
  }
  object = a1._object;
  LODWORD(v6) = sqlite3_column_count((sqlite3_stmt *)a1._countAndFlagsBits);
  if ((v6 & 0x80000000) != 0)
  {
LABEL_24:
    __break(1u);
    return (char)v6;
  }
  uint64_t v7 = (int)v6;
  if (v6)
  {
    Swift::Int v8 = 0;
    while (v7 != v8)
    {
      uint64_t v10 = *(void *)(v2 + 16);
      if (!v10 || !*(void *)(v10 + 16)) {
        goto LABEL_18;
      }
      char v11 = *(sqlite3_stmt **)(v2 + 24);
      if (!v11) {
        goto LABEL_19;
      }
      uint64_t v6 = sqlite3_column_name(v11, v8);
      if (v6)
      {
        if (sub_259FA2010() == countAndFlagsBits && v12 == object)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          LOBYTE(v6) = SQLiteRow.type(at:)(v8);
          return (char)v6;
        }
        char v9 = sub_259FA2400();
        LOBYTE(v6) = swift_bridgeObjectRelease();
        if (v9) {
          goto LABEL_17;
        }
      }
      if (v7 == ++v8) {
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_24;
  }
LABEL_22:
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v15 = countAndFlagsBits;
  *(void *)(v15 + 8) = object;
  *(void *)(v15 + 16) = 0;
  *(unsigned char *)(v15 + 24) = 1;
  swift_bridgeObjectRetain();
LABEL_21:
  LOBYTE(v6) = swift_willThrow();
  return (char)v6;
}

uint64_t SQLiteRow.get<A>(from:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *v5;
  uint64_t v7 = *(void *)(*v5 + 16);
  if (!v7 || !*(void *)(v7 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v17 = 4;
LABEL_8:
    *(void *)(v16 + 8) = 0;
    *(void *)(v16 + 16) = 0;
    *(void *)uint64_t v16 = v17;
    *(unsigned char *)(v16 + 24) = 5;
    swift_retain();
    goto LABEL_9;
  }
  Swift::Int v8 = *(sqlite3_stmt **)(v6 + 24);
  if (!v8)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v17 = 3;
    goto LABEL_8;
  }
  swift_retain();
  uint64_t result = sqlite3_column_count(v8);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v25 = a5;
    uint64_t v14 = (int)result;
    if (result)
    {
      uint64_t v15 = 0;
      while (v14 != v15)
      {
        uint64_t v19 = *(void *)(v6 + 16);
        if (!v19 || !*(void *)(v19 + 16))
        {
          sub_259F7C520();
          swift_allocError();
          uint64_t v24 = 4;
LABEL_25:
          *(void *)(v23 + 8) = 0;
          *(void *)(v23 + 16) = 0;
          *(void *)uint64_t v23 = v24;
          *(unsigned char *)(v23 + 24) = 5;
          goto LABEL_9;
        }
        uint64_t v20 = *(sqlite3_stmt **)(v6 + 24);
        if (!v20)
        {
          sub_259F7C520();
          swift_allocError();
          uint64_t v24 = 3;
          goto LABEL_25;
        }
        uint64_t result = (uint64_t)sqlite3_column_name(v20, v15);
        if (result)
        {
          if (sub_259FA2010() == a1 && v21 == a2)
          {
            swift_bridgeObjectRelease();
            return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(&v26, v15, a4);
          }
          char v18 = sub_259FA2400();
          uint64_t result = swift_bridgeObjectRelease();
          if (v18) {
            return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(&v26, v15, a4);
          }
        }
        if (v14 == ++v15) {
          goto LABEL_22;
        }
      }
      __break(1u);
      goto LABEL_27;
    }
LABEL_22:
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v22 = a1;
    *(void *)(v22 + 8) = a2;
    *(void *)(v22 + 16) = 0;
    *(unsigned char *)(v22 + 24) = 1;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_willThrow();
    return swift_release();
  }
LABEL_27:
  __break(1u);
  return result;
}

{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  sqlite3_stmt *v8;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  sqlite3_stmt *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  uint64_t v6 = *v5;
  uint64_t v7 = *(void *)(*v5 + 16);
  if (!v7 || !*(void *)(v7 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v17 = 4;
LABEL_8:
    *(void *)(v16 + 8) = 0;
    *(void *)(v16 + 16) = 0;
    *(void *)uint64_t v16 = v17;
    *(unsigned char *)(v16 + 24) = 5;
    swift_retain();
    goto LABEL_9;
  }
  Swift::Int v8 = *(sqlite3_stmt **)(v6 + 24);
  if (!v8)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v17 = 3;
    goto LABEL_8;
  }
  swift_retain();
  uint64_t result = sqlite3_column_count(v8);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v25 = a5;
    uint64_t v14 = (int)result;
    if (result)
    {
      uint64_t v15 = 0;
      while (v14 != v15)
      {
        uint64_t v19 = *(void *)(v6 + 16);
        if (!v19 || !*(void *)(v19 + 16))
        {
          sub_259F7C520();
          swift_allocError();
          uint64_t v24 = 4;
LABEL_25:
          *(void *)(v23 + 8) = 0;
          *(void *)(v23 + 16) = 0;
          *(void *)uint64_t v23 = v24;
          *(unsigned char *)(v23 + 24) = 5;
          goto LABEL_9;
        }
        uint64_t v20 = *(sqlite3_stmt **)(v6 + 24);
        if (!v20)
        {
          sub_259F7C520();
          swift_allocError();
          uint64_t v24 = 3;
          goto LABEL_25;
        }
        uint64_t result = (uint64_t)sqlite3_column_name(v20, v15);
        if (result)
        {
          if (sub_259FA2010() == a1 && v21 == a2)
          {
            swift_bridgeObjectRelease();
            return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(&v26, v15, a4);
          }
          char v18 = sub_259FA2400();
          uint64_t result = swift_bridgeObjectRelease();
          if (v18) {
            return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(&v26, v15, a4);
          }
        }
        if (v14 == ++v15) {
          goto LABEL_22;
        }
      }
      __break(1u);
      goto LABEL_27;
    }
LABEL_22:
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v22 = a1;
    *(void *)(v22 + 8) = a2;
    *(void *)(v22 + 16) = 0;
    *(unsigned char *)(v22 + 24) = 1;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_willThrow();
    return swift_release();
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t SQLiteRow.getNonNull<A>(at:type:)(Swift::Int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *v4;
  uint64_t result = SQLiteRow.type(at:)(a1);
  if (!v10)
  {
    if (v13 == 4)
    {
      sub_259F7C520();
      swift_allocError();
      *(void *)(v11 + 8) = 0;
      *(void *)(v11 + 16) = 0;
      *(void *)uint64_t v11 = 6;
      *(unsigned char *)(v11 + 24) = 5;
      return swift_willThrow();
    }
    else
    {
      uint64_t v14 = v8;
      uint64_t v12 = *(uint64_t (**)(uint64_t *, Swift::Int, uint64_t, uint64_t))(a4 + 16);
      swift_retain();
      return v12(&v14, a1, a3, a4);
    }
  }
  return result;
}

uint64_t SQLiteRow.getNonNull<A>(from:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_259F84204(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))SQLiteRow.getNonNull<A>(at:type:));
}

{
  return sub_259F84204(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))SQLiteRow.getNonNull<A>(at:type:));
}

uint64_t SQLiteRow.getNullable<A>(at:type:)@<X0>(Swift::Int a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v9 = *v4;
  uint64_t result = SQLiteRow.type(at:)(a1);
  if (!v11)
  {
    if (v14 == 4)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a4, 1, 1, a2);
    }
    else
    {
      uint64_t v13 = v9;
      uint64_t v12 = *(void (**)(uint64_t *, Swift::Int, uint64_t, uint64_t))(a3 + 16);
      swift_retain();
      v12(&v13, a1, a2, a3);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a4, 0, 1, a2);
    }
  }
  return result;
}

uint64_t SQLiteRow.getNullable<A>(from:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_259F84204(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))SQLiteRow.getNullable<A>(at:type:));
}

uint64_t sub_259F84204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  uint64_t v7 = *v6;
  uint64_t v8 = *(void *)(*v6 + 16);
  if (!v8 || !*(void *)(v8 + 16))
  {
LABEL_18:
    sub_259F7C520();
    swift_allocError();
    uint64_t v21 = 4;
LABEL_20:
    *(void *)(v20 + 8) = 0;
    *(void *)(v20 + 16) = 0;
    *(void *)uint64_t v20 = v21;
    *(unsigned char *)(v20 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t v10 = *(sqlite3_stmt **)(v7 + 24);
  if (!v10)
  {
LABEL_19:
    sub_259F7C520();
    swift_allocError();
    uint64_t v21 = 3;
    goto LABEL_20;
  }
  uint64_t result = sqlite3_column_count(v10);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v23 = a6;
    uint64_t v14 = (int)result;
    if (result)
    {
      uint64_t v15 = 0;
      while (v14 != v15)
      {
        uint64_t v17 = *(void *)(v7 + 16);
        if (!v17 || !*(void *)(v17 + 16)) {
          goto LABEL_18;
        }
        char v18 = *(sqlite3_stmt **)(v7 + 24);
        if (!v18) {
          goto LABEL_19;
        }
        uint64_t result = (uint64_t)sqlite3_column_name(v18, v15);
        if (result)
        {
          if (sub_259FA2010() == a1 && v19 == a2)
          {
            swift_bridgeObjectRelease();
            return v23(v15);
          }
          char v16 = sub_259FA2400();
          uint64_t result = swift_bridgeObjectRelease();
          if (v16) {
            return v23(v15);
          }
        }
        if (v14 == ++v15) {
          goto LABEL_22;
        }
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_22:
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v22 = a1;
    *(void *)(v22 + 8) = a2;
    *(void *)(v22 + 16) = 0;
    *(unsigned char *)(v22 + 24) = 1;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
LABEL_24:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SQLiteRow()
{
  return &type metadata for SQLiteRow;
}

uint64_t Bool.bind(to:at:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3 & 1);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F8451C(uint64_t a1, uint64_t a2)
{
  return Bool.bind(to:at:)(a1, a2, *v2);
}

uint64_t Float.bind(to:at:)(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_double((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000015;
  *(void *)(v6 + 16) = 0x8000000259FA2FD0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F84654(uint64_t a1, uint64_t a2)
{
  return Float.bind(to:at:)(a1, a2, *v2);
}

uint64_t Double.bind(to:at:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_double((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000015;
  *(void *)(v6 + 16) = 0x8000000259FA2FD0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F84788(uint64_t a1, uint64_t a2)
{
  return Double.bind(to:at:)(a1, a2, *v2);
}

void *String.bind(to:at:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v5 = a1[1];
  long long v10 = *a1;
  v11[0] = v5;
  *(_OWORD *)((char *)v11 + 9) = *(long long *)((char *)a1 + 25);
  long long v9[2] = &v10;
  v9[3] = a2;
  uint64_t result = sub_259F84994((uint64_t)sub_259F857C4, (uint64_t)v9, a3, a4);
  if (!v4)
  {
    if (result)
    {
      uint64_t v7 = result;
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v8 = v7;
      *(void *)(v8 + 8) = 0xD000000000000015;
      *(void *)(v8 + 16) = 0x8000000259FA2FF0;
      *(unsigned char *)(v8 + 24) = 0;
      return (void *)swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_259F8485C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 16);
  if (v5 && *(void *)(v5 + 16))
  {
    uint64_t v7 = *(sqlite3_stmt **)(*(void *)a2 + 24);
    if (v7)
    {
      if (a3 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (a3 <= 0x7FFFFFFF)
      {
        if (qword_26A401710 == -1)
        {
LABEL_7:
          uint64_t result = sqlite3_bind_text(v7, a3, a1, -1, (void (__cdecl *)(void *))qword_26A401C58);
          *a4 = result;
          return result;
        }
LABEL_13:
        int v12 = a3;
        uint64_t v13 = v7;
        uint64_t v11 = a1;
        swift_once();
        LODWORD(a3) = v12;
        uint64_t v7 = v13;
        a1 = v11;
        goto LABEL_7;
      }
      __break(1u);
      goto LABEL_13;
    }
    sub_259F7C520();
    swift_allocError();
    uint64_t v10 = 3;
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v10 = 4;
  }
  *(void *)uint64_t v9 = v10;
  *(void *)(v9 + 8) = 0;
  *(void *)(v9 + 16) = 0;
  *(unsigned char *)(v9 + 24) = 5;
  return swift_willThrow();
}

void *sub_259F84994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *(*v7)(uint64_t *__return_ptr, void *);
  uint64_t v8;
  uint64_t v9;
  void *result;
  void v11[2];
  uint64_t v12;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    uint64_t result = (void *)sub_259FA2280();
    if (!v4) {
      return (void *)HIDWORD(v12);
    }
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((v6 & 0x2000000000000000) != 0)
    {
      v11[0] = v5;
      v11[1] = v6 & 0xFFFFFFFFFFFFFFLL;
      uint64_t result = v7(&v12, v11);
      if (!v4) {
        return (void *)v12;
      }
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v9 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = sub_259FA22C0();
      }
      return sub_259F857E0(v8, v9, (void *(*)(uint64_t *__return_ptr))sub_259F85A10);
    }
  }
  return result;
}

uint64_t sub_259F84AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *(*v7)(uint64_t *__return_ptr, void *);
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  void v12[2];
  uint64_t v13;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    uint64_t v10 = sub_259FA2280();
    if (!v4) {
      uint64_t v10 = BYTE1(v13);
    }
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((v6 & 0x2000000000000000) != 0)
    {
      v12[0] = v5;
      v12[1] = v6 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v10 = v7(&v13, v12);
      if (!v4) {
        uint64_t v10 = v13;
      }
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v9 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = sub_259FA22C0();
      }
      uint64_t v10 = sub_259F9FBE8(v8, v9, (void (*)(uint64_t *__return_ptr))sub_259F859F4);
    }
  }
  return v10 & 1;
}

void *sub_259F84BC0(long long *a1, uint64_t a2)
{
  return String.bind(to:at:)(a1, a2, *v2, v2[1]);
}

uint64_t Data.bind(to:at:)(long long *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v4 = a1[1];
  long long v13 = *a1;
  v14[0] = v4;
  *(_OWORD *)((char *)v14 + 9) = *(long long *)((char *)a1 + 25);
  switch(a4 >> 62)
  {
    case 1uLL:
      if (a3 >> 32 < (int)a3) {
        __break(1u);
      }
      sub_259F8591C(a3, a4);
      sub_259F7FF98((uint64_t)&v13);
      sub_259F8591C(a3, a4);
      sub_259F7FF98((uint64_t)&v13);
      sub_259F8583C((int)a3, a3 >> 32, a4 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)&v13, a2, a3, a4);
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(a3 + 16);
      uint64_t v10 = *(void *)(a3 + 24);
      sub_259F8591C(a3, a4);
      sub_259F7FF98((uint64_t)&v13);
      sub_259F8591C(a3, a4);
      sub_259F7FF98((uint64_t)&v13);
      swift_retain();
      swift_retain();
      sub_259F8583C(v9, v10, a4 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)&v13, a2, a3, a4);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(v12, 0, 14);
      sub_259F7FF98((uint64_t)&v13);
      uint64_t v8 = (char *)v12;
      goto LABEL_7;
    default:
      v12[0] = a3;
      LOWORD(v12[1]) = a4;
      BYTE2(v12[1]) = BYTE2(a4);
      BYTE3(v12[1]) = BYTE3(a4);
      BYTE4(v12[1]) = BYTE4(a4);
      BYTE5(v12[1]) = BYTE5(a4);
      sub_259F7FF98((uint64_t)&v13);
      uint64_t v8 = (char *)v12 + BYTE6(a4);
LABEL_7:
      sub_259F84E64(v12, (int)v8, (uint64_t)&v13, a2, a3, a4);
      sub_259F85974(a3, a4);
      break;
  }
  sub_259F80944((uint64_t)&v13);
  return sub_259F85974(a3, a4);
}

uint64_t sub_259F84E64(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6 = *(void *)(*(void *)a3 + 16);
  if (!v6 || !*(void *)(v6 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v11 = 4;
LABEL_9:
    *(void *)(v10 + 8) = 0;
    *(void *)(v10 + 16) = 0;
    *(void *)uint64_t v10 = v11;
    *(unsigned char *)(v10 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t v8 = *(sqlite3_stmt **)(*(void *)a3 + 24);
  if (!v8)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v11 = 3;
    goto LABEL_9;
  }
  LODWORD(v9) = 0x80000000;
  if (a4 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else
  {
    LODWORD(v9) = 0x7FFFFFFF;
    if (a4 <= 0x7FFFFFFF)
    {
      LODWORD(v9) = 0;
      switch(a6 >> 62)
      {
        case 1uLL:
          LODWORD(v9) = HIDWORD(a5) - a5;
          if (!__OFSUB__(HIDWORD(a5), a5)) {
            goto LABEL_19;
          }
          __break(1u);
          goto LABEL_16;
        case 2uLL:
LABEL_16:
          uint64_t v14 = *(void *)(a5 + 16);
          uint64_t v13 = *(void *)(a5 + 24);
          BOOL v15 = __OFSUB__(v13, v14);
          uint64_t v9 = v13 - v14;
          if (v15)
          {
            __break(1u);
            JUMPOUT(0x259F85050);
          }
          if (v9 < (uint64_t)0xFFFFFFFF80000000) {
            goto LABEL_24;
          }
          if (v9 > 0x7FFFFFFF) {
            goto LABEL_25;
          }
LABEL_19:
          if (qword_26A401710 == -1) {
            goto LABEL_20;
          }
          goto LABEL_26;
        case 3uLL:
          goto LABEL_19;
        default:
          LODWORD(v9) = BYTE6(a6);
          goto LABEL_19;
      }
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  int v20 = a4;
  uint64_t v21 = v8;
  char v18 = a1;
  int v19 = v9;
  swift_once();
  a1 = v18;
  LODWORD(v9) = v19;
  LODWORD(a4) = v20;
  uint64_t v8 = v21;
LABEL_20:
  uint64_t result = sqlite3_bind_blob(v8, a4, a1, v9, (void (__cdecl *)(void *))qword_26A401C58);
  if (result)
  {
    uint64_t v16 = result;
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v17 = v16;
    *(void *)(v17 + 8) = 0xD000000000000013;
    *(void *)(v17 + 16) = 0x8000000259FA3010;
    *(unsigned char *)(v17 + 24) = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_259F85060(long long *a1, uint64_t a2)
{
  return Data.bind(to:at:)(a1, a2, *(void *)v2, *(void *)(v2 + 8));
}

uint64_t Array<A>.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a5;
  uint64_t v27 = a2;
  uint64_t v7 = *(void *)(a4 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)v8;
  uint64_t v25 = *(void *)(v8 + 8);
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v8 + 16);
  uint64_t v23 = *(void *)(v8 + 24);
  uint64_t v24 = v12;
  uint64_t v22 = *(void *)(v8 + 32);
  int v21 = *(unsigned __int8 *)(v8 + 40);
  uint64_t result = MEMORY[0x25A2F0DA0](v13, v14);
  if (result < 0)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v16 = result;
  if (result)
  {
    uint64_t v17 = 0;
    char v18 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(v30 + 8);
    int v19 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
    while (v16 != v17)
    {
      uint64_t result = sub_259FA2130();
      v28[0] = v26;
      v28[1] = v25;
      v28[2] = v24;
      v28[3] = v23;
      v28[4] = v22;
      char v29 = v21;
      if (__OFADD__(v17, v27)) {
        goto LABEL_10;
      }
      v18(v28, v17 + v27, a4, v30);
      uint64_t result = (*v19)(v10, a4);
      if (!v5 && v16 != ++v17) {
        continue;
      }
      return result;
    }
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_259F85238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Array<A>.bind(to:at:)(a1, a2, *v4, *(void *)(a3 + 16), *(void *)(a4 - 8));
}

void *Array<A>.bind(to:at:)(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = a2;
  uint64_t v4 = *(void *)(a3 + 16);
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v15 = result[1];
    uint64_t v16 = *result;
    uint64_t v6 = result[4];
    uint64_t v13 = result[3];
    uint64_t v14 = result[2];
    uint64_t v7 = (void *)(a3 + 32);
    uint64_t v8 = v4 - 1;
    char v9 = *((unsigned char *)result + 40);
    while (1)
    {
      uint64_t v10 = v7[3];
      uint64_t v11 = v7[4];
      uint64_t result = __swift_project_boxed_opaque_existential_1(v7, v10);
      v17[0] = v16;
      v17[1] = v15;
      _OWORD v17[2] = v14;
      v17[3] = v13;
      v17[4] = v6;
      char v18 = v9;
      if (__OFADD__(v5, v19)) {
        break;
      }
      uint64_t result = (void *)(*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v11 + 8))(v17, v5 + v19, v10, v11);
      if (!v3)
      {
        v7 += 5;
        if (v8 != v5++) {
          continue;
        }
      }
      return result;
    }
    __break(1u);
  }
  return result;
}

sqlite3_stmt *Optional<A>.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a4;
  uint64_t v30 = a2;
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = &v25[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v9 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v6);
  uint64_t v14 = &v25[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = *(void *)v12;
  uint64_t v16 = *(void *)(v12 + 8);
  uint64_t v18 = *(void *)(v12 + 16);
  uint64_t v17 = *(void *)(v12 + 24);
  uint64_t v27 = *(void *)(v12 + 32);
  uint64_t v28 = v17;
  int v26 = *(unsigned __int8 *)(v12 + 40);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 16))(v8, v19);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32))(v14, v8, v10);
    v31[0] = v15;
    v31[1] = v16;
    v31[2] = v18;
    v31[3] = v28;
    v31[4] = v27;
    char v32 = v26;
    (*(void (**)(void *, uint64_t, uint64_t))(v29 + 8))(v31, v30, v10);
    return (sqlite3_stmt *)(*(uint64_t (**)(unsigned char *, uint64_t))(v11 + 8))(v14, v10);
  }
  uint64_t v20 = v30;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, a3);
  uint64_t v21 = *(void *)(v15 + 16);
  if (!v21 || !*(void *)(v21 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v24 = 4;
LABEL_10:
    *(void *)uint64_t v23 = v24;
    *(void *)(v23 + 8) = 0;
    *(void *)(v23 + 16) = 0;
    *(unsigned char *)(v23 + 24) = 5;
    return (sqlite3_stmt *)swift_willThrow();
  }
  uint64_t result = *(sqlite3_stmt **)(v15 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v24 = 3;
    goto LABEL_10;
  }
  if (v20 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v20 <= 0x7FFFFFFF)
  {
    return (sqlite3_stmt *)sqlite3_bind_null(result, v20);
  }
  __break(1u);
  return result;
}

sqlite3_stmt *sub_259F85640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Optional<A>.bind(to:at:)(a1, a2, a3, *(void *)(a4 - 8));
}

uint64_t RawRepresentable<>.bind(to:at:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v14 - v9;
  long long v11 = *a1;
  long long v14 = a1[1];
  long long v15 = v11;
  uint64_t v12 = *((void *)a1 + 4);
  LOBYTE(a1) = *((unsigned char *)a1 + 40);
  sub_259FA20C0();
  v17[0] = v15;
  v17[1] = v14;
  uint64_t v18 = v12;
  char v19 = (char)a1;
  (*(void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(a5 + 8))(v17, v16, AssociatedTypeWitness, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
}

uint64_t sub_259F857C4@<X0>(char *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_259F8485C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

void *sub_259F857E0(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    uint64_t result = a3(&v5);
    if (!v3) {
      return (void *)v5;
    }
  }
  else
  {
    uint64_t result = ((void *(*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&v5 + 4), 0, 0);
    if (!v3) {
      return (void *)HIDWORD(v5);
    }
  }
  return result;
}

uint64_t sub_259F8583C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t result = sub_259FA1E80();
  long long v14 = (char *)result;
  if (result)
  {
    uint64_t result = sub_259FA1EA0();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v14 += a1 - result;
  }
  BOOL v15 = __OFSUB__(a2, a1);
  uint64_t v16 = a2 - a1;
  if (v15)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v17 = sub_259FA1E90();
  if (v17 >= v16) {
    int v18 = v16;
  }
  else {
    int v18 = v17;
  }
  int v19 = v14 + v18;
  if (v14) {
    int v20 = v19;
  }
  else {
    int v20 = 0;
  }
  sub_259F84E64(v14, v20, a4, a5, a6, a7);
  sub_259F80944(a4);
  return sub_259F85974(a6, a7);
}

uint64_t sub_259F8591C(uint64_t a1, unint64_t a2)
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

uint64_t sub_259F85974(uint64_t a1, unint64_t a2)
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

uint64_t dispatch thunk of SQLiteBindable.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

void *sub_259F859F4@<X0>(unsigned char *a1@<X8>)
{
  return sub_259F9FC48(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

void *sub_259F85A10@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t Bool.init(with:column:)(uint64_t a1, uint64_t a2)
{
  return sub_259F85EB0(a1, a2) & 1;
}

uint64_t sub_259F85A70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259F85EB0(a1, a2);
  if (!v3) {
    *a3 = result & 1;
  }
  return result;
}

void Float.init(with:column:)(uint64_t a1, uint64_t a2)
{
}

void sub_259F85AB8(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  sub_259F8609C(a1, a2);
  if (!v3) {
    *a3 = v5;
  }
}

void Double.init(with:column:)(uint64_t a1, uint64_t a2)
{
}

void sub_259F85AFC(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_259F85FAC(a1, a2);
  if (!v3) {
    *a3 = v5;
  }
}

uint64_t RawRepresentable<>.init(with:column:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v28 = a6;
  uint64_t v11 = sub_259FA21E0();
  uint64_t v27 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v29 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  int v19 = (char *)&v27 - v18;
  uint64_t v31 = *a1;
  uint64_t v20 = v33;
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a5 + 16))(&v31, a2, AssociatedTypeWitness, a5);
  if (!v20)
  {
    uint64_t v22 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v17, v19, AssociatedTypeWitness);
    sub_259FA20D0();
    uint64_t v23 = *(void *)(a3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v13, 1, a3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v11);
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
      sub_259FA2290();
      sub_259FA2000();
      sub_259FA24B0();
      sub_259FA2000();
      swift_bridgeObjectRelease();
      sub_259FA2000();
      sub_259FA23E0();
      uint64_t v24 = v31;
      unint64_t v25 = v32;
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v26 = v24;
      *(void *)(v26 + 8) = v25;
      *(void *)(v26 + 16) = 0;
      *(unsigned char *)(v26 + 24) = 4;
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v19, AssociatedTypeWitness);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v19, AssociatedTypeWitness);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v28, v13, a3);
    }
  }
  return result;
}

{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;

  v40 = a2;
  char v37 = a6;
  uint64_t v10 = sub_259FA21E0();
  char v34 = *(void *)(v10 - 8);
  char v35 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v36 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  long long v14 = sub_259FA21E0();
  uint64_t v38 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v33 - v16;
  uint64_t v39 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v33 - v21;
  uint64_t v41 = *a1;
  uint64_t v23 = v43;
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a5 + 16))(&v41, v40, AssociatedTypeWitness, a5);
  if (!v23)
  {
    unint64_t v25 = v38;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v17, 1, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v14);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v37, 1, 1, a3);
    }
    else
    {
      uint64_t v26 = v39;
      uint64_t v27 = v22;
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v22, v17, AssociatedTypeWitness);
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v20, v22, AssociatedTypeWitness);
      sub_259FA20D0();
      uint64_t v28 = *(void *)(a3 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v12, 1, a3) == 1)
      {
        (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v35);
        uint64_t v41 = 0;
        uint64_t v42 = 0xE000000000000000;
        sub_259FA2290();
        sub_259FA2000();
        sub_259FA24B0();
        sub_259FA2000();
        swift_bridgeObjectRelease();
        sub_259FA2000();
        sub_259FA23E0();
        uint64_t v29 = v41;
        uint64_t v30 = v42;
        sub_259F7C520();
        swift_allocError();
        *(void *)uint64_t v31 = v29;
        *(void *)(v31 + 8) = v30;
        *(void *)(v31 + 16) = 0;
        *(unsigned char *)(v31 + 24) = 4;
        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v27, AssociatedTypeWitness);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v39 + 8))(v22, AssociatedTypeWitness);
        unint64_t v32 = v37;
        (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v37, v12, a3);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v32, 0, 1, a3);
      }
    }
  }
  return result;
}

uint64_t sub_259F85EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_8:
    *(void *)uint64_t v7 = v8;
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(unsigned char *)(v7 + 24) = 5;
    swift_willThrow();
    swift_release();
    return v6;
  }
  uint64_t v3 = *(sqlite3_stmt **)(*(void *)a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_8;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    return sqlite3_column_int(v3, a2) != 0;
  }
  __break(1u);
  return result;
}

void sub_259F85FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v6 = 4;
LABEL_8:
    *(void *)uint64_t v5 = v6;
    *(void *)(v5 + 8) = 0;
    *(void *)(v5 + 16) = 0;
    *(unsigned char *)(v5 + 24) = 5;
    swift_willThrow();
    swift_release();
    return;
  }
  uint64_t v3 = *(sqlite3_stmt **)(*(void *)a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v6 = 3;
    goto LABEL_8;
  }
  swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    sqlite3_column_double(v3, a2);
    return;
  }
  __break(1u);
}

void sub_259F8609C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v6 = 4;
LABEL_8:
    *(void *)uint64_t v5 = v6;
    *(void *)(v5 + 8) = 0;
    *(void *)(v5 + 16) = 0;
    *(unsigned char *)(v5 + 24) = 5;
    swift_willThrow();
    swift_release();
    return;
  }
  uint64_t v3 = *(sqlite3_stmt **)(*(void *)a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v6 = 3;
    goto LABEL_8;
  }
  swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    sqlite3_column_double(v3, a2);
    return;
  }
  __break(1u);
}

uint64_t dispatch thunk of SQLiteSafeType.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_259F861B8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 24) = v3;
  *(void *)(v4 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259F86218()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SQLiteScalarUDF.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_weakInit();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  return v0;
}

uint64_t SQLiteScalarUDF.init()()
{
  swift_weakInit();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  return v0;
}

uint64_t sub_259F862D0()
{
  return 0;
}

uint64_t sub_259F862D8()
{
  return 1;
}

uint64_t sub_259F862E0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_259F86308(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(sqlite3 **)(a3 + 16);
  if (v4)
  {
    uint64_t v6 = result;
    swift_beginAccess();
    v3[3] = v6;
    v3[4] = a2;
    swift_bridgeObjectRetain();
    uint64_t v7 = swift_bridgeObjectRelease();
    int v8 = (*(uint64_t (**)(uint64_t))(*v3 + 152))(v7);
    int v9 = (*(uint64_t (**)(void))(*v3 + 160))();
    uint64_t v10 = (const char *)(sub_259FA1FB0() + 32);
    swift_retain();
    function_uint64_t v2 = sqlite3_create_function_v2(v4, v10, v8, v9, v3, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_259F866C4, 0, 0, (void (__cdecl *)(void *))sub_259F867D4);
    uint64_t result = swift_release();
    if (function_v2)
    {
      sub_259FA2290();
      swift_bridgeObjectRelease();
      sub_259FA23C0();
      sub_259FA2000();
      swift_bridgeObjectRelease();
      unint64_t v12 = sub_259F8C37C(0xD00000000000001DLL, 0x8000000259FA3070);
      uint64_t v14 = v13;
      swift_bridgeObjectRelease();
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v15 = function_v2;
      *(void *)(v15 + 8) = v12;
      *(void *)(v15 + 16) = v14;
      *(unsigned char *)(v15 + 24) = 0;
      return swift_willThrow();
    }
  }
  return result;
}

void sub_259F86508(sqlite3_context *a1)
{
  if (a1)
  {
    if (sqlite3_user_data(a1))
    {
      uint64_t v2 = swift_retain();
      uint64_t v3 = MEMORY[0x270FA5388](v2);
      (*(void (**)(uint64_t (*)()))(*(void *)v3 + 176))(sub_259F8712C);
      swift_release();
    }
    else
    {
      sqlite3_result_error(a1, "Cannot bind to function instance.", -1);
    }
  }
}

uint64_t sub_259F86640(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = a2;
  uint64_t result = Array<A>.init(_:argc:)(a3, a4);
  if (!v4)
  {
    (*(void (**)(uint64_t *, uint64_t))(*(void *)a1 + 168))(&v7, result);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_259F866C8(uint64_t a1)
{
  if (a1)
  {
    swift_release();
  }
  else
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_259FA1F20();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A401C90);
    oslog = sub_259FA1F00();
    os_log_type_t v2 = sub_259FA21D0();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_259F7A000, oslog, v2, "Missing function object", v3, 2u);
      MEMORY[0x25A2F1860](v3, -1, -1);
    }
  }
}

uint64_t sub_259F867D8(uint64_t result)
{
  os_log_type_t v2 = *(sqlite3 **)(result + 16);
  if (v2)
  {
    uint64_t result = swift_beginAccess();
    if (v1[4])
    {
      uint64_t v3 = *(uint64_t (**)(uint64_t))(*v1 + 152);
      uint64_t v4 = swift_bridgeObjectRetain();
      int v5 = v3(v4);
      int v6 = (*(uint64_t (**)(void))(*v1 + 160))();
      uint64_t v7 = sub_259FA1FB0();
      swift_bridgeObjectRelease();
      unsigned int function = sqlite3_create_function(v2, (const char *)(v7 + 32), v5, v6, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))nullsub_2, 0, 0);
      uint64_t result = swift_release();
      if (function)
      {
        sub_259FA2290();
        swift_bridgeObjectRelease();
        sub_259FA23C0();
        sub_259FA2000();
        swift_bridgeObjectRelease();
        unint64_t v9 = sub_259F8C37C(0xD000000000000020, 0x8000000259FA3090);
        uint64_t v11 = v10;
        swift_bridgeObjectRelease();
        sub_259F7C520();
        swift_allocError();
        *(void *)uint64_t v12 = function;
        *(void *)(v12 + 8) = v9;
        *(void *)(v12 + 16) = v11;
        *(unsigned char *)(v12 + 24) = 0;
        return swift_willThrow();
      }
    }
  }
  return result;
}

uint64_t SQLiteScalarUDF.deinit()
{
  uint64_t v1 = v0;
  swift_beginAccess();
  unint64_t v2 = *(void *)(v0 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 24);
    uint64_t v4 = qword_26A401728;
    swift_bridgeObjectRetain();
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_259FA1F20();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A401C90);
    swift_bridgeObjectRetain();
    int v6 = sub_259FA1F00();
    os_log_type_t v7 = sub_259FA21B0();
    if (!os_log_type_enabled(v6, v7))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_13;
    }
    int v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = v9;
    *(_DWORD *)int v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_259F90F1C(v3, v2, &v15);
    sub_259FA21F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259F7A000, v6, v7, "Destroying %s function", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2F1860](v9, -1, -1);
    uint64_t v10 = v8;
  }
  else
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_259FA1F20();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A401C90);
    int v6 = sub_259FA1F00();
    os_log_type_t v12 = sub_259FA21B0();
    if (!os_log_type_enabled(v6, v12)) {
      goto LABEL_11;
    }
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_259F7A000, v6, v12, "Destroying unregistered function", v13, 2u);
    uint64_t v10 = v13;
  }
  MEMORY[0x25A2F1860](v10, -1, -1);
LABEL_11:

LABEL_13:
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t SQLiteScalarUDF.__deallocating_deinit()
{
  SQLiteScalarUDF.deinit();

  return swift_deallocClassInstance();
}

void sub_259F86C7C()
{
  uint64_t v1 = v0;
  if (qword_26A401728 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259FA1F20();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A401C90);
  swift_retain_n();
  uint64_t v3 = sub_259FA1F00();
  os_log_type_t v4 = sub_259FA21B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136315650;
    swift_beginAccess();
    if (*(void *)(v1 + 32))
    {
      uint64_t v7 = *(void *)(v1 + 24);
      unint64_t v8 = *(void *)(v1 + 32);
    }
    else
    {
      unint64_t v8 = 0xE90000000000003ELL;
      uint64_t v7 = 0x6E776F6E6B6E753CLL;
    }
    swift_bridgeObjectRetain();
    sub_259F90F1C(v7, v8, &v11);
    sub_259FA21F0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2048;
    sub_259FA21F0();
    *(_WORD *)(v5 + 22) = 2080;
    uint64_t v9 = sub_259FA1F90();
    sub_259F90F1C(v9, v10, &v11);
    sub_259FA21F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259F7A000, v3, v4, "Function %s received %ld parameter: %s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25A2F1860](v6, -1, -1);
    MEMORY[0x25A2F1860](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_259F86EE4()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t sub_259F86F1C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  *a2 = *(void *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for SQLiteScalarUDF()
{
  return self;
}

uint64_t method lookup function for SQLiteScalarUDF(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SQLiteScalarUDF);
}

uint64_t dispatch thunk of SQLiteScalarUDF.name.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.parametersCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.options.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.perform(with:arguments:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.hookPerform(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.register(_:database:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.unregister(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.receivedParameter(_:index:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t sub_259F8712C()
{
  return sub_259F86640(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(_DWORD *)(v0 + 40));
}

uint64_t sub_259F87150(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)sqlite3_malloc(16);
  uint64_t v3 = v2;
  if (v2)
  {
    *(void *)&long long v6 = 0;
    *((void *)&v6 + 1) = a1;
    if (&v6 < (long long *)v2 + 1 && v2 < &v7)
    {
      uint64_t result = sub_259FA23A0();
      __break(1u);
      return result;
    }
    *(_OWORD *)uint64_t v2 = v6;
    swift_retain();
  }
  return (uint64_t)v3;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.ensureValidSQLNameCharacters()()
{
  uint64_t v2 = (*(uint64_t (**)(void))(v0 + 16))();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 32;
    do
    {
      sub_259F800A0(v4, (uint64_t)v7);
      uint64_t v6 = v8;
      uint64_t v5 = v9;
      __swift_project_boxed_opaque_existential_1(v7, v8);
      (*(void (**)(uint64_t))(*(void *)(v5 + 8) + 8))(v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
      if (v1) {
        break;
      }
      v4 += 40;
      --v3;
    }
    while (v3);
  }
  swift_bridgeObjectRelease();
}

uint64_t SQLiteSchema.columns.getter()
{
  return sub_259F87330();
}

uint64_t sub_259F87300()
{
  return sub_259F87330();
}

void sub_259F87310()
{
}

uint64_t sub_259F87330()
{
  sub_259FA22B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A401A78);
  uint64_t v0 = sub_259FA2320();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t dispatch thunk of SQLiteSchemaDescribing.columns.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_259F873A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata accessor for SQLiteSchema()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259F873CC(uint64_t a1, uint64_t a2)
{
  return _s12PoirotSQLite0B5ErrorO2eeoiySbAC_ACtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned char *)(a2 + 24));
}

uint64_t _s12PoirotSQLite0B5ErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  switch(a4)
  {
    case 1:
      if (a8 != 1) {
        goto LABEL_93;
      }
      if (a1 != a5 || a2 != a6) {
        goto LABEL_30;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a8 != 2) {
        goto LABEL_93;
      }
      if (a1 != a5 || a2 != a6) {
        goto LABEL_30;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a8 != 3) {
        goto LABEL_93;
      }
      if (a1 != a5 || a2 != a6) {
        goto LABEL_30;
      }
      uint64_t result = 1;
      break;
    case 4:
      if (a8 != 4) {
        goto LABEL_93;
      }
      if (a1 != a5 || a2 != a6) {
        goto LABEL_30;
      }
      uint64_t result = 1;
      break;
    case 5:
      uint64_t v9 = a3 | a2;
      if (a3 | a2 | a1)
      {
        if (a1 != 1 || v9)
        {
          if (a1 != 2 || v9)
          {
            if (a1 != 3 || v9)
            {
              if (a1 != 4 || v9)
              {
                if (a1 != 5 || v9)
                {
                  if (a1 != 6 || v9)
                  {
                    if (a1 != 7 || v9)
                    {
                      if (a1 != 8 || v9)
                      {
                        if (a1 != 9 || v9)
                        {
                          if (a1 != 10 || v9)
                          {
                            if (a8 != 5 || a5 != 11 || a7 | a6) {
                              goto LABEL_93;
                            }
                            uint64_t result = 1;
                          }
                          else
                          {
                            if (a8 != 5 || a5 != 10 || a7 | a6) {
                              goto LABEL_93;
                            }
                            uint64_t result = 1;
                          }
                        }
                        else
                        {
                          if (a8 != 5 || a5 != 9 || a7 | a6) {
                            goto LABEL_93;
                          }
                          uint64_t result = 1;
                        }
                      }
                      else
                      {
                        if (a8 != 5 || a5 != 8 || a7 | a6) {
                          goto LABEL_93;
                        }
                        uint64_t result = 1;
                      }
                    }
                    else
                    {
                      if (a8 != 5 || a5 != 7 || a7 | a6) {
                        goto LABEL_93;
                      }
                      uint64_t result = 1;
                    }
                  }
                  else
                  {
                    if (a8 != 5 || a5 != 6 || a7 | a6) {
                      goto LABEL_93;
                    }
                    uint64_t result = 1;
                  }
                }
                else
                {
                  if (a8 != 5 || a5 != 5 || a7 | a6) {
                    goto LABEL_93;
                  }
                  uint64_t result = 1;
                }
              }
              else
              {
                if (a8 != 5 || a5 != 4 || a7 | a6) {
                  goto LABEL_93;
                }
                uint64_t result = 1;
              }
            }
            else
            {
              if (a8 != 5 || a5 != 3 || a7 | a6) {
                goto LABEL_93;
              }
              uint64_t result = 1;
            }
          }
          else
          {
            if (a8 != 5 || a5 != 2 || a7 | a6) {
              goto LABEL_93;
            }
            uint64_t result = 1;
          }
        }
        else
        {
          if (a8 != 5 || a5 != 1 || a7 | a6) {
            goto LABEL_93;
          }
          uint64_t result = 1;
        }
      }
      else
      {
        if (a8 != 5 || a7 | a6 | a5) {
          goto LABEL_93;
        }
        uint64_t result = 1;
      }
      break;
    default:
      if (a8 || a1 != a5)
      {
LABEL_93:
        uint64_t result = 0;
      }
      else if (a2 == a6 && a3 == a7)
      {
        uint64_t result = 1;
      }
      else
      {
LABEL_30:
        uint64_t result = sub_259FA2400();
      }
      break;
  }
  return result;
}

uint64_t sub_259F87744(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for SQLiteError(uint64_t a1)
{
  return sub_259F877AC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_259F877AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_259F87744(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_259F87744(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_259F877AC(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_259F877AC(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_259F879C4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 4u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_259F879DC(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 5;
  if (a2 >= 5)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 5;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

uint64_t sub_259F87A08(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a5;
  uint64_t v30 = a8;
  uint64_t v10 = v9;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v28 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  v40 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v26 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v33 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v31 = *(void *)(v17 - 8);
  uint64_t v32 = v17;
  MEMORY[0x270FA5388](v17);
  int v19 = (char *)&v26 - v18;
  uint64_t v34 = v8;
  uint64_t v20 = sub_259FA2150();
  if (!v20) {
    return sub_259FA20E0();
  }
  uint64_t v21 = v20;
  uint64_t v27 = v15;
  uint64_t v43 = sub_259FA2300();
  uint64_t v35 = sub_259FA2310();
  sub_259FA22E0();
  uint64_t v41 = v19;
  uint64_t result = sub_259FA2140();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v23 = (void (**)(char *))(v36 + 2);
    ++v36;
    char v37 = v23;
    uint64_t v24 = v27;
    while (1)
    {
      unint64_t v25 = (void (*)(char *, void))sub_259FA2190();
      (*v37)(v24);
      v25(v42, 0);
      v38(v24, v40);
      if (v10) {
        break;
      }
      uint64_t v10 = 0;
      (*v36)(v24, AssociatedTypeWitness);
      sub_259FA22F0();
      sub_259FA2160();
      if (!--v21)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
        return v43;
      }
    }
    (*v36)(v24, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v32);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v28 + 32))(v30, v40, v29);
  }
  return result;
}

void SQLiteStatement.nextRowValue<A>()(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v8 = *((void *)v3 + 2);
  char v9 = *((unsigned char *)v3 + 40);
  long long v10 = *v3;
  uint64_t v11 = v8;
  long long v12 = *(long long *)((char *)v3 + 24);
  char v13 = v9;
  SQLiteStatement.nextRow()(&v14);
  if (!v4)
  {
    if (v14)
    {
      *(void *)&long long v10 = v14;
      (*(void (**)(long long *, uint64_t, uint64_t))(a2 + 8))(&v10, a1, a2);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a3, 0, 1, a1);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a3, 1, 1, a1);
    }
  }
}

uint64_t SQLiteStatement.singleRowIfAny<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
  v10[0] = v5;
  v10[1] = v6;
  _OWORD v10[2] = v7;
  long long v11 = xmmword_259FA4160;
  char v12 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_259F904E0(v10, (void (*)(uint64_t *))sub_259F88D84);
  swift_bridgeObjectRelease();
  if (!v3) {
    return swift_release();
  }
  swift_release();
  uint64_t v8 = sub_259FA21E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a2, v8);
}

{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10[3];
  long long v11;
  char v12;

  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
  v10[0] = v5;
  v10[1] = v6;
  _OWORD v10[2] = v7;
  long long v11 = xmmword_259FA4160;
  char v12 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_259F904E0(v10, (void (*)(uint64_t *))sub_259F88DA4);
  swift_bridgeObjectRelease();
  if (!v3) {
    return swift_release();
  }
  swift_release();
  uint64_t v8 = sub_259FA21E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a2, v8);
}

uint64_t sub_259F88064(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_259FA21E0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v15 - v11;
  uint64_t v16 = *a1;
  char v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  swift_retain();
  uint64_t result = v13(&v16, a3, a4);
  if (!v4)
  {
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v12, 0, 1, a3);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 40))(a2, v12, v9);
  }
  return result;
}

uint64_t sub_259F8830C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_259FA21E0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v15 - v11;
  uint64_t v16 = *a1;
  char v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  swift_retain();
  uint64_t result = v13(&v16, a3, a4);
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 40))(a2, v12, v9);
  }
  return result;
}

uint64_t SQLiteStatement.singleRow<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F8848C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))SQLiteStatement.singleRowIfAny<A>(), a3);
}

{
  return sub_259F8848C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))SQLiteStatement.singleRowIfAny<A>(), a3);
}

uint64_t sub_259F8848C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = a4;
  uint64_t v9 = sub_259FA21E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  char v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v16 = *((void *)v4 + 2);
  char v17 = *((unsigned char *)v4 + 40);
  long long v24 = *v4;
  uint64_t v25 = v16;
  long long v26 = *(long long *)((char *)v4 + 24);
  char v27 = v17;
  uint64_t result = a3(a1, a2);
  if (!v5)
  {
    uint64_t v19 = v28;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    uint64_t v20 = *(void *)(a1 - 8);
    int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v13, 1, a1);
    uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
    if (v21 == 1)
    {
      v22(v13, v9);
      sub_259F7C520();
      swift_allocError();
      *(void *)(v23 + 8) = 0;
      *(void *)(v23 + 16) = 0;
      *(void *)uint64_t v23 = 5;
      *(unsigned char *)(v23 + 24) = 5;
      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v22)(v15, v9);
    }
    else
    {
      v22(v15, v9);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v19, v13, a1);
    }
  }
  return result;
}

uint64_t SQLiteStatement.rows<A>()()
{
  return sub_259F88808();
}

uint64_t sub_259F88704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = *v7;
  uint64_t v9 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  uint64_t result = v9(&v11, a3, a4);
  if (!v4)
  {
    sub_259FA2120();
    return sub_259FA2110();
  }
  return result;
}

uint64_t SQLiteStatement.compactRows<A>()()
{
  return sub_259F88808();
}

uint64_t sub_259F88808()
{
  uint64_t v2 = *((void *)v0 + 2);
  char v3 = *((unsigned char *)v0 + 40);
  long long v7 = *v0;
  uint64_t v8 = v2;
  long long v9 = *(long long *)((char *)v0 + 24);
  char v10 = v3;
  uint64_t v6 = sub_259FA20E0();
  uint64_t v4 = sub_259FA2120();
  SQLiteStatement.reduce<A>(into:handleRow:)((uint64_t)&v6, v4, (uint64_t)&v11);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v1) {
    return v11;
  }
  return result;
}

uint64_t sub_259F888C8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  v21[1] = a1;
  uint64_t v7 = sub_259FA21E0();
  v21[0] = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  char v10 = (char *)v21 - v9;
  uint64_t v22 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  char v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v21 - v14;
  uint64_t v24 = *a2;
  uint64_t v16 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  swift_retain();
  uint64_t v17 = v23;
  uint64_t result = v16(&v24, a3, a4);
  if (!v17)
  {
    uint64_t v19 = v21[0];
    uint64_t v20 = v22;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v10, 1, a3) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v10, v7);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v15, v10, a3);
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v13, v15, a3);
      sub_259FA2120();
      sub_259FA2110();
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v15, a3);
    }
  }
  return result;
}

uint64_t Array<A>.init(with:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(*a1 + 16);
  if (!v5 || !*(void *)(v5 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 4;
LABEL_7:
    *(void *)uint64_t v13 = v14;
    *(void *)(v13 + 8) = 0;
    *(void *)(v13 + 16) = 0;
    *(unsigned char *)(v13 + 24) = 5;
    swift_willThrow();
    swift_release();
    return v3;
  }
  uint64_t v6 = *(sqlite3_stmt **)(v4 + 24);
  if (!v6)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v14 = 3;
    goto LABEL_7;
  }
  uint64_t result = sqlite3_column_count(v6);
  if ((result & 0x80000000) == 0)
  {
    v16[1] = 0;
    _OWORD v16[2] = result;
    MEMORY[0x270FA5388](result);
    v15[2] = a2;
    v15[3] = a3;
    v15[4] = v4;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401A80);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017D0);
    unint64_t v12 = sub_259F88E20();
    uint64_t v3 = sub_259F87A08((void (*)(char *, char *))sub_259F88DFC, (uint64_t)v15, v10, a2, v11, v12, MEMORY[0x263F8E4E0], (uint64_t)v16);
    swift_release();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_259F88CC8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *a1;
  uint64_t v12 = a2;
  uint64_t v10 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a4 + 16);
  swift_retain();
  uint64_t result = v10(&v12, v9, a3, a4);
  if (v5) {
    *a5 = v5;
  }
  return result;
}

uint64_t sub_259F88D50@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = Array<A>.init(with:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_259F88D84(uint64_t *a1)
{
  return sub_259F88064(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_259F88DA4(uint64_t *a1)
{
  return sub_259F8830C(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_259F88DC4(uint64_t a1, uint64_t a2)
{
  return sub_259F88704(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_259F88DE0(uint64_t a1, uint64_t *a2)
{
  return sub_259F888C8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_259F88DFC(uint64_t *a1, void *a2)
{
  return sub_259F88CC8(a1, v2[4], v2[2], v2[3], a2);
}

unint64_t sub_259F88E20()
{
  unint64_t result = qword_26A401A88;
  if (!qword_26A401A88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A401A80);
    sub_259F88E9C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401A88);
  }
  return result;
}

unint64_t sub_259F88E9C()
{
  unint64_t result = qword_26A401A90;
  if (!qword_26A401A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401A90);
  }
  return result;
}

uint64_t dispatch thunk of SQLiteCompoundSafeType.init(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SQLiteCompoundUnsafeType.init(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_259F88F40(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_259F8AA8C(0, v1, 0);
    uint64_t v2 = v14;
    uint64_t v4 = (void *)(a1 + 32);
    do
    {
      uint64_t v5 = v4[3];
      uint64_t v6 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 32))(v5, v6);
      uint64_t v9 = v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_259F8AA8C(0, *(void *)(v14 + 16) + 1, 1);
      }
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_259F8AA8C(v10 > 1, v11 + 1, 1);
      }
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.makeCreateStatementString(for:in:)(Swift::String a1, Swift::String_optional in)
{
  uint64_t v5 = v3;
  uint64_t v6 = v2;
  object = in.value._object;
  uint64_t countAndFlagsBits = in.value._countAndFlagsBits;
  uint64_t v8 = a1._object;
  uint64_t v9 = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_259F7DB70(v9, (unint64_t)v8);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v47 = v6;
  unint64_t v48 = (unint64_t)object;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_259F7DBB8(v9, (unint64_t)v8);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_6;
  }
  v51[0] = v10;
  v51[1] = v12;
  if (qword_26A401720 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_259FA1E60();
  __swift_project_value_buffer(v16, (uint64_t)qword_26A401C78);
  sub_259F7DC38();
  sub_259FA2210();
  char v18 = v17;
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_6;
  }
  v51[0] = v13;
  v51[1] = v15;
  sub_259FA2210();
  char v20 = v19;
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0) {
    goto LABEL_12;
  }
  v51[0] = v9;
  v51[1] = v8;
  if (qword_26A401718 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v16, (uint64_t)qword_26A401C60);
  sub_259FA2210();
  uint64_t v21 = v4;
  if ((v22 & 1) == 0) {
    goto LABEL_12;
  }
  if (v48)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_259F7DB70(countAndFlagsBits, v48);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    if (!v28) {
      goto LABEL_12;
    }
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_259F7DBB8(countAndFlagsBits, v48);
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    if (!v31 || (v51[0] = v26, v51[1] = v28, sub_259FA2210(), char v33 = v32, swift_bridgeObjectRelease(), (v33 & 1) == 0))
    {
LABEL_6:
      swift_bridgeObjectRelease();
LABEL_12:
      sub_259F7C520();
      swift_allocError();
      *(void *)(v23 + 8) = 0;
      *(void *)(v23 + 16) = 0;
      *(void *)uint64_t v23 = 10;
      *(unsigned char *)(v23 + 24) = 5;
      uint64_t v24 = swift_willThrow();
      goto LABEL_33;
    }
    v51[0] = v29;
    v51[1] = v31;
    sub_259FA2210();
    char v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v21 = v4;
    if ((v35 & 1) == 0) {
      goto LABEL_12;
    }
    v51[0] = countAndFlagsBits;
    v51[1] = v48;
    sub_259FA2210();
    if ((v36 & 1) == 0) {
      goto LABEL_12;
    }
    v51[0] = countAndFlagsBits;
    v51[1] = v48;
    swift_bridgeObjectRetain();
    sub_259FA2000();
  }
  sub_259FA2290();
  swift_bridgeObjectRelease();
  strcpy((char *)v51, "CREATE TABLE ");
  HIWORD(v51[1]) = -4864;
  sub_259FA2000();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  sub_259FA2000();
  uint64_t v53 = v51[0];
  long long v54 = (void *)v51[1];
  uint64_t v37 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v47);
  int64_t v38 = *(void *)(v37 + 16);
  if (v38)
  {
    uint64_t v55 = MEMORY[0x263F8EE78];
    sub_259F8AA8C(0, v38, 0);
    uint64_t v39 = v37 + 32;
    while (1)
    {
      sub_259F800A0(v39, (uint64_t)v51);
      sub_259F8A710(v51, &v50, v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      if (v21) {
        break;
      }
      uint64_t v41 = v52[0];
      uint64_t v40 = v52[1];
      uint64_t v42 = v55;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_259F8AA8C(0, *(void *)(v42 + 16) + 1, 1);
        uint64_t v42 = v55;
      }
      unint64_t v44 = *(void *)(v42 + 16);
      unint64_t v43 = *(void *)(v42 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_259F8AA8C(v43 > 1, v44 + 1, 1);
        uint64_t v42 = v55;
      }
      *(void *)(v42 + 16) = v44 + 1;
      uint64_t v45 = v42 + 16 * v44;
      *(void *)(v45 + 32) = v41;
      *(void *)(v45 + 40) = v40;
      v39 += 40;
      if (!--v38)
      {
        swift_bridgeObjectRelease();
        goto LABEL_32;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v24 = swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v42 = MEMORY[0x263F8EE78];
LABEL_32:
    v51[0] = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4019E0);
    sub_259F82098();
    sub_259FA1F30();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    uint64_t v24 = v53;
    uint64_t v25 = v54;
  }
LABEL_33:
  result._object = v25;
  result._uint64_t countAndFlagsBits = v24;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.makeSelectStatementString(for:in:)(Swift::String a1, Swift::String_optional in)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  object = in.value._object;
  uint64_t countAndFlagsBits = in.value._countAndFlagsBits;
  uint64_t v7 = a1._object;
  uint64_t v8 = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_259F7DB70(v8, (unint64_t)v7);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_33;
  }
  uint64_t v62 = v5;
  unint64_t v63 = (unint64_t)object;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_259F7DBB8(v8, (unint64_t)v7);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_32;
  }
  uint64_t v58 = v4;
  uint64_t v65 = v9;
  unint64_t v66 = v11;
  if (qword_26A401720 != -1) {
    swift_once();
  }
  uint64_t v60 = sub_259FA1E60();
  __swift_project_value_buffer(v60, (uint64_t)qword_26A401C78);
  sub_259F7DC38();
  sub_259FA2210();
  char v16 = v15;
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0) {
    goto LABEL_32;
  }
  uint64_t v65 = v12;
  unint64_t v66 = v14;
  sub_259FA2210();
  char v18 = v17;
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v65 = v8;
  unint64_t v66 = (unint64_t)v7;
  if (qword_26A401718 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v60, (uint64_t)qword_26A401C60);
  sub_259FA2210();
  if ((v19 & 1) == 0) {
    goto LABEL_33;
  }
  if (!v63) {
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_259F7DB70(countAndFlagsBits, v63);
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_33:
    sub_259F7C520();
    swift_allocError();
    *(void *)(v53 + 8) = 0;
    *(void *)(v53 + 16) = 0;
    *(void *)uint64_t v53 = 10;
    *(unsigned char *)(v53 + 24) = 5;
    uint64_t v54 = swift_willThrow();
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_259F7DBB8(countAndFlagsBits, v63);
  unint64_t v25 = v24;
  swift_bridgeObjectRelease();
  if (!v25 || (v65 = v20, v66 = v22, sub_259FA2210(), char v27 = v26, swift_bridgeObjectRelease(), (v27 & 1) == 0))
  {
LABEL_32:
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  uint64_t v65 = v23;
  unint64_t v66 = v25;
  sub_259FA2210();
  char v29 = v28;
  swift_bridgeObjectRelease();
  if ((v29 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v65 = countAndFlagsBits;
  unint64_t v66 = v63;
  sub_259FA2210();
  if ((v30 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v65 = countAndFlagsBits;
  unint64_t v66 = v63;
  swift_bridgeObjectRetain();
  sub_259FA2000();
LABEL_17:
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(v58 + 16))(v62);
  int64_t v32 = *(void *)(v31 + 16);
  if (v32)
  {
    uint64_t v69 = MEMORY[0x263F8EE78];
    sub_259F8AA8C(0, v32, 0);
    uint64_t v33 = v31 + 32;
    while (1)
    {
      int64_t v61 = v32;
      uint64_t v59 = v33;
      sub_259F800A0(v33, (uint64_t)&v65);
      uint64_t v34 = v67;
      uint64_t v35 = v68;
      __swift_project_boxed_opaque_existential_1(&v65, v67);
      uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 32))(v34, v35);
      uint64_t v38 = HIBYTE(v37) & 0xF;
      if ((v37 & 0x2000000000000000) == 0) {
        uint64_t v38 = v36 & 0xFFFFFFFFFFFFLL;
      }
      if (!v38) {
        break;
      }
      swift_bridgeObjectRetain();
      sub_259FA2090();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_259FA1FF0();
      sub_259FA2090();
      swift_bridgeObjectRelease();
      sub_259FA2210();
      char v40 = v39;
      swift_bridgeObjectRelease();
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        break;
      }
      sub_259FA2210();
      char v42 = v41;
      swift_bridgeObjectRelease();
      if ((v42 & 1) == 0) {
        break;
      }
      sub_259FA2210();
      if ((v43 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
      uint64_t v44 = v67;
      uint64_t v45 = v68;
      __swift_project_boxed_opaque_existential_1(&v65, v67);
      uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v45 + 32))(v44, v45);
      uint64_t v48 = v47;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v65);
      uint64_t v49 = v69;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_259F8AA8C(0, *(void *)(v49 + 16) + 1, 1);
        uint64_t v49 = v69;
      }
      unint64_t v51 = *(void *)(v49 + 16);
      unint64_t v50 = *(void *)(v49 + 24);
      if (v51 >= v50 >> 1)
      {
        sub_259F8AA8C(v50 > 1, v51 + 1, 1);
        uint64_t v49 = v69;
      }
      *(void *)(v49 + 16) = v51 + 1;
      uint64_t v52 = v49 + 16 * v51;
      *(void *)(v52 + 32) = v46;
      *(void *)(v52 + 40) = v48;
      uint64_t v33 = v59 + 40;
      int64_t v32 = v61 - 1;
      if (v61 == 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
    }
    sub_259F7C520();
    swift_allocError();
    *(void *)(v56 + 8) = 0;
    *(void *)(v56 + 16) = 0;
    *(void *)uint64_t v56 = 10;
    *(unsigned char *)(v56 + 24) = 5;
    swift_willThrow();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v54 = swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_36:
    uint64_t v65 = 0x205443454C4553;
    unint64_t v66 = 0xE700000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4019E0);
    sub_259F82098();
    sub_259FA1F30();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    uint64_t v54 = v65;
    uint64_t v55 = (void *)v66;
  }
LABEL_37:
  result._object = v55;
  result._uint64_t countAndFlagsBits = v54;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.makeInsertStatementString(for:in:returningRowId:replacingIfNeeded:)(Swift::String a1, Swift::String_optional in, Swift::Bool returningRowId, Swift::Bool replacingIfNeeded)
{
  uint64_t v6 = v5;
  uint64_t v52 = v4;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_259F7DB70(countAndFlagsBits, (unint64_t)object);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_31;
  }
  uint64_t v49 = v6;
  swift_bridgeObjectRetain();
  sub_259F7DBB8(countAndFlagsBits, (unint64_t)object);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_30;
  }
  Swift::Bool v48 = returningRowId;
  if (qword_26A401720 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_259FA1E60();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A401C78);
  sub_259F7DC38();
  sub_259FA2210();
  char v16 = v15;
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0) {
    goto LABEL_30;
  }
  sub_259FA2210();
  char v18 = v17;
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_31;
  }
  if (qword_26A401718 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v14, (uint64_t)qword_26A401C60);
  sub_259FA2210();
  Swift::Bool v19 = returningRowId;
  if ((v20 & 1) == 0) {
    goto LABEL_31;
  }
  if (!in.value._object) {
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  sub_259F7DB70(in.value._countAndFlagsBits, (unint64_t)in.value._object);
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_31:
    sub_259F7C520();
    swift_allocError();
    *(void *)(v43 + 8) = 0;
    *(void *)(v43 + 16) = 0;
    *(void *)uint64_t v43 = 10;
    *(unsigned char *)(v43 + 24) = 5;
    uint64_t v44 = swift_willThrow();
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  sub_259F7DBB8(in.value._countAndFlagsBits, (unint64_t)in.value._object);
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  if (!v24 || (sub_259FA2210(), char v26 = v25, swift_bridgeObjectRelease(), (v26 & 1) == 0))
  {
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  sub_259FA2210();
  char v28 = v27;
  swift_bridgeObjectRelease();
  Swift::Bool v19 = returningRowId;
  if ((v28 & 1) == 0) {
    goto LABEL_31;
  }
  sub_259FA2210();
  if ((v29 & 1) == 0) {
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  sub_259FA2000();
LABEL_17:
  uint64_t v30 = (*(uint64_t (**)(uint64_t))(v49 + 16))(v52);
  uint64_t v31 = sub_259F88F40(v30);
  swift_bridgeObjectRelease();
  sub_259FA2290();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  sub_259FA2000();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4019E0);
  sub_259F82098();
  sub_259FA1F30();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  int64_t v32 = *(void *)(v31 + 16);
  if (v32)
  {
    uint64_t v54 = MEMORY[0x263F8EE78];
    sub_259F8AA8C(0, v32, 0);
    uint64_t v33 = (void *)(v31 + 40);
    while (1)
    {
      uint64_t v34 = HIBYTE(*v33) & 0xFLL;
      if ((*v33 & 0x2000000000000000) == 0) {
        uint64_t v34 = *(v33 - 1) & 0xFFFFFFFFFFFFLL;
      }
      if (!v34)
      {
        sub_259F7C520();
        swift_bridgeObjectRetain();
        goto LABEL_35;
      }
      unint64_t v50 = v33;
      int64_t v51 = v32;
      swift_bridgeObjectRetain_n();
      sub_259FA2090();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_259FA1FF0();
      sub_259FA2090();
      swift_bridgeObjectRelease();
      sub_259FA2210();
      char v36 = v35;
      swift_bridgeObjectRelease();
      if ((v36 & 1) == 0) {
        break;
      }
      sub_259FA2210();
      char v38 = v37;
      swift_bridgeObjectRelease();
      if ((v38 & 1) == 0) {
        goto LABEL_34;
      }
      sub_259FA2210();
      if ((v39 & 1) == 0) {
        goto LABEL_34;
      }
      sub_259FA2000();
      swift_bridgeObjectRelease();
      unint64_t v41 = *(void *)(v54 + 16);
      unint64_t v40 = *(void *)(v54 + 24);
      if (v41 >= v40 >> 1) {
        sub_259F8AA8C(v40 > 1, v41 + 1, 1);
      }
      uint64_t v33 = v50 + 2;
      *(void *)(v54 + 16) = v41 + 1;
      uint64_t v42 = v54 + 16 * v41;
      *(void *)(v42 + 32) = 64;
      *(void *)(v42 + 40) = 0xE100000000000000;
      --v32;
      if (v51 == 1)
      {
        swift_bridgeObjectRelease();
        Swift::Bool v19 = v48;
        goto LABEL_36;
      }
    }
    swift_bridgeObjectRelease();
LABEL_34:
    sub_259F7C520();
LABEL_35:
    swift_allocError();
    *(void *)(v46 + 8) = 0;
    *(void *)(v46 + 16) = 0;
    *(void *)uint64_t v46 = 10;
    *(unsigned char *)(v46 + 24) = 5;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v44 = swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_36:
    sub_259FA1F30();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    if (v19) {
      sub_259FA2000();
    }
    uint64_t v44 = 0x545245534E49;
    uint64_t v45 = (void *)0xE600000000000000;
  }
LABEL_39:
  result._object = v45;
  result._uint64_t countAndFlagsBits = v44;
  return result;
}

uint64_t sub_259F8A710@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  char v25 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 32);
  uint64_t v6 = v25(v5, v4);
  unint64_t v8 = v7;
  swift_bridgeObjectRetain();
  sub_259F7DB70(v6, v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  sub_259F7DBB8(v6, v8);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (!v12) {
    goto LABEL_6;
  }
  if (qword_26A401720 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_259FA1E60();
  __swift_project_value_buffer(v24, (uint64_t)qword_26A401C78);
  sub_259F7DC38();
  sub_259FA2210();
  char v14 = v13;
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
  {
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_12:
    sub_259F7C520();
    uint64_t v18 = swift_allocError();
    *(void *)(v19 + 8) = 0;
    *(void *)(v19 + 16) = 0;
    *(void *)uint64_t v19 = 10;
    *(unsigned char *)(v19 + 24) = 5;
    swift_willThrow();
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v18;
    return result;
  }
  sub_259FA2210();
  char v16 = v15;
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0) {
    goto LABEL_12;
  }
  if (qword_26A401718 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v24, (uint64_t)qword_26A401C60);
  sub_259FA2210();
  if ((v17 & 1) == 0) {
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  v25(v5, v4);
  sub_259FA2000();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  uint64_t v21 = a1[3];
  uint64_t v22 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v21);
  (*(void (**)(uint64_t, uint64_t))(v22 + 24))(v21, v22);
  (*(void (**)(uint64_t *__return_ptr))(v23 + 24))(&v28);
  uint64_t result = sub_259FA2330();
  *a3 = 0;
  a3[1] = 0xE000000000000000;
  return result;
}

uint64_t sub_259F8AA6C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_259F8AAAC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_259F8AA8C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_259F8AC58(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_259F8AAAC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A401AA0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    _OWORD v10[2] = v8;
    uint64_t v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 56 * v8) {
      memmove(v10 + 4, a4 + 4, 56 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 56 * v8 || v12 >= v13 + 56 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017C8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_259FA23A0();
  __break(1u);
  return result;
}

uint64_t sub_259F8AC58(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A401A98);
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
  unint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
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
  uint64_t result = sub_259FA23A0();
  __break(1u);
  return result;
}

uint64_t sub_259F8ADC8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, sqlite3_context *a5)
{
  if (sub_259FA1FE0())
  {
    swift_bridgeObjectRetain();
    sub_259FA2000();
  }
  MEMORY[0x25A2F1700](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017D0);
  sub_259FA1F90();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_259FA1FB0();
  swift_bridgeObjectRelease();
  sqlite3_result_error(a5, (const char *)(v8 + 32), a4);
  return swift_release();
}

uint64_t sub_259F8AF04()
{
  return *(void *)(v0 + 16);
}

uint8_t *static SQLiteDatabase.openInMemoryConnection()()
{
  return sub_259F8C8B4();
}

uint8_t *static SQLiteDatabase.openConnection(_:readOnly:requiresAuthentication:)(uint64_t a1, char a2, char a3)
{
  return sub_259F8CC68(a1, a2, a3);
}

void sub_259F8AF3C(sqlite3 *a1)
{
  if (sqlite3_close_v2(a1))
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_259FA1F20();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A401C90);
    oslog = sub_259FA1F00();
    os_log_type_t v2 = sub_259FA21C0();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 67240192;
      sub_259FA21F0();
      _os_log_impl(&dword_259F7A000, oslog, v2, "Close db connection failed with code %{public}d", v3, 8u);
      MEMORY[0x25A2F1860](v3, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t SQLiteDatabase.__allocating_init()()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  os_log_type_t v2 = sub_259F8C8B4();
  if (v0)
  {
    swift_release();
  }
  else
  {
    *(void *)(v1 + 16) = v2;
    sub_259F8D3F8();
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_259FA1F20();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A401C90);
    uint64_t v5 = sub_259FA1F00();
    os_log_type_t v6 = sub_259FA21B0();
    if (os_log_type_enabled(v5, v6))
    {
      int64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v7 = 0;
      _os_log_impl(&dword_259F7A000, v5, v6, "In-memory db connection opened", v7, 2u);
      MEMORY[0x25A2F1860](v7, -1, -1);
    }
  }
  return v1;
}

uint64_t SQLiteDatabase.init()()
{
  uint64_t v2 = v0;
  *(void *)(v0 + 16) = 0;
  uint64_t v3 = sub_259F8C8B4();
  if (v1)
  {
    swift_release();
  }
  else
  {
    *(void *)(v0 + 16) = v3;
    sub_259F8D3F8();
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_259FA1F20();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A401C90);
    os_log_type_t v6 = sub_259FA1F00();
    os_log_type_t v7 = sub_259FA21B0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_259F7A000, v6, v7, "In-memory db connection opened", v8, 2u);
      MEMORY[0x25A2F1860](v8, -1, -1);
    }
  }
  return v2;
}

uint64_t SQLiteDatabase.__allocating_init(_:readOnly:requiresAuthentication:)(uint64_t a1, char a2, char a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  uint64_t v8 = sub_259F8CC68(a1, a2, a3);
  if (v3)
  {
    swift_release();
  }
  else
  {
    *(void *)(v7 + 16) = v8;
    sub_259F8D3F8();
  }
  uint64_t v9 = sub_259FA1ED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v7;
}

uint64_t SQLiteDatabase.init(_:readOnly:requiresAuthentication:)(uint64_t a1, char a2, char a3)
{
  *(void *)(v3 + 16) = 0;
  os_log_type_t v6 = sub_259F8CC68(a1, a2, a3);
  if (v4)
  {
    swift_release();
  }
  else
  {
    *(void *)(v3 + 16) = v6;
    sub_259F8D3F8();
  }
  uint64_t v7 = sub_259FA1ED0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v3;
}

uint64_t SQLiteDatabase.__allocating_init(connection:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  SQLiteDatabase.init(connection:)(a1);
  return v2;
}

uint64_t SQLiteDatabase.init(connection:)(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 16) = 0;
  if (a1)
  {
    *(void *)(v1 + 16) = a1;
  }
  else
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_259FA1F20();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A401C90);
    swift_retain();
    uint64_t v4 = sub_259FA1F00();
    os_log_type_t v5 = sub_259FA21C0();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v12 = v7;
      *(_DWORD *)os_log_type_t v6 = 136315138;
      type metadata accessor for SQLiteDatabase();
      swift_retain();
      uint64_t v8 = sub_259FA1F90();
      sub_259F90F1C(v8, v9, &v12);
      sub_259FA21F0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259F7A000, v4, v5, "Can't create %s from a nil connection", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2F1860](v7, -1, -1);
      MEMORY[0x25A2F1860](v6, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v10 = 0xD00000000000002BLL;
    *(void *)(v10 + 8) = 0x8000000259FA3170;
    *(void *)(v10 + 16) = 0;
    *(unsigned char *)(v10 + 24) = 4;
    swift_willThrow();
  }
  return v2;
}

uint64_t SQLiteDatabase.deinit()
{
  uint64_t v1 = *(sqlite3 **)(v0 + 16);
  if (v1)
  {
    sub_259F8AF3C(v1);
    *(void *)(v0 + 16) = 0;
  }
  return v0;
}

uint64_t SQLiteDatabase.__deallocating_deinit()
{
  uint64_t v1 = *(sqlite3 **)(v0 + 16);
  if (v1 && sqlite3_close_v2(v1))
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_259FA1F20();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A401C90);
    uint64_t v3 = sub_259FA1F00();
    os_log_type_t v4 = sub_259FA21C0();
    if (os_log_type_enabled(v3, v4))
    {
      os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v5 = 67240192;
      sub_259FA21F0();
      _os_log_impl(&dword_259F7A000, v3, v4, "Close db connection failed with code %{public}d", v5, 8u);
      MEMORY[0x25A2F1860](v5, -1, -1);
    }
  }
  return swift_deallocClassInstance();
}

uint64_t sub_259F8B894()
{
  uint64_t result = *(void *)(v0 + 16);
  *(void *)(v0 + 16) = 0;
  return result;
}

uint64_t sub_259F8B8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 8))(a3, a4, v4, ObjectType, a2);
}

void sub_259F8B914()
{
  uint64_t v1 = *(sqlite3 **)(v0 + 16);
  if (v1)
  {
    sub_259F8AF3C(v1);
    *(void *)(v0 + 16) = 0;
  }
}

BOOL sub_259F8B938()
{
  return *(void *)(v0 + 16) != 0;
}

uint64_t sub_259F8B948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  uint64_t v7 = *(sqlite3 **)(v5 + 16);
  if (v7)
  {
    ppStmt[0] = 0;
    uint64_t v11 = sub_259FA1FB0();
    unsigned int v12 = sqlite3_prepare_v2(v7, (const char *)(v11 + 32), -1, ppStmt, 0);
    swift_release();
    unint64_t v13 = ppStmt[0];
    if (ppStmt[0] && !v12)
    {
      type metadata accessor for SQLiteStatement.Context();
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v5;
      *(void *)(v14 + 24) = v13;
      *(void *)a4 = v14;
      *(void *)(a4 + 8) = a1;
      *(void *)(a4 + 16) = a2;
      *(_OWORD *)(a4 + 24) = xmmword_259FA4200;
      *(unsigned char *)(a4 + 40) = a3 & 1;
      swift_retain();
      return swift_bridgeObjectRetain();
    }
    sub_259FA2290();
    swift_bridgeObjectRelease();
    sub_259FA23C0();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    if (a3)
    {
      sub_259FA2000();
      sub_259FA2000();
      swift_bridgeObjectRelease();
    }
    unint64_t v17 = sub_259F8C37C(0xD000000000000028, 0x8000000259FA31A0);
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v20 = v12;
    *(void *)(v20 + 8) = v17;
    *(void *)(v20 + 16) = v19;
    *(unsigned char *)(v20 + 24) = 0;
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v16 + 8) = 0;
    *(void *)(v16 + 16) = 0;
    *(void *)uint64_t v16 = 0;
    *(unsigned char *)(v16 + 24) = 5;
  }
  return swift_willThrow();
}

void sub_259F8BB8C(void (*a1)(uint64_t))
{
  uint64_t v3 = sub_259F8B948(0xD000000000000012, 0x8000000259FA31D0, 0, (uint64_t)&v8);
  if (!v1)
  {
    long long v12 = v8;
    v13[0] = v9[0];
    *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)v9 + 9);
    MEMORY[0x270FA5388](v3);
    long long v6 = v8;
    v7[0] = v9[0];
    *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v9 + 9);
    sub_259F904E0((uint64_t *)&v6, (void (*)(uint64_t *))sub_259F8D64C);
    uint64_t v4 = sub_259F80944((uint64_t)&v12);
    a1(v4);
    uint64_t v5 = sub_259F8B948(0x3B54494D4D4F43, 0xE700000000000000, 0, (uint64_t)&v8);
    long long v10 = v8;
    v11[0] = v9[0];
    *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)v9 + 9);
    MEMORY[0x270FA5388](v5);
    long long v6 = v10;
    v7[0] = v11[0];
    *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v11 + 9);
    sub_259F904E0((uint64_t *)&v6, (void (*)(uint64_t *))sub_259F8DAB4);
    sub_259F80944((uint64_t)&v10);
  }
}

unint64_t sub_259F8C37C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(sqlite3 **)(v2 + 16);
  if (v3)
  {
    uint64_t v17 = a1;
    unint64_t v18 = a2;
    swift_bridgeObjectRetain();
    if (sqlite3_errmsg(v3))
    {
      uint64_t v4 = sub_259FA2010();
      uint64_t v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0) {
        uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
      }
      if (!v6) {
        swift_bridgeObjectRelease();
      }
      uint64_t v15 = 8236;
      unint64_t v16 = 0xE200000000000000;
      sub_259FA2000();
      swift_bridgeObjectRelease();
      sub_259FA2000();
      swift_bridgeObjectRelease();
    }
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_259FA1F20();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A401C90);
    uint64_t v9 = v17;
    unint64_t v8 = v18;
    swift_bridgeObjectRetain_n();
    long long v10 = sub_259FA1F00();
    os_log_type_t v11 = sub_259FA21C0();
    if (os_log_type_enabled(v10, v11))
    {
      long long v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      *(_DWORD *)long long v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_259F90F1C(v9, v8, &v15);
      sub_259FA21F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259F7A000, v10, v11, "%s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2F1860](v13, -1, -1);
      MEMORY[0x25A2F1860](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    return v17;
  }
  else
  {
    unint64_t v16 = 0x8000000259FA3210;
    sub_259FA2000();
    return 0xD000000000000014;
  }
}

uint64_t sub_259F8C5FC()
{
  uint64_t result = sub_259F8D3F8();
  if (!v0) {
    return swift_retain();
  }
  return result;
}

void sub_259F8C624(sqlite3_context *a1, int a2, uint64_t a3)
{
  if (!a1) {
    return;
  }
  uint64_t v4 = Array<A>.init(_:argc:)(a3, a2);
  uint64_t v5 = v4;
  if (!*(void *)(v4 + 16))
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v6 = *(sqlite3_value **)(v4 + 32);
  if (sqlite3_value_type(v6) != 2 && sqlite3_value_type(v6) != 1) {
    goto LABEL_11;
  }
  if (*(void *)(v5 + 16) < 2uLL)
  {
LABEL_16:
    __break(1u);
    return;
  }
  uint64_t v7 = *(sqlite3_value **)(v5 + 40);
  if (sqlite3_value_type(v7) != 2 && sqlite3_value_type(v7) != 1)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    double v11 = 0.0;
    goto LABEL_12;
  }
  double v8 = sqlite3_value_double(*(sqlite3_value **)(v5 + 32));
  uint64_t v9 = *(sqlite3_value **)(v5 + 40);
  swift_bridgeObjectRelease();
  double v10 = sqlite3_value_double(v9);
  double v11 = pow(v8, v10);
LABEL_12:

  sqlite3_result_double(a1, v11);
}

void sub_259F8C798(sqlite3_context *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v4 = Array<A>.init(_:argc:)(a3, a2);
    uint64_t v5 = v4;
    if (*(void *)(v4 + 16))
    {
      uint64_t v6 = *(sqlite3_value **)(v4 + 32);
      if (sqlite3_value_type(v6) == 2 || sqlite3_value_type(v6) == 1)
      {
        uint64_t v7 = *(sqlite3_value **)(v5 + 32);
        swift_bridgeObjectRelease();
        double v8 = sqlite3_value_double(v7);
        double v9 = exp(v8);
      }
      else
      {
        swift_bridgeObjectRelease();
        double v9 = 0.0;
      }
      sqlite3_result_double(a1, v9);
    }
    else
    {
      __break(1u);
    }
  }
}

uint8_t *sub_259F8C8B4()
{
  ppDb[1] = *(sqlite3 **)MEMORY[0x263EF8340];
  if (sqlite3_threadsafe() != 2)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = 1;
    char v8 = 5;
LABEL_9:
    *(unsigned char *)(v7 + 24) = v8;
LABEL_10:
    swift_willThrow();
    return v0;
  }
  ppDb[0] = 0;
  uint64_t v1 = (uint8_t *)sqlite3_open(":memory:", ppDb);
  if (v1)
  {
    uint64_t v0 = v1;
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_259FA1F20();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A401C90);
    uint64_t v3 = sub_259FA1F00();
    os_log_type_t v4 = sub_259FA21C0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 67109120;
      sub_259FA21F0();
      _os_log_impl(&dword_259F7A000, v3, v4, "Error %d occurred while opening in-memory db connection", v5, 8u);
      MEMORY[0x25A2F1860](v5, -1, -1);
    }

    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v6 = v0;
    *(void *)(v6 + 8) = 0xD000000000000026;
    *(void *)(v6 + 16) = 0x8000000259FA3360;
    *(unsigned char *)(v6 + 24) = 0;
    goto LABEL_10;
  }
  uint64_t v0 = (uint8_t *)ppDb[0];
  if (!ppDb[0])
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_259FA1F20();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A401C90);
    uint64_t v15 = sub_259FA1F00();
    os_log_type_t v16 = sub_259FA21C0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v0 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v0 = 0;
      _os_log_impl(&dword_259F7A000, v15, v16, "Failed to open in-memory db connection", v0, 2u);
      MEMORY[0x25A2F1860](v0, -1, -1);
    }

    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v7 = 0xD000000000000026;
    *(void *)(v7 + 8) = 0x8000000259FA3360;
    *(void *)(v7 + 16) = 0;
    char v8 = 4;
    goto LABEL_9;
  }
  if (qword_26A401728 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_259FA1F20();
  __swift_project_value_buffer(v10, (uint64_t)qword_26A401C90);
  double v11 = sub_259FA1F00();
  os_log_type_t v12 = sub_259FA21B0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_259F7A000, v11, v12, "In-memory db connection opened", v13, 2u);
    MEMORY[0x25A2F1860](v13, -1, -1);
  }

  return v0;
}

uint8_t *sub_259F8CC68(uint64_t a1, char a2, char a3)
{
  ppDb[1] = *(sqlite3 **)MEMORY[0x263EF8340];
  uint64_t v6 = sub_259FA1ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint8_t *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v48 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v48 - v14;
  if (sqlite3_threadsafe() != 2)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v29 + 8) = 0;
    *(void *)(v29 + 16) = 0;
    *(void *)uint64_t v29 = 1;
    char v30 = 5;
LABEL_14:
    *(unsigned char *)(v29 + 24) = v30;
LABEL_24:
    swift_willThrow();
    return v10;
  }
  uint64_t v50 = v6;
  if (a3) {
    int v16 = 3145728;
  }
  else {
    int v16 = 0;
  }
  if (a2) {
    int v17 = 65537;
  }
  else {
    int v17 = 65542;
  }
  int v18 = v17 | v16;
  ppDb[0] = 0;
  sub_259FA1EC0();
  uint64_t v19 = sub_259FA1FB0();
  swift_bridgeObjectRelease();
  unsigned int v20 = sqlite3_open_v2((const char *)(v19 + 32), ppDb, v18, 0);
  swift_release();
  if (v20)
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_259FA1F20();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A401C90);
    uint64_t v22 = v50;
    (*(void (**)(uint8_t *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v50);
    uint64_t v23 = sub_259FA1F00();
    os_log_type_t v24 = sub_259FA21C0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v52 = v49;
      *(_DWORD *)uint64_t v25 = 67109378;
      LODWORD(v51) = v20;
      sub_259FA21F0();
      *(_WORD *)(v25 + 8) = 2080;
      uint64_t v26 = sub_259FA1EC0();
      uint64_t v51 = sub_259F90F1C(v26, v27, &v52);
      sub_259FA21F0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint8_t *, uint64_t))(v7 + 8))(v10, v22);
      _os_log_impl(&dword_259F7A000, v23, v24, "Error %d occurred while opening db connection: %s", (uint8_t *)v25, 0x12u);
      uint64_t v28 = v49;
      swift_arrayDestroy();
      MEMORY[0x25A2F1860](v28, -1, -1);
      MEMORY[0x25A2F1860](v25, -1, -1);
    }
    else
    {
      (*(void (**)(uint8_t *, uint64_t))(v7 + 8))(v10, v22);
    }

    if (ppDb[0]) {
      sub_259F8AF3C(ppDb[0]);
    }
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v39 = v20;
    *(void *)(v39 + 8) = 0xD00000000000001CLL;
    *(void *)(v39 + 16) = 0x8000000259FA3300;
    *(unsigned char *)(v39 + 24) = 0;
    goto LABEL_24;
  }
  uint64_t v10 = (uint8_t *)ppDb[0];
  if (!ppDb[0])
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_259FA1F20();
    __swift_project_value_buffer(v41, (uint64_t)qword_26A401C90);
    uint64_t v42 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, a1, v50);
    uint64_t v43 = sub_259FA1F00();
    os_log_type_t v44 = sub_259FA21C0();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v52 = v49;
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v45 = sub_259FA1EC0();
      uint64_t v51 = sub_259F90F1C(v45, v46, &v52);
      sub_259FA21F0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v42);
      _os_log_impl(&dword_259F7A000, v43, v44, "Failed to open db connection with no error: %s", v10, 0xCu);
      uint64_t v47 = v49;
      swift_arrayDestroy();
      MEMORY[0x25A2F1860](v47, -1, -1);
      MEMORY[0x25A2F1860](v10, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v42);
    }

    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v29 = 0xD00000000000002ALL;
    *(void *)(v29 + 8) = 0x8000000259FA3320;
    *(void *)(v29 + 16) = 0;
    char v30 = 4;
    goto LABEL_14;
  }
  if (qword_26A401728 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_259FA1F20();
  __swift_project_value_buffer(v31, (uint64_t)qword_26A401C90);
  uint64_t v32 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, a1, v50);
  uint64_t v33 = sub_259FA1F00();
  os_log_type_t v34 = sub_259FA21B0();
  if (os_log_type_enabled(v33, v34))
  {
    char v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v52 = v49;
    *(_DWORD *)char v35 = 136315138;
    v48[1] = v35 + 4;
    uint64_t v36 = sub_259FA1EC0();
    uint64_t v51 = sub_259F90F1C(v36, v37, &v52);
    sub_259FA21F0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v50);
    _os_log_impl(&dword_259F7A000, v33, v34, "DB connection opened %s", v35, 0xCu);
    uint64_t v38 = v49;
    swift_arrayDestroy();
    MEMORY[0x25A2F1860](v38, -1, -1);
    MEMORY[0x25A2F1860](v35, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v32);
  }

  return v10;
}

uint64_t sub_259F8D3F8()
{
  uint64_t v1 = v0;
  int function = sqlite3_create_function(*(sqlite3 **)(v0 + 16), "power", 2, 5, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_259F8C794, 0, 0);
  if (function)
  {
    unsigned int v3 = function;
    sub_259FA2290();
    swift_bridgeObjectRelease();
    sub_259FA23C0();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    unint64_t v4 = sub_259F8C37C(0xD000000000000021, 0x8000000259FA3290);
    uint64_t v6 = v5;
    swift_bridgeObjectRelease();
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v7 = v3;
LABEL_5:
    *(void *)(v7 + 8) = v4;
    *(void *)(v7 + 16) = v6;
    *(unsigned char *)(v7 + 24) = 0;
    swift_willThrow();
    return v1;
  }
  if (sqlite3_create_function(*(sqlite3 **)(v0 + 16), "exp", 1, 5, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_259F8C8B0, 0, 0))
  {
    sub_259FA2290();
    swift_bridgeObjectRelease();
    sub_259FA23C0();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    unint64_t v4 = sub_259F8C37C(0xD00000000000001FLL, 0x8000000259FA32C0);
    uint64_t v6 = v8;
    swift_bridgeObjectRelease();
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v7 = 0;
    goto LABEL_5;
  }
  return v1;
}

uint64_t type metadata accessor for SQLiteDatabase()
{
  return self;
}

uint64_t sub_259F8D64C(uint64_t a1)
{
  return sub_259F8FD7C(a1, *(void *)(v1 + 16));
}

uint64_t sub_259F8D668()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_259F8D670()
{
  unint64_t result = qword_26A401AA8;
  if (!qword_26A401AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401AA8);
  }
  return result;
}

uint64_t method lookup function for SQLiteDatabase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SQLiteDatabase);
}

uint64_t dispatch thunk of SQLiteDatabase.unsafeConnection()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of SQLiteDatabase.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SQLiteDatabase.__allocating_init(_:readOnly:requiresAuthentication:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SQLiteDatabase.__allocating_init(connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of SQLiteDatabase.detachConnection()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SQLiteDatabase.register(_:withName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SQLiteDatabase.close()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SQLiteDatabase.isOpen()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of SQLiteDatabase.statement(with:verboseLog:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SQLiteDatabase.transaction(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SQLiteDatabase.logAndReturnSQLErrorMessage(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SQLiteDatabase.registerMathFunctions()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t sub_259F8D8EC()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SQLiteDatabase.TransactionError()
{
  return sub_259F8D668();
}

uint64_t _s12PoirotSQLite14SQLiteDatabaseC16TransactionErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_259F8D8EC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SQLiteDatabase.TransactionError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_259F8D8EC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_259F8D668();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SQLiteDatabase.TransactionError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_259F8D668();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteDatabase.TransactionError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteDatabase.TransactionError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_259F8DA90(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_259F8DA98(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteDatabase.TransactionError()
{
  return &type metadata for SQLiteDatabase.TransactionError;
}

uint64_t sub_259F8DAB4(uint64_t a1)
{
  return sub_259F8D64C(a1);
}

void sub_259F8DACC(uint64_t a1, uint64_t a2, sqlite3_context *a3)
{
  if ((a2 & 0x1000000000000000) == 0 && a2 & 0x2000000000000000 | a1 & 0x1000000000000000)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(void *)__s = a1;
      uint64_t v14 = a2 & 0xFFFFFFFFFFFFFFLL;
      int64_t v11 = strlen(__s);
      if (v11 >= (uint64_t)0xFFFFFFFF80000000)
      {
        LODWORD(v3) = v11;
        if (v11 <= 0x7FFFFFFF)
        {
          if (qword_26A401738 == -1)
          {
LABEL_14:
            uint64_t v7 = (void (__cdecl *)(void *))qword_26A401AB8;
            uint64_t v9 = __s;
            uint64_t v8 = a3;
LABEL_15:
            int v10 = (int)v3;
LABEL_16:
            sqlite3_result_text(v8, v9, v10, v7);
            return;
          }
LABEL_27:
          swift_once();
          goto LABEL_14;
        }
        goto LABEL_25;
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if ((a1 & 0x1000000000000000) != 0)
    {
      unsigned int v3 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      goto LABEL_6;
    }
    unsigned int v3 = (const char *)sub_259FA22C0();
    if (v3)
    {
LABEL_6:
      int64_t v5 = strlen(v3);
      if (v5 >= (uint64_t)0xFFFFFFFF80000000)
      {
        int v6 = v5;
        if (v5 <= 0x7FFFFFFF)
        {
          if (qword_26A401738 != -1) {
            swift_once();
          }
          uint64_t v7 = (void (__cdecl *)(void *))qword_26A401AB8;
          uint64_t v8 = a3;
          uint64_t v9 = (char *)v3;
          int v10 = v6;
          goto LABEL_16;
        }
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    int64_t v12 = strlen(0);
    if (v12 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else
    {
      LODWORD(v3) = v12;
      if (v12 <= 0x7FFFFFFF)
      {
        if (qword_26A401738 == -1)
        {
LABEL_22:
          uint64_t v7 = (void (__cdecl *)(void *))qword_26A401AB8;
          uint64_t v8 = a3;
          uint64_t v9 = 0;
          goto LABEL_15;
        }
LABEL_30:
        swift_once();
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_30;
  }
  sub_259FA2280();
}

uint64_t SQLiteContext.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

Swift::Void __swiftcall SQLiteContext.setError(message:code:)(Swift::String message, Swift::Int32 code)
{
  int v4 = *v2;
  uint64_t v5 = sub_259FA1FB0();
  sqlite3_result_error(v4, (const char *)(v5 + 32), code);

  swift_release();
}

uint64_t SQLiteContext.setError<A>(_:message:code:)(uint64_t a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5)
{
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *v5;
  if (sub_259FA1FE0())
  {
    uint64_t v19 = a2;
    unint64_t v20 = a3;
    swift_bridgeObjectRetain();
    sub_259FA2000();
    uint64_t v16 = v19;
    unint64_t v15 = v20;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v15 = 0xE000000000000000;
  }
  uint64_t v19 = 0x203A726F727245;
  unint64_t v20 = 0xE700000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, a5);
  sub_259FA1F90();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  uint64_t v19 = v16;
  unint64_t v20 = v15;
  swift_bridgeObjectRetain();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_259FA1FB0();
  swift_bridgeObjectRelease();
  sqlite3_result_error(v14, (const char *)(v17 + 32), a4);
  return swift_release();
}

Swift::Void __swiftcall SQLiteContext.setDouble(_:)(Swift::Double a1)
{
  sqlite3_result_double(*v1, a1);
}

void *(__cdecl *static SQLiteConstructor.sqlite.block.getter())(int)
{
  return j__sqlite3_malloc;
}

void sub_259F8DF24()
{
  qword_26A401AB0 = 0;
}

uint64_t SQLiteDestructor.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *static SQLiteDestructor.none.getter@<X0>(void *a1@<X8>)
{
  return sub_259F8DFD4(&qword_26A401730, &qword_26A401AB0, a1);
}

uint64_t sub_259F8DF5C()
{
  if (qword_26A401710 != -1) {
    uint64_t result = swift_once();
  }
  qword_26A401AB8 = qword_26A401C58;
  return result;
}

void *static SQLiteDestructor.transient.getter@<X0>(void *a1@<X8>)
{
  return sub_259F8DFD4(&qword_26A401738, &qword_26A401AB8, a1);
}

void *sub_259F8DFD4@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result != -1) {
    uint64_t result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

void static SQLiteDestructor.sqlite.getter(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8C7C8];
}

uint64_t SQLiteDestructor.block.getter()
{
  return *(void *)v0;
}

uint64_t SQLiteContext.context.getter()
{
  return *(void *)v0;
}

Swift::Void __swiftcall SQLiteContext.setSubtype(_:)(Swift::UInt32 a1)
{
  sqlite3_result_subtype(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setInt32(_:)(Swift::Int32 a1)
{
  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setInt64(_:)(Swift::Int64 a1)
{
  sqlite3_result_int64(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setInt(_:)(Swift::Int a1)
{
  sqlite3_result_int64(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setInt8(_:)(Swift::Int8 a1)
{
  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt8(_:)(Swift::UInt8 a1)
{
  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setInt16(_:)(Swift::Int16 a1)
{
  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt16(_:)(Swift::UInt16 a1)
{
  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt32(_:)(Swift::UInt32 a1)
{
  if ((a1 & 0x80000000) != 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    swift_willThrow();
  }
  else
  {
    sqlite3_result_int(*v1, a1);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt64(_:)(Swift::UInt64 a1)
{
}

void sub_259F8E204(sqlite3_int64 a1)
{
  if (a1 < 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)uint64_t v2 = 8;
    *(unsigned char *)(v2 + 24) = 5;
    swift_willThrow();
  }
  else
  {
    sqlite3_result_int64(*v1, a1);
  }
}

Swift::Void __swiftcall SQLiteContext.setBool(_:)(Swift::Bool a1)
{
  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setFloat(_:)(Swift::Float a1)
{
  sqlite3_result_double(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setString(_:)(Swift::String_optional a1)
{
  if (a1.value._object)
  {
    sub_259F8DACC(a1.value._countAndFlagsBits, (uint64_t)a1.value._object, *v1);
  }
  else
  {
    uint64_t v2 = *v1;
    sqlite3_result_null(v2);
  }
}

Swift::Void __swiftcall SQLiteContext.setNull()()
{
  sqlite3_result_null(*v0);
}

void sub_259F8E2F4(const char *a1, sqlite3_context *a2)
{
  int64_t v5 = strlen(a1);
  if (v5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_6;
  }
  int v2 = v5;
  if (v5 > 0x7FFFFFFF)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (qword_26A401738 != -1) {
LABEL_7:
  }
    swift_once();
  sqlite3_result_text(a2, a1, v2, (void (__cdecl *)(void *))qword_26A401AB8);
}

void SQLiteContext.setData(_:destructor:)(uint64_t a1, unint64_t a2, void (__cdecl **a3)(void *))
{
  _OWORD v24[2] = *MEMORY[0x263EF8340];
  int v4 = *v3;
  if (a2 >> 60 == 15)
  {
    int64_t v5 = *v3;
    sqlite3_result_null(v5);
    return;
  }
  uint64_t v7 = *a3;
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 > a1 >> 32)
      {
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      swift_retain();
      uint64_t v11 = sub_259FA1E80();
      if (!v11)
      {
        sub_259FA1E90();
        sqlite3_result_null(v4);
        goto LABEL_23;
      }
      uint64_t v12 = v11;
      uint64_t v13 = sub_259FA1EA0();
      uint64_t v14 = (int)a1 - v13;
      if (__OFSUB__((int)a1, v13)) {
        goto LABEL_27;
      }
      sub_259FA1E90();
      if (__OFSUB__(HIDWORD(a1), a1))
      {
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      sqlite3_result_blob(v4, (const void *)(v12 + v14), HIDWORD(a1) - a1, v7);
LABEL_23:
      sub_259F8E6AC(a1, a2);
      return;
    case 2uLL:
      uint64_t v15 = *(void *)(a1 + 16);
      sub_259F8E698(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = sub_259FA1E80();
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = sub_259FA1EA0();
        BOOL v19 = __OFSUB__(v15, v18);
        uint64_t v20 = v15 - v18;
        if (v19)
        {
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        sub_259FA1E90();
        uint64_t v22 = *(void *)(a1 + 16);
        uint64_t v21 = *(void *)(a1 + 24);
        uint64_t v23 = v21 - v22;
        if (__OFSUB__(v21, v22))
        {
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
        if (v23 < (uint64_t)0xFFFFFFFF80000000)
        {
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
        }
        if (v23 > 0x7FFFFFFF) {
          goto LABEL_32;
        }
        sqlite3_result_blob(v4, (const void *)(v17 + v20), v23, v7);
      }
      else
      {
        sub_259FA1E90();
        sqlite3_result_null(v4);
      }
      swift_release();
      swift_release();
      goto LABEL_23;
    case 3uLL:
      memset(v24, 0, 14);
      int v10 = v4;
      int v9 = 0;
      goto LABEL_19;
    default:
      v24[0] = a1;
      LOWORD(v24[1]) = a2;
      BYTE2(v24[1]) = BYTE2(a2);
      BYTE3(v24[1]) = BYTE3(a2);
      BYTE4(v24[1]) = BYTE4(a2);
      int v9 = BYTE6(a2);
      BYTE5(v24[1]) = BYTE5(a2);
      int v10 = v4;
LABEL_19:
      sqlite3_result_blob(v10, v24, v9, v7);
      sub_259F8E6AC(a1, a2);
      return;
  }
}

uint64_t sub_259F8E698(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_259F8591C(a1, a2);
  }
  return a1;
}

uint64_t sub_259F8E6AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_259F85974(a1, a2);
  }
  return a1;
}

uint64_t SQLiteContext.setBuffer(_:ofSize:destructor:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_259F8E6F0(a1, a2, a3, MEMORY[0x263F8C7D0]);
}

uint64_t SQLiteContext.setString(_:ofSize:destructor:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_259F8E6F0(a1, a2, a3, MEMORY[0x263F8C7D8]);
}

uint64_t sub_259F8E6F0(uint64_t result, uint64_t a2, void *a3, uint64_t (*a4)(void, uint64_t, uint64_t, void))
{
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    return a4(*v4, result, a2, *a3);
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SQLiteConstructor()
{
  return &type metadata for SQLiteConstructor;
}

ValueMetadata *type metadata accessor for SQLiteConstructor.sqlite()
{
  return &type metadata for SQLiteConstructor.sqlite;
}

uint64_t getEnumTagSinglePayload for SQLiteDestructor(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteDestructor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteDestructor()
{
  return &type metadata for SQLiteDestructor;
}

ValueMetadata *type metadata accessor for SQLiteContext()
{
  return &type metadata for SQLiteContext;
}

uint64_t sub_259F8E7F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_259F8E81C(const char *a1)
{
  sub_259F8E2F4(a1, *(sqlite3_context **)(v1 + 16));
}

uint64_t static SQLiteUndefined.sqlColumnType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = byte_26A401AC0;
  return result;
}

uint64_t static SQLiteUndefined.sqlColumnType.setter(char *a1)
{
  char v1 = *a1;
  uint64_t result = swift_beginAccess();
  byte_26A401AC0 = v1;
  return result;
}

uint64_t (*static SQLiteUndefined.sqlColumnType.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SQLiteUndefined.sqlNullable.getter()
{
  return byte_26A401AC1;
}

uint64_t static SQLiteUndefined.sqlNullable.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26A401AC1 = a1;
  return result;
}

uint64_t (*static SQLiteUndefined.sqlNullable.modify())()
{
  return j__swift_endAccess;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteUndefined.getSQLDataType()()
{
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD00000000000003ALL;
  *(void *)(v0 + 8) = 0x8000000259FA3390;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 4;
  return swift_willThrow();
}

double SQLiteUndefined.unwrapIfOptional()@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t static SQLiteUndefined.create(from:at:nullable:)()
{
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD000000000000024;
  *(void *)(v0 + 8) = 0x8000000259FA33D0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 4;
  return swift_willThrow();
}

uint64_t SQLiteUndefined.bind(to:at:)()
{
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD00000000000002FLL;
  *(void *)(v0 + 8) = 0x8000000259FA3400;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 4;
  return swift_willThrow();
}

unint64_t static SQLiteUndefined.create(from:)@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for SQLiteUndefined;
  unint64_t result = sub_259F7C6A0();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t static SQLiteUndefined.== infix(_:_:)()
{
  return 1;
}

uint64_t SQLiteUndefined.hashValue.getter()
{
  return sub_259FA24A0();
}

uint64_t sub_259F8EBF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = byte_26A401AC0;
  return result;
}

uint64_t sub_259F8EC3C()
{
  return byte_26A401AC1;
}

uint64_t sub_259F8EC80()
{
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD00000000000003ALL;
  *(void *)(v0 + 8) = 0x8000000259FA3390;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 4;
  return swift_willThrow();
}

double sub_259F8ECF0@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_259F8ED00()
{
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD000000000000024;
  *(void *)(v0 + 8) = 0x8000000259FA33D0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 4;
  return swift_willThrow();
}

void sub_259F8ED70(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = a2;
}

uint64_t sub_259F8ED78()
{
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v0 = 0xD00000000000002FLL;
  *(void *)(v0 + 8) = 0x8000000259FA3400;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 4;
  return swift_willThrow();
}

uint64_t sub_259F8EDE8()
{
  return sub_259FA24A0();
}

uint64_t sub_259F8EE20()
{
  return sub_259FA24A0();
}

unint64_t sub_259F8EE54(uint64_t a1)
{
  unint64_t result = sub_259F8EE7C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F8EE7C()
{
  unint64_t result = qword_26A401AC8;
  if (!qword_26A401AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401AC8);
  }
  return result;
}

unint64_t sub_259F8EED4()
{
  unint64_t result = qword_26A401AD0;
  if (!qword_26A401AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401AD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteUndefined()
{
  return &type metadata for SQLiteUndefined;
}

void SQLiteStatement.nextRow()(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (!v4 || !*(void *)(v4 + 16))
  {
LABEL_16:
    sub_259F7C520();
    swift_allocError();
    uint64_t v16 = 4;
    goto LABEL_17;
  }
  int64_t v5 = *(sqlite3_stmt **)(v3 + 24);
  if (!v5)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v16 = 3;
LABEL_17:
    *(void *)(v15 + 8) = 0;
    *(void *)(v15 + 16) = 0;
    *(void *)uint64_t v15 = v16;
    *(unsigned char *)(v15 + 24) = 5;
    goto LABEL_18;
  }
  uint64_t v7 = v1[1];
  unint64_t v6 = v1[2];
  int v8 = *((unsigned __int8 *)v1 + 40);
  int v9 = sqlite3_step(v5);
  if (v9 == 100)
  {
    *a1 = v3;
    swift_retain();
    return;
  }
  unsigned int v10 = v9;
  if (v9 != 101)
  {
    uint64_t v17 = *(void *)(v3 + 16);
    if (v17 && *(void *)(v17 + 16))
    {
      swift_retain();
      sub_259FA2290();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_259FA2000();
      swift_bridgeObjectRelease();
      unint64_t v18 = sub_259F8C37C(0xD000000000000025, 0x8000000259FA3430);
      uint64_t v20 = v19;
      swift_release();
      swift_bridgeObjectRelease();
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v21 = v10;
      *(void *)(v21 + 8) = v18;
      *(void *)(v21 + 16) = v20;
      *(unsigned char *)(v21 + 24) = 0;
LABEL_18:
      swift_willThrow();
      return;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_259FA1F20();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A401C90);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_259FA1F00();
    os_log_type_t v13 = sub_259FA21A0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v23[0] = v22;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      v23[3] = sub_259F90F1C(v7, v6, v23);
      sub_259FA21F0();
      swift_release();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259F7A000, v12, v13, "SQL statement executed: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2F1860](v22, -1, -1);
      MEMORY[0x25A2F1860](v14, -1, -1);

      *a1 = 0;
      return;
    }

    swift_bridgeObjectRelease();
    swift_release();
  }
  *a1 = 0;
}

uint64_t SQLiteStatement.bind(_:withName:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  os_log_type_t v24 = a2;
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  uint64_t v8 = v2[3];
  uint64_t v9 = v2[4];
  char v10 = *((unsigned char *)v2 + 40);
  uint64_t v18 = *v2;
  uint64_t v19 = v6;
  uint64_t v20 = v7;
  uint64_t v21 = v8;
  uint64_t v22 = v9;
  char v23 = v10;
  uint64_t result = sub_259F8F7CC();
  if (!v3)
  {
    uint64_t v12 = result;
    if (result)
    {
      uint64_t v17 = a1[4];
      os_log_type_t v13 = a1;
      uint64_t v14 = a1[3];
      __swift_project_boxed_opaque_existential_1(v13, v14);
      uint64_t v18 = v5;
      uint64_t v19 = v6;
      uint64_t v20 = v7;
      uint64_t v21 = v8;
      uint64_t v22 = v9;
      char v23 = v10;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 8))(&v18, v12, v14);
      uint64_t v15 = v24;
      *os_log_type_t v24 = v5;
      v15[1] = v6;
      v15[2] = v7;
      v15[3] = v8;
      v15[4] = v9;
      *((unsigned char *)v15 + 40) = v10;
      swift_retain();
      return swift_bridgeObjectRetain();
    }
    else
    {
      sub_259F7C520();
      swift_allocError();
      *(void *)(v16 + 8) = 0;
      *(void *)(v16 + 16) = 0;
      *(void *)uint64_t v16 = 9;
      *(unsigned char *)(v16 + 24) = 5;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t SQLiteStatement.bindIfAny(_:withName:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  char v23 = a2;
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  uint64_t v8 = v2[3];
  uint64_t v9 = v2[4];
  char v10 = *((unsigned char *)v2 + 40);
  uint64_t v17 = *v2;
  uint64_t v18 = v6;
  uint64_t v19 = v7;
  uint64_t v20 = v8;
  uint64_t v21 = v9;
  char v22 = v10;
  uint64_t result = sub_259F8F7CC();
  if (!v3)
  {
    uint64_t v12 = result;
    if (result)
    {
      uint64_t v16 = a1[4];
      os_log_type_t v13 = a1;
      uint64_t v14 = a1[3];
      __swift_project_boxed_opaque_existential_1(v13, v14);
      uint64_t v17 = v5;
      uint64_t v18 = v6;
      uint64_t v19 = v7;
      uint64_t v20 = v8;
      uint64_t v21 = v9;
      char v22 = v10;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 8))(&v17, v12, v14);
    }
    uint64_t v15 = v23;
    *char v23 = v5;
    v15[1] = v6;
    v15[2] = v7;
    v15[3] = v8;
    v15[4] = v9;
    *((unsigned char *)v15 + 40) = v10;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t SQLiteStatement.expectAtMostOneRow()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *(void *)a1 = *v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = xmmword_259FA4160;
  *(unsigned char *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();

  return swift_retain();
}

void SQLiteStatement.forEach(_:)(void (*a1)(uint64_t *))
{
  uint64_t v2 = *((void *)v1 + 2);
  char v3 = *((unsigned char *)v1 + 40);
  long long v4 = *v1;
  uint64_t v5 = v2;
  long long v6 = *(long long *)((char *)v1 + 24);
  char v7 = v3;
  sub_259F904E0((uint64_t *)&v4, a1);
}

void SQLiteStatement.reduce<A>(into:handleRow:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  long long v10 = v3[1];
  long long v11 = *v3;
  uint64_t v7 = *((void *)v3 + 4);
  char v8 = *((unsigned char *)v3 + 40);
  uint64_t v9 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a3, a1, a2);
  v12[0] = v11;
  v12[1] = v10;
  uint64_t v13 = v7;
  char v14 = v8;
  sub_259F904E0((uint64_t *)v12, (void (*)(uint64_t *))sub_259F90FF0);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, a2);
  }
}

double SQLiteStatement.init(database:statement:sqlString:verboseLog:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  type metadata accessor for SQLiteStatement.Context();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  *(void *)a6 = v12;
  *(void *)(a6 + 8) = a3;
  *(void *)(a6 + 16) = a4;
  double result = 0.0;
  *(_OWORD *)(a6 + 24) = xmmword_259FA4200;
  *(unsigned char *)(a6 + 40) = a5;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteStatement.execute()()
{
  long long v1 = v0[1];
  v4[2] = *v0;
  v5[0] = v1;
  *(_OWORD *)((char *)v5 + 9) = *(_OWORD *)((char *)v0 + 25);
  long long v2 = v0[1];
  long long v3 = *v0;
  v4[0] = v2;
  *(_OWORD *)((char *)v4 + 9) = *(_OWORD *)((char *)v0 + 25);
  sub_259F904E0((uint64_t *)&v3, (void (*)(uint64_t *))sub_259F8D64C);
}

uint64_t sub_259F8F788()
{
  long long v1 = *(sqlite3_stmt **)(v0 + 24);
  if (v1) {
    sqlite3_finalize(v1);
  }
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_259F8F7CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  if (v1 && *(void *)(v1 + 16))
  {
    long long v2 = *(sqlite3_stmt **)(*(void *)v0 + 24);
    if (v2)
    {
      uint64_t v3 = sub_259FA1FB0();
      int v4 = sqlite3_bind_parameter_index(v2, (const char *)(v3 + 32));
      swift_release();
      return v4;
    }
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 3;
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 4;
  }
  *(void *)uint64_t v6 = v7;
  *(void *)(v6 + 8) = 0;
  *(void *)(v6 + 16) = 0;
  *(unsigned char *)(v6 + 24) = 5;
  return swift_willThrow();
}

uint64_t SQLiteStatement.bind(_:at:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  char v9 = *((unsigned char *)v3 + 40);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  v16[0] = v5;
  v16[1] = v4;
  _OWORD v16[2] = v6;
  void v16[3] = v7;
  v16[4] = v8;
  char v17 = v9;
  uint64_t v12 = v18;
  uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v11 + 8))(v16, a2, v10, v11);
  if (!v12)
  {
    *(void *)a3 = v5;
    *(void *)(a3 + 8) = v4;
    *(void *)(a3 + 16) = v6;
    *(void *)(a3 + 24) = v7;
    *(void *)(a3 + 32) = v8;
    *(unsigned char *)(a3 + 40) = v9;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t SQLiteStatement.bind(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SQLiteStatement.bind(_:)(a1, a2);
}

{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void v17[5];
  char v18;
  uint64_t v19;

  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v19 = *v2;
    uint64_t v6 = v2[2];
    uint64_t v15 = v2[3];
    uint64_t v16 = v2[1];
    char v14 = v2[4];
    uint64_t v7 = (void *)(a1 + 32);
    uint64_t v8 = *((unsigned char *)v2 + 40);
    while (1)
    {
      ++v5;
      char v9 = v7[3];
      uint64_t v10 = v7[4];
      __swift_project_boxed_opaque_existential_1(v7, v9);
      v17[0] = v19;
      v17[1] = v16;
      _OWORD v17[2] = v6;
      v17[3] = v15;
      v17[4] = v14;
      uint64_t v18 = v8;
      uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v10 + 8))(v17, v5, v9, v10);
      if (v3) {
        break;
      }
      v7 += 5;
      if (v4 == v5)
      {
        *(void *)a2 = v19;
        *(void *)(a2 + 8) = v16;
        *(void *)(a2 + 16) = v6;
        *(void *)(a2 + 24) = v15;
        *(void *)(a2 + 32) = v14;
        *(unsigned char *)(a2 + 40) = v8;
        swift_retain();
        return swift_bridgeObjectRetain();
      }
    }
  }
  else
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v12 + 8) = 0;
    *(void *)(v12 + 16) = 0;
    *(void *)uint64_t v12 = 7;
    *(unsigned char *)(v12 + 24) = 5;
    return swift_willThrow();
  }
  return result;
}

uint64_t SQLiteStatement.reset()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (!v4 || !*(void *)(v4 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v17 = 4;
LABEL_10:
    *(void *)(v16 + 8) = 0;
    *(void *)(v16 + 16) = 0;
    *(void *)uint64_t v16 = v17;
    *(unsigned char *)(v16 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t v5 = *(sqlite3_stmt **)(v3 + 24);
  if (!v5)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v17 = 3;
    goto LABEL_10;
  }
  uint64_t v7 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v8 = v1[4];
  char v10 = *((unsigned char *)v1 + 40);
  int v20 = sqlite3_reset(*(sqlite3_stmt **)(v3 + 24));
  if (v20)
  {
    if (qword_26A401728 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_259FA1F20();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A401C90);
    uint64_t v12 = sub_259FA1F00();
    os_log_type_t v13 = sub_259FA21C0();
    if (os_log_type_enabled(v12, v13))
    {
      char v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)char v14 = 67109120;
      unsigned int v15 = v20;
      sub_259FA21F0();
      _os_log_impl(&dword_259F7A000, v12, v13, "Failed to reset a statement with error: %d", v14, 8u);
      MEMORY[0x25A2F1860](v14, -1, -1);
    }
    else
    {

      unsigned int v15 = v20;
    }
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v19 = v15;
    *(void *)(v19 + 8) = 0xD000000000000010;
    *(void *)(v19 + 16) = 0x8000000259FA3460;
    *(unsigned char *)(v19 + 24) = 0;
    return swift_willThrow();
  }
  sqlite3_clear_bindings(v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v10;
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_259F8FD7C(uint64_t a1, uint64_t a2)
{
  if (qword_26A401728 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_259FA1F20();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A401C90);
  sub_259F7FF98(a2);
  uint64_t v4 = sub_259FA1F00();
  os_log_type_t v5 = sub_259FA21C0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = *(void *)(a2 + 8);
    unint64_t v9 = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
    sub_259F90F1C(v8, v9, &v12);
    sub_259FA21F0();
    swift_bridgeObjectRelease();
    sub_259F80944(a2);
    _os_log_impl(&dword_259F7A000, v4, v5, "Unexpected result: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2F1860](v7, -1, -1);
    MEMORY[0x25A2F1860](v6, -1, -1);
  }
  else
  {
    sub_259F80944(a2);
  }

  sub_259F7C520();
  swift_allocError();
  *(_OWORD *)uint64_t v10 = xmmword_259FA43B0;
  *(void *)(v10 + 16) = 0x8000000259FA34D0;
  *(unsigned char *)(v10 + 24) = 0;
  return swift_willThrow();
}

void SQLiteStatement.executeAndReset()(uint64_t a1@<X8>)
{
  long long v4 = v1[1];
  long long v8 = *v1;
  v9[0] = v4;
  *(_OWORD *)((char *)v9 + 9) = *(long long *)((char *)v1 + 25);
  long long v5 = v1[1];
  long long v6 = *v1;
  v7[0] = v5;
  *(_OWORD *)((char *)v7 + 9) = *(long long *)((char *)v1 + 25);
  sub_259F904E0((uint64_t *)&v6, (void (*)(uint64_t *))sub_259F8DAB4);
  if (!v2)
  {
    long long v6 = v8;
    v7[0] = v9[0];
    *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v9 + 9);
    SQLiteStatement.reset()(a1);
  }
}

uint64_t SQLiteStatement.singleRowIfAny<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
  v10[0] = v5;
  v10[1] = v6;
  _OWORD v10[2] = v7;
  long long v11 = xmmword_259FA4160;
  char v12 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_259F904E0(v10, (void (*)(uint64_t *))sub_259F91054);
  swift_bridgeObjectRelease();
  if (!v3) {
    return swift_release();
  }
  swift_release();
  uint64_t v8 = sub_259FA21E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a2, v8);
}

uint64_t sub_259F90148(uint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_259FA21E0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (char *)&v15 - v12;
  uint64_t v16 = *a1;
  uint64_t result = a3(&v16);
  if (!v5)
  {
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v13, 0, 1, a5);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 40))(a2, v13, v10);
  }
  return result;
}

uint64_t SQLiteStatement.singleRow<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v5 = sub_259FA21E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v20 - v10;
  uint64_t v12 = *((void *)v2 + 2);
  char v13 = *((unsigned char *)v2 + 40);
  long long v20 = *v2;
  uint64_t v21 = v12;
  long long v22 = *(long long *)((char *)v2 + 24);
  char v23 = v13;
  uint64_t result = SQLiteStatement.singleRowIfAny<A>(_:)(a1, (uint64_t)&v20 - v10);
  if (!v3)
  {
    uint64_t v15 = v24;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    uint64_t v16 = *(void *)(a1 - 8);
    int v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 1, a1);
    uint64_t v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    if (v17 == 1)
    {
      v18(v9, v5);
      sub_259F7C520();
      swift_allocError();
      *(void *)(v19 + 8) = 0;
      *(void *)(v19 + 16) = 0;
      *(void *)uint64_t v19 = 5;
      *(unsigned char *)(v19 + 24) = 5;
      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v18)(v11, v5);
    }
    else
    {
      v18(v11, v5);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v15, v9, a1);
    }
  }
  return result;
}

void sub_259F904E0(uint64_t *a1, void (*a2)(uint64_t *))
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = a1[2];
  unint64_t v6 = a1[3];
  unint64_t v8 = a1[4];
  char v9 = *((unsigned char *)a1 + 40);
  uint64_t v14 = *a1;
  uint64_t v15 = v5;
  uint64_t v16 = v7;
  unint64_t v17 = v6;
  unint64_t v18 = v8;
  char v19 = v9;
  SQLiteStatement.nextRow()(&v20);
  if (!v2)
  {
    uint64_t v13 = v4;
    unint64_t v10 = v8;
    while (v20)
    {
      if (!v10)
      {
        sub_259F7C520();
        swift_allocError();
        *(void *)(v12 + 8) = 0;
        *(void *)(v12 + 16) = 0;
        *(void *)uint64_t v12 = 2;
        *(unsigned char *)(v12 + 24) = 5;
        swift_willThrow();
        swift_release();
        return;
      }
      uint64_t v14 = v20;
      a2(&v14);
      swift_release();
      --v10;
      uint64_t v14 = v13;
      uint64_t v15 = v5;
      uint64_t v16 = v7;
      unint64_t v17 = v6;
      unint64_t v18 = v8;
      char v19 = v9;
      SQLiteStatement.nextRow()(&v20);
    }
    if (v8 < v10)
    {
      __break(1u);
    }
    else if (v8 - v10 < v6)
    {
      sub_259F7C520();
      swift_allocError();
      *(void *)(v11 + 8) = 0;
      *(void *)(v11 + 16) = 0;
      *(void *)uint64_t v11 = 5;
      *(unsigned char *)(v11 + 24) = 5;
      swift_willThrow();
    }
  }
}

void SQLiteStatement.iterate(_:)(uint64_t (*a1)(void *))
{
  uint64_t v3 = v1[1];
  uint64_t v13 = *v1;
  uint64_t v5 = v1[2];
  unint64_t v4 = v1[3];
  unint64_t v6 = v1[4];
  char v7 = *((unsigned char *)v1 + 40);
  unint64_t v8 = v6;
  do
  {
    v14[0] = v13;
    v14[1] = v3;
    _OWORD v14[2] = v5;
    v14[3] = v4;
    v14[4] = v6;
    char v15 = v7;
    SQLiteStatement.nextRow()(&v16);
    if (v2) {
      break;
    }
    if (!v16)
    {
      if (v6 < v8)
      {
        __break(1u);
      }
      else if (v6 - v8 < v4)
      {
        sub_259F7C520();
        swift_allocError();
        *(void *)(v10 + 8) = 0;
        *(void *)(v10 + 16) = 0;
        *(void *)uint64_t v10 = 5;
        *(unsigned char *)(v10 + 24) = 5;
        swift_willThrow();
      }
      return;
    }
    if (!v8)
    {
      sub_259F7C520();
      swift_allocError();
      *(void *)(v11 + 8) = 0;
      *(void *)(v11 + 16) = 0;
      *(void *)uint64_t v11 = 2;
      *(unsigned char *)(v11 + 24) = 5;
      swift_willThrow();
      swift_release();
      return;
    }
    v14[0] = v16;
    char v9 = a1(v14);
    swift_release();
    --v8;
  }
  while ((v9 & 1) != 0);
}

void SQLiteStatement.reduce<A>(_:handleRow:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  long long v10 = v3[1];
  long long v11 = *v3;
  uint64_t v7 = *((void *)v3 + 4);
  char v8 = *((unsigned char *)v3 + 40);
  uint64_t v9 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a3, a1, a2);
  v12[0] = v11;
  v12[1] = v10;
  uint64_t v13 = v7;
  char v14 = v8;
  sub_259F904E0((uint64_t *)v12, (void (*)(uint64_t *))sub_259F91074);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, a2);
  }
}

uint64_t sub_259F908FC(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a5 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t *)MEMORY[0x270FA5388](v10);
  char v15 = (char *)&v18 - v14;
  uint64_t v16 = *v13;
  (*(void (**)(char *))(v9 + 16))(v12);
  uint64_t v19 = v16;
  a3(v12, &v19);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a5);
  if (!v5) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 40))(a2, v15, a5);
  }
  return result;
}

uint64_t SQLiteStatement.map<A>(_:)()
{
  return SQLiteStatement.compactMap<A>(_:)();
}

uint64_t SQLiteStatement.compactMap<A>(_:)()
{
  long long v6 = v0[1];
  long long v7 = *v0;
  uint64_t v2 = *((void *)v0 + 4);
  char v3 = *((unsigned char *)v0 + 40);
  uint64_t v11 = sub_259FA20E0();
  v8[0] = v7;
  v8[1] = v6;
  uint64_t v9 = v2;
  char v10 = v3;
  sub_259F904E0((uint64_t *)v8, (void (*)(uint64_t *))sub_259F91120);
  uint64_t v4 = v11;
  if (v1) {
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_259F90B94(uint64_t *a1, uint64_t (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a4;
  uint64_t v9 = sub_259FA21E0();
  uint64_t v22 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v24 = *(void *)(a5 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  char v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v21 - v16;
  uint64_t v25 = *a1;
  uint64_t result = a2(&v25);
  if (!v5)
  {
    uint64_t v19 = v22;
    uint64_t v20 = v24;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v12, 1, a5) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v9);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v12, a5);
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v15, v17, a5);
      sub_259FA2120();
      sub_259FA2110();
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v17, a5);
    }
  }
  return result;
}

uint64_t SQLiteStatement.expectRows()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *(void *)a1 = *v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = xmmword_259FA43C0;
  *(unsigned char *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t SQLiteStatement.expect(minRows:maxRows:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3[1];
  uint64_t v5 = v3[2];
  *(void *)a3 = *v3;
  *(void *)(a3 + 8) = v4;
  *(void *)(a3 + 16) = v5;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = a2;
  *(unsigned char *)(a3 + 40) = 0;
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t SQLiteStatement.dontExpectRows()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *(void *)a1 = *v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t SQLiteStatement.expectOneRow()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *(void *)a1 = *v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(1uLL);
  *(unsigned char *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_259F90F1C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_259F9135C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_259F91518((uint64_t)v12, *a3);
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
      sub_259F91518((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_259F90FF0(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t, uint64_t *))(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v5 = *a1;
  return v2(v3, &v5);
}

uint64_t type metadata accessor for SQLiteStatement.Context()
{
  return self;
}

uint64_t sub_259F91054(uint64_t *a1)
{
  return sub_259F90148(a1, *(void *)(v1 + 24), *(uint64_t (**)(uint64_t *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t sub_259F91074(uint64_t a1)
{
  return sub_259F908FC(a1, *(void *)(v1 + 24), *(void (**)(char *, uint64_t *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

void *sub_259F91094@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  void *(*v5)(void *__return_ptr, uint64_t *);
  uint64_t v6;
  void *result;
  uint64_t v8;

  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *(**)(void *__return_ptr, uint64_t *))(v2 + 24);
  uint64_t v8 = *a1;
  uint64_t result = v5(a2, &v8);
  if (!v3) {
    return (void *)(*(uint64_t (**)(void *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a2, 0, 1, v6);
  }
  return result;
}

uint64_t sub_259F91120(uint64_t *a1)
{
  return sub_259F90B94(a1, *(uint64_t (**)(uint64_t *))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t destroy for SQLiteStatement()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLiteStatement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SQLiteStatement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SQLiteStatement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteStatement(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteStatement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteStatement()
{
  return &type metadata for SQLiteStatement;
}

uint64_t sub_259F9135C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_259FA2200();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_259F91574(a5, a6);
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
  uint64_t v8 = sub_259FA22C0();
  if (!v8)
  {
    sub_259FA2350();
    __break(1u);
LABEL_17:
    uint64_t result = sub_259FA23A0();
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

uint64_t sub_259F91518(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_259F91574(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_259F9160C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_259F91784(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_259F91784(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_259F9160C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_259F973EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_259FA22A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_259FA2350();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_259FA2030();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_259FA23A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_259FA2350();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_259F91784(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A401AD8);
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
  uint64_t result = sub_259FA23A0();
  __break(1u);
  return result;
}

uint64_t String.init(with:column:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 4;
LABEL_9:
    *(void *)uint64_t v6 = v7;
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(unsigned char *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  unint64_t v3 = *(sqlite3_stmt **)(*(void *)a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 3;
    goto LABEL_9;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t result = (uint64_t)sqlite3_column_text(v3, a2);
  if (result) {
    return sub_259FA2020();
  }
  return result;
}

uint64_t sub_259F919D4@<X0>(uint64_t *a1@<X8>)
{
  return sub_259F91A44((uint64_t (*)(void))String.init(with:column:), a1);
}

uint64_t *Data.init(with:column:)(uint64_t *a1, uint64_t a2)
{
  return sub_259F91F44(a1, a2);
}

uint64_t sub_259F91A18@<X0>(uint64_t *a1@<X8>)
{
  return sub_259F91A44((uint64_t (*)(void))sub_259F91F44, a1);
}

uint64_t sub_259F91A44@<X0>(uint64_t (*a1)(void)@<X5>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t *sub_259F91F44(uint64_t *result, uint64_t iCol)
{
  uint64_t v2 = *result;
  uint64_t v3 = *(void *)(*result + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v10 = 4;
LABEL_9:
    *(void *)uint64_t v9 = v10;
    *(void *)(v9 + 8) = 0;
    *(void *)(v9 + 16) = 0;
    *(unsigned char *)(v9 + 24) = 5;
    swift_willThrow();
    return (uint64_t *)swift_release();
  }
  unint64_t v4 = *(sqlite3_stmt **)(v2 + 24);
  if (!v4)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v10 = 3;
    goto LABEL_9;
  }
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (iCol > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t v6 = sqlite3_column_blob(*(sqlite3_stmt **)(v2 + 24), iCol);
  if (v6)
  {
    uint64_t v7 = v6;
    swift_release();
    int v8 = sqlite3_column_bytes(v4, iCol);
    return (uint64_t *)sub_259F82E14(v7, v8);
  }
  else
  {
    SQLiteRow.type(at:)(iCol);
    uint64_t result = (uint64_t *)swift_release();
    if (!v11) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_259F920A8(uint64_t a1)
{
  unint64_t result = sub_259F7C6F4();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of SQLiteUnsafeType.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t SQLiteVTab.init(style:)(char *a1)
{
  char v2 = *a1;
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 40) = v2;
  uint64_t v3 = swift_slowAlloc();
  *(void *)(v1 + 32) = v3;
  int v4 = (*(uint64_t (**)(void))(*(void *)v1 + 256))();
  unsigned int v5 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v6 = sub_259F92BDC;
  if (!*(unsigned char *)(v1 + 40)) {
    goto LABEL_4;
  }
  if (v5 == 1)
  {
    uint64_t v6 = sub_259F92BE0;
LABEL_4:
    uint64_t v7 = v6;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
LABEL_6:
  if (v5 >= 2) {
    int v8 = 0;
  }
  else {
    int v8 = sub_259F92CE8;
  }
  *(_DWORD *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = v7;
  *(void *)(v3 + 16) = sub_259F92BE0;
  *(void *)(v3 + 24) = sub_259F92C6C;
  *(void *)(v3 + 32) = sub_259F92CE8;
  *(void *)(v3 + 40) = v8;
  *(void *)(v3 + 48) = sub_259F92D54;
  *(void *)(v3 + 56) = sub_259F92E24;
  *(void *)(v3 + 64) = sub_259F92E68;
  *(void *)(v3 + 72) = sub_259F92F54;
  *(void *)(v3 + 80) = sub_259F93000;
  *(void *)(v3 + 88) = sub_259F9308C;
  *(void *)(v3 + 96) = sub_259F9314C;
  *(_OWORD *)(v3 + 104) = 0u;
  *(_OWORD *)(v3 + 120) = 0u;
  *(_OWORD *)(v3 + 136) = 0u;
  *(_OWORD *)(v3 + 152) = 0u;
  *(_OWORD *)(v3 + 168) = 0u;
  *(void *)(v3 + 184) = 0;
  return v1;
}

uint64_t SQLiteVTab.deinit()
{
  uint64_t v1 = v0;
  MEMORY[0x25A2F1860](*(void *)(v0 + 32), -1, -1);
  if (qword_26A401728 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259FA1F20();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A401C90);
  swift_retain_n();
  uint64_t v3 = sub_259FA1F00();
  os_log_type_t v4 = sub_259FA21B0();
  if (os_log_type_enabled(v3, v4))
  {
    unsigned int v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)unsigned int v5 = 136315138;
    swift_beginAccess();
    if (*(void *)(v1 + 24))
    {
      uint64_t v7 = *(void *)(v1 + 16);
      unint64_t v8 = *(void *)(v1 + 24);
    }
    else
    {
      unint64_t v8 = 0x8000000259FA36E0;
      uint64_t v7 = 0xD000000000000010;
    }
    swift_bridgeObjectRetain();
    sub_259F90F1C(v7, v8, &v10);
    sub_259FA21F0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259F7A000, v3, v4, "Destroying vtable module with name %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2F1860](v6, -1, -1);
    MEMORY[0x25A2F1860](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_259F9246C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_259F924B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v4 = v3;
  swift_beginAccess();
  v4[2] = a1;
  _OWORD v4[3] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v8 = *(sqlite3 **)(a3 + 16);
  uint64_t v9 = (const sqlite3_module *)v4[4];
  uint64_t v10 = (const char *)(sub_259FA1FB0() + 32);
  swift_retain();
  LODWORD(v4) = sqlite3_create_module_v2(v8, v10, v9, v4, (void (__cdecl *)(void *))sub_259F93220);
  uint64_t result = swift_release();
  if (v4)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v12 = a1;
    *(void *)(v12 + 8) = a2;
    *(void *)(v12 + 16) = 0;
    *(unsigned char *)(v12 + 24) = 2;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_259F925D0(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + 16);
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *(void *)(v1 + 24);
  if (v5)
  {
    uint64_t v6 = *v3;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_259F9290C(v6, v5, a1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_259F92650()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

void *SQLiteVTab.Connection.init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v7 = sub_259FA1F80();
  MEMORY[0x270FA5388](v7 - 8);
  if (a2 < 3)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v8 = 0xD00000000000001CLL;
    uint64_t v9 = "Invalid number of parameters";
LABEL_8:
    unint64_t v12 = (unint64_t)(v9 - 32) | 0x8000000000000000;
    goto LABEL_9;
  }
  if (!*(void *)(a3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v8 = 0x7463657078656E55;
    unint64_t v12 = 0xEE006C696E206465;
LABEL_9:
    *(void *)(v8 + 8) = v12;
    *(void *)(v8 + 16) = 0;
    *(unsigned char *)(v8 + 24) = 4;
    swift_willThrow();
    swift_release();
    type metadata accessor for SQLiteVTab.Connection();
    swift_deallocPartialClassInstance();
    return v3;
  }
  sub_259FA1F70();
  uint64_t v10 = sub_259FA1F60();
  if (!v11)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v8 = 0xD000000000000014;
    uint64_t v9 = "Cannot create string";
    goto LABEL_8;
  }
  v3[2] = v10;
  v3[3] = v11;
  v3[4] = a1;
  return v3;
}

uint64_t SQLiteVTab.Connection.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t SQLiteVTab.Cursor.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = a1;
  return v1;
}

uint64_t SQLiteVTab.Cursor.deinit()
{
  swift_release();
  return v0;
}

uint64_t sub_259F92890()
{
  *(void *)(v0 + 16) = 0;
  return 0;
}

uint64_t sub_259F9289C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0 + 16) = v3;
    return 0;
  }
  return result;
}

BOOL sub_259F928B8()
{
  uint64_t v1 = v0[2];
  return v1 < (*(uint64_t (**)(void))(*v0 + 168))();
}

uint64_t sub_259F92904()
{
  return 0;
}

uint64_t sub_259F9290C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_259FA2280();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = sub_259FA22C0();
    }
    sub_259F8E7F4(v5, v6, (uint64_t (*)(void))sub_259F9392C);
    return swift_release();
  }
  v9[0] = a1;
  v9[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  v8[0] = (const char *)v9;
  v8[1] = 0;
  sqlite3_drop_modules(*(sqlite3 **)(a3 + 16), v8);
  return swift_release();
}

BOOL static SQLiteVTab.Style.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SQLiteVTab.Style.hash(into:)()
{
  return sub_259FA2480();
}

uint64_t SQLiteVTab.Style.hashValue.getter()
{
  return sub_259FA24A0();
}

BOOL sub_259F92AB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_259F92AC4()
{
  return sub_259FA24A0();
}

uint64_t sub_259F92B0C()
{
  return sub_259FA2480();
}

uint64_t sub_259F92B38()
{
  return sub_259FA24A0();
}

uint64_t sub_259F92B7C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259F92BE4(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  if (!a1 || !a2 || !a5 || !a4 || !a6) {
    return 1;
  }
  swift_retain();
  uint64_t v10 = sub_259F9396C(a1, a3, a4, a5);
  swift_release();
  return v10;
}

uint64_t sub_259F92C6C(uint64_t a1, uint64_t a2)
{
  if (!a1 || !a2) {
    return 1;
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 24) + 104);
  swift_retain();
  uint64_t v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t sub_259F92CE8(void **a1)
{
  if (!a1) {
    return 1;
  }
  (*(void (**)(void))(*a1[3] + 112))();
  swift_release();
  sqlite3_free(a1);
  return 0;
}

uint64_t sub_259F92D54(uint64_t a1, uint64_t *a2)
{
  uint64_t result = 1;
  if (a1 && a2)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    uint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)v5 + 136);
    uint64_t v7 = swift_retain();
    uint64_t v8 = v6(v7);
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(v8 + 120))(v5);
    uint64_t v10 = sub_259F87150(v9);
    swift_release();
    *a2 = v10;
    if (v10) {
      return 0;
    }
    else {
      return 7;
    }
  }
  return result;
}

uint64_t sub_259F92E24(void *a1)
{
  if (!a1) {
    return 1;
  }
  swift_release();
  sqlite3_free(a1);
  return 0;
}

uint64_t sub_259F92E68(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  if (!a1) {
    return 1;
  }
  uint64_t v8 = Array<A>.init(_:argc:)(a5, a4);
  uint64_t v9 = (void *)MEMORY[0x25A2F1180]();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 8) + 128);
  swift_retain();
  uint64_t v11 = v10(a2, a3, v8);
  swift_release();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_259F92F54(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v2 = (void *)MEMORY[0x25A2F1180]();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 8) + 136);
  uint64_t v4 = swift_retain();
  uint64_t v5 = v3(v4);
  swift_release();
  return v5;
}

BOOL sub_259F93000(uint64_t a1)
{
  BOOL v1 = 1;
  if (a1)
  {
    uint64_t v3 = (void *)MEMORY[0x25A2F1180]();
    uint64_t v4 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 8) + 144);
    uint64_t v5 = swift_retain();
    LOBYTE(v4) = v4(v5);
    swift_release();
    BOOL v1 = (v4 & 1) == 0;
  }
  return v1;
}

uint64_t sub_259F9308C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 1;
  if (a1 && a2)
  {
    uint64_t v7 = (void *)MEMORY[0x25A2F1180]();
    uint64_t v8 = *(void *)(a1 + 8);
    swift_retain();
    uint64_t v10 = a2;
    uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v8 + 160))(a3, &v10);
    swift_release();
  }
  return v3;
}

uint64_t sub_259F9314C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = 1;
  if (a1)
  {
    if (a2)
    {
      uint64_t v5 = (void *)MEMORY[0x25A2F1180](1);
      uint64_t v6 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 8) + 152);
      uint64_t v7 = swift_retain();
      uint64_t v8 = v6(v7);
      swift_release();
      *a2 = v8;
      return 0;
    }
  }
  return result;
}

uint64_t SQLiteVTab.__allocating_init(style:)(char *a1)
{
  uint64_t v2 = swift_allocObject();
  SQLiteVTab.init(style:)(a1);
  return v2;
}

uint64_t sub_259F93220(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t SQLiteVTab.__deallocating_deinit()
{
  SQLiteVTab.deinit();

  return swift_deallocClassInstance();
}

uint64_t SQLiteVTab.Connection.tableName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SQLiteVTab.Connection.table.getter()
{
  return swift_retain();
}

uint64_t SQLiteVTab.Connection.__allocating_init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  SQLiteVTab.Connection.init(_:argc:argv:)(a1, a2, a3);
  return v6;
}

uint64_t sub_259F93304()
{
  return 0;
}

uint64_t SQLiteVTab.Connection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t SQLiteVTab.Cursor.connection.getter()
{
  return swift_retain();
}

uint64_t SQLiteVTab.Cursor.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t SQLiteVTab.Cursor.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SQLiteVTab.Connection()
{
  return self;
}

unint64_t sub_259F933F8()
{
  unint64_t result = qword_26A401AE0;
  if (!qword_26A401AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401AE0);
  }
  return result;
}

uint64_t sub_259F9344C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for SQLiteVTab()
{
  return self;
}

uint64_t method lookup function for SQLiteVTab(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SQLiteVTab);
}

uint64_t dispatch thunk of SQLiteVTab.moduleName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of SQLiteVTab.__allocating_init(style:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SQLiteVTab.register(_:database:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of SQLiteVTab.unregister(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of SQLiteVTab.version()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t getEnumTagSinglePayload for SQLiteVTab.Style(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SQLiteVTab.Style(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259F936F4);
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

ValueMetadata *type metadata accessor for SQLiteVTab.Style()
{
  return &type metadata for SQLiteVTab.Style;
}

uint64_t method lookup function for SQLiteVTab.Connection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SQLiteVTab.Connection);
}

uint64_t dispatch thunk of SQLiteVTab.Connection.__allocating_init(_:argc:argv:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SQLiteVTab.Connection.bestIndex(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of SQLiteVTab.Connection.onDisconnect()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t type metadata accessor for SQLiteVTab.Cursor()
{
  return self;
}

uint64_t method lookup function for SQLiteVTab.Cursor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SQLiteVTab.Cursor);
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.filter(idxNum:idxStr:arguments:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.next()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.hasMoreRows()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.rowid()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.setValue(forColumn:on:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.rowCount()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t sub_259F9392C(const char *a1)
{
  int v3 = a1;
  return sqlite3_drop_modules(*(sqlite3 **)(v1 + 16), &v3);
}

uint64_t sub_259F9396C(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*(uint64_t (**)(void))(*(void *)v4 + 264))() + 96);
  uint64_t v10 = swift_retain();
  uint64_t v11 = v9(v10, a2, a3);
  sub_259FA2290();
  sub_259FA2000();
  swift_bridgeObjectRetain();
  sub_259FA2000();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_259FA2000();
  (*(void (**)(uint64_t))(*(void *)v11 + 128))(v12);
  sub_259FA2000();
  swift_bridgeObjectRelease();
  sub_259FA2000();
  uint64_t v14 = sub_259FA1FB0();
  swift_bridgeObjectRelease();
  uint64_t v15 = sqlite3_declare_vtab(a1, (const char *)(v14 + 32));
  swift_release();
  if (v15)
  {
    swift_release();
  }
  else
  {
    uint64_t v16 = sub_259F82240(v11);
    *a4 = v16;
    swift_release();
    if (v16) {
      return 0;
    }
    else {
      return 7;
    }
  }
  return v15;
}

void static SQLiteInteger32<>.sqlColumnType.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

{
  *a1 = 4;
}

void static SQLiteInteger64.associatedSQLDataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static SQLiteInteger64<>.sqlColumnType.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

{
  *a1 = 5;
}

uint64_t sub_259F93BC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BD8);
  uint64_t result = sub_259F9C068(&qword_26A401BE0, &qword_26A401BD8);
  *(void *)(a3 + 32) = result;
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t result = sub_259F974D0(a1, a2, 10);
    if ((result & 0x10000) != 0)
    {
      swift_bridgeObjectRetain();
      unsigned int v8 = sub_259F98804(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F97A98);
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      unsigned int v8 = result;
    }
    int v9 = (v8 >> 8) & 1;
    if (v9) {
      char v10 = 0;
    }
    else {
      char v10 = v8;
    }
  }
  else
  {
    char v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(unsigned char *)a3 = v10;
  *(unsigned char *)(a3 + 1) = v9;
  return result;
}

uint64_t sub_259F93CC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BC8);
  uint64_t result = sub_259F9C068(&qword_26A401BD0, &qword_26A401BC8);
  *(void *)(a3 + 32) = result;
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t result = sub_259F98254(a1, a2, 10);
    if ((result & 0x10000) != 0)
    {
      swift_bridgeObjectRetain();
      unsigned int v8 = sub_259F98804(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F98964);
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      unsigned int v8 = result;
    }
    int v9 = (v8 >> 8) & 1;
    if (v9) {
      char v10 = 0;
    }
    else {
      char v10 = v8;
    }
  }
  else
  {
    char v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(unsigned char *)a3 = v10;
  *(unsigned char *)(a3 + 1) = v9;
  return result;
}

uint64_t sub_259F93DC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BB8);
  uint64_t result = sub_259F9C068(&qword_26A401BC0, &qword_26A401BB8);
  *(void *)(a3 + 32) = result;
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t result = sub_259F98C0C(a1, a2, 10);
    int v8 = result;
    if ((result & 0x1000000) != 0)
    {
      swift_bridgeObjectRetain();
      int v8 = sub_259F99A38(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F991D4);
      uint64_t result = swift_bridgeObjectRelease();
    }
    unsigned int v9 = (v8 & 0x10000u) >> 16;
    if ((v8 & 0x10000) != 0) {
      __int16 v10 = 0;
    }
    else {
      __int16 v10 = v8;
    }
  }
  else
  {
    __int16 v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_WORD *)a3 = v10;
  *(unsigned char *)(a3 + 2) = v9 & 1;
  return result;
}

uint64_t sub_259F93EC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BA8);
  uint64_t result = sub_259F9C068(&qword_26A401BB0, &qword_26A401BA8);
  *(void *)(a3 + 32) = result;
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t result = sub_259F99488(a1, a2, 10);
    int v8 = result;
    if ((result & 0x1000000) != 0)
    {
      swift_bridgeObjectRetain();
      int v8 = sub_259F99A38(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F99B90);
      uint64_t result = swift_bridgeObjectRelease();
    }
    unsigned int v9 = (v8 & 0x10000u) >> 16;
    if ((v8 & 0x10000) != 0) {
      __int16 v10 = 0;
    }
    else {
      __int16 v10 = v8;
    }
  }
  else
  {
    __int16 v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_WORD *)a3 = v10;
  *(unsigned char *)(a3 + 2) = v9 & 1;
  return result;
}

uint64_t sub_259F93FC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401B98);
  uint64_t result = sub_259F9C068(&qword_26A401BA0, &qword_26A401B98);
  *(void *)(a3 + 32) = result;
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t result = sub_259F99E38(a1, a2, 10);
    uint64_t v8 = result;
    if ((result & 0x10000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_259F9AB48(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F9A380);
      uint64_t result = swift_bridgeObjectRelease();
    }
    unint64_t v9 = (v8 & 0x100000000uLL) >> 32;
    if ((v8 & 0x100000000) != 0) {
      int v10 = 0;
    }
    else {
      int v10 = v8;
    }
  }
  else
  {
    int v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_DWORD *)a3 = v10;
  *(unsigned char *)(a3 + 4) = v9 & 1;
  return result;
}

uint64_t sub_259F940C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401B88);
  uint64_t result = sub_259F9C068(&qword_26A401B90, &qword_26A401B88);
  *(void *)(a3 + 32) = result;
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t result = sub_259F9A600(a1, a2, 10);
    uint64_t v8 = result;
    if ((result & 0x10000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_259F9AB48(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F9ACB0);
      uint64_t result = swift_bridgeObjectRelease();
    }
    unint64_t v9 = (v8 & 0x100000000uLL) >> 32;
    if ((v8 & 0x100000000) != 0) {
      int v10 = 0;
    }
    else {
      int v10 = v8;
    }
  }
  else
  {
    int v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_DWORD *)a3 = v10;
  *(unsigned char *)(a3 + 4) = v9 & 1;
  return result;
}

uint64_t static SQLiteInteger32.create(from:)@<X0>(uint64_t *a1@<X8>)
{
  return sub_259F94408(a1);
}

uint64_t sub_259F941D8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)(a5 + 24) = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t result = sub_259F9C068(a4, a3);
  *(void *)(a5 + 32) = result;
  uint64_t v11 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v11 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    uint64_t result = sub_259F9B000(a1, a2, 10);
    if ((v12 & 0x100) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_259F9BD5C(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F9B570);
      char v16 = v15;
      uint64_t result = swift_bridgeObjectRelease();
      int v14 = v16 & 1;
    }
    else
    {
      uint64_t v13 = result;
      int v14 = v12 & 1;
    }
    if (v14) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = v13;
    }
  }
  else
  {
    uint64_t v17 = 0;
    LOBYTE(v14) = 1;
  }
  *(void *)a5 = v17;
  *(unsigned char *)(a5 + 8) = v14;
  return result;
}

uint64_t sub_259F942E4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)(a5 + 24) = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t result = sub_259F9C068(a4, a3);
  *(void *)(a5 + 32) = result;
  uint64_t v11 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v11 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    uint64_t result = sub_259F9B7EC(a1, a2, 10);
    if ((v12 & 0x100) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_259F9BD5C(a1, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_259F9BDEC);
      char v16 = v15;
      uint64_t result = swift_bridgeObjectRelease();
      int v14 = v16 & 1;
    }
    else
    {
      uint64_t v13 = result;
      int v14 = v12 & 1;
    }
    if (v14) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = v13;
    }
  }
  else
  {
    uint64_t v17 = 0;
    LOBYTE(v14) = 1;
  }
  *(void *)a5 = v17;
  *(unsigned char *)(a5 + 8) = v14;
  return result;
}

uint64_t static SQLiteInteger64.create(from:)@<X0>(uint64_t *a1@<X8>)
{
  return sub_259F94408(a1);
}

uint64_t sub_259F94408@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = sub_259FA21E0();
  a1[4] = swift_getWitnessTable();
  __swift_allocate_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRetain();
  return sub_259FA23D0();
}

uint64_t sub_259F944D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259F9C210(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t SQLiteInteger32.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  int v10 = &v31[-v9];
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  char v15 = &v31[-v14];
  uint64_t v16 = *(void *)(*(void *)v11 + 16);
  if (!v16 || !*(void *)(v16 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v25 = 4;
LABEL_12:
    *(void *)uint64_t v24 = v25;
    *(void *)(v24 + 8) = 0;
    *(void *)(v24 + 16) = 0;
    *(unsigned char *)(v24 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v17 = *(sqlite3_stmt **)(*(void *)v11 + 24);
  if (!v17)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v25 = 3;
    goto LABEL_12;
  }
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    int v19 = sqlite3_column_int(v17, a2);
    if (a3 == MEMORY[0x263F8E548]) {
      goto LABEL_20;
    }
    sub_259FA2340();
    char v20 = sub_259FA2250();
    uint64_t v21 = sub_259FA2240();
    if (v20)
    {
      if (v21 > 32)
      {
        int v35 = v19;
        sub_259F94940();
        sub_259FA2220();
        char v22 = sub_259FA1F40();
        uint64_t v23 = *(void (**)(unsigned char *, uint64_t))(v33 + 8);
        v23(v10, a3);
        v23(v15, a3);
        if (v22) {
          goto LABEL_22;
        }
LABEL_20:
        int v36 = v19;
        sub_259F94940();
        return sub_259FA2260();
      }
    }
    else if (v21 > 31)
    {
      int v37 = v19;
      uint64_t v27 = v33;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v33 + 16))(v7, v15, a3);
      if (v19 < 0)
      {
        uint64_t v29 = *(void (**)(unsigned char *, uint64_t))(v27 + 8);
        v29(v7, a3);
        v29(v15, a3);
      }
      else
      {
        sub_259F94940();
        sub_259FA2220();
        int v32 = sub_259FA1F40();
        uint64_t v28 = *(void (**)(unsigned char *, uint64_t))(v27 + 8);
        v28(v10, a3);
        v28(v7, a3);
        v28(v15, a3);
        if ((v32 & 1) == 0) {
          goto LABEL_20;
        }
      }
LABEL_22:
      sub_259F7C520();
      swift_allocError();
      *(void *)(v30 + 8) = 0;
      *(void *)(v30 + 16) = 0;
      *(void *)uint64_t v30 = 8;
      *(unsigned char *)(v30 + 24) = 5;
      return swift_willThrow();
    }
    int v26 = sub_259FA2230();
    (*(void (**)(unsigned char *, uint64_t))(v33 + 8))(v15, a3);
    if (v19 < v26) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

unint64_t sub_259F94940()
{
  unint64_t result = qword_26A401AE8;
  if (!qword_26A401AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401AE8);
  }
  return result;
}

uint64_t sub_259F94994(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F949CC((uint64_t)&v5, a2, *v2);
}

uint64_t sub_259F949CC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F94AE8(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F94C04(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F94D1C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F94E38(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F94F54(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_10:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_10;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a3 < 0)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t SQLiteInteger32.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v84 = a2;
  uint64_t v83 = *(void *)(*(void *)(a4 + 16) + 8);
  uint64_t v8 = *(void *)(*(void *)(v83 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = *(void *)(a3 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v15 = (char *)v69 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  char v22 = (char *)v69 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  v85 = (char *)v69 - v29;
  uint64_t v30 = *(void *)(*(void *)a1 + 16);
  if (!v30 || !*(void *)(v30 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v41 = 4;
LABEL_12:
    *(void *)(v40 + 8) = 0;
    *(void *)(v40 + 16) = 0;
    *(void *)uint64_t v40 = v41;
    *(unsigned char *)(v40 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t v31 = *(sqlite3_stmt **)(*(void *)a1 + 24);
  if (!v31)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v41 = 3;
    goto LABEL_12;
  }
  if (v84 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v84 > 0x7FFFFFFF)
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v71 = v23;
  uint64_t v72 = v8;
  uint64_t v73 = v25;
  v74 = v15;
  v75 = v24;
  v76 = v28;
  v78 = v26;
  v79 = v27;
  v77 = v31;
  int v32 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v33 = v85;
  v32(v85, v4, a3);
  char v34 = sub_259FA2250();
  v81 = (void (*)(uint64_t, char *, uint64_t))v32;
  uint64_t v82 = v11 + 16;
  v32(v22, (uint64_t)v33, a3);
  uint64_t v80 = v11;
  if ((v34 & 1) == 0)
  {
    uint64_t v5 = *(void (**)(char *, uint64_t))(v11 + 8);
    v5(v22, a3);
    uint64_t v43 = v85;
    uint64_t v39 = v79;
    goto LABEL_29;
  }
  uint64_t v35 = sub_259FA2240();
  uint64_t v36 = v11 + 8;
  v70 = *(void (**)(char *, uint64_t))(v11 + 8);
  v70(v22, a3);
  if (v35 <= 32)
  {
    uint64_t v43 = v85;
    uint64_t v39 = v79;
    uint64_t v5 = v70;
    goto LABEL_29;
  }
  int v37 = v75;
  v81((uint64_t)v75, v85, a3);
  signed int v86 = 0x80000000;
  char v38 = sub_259FA2250();
  uint64_t v39 = v79;
  if (v38)
  {
    if (sub_259FA2240() < 32)
    {
LABEL_23:
      signed int v48 = sub_259FA2230();
      uint64_t v5 = v70;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v70)(v37, a3);
      BOOL v49 = v86 <= v48;
LABEL_26:
      uint64_t v43 = v85;
      if (!v49) {
        goto LABEL_47;
      }
      goto LABEL_29;
    }
  }
  else
  {
    char v44 = sub_259FA2250();
    uint64_t v45 = sub_259FA2240();
    if ((v44 & 1) == 0)
    {
      if (v45 >= 32)
      {
        uint64_t v5 = v70;
        v70(v37, a3);
        uint64_t v43 = v85;
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    v69[1] = v36;
    if (v45 <= 32)
    {
      swift_getAssociatedConformanceWitness();
      sub_259FA2410();
      uint64_t v50 = v76;
      sub_259FA23F0();
      char v51 = sub_259FA1F40();
      uint64_t v5 = v70;
      v70(v50, a3);
      uint64_t v4 = v73;
      (*(void (**)(uint64_t, char *, uint64_t))(v80 + 32))(v73, v37, a3);
      if (v51)
      {
LABEL_46:
        uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v5)(v4, a3);
LABEL_47:
        __break(1u);
        return result;
      }
      signed int v52 = v86;
      signed int v53 = sub_259FA2230();
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v5)(v4, a3);
      BOOL v49 = v52 <= v53;
      goto LABEL_26;
    }
  }
  sub_259F94940();
  unint64_t v46 = v76;
  sub_259FA2220();
  char v47 = sub_259FA1F40();
  uint64_t v5 = v70;
  v70(v46, a3);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v5)(v37, a3);
  uint64_t v43 = v85;
  if (v47) {
    goto LABEL_47;
  }
LABEL_29:
  uint64_t v54 = sub_259FA2240();
  uint64_t v55 = v78;
  v81((uint64_t)v78, v43, a3);
  if (v54 >= 33)
  {
    v5(v55, a3);
    goto LABEL_31;
  }
  uint64_t v63 = sub_259FA2240();
  v5(v55, a3);
  if (v63 == 32 && (sub_259FA2250() & 1) == 0)
  {
LABEL_31:
    v81((uint64_t)v39, v43, a3);
    int v88 = 0x7FFFFFFF;
    char v56 = sub_259FA2250();
    uint64_t v57 = sub_259FA2240();
    if (v56)
    {
      if (v57 > 32)
      {
        sub_259F94940();
        uint64_t v58 = v5;
        uint64_t v59 = v76;
        uint64_t v4 = a3;
        sub_259FA2220();
        char v60 = sub_259FA1F40();
        int64_t v61 = v59;
        uint64_t v5 = v58;
        v58(v61, a3);
        uint64_t v62 = v39;
        goto LABEL_40;
      }
    }
    else if (v57 > 31)
    {
      int v87 = 0x7FFFFFFF;
      uint64_t v58 = v5;
      v64 = v76;
      (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v76, v39, a3);
      sub_259F94940();
      uint64_t v65 = v74;
      uint64_t v4 = a3;
      sub_259FA2220();
      char v60 = sub_259FA1F40();
      v58(v65, a3);
      uint64_t v62 = v64;
      uint64_t v5 = v58;
LABEL_40:
      v58(v62, a3);
      if ((v60 & 1) == 0) {
        goto LABEL_41;
      }
      goto LABEL_45;
    }
    sub_259FA2230();
    v5(v39, a3);
  }
LABEL_41:
  int v66 = sub_259FA2230();
  v5(v43, a3);
  uint64_t result = sqlite3_bind_int(v77, v84, v66);
  if (result)
  {
    uint64_t v67 = result;
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v68 = v67;
    *(void *)(v68 + 8) = 0xD000000000000012;
    *(void *)(v68 + 16) = 0x8000000259FA2FB0;
    *(unsigned char *)(v68 + 24) = 0;
    return swift_willThrow();
  }
  return result;
}

void sub_259F95A38(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_259F95A44@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F93BC0(a1, a2, a3);
}

uint64_t sub_259F95A5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259F9C580(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_259F95A8C(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F94D1C((uint64_t)&v5, a2, *v2);
}

void sub_259F95AC4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_259F95AD0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F93CC0(a1, a2, a3);
}

uint64_t sub_259F95AE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  uint64_t result = sub_259F9C350(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_259F95B18(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F94AE8((uint64_t)&v5, a2, *v2);
}

uint64_t sub_259F95B50@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F93DC0(a1, a2, a3);
}

uint64_t sub_259F95B68@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  uint64_t result = sub_259F9C708(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_259F95B98(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F94E38((uint64_t)&v5, a2, *v2);
}

uint64_t sub_259F95BD0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F93EC0(a1, a2, a3);
}

uint64_t sub_259F95BE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t result = sub_259F9C490(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_259F95C18(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F94C04((uint64_t)&v5, a2, *v2);
}

uint64_t sub_259F95C50@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F93FC0(a1, a2, a3);
}

uint64_t sub_259F95C68@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t result = sub_259F9C844(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_259F95C98(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F94F54((uint64_t)&v5, a2, *v2);
}

uint64_t sub_259F95CD0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F940C0(a1, a2, a3);
}

sqlite3_int64 sub_259F95CE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, sqlite3_int64 *a3@<X8>)
{
  sqlite3_int64 result = sub_259F9CFF8(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t SQLiteInteger64.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = &v31[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = &v31[-v9];
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  char v15 = &v31[-v14];
  uint64_t v16 = *(void *)(*(void *)v11 + 16);
  if (!v16 || !*(void *)(v16 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v25 = 4;
LABEL_12:
    *(void *)uint64_t v24 = v25;
    *(void *)(v24 + 8) = 0;
    *(void *)(v24 + 16) = 0;
    *(unsigned char *)(v24 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v17 = *(sqlite3_stmt **)(*(void *)v11 + 24);
  if (!v17)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v25 = 3;
    goto LABEL_12;
  }
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    sqlite3_int64 v19 = sqlite3_column_int64(v17, a2);
    if (a3 == MEMORY[0x263F8E5C0]) {
      goto LABEL_20;
    }
    sub_259FA2340();
    char v20 = sub_259FA2250();
    uint64_t v21 = sub_259FA2240();
    if (v20)
    {
      if (v21 > 64)
      {
        sqlite3_int64 v35 = v19;
        sub_259F96158();
        sub_259FA2220();
        char v22 = sub_259FA1F40();
        uint64_t v23 = *(void (**)(unsigned char *, uint64_t))(v33 + 8);
        v23(v10, a3);
        v23(v15, a3);
        if (v22) {
          goto LABEL_22;
        }
LABEL_20:
        sqlite3_int64 v35 = v19;
        sub_259F96158();
        return sub_259FA2260();
      }
    }
    else if (v21 > 63)
    {
      sqlite3_int64 v35 = v19;
      uint64_t v27 = v33;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v33 + 16))(v7, v15, a3);
      if (v19 < 0)
      {
        uint64_t v29 = *(void (**)(unsigned char *, uint64_t))(v27 + 8);
        v29(v7, a3);
        v29(v15, a3);
      }
      else
      {
        sub_259F96158();
        sub_259FA2220();
        int v32 = sub_259FA1F40();
        uint64_t v28 = *(void (**)(unsigned char *, uint64_t))(v27 + 8);
        v28(v10, a3);
        v28(v7, a3);
        v28(v15, a3);
        if ((v32 & 1) == 0) {
          goto LABEL_20;
        }
      }
LABEL_22:
      sub_259F7C520();
      swift_allocError();
      *(void *)(v30 + 8) = 0;
      *(void *)(v30 + 16) = 0;
      *(void *)uint64_t v30 = 8;
      *(unsigned char *)(v30 + 24) = 5;
      return swift_willThrow();
    }
    uint64_t v26 = sub_259FA2230();
    (*(void (**)(unsigned char *, uint64_t))(v33 + 8))(v15, a3);
    if (v19 < v26) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

unint64_t sub_259F96158()
{
  unint64_t result = qword_26A401AF0;
  if (!qword_26A401AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401AF0);
  }
  return result;
}

uint64_t sub_259F961AC(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int64((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_259F962C4(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3 || !*(void *)(v3 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_10:
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)uint64_t v7 = v8;
    *(unsigned char *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t result = *(void *)(*(void *)a1 + 24);
  if (!result)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_10;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a3 < 0)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_bind_int64((sqlite3_stmt *)result, a2, a3);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  sub_259F7C520();
  swift_allocError();
  *(void *)uint64_t v6 = v5;
  *(void *)(v6 + 8) = 0xD000000000000012;
  *(void *)(v6 + 16) = 0x8000000259FA2FB0;
  *(unsigned char *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t SQLiteInteger64.bind(to:at:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  uint64_t v84 = a2;
  uint64_t v83 = *(void *)(*(void *)(a4 + 16) + 8);
  uint64_t v7 = *(void *)(*(void *)(v83 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (void (*)(char *, uint64_t))((char *)v71 - v10);
  uint64_t v12 = *((void *)a3 - 1);
  uint64_t v13 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v71 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)v71 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v31 = (char *)v71 - v28;
  uint64_t v32 = *(void *)(*(void *)a1 + 16);
  if (!v32 || !*(void *)(v32 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v44 = 4;
LABEL_12:
    *(void *)(v43 + 8) = 0;
    *(void *)(v43 + 16) = 0;
    *(void *)uint64_t v43 = v44;
    *(unsigned char *)(v43 + 24) = 5;
    return swift_willThrow();
  }
  uint64_t v33 = *(sqlite3_stmt **)(*(void *)a1 + 24);
  if (!v33)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v44 = 3;
    goto LABEL_12;
  }
  if (v84 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v84 > 0x7FFFFFFF)
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v71[1] = v24;
  v71[2] = v7;
  uint64_t v72 = v26;
  uint64_t v73 = v16;
  v74 = v25;
  v75 = v30;
  v77 = v27;
  v78 = v29;
  v76 = v33;
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v34((char *)v71 - v28, (uint64_t)v4, (uint64_t)a3);
  char v35 = sub_259FA2250();
  v81 = (void (*)(uint64_t, char *, uint64_t))v34;
  uint64_t v82 = v31;
  uint64_t v79 = v12 + 16;
  v34(v23, (uint64_t)v31, (uint64_t)a3);
  uint64_t v80 = v12;
  if ((v35 & 1) == 0)
  {
    uint64_t v11 = *(void (**)(char *, uint64_t))(v12 + 8);
    v11(v23, (uint64_t)a3);
    uint64_t v40 = v78;
    goto LABEL_31;
  }
  uint64_t v36 = sub_259FA2240();
  int v37 = (char *)(v12 + 8);
  v71[0] = *(void *)(v12 + 8);
  ((void (*)(char *, char *))v71[0])(v23, a3);
  if (v36 <= 64)
  {
    uint64_t v40 = v78;
    uint64_t v11 = (void (*)(char *, uint64_t))v71[0];
    goto LABEL_31;
  }
  char v38 = v74;
  v81((uint64_t)v74, v82, (uint64_t)a3);
  int64_t v86 = 0x8000000000000000;
  char v39 = sub_259FA2250();
  uint64_t v40 = v78;
  if (v39)
  {
    uint64_t v72 = v37;
    if (sub_259FA2240() < 64)
    {
      uint64_t v41 = sub_259FA2230();
      uint64_t v11 = (void (*)(char *, uint64_t))v71[0];
      ((void (*)(char *, char *))v71[0])(v38, a3);
      BOOL v42 = v41 < v86;
      goto LABEL_27;
    }
LABEL_20:
    sub_259F96158();
    signed int v48 = v75;
    sub_259FA2220();
    char v49 = sub_259FA1F40();
    uint64_t v11 = (void (*)(char *, uint64_t))v71[0];
    ((void (*)(char *, char *))v71[0])(v48, a3);
    v11(v38, (uint64_t)a3);
    if ((v49 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  char v46 = sub_259FA2250();
  uint64_t v47 = sub_259FA2240();
  if ((v46 & 1) == 0)
  {
    if (v47 >= 64)
    {
LABEL_30:
      uint64_t v11 = (void (*)(char *, uint64_t))v71[0];
      ((void (*)(char *, char *))v71[0])(v74, a3);
      goto LABEL_31;
    }
    uint64_t v50 = v74;
    uint64_t v51 = sub_259FA2230();
    uint64_t v11 = (void (*)(char *, uint64_t))v71[0];
    ((void (*)(char *, char *))v71[0])(v50, a3);
    if (v51 >= v86) {
      goto LABEL_31;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v47 > 64) {
    goto LABEL_20;
  }
  swift_getAssociatedConformanceWitness();
  sub_259FA2410();
  signed int v52 = v75;
  sub_259FA23F0();
  char v53 = sub_259FA1F40();
  uint64_t v11 = (void (*)(char *, uint64_t))v71[0];
  ((void (*)(char *, char *))v71[0])(v52, a3);
  uint64_t v4 = v72;
  (*(void (**)(char *, char *, char *))(v80 + 32))(v72, v38, a3);
  if (v53)
  {
LABEL_48:
    uint64_t result = ((uint64_t (*)(char *, char *))v11)(v4, a3);
    __break(1u);
    return result;
  }
  int64_t v54 = v86;
  uint64_t v55 = sub_259FA2230();
  v11(v4, (uint64_t)a3);
  BOOL v42 = v55 < v54;
LABEL_27:
  if (v42) {
    goto LABEL_29;
  }
LABEL_31:
  char v56 = v82;
  uint64_t v57 = sub_259FA2240();
  uint64_t v58 = v77;
  v81((uint64_t)v77, v56, (uint64_t)a3);
  if (v57 >= 65)
  {
    v11(v58, (uint64_t)a3);
    goto LABEL_33;
  }
  uint64_t v64 = sub_259FA2240();
  v11(v58, (uint64_t)a3);
  if (v64 == 64 && (sub_259FA2250() & 1) == 0)
  {
LABEL_33:
    v81((uint64_t)v40, v82, (uint64_t)a3);
    int64_t v86 = 0x7FFFFFFFFFFFFFFFLL;
    char v59 = sub_259FA2250();
    uint64_t v60 = sub_259FA2240();
    if (v59)
    {
      if (v60 > 64)
      {
        sub_259F96158();
        int64_t v61 = v75;
        uint64_t v4 = a3;
        sub_259FA2220();
        char v62 = sub_259FA1F40();
        v11(v61, (uint64_t)a3);
        uint64_t v63 = v40;
        goto LABEL_42;
      }
    }
    else if (v60 > 63)
    {
      uint64_t v85 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v65 = v75;
      (*(void (**)(char *, char *, char *))(v80 + 32))(v75, v40, a3);
      sub_259F96158();
      int v66 = v73;
      uint64_t v4 = a3;
      sub_259FA2220();
      char v62 = sub_259FA1F40();
      v11(v66, (uint64_t)a3);
      uint64_t v63 = v65;
LABEL_42:
      v11(v63, (uint64_t)a3);
      if ((v62 & 1) == 0) {
        goto LABEL_43;
      }
      goto LABEL_47;
    }
    sub_259FA2230();
    v11(v40, (uint64_t)a3);
  }
LABEL_43:
  uint64_t v67 = v82;
  sqlite3_int64 v68 = sub_259FA2230();
  v11(v67, (uint64_t)a3);
  uint64_t result = sqlite3_bind_int64(v76, v84, v68);
  if (result)
  {
    uint64_t v69 = result;
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v70 = v69;
    *(void *)(v70 + 8) = 0xD000000000000012;
    *(void *)(v70 + 16) = 0x8000000259FA2FB0;
    *(unsigned char *)(v70 + 24) = 0;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_259F96D9C(uint64_t a1)
{
  unint64_t result = sub_259F96DC4();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F96DC4()
{
  unint64_t result = qword_26A401AF8;
  if (!qword_26A401AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401AF8);
  }
  return result;
}

unint64_t sub_259F96E18(uint64_t a1)
{
  unint64_t result = sub_259F96E40();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F96E40()
{
  unint64_t result = qword_26A401B00;
  if (!qword_26A401B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B00);
  }
  return result;
}

unint64_t sub_259F96E94(uint64_t a1)
{
  unint64_t result = sub_259F96EBC();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F96EBC()
{
  unint64_t result = qword_26A401B08;
  if (!qword_26A401B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B08);
  }
  return result;
}

unint64_t sub_259F96F10(uint64_t a1)
{
  unint64_t result = sub_259F96F38();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F96F38()
{
  unint64_t result = qword_26A401B10;
  if (!qword_26A401B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B10);
  }
  return result;
}

unint64_t sub_259F96F8C(uint64_t a1)
{
  unint64_t result = sub_259F96FB4();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F96FB4()
{
  unint64_t result = qword_26A401B18;
  if (!qword_26A401B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B18);
  }
  return result;
}

unint64_t sub_259F97008(uint64_t a1)
{
  unint64_t result = sub_259F97030();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F97030()
{
  unint64_t result = qword_26A401B20;
  if (!qword_26A401B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B20);
  }
  return result;
}

unint64_t sub_259F97084(uint64_t a1)
{
  unint64_t result = sub_259F970AC();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F970AC()
{
  unint64_t result = qword_26A401B28;
  if (!qword_26A401B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B28);
  }
  return result;
}

void sub_259F97100(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_259F9710C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F941D8(a1, a2, &qword_26A401B78, &qword_26A401B80, a3);
}

unint64_t sub_259F9713C(uint64_t a1)
{
  unint64_t result = sub_259F97164();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F97164()
{
  unint64_t result = qword_26A401B30;
  if (!qword_26A401B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B30);
  }
  return result;
}

uint64_t sub_259F971B8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_259F9D0E8(*a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void sub_259F971E8(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_259F971F4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F942E4(a1, a2, &qword_26A401B68, &qword_26A401B70, a3);
}

unint64_t sub_259F97224(uint64_t a1)
{
  unint64_t result = sub_259F9724C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F9724C()
{
  unint64_t result = qword_26A401B38;
  if (!qword_26A401B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B38);
  }
  return result;
}

uint64_t sub_259F972A0(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F961AC((uint64_t)&v5, a2, *v2);
}

uint64_t sub_259F972D8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F941D8(a1, a2, &qword_26A401B58, &qword_26A401B60, a3);
}

unint64_t sub_259F97308(uint64_t a1)
{
  unint64_t result = sub_259F97330();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F97330()
{
  unint64_t result = qword_26A401B40;
  if (!qword_26A401B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401B40);
  }
  return result;
}

uint64_t sub_259F97384(long long *a1, uint64_t a2)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return sub_259F962C4((uint64_t)&v5, a2, *v2);
}

uint64_t sub_259F973BC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_259F942E4(a1, a2, &qword_26A401B48, &qword_26A401B50, a3);
}

void *sub_259F973EC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A401AD8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_259F97454(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_259FA2080();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25A2F0CF0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_259F974D0(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned __int8 v16 = 0;
    unsigned __int8 v66 = 0;
    goto LABEL_145;
  }
  uint64_t v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t result = sub_259FA22C0();
    }
    int v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        uint64_t v31 = v6 - 1;
        if (v6 != 1)
        {
          unsigned __int8 v32 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v33 = a3 + 55;
          }
          else
          {
            unsigned __int8 v32 = 97;
            unsigned __int8 v33 = 65;
          }
          if (a3 <= 10) {
            unsigned __int8 v34 = a3 + 48;
          }
          else {
            unsigned __int8 v34 = 58;
          }
          if (result)
          {
            LOBYTE(v12) = 0;
            char v35 = (unsigned __int8 *)(result + 1);
            do
            {
              unsigned int v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  unsigned __int8 v16 = 0;
                  char v17 = 1;
                  if (v36 < 0x61 || v36 >= v32) {
                    goto LABEL_144;
                  }
                  char v37 = -87;
                }
                else
                {
                  char v37 = -55;
                }
              }
              else
              {
                char v37 = -48;
              }
              int v38 = (char)v12 * (char)a3;
              char v39 = v38;
              if ((char)v38 != v38) {
                goto LABEL_143;
              }
              int v12 = (char)v38 + (char)(v36 + v37);
              if ((char)(v39 + v36 + v37) != v12) {
                goto LABEL_143;
              }
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            unsigned __int8 v16 = v12;
            unsigned __int8 v66 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        unsigned __int8 v16 = 0;
        char v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        unsigned __int8 v40 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v41 = a3 + 55;
        }
        else
        {
          unsigned __int8 v40 = 97;
          unsigned __int8 v41 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v42 = a3 + 48;
        }
        else {
          unsigned __int8 v42 = 58;
        }
        if (result)
        {
          LOBYTE(v43) = 0;
          do
          {
            unsigned int v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                unsigned __int8 v16 = 0;
                char v17 = 1;
                if (v44 < 0x61 || v44 >= v40) {
                  goto LABEL_144;
                }
                char v45 = -87;
              }
              else
              {
                char v45 = -55;
              }
            }
            else
            {
              char v45 = -48;
            }
            int v46 = (char)v43 * (char)a3;
            char v47 = v46;
            if ((char)v46 != v46) {
              goto LABEL_143;
            }
            int v43 = (char)v46 + (char)(v44 + v45);
            if ((char)(v47 + v44 + v45) != v43) {
              goto LABEL_143;
            }
            ++result;
            --v6;
          }
          while (v6);
          unsigned __int8 v16 = v43;
          unsigned __int8 v66 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      uint64_t v8 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v9 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v10 = a3 + 55;
        }
        else
        {
          unsigned __int8 v9 = 97;
          unsigned __int8 v10 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v11 = a3 + 48;
        }
        else {
          unsigned __int8 v11 = 58;
        }
        if (result)
        {
          LOBYTE(v12) = 0;
          unint64_t v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            unsigned int v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                unsigned __int8 v16 = 0;
                char v17 = 1;
                if (v14 < 0x61 || v14 >= v9) {
                  goto LABEL_144;
                }
                char v15 = -87;
              }
              else
              {
                char v15 = -55;
              }
            }
            else
            {
              char v15 = -48;
            }
            int v18 = (char)v12 * (char)a3;
            char v19 = v18;
            if ((char)v18 != v18) {
              goto LABEL_143;
            }
            int v12 = (char)v18 - (char)(v14 + v15);
            if ((char)(v19 - (v14 + v15)) != v12) {
              goto LABEL_143;
            }
            ++v13;
            if (!--v8) {
              goto LABEL_76;
            }
          }
        }
LABEL_99:
        unsigned __int8 v16 = 0;
        char v17 = 0;
LABEL_144:
        unsigned __int8 v66 = v17;
LABEL_145:
        LOBYTE(v65[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v66 << 8) | (LOBYTE(v65[0]) << 16);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  uint64_t v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        LOBYTE(v22) = 0;
        unsigned __int8 v57 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v58 = a3 + 55;
        }
        else
        {
          unsigned __int8 v57 = 97;
          unsigned __int8 v58 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v59 = a3 + 48;
        }
        else {
          unsigned __int8 v59 = 58;
        }
        uint64_t v60 = (unsigned __int8 *)v65;
        while (1)
        {
          unsigned int v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              unsigned __int8 v16 = 0;
              char v17 = 1;
              if (v61 < 0x61 || v61 >= v57) {
                goto LABEL_144;
              }
              char v62 = -87;
            }
            else
            {
              char v62 = -55;
            }
          }
          else
          {
            char v62 = -48;
          }
          int v63 = (char)v22 * (char)a3;
          char v64 = v63;
          if ((char)v63 != v63) {
            goto LABEL_143;
          }
          int v22 = (char)v63 + (char)(v61 + v62);
          if ((char)(v64 + v61 + v62) != v22) {
            goto LABEL_143;
          }
          ++v60;
          if (!--v20) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      uint64_t v21 = v20 - 1;
      if (v21)
      {
        LOBYTE(v22) = 0;
        unsigned __int8 v23 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v24 = a3 + 55;
        }
        else
        {
          unsigned __int8 v23 = 97;
          unsigned __int8 v24 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v25 = a3 + 48;
        }
        else {
          unsigned __int8 v25 = 58;
        }
        uint64_t v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          unsigned int v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              unsigned __int8 v16 = 0;
              char v17 = 1;
              if (v27 < 0x61 || v27 >= v23) {
                goto LABEL_144;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          int v29 = (char)v22 * (char)a3;
          char v30 = v29;
          if ((char)v29 != v29) {
            goto LABEL_143;
          }
          int v22 = (char)v29 - (char)(v27 + v28);
          if ((char)(v30 - (v27 + v28)) != v22) {
            goto LABEL_143;
          }
          ++v26;
          if (!--v21) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    uint64_t v48 = v20 - 1;
    if (v48)
    {
      LOBYTE(v22) = 0;
      unsigned __int8 v49 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v50 = a3 + 55;
      }
      else
      {
        unsigned __int8 v49 = 97;
        unsigned __int8 v50 = 65;
      }
      if (a3 <= 10) {
        unsigned __int8 v51 = a3 + 48;
      }
      else {
        unsigned __int8 v51 = 58;
      }
      signed int v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        unsigned int v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            unsigned __int8 v16 = 0;
            char v17 = 1;
            if (v53 < 0x61 || v53 >= v49) {
              goto LABEL_144;
            }
            char v54 = -87;
          }
          else
          {
            char v54 = -55;
          }
        }
        else
        {
          char v54 = -48;
        }
        int v55 = (char)v22 * (char)a3;
        char v56 = v55;
        if ((char)v55 != v55) {
          goto LABEL_143;
        }
        int v22 = (char)v55 + (char)(v53 + v54);
        if ((char)(v56 + v53 + v54) != v22) {
          goto LABEL_143;
        }
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      unsigned __int8 v16 = v22;
      unsigned __int8 v66 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

unsigned __int8 *sub_259F97A98(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          LOBYTE(v8) = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            int v23 = (char)v8 * (char)a3;
            char v24 = v23;
            if ((char)v23 != v23) {
              goto LABEL_72;
            }
            int v8 = (char)v23 + (char)(v21 + v22);
            if ((char)(v24 + v21 + v22) != v8) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          int v13 = 0;
          unsigned __int8 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int8 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          LOBYTE(v28) = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            int v31 = (char)v28 * (char)a3;
            char v32 = v31;
            if ((char)v31 != v31) {
              goto LABEL_72;
            }
            int v28 = (char)v31 + (char)(v29 + v30);
            if ((char)(v32 + v29 + v30) != v28) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int8 v12 = v28;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          LOBYTE(v8) = 0;
          unsigned __int8 v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            int v14 = (char)v8 * (char)a3;
            char v15 = v14;
            if ((char)v14 != v14) {
              goto LABEL_72;
            }
            int v8 = (char)v14 - (char)(v10 + v11);
            if ((char)(v15 - (v10 + v11)) != v8) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int8 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F97D4C()
{
  unint64_t v0 = sub_259FA20B0();
  uint64_t v4 = sub_259F97DCC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_259F97DCC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_259F97F24(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_259F973EC(v9, 0);
      unint64_t v12 = sub_259F98024((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_259FA22C0();
LABEL_4:
        JUMPOUT(0x25A2F0C60);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x25A2F0C60](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x25A2F0C60]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_259F97F24(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_259F97454(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_259F97454(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_259F98024(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  if (!a2)
  {
    uint64_t v13 = 0;
    unint64_t v15 = a4;
LABEL_34:
    *(void *)unint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(void *)(result + 16) = a6;
    *(void *)(result + 24) = a7;
    *(void *)(result + 32) = v15;
    return v13;
  }
  if (!a3)
  {
    unint64_t v15 = a4;
    uint64_t v13 = 0;
    goto LABEL_34;
  }
  uint64_t v10 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v10) = 1;
  }
  uint64_t v11 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v11 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v27 = v11;
  if (a3 < 0) {
    goto LABEL_37;
  }
  unint64_t v23 = result;
  unint64_t v24 = a5;
  uint64_t v13 = 0;
  unint64_t v14 = a5 >> 14;
  unint64_t v15 = a4;
  uint64_t v16 = 4 << v10;
  unint64_t v17 = a4 >> 14;
  uint64_t v25 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v26 = a7 & 0xFFFFFFFFFFFFFFLL;
  unint64_t v22 = a4;
  unint64_t v28 = a4 >> 14;
  while (1)
  {
    unint64_t v18 = v15 >> 14;
    if (v15 >> 14 == v14) {
      goto LABEL_33;
    }
    unint64_t v19 = v15 & 0xC;
    unint64_t v20 = v15;
    if (v19 == v16) {
      break;
    }
    if (v18 < v17) {
      goto LABEL_35;
    }
LABEL_14:
    if (v18 >= v14) {
      goto LABEL_35;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_259FA2070();
      unint64_t v17 = v28;
      char v21 = result;
      if (v19 != v16) {
        goto LABEL_22;
      }
    }
    else if ((a7 & 0x2000000000000000) != 0)
    {
      v29[0] = a6;
      v29[1] = v26;
      char v21 = *((unsigned char *)v29 + (v20 >> 16));
      if (v19 != v16) {
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t result = v25;
      if ((a6 & 0x1000000000000000) == 0)
      {
        unint64_t result = sub_259FA22C0();
        unint64_t v17 = v28;
      }
      char v21 = *(unsigned char *)(result + (v20 >> 16));
      if (v19 != v16)
      {
LABEL_22:
        if ((a7 & 0x1000000000000000) != 0) {
          goto LABEL_23;
        }
        goto LABEL_9;
      }
    }
    unint64_t result = sub_259F97454(v15, a6, a7);
    unint64_t v17 = v28;
    unint64_t v15 = result;
    if ((a7 & 0x1000000000000000) != 0)
    {
LABEL_23:
      if (v27 <= v15 >> 16) {
        goto LABEL_36;
      }
      unint64_t result = sub_259FA2040();
      unint64_t v17 = v28;
      unint64_t v15 = result;
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v15 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_10:
    *(unsigned char *)(a2 + v13++) = v21;
    if (a3 == v13)
    {
      uint64_t v13 = a3;
LABEL_33:
      unint64_t result = v23;
      a5 = v24;
      a4 = v22;
      goto LABEL_34;
    }
  }
  unint64_t result = sub_259F97454(v15, a6, a7);
  unint64_t v17 = v28;
  unint64_t v20 = result;
  unint64_t v18 = result >> 14;
  if (result >> 14 >= v28) {
    goto LABEL_14;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_259F98254(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned __int8 v16 = 0;
    unsigned __int8 v54 = 0;
    goto LABEL_145;
  }
  uint64_t v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t result = sub_259FA22C0();
    }
    int v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        uint64_t v27 = v6 - 1;
        if (v6 != 1)
        {
          unsigned __int8 v28 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v29 = a3 + 55;
          }
          else
          {
            unsigned __int8 v28 = 97;
            unsigned __int8 v29 = 65;
          }
          if (a3 <= 10) {
            unsigned __int8 v30 = a3 + 48;
          }
          else {
            unsigned __int8 v30 = 58;
          }
          if (result)
          {
            LOBYTE(v12) = 0;
            int v31 = (unsigned __int8 *)(result + 1);
            do
            {
              unsigned int v32 = *v31;
              if (v32 < 0x30 || v32 >= v30)
              {
                if (v32 < 0x41 || v32 >= v29)
                {
                  unsigned __int8 v16 = 0;
                  char v17 = 1;
                  if (v32 < 0x61 || v32 >= v28) {
                    goto LABEL_144;
                  }
                  char v33 = -87;
                }
                else
                {
                  char v33 = -55;
                }
              }
              else
              {
                char v33 = -48;
              }
              if (((v12 * (unsigned __int16)a3) & 0xFF00) != 0) {
                goto LABEL_143;
              }
              unsigned int v12 = (v12 * a3) + (v32 + v33);
              if ((v12 >> 8)) {
                goto LABEL_143;
              }
              ++v31;
              --v27;
            }
            while (v27);
LABEL_76:
            unsigned __int8 v16 = v12;
            unsigned __int8 v54 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        unsigned __int8 v16 = 0;
        char v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        unsigned __int8 v34 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v35 = a3 + 55;
        }
        else
        {
          unsigned __int8 v34 = 97;
          unsigned __int8 v35 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v36 = a3 + 48;
        }
        else {
          unsigned __int8 v36 = 58;
        }
        if (result)
        {
          LOBYTE(v37) = 0;
          do
          {
            unsigned int v38 = *(unsigned __int8 *)result;
            if (v38 < 0x30 || v38 >= v36)
            {
              if (v38 < 0x41 || v38 >= v35)
              {
                unsigned __int8 v16 = 0;
                char v17 = 1;
                if (v38 < 0x61 || v38 >= v34) {
                  goto LABEL_144;
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            if (((v37 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_143;
            }
            unsigned int v37 = (v37 * a3) + (v38 + v39);
            if ((v37 >> 8)) {
              goto LABEL_143;
            }
            ++result;
            --v6;
          }
          while (v6);
          unsigned __int8 v16 = v37;
          unsigned __int8 v54 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      uint64_t v8 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v9 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v10 = a3 + 55;
        }
        else
        {
          unsigned __int8 v9 = 97;
          unsigned __int8 v10 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v11 = a3 + 48;
        }
        else {
          unsigned __int8 v11 = 58;
        }
        if (result)
        {
          LOBYTE(v12) = 0;
          uint64_t v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            unsigned int v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                unsigned __int8 v16 = 0;
                char v17 = 1;
                if (v14 < 0x61 || v14 >= v9) {
                  goto LABEL_144;
                }
                char v15 = -87;
              }
              else
              {
                char v15 = -55;
              }
            }
            else
            {
              char v15 = -48;
            }
            if (((v12 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_143;
            }
            unsigned int v12 = (v12 * a3) - (v14 + v15);
            if ((v12 & 0xFFFFFF00) != 0) {
              goto LABEL_143;
            }
            ++v13;
            if (!--v8) {
              goto LABEL_76;
            }
          }
        }
LABEL_99:
        unsigned __int8 v16 = 0;
        char v17 = 0;
LABEL_144:
        unsigned __int8 v54 = v17;
LABEL_145:
        LOBYTE(v53[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v54 << 8) | (LOBYTE(v53[0]) << 16);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  uint64_t v18 = HIBYTE(a2) & 0xF;
  v53[0] = result;
  v53[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v18)
      {
        LOBYTE(v20) = 0;
        unsigned __int8 v47 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v48 = a3 + 55;
        }
        else
        {
          unsigned __int8 v47 = 97;
          unsigned __int8 v48 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v49 = a3 + 48;
        }
        else {
          unsigned __int8 v49 = 58;
        }
        unsigned __int8 v50 = (unsigned __int8 *)v53;
        while (1)
        {
          unsigned int v51 = *v50;
          if (v51 < 0x30 || v51 >= v49)
          {
            if (v51 < 0x41 || v51 >= v48)
            {
              unsigned __int8 v16 = 0;
              char v17 = 1;
              if (v51 < 0x61 || v51 >= v47) {
                goto LABEL_144;
              }
              char v52 = -87;
            }
            else
            {
              char v52 = -55;
            }
          }
          else
          {
            char v52 = -48;
          }
          if (((v20 * (unsigned __int16)a3) & 0xFF00) != 0) {
            goto LABEL_143;
          }
          unsigned int v20 = (v20 * a3) + (v51 + v52);
          if ((v20 >> 8)) {
            goto LABEL_143;
          }
          ++v50;
          if (!--v18) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    if (v18)
    {
      uint64_t v19 = v18 - 1;
      if (v19)
      {
        LOBYTE(v20) = 0;
        unsigned __int8 v21 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v22 = a3 + 55;
        }
        else
        {
          unsigned __int8 v21 = 97;
          unsigned __int8 v22 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v23 = a3 + 48;
        }
        else {
          unsigned __int8 v23 = 58;
        }
        unint64_t v24 = (unsigned __int8 *)v53 + 1;
        while (1)
        {
          unsigned int v25 = *v24;
          if (v25 < 0x30 || v25 >= v23)
          {
            if (v25 < 0x41 || v25 >= v22)
            {
              unsigned __int8 v16 = 0;
              char v17 = 1;
              if (v25 < 0x61 || v25 >= v21) {
                goto LABEL_144;
              }
              char v26 = -87;
            }
            else
            {
              char v26 = -55;
            }
          }
          else
          {
            char v26 = -48;
          }
          if (((v20 * (unsigned __int16)a3) & 0xFF00) != 0) {
            goto LABEL_143;
          }
          unsigned int v20 = (v20 * a3) - (v25 + v26);
          if ((v20 & 0xFFFFFF00) != 0) {
            goto LABEL_143;
          }
          ++v24;
          if (!--v19) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v18)
  {
    uint64_t v40 = v18 - 1;
    if (v40)
    {
      LOBYTE(v20) = 0;
      unsigned __int8 v41 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v42 = a3 + 55;
      }
      else
      {
        unsigned __int8 v41 = 97;
        unsigned __int8 v42 = 65;
      }
      if (a3 <= 10) {
        unsigned __int8 v43 = a3 + 48;
      }
      else {
        unsigned __int8 v43 = 58;
      }
      unsigned int v44 = (unsigned __int8 *)v53 + 1;
      do
      {
        unsigned int v45 = *v44;
        if (v45 < 0x30 || v45 >= v43)
        {
          if (v45 < 0x41 || v45 >= v42)
          {
            unsigned __int8 v16 = 0;
            char v17 = 1;
            if (v45 < 0x61 || v45 >= v41) {
              goto LABEL_144;
            }
            char v46 = -87;
          }
          else
          {
            char v46 = -55;
          }
        }
        else
        {
          char v46 = -48;
        }
        if (((v20 * (unsigned __int16)a3) & 0xFF00) != 0) {
          goto LABEL_143;
        }
        unsigned int v20 = (v20 * a3) + (v45 + v46);
        if ((v20 >> 8)) {
          goto LABEL_143;
        }
        ++v44;
        --v40;
      }
      while (v40);
LABEL_142:
      unsigned __int8 v16 = v20;
      unsigned __int8 v54 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

uint64_t sub_259F98804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  v8[0] = sub_259FA20A0();
  v8[1] = v6;
  LOWORD(a4) = sub_259F9888C(v8, a3, a4);
  swift_bridgeObjectRelease();
  return (unsigned __int16)a4 & 0x1FF;
}

uint64_t sub_259F9888C(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void *, uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  if ((v7 & 0x1000000000000000) == 0)
  {
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = HIBYTE(v7) & 0xF;
    v16[0] = v6;
    v16[1] = v7 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v8 = v16;
    goto LABEL_7;
  }
  uint64_t v6 = sub_259F97D4C();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  *a1 = v6;
  a1[1] = v12;
  unint64_t v7 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (void *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = (void *)sub_259FA22C0();
  }
LABEL_7:
  __int16 v13 = a3(v8, v9, a2);
  if (!v3) {
    return v13 & 0x1FF;
  }
  return v14;
}

unsigned __int8 *sub_259F98964(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v14 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v15 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = a3 + 55;
        }
        else
        {
          unsigned __int8 v15 = 97;
          unsigned __int8 v16 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v17 = a3 + 48;
        }
        else {
          unsigned __int8 v17 = 58;
        }
        if (result)
        {
          LOBYTE(v8) = 0;
          uint64_t v18 = result + 1;
          do
          {
            unsigned int v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v19 < 0x61 || v19 >= v15) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v20 = -87;
              }
              else
              {
                char v20 = -55;
              }
            }
            else
            {
              char v20 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v8 = (v8 * a3) + (v19 + v20);
            if ((v8 >> 8)) {
              goto LABEL_72;
            }
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          int v13 = 0;
          unsigned __int8 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int8 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v21 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v22 = a3 + 55;
        }
        else
        {
          unsigned __int8 v21 = 97;
          unsigned __int8 v22 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v23 = a3 + 48;
        }
        else {
          unsigned __int8 v23 = 58;
        }
        if (result)
        {
          LOBYTE(v24) = 0;
          do
          {
            unsigned int v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v25 < 0x61 || v25 >= v21) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v26 = -87;
              }
              else
              {
                char v26 = -55;
              }
            }
            else
            {
              char v26 = -48;
            }
            if (((v24 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v24 = (v24 * a3) + (v25 + v26);
            if ((v24 >> 8)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int8 v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          LOBYTE(v8) = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v8 = (v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFFFF00) != 0) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int8 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F98C0C(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned __int16 v16 = 0;
    unsigned __int8 v66 = 0;
    goto LABEL_145;
  }
  uint64_t v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t result = sub_259FA22C0();
    }
    int v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        uint64_t v31 = v6 - 1;
        if (v6 != 1)
        {
          unsigned __int8 v32 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v33 = a3 + 55;
          }
          else
          {
            unsigned __int8 v32 = 97;
            unsigned __int8 v33 = 65;
          }
          if (a3 <= 10) {
            unsigned __int8 v34 = a3 + 48;
          }
          else {
            unsigned __int8 v34 = 58;
          }
          if (result)
          {
            LOWORD(v12) = 0;
            unsigned __int8 v35 = (unsigned __int8 *)(result + 1);
            do
            {
              unsigned int v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  unsigned __int16 v16 = 0;
                  char v17 = 1;
                  if (v36 < 0x61 || v36 >= v32) {
                    goto LABEL_144;
                  }
                  char v37 = -87;
                }
                else
                {
                  char v37 = -55;
                }
              }
              else
              {
                char v37 = -48;
              }
              int v38 = (__int16)v12 * (__int16)a3;
              __int16 v39 = v38;
              if ((__int16)v38 != v38) {
                goto LABEL_143;
              }
              int v12 = (__int16)v38 + (v36 + v37);
              if ((__int16)(v39 + (v36 + v37)) != v12) {
                goto LABEL_143;
              }
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            unsigned __int16 v16 = v12;
            unsigned __int8 v66 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        unsigned __int16 v16 = 0;
        char v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        unsigned __int8 v40 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v41 = a3 + 55;
        }
        else
        {
          unsigned __int8 v40 = 97;
          unsigned __int8 v41 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v42 = a3 + 48;
        }
        else {
          unsigned __int8 v42 = 58;
        }
        if (result)
        {
          LOWORD(v43) = 0;
          do
          {
            unsigned int v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                unsigned __int16 v16 = 0;
                char v17 = 1;
                if (v44 < 0x61 || v44 >= v40) {
                  goto LABEL_144;
                }
                char v45 = -87;
              }
              else
              {
                char v45 = -55;
              }
            }
            else
            {
              char v45 = -48;
            }
            int v46 = (__int16)v43 * (__int16)a3;
            __int16 v47 = v46;
            if ((__int16)v46 != v46) {
              goto LABEL_143;
            }
            int v43 = (__int16)v46 + (v44 + v45);
            if ((__int16)(v47 + (v44 + v45)) != v43) {
              goto LABEL_143;
            }
            ++result;
            --v6;
          }
          while (v6);
          unsigned __int16 v16 = v43;
          unsigned __int8 v66 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      uint64_t v8 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v9 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v10 = a3 + 55;
        }
        else
        {
          unsigned __int8 v9 = 97;
          unsigned __int8 v10 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v11 = a3 + 48;
        }
        else {
          unsigned __int8 v11 = 58;
        }
        if (result)
        {
          LOWORD(v12) = 0;
          int v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            unsigned int v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                unsigned __int16 v16 = 0;
                char v17 = 1;
                if (v14 < 0x61 || v14 >= v9) {
                  goto LABEL_144;
                }
                char v15 = -87;
              }
              else
              {
                char v15 = -55;
              }
            }
            else
            {
              char v15 = -48;
            }
            int v18 = (__int16)v12 * (__int16)a3;
            __int16 v19 = v18;
            if ((__int16)v18 != v18) {
              goto LABEL_143;
            }
            int v12 = (__int16)v18 - (v14 + v15);
            if ((__int16)(v19 - (v14 + v15)) != v12) {
              goto LABEL_143;
            }
            ++v13;
            if (!--v8) {
              goto LABEL_76;
            }
          }
        }
LABEL_99:
        unsigned __int16 v16 = 0;
        char v17 = 0;
LABEL_144:
        unsigned __int8 v66 = v17;
LABEL_145:
        LOBYTE(v65[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v66 << 16) | (LOBYTE(v65[0]) << 24);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  uint64_t v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        LOWORD(v22) = 0;
        unsigned __int8 v57 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v58 = a3 + 55;
        }
        else
        {
          unsigned __int8 v57 = 97;
          unsigned __int8 v58 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v59 = a3 + 48;
        }
        else {
          unsigned __int8 v59 = 58;
        }
        uint64_t v60 = (unsigned __int8 *)v65;
        while (1)
        {
          unsigned int v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              unsigned __int16 v16 = 0;
              char v17 = 1;
              if (v61 < 0x61 || v61 >= v57) {
                goto LABEL_144;
              }
              char v62 = -87;
            }
            else
            {
              char v62 = -55;
            }
          }
          else
          {
            char v62 = -48;
          }
          int v63 = (__int16)v22 * (__int16)a3;
          __int16 v64 = v63;
          if ((__int16)v63 != v63) {
            goto LABEL_143;
          }
          int v22 = (__int16)v63 + (v61 + v62);
          if ((__int16)(v64 + (v61 + v62)) != v22) {
            goto LABEL_143;
          }
          ++v60;
          if (!--v20) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      uint64_t v21 = v20 - 1;
      if (v21)
      {
        LOWORD(v22) = 0;
        unsigned __int8 v23 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v24 = a3 + 55;
        }
        else
        {
          unsigned __int8 v23 = 97;
          unsigned __int8 v24 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v25 = a3 + 48;
        }
        else {
          unsigned __int8 v25 = 58;
        }
        char v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          unsigned int v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              unsigned __int16 v16 = 0;
              char v17 = 1;
              if (v27 < 0x61 || v27 >= v23) {
                goto LABEL_144;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          int v29 = (__int16)v22 * (__int16)a3;
          __int16 v30 = v29;
          if ((__int16)v29 != v29) {
            goto LABEL_143;
          }
          int v22 = (__int16)v29 - (v27 + v28);
          if ((__int16)(v30 - (v27 + v28)) != v22) {
            goto LABEL_143;
          }
          ++v26;
          if (!--v21) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    uint64_t v48 = v20 - 1;
    if (v48)
    {
      LOWORD(v22) = 0;
      unsigned __int8 v49 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v50 = a3 + 55;
      }
      else
      {
        unsigned __int8 v49 = 97;
        unsigned __int8 v50 = 65;
      }
      if (a3 <= 10) {
        unsigned __int8 v51 = a3 + 48;
      }
      else {
        unsigned __int8 v51 = 58;
      }
      char v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        unsigned int v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            unsigned __int16 v16 = 0;
            char v17 = 1;
            if (v53 < 0x61 || v53 >= v49) {
              goto LABEL_144;
            }
            char v54 = -87;
          }
          else
          {
            char v54 = -55;
          }
        }
        else
        {
          char v54 = -48;
        }
        int v55 = (__int16)v22 * (__int16)a3;
        __int16 v56 = v55;
        if ((__int16)v55 != v55) {
          goto LABEL_143;
        }
        int v22 = (__int16)v55 + (v53 + v54);
        if ((__int16)(v56 + (v53 + v54)) != v22) {
          goto LABEL_143;
        }
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      unsigned __int16 v16 = v22;
      unsigned __int8 v66 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

unsigned __int8 *sub_259F991D4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            int v23 = (__int16)v8 * (__int16)a3;
            __int16 v24 = v23;
            if ((__int16)v23 != v23) {
              goto LABEL_72;
            }
            int v8 = (__int16)v23 + (v21 + v22);
            if ((__int16)(v24 + (v21 + v22)) != v8) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          int v13 = 0;
          unsigned __int16 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int16 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 16));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          LOWORD(v28) = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            int v31 = (__int16)v28 * (__int16)a3;
            __int16 v32 = v31;
            if ((__int16)v31 != v31) {
              goto LABEL_72;
            }
            int v28 = (__int16)v31 + (v29 + v30);
            if ((__int16)(v32 + (v29 + v30)) != v28) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int16 v12 = v28;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          unsigned __int8 v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            int v14 = (__int16)v8 * (__int16)a3;
            __int16 v15 = v14;
            if ((__int16)v14 != v14) {
              goto LABEL_72;
            }
            int v8 = (__int16)v14 - (v10 + v11);
            if ((__int16)(v15 - (v10 + v11)) != v8) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int16 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 16));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F99488(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned __int16 v16 = 0;
    unsigned __int8 v55 = 0;
    goto LABEL_145;
  }
  uint64_t v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t result = sub_259FA22C0();
    }
    int v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        uint64_t v27 = v6 - 1;
        if (v6 != 1)
        {
          unsigned __int8 v28 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v29 = a3 + 55;
          }
          else
          {
            unsigned __int8 v28 = 97;
            unsigned __int8 v29 = 65;
          }
          if (a3 <= 10) {
            unsigned __int8 v30 = a3 + 48;
          }
          else {
            unsigned __int8 v30 = 58;
          }
          if (result)
          {
            LOWORD(v12) = 0;
            int v31 = (unsigned __int8 *)(result + 1);
            do
            {
              unsigned int v32 = *v31;
              if (v32 < 0x30 || v32 >= v30)
              {
                if (v32 < 0x41 || v32 >= v29)
                {
                  unsigned __int16 v16 = 0;
                  char v17 = 1;
                  if (v32 < 0x61 || v32 >= v28) {
                    goto LABEL_144;
                  }
                  char v33 = -87;
                }
                else
                {
                  char v33 = -55;
                }
              }
              else
              {
                char v33 = -48;
              }
              if ((((unsigned __int16)v12 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
                goto LABEL_143;
              }
              int v12 = (unsigned __int16)(v12 * a3) + (v32 + v33);
              if ((v12 & 0x10000) != 0) {
                goto LABEL_143;
              }
              ++v31;
              --v27;
            }
            while (v27);
LABEL_76:
            unsigned __int16 v16 = v12;
            unsigned __int8 v55 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        unsigned __int16 v16 = 0;
        char v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        unsigned __int8 v34 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v35 = a3 + 55;
        }
        else
        {
          unsigned __int8 v34 = 97;
          unsigned __int8 v35 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v36 = a3 + 48;
        }
        else {
          unsigned __int8 v36 = 58;
        }
        if (result)
        {
          LOWORD(v37) = 0;
          do
          {
            unsigned int v38 = *(unsigned __int8 *)result;
            if (v38 < 0x30 || v38 >= v36)
            {
              if (v38 < 0x41 || v38 >= v35)
              {
                unsigned __int16 v16 = 0;
                char v17 = 1;
                if (v38 < 0x61 || v38 >= v34) {
                  goto LABEL_144;
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            int v40 = (unsigned __int16)v37 * (unsigned __int16)a3;
            if ((v40 & 0xFFFF0000) != 0) {
              goto LABEL_143;
            }
            int v37 = (unsigned __int16)(v37 * a3) + (v38 + v39);
            if ((v37 & 0x10000) != 0) {
              goto LABEL_143;
            }
            ++result;
            --v6;
          }
          while (v6);
          unsigned __int16 v16 = v40 + (v38 + v39);
          unsigned __int8 v55 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      uint64_t v8 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v9 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v10 = a3 + 55;
        }
        else
        {
          unsigned __int8 v9 = 97;
          unsigned __int8 v10 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v11 = a3 + 48;
        }
        else {
          unsigned __int8 v11 = 58;
        }
        if (result)
        {
          LOWORD(v12) = 0;
          int v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            unsigned int v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                unsigned __int16 v16 = 0;
                char v17 = 1;
                if (v14 < 0x61 || v14 >= v9) {
                  goto LABEL_144;
                }
                char v15 = -87;
              }
              else
              {
                char v15 = -55;
              }
            }
            else
            {
              char v15 = -48;
            }
            if ((((unsigned __int16)v12 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
              goto LABEL_143;
            }
            int v12 = (unsigned __int16)(v12 * a3) - (v14 + v15);
            if ((v12 & 0xFFFF0000) != 0) {
              goto LABEL_143;
            }
            ++v13;
            if (!--v8) {
              goto LABEL_76;
            }
          }
        }
LABEL_99:
        unsigned __int16 v16 = 0;
        char v17 = 0;
LABEL_144:
        unsigned __int8 v55 = v17;
LABEL_145:
        LOBYTE(v54[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v55 << 16) | (LOBYTE(v54[0]) << 24);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  uint64_t v18 = HIBYTE(a2) & 0xF;
  v54[0] = result;
  v54[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v18)
      {
        LOWORD(v20) = 0;
        unsigned __int8 v48 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v49 = a3 + 55;
        }
        else
        {
          unsigned __int8 v48 = 97;
          unsigned __int8 v49 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v50 = a3 + 48;
        }
        else {
          unsigned __int8 v50 = 58;
        }
        unsigned __int8 v51 = (unsigned __int8 *)v54;
        while (1)
        {
          unsigned int v52 = *v51;
          if (v52 < 0x30 || v52 >= v50)
          {
            if (v52 < 0x41 || v52 >= v49)
            {
              unsigned __int16 v16 = 0;
              char v17 = 1;
              if (v52 < 0x61 || v52 >= v48) {
                goto LABEL_144;
              }
              char v53 = -87;
            }
            else
            {
              char v53 = -55;
            }
          }
          else
          {
            char v53 = -48;
          }
          if ((((unsigned __int16)v20 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
            goto LABEL_143;
          }
          int v20 = (unsigned __int16)(v20 * a3) + (v52 + v53);
          if ((v20 & 0x10000) != 0) {
            goto LABEL_143;
          }
          ++v51;
          if (!--v18) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    if (v18)
    {
      uint64_t v19 = v18 - 1;
      if (v19)
      {
        LOWORD(v20) = 0;
        unsigned __int8 v21 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v22 = a3 + 55;
        }
        else
        {
          unsigned __int8 v21 = 97;
          unsigned __int8 v22 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v23 = a3 + 48;
        }
        else {
          unsigned __int8 v23 = 58;
        }
        __int16 v24 = (unsigned __int8 *)v54 + 1;
        while (1)
        {
          unsigned int v25 = *v24;
          if (v25 < 0x30 || v25 >= v23)
          {
            if (v25 < 0x41 || v25 >= v22)
            {
              unsigned __int16 v16 = 0;
              char v17 = 1;
              if (v25 < 0x61 || v25 >= v21) {
                goto LABEL_144;
              }
              char v26 = -87;
            }
            else
            {
              char v26 = -55;
            }
          }
          else
          {
            char v26 = -48;
          }
          if ((((unsigned __int16)v20 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
            goto LABEL_143;
          }
          int v20 = (unsigned __int16)(v20 * a3) - (v25 + v26);
          if ((v20 & 0xFFFF0000) != 0) {
            goto LABEL_143;
          }
          ++v24;
          if (!--v19) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v18)
  {
    uint64_t v41 = v18 - 1;
    if (v41)
    {
      LOWORD(v20) = 0;
      unsigned __int8 v42 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v43 = a3 + 55;
      }
      else
      {
        unsigned __int8 v42 = 97;
        unsigned __int8 v43 = 65;
      }
      if (a3 <= 10) {
        unsigned __int8 v44 = a3 + 48;
      }
      else {
        unsigned __int8 v44 = 58;
      }
      char v45 = (unsigned __int8 *)v54 + 1;
      do
      {
        unsigned int v46 = *v45;
        if (v46 < 0x30 || v46 >= v44)
        {
          if (v46 < 0x41 || v46 >= v43)
          {
            unsigned __int16 v16 = 0;
            char v17 = 1;
            if (v46 < 0x61 || v46 >= v42) {
              goto LABEL_144;
            }
            char v47 = -87;
          }
          else
          {
            char v47 = -55;
          }
        }
        else
        {
          char v47 = -48;
        }
        if ((((unsigned __int16)v20 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
          goto LABEL_143;
        }
        int v20 = (unsigned __int16)(v20 * a3) + (v46 + v47);
        if ((v20 & 0x10000) != 0) {
          goto LABEL_143;
        }
        ++v45;
        --v41;
      }
      while (v41);
LABEL_142:
      unsigned __int16 v16 = v20;
      unsigned __int8 v55 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

uint64_t sub_259F99A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  v8[0] = sub_259FA20A0();
  v8[1] = v6;
  LODWORD(a4) = sub_259F99AC0(v8, a3, a4);
  swift_bridgeObjectRelease();
  return a4 & 0x1FFFF;
}

uint64_t sub_259F99AC0(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void *, uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v6 = sub_259F97D4C();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *a1 = v6;
    a1[1] = v12;
    unint64_t v7 = v12;
    if ((v12 & 0x2000000000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (void *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
        uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = (void *)sub_259FA22C0();
      }
      goto LABEL_7;
    }
  }
  else if ((v7 & 0x2000000000000000) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = HIBYTE(v7) & 0xF;
  v14[0] = v6;
  v14[1] = v7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = v14;
LABEL_7:
  uint64_t result = a3(v8, v9, a2);
  if (!v3) {
    return result & 0x1FFFF;
  }
  return result;
}

unsigned __int8 *sub_259F99B90(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v14 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v15 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = a3 + 55;
        }
        else
        {
          unsigned __int8 v15 = 97;
          unsigned __int8 v16 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v17 = a3 + 48;
        }
        else {
          unsigned __int8 v17 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          uint64_t v18 = result + 1;
          do
          {
            unsigned int v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v19 < 0x61 || v19 >= v15) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v20 = -87;
              }
              else
              {
                char v20 = -55;
              }
            }
            else
            {
              char v20 = -48;
            }
            if ((((unsigned __int16)v8 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            int v8 = (unsigned __int16)(v8 * a3) + (v19 + v20);
            if ((v8 & 0x10000) != 0) {
              goto LABEL_72;
            }
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          int v13 = 0;
          unsigned __int16 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int16 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 16));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v21 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v22 = a3 + 55;
        }
        else
        {
          unsigned __int8 v21 = 97;
          unsigned __int8 v22 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v23 = a3 + 48;
        }
        else {
          unsigned __int8 v23 = 58;
        }
        if (result)
        {
          LOWORD(v24) = 0;
          do
          {
            unsigned int v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v25 < 0x61 || v25 >= v21) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v26 = -87;
              }
              else
              {
                char v26 = -55;
              }
            }
            else
            {
              char v26 = -48;
            }
            if ((((unsigned __int16)v24 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            int v24 = (unsigned __int16)(v24 * a3) + (v25 + v26);
            if ((v24 & 0x10000) != 0) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int16 v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            if ((((unsigned __int16)v8 * (unsigned __int16)a3) & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            int v8 = (unsigned __int16)(v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFF0000) != 0) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int16 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 16));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F99E38(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned int v16 = 0;
    unsigned __int8 v66 = 0;
    return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
  }
  uint64_t v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      uint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t result = sub_259FA22C0();
    }
    int v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        uint64_t v31 = v6 - 1;
        if (v6 != 1)
        {
          unsigned __int8 v32 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v33 = a3 + 55;
          }
          else
          {
            unsigned __int8 v32 = 97;
            unsigned __int8 v33 = 65;
          }
          if (a3 <= 10) {
            unsigned __int8 v34 = a3 + 48;
          }
          else {
            unsigned __int8 v34 = 58;
          }
          if (result)
          {
            unsigned int v12 = 0;
            unsigned __int8 v35 = (unsigned __int8 *)(result + 1);
            do
            {
              unsigned int v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  unsigned int v16 = 0;
                  char v17 = 1;
                  if (v36 < 0x61 || v36 >= v32) {
                    goto LABEL_144;
                  }
                  char v37 = -87;
                }
                else
                {
                  char v37 = -55;
                }
              }
              else
              {
                char v37 = -48;
              }
              uint64_t v38 = (int)v12 * (uint64_t)(int)a3;
              if (v38 != (int)v38) {
                goto LABEL_143;
              }
              unsigned __int8 v39 = v36 + v37;
              unsigned int v12 = v38 + v39;
              if (__OFADD__(v38, v39)) {
                goto LABEL_143;
              }
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            unsigned int v16 = v12;
            unsigned __int8 v66 = 0;
            return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
          }
          goto LABEL_99;
        }
LABEL_143:
        unsigned int v16 = 0;
        char v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        unsigned __int8 v40 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v41 = a3 + 55;
        }
        else
        {
          unsigned __int8 v40 = 97;
          unsigned __int8 v41 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v42 = a3 + 48;
        }
        else {
          unsigned __int8 v42 = 58;
        }
        if (result)
        {
          int v43 = 0;
          do
          {
            unsigned int v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                unsigned int v16 = 0;
                char v17 = 1;
                if (v44 < 0x61 || v44 >= v40) {
                  goto LABEL_144;
                }
                char v45 = -87;
              }
              else
              {
                char v45 = -55;
              }
            }
            else
            {
              char v45 = -48;
            }
            uint64_t v46 = v43 * (uint64_t)(int)a3;
            if (v46 != (int)v46) {
              goto LABEL_143;
            }
            unsigned __int8 v47 = v44 + v45;
            int v43 = v46 + v47;
            if (__OFADD__(v46, v47)) {
              goto LABEL_143;
            }
            ++result;
            --v6;
          }
          while (v6);
          unsigned int v16 = v46 + v47;
          unsigned __int8 v66 = 0;
          return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      uint64_t v8 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v9 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v10 = a3 + 55;
        }
        else
        {
          unsigned __int8 v9 = 97;
          unsigned __int8 v10 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v11 = a3 + 48;
        }
        else {
          unsigned __int8 v11 = 58;
        }
        if (result)
        {
          unsigned int v12 = 0;
          int v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            unsigned int v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                unsigned int v16 = 0;
                char v17 = 1;
                if (v14 < 0x61 || v14 >= v9) {
                  goto LABEL_144;
                }
                char v15 = -87;
              }
              else
              {
                char v15 = -55;
              }
            }
            else
            {
              char v15 = -48;
            }
            uint64_t v18 = (int)v12 * (uint64_t)(int)a3;
            if (v18 != (int)v18) {
              goto LABEL_143;
            }
            unsigned __int8 v19 = v14 + v15;
            unsigned int v12 = v18 - v19;
            if (__OFSUB__(v18, v19)) {
              goto LABEL_143;
            }
            ++v13;
            if (!--v8) {
              goto LABEL_76;
            }
          }
        }
LABEL_99:
        unsigned int v16 = 0;
        char v17 = 0;
LABEL_144:
        unsigned __int8 v66 = v17;
        return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  uint64_t v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        unsigned int v22 = 0;
        unsigned __int8 v57 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v58 = a3 + 55;
        }
        else
        {
          unsigned __int8 v57 = 97;
          unsigned __int8 v58 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v59 = a3 + 48;
        }
        else {
          unsigned __int8 v59 = 58;
        }
        uint64_t v60 = (unsigned __int8 *)v65;
        while (1)
        {
          unsigned int v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              unsigned int v16 = 0;
              char v17 = 1;
              if (v61 < 0x61 || v61 >= v57) {
                goto LABEL_144;
              }
              char v62 = -87;
            }
            else
            {
              char v62 = -55;
            }
          }
          else
          {
            char v62 = -48;
          }
          uint64_t v63 = (int)v22 * (uint64_t)(int)a3;
          if (v63 != (int)v63) {
            goto LABEL_143;
          }
          unsigned __int8 v64 = v61 + v62;
          unsigned int v22 = v63 + v64;
          if (__OFADD__(v63, v64)) {
            goto LABEL_143;
          }
          ++v60;
          if (!--v20) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      uint64_t v21 = v20 - 1;
      if (v21)
      {
        unsigned int v22 = 0;
        unsigned __int8 v23 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v24 = a3 + 55;
        }
        else
        {
          unsigned __int8 v23 = 97;
          unsigned __int8 v24 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v25 = a3 + 48;
        }
        else {
          unsigned __int8 v25 = 58;
        }
        char v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          unsigned int v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              unsigned int v16 = 0;
              char v17 = 1;
              if (v27 < 0x61 || v27 >= v23) {
                goto LABEL_144;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v29 = (int)v22 * (uint64_t)(int)a3;
          if (v29 != (int)v29) {
            goto LABEL_143;
          }
          unsigned __int8 v30 = v27 + v28;
          unsigned int v22 = v29 - v30;
          if (__OFSUB__(v29, v30)) {
            goto LABEL_143;
          }
          ++v26;
          if (!--v21) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    uint64_t v48 = v20 - 1;
    if (v48)
    {
      unsigned int v22 = 0;
      unsigned __int8 v49 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v50 = a3 + 55;
      }
      else
      {
        unsigned __int8 v49 = 97;
        unsigned __int8 v50 = 65;
      }
      if (a3 <= 10) {
        unsigned __int8 v51 = a3 + 48;
      }
      else {
        unsigned __int8 v51 = 58;
      }
      unsigned int v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        unsigned int v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            unsigned int v16 = 0;
            char v17 = 1;
            if (v53 < 0x61 || v53 >= v49) {
              goto LABEL_144;
            }
            char v54 = -87;
          }
          else
          {
            char v54 = -55;
          }
        }
        else
        {
          char v54 = -48;
        }
        uint64_t v55 = (int)v22 * (uint64_t)(int)a3;
        if (v55 != (int)v55) {
          goto LABEL_143;
        }
        unsigned __int8 v56 = v53 + v54;
        unsigned int v22 = v55 + v56;
        if (__OFADD__(v55, v56)) {
          goto LABEL_143;
        }
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      unsigned int v16 = v22;
      unsigned __int8 v66 = 0;
      return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

unsigned __int8 *sub_259F9A380(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            uint64_t v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__OFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            uint64_t v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__OFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unsigned __int8 v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            uint64_t v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (__OFSUB__(v14, v15)) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F9A600(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned int v16 = 0;
    unsigned __int8 v66 = 0;
    return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
  }
  uint64_t v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      uint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t result = sub_259FA22C0();
    }
    int v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        uint64_t v31 = v6 - 1;
        if (v6 != 1)
        {
          unsigned __int8 v32 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v33 = a3 + 55;
          }
          else
          {
            unsigned __int8 v32 = 97;
            unsigned __int8 v33 = 65;
          }
          if (a3 <= 10) {
            unsigned __int8 v34 = a3 + 48;
          }
          else {
            unsigned __int8 v34 = 58;
          }
          if (result)
          {
            unsigned int v12 = 0;
            unsigned __int8 v35 = (unsigned __int8 *)(result + 1);
            do
            {
              unsigned int v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  unsigned int v16 = 0;
                  char v17 = 1;
                  if (v36 < 0x61 || v36 >= v32) {
                    goto LABEL_144;
                  }
                  char v37 = -87;
                }
                else
                {
                  char v37 = -55;
                }
              }
              else
              {
                char v37 = -48;
              }
              unint64_t v38 = v12 * (unint64_t)a3;
              if ((v38 & 0xFFFFFFFF00000000) != 0) {
                goto LABEL_143;
              }
              unsigned __int8 v39 = v36 + v37;
              unsigned int v12 = v38 + v39;
              if (__CFADD__(v38, v39)) {
                goto LABEL_143;
              }
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            unsigned int v16 = v12;
            unsigned __int8 v66 = 0;
            return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
          }
          goto LABEL_99;
        }
LABEL_143:
        unsigned int v16 = 0;
        char v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        unsigned __int8 v40 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v41 = a3 + 55;
        }
        else
        {
          unsigned __int8 v40 = 97;
          unsigned __int8 v41 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v42 = a3 + 48;
        }
        else {
          unsigned __int8 v42 = 58;
        }
        if (result)
        {
          unsigned int v43 = 0;
          do
          {
            unsigned int v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                unsigned int v16 = 0;
                char v17 = 1;
                if (v44 < 0x61 || v44 >= v40) {
                  goto LABEL_144;
                }
                char v45 = -87;
              }
              else
              {
                char v45 = -55;
              }
            }
            else
            {
              char v45 = -48;
            }
            unint64_t v46 = v43 * (unint64_t)a3;
            if ((v46 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_143;
            }
            unsigned __int8 v47 = v44 + v45;
            unsigned int v43 = v46 + v47;
            if (__CFADD__(v46, v47)) {
              goto LABEL_143;
            }
            ++result;
            --v6;
          }
          while (v6);
          unsigned int v16 = v46 + v47;
          unsigned __int8 v66 = 0;
          return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      uint64_t v8 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v9 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v10 = a3 + 55;
        }
        else
        {
          unsigned __int8 v9 = 97;
          unsigned __int8 v10 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v11 = a3 + 48;
        }
        else {
          unsigned __int8 v11 = 58;
        }
        if (result)
        {
          unsigned int v12 = 0;
          unsigned __int8 v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            unsigned int v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                unsigned int v16 = 0;
                char v17 = 1;
                if (v14 < 0x61 || v14 >= v9) {
                  goto LABEL_144;
                }
                char v15 = -87;
              }
              else
              {
                char v15 = -55;
              }
            }
            else
            {
              char v15 = -48;
            }
            unint64_t v18 = v12 * (unint64_t)a3;
            if ((v18 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_143;
            }
            unsigned __int8 v19 = v14 + v15;
            unsigned int v12 = v18 - v19;
            if (v18 < v19) {
              goto LABEL_143;
            }
            ++v13;
            if (!--v8) {
              goto LABEL_76;
            }
          }
        }
LABEL_99:
        unsigned int v16 = 0;
        char v17 = 0;
LABEL_144:
        unsigned __int8 v66 = v17;
        return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  uint64_t v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        unsigned int v22 = 0;
        unsigned __int8 v57 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v58 = a3 + 55;
        }
        else
        {
          unsigned __int8 v57 = 97;
          unsigned __int8 v58 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v59 = a3 + 48;
        }
        else {
          unsigned __int8 v59 = 58;
        }
        uint64_t v60 = (unsigned __int8 *)v65;
        while (1)
        {
          unsigned int v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              unsigned int v16 = 0;
              char v17 = 1;
              if (v61 < 0x61 || v61 >= v57) {
                goto LABEL_144;
              }
              char v62 = -87;
            }
            else
            {
              char v62 = -55;
            }
          }
          else
          {
            char v62 = -48;
          }
          unint64_t v63 = v22 * (unint64_t)a3;
          if ((v63 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_143;
          }
          unsigned __int8 v64 = v61 + v62;
          unsigned int v22 = v63 + v64;
          if (__CFADD__(v63, v64)) {
            goto LABEL_143;
          }
          ++v60;
          if (!--v20) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      uint64_t v21 = v20 - 1;
      if (v21)
      {
        unsigned int v22 = 0;
        unsigned __int8 v23 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v24 = a3 + 55;
        }
        else
        {
          unsigned __int8 v23 = 97;
          unsigned __int8 v24 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v25 = a3 + 48;
        }
        else {
          unsigned __int8 v25 = 58;
        }
        unsigned __int8 v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          unsigned int v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              unsigned int v16 = 0;
              char v17 = 1;
              if (v27 < 0x61 || v27 >= v23) {
                goto LABEL_144;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          unint64_t v29 = v22 * (unint64_t)a3;
          if ((v29 & 0xFFFFFFFF00000000) != 0) {
            goto LABEL_143;
          }
          unsigned __int8 v30 = v27 + v28;
          unsigned int v22 = v29 - v30;
          if (v29 < v30) {
            goto LABEL_143;
          }
          ++v26;
          if (!--v21) {
            goto LABEL_142;
          }
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    uint64_t v48 = v20 - 1;
    if (v48)
    {
      unsigned int v22 = 0;
      unsigned __int8 v49 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v50 = a3 + 55;
      }
      else
      {
        unsigned __int8 v49 = 97;
        unsigned __int8 v50 = 65;
      }
      if (a3 <= 10) {
        unsigned __int8 v51 = a3 + 48;
      }
      else {
        unsigned __int8 v51 = 58;
      }
      unsigned int v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        unsigned int v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            unsigned int v16 = 0;
            char v17 = 1;
            if (v53 < 0x61 || v53 >= v49) {
              goto LABEL_144;
            }
            char v54 = -87;
          }
          else
          {
            char v54 = -55;
          }
        }
        else
        {
          char v54 = -48;
        }
        unint64_t v55 = v22 * (unint64_t)a3;
        if ((v55 & 0xFFFFFFFF00000000) != 0) {
          goto LABEL_143;
        }
        unsigned __int8 v56 = v53 + v54;
        unsigned int v22 = v55 + v56;
        if (__CFADD__(v55, v56)) {
          goto LABEL_143;
        }
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      unsigned int v16 = v22;
      unsigned __int8 v66 = 0;
      return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

uint64_t sub_259F9AB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  v9[0] = sub_259FA20A0();
  v9[1] = v6;
  unint64_t v7 = sub_259F9ABD8(v9, a3, a4);
  swift_bridgeObjectRelease();
  return v7 | ((HIDWORD(v7) & 1) << 32);
}

unint64_t sub_259F9ABD8(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void *, uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v6 = sub_259F97D4C();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *a1 = v6;
    a1[1] = v12;
    unint64_t v7 = v12;
    if ((v12 & 0x2000000000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x1000000000000000) != 0)
      {
        uint64_t v8 = (void *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
        uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = (void *)sub_259FA22C0();
      }
      goto LABEL_7;
    }
  }
  else if ((v7 & 0x2000000000000000) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = HIBYTE(v7) & 0xF;
  v14[0] = v6;
  v14[1] = v7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = v14;
LABEL_7:
  unint64_t result = a3(v8, v9, a2);
  if (!v3) {
    return result | ((HIDWORD(result) & 1) << 32);
  }
  return result;
}

unsigned __int8 *sub_259F9ACB0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F9AF30(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void *, uint64_t, uint64_t))
{
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    v13[0] = v5;
    v13[1] = v6 & 0xFFFFFFFFFFFFFFLL;
    unsigned __int8 v7 = v13;
    return a3(v7, v8, a2);
  }
  uint64_t v5 = sub_259F97D4C();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v11;
  unint64_t v6 = v11;
  if ((v11 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unsigned __int8 v7 = (void *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unsigned __int8 v7 = (void *)sub_259FA22C0();
  }
  return a3(v7, v8, a2);
}

uint64_t sub_259F9B000(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t result = 0;
    char v65 = 0;
    goto LABEL_128;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t result = sub_259FA22C0();
      uint64_t v5 = (unsigned __int8 *)result;
    }
    int v7 = *v5;
    if (v7 == 43)
    {
      if (v6 < 1)
      {
LABEL_134:
        __break(1u);
        goto LABEL_135;
      }
      uint64_t v30 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v31 = a3 + 55;
        unsigned __int8 v32 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v33 = 58;
        }
        else
        {
          unsigned __int8 v32 = 97;
          unsigned __int8 v31 = 65;
          unsigned __int8 v33 = a3 + 48;
        }
        if (v5)
        {
          uint64_t v12 = 0;
          unsigned __int8 v34 = v5 + 1;
          do
          {
            unsigned int v35 = *v34;
            if (v35 < 0x30 || v35 >= v33)
            {
              if (v35 < 0x41 || v35 >= v31)
              {
                unint64_t result = 0;
                char v16 = 1;
                if (v35 < 0x61 || v35 >= v32) {
                  goto LABEL_88;
                }
                char v36 = -87;
              }
              else
              {
                char v36 = -55;
              }
            }
            else
            {
              char v36 = -48;
            }
            uint64_t v37 = v12 * a3;
            if ((unsigned __int128)(v12 * (__int128)a3) >> 64 != (v12 * a3) >> 63) {
              goto LABEL_129;
            }
            unsigned __int8 v38 = v35 + v36;
            uint64_t v12 = v37 + v38;
            if (__OFADD__(v37, v38)) {
              goto LABEL_129;
            }
            ++v34;
            --v30;
          }
          while (v30);
LABEL_67:
          unint64_t result = v12;
          char v65 = 0;
          goto LABEL_128;
        }
        goto LABEL_87;
      }
    }
    else
    {
      if (v7 == 45)
      {
        if (v6 >= 1)
        {
          uint64_t v8 = v6 - 1;
          if (v6 != 1)
          {
            unsigned __int8 v9 = a3 + 55;
            unsigned __int8 v10 = a3 + 87;
            if (a3 > 10)
            {
              unsigned __int8 v11 = 58;
            }
            else
            {
              unsigned __int8 v10 = 97;
              unsigned __int8 v9 = 65;
              unsigned __int8 v11 = a3 + 48;
            }
            if (v5)
            {
              uint64_t v12 = 0;
              unsigned __int8 v13 = v5 + 1;
              while (1)
              {
                unsigned int v14 = *v13;
                if (v14 < 0x30 || v14 >= v11)
                {
                  if (v14 < 0x41 || v14 >= v9)
                  {
                    unint64_t result = 0;
                    char v16 = 1;
                    if (v14 < 0x61 || v14 >= v10) {
                      goto LABEL_88;
                    }
                    char v15 = -87;
                  }
                  else
                  {
                    char v15 = -55;
                  }
                }
                else
                {
                  char v15 = -48;
                }
                uint64_t v17 = v12 * a3;
                if ((unsigned __int128)(v12 * (__int128)a3) >> 64 != (v12 * a3) >> 63) {
                  goto LABEL_129;
                }
                unsigned __int8 v18 = v14 + v15;
                uint64_t v12 = v17 - v18;
                if (__OFSUB__(v17, v18)) {
                  goto LABEL_129;
                }
                ++v13;
                if (!--v8) {
                  goto LABEL_67;
                }
              }
            }
LABEL_87:
            unint64_t result = 0;
            char v16 = 0;
LABEL_88:
            char v65 = v16;
            goto LABEL_128;
          }
          goto LABEL_129;
        }
        __break(1u);
        goto LABEL_133;
      }
      if (v6)
      {
        unsigned __int8 v39 = a3 + 55;
        unsigned __int8 v40 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v41 = 58;
        }
        else
        {
          unsigned __int8 v40 = 97;
          unsigned __int8 v39 = 65;
          unsigned __int8 v41 = a3 + 48;
        }
        if (!v5) {
          goto LABEL_87;
        }
        uint64_t v42 = 0;
        do
        {
          unsigned int v43 = *v5;
          if (v43 < 0x30 || v43 >= v41)
          {
            if (v43 < 0x41 || v43 >= v39)
            {
              unint64_t result = 0;
              char v16 = 1;
              if (v43 < 0x61 || v43 >= v40) {
                goto LABEL_88;
              }
              char v44 = -87;
            }
            else
            {
              char v44 = -55;
            }
          }
          else
          {
            char v44 = -48;
          }
          uint64_t v45 = v42 * a3;
          if ((unsigned __int128)(v42 * (__int128)a3) >> 64 != (v42 * a3) >> 63) {
            goto LABEL_129;
          }
          unsigned __int8 v46 = v43 + v44;
          uint64_t v42 = v45 + v46;
          if (__OFADD__(v45, v46)) {
            goto LABEL_129;
          }
          ++v5;
          --v6;
        }
        while (v6);
        unint64_t result = v45 + v46;
        char v65 = 0;
LABEL_128:
        LOBYTE(v64[0]) = (a2 & 0x1000000000000000) != 0;
        return result;
      }
    }
LABEL_129:
    unint64_t result = 0;
    char v65 = 1;
    goto LABEL_128;
  }
  uint64_t v19 = HIBYTE(a2) & 0xF;
  v64[0] = result;
  v64[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result == 45)
    {
      if (!v19)
      {
LABEL_133:
        __break(1u);
        goto LABEL_134;
      }
      uint64_t v20 = v19 - 1;
      if (v20)
      {
        uint64_t v21 = 0;
        unsigned __int8 v22 = a3 + 55;
        unsigned __int8 v23 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v24 = 58;
        }
        else
        {
          unsigned __int8 v23 = 97;
          unsigned __int8 v22 = 65;
          unsigned __int8 v24 = a3 + 48;
        }
        unsigned __int8 v25 = (unsigned __int8 *)v64 + 1;
        while (1)
        {
          unsigned int v26 = *v25;
          if (v26 < 0x30 || v26 >= v24)
          {
            if (v26 < 0x41 || v26 >= v22)
            {
              unint64_t result = 0;
              if (v26 < 0x61 || v26 >= v23) {
                goto LABEL_127;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v21 * a3;
          if ((unsigned __int128)(v21 * (__int128)a3) >> 64 != (v21 * a3) >> 63) {
            break;
          }
          unsigned __int8 v29 = v26 + v27;
          uint64_t v21 = v28 - v29;
          if (__OFSUB__(v28, v29)) {
            break;
          }
          ++v25;
          if (!--v20) {
            goto LABEL_125;
          }
        }
      }
    }
    else if (v19)
    {
      uint64_t v21 = 0;
      unsigned __int8 v56 = a3 + 55;
      unsigned __int8 v57 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v58 = 58;
      }
      else
      {
        unsigned __int8 v57 = 97;
        unsigned __int8 v56 = 65;
        unsigned __int8 v58 = a3 + 48;
      }
      unsigned __int8 v59 = (unsigned __int8 *)v64;
      while (1)
      {
        unsigned int v60 = *v59;
        if (v60 < 0x30 || v60 >= v58)
        {
          if (v60 < 0x41 || v60 >= v56)
          {
            unint64_t result = 0;
            if (v60 < 0x61 || v60 >= v57) {
              goto LABEL_127;
            }
            char v61 = -87;
          }
          else
          {
            char v61 = -55;
          }
        }
        else
        {
          char v61 = -48;
        }
        uint64_t v62 = v21 * a3;
        if ((unsigned __int128)(v21 * (__int128)a3) >> 64 != (v21 * a3) >> 63) {
          break;
        }
        unsigned __int8 v63 = v60 + v61;
        uint64_t v21 = v62 + v63;
        if (__OFADD__(v62, v63)) {
          break;
        }
        ++v59;
        if (!--v19) {
          goto LABEL_125;
        }
      }
    }
LABEL_126:
    unint64_t result = 0;
LABEL_127:
    char v65 = 1;
    goto LABEL_128;
  }
  if (v19)
  {
    uint64_t v47 = v19 - 1;
    if (v47)
    {
      uint64_t v21 = 0;
      unsigned __int8 v48 = a3 + 55;
      unsigned __int8 v49 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v50 = 58;
      }
      else
      {
        unsigned __int8 v49 = 97;
        unsigned __int8 v48 = 65;
        unsigned __int8 v50 = a3 + 48;
      }
      unsigned __int8 v51 = (unsigned __int8 *)v64 + 1;
      do
      {
        unsigned int v52 = *v51;
        if (v52 < 0x30 || v52 >= v50)
        {
          if (v52 < 0x41 || v52 >= v48)
          {
            unint64_t result = 0;
            if (v52 < 0x61 || v52 >= v49) {
              goto LABEL_127;
            }
            char v53 = -87;
          }
          else
          {
            char v53 = -55;
          }
        }
        else
        {
          char v53 = -48;
        }
        uint64_t v54 = v21 * a3;
        if ((unsigned __int128)(v21 * (__int128)a3) >> 64 != (v21 * a3) >> 63) {
          goto LABEL_126;
        }
        unsigned __int8 v55 = v52 + v53;
        uint64_t v21 = v54 + v55;
        if (__OFADD__(v54, v55)) {
          goto LABEL_126;
        }
        ++v51;
        --v47;
      }
      while (v47);
LABEL_125:
      unint64_t result = v21;
      char v65 = 0;
      goto LABEL_128;
    }
    goto LABEL_126;
  }
LABEL_135:
  __break(1u);
  return result;
}

unsigned __int8 *sub_259F9B570(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v23 = a3 + 48;
      unsigned __int8 v24 = a3 + 55;
      unsigned __int8 v25 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v23 = 58;
      }
      else
      {
        unsigned __int8 v25 = 97;
        unsigned __int8 v24 = 65;
      }
      if (result)
      {
        uint64_t v26 = 0;
        do
        {
          unsigned int v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              uint64_t v13 = 0;
              if (v27 < 0x61 || v27 >= v25) {
                return (unsigned __int8 *)v13;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
            return 0;
          }
          uint64_t v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v15 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v16 = a3 + 48;
  unsigned __int8 v17 = a3 + 55;
  unsigned __int8 v18 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v16 = 58;
  }
  else
  {
    unsigned __int8 v18 = 97;
    unsigned __int8 v17 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v19 = result + 1;
  do
  {
    unsigned int v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        uint64_t v13 = 0;
        if (v20 < 0x61 || v20 >= v18) {
          return (unsigned __int8 *)v13;
        }
        char v21 = -87;
      }
      else
      {
        char v21 = -55;
      }
    }
    else
    {
      char v21 = -48;
    }
    uint64_t v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21))) {
      return 0;
    }
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_259F9B7EC(uint64_t result, unint64_t a2, int64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t result = 0;
    char v66 = 0;
    goto LABEL_130;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t result = sub_259FA22C0();
      uint64_t v5 = (unsigned __int8 *)result;
    }
    int v7 = *v5;
    if (v7 == 43)
    {
      if (v6 < 1)
      {
LABEL_136:
        __break(1u);
        goto LABEL_137;
      }
      uint64_t v31 = v6 - 1;
      if (v6 != 1)
      {
        unsigned __int8 v32 = a3 + 55;
        unsigned __int8 v33 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v34 = 58;
        }
        else
        {
          unsigned __int8 v33 = 97;
          unsigned __int8 v32 = 65;
          unsigned __int8 v34 = a3 + 48;
        }
        if (v5)
        {
          unint64_t v12 = 0;
          unsigned int v35 = v5 + 1;
          do
          {
            unsigned int v36 = *v35;
            if (v36 < 0x30 || v36 >= v34)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                unint64_t result = 0;
                char v16 = 1;
                if (v36 < 0x61 || v36 >= v33) {
                  goto LABEL_90;
                }
                char v37 = -87;
              }
              else
              {
                char v37 = -55;
              }
            }
            else
            {
              char v37 = -48;
            }
            if (!is_mul_ok(v12, a3)) {
              goto LABEL_131;
            }
            unint64_t v38 = v12 * a3;
            unsigned __int8 v39 = v36 + v37;
            BOOL v19 = __CFADD__(v38, v39);
            unint64_t v12 = v38 + v39;
            if (v19) {
              goto LABEL_131;
            }
            ++v35;
            --v31;
          }
          while (v31);
LABEL_69:
          unint64_t result = v12;
          char v66 = 0;
          goto LABEL_130;
        }
        goto LABEL_89;
      }
    }
    else
    {
      if (v7 == 45)
      {
        if (v6 >= 1)
        {
          uint64_t v8 = v6 - 1;
          if (v6 != 1)
          {
            unsigned __int8 v9 = a3 + 55;
            unsigned __int8 v10 = a3 + 87;
            if (a3 > 10)
            {
              unsigned __int8 v11 = 58;
            }
            else
            {
              unsigned __int8 v10 = 97;
              unsigned __int8 v9 = 65;
              unsigned __int8 v11 = a3 + 48;
            }
            if (v5)
            {
              unint64_t v12 = 0;
              uint64_t v13 = v5 + 1;
              while (1)
              {
                unsigned int v14 = *v13;
                if (v14 < 0x30 || v14 >= v11)
                {
                  if (v14 < 0x41 || v14 >= v9)
                  {
                    unint64_t result = 0;
                    char v16 = 1;
                    if (v14 < 0x61 || v14 >= v10) {
                      goto LABEL_90;
                    }
                    char v15 = -87;
                  }
                  else
                  {
                    char v15 = -55;
                  }
                }
                else
                {
                  char v15 = -48;
                }
                if (!is_mul_ok(v12, a3)) {
                  goto LABEL_131;
                }
                unint64_t v17 = v12 * a3;
                unsigned __int8 v18 = v14 + v15;
                BOOL v19 = v17 >= v18;
                unint64_t v12 = v17 - v18;
                if (!v19) {
                  goto LABEL_131;
                }
                ++v13;
                if (!--v8) {
                  goto LABEL_69;
                }
              }
            }
LABEL_89:
            unint64_t result = 0;
            char v16 = 0;
LABEL_90:
            char v66 = v16;
            goto LABEL_130;
          }
          goto LABEL_131;
        }
        __break(1u);
        goto LABEL_135;
      }
      if (v6)
      {
        unsigned __int8 v40 = a3 + 55;
        unsigned __int8 v41 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v42 = 58;
        }
        else
        {
          unsigned __int8 v41 = 97;
          unsigned __int8 v40 = 65;
          unsigned __int8 v42 = a3 + 48;
        }
        if (!v5) {
          goto LABEL_89;
        }
        unint64_t v43 = 0;
        do
        {
          unsigned int v44 = *v5;
          if (v44 < 0x30 || v44 >= v42)
          {
            if (v44 < 0x41 || v44 >= v40)
            {
              unint64_t result = 0;
              char v16 = 1;
              if (v44 < 0x61 || v44 >= v41) {
                goto LABEL_90;
              }
              char v45 = -87;
            }
            else
            {
              char v45 = -55;
            }
          }
          else
          {
            char v45 = -48;
          }
          if (!is_mul_ok(v43, a3)) {
            goto LABEL_131;
          }
          unint64_t v46 = v43 * a3;
          unsigned __int8 v47 = v44 + v45;
          BOOL v19 = __CFADD__(v46, v47);
          unint64_t v43 = v46 + v47;
          if (v19) {
            goto LABEL_131;
          }
          ++v5;
          --v6;
        }
        while (v6);
        unint64_t result = v43;
        char v66 = 0;
LABEL_130:
        LOBYTE(v65[0]) = (a2 & 0x1000000000000000) != 0;
        return result;
      }
    }
LABEL_131:
    unint64_t result = 0;
    char v66 = 1;
    goto LABEL_130;
  }
  uint64_t v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result == 45)
    {
      if (!v20)
      {
LABEL_135:
        __break(1u);
        goto LABEL_136;
      }
      uint64_t v21 = v20 - 1;
      if (v21)
      {
        unint64_t v22 = 0;
        unsigned __int8 v23 = a3 + 55;
        unsigned __int8 v24 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v25 = 58;
        }
        else
        {
          unsigned __int8 v24 = 97;
          unsigned __int8 v23 = 65;
          unsigned __int8 v25 = a3 + 48;
        }
        uint64_t v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          unsigned int v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v23)
            {
              unint64_t result = 0;
              if (v27 < 0x61 || v27 >= v24) {
                goto LABEL_129;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          if (!is_mul_ok(v22, a3)) {
            break;
          }
          unint64_t v29 = v22 * a3;
          unsigned __int8 v30 = v27 + v28;
          BOOL v19 = v29 >= v30;
          unint64_t v22 = v29 - v30;
          if (!v19) {
            break;
          }
          ++v26;
          if (!--v21) {
            goto LABEL_127;
          }
        }
      }
    }
    else if (v20)
    {
      unint64_t v22 = 0;
      unsigned __int8 v57 = a3 + 55;
      unsigned __int8 v58 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v59 = 58;
      }
      else
      {
        unsigned __int8 v58 = 97;
        unsigned __int8 v57 = 65;
        unsigned __int8 v59 = a3 + 48;
      }
      unsigned int v60 = (unsigned __int8 *)v65;
      while (1)
      {
        unsigned int v61 = *v60;
        if (v61 < 0x30 || v61 >= v59)
        {
          if (v61 < 0x41 || v61 >= v57)
          {
            unint64_t result = 0;
            if (v61 < 0x61 || v61 >= v58) {
              goto LABEL_129;
            }
            char v62 = -87;
          }
          else
          {
            char v62 = -55;
          }
        }
        else
        {
          char v62 = -48;
        }
        if (!is_mul_ok(v22, a3)) {
          break;
        }
        unint64_t v63 = v22 * a3;
        unsigned __int8 v64 = v61 + v62;
        BOOL v19 = __CFADD__(v63, v64);
        unint64_t v22 = v63 + v64;
        if (v19) {
          break;
        }
        ++v60;
        if (!--v20) {
          goto LABEL_127;
        }
      }
    }
LABEL_128:
    unint64_t result = 0;
LABEL_129:
    char v66 = 1;
    goto LABEL_130;
  }
  if (v20)
  {
    uint64_t v48 = v20 - 1;
    if (v48)
    {
      unint64_t v22 = 0;
      unsigned __int8 v49 = a3 + 55;
      unsigned __int8 v50 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v51 = 58;
      }
      else
      {
        unsigned __int8 v50 = 97;
        unsigned __int8 v49 = 65;
        unsigned __int8 v51 = a3 + 48;
      }
      unsigned int v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        unsigned int v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v49)
          {
            unint64_t result = 0;
            if (v53 < 0x61 || v53 >= v50) {
              goto LABEL_129;
            }
            char v54 = -87;
          }
          else
          {
            char v54 = -55;
          }
        }
        else
        {
          char v54 = -48;
        }
        if (!is_mul_ok(v22, a3)) {
          goto LABEL_128;
        }
        unint64_t v55 = v22 * a3;
        unsigned __int8 v56 = v53 + v54;
        BOOL v19 = __CFADD__(v55, v56);
        unint64_t v22 = v55 + v56;
        if (v19) {
          goto LABEL_128;
        }
        ++v52;
        --v48;
      }
      while (v48);
LABEL_127:
      unint64_t result = v22;
      char v66 = 0;
      goto LABEL_130;
    }
    goto LABEL_128;
  }
LABEL_137:
  __break(1u);
  return result;
}

uint64_t sub_259F9BD5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  v9[0] = sub_259FA20A0();
  v9[1] = v6;
  uint64_t v7 = sub_259F9AF30(v9, a3, a4);
  swift_bridgeObjectRelease();
  return v7;
}

unsigned __int8 *sub_259F9BDEC(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            unint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v14 = v9 * a3;
              unsigned __int8 v15 = v11 + v12;
              BOOL v16 = v14 >= v15;
              unint64_t v9 = v14 - v15;
              if (!v16) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_67;
    }
    if (a2)
    {
      unsigned __int8 v26 = a3 + 48;
      unsigned __int8 v27 = a3 + 55;
      unsigned __int8 v28 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v26 = 58;
      }
      else
      {
        unsigned __int8 v28 = 97;
        unsigned __int8 v27 = 65;
      }
      if (result)
      {
        unint64_t v29 = 0;
        do
        {
          unsigned int v30 = *result;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              uint64_t v13 = 0;
              if (v30 < 0x61 || v30 >= v28) {
                return (unsigned __int8 *)v13;
              }
              char v31 = -87;
            }
            else
            {
              char v31 = -55;
            }
          }
          else
          {
            char v31 = -48;
          }
          if (!is_mul_ok(v29, a3)) {
            return 0;
          }
          unint64_t v32 = v29 * a3;
          unsigned __int8 v33 = v30 + v31;
          BOOL v16 = __CFADD__(v32, v33);
          unint64_t v29 = v32 + v33;
          if (v16) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v29;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_67:
    __break(1u);
    return result;
  }
  uint64_t v17 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v18 = a3 + 48;
  unsigned __int8 v19 = a3 + 55;
  unsigned __int8 v20 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v18 = 58;
  }
  else
  {
    unsigned __int8 v20 = 97;
    unsigned __int8 v19 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  uint64_t v21 = result + 1;
  do
  {
    unsigned int v22 = *v21;
    if (v22 < 0x30 || v22 >= v18)
    {
      if (v22 < 0x41 || v22 >= v19)
      {
        uint64_t v13 = 0;
        if (v22 < 0x61 || v22 >= v20) {
          return (unsigned __int8 *)v13;
        }
        char v23 = -87;
      }
      else
      {
        char v23 = -55;
      }
    }
    else
    {
      char v23 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v24 = v9 * a3;
    unsigned __int8 v25 = v22 + v23;
    BOOL v16 = __CFADD__(v24, v25);
    unint64_t v9 = v24 + v25;
    if (v16) {
      return 0;
    }
    ++v21;
    --v17;
  }
  while (v17);
  return (unsigned __int8 *)v9;
}

uint64_t sub_259F9C068(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_259F9C0CC(long long *a1, uint64_t a2)
{
  return sub_259F972A0(a1, a2);
}

uint64_t sub_259F9C0E4(long long *a1, uint64_t a2)
{
  return sub_259F97384(a1, a2);
}

void *static SQLiteType.getSQLNonNullDataType()@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(a1 + 24))(&v6);
  char v4 = 0;
  switch((char)v6)
  {
    case 1:
      *a2 = 2;
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
      goto LABEL_2;
    case 6:
    case 7:
    case 8:
      *a2 = 3;
      break;
    case 10:
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v5 = 0xD00000000000003ELL;
      *(void *)(v5 + 8) = 0x8000000259FA2C50;
      *(void *)(v5 + 16) = 0;
      *(unsigned char *)(v5 + 24) = 4;
      uint64_t result = (void *)swift_willThrow();
      break;
    default:
      char v4 = 1;
LABEL_2:
      *a2 = v4;
      break;
  }
  return result;
}

uint64_t sub_259F9C210(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)uint64_t v7 = v8;
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(unsigned char *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_column_int(v3, a2);
  if ((int)result < -128)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(void *)uint64_t v6 = 8;
    *(unsigned char *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  if ((int)result > 127)
  {
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_259F9C350(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)uint64_t v7 = v8;
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(unsigned char *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_column_int(v3, a2);
  if ((int)result < -32768)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(void *)uint64_t v6 = 8;
    *(unsigned char *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  if ((int)result >= 0x8000)
  {
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_259F9C490(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 4;
LABEL_8:
    *(void *)uint64_t v6 = v7;
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(unsigned char *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 3;
    goto LABEL_8;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    return sqlite3_column_int(v3, a2);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F9C580(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16)) {
    goto LABEL_9;
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 3;
    goto LABEL_10;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_column_int(v3, a2);
  if ((result & 0x80000000) != 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v8 + 8) = 0;
    *(void *)(v8 + 16) = 0;
    *(void *)uint64_t v8 = 8;
    *(unsigned char *)(v8 + 24) = 5;
    return swift_willThrow();
  }
  if (result >= 0x100)
  {
    sub_259FA2350();
    __break(1u);
LABEL_9:
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 4;
LABEL_10:
    *(void *)uint64_t v6 = v7;
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(unsigned char *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_259F9C708(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16)) {
    goto LABEL_9;
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 3;
    goto LABEL_10;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_column_int(v3, a2);
  if ((result & 0x80000000) != 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v8 + 8) = 0;
    *(void *)(v8 + 16) = 0;
    *(void *)uint64_t v8 = 8;
    *(unsigned char *)(v8 + 24) = 5;
    return swift_willThrow();
  }
  if (WORD1(result))
  {
    __break(1u);
LABEL_9:
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 4;
LABEL_10:
    *(void *)uint64_t v6 = v7;
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(unsigned char *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_259F9C844(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)uint64_t v7 = v8;
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(unsigned char *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_column_int(v3, a2);
  if ((result & 0x80000000) != 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(void *)uint64_t v6 = 8;
    *(unsigned char *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  return result;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSafeType.getSQLDataType()()
{
  return sub_259F9E01C(v0, v1);
}

uint64_t sub_259F9C98C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = *v3;
  *(void *)(a3 + 24) = result;
  *(void *)(a3 + 32) = a2;
  *(unsigned char *)a3 = v4;
  return result;
}

uint64_t sub_259F9C9A0@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9CBA4(a1, a2, a3, a4, &qword_26A401BD8, &qword_26A401BE0, a5, sub_259F9C210);
}

uint64_t static SQLiteSafeType.create(from:at:nullable:)@<X0>(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v7 = v6;
  uint64_t v12 = *a2;
  if ((a3 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v19 = *a2;
  uint64_t result = SQLiteRow.type(at:)(at);
  uint64_t v7 = v14;
  if (v14) {
    return result;
  }
  if (v18 == 4)
  {
    a6[3] = sub_259FA21E0();
    a6[4] = swift_getWitnessTable();
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a6);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(boxed_opaque_existential_1, 1, 1, a4);
  }
  else
  {
LABEL_5:
    uint64_t v19 = v12;
    BOOL v16 = *(uint64_t (**)(uint64_t *, Swift::Int, uint64_t, uint64_t))(a5 + 16);
    uint64_t v17 = *(void *)(a5 + 8);
    a6[3] = a4;
    a6[4] = v17;
    __swift_allocate_boxed_opaque_existential_1(a6);
    swift_retain();
    uint64_t result = v16(&v19, at, a4, a5);
    if (v7) {
      return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a6);
    }
  }
  return result;
}

uint64_t sub_259F9CB58@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9CBA4(a1, a2, a3, a4, &qword_26A401BC8, &qword_26A401BD0, a5, sub_259F9C580);
}

uint64_t sub_259F9CBA4@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X8>, uint64_t (*a8)(uint64_t, Swift::Int))
{
  uint64_t v11 = v8;
  if ((a2 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = SQLiteRow.type(at:)(at);
  uint64_t v11 = v17;
  if (v17) {
    return result;
  }
  if (v19 == 4)
  {
    *(void *)(a7 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t result = sub_259F9FFE8(a6, a5);
    *(void *)(a7 + 32) = result;
    *(_WORD *)a7 = 256;
  }
  else
  {
LABEL_5:
    *(void *)(a7 + 24) = a3;
    *(void *)(a7 + 32) = a4;
    uint64_t v18 = swift_retain();
    uint64_t result = a8(v18, at);
    if (v11) {
      return __swift_deallocate_boxed_opaque_existential_1(a7);
    }
    else {
      *(unsigned char *)a7 = result;
    }
  }
  return result;
}

void sub_259F9CCA0(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_259F9CCA8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v4 = *v3;
  *(void *)(a3 + 24) = result;
  *(void *)(a3 + 32) = a2;
  *(_WORD *)a3 = v4;
  return result;
}

uint64_t sub_259F9CCB8@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9CD50(a1, a2, a3, a4, &qword_26A401BB8, &qword_26A401BC0, a5, sub_259F9C350);
}

uint64_t sub_259F9CD04@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9CD50(a1, a2, a3, a4, &qword_26A401BA8, &qword_26A401BB0, a5, sub_259F9C708);
}

uint64_t sub_259F9CD50@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X8>, uint64_t (*a8)(uint64_t, Swift::Int))
{
  uint64_t v11 = v8;
  if ((a2 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = SQLiteRow.type(at:)(at);
  uint64_t v11 = v17;
  if (v17) {
    return result;
  }
  if (v19 == 4)
  {
    *(void *)(a7 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t result = sub_259F9FFE8(a6, a5);
    *(void *)(a7 + 32) = result;
    *(_WORD *)a7 = 0;
    *(unsigned char *)(a7 + 2) = 1;
  }
  else
  {
LABEL_5:
    *(void *)(a7 + 24) = a3;
    *(void *)(a7 + 32) = a4;
    uint64_t v18 = swift_retain();
    uint64_t result = a8(v18, at);
    if (v11) {
      return __swift_deallocate_boxed_opaque_existential_1(a7);
    }
    else {
      *(_WORD *)a7 = result;
    }
  }
  return result;
}

uint64_t sub_259F9CE50@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v4 = *v3;
  *(void *)(a3 + 24) = result;
  *(void *)(a3 + 32) = a2;
  *(_DWORD *)a3 = v4;
  return result;
}

uint64_t sub_259F9CE60@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9CEF8(a1, a2, a3, a4, &qword_26A401B98, &qword_26A401BA0, a5, sub_259F9C490);
}

uint64_t sub_259F9CEAC@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9CEF8(a1, a2, a3, a4, &qword_26A401B88, &qword_26A401B90, a5, sub_259F9C844);
}

uint64_t sub_259F9CEF8@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X8>, uint64_t (*a8)(uint64_t, Swift::Int))
{
  uint64_t v11 = v8;
  if ((a2 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = SQLiteRow.type(at:)(at);
  uint64_t v11 = v17;
  if (v17) {
    return result;
  }
  if (v19 == 4)
  {
    *(void *)(a7 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t result = sub_259F9FFE8(a6, a5);
    *(void *)(a7 + 32) = result;
    *(_DWORD *)a7 = 0;
    *(unsigned char *)(a7 + 4) = 1;
  }
  else
  {
LABEL_5:
    *(void *)(a7 + 24) = a3;
    *(void *)(a7 + 32) = a4;
    uint64_t v18 = swift_retain();
    uint64_t result = a8(v18, at);
    if (v11) {
      return __swift_deallocate_boxed_opaque_existential_1(a7);
    }
    else {
      *(_DWORD *)a7 = result;
    }
  }
  return result;
}

sqlite3_int64 sub_259F9CFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 4;
LABEL_8:
    *(void *)uint64_t v6 = v7;
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(unsigned char *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v7 = 3;
    goto LABEL_8;
  }
  sqlite3_int64 result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    return sqlite3_column_int64(v3, a2);
  }
  __break(1u);
  return result;
}

uint64_t sub_259F9D0E8(uint64_t a1, uint64_t a2)
{
  return sub_259F9D100(a1, a2);
}

uint64_t sub_259F9D100(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || !*(void *)(v2 + 16))
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 4;
LABEL_9:
    *(void *)uint64_t v7 = v8;
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(unsigned char *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v8 = 3;
    goto LABEL_9;
  }
  uint64_t result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t result = sqlite3_column_int64(v3, a2);
  if (result < 0)
  {
    sub_259F7C520();
    swift_allocError();
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
    *(void *)uint64_t v6 = 8;
    *(unsigned char *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_259F9D230@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9D400(a1, a2, a3, a4, &qword_26A401B78, &qword_26A401B80, a5, sub_259F9CFF8);
}

uint64_t sub_259F9D27C@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9D2AC(a1, a2, a3, a4, &qword_26A401B68, &qword_26A401B70, a5);
}

uint64_t sub_259F9D2AC@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v10 = v7;
  if ((a2 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = SQLiteRow.type(at:)(at);
  uint64_t v10 = v16;
  if (v16) {
    return result;
  }
  if (v18 == 4)
  {
    *(void *)(a7 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t result = sub_259F9FFE8(a6, a5);
    *(void *)(a7 + 32) = result;
    *(void *)a7 = 0;
    *(unsigned char *)(a7 + 8) = 1;
  }
  else
  {
LABEL_5:
    *(void *)(a7 + 24) = a3;
    *(void *)(a7 + 32) = a4;
    uint64_t v17 = swift_retain();
    uint64_t result = sub_259F9D100(v17, at);
    if (v10) {
      return __swift_deallocate_boxed_opaque_existential_1(a7);
    }
    else {
      *(void *)a7 = result;
    }
  }
  return result;
}

uint64_t sub_259F9D3A4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *v3;
  a3[3] = result;
  a3[4] = a2;
  *a3 = v4;
  return result;
}

uint64_t sub_259F9D3B4@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9D400(a1, a2, a3, a4, &qword_26A401B58, &qword_26A401B60, a5, sub_259F9CFF8);
}

uint64_t sub_259F9D400@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X8>, uint64_t (*a8)(uint64_t, Swift::Int))
{
  uint64_t v11 = v8;
  if ((a2 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = SQLiteRow.type(at:)(at);
  uint64_t v11 = v17;
  if (v17) {
    return result;
  }
  if (v19 == 4)
  {
    *(void *)(a7 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t result = sub_259F9FFE8(a6, a5);
    *(void *)(a7 + 32) = result;
    *(void *)a7 = 0;
    *(unsigned char *)(a7 + 8) = 1;
  }
  else
  {
LABEL_5:
    *(void *)(a7 + 24) = a3;
    *(void *)(a7 + 32) = a4;
    uint64_t v18 = swift_retain();
    uint64_t result = a8(v18, at);
    if (v11) {
      return __swift_deallocate_boxed_opaque_existential_1(a7);
    }
    else {
      *(void *)a7 = result;
    }
  }
  return result;
}

uint64_t sub_259F9D500@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_259F9D2AC(a1, a2, a3, a4, &qword_26A401B48, &qword_26A401B50, a5);
}

uint64_t static SQLiteType.sqlNull.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  a2[3] = sub_259FA21E0();
  a2[4] = swift_getWitnessTable();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(boxed_opaque_existential_1, 1, 1, a1);
}

uint64_t SQLiteType.isEqualTo(sqlValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v36[1] = a3;
  uint64_t v42 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  v36[0] = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259FA21E0();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v37 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v12 = (char *)v36 - v11;
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v13 = v40;
  uint64_t v14 = MEMORY[0x270FA5388](v10);
  unsigned __int8 v39 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v36 - v17;
  MEMORY[0x270FA5388](v16);
  unsigned __int8 v20 = (char *)v36 - v19;
  uint64_t v43 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v36 - v19, v4, a2);
  uint64_t v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  v21(v20, 0, 1, a2);
  sub_259F800A0(v42, (uint64_t)v44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BE8);
  int v22 = swift_dynamicCast();
  v21(v18, v22 ^ 1u, 1, a2);
  uint64_t v38 = TupleTypeMetadata2;
  char v23 = &v12[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v42 = v13;
  unint64_t v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v24(v12, v20, v8);
  unsigned __int8 v41 = v18;
  unsigned __int8 v25 = v18;
  unsigned __int8 v26 = v12;
  uint64_t v27 = v8;
  v24(v23, v25, v8);
  unsigned __int8 v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48);
  if (v28(v26, 1, a2) != 1)
  {
    v24(v39, v26, v8);
    if (v28(v23, 1, a2) != 1)
    {
      uint64_t v31 = v43;
      uint64_t v32 = v36[0];
      (*(void (**)(void, char *, uint64_t))(v43 + 32))(v36[0], v23, a2);
      unsigned __int8 v33 = v39;
      char v30 = sub_259FA1F50();
      unsigned __int8 v34 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v34(v32, a2);
      unint64_t v29 = *(void (**)(char *, uint64_t))(v40 + 8);
      v29(v20, v27);
      v34((uint64_t)v33, a2);
      v29(v26, v27);
      goto LABEL_8;
    }
    unint64_t v29 = *(void (**)(char *, uint64_t))(v40 + 8);
    v29(v20, v8);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v39, a2);
    goto LABEL_6;
  }
  unint64_t v29 = *(void (**)(char *, uint64_t))(v40 + 8);
  v29(v20, v8);
  if (v28(v23, 1, a2) != 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v38);
    char v30 = 0;
    goto LABEL_8;
  }
  v29(v26, v8);
  char v30 = 1;
LABEL_8:
  v29(v41, v27);
  return v30 & 1;
}

uint64_t SQLiteType.assumingType<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_259FA21E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - v11;
  MEMORY[0x270FA5388](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a1);
  char v15 = swift_dynamicCast();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56);
  if (v15)
  {
    uint64_t v17 = *(void *)(a2 - 8);
    v16(v12, 0, 1, a2);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(a3, v12, a2);
  }
  else
  {
    v16(v12, 1, 1, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_259FA2290();
    swift_bridgeObjectRelease();
    uint64_t v22 = 0x6465746365707845;
    unint64_t v23 = 0xE900000000000020;
    sub_259FA24B0();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    sub_259FA24B0();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    uint64_t v19 = v22;
    unint64_t v20 = v23;
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v21 = v19;
    *(void *)(v21 + 8) = v20;
    *(void *)(v21 + 16) = 0;
    *(unsigned char *)(v21 + 24) = 3;
    return swift_willThrow();
  }
}

uint64_t static SQLiteUnsafeType.sqlNullable.getter()
{
  return 0;
}

uint64_t static SQLiteUnsafeType.create(from:at:nullable:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  int v27 = a3;
  unsigned __int8 v26 = a6;
  uint64_t v11 = sub_259FA21E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - v13;
  uint64_t v29 = *a1;
  char v15 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a5 + 16);
  swift_retain();
  uint64_t result = v15(&v29, a2, a4, a5);
  if (!v6)
  {
    uint64_t v17 = v12;
    char v18 = v27;
    uint64_t v19 = v26;
    uint64_t v20 = *(void *)(a4 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v14, 1, a4) == 1)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v11);
      if (v18)
      {
        v19[3] = v11;
        uint64_t v28 = *(void *)(a5 + 8);
        v19[4] = swift_getWitnessTable();
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
        return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v20 + 56))(boxed_opaque_existential_1, 1, 1, a4);
      }
      else
      {
        sub_259F7C520();
        swift_allocError();
        *(void *)(v24 + 8) = 0;
        *(void *)(v24 + 16) = 0;
        *(void *)uint64_t v24 = 6;
        *(unsigned char *)(v24 + 24) = 5;
        return swift_willThrow();
      }
    }
    else
    {
      uint64_t v22 = *(void *)(a5 + 8);
      v19[3] = a4;
      v19[4] = v22;
      unint64_t v23 = __swift_allocate_boxed_opaque_existential_1(v19);
      return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v20 + 32))(v23, v14, a4);
    }
  }
  return result;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteUnsafeType.getSQLDataType()()
{
  return sub_259F9E01C(v0, v1);
}

void *sub_259F9E01C@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(*(void *)(a1 + 8) + 24))(&v6);
  char v4 = 0;
  switch((char)v6)
  {
    case 1:
      *a2 = 2;
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
      goto LABEL_2;
    case 6:
    case 7:
    case 8:
      *a2 = 3;
      break;
    case 10:
      sub_259F7C520();
      swift_allocError();
      *(void *)uint64_t v5 = 0xD00000000000003ELL;
      *(void *)(v5 + 8) = 0x8000000259FA2C50;
      *(void *)(v5 + 16) = 0;
      *(unsigned char *)(v5 + 24) = 4;
      uint64_t result = (void *)swift_willThrow();
      break;
    default:
      char v4 = 1;
LABEL_2:
      *a2 = v4;
      break;
  }
  return result;
}

uint64_t _s12PoirotSQLite0B8SafeTypePAAE16unwrapIfOptionalAA0bD0_pSgyF_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 + 8);
  a3[3] = a1;
  a3[4] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16);

  return v8(boxed_opaque_existential_1, v3, a1);
}

void static Bool.sqlColumnType.getter(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t static Bool.create(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_259FA1FA0();
  uint64_t v4 = v2;
  if (v3 == 1702195828 && v2 == 0xE400000000000000 || (sub_259FA2400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 1;
  }
  else if (v3 == 0x65736C6166 && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
  else
  {
    char v7 = sub_259FA2400();
    swift_bridgeObjectRelease();
    char v5 = 0;
    if ((v7 & 1) == 0) {
      char v5 = 2;
    }
  }
  *(void *)(a1 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BF0);
  uint64_t result = sub_259F9FFE8(&qword_26A401BF8, &qword_26A401BF0);
  *(void *)(a1 + 32) = result;
  *(unsigned char *)a1 = v5;
  return result;
}

void sub_259F9E2E8(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_259F9E2F4@<X0>(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9 = v6;
  uint64_t v12 = *a2;
  if ((a3 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v17 = *a2;
  uint64_t result = SQLiteRow.type(at:)(at);
  uint64_t v9 = v14;
  if (v14) {
    return result;
  }
  if (v16 == 4)
  {
    *(void *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BF0);
    uint64_t result = sub_259F9FFE8(&qword_26A401BF8, &qword_26A401BF0);
    *(void *)(a6 + 32) = result;
    char v15 = 2;
  }
  else
  {
LABEL_5:
    uint64_t v17 = v12;
    *(void *)(a6 + 24) = a4;
    *(void *)(a6 + 32) = a5;
    swift_retain();
    uint64_t result = sub_259F85EB0((uint64_t)&v17, at);
    if (v9) {
      return __swift_deallocate_boxed_opaque_existential_1(a6);
    }
    char v15 = result & 1;
  }
  *(unsigned char *)a6 = v15;
  return result;
}

uint64_t sub_259F9E3F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_259FA1FA0();
  uint64_t v4 = v2;
  if (v3 == 1702195828 && v2 == 0xE400000000000000 || (sub_259FA2400() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 1;
  }
  else if (v3 == 0x65736C6166 && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
  else
  {
    char v7 = sub_259FA2400();
    swift_bridgeObjectRelease();
    char v5 = 0;
    if ((v7 & 1) == 0) {
      char v5 = 2;
    }
  }
  *(void *)(a1 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401BF0);
  uint64_t result = sub_259F9FFE8(&qword_26A401BF8, &qword_26A401BF0);
  *(void *)(a1 + 32) = result;
  *(unsigned char *)a1 = v5;
  return result;
}

void static Float.sqlColumnType.getter(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t static Float.create(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_259FA2280();
    swift_bridgeObjectRelease();
    char v8 = v12;
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      switch((char)a1)
      {
        case 0:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 32:
          swift_bridgeObjectRetain();
          goto LABEL_9;
        default:
          swift_bridgeObjectRetain();
          uint64_t v10 = (unsigned char *)_swift_stdlib_strtof_clocale();
          if (v10) {
            char v8 = *v10 == 0;
          }
          else {
LABEL_9:
          }
            char v8 = 0;
          swift_bridgeObjectRelease();
          break;
      }
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v6 = sub_259FA22C0();
        uint64_t v7 = v11;
      }
      swift_bridgeObjectRetain();
      char v8 = sub_259F9FBE8(v6, v7, (void (*)(uint64_t *__return_ptr))sub_259F9FCB8);
      swift_bridgeObjectRelease();
    }
  }
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C00);
  uint64_t result = sub_259F9FFE8(&qword_26A401C08, &qword_26A401C00);
  *(void *)(a3 + 32) = result;
  *(_DWORD *)a3 = 0;
  *(unsigned char *)(a3 + 4) = (v8 & 1) == 0;
  return result;
}

void sub_259F9E7E0(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

float sub_259F9E7EC@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  float result = *v3;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = a2;
  *(float *)a3 = result;
  return result;
}

void sub_259F9E7FC(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9 = v6;
  uint64_t v12 = *a2;
  if ((a3 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v16 = *a2;
  SQLiteRow.type(at:)(at);
  uint64_t v9 = v13;
  if (v13) {
    return;
  }
  if (v15 == 4)
  {
    *(void *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C00);
    *(void *)(a6 + 32) = sub_259F9FFE8(&qword_26A401C08, &qword_26A401C00);
    *(_DWORD *)a6 = 0;
    *(unsigned char *)(a6 + 4) = 1;
  }
  else
  {
LABEL_5:
    uint64_t v16 = v12;
    *(void *)(a6 + 24) = a4;
    *(void *)(a6 + 32) = a5;
    swift_retain();
    sub_259F8609C((uint64_t)&v16, at);
    if (v9) {
      __swift_deallocate_boxed_opaque_existential_1(a6);
    }
    else {
      *(_DWORD *)a6 = v14;
    }
  }
}

uint64_t sub_259F9E8FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v10 = 0;
  uint64_t v9[2] = &v10;
  swift_bridgeObjectRetain();
  char v6 = sub_259F84AA8((uint64_t)sub_259F9FC8C, (uint64_t)v9, a1, a2);
  swift_bridgeObjectRelease();
  if (v6) {
    int v7 = v10;
  }
  else {
    int v7 = 0;
  }
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C00);
  uint64_t result = sub_259F9FFE8(&qword_26A401C08, &qword_26A401C00);
  *(void *)(a3 + 32) = result;
  *(_DWORD *)a3 = v7;
  *(unsigned char *)(a3 + 4) = (v6 & 1) == 0;
  return result;
}

void static Double.sqlColumnType.getter(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t static Double.create(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_259FA2280();
    swift_bridgeObjectRelease();
    char v8 = v12;
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      switch((char)a1)
      {
        case 0:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 32:
          swift_bridgeObjectRetain();
          goto LABEL_9;
        default:
          swift_bridgeObjectRetain();
          int v10 = (unsigned char *)_swift_stdlib_strtod_clocale();
          if (v10) {
            char v8 = *v10 == 0;
          }
          else {
LABEL_9:
          }
            char v8 = 0;
          swift_bridgeObjectRelease();
          break;
      }
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v6 = sub_259FA22C0();
        uint64_t v7 = v11;
      }
      swift_bridgeObjectRetain();
      char v8 = sub_259F9FBE8(v6, v7, (void (*)(uint64_t *__return_ptr))sub_259F9FCB8);
      swift_bridgeObjectRelease();
    }
  }
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C10);
  uint64_t result = sub_259F9FFE8(&qword_26A401C18, &qword_26A401C10);
  *(void *)(a3 + 32) = result;
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = (v8 & 1) == 0;
  return result;
}

void sub_259F9EC90(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

double sub_259F9EC9C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result = *v3;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = a2;
  *(double *)a3 = result;
  return result;
}

void sub_259F9ECAC(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9 = v6;
  uint64_t v12 = *a2;
  if ((a3 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v16 = *a2;
  SQLiteRow.type(at:)(at);
  uint64_t v9 = v13;
  if (v13) {
    return;
  }
  if (v15 == 4)
  {
    *(void *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C10);
    *(void *)(a6 + 32) = sub_259F9FFE8(&qword_26A401C18, &qword_26A401C10);
    *(void *)a6 = 0;
    *(unsigned char *)(a6 + 8) = 1;
  }
  else
  {
LABEL_5:
    uint64_t v16 = v12;
    *(void *)(a6 + 24) = a4;
    *(void *)(a6 + 32) = a5;
    swift_retain();
    sub_259F85FAC((uint64_t)&v16, at);
    if (v9) {
      __swift_deallocate_boxed_opaque_existential_1(a6);
    }
    else {
      *(void *)a6 = v14;
    }
  }
}

uint64_t sub_259F9EDAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v9[2] = &v10;
  swift_bridgeObjectRetain();
  char v6 = sub_259F84AA8((uint64_t)sub_259F9FCD0, (uint64_t)v9, a1, a2);
  swift_bridgeObjectRelease();
  if (v6) {
    uint64_t v7 = v10;
  }
  else {
    uint64_t v7 = 0;
  }
  *(void *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C10);
  uint64_t result = sub_259F9FFE8(&qword_26A401C18, &qword_26A401C10);
  *(void *)(a3 + 32) = result;
  *(void *)a3 = v7;
  *(unsigned char *)(a3 + 8) = (v6 & 1) == 0;
  return result;
}

void static String.sqlColumnType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t static String.create(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  a3[3] = MEMORY[0x263F8D310];
  a3[4] = &protocol witness table for String;
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

void sub_259F9EEBC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_259F9EEC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  a3[3] = a1;
  a3[4] = a2;
  *a3 = v5;
  a3[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_259F9EEDC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v15 = *a1;
  swift_retain();
  uint64_t result = String.init(with:column:)((uint64_t)&v15, a2);
  if (!v6)
  {
    if (v13)
    {
      a6[3] = a4;
      a6[4] = a5;
      *a6 = result;
      a6[1] = v13;
    }
    else if (a3)
    {
      a6[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C38);
      uint64_t result = sub_259F9FFE8(&qword_26A401C40, &qword_26A401C38);
      a6[4] = result;
      *a6 = 0;
      a6[1] = 0;
    }
    else
    {
      sub_259F7C520();
      swift_allocError();
      *(void *)(v14 + 8) = 0;
      *(void *)(v14 + 16) = 0;
      *(void *)uint64_t v14 = 6;
      *(unsigned char *)(v14 + 24) = 5;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_259F9EFC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  a5[3] = a3;
  a5[4] = a4;
  *a5 = a1;
  a5[1] = a2;
  return swift_bridgeObjectRetain();
}

void static Data.sqlColumnType.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

unint64_t static Data.create(from:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_259FA1EE0();
  uint64_t v4 = v3;
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C20);
  unint64_t result = sub_259F9FD40();
  a1[4] = result;
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_259F9F054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  a3[3] = a1;
  a3[4] = a2;
  *a3 = v4;
  a3[1] = v5;
  return sub_259F8591C(v4, v5);
}

uint64_t sub_259F9F06C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v15 = *a1;
  swift_retain();
  uint64_t result = (uint64_t)sub_259F91F44(&v15, a2);
  if (!v6)
  {
    if (v13 >> 60 == 15)
    {
      if (a3)
      {
        *(void *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C20);
        uint64_t result = sub_259F9FD40();
        *(void *)(a6 + 32) = result;
        *(_OWORD *)a6 = xmmword_259FA4890;
      }
      else
      {
        sub_259F7C520();
        swift_allocError();
        *(void *)(v14 + 8) = 0;
        *(void *)(v14 + 16) = 0;
        *(void *)uint64_t v14 = 6;
        *(unsigned char *)(v14 + 24) = 5;
        return swift_willThrow();
      }
    }
    else
    {
      *(void *)(a6 + 24) = a4;
      *(void *)(a6 + 32) = a5;
      *(void *)a6 = result;
      *(void *)(a6 + 8) = v13;
    }
  }
  return result;
}

unint64_t sub_259F9F150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_259FA1EE0();
  uint64_t v4 = v3;
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C20);
  unint64_t result = sub_259F9FD40();
  a1[4] = result;
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t static Optional<A>.sqlNullable.getter()
{
  return 1;
}

uint64_t static Optional<A>.sqlColumnType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t static Optional<A>.create(from:at:nullable:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  return (*(uint64_t (**)(uint64_t *))(a5 + 56))(&v6);
}

uint64_t static Optional<A>.create(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v7) {
    return (*(uint64_t (**)(void))(a4 + 64))();
  }
  a5[3] = sub_259FA21E0();
  a5[4] = swift_getWitnessTable();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a5);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(boxed_opaque_existential_1, 1, 1, a3);
}

uint64_t Optional<A>.getSQLDataType()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5);
  if (result == 1)
  {
    *a3 = 4;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    (*(void (**)(uint64_t, uint64_t))(a2 + 40))(v5, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t Optional<A>.unwrapIfOptional()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5);
  if (result == 1)
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    (*(void (**)(uint64_t, uint64_t))(a2 + 48))(v5, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t sub_259F9F6BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 - 8) + 24))();
}

uint64_t sub_259F9F6F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v4);
  if (result == 1)
  {
    *a3 = 4;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v4);
    (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  }
  return result;
}

uint64_t sub_259F9F8D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v4);
  if (result == 1)
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v4);
    (*(void (**)(uint64_t, uint64_t))(v5 + 48))(v4, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  }
  return result;
}

uint64_t sub_259F9FA9C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a5 - 8);
  uint64_t v7 = *a1;
  return (*(uint64_t (**)(uint64_t *))(v5 + 56))(&v7);
}

uint64_t sub_259F9FAE4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v6) {
    return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 64))();
  }
  a5[3] = a3;
  a5[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a5);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 56))(boxed_opaque_existential_1, 1, 1);
}

uint64_t static RawRepresentable<>.sqlColumnType.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_259F9FBE8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

void *sub_259F9FC48@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X2>, unsigned char *a2@<X8>)
{
  uint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

unsigned char *sub_259F9FC8C@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_259F9FF70(a1, MEMORY[0x263F8EE98], a2);
}

void *sub_259F9FCB8@<X0>(unsigned char *a1@<X8>)
{
  return sub_259F9FCFC(a1);
}

unsigned char *sub_259F9FCD0@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_259F9FF70(a1, MEMORY[0x263F8EE90], a2);
}

void *sub_259F9FCFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

unint64_t sub_259F9FD40()
{
  unint64_t result = qword_26A401C28;
  if (!qword_26A401C28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A401C20);
    sub_259F7C6F4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401C28);
  }
  return result;
}

unint64_t sub_259F9FDB4(uint64_t a1)
{
  unint64_t result = sub_259F9FDDC();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_259F9FDDC()
{
  unint64_t result = qword_26A401C30;
  if (!qword_26A401C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A401C30);
  }
  return result;
}

uint64_t sub_259F9FE30(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t dispatch thunk of static SQLiteType.sqlColumnType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static SQLiteType.sqlNullable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SQLiteType.getSQLDataType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SQLiteType.unwrapIfOptional()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static SQLiteType.create(from:at:nullable:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of static SQLiteType.create(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

unsigned char *sub_259F9FF70@<X0>(unsigned char *result@<X0>, uint64_t (*a2)(void)@<X1>, BOOL *a3@<X8>)
{
  unsigned int v4 = *result;
  BOOL v5 = v4 > 0x20;
  uint64_t v6 = (1 << v4) & 0x100003E01;
  BOOL v7 = v5 || v6 == 0;
  v8 = v7 && (uint64_t result = (unsigned char *)a2()) != 0 && *result == 0;
  *a3 = v8;
  return result;
}

uint64_t sub_259F9FFE8(unint64_t *a1, uint64_t *a2)
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

void sub_259FA0060(unsigned char *a1@<X8>)
{
}

uint64_t sub_259FA0078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4 || !*(void *)(v4 + 16))
  {
LABEL_20:
    sub_259F7C520();
    swift_allocError();
    uint64_t v18 = 4;
LABEL_22:
    *(void *)(v17 + 8) = 0;
    *(void *)(v17 + 16) = 0;
    *(void *)uint64_t v17 = v18;
    *(unsigned char *)(v17 + 24) = 5;
    return swift_willThrow();
  }
  BOOL v7 = *(sqlite3_stmt **)(a3 + 24);
  if (!v7)
  {
LABEL_21:
    sub_259F7C520();
    swift_allocError();
    uint64_t v18 = 3;
    goto LABEL_22;
  }
  uint64_t result = sqlite3_column_count(v7);
  if ((result & 0x80000000) != 0)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  uint64_t v10 = (int)result;
  if (!result)
  {
LABEL_25:
    sub_259F7C520();
    swift_allocError();
    *(void *)uint64_t v19 = a1;
    *(void *)(v19 + 8) = a2;
    *(void *)(v19 + 16) = 0;
    *(unsigned char *)(v19 + 24) = 1;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  uint64_t v11 = 0;
  while (1)
  {
    if (v10 == v11)
    {
      __break(1u);
      goto LABEL_27;
    }
    uint64_t v13 = *(void *)(a3 + 16);
    if (!v13 || !*(void *)(v13 + 16)) {
      goto LABEL_20;
    }
    uint64_t v14 = *(sqlite3_stmt **)(a3 + 24);
    if (!v14) {
      goto LABEL_21;
    }
    uint64_t result = (uint64_t)sqlite3_column_name(v14, v11);
    if (!result) {
      goto LABEL_8;
    }
    if (sub_259FA2010() == a1 && v15 == a2) {
      break;
    }
    char v12 = sub_259FA2400();
    uint64_t result = swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_17;
    }
LABEL_8:
    if (v10 == ++v11) {
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
LABEL_17:
  uint64_t v20 = a3;
  swift_retain();
  uint64_t result = String.init(with:column:)((uint64_t)&v20, v11);
  if (!v3 && !v16)
  {
    sub_259F7C520();
    swift_allocError();
    uint64_t v18 = 6;
    goto LABEL_22;
  }
  return result;
}

uint64_t SQLiteDatabaseInspector.inspectSchemas(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
  uint64_t v7 = *(void *)(v6(a2, a3) + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v7)
  {
    uint64_t v9 = v6(a2, v4);
    uint64_t v38 = v9;
    int64_t v10 = *(void *)(v9 + 16);
    uint64_t v11 = MEMORY[0x263F8EE78];
    if (v10)
    {
      uint64_t v12 = v9;
      uint64_t v29 = v4;
      uint64_t v37 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_259F8AA8C(0, v10, 0);
      uint64_t v13 = v12 + 32;
      uint64_t v11 = v37;
      do
      {
        sub_259FA0A18(v13, (uint64_t)&v32);
        v31[0] = 39;
        v31[1] = 0xE100000000000000;
        swift_bridgeObjectRetain();
        sub_259FA2000();
        swift_bridgeObjectRelease();
        sub_259FA2000();
        sub_259FA0A74((uint64_t)&v32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_259F8AA8C(0, *(void *)(v11 + 16) + 1, 1);
          uint64_t v11 = v37;
        }
        unint64_t v15 = *(void *)(v11 + 16);
        unint64_t v14 = *(void *)(v11 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_259F8AA8C(v14 > 1, v15 + 1, 1);
          uint64_t v11 = v37;
        }
        *(void *)(v11 + 16) = v15 + 1;
        uint64_t v16 = v11 + 16 * v15;
        *(void *)(v16 + 32) = 39;
        *(void *)(v16 + 40) = 0xE100000000000000;
        v13 += 56;
        --v10;
      }
      while (v10);
      swift_bridgeObjectRelease();
      uint64_t v4 = v29;
    }
    uint64_t v32 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4019E0);
    sub_259F82098();
    sub_259FA1F30();
    swift_bridgeObjectRelease();
    uint64_t v32 = 0;
    uint64_t v33 = 0xE000000000000000;
    sub_259FA2290();
    sub_259FA2000();
    sub_259FA2000();
    swift_bridgeObjectRelease();
    sub_259FA2000();
    sub_259F8B948(v32, v33, 0, (uint64_t)v31);
    uint64_t v17 = swift_bridgeObjectRelease();
    if (!v3)
    {
      uint64_t v18 = v31[0];
      uint64_t v19 = v31[2];
      *(double *)&long long v20 = MEMORY[0x270FA5388](v17);
      uint64_t v32 = v18;
      uint64_t v33 = v21;
      uint64_t v34 = v19;
      long long v35 = v20;
      char v36 = v22;
      sub_259F904E0(&v32, (void (*)(uint64_t *))sub_259FA0AC8);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v23 = *(void *)(v38 + 16);
      if (v23)
      {
        uint64_t v30 = a2;
        uint64_t v24 = v4;
        uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 32);
        uint64_t v26 = v38 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_259FA0A18(v26, (uint64_t)&v32);
          uint64_t v27 = v32;
          uint64_t v28 = v33;
          swift_bridgeObjectRetain();
          sub_259FA0A74((uint64_t)&v32);
          v25(v27, v28, v30, v24);
          swift_bridgeObjectRelease();
          v26 += 56;
          --v23;
        }
        while (v23);
        swift_bridgeObjectRelease();
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_259FA0614(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *a1;
  uint64_t result = sub_259FA0078(1701667182, 0xE400000000000000, *a1);
  if (!v5)
  {
    uint64_t v12 = result;
    uint64_t v13 = v11;
    uint64_t v14 = sub_259FA0078(7106931, 0xE300000000000000, v9);
    uint64_t v16 = v15;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 16))(v12, v13, a4, a5);
    if (v17 == v14 && v18 == v16)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v26 = v18;
      char v24 = sub_259FA2400();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 24))(v12, v13, v14, v16, a4, a5);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)(*(void *)a3 + 16);
    if (v20)
    {
      unint64_t v21 = 0;
      for (i = (void *)(*(void *)a3 + 40); ; i += 7)
      {
        BOOL v23 = *(i - 1) == v12 && *i == v13;
        if (v23 || (sub_259FA2400() & 1) != 0) {
          break;
        }
        if (v20 == ++v21) {
          return swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
      sub_259FA07F0(v21, (uint64_t)v25);
      return sub_259FA0A74((uint64_t)v25);
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_259FA07F0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_259FA0B74(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    BOOL v8 = &v5[7 * a1];
    long long v9 = *((_OWORD *)v8 + 3);
    *(_OWORD *)a2 = *((_OWORD *)v8 + 2);
    *(_OWORD *)(a2 + 16) = v9;
    *(_OWORD *)(a2 + 32) = *((_OWORD *)v8 + 4);
    *(void *)(a2 + 48) = v8[10];
    if ((uint64_t)(v7 - a1) >= 0)
    {
      uint64_t result = (uint64_t)memmove(v8 + 4, v8 + 11, 56 * (v7 - a1));
      _OWORD v5[2] = v7;
      *uint64_t v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_259FA23A0();
  __break(1u);
  return result;
}

void *sub_259FA08EC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C48);
      int64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      _OWORD v10[2] = v8;
      uint64_t v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_259FA0B88(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_259FA0A18(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_259FA0A74(uint64_t a1)
{
  return a1;
}

uint64_t sub_259FA0AC8(uint64_t *a1)
{
  return sub_259FA0614(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.tables.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.tableCreationStatementString(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.onError(table:withInvalidSchema:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.onError(missingTable:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

void *sub_259FA0B74(void *a1)
{
  return sub_259FA08EC(0, a1[2], 0, a1);
}

uint64_t sub_259FA0B88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259FA23A0();
  __break(1u);
  return result;
}

uint64_t SQLiteTableDescription.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SQLiteTableDescription.schema.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259F800A0(v1 + 16, a1);
}

uint64_t SQLiteTableDescription.init(name:schema:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  return sub_259F7FD40(a3, (uint64_t)(a4 + 2));
}

uint64_t sub_259FA0CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = v6 + 32;
    while (1)
    {
      sub_259FA0A18(v8, (uint64_t)v14);
      uint64_t v9 = v14[0];
      int64_t v10 = (void *)v14[1];
      sub_259F800A0((uint64_t)&v15, (uint64_t)v13);
      swift_bridgeObjectRetain();
      sub_259FA0A74((uint64_t)v14);
      SQLiteDatabaseManager.create(table:with:in:)(v9, v10, (uint64_t)v13, a1, a2, a3);
      if (v3) {
        break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      swift_bridgeObjectRelease();
      v8 += 56;
      if (!--v7) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 40))(a1, a2, a3);
  }
}

void *SQLiteDatabaseManager.create(table:with:in:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = SQLiteDatabaseManager.tableCreationStatementString(for:with:)(a1, a2, a3, a5, a6);
  if (!v6)
  {
    sub_259F8B948((uint64_t)result, v8, 0, (uint64_t)&v12);
    uint64_t v9 = swift_bridgeObjectRelease();
    long long v14 = v12;
    v15[0] = v13[0];
    *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v13 + 9);
    MEMORY[0x270FA5388](v9);
    long long v10 = v12;
    v11[0] = v13[0];
    *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)v13 + 9);
    sub_259F904E0((uint64_t *)&v10, (void (*)(uint64_t *))sub_259F8D64C);
    return (void *)sub_259F80944((uint64_t)&v14);
  }
  return result;
}

uint64_t SQLiteDatabaseManager.dropTables(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = v6 + 32;
    do
    {
      sub_259FA0A18(v8, (uint64_t)&v27);
      *(void *)&long long v22 = 0;
      *((void *)&v22 + 1) = 0xE000000000000000;
      sub_259FA2290();
      swift_bridgeObjectRelease();
      *(void *)&long long v22 = 0xD000000000000015;
      *((void *)&v22 + 1) = 0x8000000259FA3910;
      swift_bridgeObjectRetain();
      sub_259FA2000();
      swift_bridgeObjectRelease();
      sub_259F8B948(v22, *((uint64_t *)&v22 + 1), 0, (uint64_t)&v25);
      if (v4)
      {
        swift_bridgeObjectRelease();
        uint64_t v30 = 0;
        if (qword_26A401728 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_259FA1F20();
        __swift_project_value_buffer(v11, (uint64_t)qword_26A401C90);
        sub_259FA0A18((uint64_t)&v27, (uint64_t)&v25);
        MEMORY[0x25A2F1700](v4);
        MEMORY[0x25A2F1700](v4);
        long long v12 = sub_259FA1F00();
        os_log_type_t v13 = sub_259FA21C0();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = swift_slowAlloc();
          uint64_t v15 = swift_slowAlloc();
          *(void *)&long long v22 = v15;
          *(_DWORD *)uint64_t v14 = 136315394;
          uint64_t v16 = a1;
          unint64_t v18 = *((void *)&v25 + 1);
          uint64_t v17 = v25;
          swift_bridgeObjectRetain();
          *(void *)(v14 + 4) = sub_259F90F1C(v17, v18, (uint64_t *)&v22);
          swift_bridgeObjectRelease();
          sub_259FA0A74((uint64_t)&v25);
          *(_WORD *)(v14 + 12) = 2080;
          char v24 = v4;
          MEMORY[0x25A2F1700](v4);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4017D0);
          uint64_t v19 = sub_259FA1F90();
          *(void *)(v14 + 14) = sub_259F90F1C(v19, v20, (uint64_t *)&v22);
          a1 = v16;
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_259F7A000, v12, v13, "Failed to delete table: %s with %s", (uint8_t *)v14, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x25A2F1860](v15, -1, -1);
          MEMORY[0x25A2F1860](v14, -1, -1);
        }
        else
        {

          sub_259FA0A74((uint64_t)&v25);
        }

        sub_259FA0A74((uint64_t)&v27);
        uint64_t v4 = v30;
      }
      else
      {
        uint64_t v9 = swift_bridgeObjectRelease();
        long long v28 = v25;
        *(_OWORD *)uint64_t v29 = v26[0];
        *(_OWORD *)&v29[9] = *(_OWORD *)((char *)v26 + 9);
        MEMORY[0x270FA5388](v9);
        long long v22 = v28;
        v23[0] = *(_OWORD *)v29;
        *(_OWORD *)((char *)v23 + 9) = *(_OWORD *)(v10 + 25);
        sub_259F904E0((uint64_t *)&v22, (void (*)(uint64_t *))sub_259F8DAB4);
        sub_259F80944((uint64_t)&v28);
        sub_259FA0A74((uint64_t)&v27);
      }
      v8 += 56;
      --v7;
    }
    while (v7);
  }
  return swift_bridgeObjectRelease();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDatabaseManager.tableCreationStatementString(for:)(Swift::String a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v7 = (*(uint64_t (**)())(v2 + 16))();
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
LABEL_9:
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    swift_bridgeObjectRelease();
LABEL_12:
    sub_259FA1824((uint64_t)&v20);
    *(void *)&long long v20 = 0;
    *((void *)&v20 + 1) = 0xE000000000000000;
    sub_259FA2290();
    swift_bridgeObjectRelease();
    *(void *)&long long v20 = 0x20656C626154;
    *((void *)&v20 + 1) = 0xE600000000000000;
    sub_259FA2000();
    sub_259FA2000();
    os_log_type_t v13 = (void *)*((void *)&v20 + 1);
    uint64_t v11 = (void *)v20;
    sub_259F7C520();
    swift_allocError();
    *(_OWORD *)uint64_t v14 = __PAIR128__((unint64_t)v13, (unint64_t)v11);
    *(void *)(v14 + 16) = 0;
    *(unsigned char *)(v14 + 24) = 4;
    swift_willThrow();
    goto LABEL_13;
  }
  uint64_t v9 = v7 + 32;
  while (1)
  {
    sub_259FA0A18(v9, (uint64_t)v18);
    BOOL v10 = *(void *)&v18[0] == countAndFlagsBits && *((void *)&v18[0] + 1) == (void)object;
    if (v10 || (sub_259FA2400() & 1) != 0) {
      break;
    }
    sub_259FA0A74((uint64_t)v18);
    v9 += 56;
    if (!--v8) {
      goto LABEL_9;
    }
  }
  long long v20 = v18[0];
  long long v21 = v18[1];
  long long v22 = v18[2];
  uint64_t v23 = v19;
  swift_bridgeObjectRelease();
  if (!*((void *)&v20 + 1)) {
    goto LABEL_12;
  }
  sub_259F800A0((uint64_t)&v21, (uint64_t)v24);
  sub_259FA0A74((uint64_t)&v20);
  sub_259F7FD40(v24, (uint64_t)v25);
  uint64_t v11 = SQLiteDatabaseManager.tableCreationStatementString(for:with:)(countAndFlagsBits, object, (uint64_t)v25, v4, v3);
  os_log_type_t v13 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
LABEL_13:
  uint64_t v15 = (uint64_t)v11;
  uint64_t v16 = v13;
  result._object = v16;
  result._uint64_t countAndFlagsBits = v15;
  return result;
}

void *SQLiteDatabaseManager.tableCreationStatementString(for:with:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 64))(a1, a2, a4, a5);
  if (!v6)
  {
    unint64_t v5 = (void *)v10;
    uint64_t v12 = v11;
    sub_259F800A0(a3, (uint64_t)v19);
    if (!v12)
    {
      uint64_t v14 = __swift_project_boxed_opaque_existential_1(v19, v19[3]);
      v15._uint64_t countAndFlagsBits = a1;
      v15._object = a2;
      uint64_t v16 = v5;
      unint64_t v5 = v14;
      uint64_t countAndFlagsBits = SQLiteSchemaDescribing.makeCreateStatementString(for:in:)(v15, (Swift::String_optional)(unint64_t)v16)._countAndFlagsBits;
      if (!v18) {
        unint64_t v5 = (void *)countAndFlagsBits;
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  return v5;
}

void SQLiteDatabaseManager.ensureVersion(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 24))(a1, a2, a3);
  if (!v3 && v7 != v8)
  {
    if (v8 >= v7)
    {
      sub_259F7C520();
      swift_allocError();
      *(void *)(v10 + 8) = 0;
      *(void *)(v10 + 16) = 0;
      *(void *)uint64_t v10 = 11;
      *(unsigned char *)(v10 + 24) = 5;
      swift_willThrow();
    }
    else
    {
      if (v8) {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 48))(a1, v8, a2, a3);
      }
      else {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 32))(a1, a2, a3);
      }
      MEMORY[0x270FA5388](v9);
      sub_259F8BB8C((void (*)(uint64_t))sub_259FA1884);
    }
  }
}

uint64_t sub_259FA17C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 56))(a3, a1, a4, a5);
  }
  else {
    return sub_259FA0CCC(a3, a4, a5);
  }
}

uint64_t sub_259FA1824(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A401C50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_259FA1884()
{
  return sub_259FA17C8(v0[4], v0[5], v0[6], v0[2], v0[3]);
}

uint64_t destroy for SQLiteTableDescription(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t initializeWithCopy for SQLiteTableDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 16;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 16, v4, v6);
  return a1;
}

void *assignWithCopy for SQLiteTableDescription(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        Swift::String result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
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
          *Swift::String result = *a2;
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
          *uint64_t v3 = *a2;
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

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SQLiteTableDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteTableDescription(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteTableDescription(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteTableDescription()
{
  return &type metadata for SQLiteTableDescription;
}

uint64_t dispatch thunk of SQLiteDatabaseManager.currentVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.tables.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.validatedVersion(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.willCreate(database:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.populateDefaultRows(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.willUpdateToCurrentVersion(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.updateToCurrentVersion(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.customTableCreationStatementString(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t sub_259FA1E20()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_259FA1E30()
{
  return MEMORY[0x270EEE0C8]();
}

uint64_t sub_259FA1E40()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_259FA1E50()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_259FA1E60()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_259FA1E70()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_259FA1E80()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_259FA1E90()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_259FA1EA0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_259FA1EB0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_259FA1EC0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_259FA1ED0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_259FA1EE0()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_259FA1EF0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_259FA1F00()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259FA1F10()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_259FA1F20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259FA1F30()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_259FA1F40()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_259FA1F50()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_259FA1F60()
{
  return MEMORY[0x270EF1A58]();
}

uint64_t sub_259FA1F70()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_259FA1F80()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_259FA1F90()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_259FA1FA0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_259FA1FB0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_259FA1FC0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_259FA1FD0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259FA1FE0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_259FA1FF0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_259FA2000()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_259FA2010()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_259FA2020()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_259FA2030()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_259FA2040()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_259FA2050()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_259FA2070()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_259FA2080()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_259FA2090()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_259FA20A0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_259FA20B0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_259FA20C0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_259FA20D0()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_259FA20E0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_259FA20F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_259FA2100()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_259FA2110()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_259FA2120()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_259FA2130()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_259FA2140()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_259FA2150()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_259FA2160()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_259FA2170()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_259FA2180()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_259FA2190()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_259FA21A0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_259FA21B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_259FA21C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_259FA21D0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_259FA21E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_259FA21F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_259FA2200()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_259FA2210()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_259FA2220()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_259FA2230()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_259FA2240()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_259FA2250()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_259FA2260()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_259FA2270()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_259FA2280()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_259FA2290()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_259FA22A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_259FA22B0()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_259FA22C0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_259FA22D0()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_259FA22E0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_259FA22F0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_259FA2300()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_259FA2310()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_259FA2320()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_259FA2330()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_259FA2340()
{
  return MEMORY[0x270F9EE70]();
}

uint64_t sub_259FA2350()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_259FA2360()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_259FA2370()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_259FA2380()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_259FA2390()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_259FA23A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_259FA23B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_259FA23C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_259FA23D0()
{
  return MEMORY[0x270F9F758]();
}

uint64_t sub_259FA23E0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_259FA23F0()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_259FA2400()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_259FA2410()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_259FA2420()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_259FA2430()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_259FA2440()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_259FA2450()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_259FA2460()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_259FA2470()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259FA2480()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_259FA2490()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_259FA24A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_259FA24B0()
{
  return MEMORY[0x270FA0128]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
}

void bzero(void *a1, size_t a2)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x270F9B4C8](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x270F9B600](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x270F9B608](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module_v2(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData, void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x270F9B610](db, zName, p, pClientData, xDestroy);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x270F9B640](a1, zSQL);
}

int sqlite3_drop_modules(sqlite3 *db, const char **azKeep)
{
  return MEMORY[0x270F9B648](db, azKeep);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x270F9B6E8](*(void *)&a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_subtype(sqlite3_context *a1, unsigned int a2)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int sqlite3_threadsafe(void)
{
  return MEMORY[0x270F9B830]();
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x270F9B868](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x270F9B870](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x270F9B878](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x270F9B888](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8A0](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8A8](a1);
}

unsigned int sqlite3_value_subtype(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8B8](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B8C0](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8D0](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}