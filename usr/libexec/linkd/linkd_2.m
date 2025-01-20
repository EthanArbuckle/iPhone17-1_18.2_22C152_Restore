uint64_t sub_1001280E0(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v14;
  char *v15;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  uint64_t v25;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (void)a2;
  v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_100020AFC(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = v12 - 16;
      v21 = *((void *)v12 - 2) == *((void *)v6 - 2) && *((void *)v12 - 1) == *((void *)v6 - 1);
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        v23 = v19 != v12 || v18 >= v12;
        v12 -= 16;
        if (!v23) {
          goto LABEL_43;
        }
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 16;
        v6 -= 16;
        if (!v22) {
          goto LABEL_43;
        }
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }
  sub_100020AFC(a1, (a2 - a1) / 16, a4);
  v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        break;
      }
      v15 = v4;
      v14 = v7 == v4;
      v4 += 16;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 16;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  v25 = (v12 - v4) / 16;
  if (v6 != v4 || v6 >= &v4[16 * v25]) {
    memmove(v6, v4, 16 * v25);
  }
  return 1;
}

uint64_t sub_10012829C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  v9 = sub_1000274F4((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_10000D698(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_100128334(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100128390(void *a1)
{
  return sub_100122EF8(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_1001283B0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1001283EC@<X0>(uint64_t *a1@<X8>)
{
  return sub_100125CF0(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t type metadata accessor for Select()
{
  return sub_100010B5C();
}

unint64_t sub_10012840C()
{
  unint64_t result = qword_100181028;
  if (!qword_100181028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100181028);
  }
  return result;
}

uint64_t sub_100128458(uint64_t a1)
{
  return sub_1001277A0(a1, *(void *)(v1 + 32), *(void **)(v1 + 40)) & 1;
}

unint64_t sub_100128480(uint64_t a1)
{
  unint64_t result = sub_1001284A8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1001284A8()
{
  unint64_t result = qword_1001810F0;
  if (!qword_1001810F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001810F0);
  }
  return result;
}

unint64_t sub_1001284F8()
{
  unint64_t result = qword_1001810F8;
  if (!qword_1001810F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001810F8);
  }
  return result;
}

unint64_t sub_100128548()
{
  unint64_t result = qword_100181100;
  if (!qword_100181100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100181100);
  }
  return result;
}

void *initializeWithTake for QueryClauses(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA8uLL);
}

void type metadata accessor for Table()
{
}

uint64_t _s17AppIntents_SQLite12QueryClausesVwca_0(unsigned char *a1, unsigned char *a2)
{
  sub_1001295D0(a1, a2);
  *(void *)(v2 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = *(void *)(v3 + 16);
  *(void *)(v2 + 24) = *(void *)(v3 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = *(void *)(v3 + 32);
  *(void *)(v2 + 40) = *(void *)(v3 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = *(void *)(v3 + 48);
  *(void *)(v2 + 56) = *(void *)(v3 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = *(void *)(v3 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v3 + 80);
  if (*(void *)(v2 + 80))
  {
    if (v5)
    {
      sub_100129988();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v2 + 88) = *(void *)(v3 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100115734(v2 + 72, &qword_100180F08);
      sub_100129934();
    }
  }
  else if (v5)
  {
    sub_100129988();
    *(void *)(v2 + 88) = *(void *)(v3 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v6 = *(_OWORD *)(v3 + 72);
    *(void *)(v2 + 88) = *(void *)(v3 + 88);
    *(_OWORD *)(v2 + 72) = v6;
  }
  v7 = (long long *)(v2 + 96);
  v9 = (long long *)(v3 + 96);
  uint64_t v8 = *(void *)(v3 + 96);
  if (!*(void *)(v2 + 96))
  {
    if (v8)
    {
      *(void *)(v2 + 96) = v8;
      uint64_t v11 = *(void *)(v3 + 112);
      swift_bridgeObjectRetain();
      if (!v11)
      {
        long long v12 = *(_OWORD *)(v3 + 104);
        *(void *)(v2 + 120) = *(void *)(v3 + 120);
        *(_OWORD *)(v2 + 104) = v12;
        goto LABEL_23;
      }
LABEL_18:
      sub_100129900();
      *(void *)(v2 + 120) = *(void *)(v3 + 120);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
    long long v14 = *v9;
    *(_OWORD *)(v2 + 112) = *(_OWORD *)(v3 + 112);
LABEL_22:
    long long *v7 = v14;
    goto LABEL_23;
  }
  if (!v8)
  {
    sub_100115734(v2 + 96, qword_100181108);
    long long v13 = *(_OWORD *)(v3 + 112);
    long long *v7 = *v9;
    *(_OWORD *)(v2 + 112) = v13;
    goto LABEL_23;
  }
  *(void *)(v2 + 96) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (long long *)(v2 + 104);
  uint64_t v10 = *(void *)(v3 + 112);
  if (!*(void *)(v2 + 112))
  {
    if (v10) {
      goto LABEL_18;
    }
    long long v14 = *(_OWORD *)(v3 + 104);
    *(void *)(v2 + 120) = *(void *)(v3 + 120);
    goto LABEL_22;
  }
  if (v10)
  {
    sub_100129900();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v2 + 120) = *(void *)(v3 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100115734(v2 + 104, &qword_100180F08);
    sub_100129934();
  }
LABEL_23:
  *(void *)(v2 + 128) = *(void *)(v3 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v15 = *(_OWORD *)(v3 + 136);
  *(_WORD *)(v2 + 152) = *(_WORD *)(v3 + 152);
  *(_OWORD *)(v2 + 136) = v15;
  *(void *)(v2 + 160) = *(void *)(v3 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t _s17AppIntents_SQLite12QueryClausesVwta_0(unsigned char *a1, unsigned char *a2)
{
  sub_1001295D0(a1, a2);
  *(void *)(v2 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v3 + 24);
  *(void *)(v2 + 16) = *(void *)(v3 + 16);
  *(void *)(v2 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 + 40);
  *(void *)(v2 + 32) = *(void *)(v3 + 32);
  *(void *)(v2 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 56);
  *(void *)(v2 + 48) = *(void *)(v3 + 48);
  *(void *)(v2 + 56) = v7;
  swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = *(void *)(v3 + 64);
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + 80))
  {
    uint64_t v8 = *(void *)(v3 + 80);
    if (v8)
    {
      *(void *)(v2 + 72) = *(void *)(v3 + 72);
      *(void *)(v2 + 80) = v8;
      swift_bridgeObjectRelease();
      *(void *)(v2 + 88) = *(void *)(v3 + 88);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_100115734(v2 + 72, &qword_100180F08);
  }
  sub_100129888();
LABEL_6:
  uint64_t v9 = *(void *)(v3 + 96);
  if (!*(void *)(v2 + 96))
  {
LABEL_12:
    long long v11 = *(_OWORD *)(v3 + 112);
    *(_OWORD *)(v2 + 96) = *(_OWORD *)(v3 + 96);
    *(_OWORD *)(v2 + 112) = v11;
    goto LABEL_15;
  }
  if (!v9)
  {
    sub_100115734(v2 + 96, qword_100181108);
    goto LABEL_12;
  }
  *(void *)(v2 + 96) = v9;
  swift_bridgeObjectRelease();
  if (!*(void *)(v2 + 112))
  {
LABEL_14:
    sub_100129888();
    goto LABEL_15;
  }
  uint64_t v10 = *(void *)(v3 + 112);
  if (!v10)
  {
    sub_100115734(v2 + 104, &qword_100180F08);
    goto LABEL_14;
  }
  *(void *)(v2 + 104) = *(void *)(v3 + 104);
  *(void *)(v2 + 112) = v10;
  swift_bridgeObjectRelease();
  *(void *)(v2 + 120) = *(void *)(v3 + 120);
  swift_bridgeObjectRelease();
LABEL_15:
  *(void *)(v2 + 128) = *(void *)(v3 + 128);
  swift_bridgeObjectRelease();
  sub_1001298C4();
  *(void *)(v2 + 160) = *(void *)(v3 + 160);
  swift_bridgeObjectRelease();
  return v2;
}

void type metadata accessor for View()
{
}

void type metadata accessor for VirtualTable()
{
}

uint64_t sub_1001289E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

void type metadata accessor for Insert()
{
}

void type metadata accessor for Update()
{
}

uint64_t _s17AppIntents_SQLite6InsertVwca_0(void *a1, void *a2)
{
  sub_1001299BC(a1, a2);
  *(void *)(v3 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s17AppIntents_SQLite6InsertVwta_0(void *a1, void *a2)
{
  sub_1001299BC(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s17AppIntents_SQLite6InsertVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return sub_100129A04(-1);
  }
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
  return sub_100129A04(v2);
}

uint64_t sub_100128AF0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      return sub_1001299F8(result, a2);
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      return sub_1001299F8(result, a2);
    }
  }
  return result;
}

void type metadata accessor for Delete()
{
}

uint64_t destroy for RowIterator()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

void *_s17AppIntents_SQLite11RowIteratorVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RowIterator(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for RowIterator(void *a1, _OWORD *a2, uint64_t a3)
{
  return sub_100128C50(a1, a2, a3, (void (*)(void))&_swift_release);
}

void type metadata accessor for RowIterator()
{
}

void *assignWithTake for Row(void *a1, _OWORD *a2, uint64_t a3)
{
  return sub_100128C50(a1, a2, a3, (void (*)(void))&_swift_bridgeObjectRelease);
}

void *sub_100128C50(void *a1, _OWORD *a2, uint64_t a3, void (*a4)(void))
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17AppIntents_SQLite11RowIteratorVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return sub_100129A04(-1);
  }
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
  return sub_100129A04(v2);
}

void type metadata accessor for Row()
{
}

unsigned char *storeEnumTagSinglePayload for JoinType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100128DA8);
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

void type metadata accessor for JoinType()
{
}

unsigned char *storeEnumTagSinglePayload for OnConflict(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100128EA8);
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

void type metadata accessor for OnConflict()
{
}

uint64_t _s17AppIntents_SQLite12QueryClausesVwxx_0(void *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[10])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[12])
  {
    swift_bridgeObjectRelease();
    if (a1[14])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void _s17AppIntents_SQLite12QueryClausesVwcp_0()
{
  sub_1000288B4();
  sub_1001295D0(v2, v3);
  uint64_t v5 = v4[2];
  *(void *)(v0 + 8) = v4[1];
  *(void *)(v0 + 16) = v5;
  uint64_t v6 = v4[4];
  *(void *)(v0 + 24) = v4[3];
  *(void *)(v0 + 32) = v6;
  uint64_t v7 = v4[6];
  *(void *)(v0 + 40) = v4[5];
  *(void *)(v0 + 48) = v7;
  uint64_t v8 = v4[8];
  *(void *)(v0 + 56) = v4[7];
  *(void *)(v0 + 64) = v8;
  uint64_t v9 = v4[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9)
  {
    *(void *)(v0 + 72) = v1[9];
    *(void *)(v0 + 80) = v9;
    *(void *)(v0 + 88) = v1[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_1001298EC((__n128 *)(v0 + 72));
  }
  uint64_t v10 = v1[12];
  if (v10)
  {
    *(void *)(v0 + 96) = v10;
    uint64_t v11 = v1[14];
    swift_bridgeObjectRetain();
    if (v11)
    {
      *(void *)(v0 + 104) = v1[13];
      *(void *)(v0 + 112) = v11;
      *(void *)(v0 + 120) = v1[15];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_1001298EC((__n128 *)(v0 + 104));
    }
  }
  else
  {
    long long v12 = *((_OWORD *)v1 + 7);
    *(_OWORD *)(v0 + 96) = *((_OWORD *)v1 + 6);
    *(_OWORD *)(v0 + 112) = v12;
  }
  *(void *)(v0 + 128) = v1[16];
  sub_1001298C4();
  *(void *)(v0 + 160) = v1[20];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000EB44();
}

uint64_t _s17AppIntents_SQLite12QueryClausesVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return sub_100129A04(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 168))
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
  return sub_100129A04(v2);
}

uint64_t sub_1001290DC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 168) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return sub_1001299F8(result, a2);
    }
    *(unsigned char *)(result + 168) = 0;
    if (a2) {
      return sub_1001299F8(result, a2);
    }
  }
  return result;
}

void type metadata accessor for QueryClauses()
{
}

uint64_t sub_100129148(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10011D1B8(a1, a2, a3, a4, a5, &qword_10017DED0);
}

uint64_t sub_100129158()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100129198@<X0>(void *a1@<X8>)
{
  return sub_100125D88(*(void *)(v1 + 24), a1);
}

uint64_t sub_1001291A0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001291D8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1001291E8()
{
}

void sub_1001291FC(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1001265D4(a1, *(void **)(v2 + 16), a2);
}

uint64_t *sub_10012921C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100129250(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000BF1C(a3);
  sub_100115CD4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t *sub_1001292B0(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100129304(void *a1)
{
  sub_10000BEA0(a1, v1);
  return v1;
}

double sub_100129338@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v7 + 48) = a2;
  *(void *)(v7 + 56) = a1;
  *(unsigned char *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = v7;
  *(void *)(v2 + 16) = v6;
  *(void *)(v2 + 24) = v5;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0;
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = a2;
  double result = 0.0;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 128) = a2;
  *(void *)(v2 + 136) = 0;
  *(void *)(v2 + 144) = 0;
  *(_WORD *)(v2 + 152) = 256;
  *(void *)(v2 + 160) = a2;
  return result;
}

uint64_t sub_100129380()
{
  return v0;
}

uint64_t Expression.bindings.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100129398()
{
  sub_10000D5B0(v1, 0, 1, v0);
  return v2;
}

void sub_1001293DC()
{
  uint64_t v2 = v0[2] + 1;
  sub_100114B40(0, v2, 1, v0);
}

double sub_100129400()
{
  *(void *)(v0 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t sub_100129420()
{
  return v0;
}

uint64_t sub_100129460()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1001294B4()
{
  return v0;
}

uint64_t sub_1001294E0()
{
  return v0;
}

uint64_t sub_100129500()
{
  return v0;
}

void sub_100129540(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_10011750C(a1, a2);
}

uint64_t sub_100129558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v5[7] = a1;
  v5[8] = a2;
  v5[4] = v4;
  v5[5] = v3;
  v5[6] = v2;
  type metadata accessor for ScalarQuery();
  return swift_bridgeObjectRetain();
}

uint64_t sub_10012959C()
{
  return v0;
}

uint64_t sub_1001295B0()
{
  return 0;
}

unsigned char *sub_1001295D0(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  return result;
}

uint64_t sub_1001295E4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100129610(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10011EC94(a1, a2, a4, a4, a5, a5);
}

uint64_t sub_10012961C()
{
  uint64_t v1 = *(void *)(v0 - 144);
  uint64_t v2 = *(void *)(v0 - 136);
  uint64_t v3 = sub_10000BEA0((void *)(v0 - 168), v1);
  return sub_100118150(v3, 0, 0xE000000000000000, v1, v2);
}

uint64_t sub_10012965C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_10011EC94(v6, v10, v7, v9, v8, a6);
}

uint64_t sub_100129684()
{
  return QueryType.filter(_:)(v2, v1, v0, v3);
}

uint64_t sub_1001296AC()
{
  return v0;
}

uint64_t sub_1001296BC()
{
  return v0;
}

uint64_t sub_1001296F0()
{
  return v0;
}

uint64_t sub_100129734()
{
  return v0;
}

uint64_t sub_10012974C()
{
  return sub_10000D5B0(v1, 1, 1, v0);
}

uint64_t sub_100129770()
{
  return v0;
}

uint64_t sub_100129780()
{
  return v0;
}

uint64_t sub_100129798()
{
  return v0;
}

uint64_t sub_1001297CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Connection.run(_:_:)(a2, a3, a4);
}

uint64_t sub_100129818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return Connection.scalar(_:_:)(a1, a2, a3, (uint64_t)va);
}

uint64_t sub_100129848(uint64_t a1, ...)
{
  va_start(va, a1);
  return sub_1001180E8((uint64_t)va, v2, v1);
}

__n128 sub_100129868(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __n128 a17)
{
  __n128 result = a17;
  a1[1] = a17;
  return result;
}

__n128 sub_100129888()
{
  __n128 result = *v1;
  *uint64_t v0 = *v1;
  v0[1].n128_u64[0] = v1[1].n128_u64[0];
  return result;
}

uint64_t sub_10012989C()
{
  return v0;
}

uint64_t sub_1001298B0()
{
  return v0;
}

__n128 sub_1001298C4()
{
  __n128 result = *(__n128 *)(v1 + 136);
  *(__n128 *)(v0 + 136) = result;
  *(_WORD *)(v0 + 152) = *(_WORD *)(v1 + 152);
  return result;
}

void sub_1001298D8(uint64_t a1@<X8>)
{
  v1[8] = a1;
  v1[4] = 42;
  v1[5] = 0xE100000000000000;
}

__n128 sub_1001298EC@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v1[1].n128_u64[0];
  return result;
}

uint64_t sub_100129900()
{
  *(void *)(v0 + 104) = *(void *)(v1 + 104);
  uint64_t result = *(void *)(v1 + 112);
  *(void *)(v0 + 112) = result;
  return result;
}

uint64_t sub_100129914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  *(void *)(v9 + 16) = v10;
  return sub_10000D698(&a9, v9 + v12 * v11 + 32);
}

__n128 sub_100129934()
{
  unint64_t v2 = v1[1].n128_u64[0];
  __n128 result = *v1;
  *uint64_t v0 = *v1;
  v0[1].n128_u64[0] = v2;
  return result;
}

void *sub_100129948(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char __dst)
{
  return memcpy(&__dst, v10, 0xA8uLL);
}

uint64_t sub_100129968()
{
  return sub_10000E788(v0 - 168);
}

uint64_t sub_100129988()
{
  *(void *)(v0 + 72) = *(void *)(v1 + 72);
  uint64_t result = *(void *)(v1 + 80);
  *(void *)(v0 + 80) = result;
  return result;
}

uint64_t sub_10012999C(uint64_t a1)
{
  return sub_10000D5B0(v2, v1, 1, a1);
}

void *sub_1001299BC(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_1001299D0()
{
  return 0;
}

uint64_t sub_1001299E4()
{
  return v0;
}

uint64_t sub_1001299F8(uint64_t result, int a2)
{
  *(void *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t sub_100129A04@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t sub_100129A0C(char a1, char a2)
{
  uint64_t v2 = 0x53534F5243;
  if (a1)
  {
    sub_10012E970();
    if (v3) {
      uint64_t v5 = 0x52454E4E49;
    }
    else {
      uint64_t v5 = 0x54554F205446454CLL;
    }
    if (v3) {
      unint64_t v6 = v4;
    }
    else {
      unint64_t v6 = 0xEA00000000005245;
    }
  }
  else
  {
    unint64_t v6 = 0xE500000000000000;
    uint64_t v5 = 0x53534F5243;
  }
  if (a2)
  {
    sub_10012E970();
    if (v7) {
      uint64_t v2 = 0x52454E4E49;
    }
    else {
      uint64_t v2 = 0x54554F205446454CLL;
    }
    if (v7) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = 0xEA00000000005245;
    }
  }
  else
  {
    unint64_t v9 = 0xE500000000000000;
  }
  if (v5 == v2 && v6 == v9) {
    char v11 = 1;
  }
  else {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_100129B08(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE90000000000004ELL;
  uint64_t v3 = 0x4F49544341204F4ELL;
  uint64_t v4 = a1;
  uint64_t v5 = 0x4F49544341204F4ELL;
  unint64_t v6 = 0xE90000000000004ELL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x5443495254534552;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x4C4C554E20544553;
      break;
    case 3:
      uint64_t v5 = 0x4146454420544553;
      unint64_t v6 = 0xEB00000000544C55;
      break;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x45444143534143;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x5443495254534552;
      break;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x4C4C554E20544553;
      break;
    case 3:
      uint64_t v3 = 0x4146454420544553;
      unint64_t v2 = 0xEB00000000544C55;
      break;
    case 4:
      unint64_t v2 = 0xE700000000000000;
      uint64_t v3 = 0x45444143534143;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100129CD4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x4543414C504552;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x4543414C504552;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x4B4341424C4C4F52;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x54524F4241;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1279869254;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x45524F4E4749;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x4B4341424C4C4F52;
      break;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x54524F4241;
      break;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      uint64_t v2 = 1279869254;
      break;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x45524F4E4749;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100129E68(char a1, char a2)
{
  unint64_t v2 = 0xE900000000000045;
  uint64_t v3 = 0x4445525245464544;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 0x54414944454D4D49;
    }
    else {
      uint64_t v4 = 0x564953554C435845;
    }
    unint64_t v5 = 0xE900000000000045;
  }
  else
  {
    unint64_t v5 = 0xE800000000000000;
    uint64_t v4 = 0x4445525245464544;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 0x54414944454D4D49;
    }
    else {
      uint64_t v3 = 0x564953554C435845;
    }
  }
  else
  {
    unint64_t v2 = 0xE800000000000000;
  }
  if (v4 == v3 && v5 == v2) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100129F6C(uint64_t a1)
{
  return sub_100129FA8(a1, (void (*)(uint64_t))TableBuilder.Dependency.rawValue.getter);
}

Swift::Int sub_100129F84(char a1)
{
  return sub_10012A408(0, a1);
}

Swift::Int sub_100129F90(uint64_t a1)
{
  return sub_100129FA8(a1, (void (*)(uint64_t))OnConflict.rawValue.getter);
}

Swift::Int sub_100129FA8(uint64_t a1, void (*a2)(uint64_t))
{
  return Hasher._finalize()();
}

Swift::Int sub_10012A000()
{
  return sub_10012A2DC();
}

uint64_t sub_10012A00C(uint64_t a1, char a2)
{
  if (a2) {
    sub_10012E970();
  }
  else {
    sub_10012E95C();
  }
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10012A084()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10012A174()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10012A248()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10012A2DC()
{
  return Hasher._finalize()();
}

Swift::Int sub_10012A384(uint64_t a1, uint64_t a2)
{
  return sub_10012A3B4(a1, a2, (void (*)(uint64_t))OnConflict.rawValue.getter);
}

Swift::Int sub_10012A39C(uint64_t a1, uint64_t a2)
{
  return sub_10012A3B4(a1, a2, (void (*)(uint64_t))TableBuilder.Dependency.rawValue.getter);
}

Swift::Int sub_10012A3B4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return Hasher._finalize()();
}

Swift::Int sub_10012A408(uint64_t a1, char a2)
{
  if (a2) {
    sub_10012E970();
  }
  else {
    sub_10012E95C();
  }
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t Connection.prepare(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10012BA44(a1, a2, a3, Statement.bind(_:));
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;

  if (*(void *)(a3 + 16))
  {
    uint64_t result = Connection.prepare(_:_:)(a1, a2, _swiftEmptyArrayStorage);
    if (!v4)
    {
      char v7 = Statement.bind(_:)(a3);
      swift_release();
      return v7;
    }
  }
  else
  {
    type metadata accessor for Statement();
    swift_allocObject();
    swift_retain();
    swift_bridgeObjectRetain();
    return sub_100130940(v3);
  }
  return result;
}

{
  return sub_10012BA44(a1, a2, a3, Statement.bind(_:));
}

uint64_t sub_10012A4C0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_10000E7D8((_OWORD *)a1, v12);
    return sub_10012DD2C((uint64_t)v12, a2);
  }
  else
  {
    sub_10002A75C(a1, &qword_10017D3A0);
    unint64_t v5 = sub_1001320E4(a2);
    if (v6)
    {
      unint64_t v7 = v5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = *v2;
      uint64_t v9 = *v2;
      *unint64_t v2 = 0x8000000000000000;
      Swift::Int v10 = *(void *)(v9 + 24);
      sub_10000BF1C(&qword_100181348);
      _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v10);
      sub_10000E7D8((_OWORD *)(*(void *)(v11 + 56) + 32 * v7), v12);
      _NativeDictionary._delete(at:)();
      *unint64_t v2 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v12, 0, sizeof(v12));
    }
    return sub_10002A75C((uint64_t)v12, &qword_10017D3A0);
  }
}

uint64_t Connection.scalar(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_10012BBC8(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:), a4);
}

{
  return Connection.scalar(_:_:)(a1, a2, a3, a4);
}

{
  return sub_10012BBC8(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:), a4);
}

uint64_t Connection.run(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10012BAD4(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

{
  return Connection.run(_:_:)(a1, a2, a3);
}

{
  return sub_10012BAD4(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

sqlite3_int64 Connection.lastInsertRowid.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();

  return sqlite3_last_insert_rowid(v0);
}

BOOL sub_10012A664(uint64_t a1, uint64_t a2)
{
  sub_10010D428();
  if (qword_100180D38 != -1) {
    swift_once();
  }
  static OS_dispatch_queue.getSpecific<A>(key:)();
  uint64_t v5 = sub_10012B3A0();
  if ((v12 & 1) != 0 || v11 != v5)
  {
    id v9 = *(id *)(a1 + 104);
    OS_dispatch_queue.sync<A>(execute:)();
    swift_release();

    if (!v2) {
      return v13;
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v6 = sqlite3_step(*(sqlite3_stmt **)(a2 + 16));
    int v7 = v6;
    sub_10012B2A0(v6, 0);
    swift_release();
    if (!v2) {
      return v7 == 100;
    }
  }
  return v8;
}

void sub_10012A7B8()
{
  sub_10012E8BC();
  sub_10012E720();
  if (qword_100180D38 != -1) {
    swift_once();
  }
  static OS_dispatch_queue.getSpecific<A>(key:)();
  uint64_t v4 = sub_10012E870();
  if ((v3 & 1) != 0 || v2 != v4)
  {
    id v5 = *(id *)(v1 + 104);
    sub_10012E854();
    swift_release();
  }
  else
  {
    sub_10012E774();
    if (!v0)
    {
      swift_release();
      uint64_t v6 = (sqlite3 *)Connection.handle.getter();
      sqlite3_last_insert_rowid(v6);
    }
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10012E838();
}

void sub_10012A8E4()
{
  sub_10012E8BC();
  sub_10012E720();
  if (qword_100180D38 != -1) {
    swift_once();
  }
  static OS_dispatch_queue.getSpecific<A>(key:)();
  uint64_t v4 = sub_10012E870();
  if ((v3 & 1) != 0 || v2 != v4)
  {
    id v5 = *(id *)(v1 + 104);
    sub_10012E854();
    swift_release();
  }
  else
  {
    sub_10012E774();
    if (!v0)
    {
      swift_release();
      uint64_t v6 = (sqlite3 *)Connection.handle.getter();
      sqlite3_changes(v6);
    }
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10012E838();
}

uint64_t sub_10012AA14(uint64_t a1)
{
  sub_10010D428();
  if (qword_100180D38 != -1) {
    swift_once();
  }
  static OS_dispatch_queue.getSpecific<A>(key:)();
  uint64_t v3 = sub_10012B3A0();
  if ((v9 & 1) != 0 || v8 != v3)
  {
    uint64_t v6 = (uint64_t)*(id *)(a1 + 104);
    OS_dispatch_queue.sync<A>(execute:)();
    if (v1)
    {
      swift_bridgeObjectRelease();
      swift_release();

      return v6;
    }
    swift_release();

    uint64_t v6 = v10;
LABEL_11:
    swift_bridgeObjectRelease();
    return v6;
  }
  uint64_t v4 = (sqlite3 *)Connection.handle.getter();
  uint64_t v5 = String.utf8CString.getter();
  uint64_t v6 = sqlite3_exec(v4, (const char *)(v5 + 32), 0, 0, 0);
  swift_release();
  sub_10012B2A0(v6, 0);
  if (!v1)
  {
    swift_release();
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v6;
}

uint64_t sub_10012ABCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10010D428();
  if (qword_100180D38 != -1) {
    swift_once();
  }
  static OS_dispatch_queue.getSpecific<A>(key:)();
  uint64_t v13 = sub_10012B3A0();
  if ((v20 & 1) != 0 || v19 != v13)
  {
    id v14 = *(id *)(a1 + 104);
    OS_dispatch_queue.sync<A>(execute:)();
    if (v21)
    {
      swift_bridgeObjectRelease();
      swift_release();

      goto LABEL_9;
    }
    swift_release();

LABEL_12:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  sub_10012C0B4(a2, a3, a4, a5, a6, a7, a8);
  if (!v21)
  {
    swift_release();
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_release();
LABEL_9:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Connection.changes.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_changes(v0);
}

uint64_t sub_10012ADD4(int a1)
{
  switch(a1)
  {
    case 9:
      return 2;
    case 18:
      return 0;
    case 23:
      return 1;
  }
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t Connection.handle.getter()
{
  sub_10012E7C4();
  uint64_t result = *(void *)(v0 + 16);
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t Connection.__allocating_init(_:readonly:)()
{
  sub_10012E798();
  sub_10012E7FC();
  return v0;
}

uint64_t Connection.init(_:readonly:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v23 = a2;
  int v25 = a3;
  uint64_t v24 = a1;
  uint64_t v21 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_10000E948();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v9 - 8);
  sub_100018DBC();
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v10);
  *(_OWORD *)(v3 + 16) = 0u;
  uint64_t v11 = (sqlite3 **)(v3 + 16);
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(void *)(v3 + 80) = 0;
  *(void *)(v3 + 88) = &_swiftEmptyDictionarySingleton;
  *(void *)(v3 + 96) = &_swiftEmptyDictionarySingleton;
  v20[1] = sub_10010D428();
  v26 = _swiftEmptyArrayStorage;
  sub_10004AFC0();
  sub_10000BF1C(&qword_10017C760);
  sub_100027C2C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  static DispatchQoS.unspecified.getter();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v21);
  *(void *)(v3 + 104) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v3 + 112) = 0;
  *(unsigned char *)(v3 + 120) = 1;
  sub_10012E820();
  if (v25) {
    int v12 = 65537;
  }
  else {
    int v12 = 65542;
  }
  uint64_t v13 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v14 = v22;
  uint64_t v15 = sqlite3_open_v2((const char *)(v13 + 32), v11, v12, 0);
  swift_endAccess();
  swift_release();
  uint64_t v16 = v28;
  sub_10012B2A0(v15, 0);
  if (v16)
  {
    swift_release();
  }
  else
  {
    uint64_t v17 = qword_100180D38;
    id v18 = *(id *)(v14 + 104);
    if (v17 != -1) {
      swift_once();
    }
    v26 = (void *)sub_10012B3A0();
    char v27 = 0;
    OS_dispatch_queue.setSpecific<A>(key:value:)();
  }
  return v14;
}

uint64_t Connection.Location.description.getter()
{
  sub_10012E820();
  if (v1 == 1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v0;
  }
  if (v1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v2;
  }
  sub_10006FB04(v0, v1);
  return v4;
}

const char *sub_10012B2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = qword_100180D50;
  swift_retain();
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  sub_100139CFC(a1, qword_100181738);
  if (v5)
  {
    swift_release();
    swift_release();
    return (const char *)a1;
  }
  uint64_t v6 = (sqlite3 *)Connection.handle.getter();
  uint64_t result = sqlite3_errmsg(v6);
  if (result)
  {
    uint64_t v8 = String.init(cString:)();
    uint64_t v10 = v9;
    swift_release();
    sub_100047E58();
    swift_allocError();
    *(void *)uint64_t v11 = v8;
    *(void *)(v11 + 8) = v10;
    *(_DWORD *)(v11 + 16) = a1;
    *(void *)(v11 + 24) = a2;
    swift_willThrow();
    return (const char *)a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_10012B3A0()
{
  uint64_t result = v0;
  if (*(unsigned char *)(v0 + 120) != 1) {
    return *(void *)(v0 + 112);
  }
  *(void *)(v0 + 112) = v0;
  *(unsigned char *)(v0 + 120) = 0;
  return result;
}

uint64_t Connection.deinit()
{
  unint64_t v1 = (sqlite3 *)Connection.handle.getter();
  sqlite3_close(v1);
  sub_10012E7C4();
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 24);
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v2(v3);
    sub_100093428((uint64_t)v2);
    uint64_t v4 = *(void *)(v0 + 24);
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_100093428(v4);
  _Block_release(*(const void **)(v0 + 48));
  _Block_release(*(const void **)(v0 + 56));
  _Block_release(*(const void **)(v0 + 64));
  _Block_release(*(const void **)(v0 + 72));
  _Block_release(*(const void **)(v0 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t Connection.__deallocating_deinit()
{
  Connection.deinit();

  return _swift_deallocClassInstance(v0, 121, 7);
}

uint64_t Connection.onClose.getter()
{
  sub_10012E7C4();
  uint64_t v1 = *(void *)(v0 + 24);
  sub_100059D80(v1);
  return v1;
}

uint64_t Connection.onClose.setter()
{
  sub_10012E8D8();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  return sub_100093428(v3);
}

uint64_t (*Connection.onClose.modify())()
{
  return j__swift_endAccess;
}

BOOL Connection.readonly.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_db_readonly(v0, 0) == 1;
}

uint64_t Connection.totalChanges.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_total_changes(v0);
}

unint64_t Connection.userVersion.getter()
{
  Connection.scalar(_:_:)(0xD000000000000013, 0x8000000100144050, (uint64_t)_swiftEmptyArrayStorage, (uint64_t)v4);
  if (!v5)
  {
    sub_10002A75C((uint64_t)v4, &qword_10017DEC0);
    goto LABEL_2;
  }
  sub_10000BF1C(&qword_10017DEC8);
  unint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_2:
    uint64_t v0 = 0;
    unsigned __int8 v1 = 1;
LABEL_3:
    v4[0] = v1;
    return v0 | ((unint64_t)v1 << 32);
  }
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v3 <= 0x7FFFFFFF)
  {
    unsigned __int8 v1 = 0;
    uint64_t v0 = v3;
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t Connection.userVersion.setter()
{
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  Connection.run(_:_:)(0xD000000000000016, 0x80000001001469A0, (uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t (*Connection.userVersion.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  unint64_t v3 = Connection.userVersion.getter();
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = BYTE4(v3) & 1;
  return sub_10012B834;
}

uint64_t sub_10012B834()
{
  return Connection.userVersion.setter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Connection.execute(_:)(Swift::String a1)
{
  swift_retain();
  swift_bridgeObjectRetain();
  sub_10012AA14(v1);
}

const char *sub_10012B8B4@<X0>(_DWORD *a1@<X8>)
{
  unint64_t v3 = (sqlite3 *)Connection.handle.getter();
  uint64_t v4 = String.utf8CString.getter();
  uint64_t v5 = sqlite3_exec(v3, (const char *)(v4 + 32), 0, 0, 0);
  swift_release();
  unint64_t result = sub_10012B2A0(v5, 0);
  if (!v1) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_10012BA44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = Connection.prepare(_:_:)(a1, a2, (uint64_t)_swiftEmptyArrayStorage);
  if (!v4)
  {
    uint64_t v8 = a4(a3);
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_10012BAD4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  Connection.prepare(_:_:)(a1, a2, (uint64_t)_swiftEmptyArrayStorage);
  if (!v5)
  {
    a4(a3);
    uint64_t v4 = Statement.run(_:)((uint64_t)_swiftEmptyArrayStorage);
    swift_release();
    swift_release();
  }
  return v4;
}

uint64_t Connection.vacuum()()
{
  return Connection.run(_:_:)(0x4D5555434156, 0xE600000000000000, (uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_10012BBC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = Connection.prepare(_:_:)(a1, a2, (uint64_t)_swiftEmptyArrayStorage);
  if (!v5)
  {
    a4(a3);
    Statement.scalar(_:)((uint64_t)_swiftEmptyArrayStorage, a5);
    swift_release();
    return swift_release();
  }
  return result;
}

AppIntents_SQLite::Connection::TransactionMode_optional __swiftcall Connection.TransactionMode.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100173CF8, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return (AppIntents_SQLite::Connection::TransactionMode_optional)3;
  }
  else {
    return (AppIntents_SQLite::Connection::TransactionMode_optional)v3;
  }
}

uint64_t Connection.TransactionMode.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x4445525245464544;
  }
  if (a1 == 1) {
    return 0x54414944454D4D49;
  }
  return 0x564953554C435845;
}

uint64_t sub_10012BD04(char *a1, char *a2)
{
  return sub_100129E68(*a1, *a2);
}

Swift::Int sub_10012BD10()
{
  return sub_10012A000();
}

uint64_t sub_10012BD18()
{
  return sub_10012A248();
}

Swift::Int sub_10012BD20()
{
  return sub_10012A2DC();
}

AppIntents_SQLite::Connection::TransactionMode_optional sub_10012BD28@<W0>(Swift::String *a1@<X0>, AppIntents_SQLite::Connection::TransactionMode_optional *a2@<X8>)
{
  result.value = Connection.TransactionMode.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_10012BD58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Connection.TransactionMode.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t Connection.transaction(_:block:)(char a1, void (*a2)(uint64_t), uint64_t a3)
{
  _StringGuts.grow(_:)(20);
  swift_bridgeObjectRelease();
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v6 = 0x54414944454D4D49;
    }
    else {
      uint64_t v6 = 0x564953554C435845;
    }
    unint64_t v7 = 0xE900000000000045;
  }
  else
  {
    unint64_t v7 = 0xE800000000000000;
    uint64_t v6 = 0x4445525245464544;
  }
  unint64_t v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x4341534E41525420;
  v9._object = (void *)0xEC0000004E4F4954;
  String.append(_:)(v9);
  sub_10012BEF0(0x204E49474542, 0xE600000000000000, a2, a3, 0xD000000000000012, 0x8000000100143FE0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10012BEF0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_10012ABCC(v6, v6, a1, a2, a3, a4, a5, a6);
}

uint64_t Connection.savepoint(_:block:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  v6._countAndFlagsBits = sub_100117940(39, (void *)0xE100000000000000, a1, a2);
  String.append(_:)(v6);
  int v7 = swift_bridgeObjectRelease();
  sub_10012E91C(v7, v8, v9, v10, v11, v12, v13, v14, 0x4E494F5045564153, 0xEA00000000002054);
  uint64_t v15 = v26;
  uint64_t v16 = v27;
  sub_10012E91C(v17, v18, v19, v20, v21, v22, v23, v24, v26, v27);
  sub_10012BEF0(0x4E494F5045564153, 0xEA00000000002054, a3, a4, v15, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10012C0B4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = Connection.run(_:_:)(a2, a3, (uint64_t)_swiftEmptyArrayStorage);
  if (!v7)
  {
    uint64_t v12 = swift_release();
    a4(v12);
    Connection.run(_:_:)(a6, a7, (uint64_t)_swiftEmptyArrayStorage);
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall Connection.interrupt()()
{
  Swift::String v0 = (sqlite3 *)Connection.handle.getter();

  sqlite3_interrupt(v0);
}

uint64_t sub_10012C1D8()
{
  uint64_t v1 = (sqlite3 *)Connection.handle.getter();
  uint64_t result = swift_beginAccess();
  double v3 = *(double *)(v0 + 40) * 1000.0;
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -2147483650.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 2147483650.0) {
    return sqlite3_busy_timeout(v1, (int)v3);
  }
LABEL_7:
  __break(1u);
  return result;
}

double Connection.busyTimeout.getter()
{
  sub_10012E7C4();
  return *(double *)(v0 + 40);
}

uint64_t Connection.busyTimeout.setter(double a1)
{
  swift_beginAccess();
  *(double *)(v1 + 40) = a1;
  return sub_10012C1D8();
}

uint64_t (*Connection.busyTimeout.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  sub_10012E904();
  return sub_10012C32C;
}

uint64_t sub_10012C32C(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_10012C1D8();
  }
  return result;
}

void Connection.busyHandler(_:)(uint64_t a1)
{
  if (a1)
  {
    sub_10012E8D8();
    uint64_t v4 = sub_100059EB8();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_10012DCC4;
    v11[5] = v4;
    v11[0] = _NSConcreteStackBlock;
    sub_10012E88C();
    v11[2] = sub_10012C46C;
    v11[3] = &unk_1001748E8;
    _Block_copy(v11);
    sub_10012E7E0();
    swift_release();
    uint64_t v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_busy_handler(v5, (int (__cdecl *)(void *, int))sub_10012C4C8, v3);
    Swift::String v6 = *(const void **)(v2 + 48);
    *(void *)(v2 + 48) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    sub_100060358();
    sqlite3_busy_handler(v7, v8, v9);
    int v10 = *(const void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_10012C46C(uint64_t a1, uint64_t a2)
{
  double v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t sub_10012C4BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_10012C4D0(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    v11[4] = sub_10012E628;
    v11[5] = v5;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_10012C620;
    v11[3] = &unk_100174C78;
    Swift::String v6 = _Block_copy(v11);
    swift_retain_n();
    swift_release();
    uint64_t v7 = (sqlite3 *)Connection.handle.getter();
    sqlite3_trace_v2(v7, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_10012C71C, v6);
    sub_100093428(a1);
    int v8 = *(const void **)(v2 + 56);
    *(void *)(v2 + 56) = v6;
    _Block_release(v8);
  }
  else
  {
    int v9 = (sqlite3 *)Connection.handle.getter();
    sqlite3_trace_v2(v9, 0, 0, 0);
    int v10 = *(const void **)(v2 + 56);
    *(void *)(v2 + 56) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_10012C620(uint64_t a1, uint64_t a2)
{
  double v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_10012C674(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = String.init(cString:)();
  a2(v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10012C6C4(int a1, uint64_t a2, sqlite3_stmt *pStmt)
{
  if (pStmt)
  {
    uint64_t v4 = sqlite3_expanded_sql(pStmt);
    if (v4)
    {
      uint64_t v5 = v4;
      (*(void (**)(uint64_t, char *))(a2 + 16))(a2, v4);
      sqlite3_free(v5);
    }
  }
  return 0;
}

void Connection.updateHook(_:)(uint64_t a1)
{
  if (a1)
  {
    sub_10012E8D8();
    uint64_t v4 = sub_100059EB8();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_10012DD0C;
    v11[5] = v4;
    v11[0] = _NSConcreteStackBlock;
    sub_10012E88C();
    v11[2] = sub_10012C8D4;
    v11[3] = &unk_100174938;
    _Block_copy(v11);
    sub_10012E7E0();
    swift_release();
    uint64_t v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_update_hook(v5, (void (__cdecl *)(void *, int, const char *, const char *, sqlite3_int64))sub_10012C968, v3);
    Swift::String v6 = *(const void **)(v2 + 64);
    *(void *)(v2 + 64) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    sub_100060358();
    sqlite3_update_hook(v7, v8, v9);
    int v10 = *(const void **)(v2 + 64);
    *(void *)(v2 + 64) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_10012C82C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = sub_10012ADD4(a1);
  uint64_t v8 = String.init(cString:)();
  uint64_t v10 = v9;
  uint64_t v11 = String.init(cString:)();
  a5(v7, v8, v10, v11, v12, a4);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10012C8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v9(a2, a3, a4, a5);

  return swift_release();
}

uint64_t sub_10012C94C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    if (a4) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void Connection.commitHook(_:)(uint64_t a1)
{
  if (a1)
  {
    sub_10012E8D8();
    uint64_t v4 = sub_100059EB8();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_10012DD14;
    v11[5] = v4;
    v11[0] = _NSConcreteStackBlock;
    sub_10012E88C();
    v11[2] = sub_10012CACC;
    v11[3] = &unk_100174988;
    _Block_copy(v11);
    sub_10012E7E0();
    swift_release();
    uint64_t v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_commit_hook(v5, (int (__cdecl *)(void *))sub_10012CB18, v3);
    Swift::String v6 = *(const void **)(v2 + 72);
    *(void *)(v2 + 72) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    sub_100060358();
    sqlite3_commit_hook(v7, v8, v9);
    uint64_t v10 = *(const void **)(v2 + 72);
    *(void *)(v2 + 72) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_10012CA78(void (*a1)(void))
{
  return 0;
}

uint64_t sub_10012CACC(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_10012CB0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void Connection.rollbackHook(_:)(uint64_t a1)
{
  if (a1)
  {
    sub_10012E8D8();
    uint64_t v4 = sub_100059EB8();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    v11[4] = sub_1000275CC;
    v11[5] = v4;
    v11[0] = _NSConcreteStackBlock;
    sub_10012E88C();
    v11[2] = sub_1000125A8;
    v11[3] = &unk_1001749D8;
    _Block_copy(v11);
    sub_10012E7E0();
    swift_release();
    uint64_t v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_rollback_hook(v5, (void (__cdecl *)(void *))sub_10012CC28, v3);
    Swift::String v6 = *(const void **)(v2 + 80);
    *(void *)(v2 + 80) = v3;
    _Block_release(v6);
  }
  else
  {
    Connection.handle.getter();
    sub_100060358();
    sqlite3_rollback_hook(v7, v8, v9);
    uint64_t v10 = *(const void **)(v2 + 80);
    *(void *)(v2 + 80) = 0;
    _Block_release(v10);
  }
}

uint64_t Connection.createFunction(_:argumentCount:deterministic:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  if ((a4 & 1) == 0)
  {
    uint64_t v12 = a3;
    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
    __break(1u);
  }
  uint64_t v12 = -1;
LABEL_5:
  uint64_t v13 = sub_100059EB8();
  *(void *)(v13 + 16) = a6;
  *(void *)(v13 + 24) = a7;
  v33 = sub_10012DD1C;
  uint64_t v34 = v13;
  aBlock = _NSConcreteStackBlock;
  unint64_t v30 = 1107296256;
  v31 = sub_10012D2E4;
  v32 = &unk_100174A28;
  int v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v15 = Connection.handle.getter();
  if (v12 > 0x7FFFFFFF)
  {
    __break(1u);
  }
  else
  {
    int v19 = (sqlite3 *)v15;
    if (a5) {
      int v20 = 2049;
    }
    else {
      int v20 = 1;
    }
    uint64_t v21 = String.utf8CString.getter();
    function_uint64_t v2 = sqlite3_create_function_v2(v19, (const char *)(v21 + 32), v12, v20, v14, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_10012D3AC, 0, 0, 0);
    swift_release();
    swift_retain();
    uint64_t v15 = (uint64_t)sub_100139C00(function_v2);
    if (!v16)
    {
      v32 = (void *)sub_10000BF1C(&qword_100181238);
      aBlock = (void **)v14;
      _Block_copy(v14);
      sub_10012D3B0(a1, a2, v12, (uint64_t)&aBlock);
      _Block_release(v14);
      return sub_10000E788((uint64_t)&aBlock);
    }
  }
  uint64_t v24 = v15;
  uint64_t v25 = v17;
  aBlock = 0;
  unint64_t v30 = 0xE000000000000000;
  uint64_t v26 = v18;
  uint64_t v27 = v16;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  aBlock = (void **)0xD000000000000019;
  unint64_t v30 = 0x8000000100146A40;
  v28._countAndFlagsBits = Result.description.getter(v24, v27, v25, v26);
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  uint64_t result = sub_10012E8E4();
  __break(1u);
  return result;
}

uint64_t sub_10012CE80(sqlite3_context *a1, int a2, uint64_t a3, void (*a4)(void *__return_ptr))
{
  sub_10012CEF8(a2, a3);
  a4(v7);
  swift_bridgeObjectRelease();
  sub_10012CFF4((uint64_t)v7, a1);
  return sub_10002A75C((uint64_t)v7, &qword_10017DEC0);
}

void sub_10012CEF8(int a1, uint64_t a2)
{
  if (a1 < 0)
  {
LABEL_10:
    __break(1u);
    return;
  }
  if (a1)
  {
    uint64_t v3 = a1;
    uint64_t v9 = _swiftEmptyArrayStorage;
    sub_10005797C();
    uint64_t v4 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage;
    while (v3 != v4)
    {
      uint64_t v7 = v4;
      sub_10012DA98(&v7, a2, (uint64_t)v8);
      uint64_t v9 = v5;
      unint64_t v6 = v5[2];
      if (v6 >= v5[3] >> 1)
      {
        sub_10005797C();
        uint64_t v5 = v9;
      }
      ++v4;
      v5[2] = v6 + 1;
      sub_100059CD0((uint64_t)v8, (uint64_t)&v5[5 * v6 + 4]);
      if (v3 == v4) {
        return;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
}

uint64_t sub_10012CFF4(uint64_t a1, sqlite3_context *a2)
{
  uint64_t v5 = type metadata accessor for String.Encoding();
  sub_10000E948();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_100018DBC();
  sub_1000FE754(a1, (uint64_t)v20);
  if (!v21)
  {
    sqlite3_result_null(a2);
    return sub_10002A75C((uint64_t)v20, &qword_10017DEC0);
  }
  sub_1000FE754((uint64_t)v20, (uint64_t)v19);
  sub_10000BF1C(&qword_10017DEC8);
  if (sub_10012E754())
  {
    LODWORD(v9) = LODWORD(v15);
    unint64_t v10 = *(void *)(*(void *)&v15 + 16);
    if (!(v10 >> 31))
    {
      sqlite3_result_blob(a2, (const void *)(*(void *)&v15 + 32), v10, 0);
      swift_bridgeObjectRelease();
LABEL_15:
      sub_10000E788((uint64_t)v19);
      return sub_10002A75C((uint64_t)v20, &qword_10017DEC0);
    }
    __break(1u);
    goto LABEL_18;
  }
  if (sub_10012E754())
  {
    sqlite3_result_double(a2, v15);
    goto LABEL_15;
  }
  if (sub_10012E754())
  {
    sqlite3_result_int64(a2, *(sqlite3_int64 *)&v15);
    goto LABEL_15;
  }
  if (sub_10012E754())
  {
    double v17 = v15;
    unint64_t v18 = v16;
    static String.Encoding.utf8.getter();
    sub_10001B398();
    uint64_t v9 = StringProtocol.lengthOfBytes(using:)();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
    if (v9 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (v9 <= 0x7FFFFFFF)
      {
        if (qword_100180D30 == -1)
        {
LABEL_14:
          uint64_t v11 = (void (__cdecl *)(void *))qword_100182468;
          uint64_t v12 = String.utf8CString.getter();
          swift_bridgeObjectRelease();
          sqlite3_result_text(a2, (const char *)(v12 + 32), v9, v11);
          swift_release();
          goto LABEL_15;
        }
LABEL_20:
        swift_once();
        goto LABEL_14;
      }
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_10000E788((uint64_t)v19);
  sub_1000FE754(a1, (uint64_t)v19);
  double v15 = 0.0;
  unint64_t v16 = 0xE000000000000000;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  double v17 = -2.31584178e77;
  unint64_t v18 = 0x8000000100146B40;
  sub_1000FE754((uint64_t)v19, (uint64_t)&v15);
  sub_10000BF1C(&qword_10017DEC0);
  v14._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  uint64_t result = sub_10012E8E4();
  __break(1u);
  return result;
}

uint64_t sub_10012D2E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);

  return swift_release();
}

uint64_t sub_10012D354(sqlite3_context *a1)
{
  uint64_t v1 = (uint64_t (*)(void))*((void *)sqlite3_user_data(a1) + 2);

  return v1();
}

uint64_t sub_10012D3B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t v9 = *(void *)(v4 + 88);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_100126FEC(a1, a2, v9);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = Dictionary.init(dictionaryLiteral:)();
    sub_10012E904();
    sub_10012DDAC(v11, a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100132334);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  sub_10012E904();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_10012D540(v16, a1, a2);
  if (*v13)
  {
    sub_100010008(a4, (uint64_t)v15);
    sub_10012A4C0((uint64_t)v15, a3);
  }
  ((void (*)(void *, void))v12)(v16, 0);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

void (*sub_10012D540(void *a1, uint64_t a2, uint64_t a3))(void **a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_10012E280(v6, a2, a3);
  return sub_10012D5C0;
}

void sub_10012D5C0(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = sub_10012E948();
  v3(v2);
  swift_bridgeObjectRelease();

  free(v1);
}

void Connection.createCollation(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  v14[4] = sub_10012DD24;
  v14[5] = v9;
  v14[0] = _NSConcreteStackBlock;
  sub_10012E88C();
  v14[2] = sub_10012D850;
  v14[3] = &unk_100174A78;
  uint64_t v10 = _Block_copy(v14);
  swift_retain();
  swift_release();
  uint64_t v11 = (sqlite3 *)Connection.handle.getter();
  uint64_t v12 = String.utf8CString.getter();
  collation_uint64_t v2 = sqlite3_create_collation_v2(v11, (const char *)(v12 + 32), 1, v10, (int (__cdecl *)(void *, int, const void *, int, const void *))sub_10012D93C, 0);
  swift_release();
  sub_10012B2A0(collation_v2, 0);
  if (!v4)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    _Block_copy(v10);
    sub_10012DDAC((uint64_t)v10, a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10013240C);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  _Block_release(v10);
}

uint64_t sub_10012D7B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = String.init(cString:)();
  uint64_t v6 = v5;
  uint64_t v7 = String.init(cString:)();
  uint64_t v9 = a3(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v9 <= 0x7FFFFFFF)
  {
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_10012D850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v6 = v5(a2, a3);
  swift_release();
  return v6;
}

uint64_t sub_10012D8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 && a5)
  {
    uint64_t v5 = *(uint64_t (**)(void))(a1 + 16);
    return v5();
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void *Connection.backup(databaseName:usingConnection:andDatabaseName:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  type metadata accessor for Backup();
  swift_allocObject();
  swift_retain();
  sub_10006FB04(a1, a2);
  swift_retain();
  sub_10006FB04(a4, a5);
  return Backup.init(sourceConnection:sourceName:targetConnection:targetName:)(v5, a1, a2, a3);
}

uint64_t sub_10012D9F0()
{
  sub_10000BF1C(&qword_100181360);
  swift_allocObject();
  uint64_t result = DispatchSpecificKey.init()();
  qword_100181230 = result;
  return result;
}

const char *Connection.description.getter()
{
  uint64_t v0 = (sqlite3 *)Connection.handle.getter();
  uint64_t result = sqlite3_db_filename(v0, 0);
  if (result)
  {
    return (const char *)String.init(cString:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

const char *sub_10012DA6C()
{
  return Connection.description.getter();
}

uint64_t sub_10012DA90()
{
  return Connection.Location.description.getter();
}

void sub_10012DA98(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!a2)
  {
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    _StringGuts.grow(_:)(26);
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x10012DC78);
  }
  uint64_t v4 = *(sqlite3_value **)(a2 + 8 * *a1);
  switch(sqlite3_value_type(v4))
  {
    case 1:
      sqlite3_int64 v5 = sqlite3_value_int64(v4);
      uint64_t v6 = (ValueMetadata *)&type metadata for Int64;
      uint64_t v7 = &protocol witness table for Int64;
      goto LABEL_10;
    case 2:
      double v10 = sqlite3_value_double(v4);
      *(void *)(a3 + 24) = &type metadata for Double;
      *(void *)(a3 + 32) = &protocol witness table for Double;
      *(double *)a3 = v10;
      return;
    case 3:
      if (!sqlite3_value_text(v4)) {
        goto LABEL_13;
      }
      uint64_t v8 = String.init(cString:)();
      *(void *)(a3 + 24) = &type metadata for String;
      *(void *)(a3 + 32) = &protocol witness table for String;
      *(void *)a3 = v8;
      *(void *)(a3 + 8) = v9;
      break;
    case 4:
      uint64_t v11 = sqlite3_value_blob(v4);
      if (!v11) {
        goto LABEL_14;
      }
      uint64_t v12 = v11;
      int v13 = sqlite3_value_bytes(v4);
      sqlite3_int64 v5 = (sqlite3_int64)_s17AppIntents_SQLite4BlobV5bytes6lengthACSV_SitcfC_0(v12, v13);
      uint64_t v6 = &type metadata for Blob;
      uint64_t v7 = &protocol witness table for Blob;
LABEL_10:
      *(void *)(a3 + 24) = v6;
      *(void *)(a3 + 32) = v7;
      *(void *)a3 = v5;
      break;
    case 5:
      *(void *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return;
    default:
      goto LABEL_15;
  }
}

uint64_t sub_10012DC8C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10012DCC4(int a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(a1) & 1;
}

uint64_t sub_10012DCF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10012DD04()
{
  return swift_release();
}

uint64_t sub_10012DD0C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10012C82C(a1, a2, a3, a4, *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16));
}

uint64_t sub_10012DD14()
{
  return sub_10012CA78(*(void (**)(void))(v0 + 16));
}

uint64_t sub_10012DD1C(sqlite3_context *a1, int a2, uint64_t a3)
{
  return sub_10012CE80(a1, a2, a3, *(void (**)(void *__return_ptr))(v3 + 16));
}

uint64_t sub_10012DD24(uint64_t a1, uint64_t a2)
{
  return sub_10012D7B0(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_10012DD2C(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_100132224(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

uint64_t sub_10012DDAC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  a4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v4 = v11;

  return swift_bridgeObjectRelease();
}

unint64_t sub_10012DE48()
{
  unint64_t result = qword_100181240;
  if (!qword_100181240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100181240);
  }
  return result;
}

unint64_t sub_10012DE98()
{
  unint64_t result = qword_100181248;
  if (!qword_100181248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100181248);
  }
  return result;
}

uint64_t type metadata accessor for Connection()
{
  return self;
}

unint64_t destroy for Connection.Location(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17AppIntents_SQLite10ConnectionC8LocationOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for Connection.Location(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Connection.Location(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Connection.Location(uint64_t a1, unsigned int a2)
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
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Connection.Location(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_10012E128(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10012E140(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

void type metadata accessor for Connection.Location()
{
}

void type metadata accessor for Connection.Operation()
{
}

unsigned char *_s17AppIntents_SQLite10ConnectionC9OperationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10012E24CLL);
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

void type metadata accessor for Connection.TransactionMode()
{
}

void (*sub_10012E280(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unsigned int v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_10012E518(v6);
  v6[10] = sub_10012E394(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_10012E32C;
}

void sub_10012E32C(uint64_t a1)
{
  unint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_10012E948();
  v2(v3);

  free(v1);
}

#error "10012E3EC: call analysis failed (funcsize=75)"

void sub_10012E4C8(uint64_t **a1)
{
  unint64_t v1 = *a1;
  sub_10012E554(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_10012E518(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *unint64_t v1 = 0x8000000000000000;
  return sub_10012E548;
}

uint64_t sub_10012E548(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_10012E554(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v6;
    }
    else
    {
      sub_10000D350(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_10000BF1C(&qword_100181358);
    _NativeDictionary._delete(at:)();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10012E628(uint64_t a1)
{
  return sub_10012C674(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_10012E630()
{
  uint64_t v1 = sub_10012E93C();
  return sub_10012C0B4(v1, v2, v3, v4, v0[6], v0[7], v0[8]);
}

const char *sub_10012E664@<X0>(_DWORD *a1@<X8>)
{
  return sub_10012B8B4(a1);
}

uint64_t sub_10012E684()
{
  uint64_t v0 = sub_10012E93C();
  return sub_100126EA8(v0, v1, v2, v3);
}

uint64_t sub_10012E6A0()
{
  uint64_t v0 = sub_10012E93C();
  return sub_100126E38(v0, v1, v2, v3);
}

const char *sub_10012E6BC@<X0>(BOOL *a1@<X8>)
{
  return sub_100131734(v1, a1);
}

unint64_t sub_10012E720()
{
  return sub_10010D428();
}

uint64_t sub_10012E754()
{
  return swift_dynamicCast();
}

uint64_t sub_10012E774()
{
  return Connection.run(_:_:)(v2, v0, v1);
}

uint64_t sub_10012E798()
{
  return swift_allocObject();
}

uint64_t sub_10012E7C4()
{
  return swift_beginAccess();
}

uint64_t sub_10012E7E0()
{
  return swift_retain();
}

uint64_t sub_10012E7FC()
{
  return Connection.init(_:readonly:)(v2, v1, v0);
}

uint64_t sub_10012E854()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_10012E870()
{
  return sub_10012B3A0();
}

uint64_t sub_10012E898()
{
  return String.hash(into:)();
}

uint64_t sub_10012E8E4()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10012E904()
{
  return swift_beginAccess();
}

void sub_10012E91C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13 = v10;
  uint64_t v14 = v11;
  String.append(_:)(*(Swift::String *)&v13);
}

uint64_t sub_10012E93C()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_10012E948()
{
  return v0;
}

uint64_t sub_10012E97C()
{
  return sub_10012E984(*v0);
}

uint64_t sub_10012E984(double a1)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10013EF20;
  *(void *)(v2 + 56) = &type metadata for Double;
  *(void *)(v2 + 64) = &protocol witness table for Double;
  *(double *)(v2 + 32) = a1;
  return 63;
}

uint64_t sub_10012E9EC(uint64_t a1, uint64_t a2)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10013EF20;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = &protocol witness table for String;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  swift_bridgeObjectRetain();
  return 63;
}

uint64_t sub_10012EA6C(uint64_t a1)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10013EF20;
  *(void *)(v2 + 56) = &type metadata for Blob;
  *(void *)(v2 + 64) = &protocol witness table for Blob;
  *(void *)(v2 + 32) = a1;
  swift_bridgeObjectRetain();
  return 63;
}

uint64_t sub_10012EAE0(char a1)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10013EF20;
  *(void *)(v2 + 56) = &type metadata for Int64;
  *(void *)(v2 + 64) = &protocol witness table for Int64;
  *(void *)(v2 + 32) = a1 & 1;
  return 63;
}

uint64_t sub_10012EB4C(uint64_t a1)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10013EF20;
  *(void *)(v2 + 56) = &type metadata for Int64;
  *(void *)(v2 + 64) = &protocol witness table for Int64;
  *(void *)(v2 + 32) = a1;
  return 63;
}

uint64_t sub_10012EBB4(uint64_t a1, unint64_t a2)
{
  sub_10000DADC(a1, a2);

  return sub_10012F868(a1, a2);
}

uint64_t sub_10012EBF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v3 + 16))(v6, v1, v2, v4);
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10013EF20;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = &protocol witness table for String;
  if (qword_100180D48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v8 = dateFormatter.super.super.isa;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v10 = [(objc_class *)v8 stringFromDate:isa];

  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  *(void *)(v7 + 32) = v11;
  *(void *)(v7 + 40) = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return 63;
}

uint64_t sub_10012EDCC()
{
  uint64_t v1 = type metadata accessor for UUID();
  double v2 = __chkstk_darwin(v1);
  double v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))(v4, v0, v2);
  return sub_10012FA0C((uint64_t)v4);
}

uint64_t Value.expression.getter(uint64_t a1, uint64_t a2)
{
  sub_10000E948();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Expression();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v2, a1);
  uint64_t WitnessTable = swift_getWitnessTable();
  ExpressionType<>.init(value:)((uint64_t)v9, v10, WitnessTable, a2);
  v14[0] = v14[3];
  v14[1] = v14[4];
  v14[2] = v14[5];
  uint64_t v12 = ExpressionType.expression.getter(v10, WitnessTable);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t type metadata accessor for Expression()
{
  return sub_100010B5C();
}

uint64_t sub_10012EFCC(uint64_t a1, uint64_t a2)
{
  return sub_10012FF54(a1, a2, sub_10012E9EC);
}

uint64_t sub_10012EFE4()
{
  return sub_10012EA6C(*v0);
}

uint64_t sub_10012EFEC()
{
  return sub_10012EAE0(*v0);
}

uint64_t sub_10012EFF4()
{
  return sub_10012EB4C(*v0);
}

uint64_t ExpressionType.init(literal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t))(a4 + 40))(a1, a2, &_swiftEmptyArrayStorage, a3, a4);
}

Swift::String __swiftcall Expressible.asSQL()()
{
  (*(void (**)(void))(v0 + 8))();
  uint64_t v2 = v1;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  Swift::String_optional v5 = String.Iterator.next()();
  object = v5.value._object;
  uint64_t countAndFlagsBits = v5.value._countAndFlagsBits;
  if (!v5.value._object)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t countAndFlagsBits = 0;
    object = (void *)0xE000000000000000;
    goto LABEL_16;
  }
  uint64_t v6 = v5.value._countAndFlagsBits;
  uint64_t v7 = v5.value._object;
  unint64_t v8 = 0;
  while (1)
  {
    if (v6 != 63 || v7 != (void *)0xE100000000000000)
    {
      uint64_t countAndFlagsBits = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((countAndFlagsBits & 1) == 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = v7;
        goto LABEL_12;
      }
    }
    if ((v8 & 0x8000000000000000) != 0) {
      break;
    }
    if (v8 >= *(void *)(v2 + 16)) {
      goto LABEL_15;
    }
    uint64_t v6 = sub_100117D98(v2 + 32 + 40 * v8);
    uint64_t v11 = v10;
    ++v8;
LABEL_12:
    swift_bridgeObjectRetain();
    v12._uint64_t countAndFlagsBits = v6;
    v12._object = v11;
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Swift::String_optional v13 = String.Iterator.next()();
    object = v13.value._object;
    uint64_t countAndFlagsBits = v13.value._countAndFlagsBits;
    uint64_t v6 = v13.value._countAndFlagsBits;
    uint64_t v7 = v13.value._object;
    if (!v13.value._object) {
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  result._object = object;
  result._uint64_t countAndFlagsBits = countAndFlagsBits;
  return result;
}

uint64_t ExpressionType.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  uint64_t v12 = v11;
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(a3, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 40))(v10, v12, v13, a2, a4);
  sub_100115CD4();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);

  return v15(a1, a3);
}

uint64_t ExpressionType.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_100117940(34, (void *)0xE100000000000000, a1, a2);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t))(a4 + 40);

  return v9(v6, v8, _swiftEmptyArrayStorage, a3, a4);
}

uint64_t ExpressionType<>.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  v25[1] = a5;
  uint64_t v26 = a2;
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = type metadata accessor for Optional();
  sub_10000E948();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v25 - v12;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  sub_10000E948();
  v25[0] = v15;
  __chkstk_darwin(v16);
  unint64_t v18 = (char *)v25 - v17;
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10013EF20;
  int v20 = (uint64_t *)(v19 + 32);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v28 = a1;
  v21(v13, a1, v8);
  if (sub_10000D5D8((uint64_t)v13, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    *(void *)(v19 + 64) = 0;
    *(_OWORD *)int v20 = 0u;
    *(_OWORD *)(v19 + 48) = 0u;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 56))(AssociatedTypeWitness, a4);
    sub_100115CD4();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, AssociatedTypeWitness);
    *(void *)(v19 + 56) = v14;
    *(void *)(v19 + 64) = swift_getAssociatedConformanceWitness();
    int v23 = sub_1000274F4(v20);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25[0] + 32))(v23, v18, v14);
  }
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v27 + 40))(63, 0xE100000000000000, v19, v26);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v28, v8);
}

uint64_t sub_10012F654(uint64_t a1)
{
  return ExpressionType.expression.getter(a1, (uint64_t)&protocol witness table for Select<A>);
}

uint64_t ExpressionType.expression.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(a2 + 24))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  return v4;
}

uint64_t sub_10012F6D8(uint64_t a1, uint64_t a2)
{
  return sub_10012F6F0(a1, a2, (uint64_t (*)(void, void, void))sub_100124964);
}

uint64_t sub_10012F6F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void, void))
{
  return a3(*v3, v3[1], v3[2]);
}

uint64_t sub_10012F704(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return ExpressionType.expression.getter(a1, WitnessTable);
}

uint64_t ExpressionType.asc.getter()
{
  return sub_10012F778();
}

uint64_t ExpressionType.desc.getter()
{
  return sub_10012F778();
}

uint64_t sub_10012F778()
{
  sub_10012FFA0();
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
  *(void *)(inited + 56) = v3;
  *(void *)(inited + 64) = *(void *)(v2 + 8);
  sub_1000274F4((uint64_t *)(inited + 32));
  sub_100115CD4();
  (*(void (**)(void))(v6 + 16))();
  uint64_t v7 = sub_10000BF1C(&qword_100180D58);
  *(void *)(inited + 104) = &protocol witness table for Expression<A>;
  *(void *)(inited + 72) = v1;
  *(void *)(inited + 80) = v0;
  *(void *)(inited + 88) = _swiftEmptyArrayStorage;
  *(void *)(inited + 96) = v7;
  sub_10011750C(inited, v4);
  swift_setDeallocating();
  return sub_10006F144();
}

uint64_t sub_10012F868(uint64_t a1, unint64_t a2)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10013EF20;
  *(void *)(v4 + 56) = &type metadata for Blob;
  *(void *)(v4 + 64) = &protocol witness table for Blob;
  uint64_t v5 = v4;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        JUMPOUT(0x10012F9FCLL);
      }
      sub_10000DADC(a1, a2);
      uint64_t v9 = sub_1001364AC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a1, a2);
      break;
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(a1 + 24);
      sub_10000DADC(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v9 = sub_1001364AC(v10, v11, a2 & 0x3FFFFFFFFFFFFFFFLL, a1, a2);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v6 = 0;
      goto LABEL_7;
    default:
      uint64_t v6 = BYTE6(a2);
      uint64_t v7 = a2 & 0xFFFFFFFFFFFFLL;
      uint64_t v8 = a1;
LABEL_7:
      uint64_t v9 = sub_1001365A8(v8, v7, v6, a1, a2);
      break;
  }
  *(void *)(v5 + 32) = v9;
  sub_10000DA10(a1, a2);
  return 63;
}

uint64_t sub_10012FA0C(uint64_t a1)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10013EF20;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = &protocol witness table for String;
  *(void *)(v2 + 32) = UUID.uuidString.getter();
  *(void *)(v2 + 40) = v3;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return 63;
}

uint64_t ExpressionType<>.init(value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000BF1C(&qword_10017DEB8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10013EF20;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(a4 + 56);
  swift_getAssociatedTypeWitness();
  *(void *)(v8 + 56) = swift_getAssociatedTypeWitness();
  *(void *)(v8 + 64) = swift_getAssociatedConformanceWitness();
  sub_1000274F4((uint64_t *)(v8 + 32));
  uint64_t v10 = swift_checkMetadataState();
  v9(v10, a4);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(a3 + 40))(63, 0xE100000000000000, v8, a2, a3);
  sub_100115CD4();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);

  return v12(a1, v10);
}

uint64_t static ExpressionType<>.null.getter()
{
  sub_10012FFA0();
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v9 - v6;
  sub_10000D5B0((uint64_t)&v9 - v6, 1, 1, AssociatedTypeWitness);
  return ExpressionType<>.init(value:)((uint64_t)v7, v2, v1, v0, v3);
}

uint64_t sub_10012FD2C()
{
  uint64_t result = sub_100117940(34, (void *)0xE100000000000000, 0x4449574F52, 0xE500000000000000);
  rowid = result;
  *(void *)algn_100182478 = v1;
  qword_100182480 = (uint64_t)_swiftEmptyArrayStorage;
  return result;
}

uint64_t *rowid.unsafeMutableAddressor()
{
  if (qword_100180D40 != -1) {
    swift_once();
  }
  return &rowid;
}

uint64_t cast<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_10012FF6C();
  v11._uint64_t countAndFlagsBits = v8;
  v11._object = v7;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  sub_10012FFB8();
  v12._uint64_t countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(a7 + 40))(a5, a7);
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = 41;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRetain();
  return v15;
}

{
  void *v7;
  uint64_t v8;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  uint64_t v15;

  sub_10012FF6C();
  v11._uint64_t countAndFlagsBits = v8;
  v11._object = v7;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  sub_10012FFB8();
  v12._uint64_t countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))(a7 + 40))(a5, a7);
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = 41;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  type metadata accessor for Optional();
  swift_bridgeObjectRetain();
  return v15;
}

uint64_t sub_10012FF3C(uint64_t a1, uint64_t a2)
{
  return sub_10012FF54(a1, a2, sub_10012EBB4);
}

uint64_t sub_10012FF54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  return a3(*v3, v3[1]);
}

uint64_t sub_10012FF6C()
{
  return swift_bridgeObjectRetain();
}

void sub_10012FFB8()
{
  uint64_t v1 = 542327072;
  unint64_t v2 = 0xE400000000000000;
  String.append(_:)(*(Swift::String *)&v1);
}

void sub_10012FFD8(uint64_t a1, uint64_t a2)
{
  int v3 = a1;
  unint64_t v4 = HIDWORD(a1);
  if (a1 < 0 == (int)a1 < 0)
  {
    int v16 = HIDWORD(a1) - a1;
    if (__OFSUB__(HIDWORD(a1), a1)) {
      goto LABEL_31;
    }
    uint64_t v9 = v16;
    if (v16) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
  if ((int)a1 >= 0) {
    int v5 = a1;
  }
  else {
    int v5 = -(int)a1;
  }
  if (a1 >= 0) {
    int v6 = HIDWORD(a1);
  }
  else {
    int v6 = -HIDWORD(a1);
  }
  BOOL v7 = __CFADD__(v5, v6);
  uint64_t v8 = (v5 + v6);
  if (!v7)
  {
    if ((int)a1 < 0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = -v8;
    }
    if (v9)
    {
LABEL_13:
      sub_100057848();
      if ((v9 & 0x8000000000000000) == 0)
      {
        uint64_t v17 = (sqlite3_stmt **)(a2 + 16);
        swift_beginAccess();
        int v10 = v3;
        while (v9)
        {
          if (!sqlite3_column_name(*v17, v10)) {
            goto LABEL_32;
          }
          uint64_t v11 = String.init(cString:)();
          uint64_t v13 = v12;
          unint64_t v14 = _swiftEmptyArrayStorage[2];
          if (v14 >= _swiftEmptyArrayStorage[3] >> 1) {
            sub_100057848();
          }
          _swiftEmptyArrayStorage[2] = v14 + 1;
          uint64_t v15 = &_swiftEmptyArrayStorage[2 * v14];
          v15[4] = v11;
          v15[5] = v13;
          if ((int)v4 < v3) {
            goto LABEL_27;
          }
          if (v10 >= (int)v4) {
            goto LABEL_28;
          }
          ++v10;
          if (!--v9) {
            goto LABEL_22;
          }
        }
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
      }
      __break(1u);
      goto LABEL_30;
    }
LABEL_22:
    swift_release();
    return;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
}

Swift::OpaquePointer_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Statement.failableNext()()
{
  uint64_t v2 = *(void *)(v0 + 24);
  swift_retain();
  BOOL v4 = sub_10012A664(v2, v0);
  int v5 = 0;
  if (!v1 && v4)
  {
    int v6 = (sqlite3_stmt *)Statement.row.getter();
    int v5 = (void *)sub_1001327B8(v6, v7);
  }
  result.value._rawValue = v5;
  result.is_nil = v3;
  return result;
}

uint64_t sub_1001301DC()
{
  uint64_t result = (unint64_t)Statement.failableNext()();
  if (v1)
  {
    uint64_t result = sub_1001330A4();
    __break(1u);
  }
  return result;
}

uint64_t sub_10013021C()
{
  unint64_t v0 = (unint64_t)Statement.failableNext()();
  if (v1)
  {
    uint64_t result = sub_1001330A4();
    __break(1u);
  }
  else
  {
    if (v0) {
      swift_bridgeObjectRetain();
    }
    return sub_10000EBA4();
  }
  return result;
}

uint64_t FailableIterator.next()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t Statement.columnNames.getter()
{
  if (*(void *)(v0 + 48))
  {
    uint64_t v1 = *(void *)(v0 + 48);
LABEL_7:
    swift_bridgeObjectRetain();
    return v1;
  }
  uint64_t result = Statement.columnCount.getter();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (result > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((result & 0x80000000) == 0)
  {
    swift_retain();
    uint64_t v3 = sub_10000EBA4();
    sub_10012FFD8(v3, v4);
    uint64_t v1 = v5;
    *(void *)(v0 + 48) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t Statement.bind(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return swift_retain();
  }
  sub_100130CE8(1);
  swift_beginAccess();
  if (v2 == sqlite3_bind_parameter_count(*(sqlite3_stmt **)(v1 + 16)))
  {
    uint64_t v4 = 0;
    uint64_t v5 = a1 + 32;
    do
    {
      sub_100130D44(v5, ++v4);
      v5 += 40;
    }
    while (v2 != v4);
    return swift_retain();
  }
  _StringGuts.grow(_:)(29);
  sqlite3_bind_parameter_count(*(sqlite3_stmt **)(v1 + 16));
  dispatch thunk of CustomStringConvertible.description.getter();
  swift_bridgeObjectRelease();
  v7._object = (void *)0x8000000100146BD0;
  v7._uint64_t countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v7);
  v8._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._uint64_t countAndFlagsBits = 0x64657373617020;
  v9._object = (void *)0xE700000000000000;
  String.append(_:)(v9);
  uint64_t result = sub_1001330D0();
  __break(1u);
  return result;
}

{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  sqlite3_stmt *v17;
  uint64_t v18;
  int v19;
  uint64_t result;
  Swift::String v21;
  uint64_t v22;
  int64_t v23;
  long long v24;
  _OWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;

  sub_100130CE8(1);
  uint64_t v22 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  int v6 = -1;
  if (v5 < 64) {
    int v6 = ~(-1 << v5);
  }
  Swift::String v7 = v6 & *(void *)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  Swift::String v8 = 0;
  int v23 = (unint64_t)(v5 + 63) >> 6;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_4:
  Swift::String v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int v10 = v9 | (v8 << 6);
LABEL_5:
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = (void *)(*(void *)(a1 + 48) + 16 * v10);
  uint64_t v13 = v12[1];
  *(void *)&uint64_t v24 = *v12;
  *((void *)&v24 + 1) = v13;
  sub_1000FE754(v11 + 40 * v10, (uint64_t)v25);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1001329FC((uint64_t)&v24, (uint64_t)&v27, &qword_100181418);
    uint64_t v2 = v28;
    if (!v28)
    {
      swift_release();
      return swift_retain();
    }
    uint64_t v3 = v27;
    sub_1001329FC((uint64_t)&v29, (uint64_t)&v24, &qword_10017DEC0);
    uint64_t v17 = *(sqlite3_stmt **)(v1 + 16);
    unint64_t v18 = String.utf8CString.getter();
    uint64_t v19 = sqlite3_bind_parameter_index(v17, (const char *)(v18 + 32));
    swift_release();
    if (v19 < 1) {
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    sub_100130D44((uint64_t)&v24, v19);
    sub_100115734((uint64_t)&v24, &qword_10017DEC0);
    if (v7) {
      goto LABEL_4;
    }
LABEL_6:
    unint64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      break;
    }
    if (v14 < v23)
    {
      uint64_t v15 = *(void *)(v22 + 8 * v14);
      if (v15) {
        goto LABEL_9;
      }
      int v16 = v8 + 2;
      ++v8;
      if (v14 + 1 < v23)
      {
        uint64_t v15 = *(void *)(v22 + 8 * v16);
        if (v15) {
          goto LABEL_12;
        }
        Swift::String v8 = v14 + 1;
        if (v14 + 2 < v23)
        {
          uint64_t v15 = *(void *)(v22 + 8 * (v14 + 2));
          if (v15)
          {
            v14 += 2;
            goto LABEL_9;
          }
          int v16 = v14 + 3;
          Swift::String v8 = v14 + 2;
          if (v14 + 3 < v23)
          {
            uint64_t v15 = *(void *)(v22 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                unint64_t v14 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_30;
                }
                if (v14 >= v23)
                {
                  Swift::String v8 = v23 - 1;
                  goto LABEL_23;
                }
                uint64_t v15 = *(void *)(v22 + 8 * v14);
                ++v16;
                if (v15) {
                  goto LABEL_9;
                }
              }
            }
LABEL_12:
            unint64_t v14 = v16;
LABEL_9:
            Swift::String v7 = (v15 - 1) & v15;
            int v10 = __clz(__rbit64(v15)) + (v14 << 6);
            Swift::String v8 = v14;
            goto LABEL_5;
          }
        }
      }
    }
LABEL_23:
    Swift::String v7 = 0;
    uint64_t v26 = 0;
    memset(v25, 0, sizeof(v25));
    uint64_t v24 = 0u;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  _StringGuts.grow(_:)(23);
  swift_bridgeObjectRelease();
  v21._uint64_t countAndFlagsBits = v3;
  v21._object = v2;
  String.append(_:)(v21);
  uint64_t result = sub_1001330D0();
  __break(1u);
  return result;
}

uint64_t Statement.run(_:)(uint64_t a1)
{
  Statement.bind(_:)(a1);
  uint64_t v1 = Statement.run(_:)((uint64_t)_swiftEmptyArrayStorage);
  swift_release();
  return v1;
}

{
  uint64_t v1;

  Statement.bind(_:)(a1);
  uint64_t v1 = Statement.run(_:)((uint64_t)_swiftEmptyArrayStorage);
  swift_release();
  return v1;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  id v11;
  uint64_t v13;
  char v14;
  char v15;

  uint64_t v3 = v2;
  uint64_t v4 = v1;
  if (*(void *)(a1 + 16))
  {
    Statement.bind(_:)(a1);
    uint64_t v5 = Statement.run(_:)(_swiftEmptyArrayStorage);
    swift_release();
    if (!v2) {
      return v5;
    }
  }
  else
  {
    sub_100130CE8(0);
    sub_10010D428();
    int v6 = *(void *)(v1 + 24);
    swift_beginAccess();
    do
    {
      while (1)
      {
        Swift::String v7 = qword_100180D38;
        swift_retain();
        if (v7 != -1) {
          swift_once();
        }
        static OS_dispatch_queue.getSpecific<A>(key:)();
        Swift::String v8 = sub_10012B3A0();
        if ((v14 & 1) != 0 || v13 != v8) {
          break;
        }
        Swift::String v9 = sqlite3_step(*(sqlite3_stmt **)(v4 + 16));
        int v10 = sub_10012B2A0(v9, 0);
        swift_release();
        if (v3) {
          return v4;
        }
        if (v10 != 100) {
          goto LABEL_16;
        }
      }
      uint64_t v11 = *(id *)(v6 + 104);
      OS_dispatch_queue.sync<A>(execute:)();
      swift_release();

      if (v3) {
        return v4;
      }
    }
    while ((v15 & 1) != 0);
LABEL_16:
    swift_retain();
  }
  return v4;
}

uint64_t Statement.scalar(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return swift_release();
}

{
  Statement.bind(_:)(a1);
  Statement.scalar(_:)((uint64_t)_swiftEmptyArrayStorage, a2);
  return swift_release();
}

uint64_t sub_100130940(uint64_t a1)
{
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 40) = 1;
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 32) = 0;
  uint64_t v3 = (sqlite3 *)Connection.handle.getter();
  uint64_t v4 = String.utf8CString.getter();
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v5 = sqlite3_prepare_v2(v3, (const char *)(v4 + 32), -1, (sqlite3_stmt **)(v1 + 16), 0);
  swift_endAccess();
  swift_release();
  sub_10012B2A0(v5, 0);
  if (v2) {
    swift_release();
  }
  swift_release();
  return v1;
}

uint64_t Statement.deinit()
{
  sub_100133054();
  sqlite3_finalize(*(sqlite3_stmt **)(v0 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Statement.__deallocating_deinit()
{
  Statement.deinit();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t Statement.columnCount.getter()
{
  if (*(unsigned char *)(v0 + 40) != 1) {
    return *(void *)(v0 + 32);
  }
  sub_100133054();
  uint64_t result = sqlite3_column_count(*(sqlite3_stmt **)(v0 + 16));
  *(void *)(v0 + 32) = (int)result;
  *(unsigned char *)(v0 + 40) = 0;
  return result;
}

uint64_t Statement.columnCount.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  *(unsigned char *)(v1 + 40) = 0;
  return result;
}

void *(*Statement.columnCount.modify(uint64_t *a1))(void *result)
{
  a1[1] = v1;
  *a1 = Statement.columnCount.getter();
  return sub_100130B54;
}

void *sub_100130B54(void *result)
{
  uint64_t v1 = result[1];
  *(void *)(v1 + 32) = *result;
  *(unsigned char *)(v1 + 40) = 0;
  return result;
}

uint64_t Statement.columnNames.setter(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*Statement.columnNames.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = Statement.columnNames.getter();
  return sub_100130BBC;
}

uint64_t sub_100130BBC(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return Statement.columnNames.setter(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  Statement.columnNames.setter(v2);

  return swift_bridgeObjectRelease();
}

uint64_t Statement.row.getter()
{
  uint64_t v1 = v0[7];
  if (v1) {
    return v1;
  }
  uint64_t result = sub_100133054();
  uint64_t v1 = v0[2];
  if (v1)
  {
    swift_retain();
    uint64_t v3 = Statement.columnCount.getter();
    swift_release();
    v0[7] = v1;
    v0[8] = v3;
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t Statement.row.setter(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 56) = result;
  *(void *)(v2 + 64) = a2;
  return result;
}

void *(*Statement.row.modify(uint64_t *a1))(void *result)
{
  a1[2] = v1;
  *a1 = Statement.row.getter();
  a1[1] = v3;
  return sub_100130CD4;
}

void *sub_100130CD4(void *result)
{
  uint64_t v2 = result[1];
  uint64_t v1 = result[2];
  *(void *)(v1 + 56) = *result;
  *(void *)(v1 + 64) = v2;
  return result;
}

uint64_t sub_100130CE8(char a1)
{
  swift_beginAccess();
  uint64_t result = sqlite3_reset(*(sqlite3_stmt **)(v1 + 16));
  if (a1) {
    return sqlite3_clear_bindings(*(sqlite3_stmt **)(v1 + 16));
  }
  return result;
}

uint64_t sub_100130D44(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 24))
  {
    swift_beginAccess();
    if (a2 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (a2 <= 0x7FFFFFFF)
    {
      return sqlite3_bind_null(v2[2], a2);
    }
    __break(1u);
    goto LABEL_46;
  }
  sub_1000FE754(a1, (uint64_t)v15);
  if (v16)
  {
    sub_10000BF1C(&qword_10017DEC8);
    if (swift_dynamicCast())
    {
      uint64_t v3 = v13;
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF)
        {
          unint64_t v4 = *(void *)(v13 + 16);
          if (!(v4 >> 31))
          {
            uint64_t v2 = (sqlite3_stmt **)v2[2];
            if (qword_100180D30 == -1)
            {
LABEL_8:
              sqlite3_bind_blob((sqlite3_stmt *)v2, a2, (const void *)(v3 + 32), v4, (void (__cdecl *)(void *))qword_100182468);
              return swift_bridgeObjectRelease();
            }
LABEL_49:
            swift_once();
            goto LABEL_8;
          }
LABEL_48:
          __break(1u);
          goto LABEL_49;
        }
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
  }
  else
  {
    sub_100115734((uint64_t)v15, &qword_10017DEC0);
  }
  sub_1000FE754(a1, (uint64_t)v15);
  if (v16)
  {
    sub_10000BF1C(&qword_10017DEC8);
    if (swift_dynamicCast())
    {
      swift_beginAccess();
      if (a2 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (a2 <= 0x7FFFFFFF)
      {
        return sqlite3_bind_double(v2[2], a2, *(double *)&v13);
      }
      __break(1u);
      goto LABEL_52;
    }
  }
  else
  {
    sub_100115734((uint64_t)v15, &qword_10017DEC0);
  }
  sub_1000FE754(a1, (uint64_t)v15);
  if (v16)
  {
    sub_10000BF1C(&qword_10017DEC8);
    if (swift_dynamicCast())
    {
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF) {
          return sqlite3_bind_int64(v2[2], a2, v13);
        }
        goto LABEL_53;
      }
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
  }
  else
  {
    sub_100115734((uint64_t)v15, &qword_10017DEC0);
  }
  sub_1000FE754(a1, (uint64_t)v15);
  if (v16)
  {
    sub_10000BF1C(&qword_10017DEC8);
    if (swift_dynamicCast())
    {
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF)
        {
          uint64_t v2 = (sqlite3_stmt **)v2[2];
          if (qword_100180D30 == -1)
          {
LABEL_30:
            Swift::String v8 = (void (__cdecl *)(void *))qword_100182468;
            uint64_t v9 = String.utf8CString.getter();
            swift_bridgeObjectRelease();
            sqlite3_bind_text((sqlite3_stmt *)v2, a2, (const char *)(v9 + 32), -1, v8);
            return swift_release();
          }
LABEL_56:
          swift_once();
          goto LABEL_30;
        }
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
  }
  else
  {
    sub_100115734((uint64_t)v15, &qword_10017DEC0);
  }
  sub_1000FE754(a1, (uint64_t)v15);
  if (v16)
  {
    sub_10000BF1C(&qword_10017DEC8);
    if (swift_dynamicCast())
    {
      uint64_t v10 = v13;
LABEL_39:
      int v16 = &type metadata for Int64;
      uint64_t v17 = &protocol witness table for Int64;
      v15[0] = v10;
      sub_100130D44(v15, a2);
      uint64_t v11 = (long long *)v15;
      return sub_100115734((uint64_t)v11, &qword_10017DEC0);
    }
  }
  else
  {
    sub_100115734((uint64_t)v15, &qword_10017DEC0);
  }
  sub_1000FE754(a1, (uint64_t)v15);
  if (v16)
  {
    sub_10000BF1C(&qword_10017DEC8);
    if (swift_dynamicCast())
    {
      uint64_t v10 = v13;
      goto LABEL_39;
    }
  }
  else
  {
    sub_100115734((uint64_t)v15, &qword_10017DEC0);
  }
  sub_1000FE754(a1, (uint64_t)&v13);
  if (!v14)
  {
    uint64_t v11 = &v13;
    return sub_100115734((uint64_t)v11, &qword_10017DEC0);
  }
  sub_10000D698(&v13, (uint64_t)v15);
  *(void *)&long long v13 = 0;
  *((void *)&v13 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(33);
  v12._object = (void *)0x8000000100146CC0;
  v12._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  String.append(_:)(v12);
  sub_10000BF1C(&qword_10017DEC8);
  _print_unlocked<A, B>(_:_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Statement.step()()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_retain();
  return sub_10012A664(v1, v0);
}

void Statement.scalar(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 16))
  {
    Statement.bind(_:)(a1);
    Statement.scalar(_:)(_swiftEmptyArrayStorage);
    swift_release();
  }
  else
  {
    sub_100130CE8(0);
    uint64_t v6 = *(void *)(v2 + 24);
    swift_retain();
    sub_10012A664(v6, v2);
    if (!v4)
    {
      Swift::String v7 = (sqlite3_stmt *)Statement.row.getter();
      Cursor.subscript.getter(0, v7, a2);
    }
  }
}

void Cursor.subscript.getter(uint64_t iCol@<X0>, sqlite3_stmt *a2@<X1>, uint64_t a3@<X8>)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (iCol > 0x7FFFFFFF) {
    goto LABEL_13;
  }
  switch(sqlite3_column_type(a2, iCol))
  {
    case 1:
      sqlite3_int64 v6 = sqlite3_column_int64(a2, iCol);
      Swift::String v7 = (ValueMetadata *)&type metadata for Int64;
      Swift::String v8 = &protocol witness table for Int64;
      goto LABEL_9;
    case 2:
      double v11 = sqlite3_column_double(a2, iCol);
      *(void *)(a3 + 24) = &type metadata for Double;
      *(void *)(a3 + 32) = &protocol witness table for Double;
      *(double *)a3 = v11;
      return;
    case 3:
      if (!sqlite3_column_text(a2, iCol)) {
        goto LABEL_14;
      }
      uint64_t v9 = String.init(cString:)();
      *(void *)(a3 + 24) = &type metadata for String;
      *(void *)(a3 + 32) = &protocol witness table for String;
      *(void *)a3 = v9;
      *(void *)(a3 + 8) = v10;
      return;
    case 4:
      sqlite3_int64 v6 = Cursor.subscript.getter(iCol, a2);
      Swift::String v7 = &type metadata for Blob;
      Swift::String v8 = &protocol witness table for Blob;
LABEL_9:
      *(void *)(a3 + 24) = v7;
      *(void *)(a3 + 32) = v8;
      *(void *)a3 = v6;
      return;
    case 5:
      *(void *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return;
    default:
      break;
  }
LABEL_15:
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  v12._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  sub_1001330D0();
  __break(1u);
  JUMPOUT(0x100131720);
}

const char *sub_100131734@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  swift_beginAccess();
  uint64_t v5 = sqlite3_step(*(sqlite3_stmt **)(a1 + 16));
  uint64_t result = sub_10012B2A0(v5, 0);
  if (!v2) {
    *a2 = result == 100;
  }
  return result;
}

uint64_t Statement.makeIterator()()
{
  sub_100130CE8(0);

  return swift_retain();
}

uint64_t sub_1001317D8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  Statement.makeIterator()();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10013180C()
{
  return _s17AppIntents_SQLite9StatementC6handle33_E09230218008A0440B080F1AB3693645LLs13OpaquePointerVSgvpfi_0();
}

uint64_t sub_100131830()
{
  return sub_100131854();
}

uint64_t sub_100131854()
{
  uint64_t v0 = sub_100132630();
  swift_release();
  return v0;
}

uint64_t sub_10013188C()
{
  return sub_1001318B4();
}

uint64_t sub_1001318B8()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t Array.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for Optional();
  sub_100028430();
  uint64_t v26 = v9;
  uint64_t v27 = v8;
  __chkstk_darwin(v8);
  double v11 = (char *)&v26 - v10;
  sub_100028430();
  uint64_t v28 = v12;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v18 = (char *)&v26 - v17;
  uint64_t v31 = Array.init()();
  uint64_t v32 = a1;
  uint64_t v34 = v31;
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  uint64_t v20 = v33;
  uint64_t v33 = a3;
  v19(a3, a4);
  if (v20)
  {
    sub_100115CD4();
    (*(void (**)(void))(v23 + 8))();
    return swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v30 = v19;
    uint64_t v31 = a4;
    v29 = (void (**)(char *, char *, uint64_t))(v28 + 32);
    uint64_t v21 = (void (**)(char *, char *, uint64_t))(v28 + 16);
    uint64_t v22 = (void (**)(char *, uint64_t))(v28 + 8);
    while (sub_10000D5D8((uint64_t)v11, 1, a2) != 1)
    {
      (*v29)(v18, v11, a2);
      (*v21)(v15, v18, a2);
      type metadata accessor for Array();
      Array.append(_:)();
      (*v22)(v18, a2);
      v30(v33, v31);
    }
    sub_100115CD4();
    (*(void (**)(void))(v25 + 8))();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v27);
    return v34;
  }
}

unint64_t sub_100131B8C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = (unint64_t)Statement.failableNext()();
  if (!v3) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_100131BBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1001301DC();
  *a1 = result;
  return result;
}

uint64_t Statement.prepareRowIterator()()
{
  swift_retain();
  sub_100131C10();
  return v0;
}

void *sub_100131C10()
{
  uint64_t v0 = Statement.columnNames.getter();
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = 0;
    uint64_t v11 = *(void *)(v0 + 16);
    uint64_t v2 = (uint64_t *)(v0 + 40);
    do
    {
      uint64_t v3 = *(v2 - 1);
      uint64_t v4 = *v2;
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_10011E7B8(0, 0xE000000000000000, v3, v4, 34, (void *)0xE100000000000000);
      Swift::String v7 = v6;
      sub_1001330F0();
      v8._uint64_t countAndFlagsBits = v5;
      v8._object = v7;
      String.append(_:)(v8);
      swift_bridgeObjectRelease();
      sub_1001330F0();
      swift_bridgeObjectRelease();
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_100132128(v1, 0, 0xE000000000000000, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v2 += 2;
      ++v1;
    }
    while (v11 != v1);
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyDictionarySingleton;
}

const char *Statement.description.getter()
{
  sub_100133054();
  uint64_t result = sqlite3_sql(*(sqlite3_stmt **)(v0 + 16));
  if (result) {
    return (const char *)String.init(cString:)();
  }
  __break(1u);
  return result;
}

const char *sub_100131D90()
{
  return Statement.description.getter();
}

double Cursor.subscript.getter(uint64_t iCol, sqlite3_stmt *a2)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (iCol <= 0x7FFFFFFF)
  {
    return sqlite3_column_double(a2, iCol);
  }
  __break(1u);
  return result;
}

sqlite3_int64 Cursor.subscript.getter(sqlite3_int64 result, sqlite3_stmt *a2)
{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    return sub_1001330C4(a2, result);
  }
  __break(1u);
  return result;
}

uint64_t Cursor.subscript.getter(uint64_t iCol, sqlite3_stmt *a2)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (iCol > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  iCol = (uint64_t)sqlite3_column_text(a2, iCol);
  if (!iCol)
  {
LABEL_9:
    __break(1u);
    return iCol;
  }
  return String.init(cString:)();
}

{
  int v2;
  const void *v4;
  const void *v5;
  int64_t v6;
  uint64_t vars8;

  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v2 = iCol;
  if (iCol > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    return iCol;
  }
  uint64_t v4 = sqlite3_column_blob(a2, iCol);
  if (!v4) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v5 = v4;
  sqlite3_int64 v6 = sqlite3_column_bytes(a2, v2);

  return (uint64_t)_s17AppIntents_SQLite4BlobV5bytes6lengthACSV_SitcfC_0(v5, v6);
}

BOOL Cursor.subscript.getter(BOOL iCol, sqlite3_stmt *a2)
{
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (iCol <= 0x7FFFFFFF)
  {
    return sqlite3_column_int64(a2, iCol) != 0;
  }
  __break(1u);
  return iCol;
}

uint64_t Cursor.makeIterator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = a1;
  v5[4] = a2;
  sub_10000BF1C(&qword_100181420);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_100132A68;
  *(void *)(result + 24) = v5;
  return result;
}

void sub_100131FE4(uint64_t a1@<X0>, sqlite3_stmt *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  Swift::String v8 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  if (*(void *)(a1 + 16) >= a3)
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    *(_OWORD *)(a4 + 24) = xmmword_100142240;
  }
  else
  {
    swift_beginAccess();
    uint64_t v9 = *v8 + 1;
    if (__OFADD__(*v8, 1))
    {
      __break(1u);
    }
    else
    {
      *Swift::String v8 = v9;
      Cursor.subscript.getter(v9 - 1, a2, a4);
    }
  }
}

uint64_t sub_1001320A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Cursor.makeIterator()(*v1, v1[1]);
  *a1 = result;
  return result;
}

uint64_t sub_1001320CC()
{
  return _s17AppIntents_SQLite9StatementC6handle33_E09230218008A0440B080F1AB3693645LLs13OpaquePointerVSgvpfi_0();
}

uint64_t sub_1001320D4()
{
  return sub_100131888(*v0, v0[1]);
}

uint64_t sub_1001320DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1001318B0(a1, a2, a3, *v3, v3[1]);
}

unint64_t sub_1001320E4(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return sub_100132594(a1, v2);
}

#error "100132164: call analysis failed (funcsize=62)"

_OWORD *sub_100132224(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v7 = *v3;
  sub_1001320E4(a2);
  sub_10000E91C();
  if (v10)
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v8;
  char v12 = v9;
  sub_10000BF1C(&qword_100181348);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v7)) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_1001320E4(a2);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  if (v12)
  {
    sub_10000E788(*(void *)(*v4 + 56) + 32 * v11);
    sub_10000EBA4();
    sub_10000EB44();
    return sub_10000E7D8(v15, v16);
  }
  else
  {
    sub_10000EB44();
    return sub_1001324E4(v19, v20, v21, v22);
  }
}

#error "100132350: call analysis failed (funcsize=53)"

#error "100132428: call analysis failed (funcsize=53)"

_OWORD *sub_1001324E4(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_10000E7D8(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

unint64_t sub_10013254C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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

unint64_t sub_100132594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100132630()
{
  swift_retain();
  sub_100130CE8(0);
  uint64_t result = (unint64_t)Statement.failableNext()();
  if (v3)
  {
LABEL_20:
    swift_unexpectedError();
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    uint64_t v1 = 0;
    uint64_t v0 = _swiftEmptyArrayStorage;
    uint64_t v5 = &_swiftEmptyArrayStorage[4];
    while (v4)
    {
      if (!v1)
      {
        unint64_t v6 = v0[3];
        if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
        if (v7 <= 1) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = v7;
        }
        sub_10000BF1C(&qword_100181508);
        char v9 = (void *)swift_allocObject();
        uint64_t v10 = (uint64_t)(j__malloc_size(v9) - 32) / 8;
        v9[2] = v8;
        v9[3] = 2 * v10;
        unint64_t v11 = (unint64_t)(v9 + 4);
        unint64_t v12 = v0[3];
        unint64_t v13 = v12 >> 1;
        if (v0[2])
        {
          if (v9 != v0 || v11 >= (unint64_t)&v0[v13 + 4]) {
            memmove(v9 + 4, v0 + 4, 8 * v13);
          }
          v0[2] = 0;
        }
        uint64_t v5 = (uint64_t *)(v11 + 8 * v13);
        uint64_t v1 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - (v12 >> 1);
        uint64_t result = swift_release();
        uint64_t v0 = v9;
      }
      BOOL v15 = __OFSUB__(v1--, 1);
      if (v15)
      {
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      *v5++ = v4;
      uint64_t result = (unint64_t)Statement.failableNext()();
      uint64_t v4 = result;
      if (v16) {
        goto LABEL_20;
      }
    }
  }
  uint64_t result = swift_release();
  unint64_t v17 = v0[3];
  if (v17 < 2) {
    return (uint64_t)v0;
  }
  unint64_t v18 = v17 >> 1;
  BOOL v15 = __OFSUB__(v18, v1);
  unint64_t v19 = v18 - v1;
  if (!v15)
  {
    v0[2] = v19;
    return (uint64_t)v0;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1001327B8(sqlite3_stmt *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  uint64_t v5 = (uint64_t *)(v4 + 16);
  unint64_t v6 = (void *)swift_allocObject();
  v6[2] = v4;
  v6[3] = a1;
  v6[4] = a2;
  sub_10000BF1C(&qword_100181420);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = sub_100133048;
  *(void *)(inited + 24) = v6;
  swift_retain();
  swift_beginAccess();
  uint64_t v8 = *(void *)(v4 + 16);
  char v9 = _swiftEmptyArrayStorage;
  if (v8 < a2)
  {
    uint64_t v10 = 0;
    unint64_t v11 = &_swiftEmptyArrayStorage[4];
    while (1)
    {
      *uint64_t v5 = v8 + 1;
      Cursor.subscript.getter(v8, a1, (uint64_t)v26);
      uint64_t result = sub_1001329FC((uint64_t)v26, (uint64_t)v27, &qword_10017DEC0);
      if (!v10)
      {
        unint64_t v13 = v9[3];
        if ((uint64_t)((v13 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
        if (v14 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v14;
        }
        sub_10000BF1C(&qword_10017DEB8);
        uint64_t v16 = (void *)swift_allocObject();
        uint64_t v17 = (uint64_t)(j__malloc_size(v16) - 32) / 40;
        v16[2] = v15;
        v16[3] = 2 * v17;
        unint64_t v18 = (unint64_t)(v16 + 4);
        unint64_t v19 = v9[3];
        unint64_t v20 = v19 >> 1;
        if (v9[2])
        {
          if (v16 != v9 || v18 >= (unint64_t)&v9[5 * v20 + 4]) {
            memmove(v16 + 4, v9 + 4, 40 * v20);
          }
          v9[2] = 0;
        }
        unint64_t v11 = (void *)(v18 + 40 * v20);
        uint64_t v10 = (v17 & 0x7FFFFFFFFFFFFFFFLL) - (v19 >> 1);
        uint64_t result = swift_release();
        char v9 = v16;
      }
      BOOL v22 = __OFSUB__(v10--, 1);
      if (v22) {
        break;
      }
      sub_1001329FC((uint64_t)v27, (uint64_t)v11, &qword_10017DEC0);
      v11 += 5;
      uint64_t v8 = *v5;
      if (*v5 >= a2) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v10 = 0;
LABEL_21:
  swift_release();
  uint64_t result = swift_release();
  unint64_t v23 = v9[3];
  if (v23 < 2) {
    return (uint64_t)v9;
  }
  unint64_t v24 = v23 >> 1;
  BOOL v22 = __OFSUB__(v24, v10);
  unint64_t v25 = v24 - v10;
  if (!v22)
  {
    v9[2] = v25;
    return (uint64_t)v9;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1001329FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000BF1C(a3);
  sub_100115CD4();
  uint64_t v4 = sub_10000EBA4();
  v5(v4);
  return a2;
}

uint64_t sub_100132A58()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100132A68(uint64_t a1@<X8>)
{
  sub_100131FE4(*(void *)(v1 + 16), *(sqlite3_stmt **)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t sub_100132A78()
{
  unint64_t result = qword_100181428;
  if (!qword_100181428)
  {
    type metadata accessor for Statement();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100181428);
  }
  return result;
}

uint64_t type metadata accessor for Statement()
{
  return self;
}

unint64_t sub_100132AE8(uint64_t a1)
{
  unint64_t result = sub_100132A78();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100132B14()
{
  unint64_t result = qword_100181430;
  if (!qword_100181430)
  {
    sub_10000BFDC(&qword_100181438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100181430);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Cursor(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 1 || !*(unsigned char *)(a1 + 16))
    {
      if (*(void *)a1) {
        int v2 = -1;
      }
      else {
        int v2 = 0;
      }
    }
    else
    {
      int v2 = *(_DWORD *)a1 + 1;
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Cursor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)unint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Cursor()
{
  return &type metadata for Cursor;
}

uint64_t sub_100132BF0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  unint64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a4;
  v11[4] = a5;
  sub_10000BF1C(&qword_100181420);
  uint64_t result = swift_allocObject();
  uint64_t v13 = result;
  uint64_t v14 = 0;
  *(void *)(result + 16) = sub_100133048;
  *(void *)(result + 24) = v11;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v13;
    return v14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_100132A68((uint64_t)v15);
    if (v16 == 1)
    {
      uint64_t v14 = 0;
LABEL_9:
      sub_100115734((uint64_t)v15, &qword_100181500);
    }
    else
    {
      uint64_t v14 = 0;
      while (1)
      {
        sub_1001329FC((uint64_t)v15, (uint64_t)v17, &qword_10017DEC0);
        sub_1001329FC((uint64_t)v17, a2, &qword_10017DEC0);
        if (a3 - 1 == v14) {
          break;
        }
        a2 += 40;
        sub_100132A68((uint64_t)v15);
        ++v14;
        if (v16 == 1) {
          goto LABEL_9;
        }
      }
      uint64_t v14 = a3;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100132D50()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100132D88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_100130CE8(0);
  uint64_t v8 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v3;
    return v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unint64_t v9 = (unint64_t)Statement.failableNext()();
    if (v10)
    {
LABEL_9:
      swift_unexpectedError();
      __break(1u);
LABEL_10:
      uint64_t v8 = a3;
    }
    else
    {
      uint64_t v8 = 0;
      while (v9)
      {
        *(void *)(a2 + 8 * v8) = v9;
        if (a3 - 1 == v8) {
          goto LABEL_10;
        }
        unint64_t v9 = (unint64_t)Statement.failableNext()();
        ++v8;
        if (v11) {
          goto LABEL_9;
        }
      }
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100132E48(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    *uint64_t v5 = a4;
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
  uint64_t v11 = a2;
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_100133054()
{
  return swift_beginAccess();
}

uint64_t sub_100133074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  return sub_100021098(a2, a3, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1001330A4()
{
  return swift_unexpectedError();
}

sqlite3_int64 sub_1001330C4@<X0>(sqlite3_stmt *a1@<X1>, int a2@<W8>)
{
  return sqlite3_column_int64(a1, a2);
}

uint64_t sub_1001330D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1001330F0()
{
  return Character.write<A>(to:)();
}

uint64_t sub_100133114()
{
  return v0;
}

uint64_t sub_100133128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v19[4] = &protocol witness table for Expression<A>;
  v19[0] = a1;
  v19[1] = a2;
  v19[2] = a3;
  v19[3] = sub_10000BF1C(&qword_10017DED0);
  v18[3] = &type metadata for Int;
  v18[4] = &protocol witness table for Int;
  v18[0] = a4;
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
  sub_10000C0D4((uint64_t)v19, inited + 32);
  sub_10000C0D4((uint64_t)v18, inited + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10011750C(inited, v15);
  uint64_t v6 = v16;
  uint64_t v7 = v17;
  sub_10000BEA0(v15, v16);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  sub_10000E788((uint64_t)v15);
  uint64_t v13 = sub_100129148(v8, v10, v12, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_10006F144();
  sub_10000E788((uint64_t)v18);
  sub_10000E788((uint64_t)v19);
  return v13;
}

uint64_t Setter.expression.getter()
{
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
  sub_10000C0D4(v0, inited + 32);
  sub_10000C0D4(v0 + 40, inited + 72);
  sub_10011750C(inited, v6);
  uint64_t v2 = v7;
  uint64_t v3 = v8;
  sub_10000BEA0(v6, v7);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  sub_10000E788((uint64_t)v6);
  swift_setDeallocating();
  sub_10006F144();
  return v4;
}

uint64_t sub_1001333A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t result = type metadata accessor for Expression();
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = result;
  a7[8] = result;
  a7[9] = &protocol witness table for Expression<A>;
  a7[4] = &protocol witness table for Expression<A>;
  a7[5] = a4;
  a7[6] = a5;
  a7[7] = a6;
  return result;
}

uint64_t sub_100133418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  a7[3] = type metadata accessor for Expression();
  a7[4] = &protocol witness table for Expression<A>;
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  uint64_t v14 = *(void *)(a6 + 8);
  a7[8] = a5;
  a7[9] = v14;
  unint64_t v15 = sub_1000274F4(a7 + 5);
  uint64_t v16 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32);

  return v16(v15, a4, a5);
}

uint64_t sub_1001334D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  type metadata accessor for Optional();
  a7[3] = type metadata accessor for Expression();
  a7[4] = &protocol witness table for Expression<A>;
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  uint64_t result = type metadata accessor for Expression();
  a7[8] = result;
  a7[9] = &protocol witness table for Expression<A>;
  a7[5] = a4;
  a7[6] = a5;
  a7[7] = a6;
  return result;
}

uint64_t sub_100133574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  type metadata accessor for Optional();
  uint64_t result = type metadata accessor for Expression();
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = result;
  a7[8] = result;
  a7[9] = &protocol witness table for Expression<A>;
  a7[4] = &protocol witness table for Expression<A>;
  a7[5] = a4;
  a7[6] = a5;
  a7[7] = a6;
  return result;
}

uint64_t sub_1001335F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, void *a6@<X8>)
{
  uint64_t v18 = a5;
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v18 - v13;
  uint64_t v15 = type metadata accessor for Expression();
  a6[3] = v15;
  a6[4] = &protocol witness table for Expression<A>;
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a4, v11);
  uint64_t v20 = v15;
  uint64_t v21 = &protocol witness table for Expression<A>;
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  ExpressionType<>.init(value:)((uint64_t)v14, v15, WitnessTable, v18, (uint64_t)&v19);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a4, v11);
  return sub_10000D698(&v19, (uint64_t)(a6 + 5));
}

uint64_t <- infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_10013390C(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))sub_1001333A0);
}

{
  return sub_10013390C(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))sub_1001334D4);
}

{
  return sub_10013390C(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))sub_100133574);
}

uint64_t <- infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_100134F00();
  sub_100028430();
  double v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v16 + 16))(v15, v17, v18, v13);
  sub_100133418(v8, v7, v6, (uint64_t)v15, a5, a6, v9);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

{
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  sub_10013501C();
  type metadata accessor for Optional();
  sub_100028430();
  unint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - v10;
  (*(void (**)(char *, uint64_t, double))(v12 + 16))((char *)&v18 - v10, a4, v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  double v13 = sub_100134FE8();
  return sub_1001335F8(v13, v14, v15, (uint64_t)v11, a6, v16);
}

uint64_t sub_10013390C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(void))
{
  a9();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t += infix(_:_:)()
{
  return sub_100133AD0();
}

{
  return sub_100133B58();
}

{
  return sub_100133AD0();
}

{
  return sub_100133AD0();
}

{
  return sub_100133B58();
}

uint64_t sub_100133AD0()
{
  sub_100134FD4();
  v0();
  uint64_t v1 = sub_100134FFC();
  sub_100134F94(v1, (uint64_t)&protocol witness table for Expression<A>);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100133B58()
{
  sub_100134FD4();
  v0();
  uint64_t v1 = sub_100134FFC();
  sub_100134F94(v1, (uint64_t)&protocol witness table for Expression<A>);

  return swift_bridgeObjectRetain();
}

uint64_t += infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))+ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))+ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))+ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t += infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)+ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)+ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t sub_100133CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t), void (*a11)(uint64_t))
{
  sub_100134F00();
  a10(v11);
  uint64_t v12 = sub_100134ED0();
  a11(v12);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100133DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t))
{
  sub_100134F00();
  v9();
  uint64_t v10 = sub_100134ED0();
  a9(v10);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t -= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))- infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))- infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))- infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t -= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)- infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)- infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t *= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))* infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))* infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))* infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t *= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)* infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)* infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t /= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))/ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))/ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133CA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(uint64_t))/ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t /= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)/ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100133DC0(a1, a2, a3, a4, a5, a6, a7, (uint64_t)/ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t %= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))% infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))% infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))% infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t %= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)% infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)% infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t sub_100134354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(void), void (*a10)(uint64_t))
{
  sub_100134F00();
  a9();
  uint64_t v10 = sub_100134ED0();
  a10(v10);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100134444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t))
{
  sub_10013501C();
  v9();
  uint64_t v10 = sub_100134FE8();
  a8(v10);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t <<= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))<< infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))<< infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))<< infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t <<= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)<< infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)<< infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t >>= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))>> infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))>> infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))>> infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t >>= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)>> infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)>> infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t &= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))& infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))& infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))& infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t &= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)& infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)& infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t |= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))| infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))| infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))| infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t |= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)| infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)| infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t ^= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))^ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))^ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134354(a1, a2, a3, a4, a5, a6, a7, a8, (void (*)(void))^ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t ^= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)^ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

{
  return sub_100134444(a1, a2, a3, a4, a5, a6, (uint64_t)^ infix<A>(_:_:), (void (*)(uint64_t))<- infix<A>(_:_:));
}

uint64_t ++ postfix<A>(_:)()
{
  return sub_100134F64();
}

{
  return sub_100134F5C();
}

uint64_t -- postfix<A>(_:)()
{
  return sub_100134F64();
}

{
  return sub_100134F5C();
}

uint64_t sub_100134AE4()
{
  sub_100134F40();
  sub_10000BF1C(&qword_10017DED0);
  type metadata accessor for Expression();
  sub_100134C58();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = sub_100134F6C(WitnessTable, v4, v5, v6, v7, v8, v9, v10, v2);
  uint64_t v19 = sub_100134F14(v11, v12, v13, v14, v15, v16, v17, v18, v23, v1, v0, v24, v25, v26);
  return sub_100134FBC(v19, v20, v21, (uint64_t)&protocol witness table for Expression<A>);
}

uint64_t sub_100134B9C()
{
  sub_100134F40();
  sub_10000BF1C(&qword_10017DED0);
  type metadata accessor for Optional();
  type metadata accessor for Expression();
  sub_100134C58();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = sub_100134F6C(WitnessTable, v4, v5, v6, v7, v8, v9, v10, v2);
  uint64_t v19 = sub_100134F14(v11, v12, v13, v14, v15, v16, v17, v18, v23, v1, v0, v24, v25, v26);
  return sub_100134FBC(v19, v20, v21, (uint64_t)&protocol witness table for Expression<A>);
}

unint64_t sub_100134C58()
{
  unint64_t result = qword_100180450;
  if (!qword_100180450)
  {
    sub_10000BFDC(&qword_10017DED0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100180450);
  }
  return result;
}

uint64_t destroy for Setter(uint64_t a1)
{
  sub_10000E788(a1);

  return sub_10000E788(a1 + 40);
}

uint64_t initializeWithCopy for Setter(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for Setter(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

void *initializeWithTake for Setter(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for Setter(uint64_t a1, uint64_t a2)
{
  sub_10000E788(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_10000E788(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for Setter(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
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

uint64_t storeEnumTagSinglePayload for Setter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Setter()
{
  return &type metadata for Setter;
}

uint64_t sub_100134ED0()
{
  return v0;
}

uint64_t sub_100134F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return sub_100133128(a12, a13, a14, 1);
}

uint64_t sub_100134F5C()
{
  return sub_100134B9C();
}

uint64_t sub_100134F64()
{
  return sub_100134AE4();
}

uint64_t sub_100134F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return ExpressionType.init<A>(_:)((uint64_t)&a9, v9, v10, v11, a1);
}

uint64_t sub_100134F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *long long v5 = v4;
  v5[1] = v3;
  v5[2] = v2;
  v5[3] = a1;
  v5[8] = a1;
  v5[9] = a2;
  v5[4] = a2;
  v5[5] = v6;
  v5[6] = v7;
  v5[7] = v8;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100134FBC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *uint64_t v4 = v6;
  v4[1] = v7;
  v4[2] = v8;
  v4[3] = v5;
  v4[8] = v5;
  v4[9] = a4;
  v4[4] = a4;
  v4[5] = result;
  v4[6] = a2;
  v4[7] = a3;
  return result;
}

uint64_t sub_100134FE8()
{
  return v0;
}

uint64_t sub_100134FFC()
{
  return sub_10000BF1C(v0);
}

uint64_t static DateFunctions.date(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100135794(a1, a2, a3, 1702125924);
}

uint64_t sub_10013503C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a5 + 16);
  if (v8)
  {
    sub_100135464((void *)0x3F, 0xE100000000000000, v8);
    sub_10000BF1C(&qword_10017DED8);
    sub_100115AC0();
    uint64_t v9 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v12._uint64_t countAndFlagsBits = 539770664;
    v12._object = (void *)0xE400000000000000;
    String.append(_:)(v12);
    v13._uint64_t countAndFlagsBits = v9;
    v13._object = v11;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    v14._uint64_t countAndFlagsBits = 41;
    v14._object = (void *)0xE100000000000000;
    String.append(_:)(v14);
    uint64_t v15 = a1;
    sub_10000BF1C((uint64_t *)&unk_10017E690);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10013EF20;
    *(void *)(inited + 32) = a3;
    *(void *)(inited + 40) = a4;
    uint64_t v20 = inited;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100054398();
    sub_100053EA8(v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    v17._uint64_t countAndFlagsBits = 2703144;
    v17._object = (void *)0xE300000000000000;
    String.append(_:)(v17);
    uint64_t v15 = a1;
    sub_10000BF1C(&qword_10017DEB8);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_10013EF20;
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 64) = &protocol witness table for String;
    *(void *)(v18 + 32) = a3;
    *(void *)(v18 + 40) = a4;
    swift_bridgeObjectRetain();
  }
  return v15;
}

uint64_t static DateFunctions.time(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100135794(a1, a2, a3, 1701669236);
}

uint64_t static DateFunctions.datetime(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10013524C(a1, a2, a3, 0x656D697465746164, 0xE800000000000000);
}

uint64_t static DateFunctions.julianday(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10013524C(a1, a2, a3, 0x61646E61696C756ALL, 0xE900000000000079);
}

uint64_t sub_10013524C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10013503C(a4, a5, a1, a2, a3);
}

uint64_t static DateFunctions.strftime(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a5 + 16);
  if (v9)
  {
    sub_100135464((void *)0x3F, 0xE100000000000000, v9);
    sub_10000BF1C(&qword_10017DED8);
    sub_100115AC0();
    uint64_t v10 = BidirectionalCollection<>.joined(separator:)();
    Swift::String v12 = v11;
    swift_bridgeObjectRelease();
    _StringGuts.grow(_:)(18);
    swift_bridgeObjectRelease();
    v13._uint64_t countAndFlagsBits = v10;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    v14._uint64_t countAndFlagsBits = 41;
    v14._object = (void *)0xE100000000000000;
    String.append(_:)(v14);
    sub_10000BF1C((uint64_t *)&unk_10017E690);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    *(void *)(inited + 48) = a3;
    *(void *)(inited + 56) = a4;
    uint64_t v18 = inited;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100054398();
    sub_100053EA8(v18);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10000BF1C(&qword_10017DEB8);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_10013F1D0;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = &protocol witness table for String;
    *(void *)(v16 + 32) = a1;
    *(void *)(v16 + 40) = a2;
    *(void *)(v16 + 96) = &type metadata for String;
    *(void *)(v16 + 104) = &protocol witness table for String;
    *(void *)(v16 + 72) = a3;
    *(void *)(v16 + 80) = a4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return 0x656D697466727473;
}

void *sub_100135464(void *result, uint64_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    if (a3)
    {
      uint64_t v5 = result;
      uint64_t v6 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      uint64_t v7 = v6;
      v6[2] = a3;
      v6[4] = v5;
      v6[5] = a2;
      if (a3 != 1)
      {
        v6[6] = v5;
        v6[7] = a2;
        uint64_t v8 = a3 - 2;
        if (v8)
        {
          uint64_t v9 = v6 + 9;
          do
          {
            *(v9 - 1) = v5;
            void *v9 = a2;
            swift_bridgeObjectRetain();
            v9 += 2;
            --v8;
          }
          while (v8);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return _swiftEmptyArrayStorage;
    }
    return v7;
  }
  return result;
}

uint64_t DateFunctions.deinit()
{
  return v0;
}

uint64_t Date.date.getter()
{
  return sub_10013578C(1702125924);
}

uint64_t type metadata accessor for DateFunctions()
{
  return self;
}

uint64_t Date.time.getter()
{
  return sub_10013578C(1701669236);
}

uint64_t Date.datetime.getter()
{
  return sub_10013558C(0x656D697465746164, 0xE800000000000000);
}

uint64_t Date.julianday.getter()
{
  return sub_10013558C(0x61646E61696C756ALL, 0xE900000000000079);
}

uint64_t sub_10013558C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for DateFunctions();
  if (qword_100180D48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = dateFormatter.super.super.isa;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v6 = [(objc_class *)v4 stringFromDate:isa];

  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  uint64_t v10 = sub_10013503C(a1, a2, v7, v9, (uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t Expression<A>.date.getter(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_100135780(a1, a2, a3, 1702125924);
}

uint64_t Expression<A>.time.getter(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_100135780(a1, a2, a3, 1701669236);
}

uint64_t Expression<A>.datetime.getter(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1001356FC(a1, a2, a3, 0x656D697465746164);
}

uint64_t Expression<A>.julianday.getter(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1001356FC(a1, a2, a3, 0x61646E61696C756ALL);
}

uint64_t sub_1001356FC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  v6._uint64_t countAndFlagsBits = a1;
  v6._object = a2;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._uint64_t countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  swift_bridgeObjectRetain();
  return a4;
}

uint64_t sub_100135780(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1001356FC(a1, a2, a3, a4 & 0xFFFF0000FFFFFFFFLL | 0x2800000000);
}

uint64_t sub_10013578C(uint64_t a1)
{
  return sub_10013558C(a1, 0xE400000000000000);
}

uint64_t sub_100135794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10013524C(a1, a2, a3, a4, 0xE400000000000000);
}

uint64_t Backup.__allocating_init(sourceConnection:sourceName:targetConnection:targetName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  Backup.init(sourceConnection:sourceName:targetConnection:targetName:)(a1, a2, a3, a4);
  return v8;
}

sqlite3_backup *Backup.pageCount.getter()
{
  unint64_t result = *(sqlite3_backup **)(v0 + 32);
  if (result) {
    return (sqlite3_backup *)sqlite3_backup_pagecount(result);
  }
  return result;
}

sqlite3_backup *Backup.remainingPages.getter()
{
  unint64_t result = *(sqlite3_backup **)(v0 + 32);
  if (result) {
    return (sqlite3_backup *)sqlite3_backup_remaining(result);
  }
  return result;
}

void *Backup.init(sourceConnection:sourceName:targetConnection:targetName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v4[3] = a1;
  v4[4] = 0;
  v4[2] = a4;
  pDest = (sqlite3 *)Connection.handle.getter();
  Swift::String v6 = (sqlite3 *)Connection.handle.getter();
  uint64_t v7 = String.utf8CString.getter();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v8 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v9 = sqlite3_backup_init(pDest, (const char *)(v7 + 32), v6, (const char *)(v8 + 32));
  swift_release();
  swift_release();
  v5[4] = v9;
  if (v9
    || (uint64_t v10 = (sqlite3 *)Connection.handle.getter(),
        int v11 = sqlite3_errcode(v10),
        swift_retain(),
        Swift::String v12 = sub_100139C00(v11),
        !v13))
  {
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v16 = (uint64_t)v12;
    uint64_t v17 = v13;
    int v18 = v14;
    uint64_t v19 = v15;
    swift_release();
    sub_100047E58();
    swift_allocError();
    *(void *)uint64_t v20 = v16;
    *(void *)(v20 + 8) = v17;
    *(_DWORD *)(v20 + 16) = v18;
    *(void *)(v20 + 24) = v19;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_willThrow();
    swift_release();
    swift_release();
    sub_100135A5C(v16, v17);
  }
  return v5;
}

uint64_t sub_100135A5C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void Backup.step(pagesToCopy:)(uint64_t a1)
{
  if ((a1 & (unint64_t)&_mh_execute_header) != 0) {
    int v2 = -1;
  }
  else {
    int v2 = a1;
  }
  int v3 = sqlite3_backup_step(*(sqlite3_backup **)(v1 + 32), v2);
  if (v3 == 101)
  {
    Backup.finish()();
  }
  else
  {
    int v4 = v3;
    swift_retain();
    uint64_t v5 = sub_100139C00(v4);
    if (v6)
    {
      uint64_t v9 = v5;
      uint64_t v10 = v6;
      int v11 = v7;
      uint64_t v12 = v8;
      sub_100047E58();
      swift_allocError();
      *(void *)uint64_t v13 = v9;
      *(void *)(v13 + 8) = v10;
      *(_DWORD *)(v13 + 16) = v11;
      *(void *)(v13 + 24) = v12;
      swift_willThrow();
    }
  }
}

Swift::Void __swiftcall Backup.finish()()
{
  uint64_t v1 = *(sqlite3_backup **)(v0 + 32);
  if (v1)
  {
    sqlite3_backup_finish(v1);
    *(void *)(v0 + 32) = 0;
  }
}

uint64_t Backup.deinit()
{
  Backup.finish()();
  swift_release();
  swift_release();
  return v0;
}

uint64_t Backup.__deallocating_deinit()
{
  Backup.deinit();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for Backup()
{
  return self;
}

ValueMetadata *type metadata accessor for Backup.DatabaseName()
{
  return &type metadata for Backup.DatabaseName;
}

ValueMetadata *type metadata accessor for Backup.Pages()
{
  return &type metadata for Backup.Pages;
}

NSDateFormatter *dateFormatter.unsafeMutableAddressor()
{
  if (qword_100180D48 != -1) {
    swift_once();
  }
  return &dateFormatter;
}

uint64_t static Data.fromDatatypeValue(_:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();

  return sub_1000E5E7C(v0);
}

void *Data.datatypeValue.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        JUMPOUT(0x100135DDCLL);
      }
      sub_10000DADC(a1, a2);
      uint64_t v6 = sub_1001364AC((int)v3, v3 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, v3, a2);
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      sub_10000DADC(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v6 = sub_1001364AC(v7, v8, a2 & 0x3FFFFFFFFFFFFFFFLL, v3, a2);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      a1 = 0;
      uint64_t v5 = 0;
      uint64_t v4 = 0;
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      uint64_t v5 = a2 & 0xFFFFFFFFFFFFLL;
LABEL_7:
      uint64_t v6 = sub_1001365A8(a1, v5, v4, v3, a2);
      break;
  }
  return v6;
}

uint64_t sub_100135DEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Data.fromDatatypeValue(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_100135E18@<X0>(void *a1@<X8>)
{
  uint64_t result = Data.datatypeValue.getter(*(void *)v1, *(void *)(v1 + 8));
  *a1 = result;
  return result;
}

uint64_t static Date.fromDatatypeValue(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_10001B450();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_10000BF1C(&qword_10017F840);
  __chkstk_darwin(v7 - 8);
  sub_10001B450();
  uint64_t v10 = v9 - v8;
  if (qword_100180D48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  int v11 = dateFormatter.super.super.isa;
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [(objc_class *)v11 dateFromString:v12];

  if (v13)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    int v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
    v14(v10, v6, v2);
    sub_10000D5B0(v10, 0, 1, v2);
    uint64_t result = sub_10000D5D8(v10, 1, v2);
    if (result != 1) {
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v14)(a1, v10, v2);
    }
  }
  else
  {
    uint64_t result = sub_10000D5B0(v10, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t Date.datatypeValue.getter()
{
  if (qword_100180D48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = dateFormatter.super.super.isa;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v2 = [(objc_class *)v0 stringFromDate:isa];

  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v3;
}

uint64_t sub_10013612C@<X0>(uint64_t a1@<X8>)
{
  return static Date.fromDatatypeValue(_:)(a1);
}

uint64_t sub_100136138@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Date.datatypeValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

objc_class *sub_100136160()
{
  uint64_t result = (objc_class *)sub_100136180();
  dateFormatter.super.super.Class isa = result;
  return result;
}

id sub_100136180()
{
  uint64_t v0 = sub_10000BF1C(&qword_100181720);
  __chkstk_darwin(v0 - 8);
  id v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Locale();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)NSDateFormatter) init];
  sub_100136718(0xD000000000000019, 0x8000000100146D70, v7);
  Locale.init(identifier:)();
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  [v7 setLocale:isa];

  TimeZone.init(secondsFromGMT:)();
  uint64_t v9 = type metadata accessor for TimeZone();
  Class v10 = 0;
  if (sub_10000D5D8((uint64_t)v2, 1, v9) != 1)
  {
    Class v10 = TimeZone._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v2, v9);
  }
  [v7 setTimeZone:v10];

  return v7;
}

uint64_t static UUID.fromDatatypeValue(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000BF1C(&qword_10017C788);
  __chkstk_darwin(v2 - 8);
  sub_10001B450();
  uint64_t v5 = v4 - v3;
  UUID.init(uuidString:)();
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t result = sub_10000D5D8(v5, 1, v6);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, v5, v6);
  }
  __break(1u);
  return result;
}

uint64_t sub_100136478@<X0>(uint64_t a1@<X8>)
{
  return static UUID.fromDatatypeValue(_:)(a1);
}

uint64_t sub_100136484@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UUID.datatypeValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_1001364AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v8 = __DataStorage._bytes.getter();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = __DataStorage._offset.getter();
    if (__OFSUB__(a1, v10))
    {
      __break(1u);
LABEL_13:
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      JUMPOUT(0x100136598);
    }
    int v11 = (const void *)(v9 + a1 - v10);
  }
  else
  {
    int v11 = 0;
  }
  __DataStorage._length.getter();
  if (!v11) {
    goto LABEL_15;
  }
  int64_t v12 = 0;
  switch(a5 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a4), a4)) {
        goto LABEL_13;
      }
      int64_t v12 = HIDWORD(a4) - (int)a4;
LABEL_11:
      uint64_t v15 = _s17AppIntents_SQLite4BlobV5bytes6lengthACSV_SitcfC_0(v11, v12);
      sub_10000DA10(a4, a5);
      return v15;
    case 2uLL:
      uint64_t v14 = *(void *)(a4 + 16);
      uint64_t v13 = *(void *)(a4 + 24);
      int64_t v12 = v13 - v14;
      if (!__OFSUB__(v13, v14)) {
        goto LABEL_11;
      }
      goto LABEL_14;
    case 3uLL:
      goto LABEL_11;
    default:
      int64_t v12 = BYTE6(a5);
      goto LABEL_11;
  }
}

void *sub_1001365A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v12 = a1;
  __int16 v13 = a2;
  char v14 = BYTE2(a2);
  char v15 = BYTE3(a2);
  char v16 = BYTE4(a2);
  char v17 = BYTE5(a2);
  int64_t v7 = 0;
  switch(a5 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a4), a4))
      {
        __break(1u);
LABEL_8:
        __break(1u);
      }
      int64_t v7 = HIDWORD(a4) - (int)a4;
LABEL_6:
      uint64_t v10 = _s17AppIntents_SQLite4BlobV5bytes6lengthACSV_SitcfC_0(&v12, v7);
      sub_10000DA10(a4, a5);
      return v10;
    case 2uLL:
      uint64_t v9 = *(void *)(a4 + 16);
      uint64_t v8 = *(void *)(a4 + 24);
      int64_t v7 = v8 - v9;
      if (!__OFSUB__(v8, v9)) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_6;
    default:
      int64_t v7 = BYTE6(a5);
      goto LABEL_6;
  }
}

_UNKNOWN **sub_100136700()
{
  return &protocol witness table for Blob;
}

_UNKNOWN **sub_10013670C()
{
  return &protocol witness table for String;
}

void sub_100136718(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a3 setDateFormat:v4];
}

uint64_t QueryError.description.getter(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
      sub_100136C68();
      _StringGuts.grow(_:)(33);
      int v26 = swift_bridgeObjectRelease();
      sub_100136C40(v26, v27, v28, v29, v30, v31, v32, v33, v37, v39);
      v34._uint64_t countAndFlagsBits = 0x6C6F63206E692060;
      v34._object = (void *)0xED000020736E6D75;
      String.append(_:)(v34);
      v35._uint64_t countAndFlagsBits = Array.description.getter();
      String.append(_:)(v35);
      swift_bridgeObjectRelease();
      return v38;
    case 2:
      sub_100136C68();
      _StringGuts.grow(_:)(47);
      int v8 = swift_bridgeObjectRelease();
      sub_100136C40(v8, v9, v10, v11, v12, v13, v14, v15, v37, v39);
      v16._uint64_t countAndFlagsBits = 0xD000000000000018;
      v16._object = (void *)0x8000000100146DE0;
      String.append(_:)(v16);
      v17._uint64_t countAndFlagsBits = Array.description.getter();
      String.append(_:)(v17);
      swift_bridgeObjectRelease();
      uint64_t v6 = 41;
      goto LABEL_5;
    case 3:
      sub_100136C68();
      _StringGuts.grow(_:)(37);
      int v18 = swift_bridgeObjectRelease();
      sub_100136C40(v18, v19, v20, v21, v22, v23, v24, v25, v37, v39);
      uint64_t v6 = 96;
LABEL_5:
      unint64_t v7 = 0xE100000000000000;
      goto LABEL_6;
    default:
      sub_100136C68();
      _StringGuts.grow(_:)(17);
      swift_bridgeObjectRelease();
      uint64_t v38 = 0x2068637573206F4ELL;
      uint64_t v6 = a1;
      unint64_t v7 = a2;
LABEL_6:
      String.append(_:)(*(Swift::String *)&v6);
      return v38;
  }
}

uint64_t sub_100136968()
{
  return QueryError.description.getter(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_100136978(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result = a2;
  if (a4 - 1 < 2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  if (!a4 || a4 == 3)
  {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for QueryError(uint64_t a1)
{
  return sub_1001369F8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_1001369F8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result = a2;
  if (a4 - 1 < 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  if (!a4 || a4 == 3)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for QueryError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_100136978(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for QueryError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_100136978(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_1001369F8(v7, v8, v9, v10);
  return a1;
}

__n128 initializeWithTake for QueryError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for QueryError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_1001369F8(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 3) {
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

uint64_t storeEnumTagSinglePayload for QueryError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100136C20(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_100136C28(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for QueryError()
{
  return &type metadata for QueryError;
}

void sub_100136C40(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13 = v11;
  uint64_t v14 = v10;
  String.append(_:)(*(Swift::String *)&v13);
}

uint64_t sub_100136C78(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v35 = a5;
  uint64_t v36 = a8;
  v42 = a1;
  uint64_t v43 = a2;
  uint64_t v34 = *(void *)(a5 - 8);
  __chkstk_darwin(a1);
  v44 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v38 = (char *)&v30 - v11;
  __chkstk_darwin(v12);
  uint64_t v39 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v37 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  int v33 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  int v18 = (char *)&v30 - v17;
  uint64_t v19 = dispatch thunk of Collection.count.getter();
  if (!v19) {
    return static Array._allocateUninitialized(_:)();
  }
  Swift::Int v20 = v19;
  uint64_t v31 = v14;
  uint64_t v48 = ContiguousArray.init()();
  uint64_t v40 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v20);
  int v32 = v18;
  uint64_t result = dispatch thunk of Collection.startIndex.getter();
  if (v20 < 0)
  {
    __break(1u);
  }
  else
  {
    int v22 = (void (**)(char *))(v45 + 16);
    v41 = (void (**)(char *, uint64_t))(v45 + 8);
    uint64_t v45 = a6;
    int v23 = v38;
    int v24 = v32;
    while (1)
    {
      int v25 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      (*v22)(v23);
      v25(v47, 0);
      uint64_t v26 = v46;
      v42(v23, v44);
      if (v26) {
        break;
      }
      uint64_t v46 = 0;
      (*v41)(v23, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      if (!--v20)
      {
        uint64_t v27 = v37;
        int v28 = v33;
        uint64_t v29 = v31;
        (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v33, v24, v31);
        _expectEnd<A>(of:is:)();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
        return v48;
      }
    }
    (*v41)(v23, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v34 + 32))(v36, v44, v35);
  }
  return result;
}

uint64_t sub_1001370E4(void *a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  v3._uint64_t countAndFlagsBits = 40;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  sub_10000BEA0(a1, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v7 = v6(v4, v5);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = 41;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  v6(v4, v5);
  swift_bridgeObjectRelease();
  return a2;
}

unint64_t sub_1001371E0(char a1)
{
  unint64_t result = 7561825;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x646E756F72;
      break;
    case 2:
      unint64_t result = 0x6D6F646E6172;
      break;
    case 3:
      unint64_t result = 0x6C626D6F646E6172;
      break;
    case 4:
      unint64_t result = 0x626F6C626F72657ALL;
      break;
    case 5:
      unint64_t result = 0x6874676E656CLL;
      break;
    case 6:
      uint64_t v3 = 1702326124;
      goto LABEL_9;
    case 7:
      uint64_t v3 = 1701867637;
LABEL_9:
      unint64_t result = v3 & 0xFFFF0000FFFFFFFFLL | 0x7200000000;
      break;
    case 8:
      unint64_t result = 0x6D6972746CLL;
      break;
    case 9:
      unint64_t result = 0x6D69727472;
      break;
    case 10:
      unint64_t result = 1835627124;
      break;
    case 11:
      unint64_t result = 0x6563616C706572;
      break;
    case 12:
      unint64_t result = 0x727473627573;
      break;
    case 13:
      unint64_t result = 1162561868;
      break;
    case 14:
      unint64_t result = 20041;
      break;
    case 15:
      unint64_t result = 1112493127;
      break;
    case 16:
      unint64_t result = 0x484354414DLL;
      break;
    case 17:
      unint64_t result = 0x505845474552;
      break;
    case 18:
      unint64_t result = 0x4554414C4C4F43;
      break;
    case 19:
      unint64_t result = 0x6C6C756E6669;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1001373E0(void *a1, char a2)
{
  unint64_t v3 = sub_1001371E0(a2);
  uint64_t v4 = sub_1001179F8(a1, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100137450(uint64_t a1, char a2)
{
  unint64_t v3 = sub_1001371E0(a2);
  sub_10011750C(a1, v6);
  uint64_t v4 = sub_1001179F8(v6, v3);
  swift_bridgeObjectRelease();
  sub_10000E788((uint64_t)v6);
  return v4;
}

uint64_t ExpressionType<>.absoluteValue.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100139A88(a1, a2, a3, a4, a5, a6, a7, a8, v10, v11[0], v11[1], v11[2], v11[3], v11[4]);
  sub_100115CD4();
  sub_100115E8C();
  v8();
  swift_getAssociatedTypeWitness();
  sub_1001373E0(v11, 0);
  sub_10000E788((uint64_t)v11);
  return sub_100129380();
}

uint64_t ExpressionType<>.round(_:)(unint64_t a1, char a2)
{
  sub_10000BF1C(&qword_10017D698);
  if (a2)
  {
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_100139AC8(inited, (__n128)xmmword_10013EF20);
    sub_100115E8C();
    v6();
  }
  else
  {
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_100139AC8(inited, (__n128)xmmword_10013F1D0);
    sub_100115E8C();
    v5();
    inited[6].n128_u64[0] = (unint64_t)&type metadata for Int;
    inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Int;
    inited[4].n128_u64[1] = a1;
  }
  sub_100129540((uint64_t)inited, v13);
  uint64_t v7 = v13[4];
  sub_10000BEA0(v13, v13[3]);
  sub_1001397B4();
  sub_100118150(v8, v9, v10, v11, v7);
  sub_10000E788((uint64_t)v13);
  swift_setDeallocating();
  sub_10006F144();
  return sub_1000A889C();
}

uint64_t ExpressionType<>.round(_:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    sub_1001397B4();
    sub_100118150(v14, v15, v16, v17, v18);
    sub_1001399CC();
  }
  else
  {
    sub_10000BF1C(&qword_10017D698);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
    *(void *)(inited + 56) = a3;
    *(void *)(inited + 64) = *(void *)(a4 + 8);
    sub_1000274F4((uint64_t *)(inited + 32));
    sub_100115CD4();
    sub_100115E8C();
    v8();
    *(void *)(inited + 96) = &type metadata for Int;
    *(void *)(inited + 104) = &protocol witness table for Int;
    *(void *)(inited + 72) = a1;
    sub_100129540(inited, v20);
    uint64_t v9 = v20[4];
    sub_10000BEA0(v20, v20[3]);
    sub_1001397B4();
    sub_100118150(v10, v11, v12, v13, v9);
    sub_1001399CC();
    sub_10000E788((uint64_t)v20);
    swift_setDeallocating();
    sub_10006F144();
  }
  return sub_100139888();
}

uint64_t static ExpressionType<>.random()()
{
  swift_getAssociatedTypeWitness();

  return sub_100137450((uint64_t)_swiftEmptyArrayStorage, 2);
}

uint64_t static ExpressionType<>.random(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100137870(a1, a2, a3, 0x6C626D6F646E6172);
}

uint64_t static ExpressionType<>.allZeros(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100137870(a1, a2, a3, 0x626F6C626F72657ALL);
}

uint64_t sub_100137870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100129540((uint64_t)_swiftEmptyArrayStorage, v6);
  sub_1001370E4(v6, a4);
  sub_10000E788((uint64_t)v6);
  return sub_100129380();
}

uint64_t ExpressionType<>.length.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1001396A0(a1, a2, a3, a4, sub_100118150);
}

uint64_t ExpressionType<>.lowercaseString.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1001396E4(a1, a2, 1702326124, a4, sub_100118150);
}

uint64_t ExpressionType<>.uppercaseString.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1001396E4(a1, a2, 1701867637, a4, sub_100118150);
}

void *ExpressionType<>.like(_:escape:)()
{
  sub_100139978();
  if (v5)
  {
    sub_100139930();
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_100139788();
    v8._uint64_t countAndFlagsBits = v7(v6);
    object = v8._object;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    sub_100139BC0((uint64_t)" LIKE ? ESCAPE ?)");
    uint64_t v9 = sub_100139844();
    v10(v9);
    sub_10000BF1C(&qword_10017DEB8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
    sub_100139908((void *)inited, (uint64_t)&type metadata for String);
    sub_1001182DC();
  }
  else
  {
    uint64_t v12 = *(void *)(v4 + 8);
    v24[3] = v3;
    v24[4] = v12;
    sub_1000274F4(v24);
    sub_100115CD4();
    sub_100115E8C();
    v13();
    v23[3] = &type metadata for String;
    v23[4] = &protocol witness table for String;
    v23[0] = v1;
    v23[1] = v0;
    sub_10000BF1C(&qword_10017D698);
    uint64_t v14 = (__n128 *)swift_initStackObject();
    sub_10011D46C(v14, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)v23, (uint64_t)&v14[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)v14, v22);
    sub_10000BEA0(v22, v22[3]);
    sub_10011D404();
    v15();
    sub_10000E788((uint64_t)v22);
    uint64_t v16 = sub_1001399B4();
    sub_10011D1A0(v16, v17, v18, v19, v20);
    sub_100139BE0();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_10006F144();
    sub_10000E788((uint64_t)v23);
    sub_10000E788((uint64_t)v24);
  }
  return object;
}

{
  uint64_t v0;
  uint64_t v1;
  void *object;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  Swift::String v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t inited;
  uint64_t v12;
  void (*v13)(void);
  __n128 *v14;
  void (*v15)(void);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22[4];
  void v23[5];
  uint64_t v24[6];

  sub_100139978();
  if (v5)
  {
    sub_100139930();
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_100139788();
    v8._uint64_t countAndFlagsBits = v7(v6);
    object = v8._object;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    sub_100139BC0((uint64_t)" LIKE ? ESCAPE ?)");
    uint64_t v9 = sub_100139844();
    v10(v9);
    sub_10000BF1C(&qword_10017DEB8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
    sub_100139908((void *)inited, (uint64_t)&type metadata for String);
    sub_1001182DC();
  }
  else
  {
    uint64_t v12 = *(void *)(v4 + 8);
    v24[3] = v3;
    v24[4] = v12;
    sub_1000274F4(v24);
    sub_100115CD4();
    sub_100115E8C();
    v13();
    v23[3] = &type metadata for String;
    v23[4] = &protocol witness table for String;
    v23[0] = v1;
    v23[1] = v0;
    sub_10000BF1C(&qword_10017D698);
    uint64_t v14 = (__n128 *)swift_initStackObject();
    sub_10011D46C(v14, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)v23, (uint64_t)&v14[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)v14, v22);
    sub_10000BEA0(v22, v22[3]);
    sub_10011D404();
    v15();
    sub_10000E788((uint64_t)v22);
    uint64_t v16 = sub_1001399B4();
    sub_10011D1AC(v16, v17, v18, v19, v20);
    sub_100139BE0();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_10006F144();
    sub_10000E788((uint64_t)v23);
    sub_10000E788((uint64_t)v24);
  }
  return object;
}

uint64_t ExpressionType<>.like(_:escape:)()
{
  sub_100139A70();
  if (v4)
  {
    sub_1001398CC(v0, v1, v2, v3, v4, v5, v6);
    sub_100115CD4();
    sub_100115E8C();
    v7();
    uint64_t v8 = sub_10000BF1C((uint64_t *)&unk_10017E920);
    sub_1001398BC(v8, (uint64_t)&protocol witness table for Expression<A>);
    sub_10000BF1C(&qword_10017D698);
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_10011D51C(inited, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)v23, (uint64_t)&inited[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)inited, v22);
    sub_10000BEA0(v22, v22[3]);
    sub_10011D404();
    uint64_t v11 = v10();
    uint64_t v13 = v12;
    sub_10000E788((uint64_t)v22);
    swift_setDeallocating();
    sub_10006F144();
    sub_1001396F0();
    v14._uint64_t countAndFlagsBits = v11;
    v14._object = v13;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    sub_100139730();
    sub_10000BF1C(&qword_10017DEB8);
    uint64_t v15 = swift_initStackObject();
    *(_OWORD *)(v15 + 16) = xmmword_10013EF20;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = &protocol witness table for String;
    sub_1001399DC(v15);
    sub_1001182DC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1001398CC(v0, v1, v2, v3, 0, v5, v6);
    sub_100115CD4();
    sub_100115E8C();
    v16();
    uint64_t v17 = sub_10000BF1C((uint64_t *)&unk_10017E920);
    sub_1001398BC(v17, (uint64_t)&protocol witness table for Expression<A>);
    sub_10000BF1C(&qword_10017D698);
    uint64_t v18 = (__n128 *)swift_initStackObject();
    sub_10011D51C(v18, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)v23, (uint64_t)&v18[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)v18, v22);
    uint64_t v19 = sub_10011D2B4(v22);
    v20(v19);
    sub_10000E788((uint64_t)v22);
    sub_100139A34();
    sub_1001398E8();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_10006F144();
    sub_10000E788((uint64_t)v23);
    sub_10000E788((uint64_t)&v24);
  }
  return sub_100139898();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  __n128 *inited;
  uint64_t (*v10)(void);
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v17;
  __n128 *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27[4];
  unsigned char v28[40];
  uint64_t v29;

  sub_100139A70();
  if (v4)
  {
    sub_1001398CC(v0, v1, v2, v3, v4, v5, v6);
    sub_100115CD4();
    sub_100115E8C();
    v7();
    uint64_t v8 = sub_10000BF1C((uint64_t *)&unk_10017E920);
    sub_1001398BC(v8, (uint64_t)&protocol witness table for Expression<A>);
    sub_10000BF1C(&qword_10017D698);
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_10011D51C(inited, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)v28, (uint64_t)&inited[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)inited, v27);
    sub_10000BEA0(v27, v27[3]);
    sub_10011D404();
    uint64_t v11 = v10();
    uint64_t v13 = v12;
    sub_10000E788((uint64_t)v27);
    swift_setDeallocating();
    sub_10006F144();
    sub_1001396F0();
    v14._uint64_t countAndFlagsBits = v11;
    v14._object = v13;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    sub_100139730();
    sub_10000BF1C(&qword_10017DEB8);
    uint64_t v15 = swift_initStackObject();
    *(_OWORD *)(v15 + 16) = xmmword_10013EF20;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = &protocol witness table for String;
    sub_1001399DC(v15);
    sub_1001182DC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1001398CC(v0, v1, v2, v3, 0, v5, v6);
    sub_100115CD4();
    sub_100115E8C();
    v16();
    uint64_t v17 = sub_10000BF1C((uint64_t *)&unk_10017E920);
    sub_1001398BC(v17, (uint64_t)&protocol witness table for Expression<A>);
    sub_10000BF1C(&qword_10017D698);
    uint64_t v18 = (__n128 *)swift_initStackObject();
    sub_10011D51C(v18, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)v28, (uint64_t)&v18[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)v18, v27);
    uint64_t v19 = sub_10011D2B4(v27);
    int v21 = v20(v19);
    int v23 = v22;
    int v25 = v24;
    sub_10000E788((uint64_t)v27);
    sub_10011D1AC(v21, v23, v25, 0, 0xE000000000000000);
    sub_1001398E8();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_10006F144();
    sub_10000E788((uint64_t)v28);
    sub_10000E788((uint64_t)&v29);
  }
  return sub_100139898();
}

uint64_t ExpressionType<>.glob(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100139800(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))sub_10011D1A0);
}

{
  return sub_100139800(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))sub_10011D1AC);
}

uint64_t ExpressionType<>.match(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100139770(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))sub_10011D1A0);
}

uint64_t ExpressionType<>.regexp(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100139758(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))sub_10011D1A0);
}

{
  return sub_100139758(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t))sub_10011D1AC);
}

uint64_t ExpressionType<>.collate(_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100138854(a1, a2, a3, a4, (void (*)(uint64_t))sub_10011D188);
}

{
  return sub_100138854(a1, a2, a3, a4, (void (*)(uint64_t))sub_10011D194);
}

uint64_t ExpressionType<>.ltrim(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1001396D4(a1, a2, a3, 29804, a5, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100118150);
}

uint64_t ExpressionType<>.rtrim(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1001396D4(a1, a2, a3, 29810, a5, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100118150);
}

uint64_t sub_100137E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a1)
  {
    sub_10000BF1C(&qword_10017D698);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
    *(void *)(inited + 56) = a2;
    *(void *)(inited + 64) = *(void *)(a3 + 8);
    sub_1000274F4((uint64_t *)(inited + 32));
    sub_100115CD4();
    sub_100115E8C();
    v14();
    v21[0] = a1;
    swift_bridgeObjectRetain();
    sub_10000BF1C(&qword_100181728);
    sub_100034754(&qword_100181730, &qword_100181728);
    uint64_t v15 = String.init<A>(_:)();
    *(void *)(inited + 96) = &type metadata for String;
    *(void *)(inited + 104) = &protocol witness table for String;
    *(void *)(inited + 72) = v15;
    *(void *)(inited + 80) = v16;
    sub_100129540(inited, v21);
    uint64_t v17 = v22;
    uint64_t v18 = v23;
    uint64_t v19 = sub_10000BEA0(v21, v22);
    a6(v19, a4, a5, v17, v18);
    sub_1001398AC();
    sub_10000E788((uint64_t)v21);
    swift_setDeallocating();
    sub_10006F144();
  }
  else
  {
    a6(v6, a4, a5, a2, *(void *)(a3 + 8));
    sub_1001398AC();
  }
  return sub_1000A889C();
}

uint64_t ExpressionType<>.trim(_:)(uint64_t a1)
{
  if (a1)
  {
    sub_10000BF1C(&qword_10017D698);
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_100139AEC(inited, (__n128)xmmword_10013F1D0);
    sub_100115CD4();
    sub_100115E8C();
    v3();
    v11[0] = a1;
    swift_bridgeObjectRetain();
    sub_10000BF1C(&qword_100181728);
    sub_100034754(&qword_100181730, &qword_100181728);
    uint64_t v4 = String.init<A>(_:)();
    inited[6].n128_u64[0] = (unint64_t)&type metadata for String;
    inited[6].n128_u64[1] = (unint64_t)&protocol witness table for String;
    inited[4].n128_u64[1] = v4;
    inited[5].n128_u64[0] = v5;
  }
  else
  {
    sub_10000BF1C(&qword_10017D698);
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_100139AEC(inited, (__n128)xmmword_10013EF20);
    sub_100115CD4();
    sub_100115E8C();
    v6();
  }
  sub_100129540((uint64_t)inited, v11);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  uint64_t v9 = sub_10000BEA0(v11, v12);
  sub_100118150(v9, 1835627124, 0xE400000000000000, v7, v8);
  sub_10000E788((uint64_t)v11);
  swift_setDeallocating();
  sub_10006F144();
  return sub_1000A889C();
}

uint64_t ExpressionType<>.replace(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1001389D4(a1, a2, a3, a4, a5, a6, (void (*)(void *, uint64_t, unint64_t, uint64_t, uint64_t))sub_100118150);
}

void ExpressionType<>.substring(_:length:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  sub_100138B24(a1, a2, a3, a4, a5, (uint64_t)sub_100118150, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32,
    a33,
    a34,
    a35,
    a36,
    a37,
    a38,
    a39,
    a40,
    a41,
    a42,
    a43,
    a44,
    a45,
    a46,
    a47,
    a48,
    a49,
    a50,
    a51,
    a52,
    a53,
    a54,
    a55,
    a56,
    a57,
    a58);
}

uint64_t ExpressionType<>.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100138C98(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))ExpressionType<>.substring(_:length:));
}

uint64_t sub_1001381F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  return a5(v5, a3, a4, a1, *(void *)(a2 + 8));
}

uint64_t sub_1001386F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t v10 = *(void *)(a4 + 8);
  v19[3] = a3;
  v19[4] = v10;
  sub_1000274F4(v19);
  sub_100115CD4();
  sub_100115E8C();
  v11();
  v18[3] = &type metadata for String;
  v18[4] = &protocol witness table for String;
  v18[0] = a1;
  v18[1] = a2;
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
  sub_10000C0D4((uint64_t)v19, inited + 32);
  sub_10000C0D4((uint64_t)v18, inited + 72);
  swift_bridgeObjectRetain();
  sub_10011750C(inited, v17);
  uint64_t v13 = sub_10011D2E8(v17);
  v14(v13);
  sub_10000E788((uint64_t)v17);
  uint64_t v15 = sub_100139A58();
  a7(v15);
  sub_10011D65C();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_10006F144();
  return sub_100139B60();
}

uint64_t sub_100138854(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v8 = *(void *)(a4 + 8);
  uint64_t v17[3] = a3;
  v17[4] = v8;
  sub_1000274F4(v17);
  sub_100115CD4();
  sub_100115E8C();
  v9();
  v16[3] = &type metadata for Collation;
  void v16[4] = &protocol witness table for Collation;
  v16[0] = a1;
  v16[1] = a2;
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10013F1D0;
  sub_10000C0D4((uint64_t)v17, inited + 32);
  sub_10000C0D4((uint64_t)v16, inited + 72);
  sub_100115B14(a1, a2);
  sub_10011750C(inited, v15);
  uint64_t v11 = sub_10011D2E8(v15);
  v12(v11);
  sub_10000E788((uint64_t)v15);
  uint64_t v13 = sub_100139A58();
  a5(v13);
  sub_10011D65C();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_10006F144();
  return sub_100139B60();
}

uint64_t ExpressionType<>.trim(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100137E64(a1, a2, a3, 1835627124, 0xE400000000000000, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100118150);
}

uint64_t sub_1001389D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10013F1E0;
  *(void *)(inited + 56) = a5;
  *(void *)(inited + 64) = *(void *)(a6 + 8);
  sub_1000274F4((uint64_t *)(inited + 32));
  sub_100115CD4();
  sub_100115E8C();
  v15();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 104) = &protocol witness table for String;
  *(void *)(inited + 72) = a1;
  *(void *)(inited + 80) = a2;
  *(void *)(inited + 136) = &type metadata for String;
  *(void *)(inited + 144) = &protocol witness table for String;
  *(void *)(inited + 112) = a3;
  *(void *)(inited + 120) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100129540(inited, v20);
  uint64_t v16 = v21;
  uint64_t v17 = v22;
  uint64_t v18 = sub_10000BEA0(v20, v21);
  a7(v18, 0x6563616C706572, 0xE700000000000000, v16, v17);
  sub_1001398AC();
  sub_10000E788((uint64_t)v20);
  swift_setDeallocating();
  sub_10006F144();
  return sub_1000A889C();
}

void sub_100138B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  sub_100116180();
  a57 = v58;
  a58 = v59;
  v61 = v60;
  char v63 = v62;
  unint64_t v65 = v64;
  unint64_t v67 = v66;
  sub_10000BF1C(&qword_10017D698);
  if (v63)
  {
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_100139B10(inited, (__n128)xmmword_10013F1D0);
    sub_100115E8C();
    v70();
    inited[6].n128_u64[0] = (unint64_t)&type metadata for Int;
    inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Int;
    inited[4].n128_u64[1] = v67;
  }
  else
  {
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_100139B10(inited, (__n128)xmmword_10013F1E0);
    sub_100115E8C();
    v69();
    inited[6].n128_u64[0] = (unint64_t)&type metadata for Int;
    inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Int;
    inited[4].n128_u64[1] = v67;
    inited[8].n128_u64[1] = (unint64_t)&type metadata for Int;
    inited[9].n128_u64[0] = (unint64_t)&protocol witness table for Int;
    inited[7].n128_u64[0] = v65;
  }
  sub_100129540((uint64_t)inited, &a28);
  uint64_t v71 = a31;
  uint64_t v72 = a32;
  v73 = sub_10000BEA0(&a28, a31);
  v61(v73, 0x727473627573, 0xE600000000000000, v71, v72);
  sub_1001399CC();
  sub_10000E788((uint64_t)&a28);
  swift_setDeallocating();
  sub_10006F144();
  sub_100139888();
  sub_100116134();
}

uint64_t sub_100138C98(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, void, uint64_t, uint64_t))
{
  BOOL v5 = __OFSUB__(a2, result);
  uint64_t v6 = a2 - result;
  if (!v5) {
    return a5(result, v6, 0, a3, a4);
  }
  __break(1u);
  return result;
}

#error "100138DD0: call analysis failed (funcsize=107)"

#error "100138FA4: call analysis failed (funcsize=110)"

uint64_t sub_100139058@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 56);
  swift_getAssociatedTypeWitness();
  a2[3] = swift_getAssociatedTypeWitness();
  a2[4] = swift_getAssociatedConformanceWitness();
  sub_1000274F4(a2);
  uint64_t v5 = swift_checkMetadataState();
  return v4(v5, a1);
}

uint64_t String.like(_:escape:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v28[3] = &type metadata for String;
  v28[4] = &protocol witness table for String;
  v28[0] = a6;
  v28[1] = a7;
  if (a5)
  {
    uint64_t v26 = sub_10000BF1C((uint64_t *)&unk_10017E920);
    uint64_t v27 = &protocol witness table for Expression<A>;
    uint64_t v23 = a1;
    uint64_t v24 = a2;
    uint64_t v25 = a3;
    sub_10000BF1C(&qword_10017D698);
    uint64_t inited = (__n128 *)swift_initStackObject();
    sub_10011D51C(inited, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)&v23, (uint64_t)&inited[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)inited, v22);
    uint64_t v11 = sub_10011D2E8(v22);
    uint64_t v13 = v12(v11);
    uint64_t v15 = v14;
    sub_10000E788((uint64_t)v22);
    swift_setDeallocating();
    sub_10006F144();
    sub_1001396F0();
    v16._uint64_t countAndFlagsBits = v13;
    v16._object = v15;
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    sub_100139730();
    sub_10000BF1C(&qword_10017DEB8);
    uint64_t v17 = swift_initStackObject();
    *(_OWORD *)(v17 + 16) = xmmword_10013EF20;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = &protocol witness table for String;
    sub_1001399DC(v17);
    sub_1001182DC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = sub_10000BF1C((uint64_t *)&unk_10017E920);
    uint64_t v27 = &protocol witness table for Expression<A>;
    uint64_t v23 = a1;
    uint64_t v24 = a2;
    uint64_t v25 = a3;
    sub_10000BF1C(&qword_10017D698);
    uint64_t v18 = (__n128 *)swift_initStackObject();
    sub_10011D51C(v18, (__n128)xmmword_10013F1D0);
    sub_10000C0D4((uint64_t)&v23, (uint64_t)&v18[4].n128_i64[1]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1001396B4((uint64_t)v18, v22);
    uint64_t v19 = sub_10011D2B4(v22);
    v20(v19);
    sub_10000E788((uint64_t)v22);
    sub_100139A34();
    sub_1001398E8();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_10006F144();
    sub_10000E788((uint64_t)&v23);
    sub_10000E788((uint64_t)v28);
  }
  return sub_100139898();
}

uint64_t ?? infix<A>(_:_:)(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = (__n128 *)swift_initStackObject();
  sub_100139AAC(inited, (__n128)xmmword_10013F1D0);
  inited[3].n128_u64[1] = sub_100115CF8();
  inited[4].n128_u64[0] = (unint64_t)&protocol witness table for Expression<A>;
  inited[2].n128_u64[0] = a1;
  inited[2].n128_u64[1] = a2;
  inited[3].n128_u64[0] = a3;
  inited[6].n128_u64[0] = a5;
  inited[6].n128_u64[1] = *(void *)(a6 + 8);
  sub_1000274F4(&inited[4].n128_i64[1]);
  sub_100115CD4();
  sub_100115E8C();
  v12();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100137450((uint64_t)inited, 19);
  sub_1001398AC();
  swift_setDeallocating();
  sub_10006F144();
  return sub_1000A889C();
}

uint64_t ?? infix<A>(_:_:)()
{
  sub_100139868();
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = (__n128 *)swift_initStackObject();
  sub_100139AAC(inited, (__n128)xmmword_10013F1D0);
  inited[3].n128_u64[1] = sub_100115CF8();
  inited[4].n128_u64[0] = (unint64_t)&protocol witness table for Expression<A>;
  inited[2].n128_u64[0] = v5;
  inited[2].n128_u64[1] = v4;
  inited[3].n128_u64[0] = v3;
  inited[6].n128_u64[0] = type metadata accessor for Expression();
  inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Expression<A>;
  inited[4].n128_u64[1] = v2;
  inited[5].n128_u64[0] = v1;
  inited[5].n128_u64[1] = v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100137450((uint64_t)inited, 19);
  sub_100139BA0();
  sub_10006F144();
  return sub_100139888();
}

{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __n128 *inited;
  uint64_t v7;

  sub_100139868();
  sub_10000BF1C(&qword_10017D698);
  uint64_t inited = (__n128 *)swift_initStackObject();
  sub_100139AAC(inited, (__n128)xmmword_10013F1D0);
  uint64_t v7 = sub_100115CF8();
  inited[2].n128_u64[0] = v5;
  inited[2].n128_u64[1] = v4;
  inited[3].n128_u64[0] = v3;
  inited[3].n128_u64[1] = v7;
  inited[6].n128_u64[0] = v7;
  inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Expression<A>;
  inited[4].n128_u64[0] = (unint64_t)&protocol witness table for Expression<A>;
  inited[4].n128_u64[1] = v2;
  inited[5].n128_u64[0] = v1;
  inited[5].n128_u64[1] = v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100137450((uint64_t)inited, 19);
  sub_100139BA0();
  sub_10006F144();
  return sub_100139888();
}

uint64_t sub_100139664@<X0>(uint64_t *a1@<X8>)
{
  return sub_100139058(*(void *)(v1 + 32), a1);
}

uint64_t sub_100139688@<X0>(uint64_t *a1@<X8>)
{
  return sub_100139664(a1);
}

uint64_t sub_1001396A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  return sub_1001381F0(a1, a2, 0x6874676E656CLL, 0xE600000000000000, a5);
}

void sub_1001396B4(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_10011750C(a1, a2);
}

uint64_t sub_1001396D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return sub_100137E64(a1, a2, a3, a4 & 0xFFFF00000000FFFFLL | 0x6D69720000, 0xE500000000000000, a6);
}

uint64_t sub_1001396E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  return sub_1001381F0(a1, a2, a3 & 0xFFFF0000FFFFFFFFLL | 0x7200000000, 0xE500000000000000, a5);
}

uint64_t sub_1001396F0()
{
  sub_10000E788(v0 - 160);
  sub_10000E788(v0 - 120);
  *(void *)(v0 - 120) = 40;
  *(void *)(v0 - 112) = 0xE100000000000000;
  return swift_bridgeObjectRetain();
}

void sub_100139730()
{
  uint64_t v1 = 0x2045504143534520;
  unint64_t v2 = 0xEA0000000000293FLL;
  String.append(_:)(*(Swift::String *)&v1);
}

uint64_t sub_100139758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  return sub_1001386F0(a1, a2, a3, a4, 0x2050584547455220, 0xE800000000000000, a7);
}

uint64_t sub_100139770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  return sub_1001386F0(a1, a2, a3, a4, 0x20484354414D20, 0xE700000000000000, a7);
}

uint64_t sub_100139788()
{
  *(void *)(v1 - 128) = 40;
  *(void *)(v1 - 120) = 0xE100000000000000;
  return v0;
}

uint64_t sub_1001397CC()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_100139800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  return sub_1001386F0(a1, a2, a3, a4, 0x20424F4C4720, 0xE600000000000000, a7);
}

uint64_t sub_100139814(uint64_t a1)
{
  *(void *)(v5 - 104) = a1;
  *(void *)(v5 - 96) = v4;
  *(void *)(v5 - 128) = v3;
  *(void *)(v5 - 120) = v2;
  *(void *)(v5 - 112) = v1;
  *(void *)(v5 - 168) = 40;
  *(void *)(v5 - 160) = 0xE100000000000000;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100139844()
{
  return v0;
}

uint64_t sub_100139888()
{
  return v0;
}

uint64_t sub_100139898()
{
  return v0;
}

uint64_t sub_1001398BC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v5 - 136) = result;
  *(void *)(v5 - 128) = a2;
  *(void *)(v5 - 160) = v4;
  *(void *)(v5 - 152) = v3;
  *(void *)(v5 - 144) = v2;
  return result;
}

uint64_t *sub_1001398CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = *(void *)(a7 + 8);
  *(void *)(v8 - 96) = v7;
  *(void *)(v8 - 88) = v10;
  return sub_1000274F4((uint64_t *)(v8 - 120));
}

uint64_t sub_1001398E8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100139908@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  a1[7] = a2;
  a1[8] = v2;
  a1[4] = v5;
  a1[5] = v3;
  a1[12] = a2;
  a1[13] = v2;
  a1[9] = v7;
  a1[10] = v6;
  *(void *)(v8 - 128) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100139930()
{
  *(void *)(v0 - 128) = 0;
  *(void *)(v0 - 120) = 0xE000000000000000;
  return swift_bridgeObjectRetain();
}

void sub_100139954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_10011750C(v7, (uint64_t *)va);
}

uint64_t sub_100139990(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return sub_100136C78(a1, (uint64_t)va, v11, a4, a5, v10, a7, a8);
}

uint64_t sub_1001399B4()
{
  return v0;
}

uint64_t sub_1001399DC(uint64_t a1)
{
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = v1;
  *(void *)(v4 - 120) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1001399F8()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100139A1C()
{
  return v0;
}

uint64_t sub_100139A34()
{
  return sub_10011D1A0(v0, v1, v2, 0, 0xE000000000000000);
}

uint64_t sub_100139A58()
{
  return v0;
}

uint64_t *sub_100139A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15 = *(void *)(a2 + 8);
  a13 = a1;
  a14 = v15;
  return sub_1000274F4(&a10);
}

uint64_t sub_100139AAC(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return type metadata accessor for Optional();
}

uint64_t *sub_100139AC8(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  uint64_t v6 = (uint64_t *)&a1[2];
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = *(void *)(v4 + 8);
  return sub_1000274F4(v6);
}

uint64_t *sub_100139AEC(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  uint64_t v6 = (uint64_t *)&a1[2];
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = *(void *)(v4 + 8);
  return sub_1000274F4(v6);
}

uint64_t *sub_100139B10(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  uint64_t v6 = (uint64_t *)&a1[2];
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = *(void *)(v4 + 8);
  return sub_1000274F4(v6);
}

uint64_t sub_100139B34()
{
  sub_10000E788(v1 - 168);
  sub_10000E788(v1 - 128);
  return v0;
}

uint64_t sub_100139B60()
{
  sub_10000E788(v1 - 144);
  sub_10000E788(v1 - 104);
  return v0;
}

uint64_t sub_100139BA0()
{
  return swift_setDeallocating();
}

void sub_100139BC0(uint64_t a1@<X8>)
{
  unint64_t v3 = 0xD000000000000011;
  unint64_t v2 = (a1 - 32) | 0x8000000000000000;
  String.append(_:)(*(Swift::String *)&v3);
}

uint64_t sub_100139BE0()
{
  return swift_bridgeObjectRelease();
}

const char *sub_100139C00(int a1)
{
  if (qword_100180D50 != -1) {
    swift_once();
  }
  sub_100139CFC(a1, qword_100181738);
  if (v2)
  {
    swift_release();
    swift_release();
    return 0;
  }
  uint64_t v4 = (sqlite3 *)Connection.handle.getter();
  unint64_t result = sqlite3_errmsg(v4);
  if (result)
  {
    uint64_t v3 = String.init(cString:)();
    swift_release();
    return (const char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100139CD4()
{
  uint64_t result = sub_10013A090((uint64_t)&off_100173B30);
  qword_100181738 = result;
  return result;
}

void sub_100139CFC(int a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    unint64_t v4 = static Hasher._hash(seed:bytes:count:)() & ~(-1 << *(unsigned char *)(a2 + 32));
    if (((*(void *)(a2 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0
      && *(_DWORD *)(*(void *)(a2 + 48) + 4 * v4) != a1)
    {
      sub_10013A1D0();
      if (v7)
      {
        do
        {
          if (*(_DWORD *)(v5 + 4 * v6) == a1) {
            break;
          }
          sub_10013A1D0();
        }
        while ((v8 & 1) != 0);
      }
    }
  }
}

uint64_t Result.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_retain_n();
    _StringGuts.grow(_:)(18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v14 = a1;
    v5._uint64_t countAndFlagsBits = 10272;
    v5._object = (void *)0xE200000000000000;
    String.append(_:)(v5);
    v6._uint64_t countAndFlagsBits = (uint64_t)Statement.description.getter();
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    v7._uint64_t countAndFlagsBits = 0x3A65646F63282029;
    v7._object = (void *)0xE900000000000020;
    String.append(_:)(v7);
    v8._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    v9._uint64_t countAndFlagsBits = 41;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    swift_release_n();
  }
  else
  {
    uint64_t v14 = a1;
    swift_bridgeObjectRetain();
    v10._uint64_t countAndFlagsBits = 0x203A65646F632820;
    v10._object = (void *)0xE800000000000000;
    String.append(_:)(v10);
    v11._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    v12._uint64_t countAndFlagsBits = 41;
    v12._object = (void *)0xE100000000000000;
    String.append(_:)(v12);
  }
  return v14;
}

uint64_t sub_100139F2C()
{
  return Result.description.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned int *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t destroy for Result()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for Result(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Result(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for Result(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for Result()
{
  return &type metadata for Result;
}

uint64_t sub_10013A090(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptySetSingleton;
    goto LABEL_13;
  }
  sub_10000BF1C(&qword_100181740);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v3 = (void *)result;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  unint64_t v5 = 0;
  uint64_t v6 = result + 56;
  uint64_t v7 = ~(-1 << *(unsigned char *)(result + 32));
  while (v5 < *(void *)(a1 + 16))
  {
    int v8 = *(_DWORD *)(a1 + 32 + 4 * v5);
    uint64_t result = static Hasher._hash(seed:bytes:count:)();
    unint64_t v9 = result & v7;
    unint64_t v10 = (result & (unint64_t)v7) >> 6;
    uint64_t v11 = *(void *)(v6 + 8 * v10);
    uint64_t v12 = 1 << (result & v7);
    uint64_t v13 = v3[6];
    if ((v12 & v11) != 0)
    {
      while (*(_DWORD *)(v13 + 4 * v9) != v8)
      {
        unint64_t v9 = (v9 + 1) & v7;
        unint64_t v10 = v9 >> 6;
        uint64_t v11 = *(void *)(v6 + 8 * (v9 >> 6));
        uint64_t v12 = 1 << v9;
        if ((v11 & (1 << v9)) == 0) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      *(void *)(v6 + 8 * v10) = v12 | v11;
      *(_DWORD *)(v13 + 4 * v9) = v8;
      uint64_t v14 = v3[2];
      BOOL v15 = __OFADD__(v14, 1);
      uint64_t v16 = v14 + 1;
      if (v15) {
        goto LABEL_15;
      }
      v3[2] = v16;
    }
    if (++v5 == v4) {
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t Collation.expression.getter(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      return 0x5952414E4942;
    case 1:
      return 0x455341434F4ELL;
    case 2:
      return 0x4D49525452;
  }
  return sub_100117940(34, (void *)0xE100000000000000, a1, a2);
}

uint64_t Collation.description.getter(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      return 0x5952414E4942;
    case 1:
      return 0x455341434F4ELL;
    case 2:
      return 0x4D49525452;
  }
  return sub_100117940(34, (void *)0xE100000000000000, a1, a2);
}

uint64_t sub_10013A2EC()
{
  return Collation.expression.getter(*v0, v0[1]);
}

uint64_t sub_10013A310()
{
  return Collation.description.getter(*v0, v0[1]);
}

uint64_t getEnumTagSinglePayload for Collation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Collation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Collation()
{
  return &type metadata for Collation;
}

uint64_t static CocoaError.fileNoSuchFile.getter()
{
  return static CocoaError.fileNoSuchFile.getter();
}

uint64_t static CocoaError.fileReadNoSuchFile.getter()
{
  return static CocoaError.fileReadNoSuchFile.getter();
}

uint64_t type metadata accessor for CocoaError.Code()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t Notification.description.getter()
{
  return Notification.description.getter();
}

NSNotification __swiftcall Notification._bridgeToObjectiveC()()
{
  return (NSNotification)Notification._bridgeToObjectiveC()();
}

uint64_t Notification.init(name:object:userInfo:)()
{
  return Notification.init(name:object:userInfo:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t CustomNSError.errorUserInfo.getter()
{
  return CustomNSError.errorUserInfo.getter();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t URLResourceValues.contentModificationDate.getter()
{
  return URLResourceValues.contentModificationDate.getter();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:conformingTo:)()
{
  return URL.appendingPathComponent(_:conformingTo:)();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)()
{
  return URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)();
}

Swift::Void __swiftcall URL.stopAccessingSecurityScopedResource()()
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Bool __swiftcall URL.startAccessingSecurityScopedResource()()
{
  return URL.startAccessingSecurityScopedResource()();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.InlineData.init(_:)()
{
  return Data.InlineData.init(_:)();
}

uint64_t Data.LargeSlice.init(_:)()
{
  return Data.LargeSlice.init(_:)();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.InlineSlice.init(_:)()
{
  return Data.InlineSlice.init(_:)();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t Data.makeIterator()()
{
  return Data.makeIterator()();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._forceBridgeFromObjectiveC(_:result:)()
{
  return static Data._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Data.== infix(_:_:)()
{
  return static Data.== infix(_:_:)();
}

uint64_t static Data._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Data._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.hash(into:)()
{
  return Data.hash(into:)();
}

uint64_t Data.count.getter()
{
  return Data.count.getter();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t Data.copyBytes(to:count:)()
{
  return Data.copyBytes(to:count:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t TimeZone.init(secondsFromGMT:)()
{
  return TimeZone.init(secondsFromGMT:)();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t Selector.description.getter()
{
  return Selector.description.getter();
}

uint64_t MetadataError.errorDescription.getter()
{
  return MetadataError.errorDescription.getter();
}

uint64_t type metadata accessor for MetadataError()
{
  return type metadata accessor for MetadataError();
}

uint64_t static DaemonRecord.enumerated.getter()
{
  return static DaemonRecord.enumerated.getter();
}

uint64_t DaemonRecord.metadataURLs.getter()
{
  return DaemonRecord.metadataURLs.getter();
}

uint64_t DaemonRecord.bundleIdentifier.getter()
{
  return DaemonRecord.bundleIdentifier.getter();
}

uint64_t DaemonRecord.attributionBundleIdentifier.getter()
{
  return DaemonRecord.attributionBundleIdentifier.getter();
}

uint64_t static DaemonRecord.from(bundleIdentifier:)()
{
  return static DaemonRecord.from(bundleIdentifier:)();
}

uint64_t type metadata accessor for DaemonRecord()
{
  return type metadata accessor for DaemonRecord();
}

uint64_t static FrameworkRecord.enumerated.getter()
{
  return static FrameworkRecord.enumerated.getter();
}

uint64_t FrameworkRecord.metadataURL.getter()
{
  return FrameworkRecord.metadataURL.getter();
}

uint64_t FrameworkRecord.bundleIdentifier.getter()
{
  return FrameworkRecord.bundleIdentifier.getter();
}

uint64_t static FrameworkRecord.from(bundleIdentifier:)()
{
  return static FrameworkRecord.from(bundleIdentifier:)();
}

uint64_t FrameworkRecord.bundleURL.getter()
{
  return FrameworkRecord.bundleURL.getter();
}

uint64_t type metadata accessor for FrameworkRecord()
{
  return type metadata accessor for FrameworkRecord();
}

uint64_t AssistantPrebuiltEnum.metadata.getter()
{
  return AssistantPrebuiltEnum.metadata.getter();
}

uint64_t type metadata accessor for AssistantPrebuiltEnum()
{
  return type metadata accessor for AssistantPrebuiltEnum();
}

uint64_t AssistantPrebuiltEntity.metadata.getter()
{
  return AssistantPrebuiltEntity.metadata.getter();
}

uint64_t type metadata accessor for AssistantPrebuiltEntity()
{
  return type metadata accessor for AssistantPrebuiltEntity();
}

uint64_t AssistantPrebuiltIntent.metadata.getter()
{
  return AssistantPrebuiltIntent.metadata.getter();
}

uint64_t type metadata accessor for AssistantPrebuiltIntent()
{
  return type metadata accessor for AssistantPrebuiltIntent();
}

uint64_t AssistantPrebuiltLibrary.enums.getter()
{
  return AssistantPrebuiltLibrary.enums.getter();
}

uint64_t AssistantPrebuiltLibrary.intents.getter()
{
  return AssistantPrebuiltLibrary.intents.getter();
}

uint64_t static AssistantPrebuiltLibrary.library.getter()
{
  return static AssistantPrebuiltLibrary.library.getter();
}

uint64_t AssistantPrebuiltLibrary.entities.getter()
{
  return AssistantPrebuiltLibrary.entities.getter();
}

uint64_t type metadata accessor for AssistantPrebuiltLibrary()
{
  return type metadata accessor for AssistantPrebuiltLibrary();
}

uint64_t static RegexComponentBuilder.buildExpression<A>(_:)()
{
  return static RegexComponentBuilder.buildExpression<A>(_:)();
}

uint64_t static RegexComponentBuilder.buildPartialBlock<A>(first:)()
{
  return static RegexComponentBuilder.buildPartialBlock<A>(first:)();
}

uint64_t makeFactory()()
{
  return makeFactory()();
}

uint64_t type metadata accessor for CharacterClass()
{
  return type metadata accessor for CharacterClass();
}

uint64_t Capture.init(_:)()
{
  return Capture.init(_:)();
}

uint64_t OneOrMore.regex.getter()
{
  return OneOrMore.regex.getter();
}

uint64_t OneOrMore.init(_:)()
{
  return OneOrMore.init(_:)();
}

uint64_t type metadata accessor for Mutex()
{
  return type metadata accessor for Mutex();
}

uint64_t _RegexFactory.accumulate<A, B, C>(_:_:)()
{
  return _RegexFactory.accumulate<A, B, C>(_:_:)();
}

uint64_t _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)()
{
  return _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
}

uint64_t _RegexFactory.capture<A, B>(_:)()
{
  return _RegexFactory.capture<A, B>(_:)();
}

uint64_t _RegexFactory.oneOrMore<A, B>(_:_:)()
{
  return _RegexFactory.oneOrMore<A, B>(_:_:)();
}

uint64_t type metadata accessor for _RegexFactory()
{
  return type metadata accessor for _RegexFactory();
}

uint64_t static RegexComponent<>.word.getter()
{
  return static RegexComponent<>.word.getter();
}

uint64_t static RegexRepetitionBehavior.reluctant.getter()
{
  return static RegexRepetitionBehavior.reluctant.getter();
}

uint64_t type metadata accessor for RegexRepetitionBehavior()
{
  return type metadata accessor for RegexRepetitionBehavior();
}

uint64_t Regex.init(_regexString:version:)()
{
  return Regex.init(_regexString:version:)();
}

uint64_t Regex.init<A>(_:)()
{
  return Regex.init<A>(_:)();
}

uint64_t Regex.wholeMatch(in:)()
{
  return Regex.wholeMatch(in:)();
}

uint64_t Regex.repetitionBehavior(_:)()
{
  return Regex.repetitionBehavior(_:)();
}

uint64_t Regex.Match.subscript.getter()
{
  return Regex.Match.subscript.getter();
}

uint64_t Regex.Match.range.getter()
{
  return Regex.Match.range.getter();
}

uint64_t Regex.Match.output.getter()
{
  return Regex.Match.output.getter();
}

uint64_t static UTType.data.getter()
{
  return static UTType.data.getter();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
}

uint64_t OSSignpostID.init(log:object:)()
{
  return OSSignpostID.init(log:object:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t DispatchSpecificKey.init()()
{
  return DispatchSpecificKey.init()();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t Array.init()()
{
  return Array.init()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t Character.write<A>(to:)()
{
  return Character.write<A>(to:)();
}

uint64_t BidirectionalCollection<>.matches<A, B>(of:)()
{
  return BidirectionalCollection<>.matches<A, B>(of:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t type metadata accessor for ClosedRange()
{
  return type metadata accessor for ClosedRange();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.replaceSubrange<A>(_:with:)()
{
  return String.replaceSubrange<A>(_:with:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

{
  return String.init(cString:)();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

{
  return String.init<A>(_:)();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t Sequence<>.joined(separator:)()
{
  return Sequence<>.joined(separator:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return type metadata accessor for CheckedContinuation();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Index._asCocoa.modify()
{
  return Set.Index._asCocoa.modify();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t Collection.isEmpty.getter()
{
  return Collection.isEmpty.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t RangeReplaceableCollection.removeFirst()()
{
  return RangeReplaceableCollection.removeFirst()();
}

uint64_t type metadata accessor for Range()
{
  return type metadata accessor for Range();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNProperty.asJson()()
{
  uint64_t v0 = LNProperty.asJson()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static LNProperty.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNProperty.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

uint64_t NSEnumerator.makeIterator()()
{
  return NSEnumerator.makeIterator()();
}

uint64_t NSOrderedSet.makeIterator()()
{
  return NSOrderedSet.makeIterator()();
}

uint64_t NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)()
{
  return NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNEnumMetadata.asJson(prettyPrinted:)(Swift::Bool prettyPrinted)
{
  uint64_t v1 = LNEnumMetadata.asJson(prettyPrinted:)(prettyPrinted);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static LNEnumMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNEnumMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

uint64_t static LSBundleRecord.with(bundleIdentifier:allowSystemAppPlaceholder:)()
{
  return static LSBundleRecord.with(bundleIdentifier:allowSystemAppPlaceholder:)();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNQueryMetadata.asJson(prettyPrinted:)(Swift::Bool prettyPrinted)
{
  uint64_t v1 = LNQueryMetadata.asJson(prettyPrinted:)(prettyPrinted);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static LNQueryMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNQueryMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

uint64_t LNActionMetadata._mangledTypeNameForAppIntentsOnly.getter()
{
  return LNActionMetadata._mangledTypeNameForAppIntentsOnly.getter();
}

uint64_t LNActionMetadata._iconSystemImageNameForAppIntentsOnly.getter()
{
  return LNActionMetadata._iconSystemImageNameForAppIntentsOnly.getter();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNActionMetadata.asJson(prettyPrinted:)(Swift::Bool prettyPrinted)
{
  uint64_t v1 = LNActionMetadata.asJson(prettyPrinted:)(prettyPrinted);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static LNActionMetadata.fromJSON(_:bundleMetadataVersion:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNActionMetadata.fromJSON(_:bundleMetadataVersion:bundleURL:effectiveBundleIdentifier:)();
}

uint64_t LNBundleMetadata.init(bundleIdentifier:)()
{
  return LNBundleMetadata.init(bundleIdentifier:)();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNEntityMetadata.asJson(prettyPrinted:)(Swift::Bool prettyPrinted)
{
  uint64_t v1 = LNEntityMetadata.asJson(prettyPrinted:)(prettyPrinted);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static LNEntityMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNEntityMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t static OS_dispatch_queue.getSpecific<A>(key:)()
{
  return static OS_dispatch_queue.getSpecific<A>(key:)();
}

uint64_t OS_dispatch_queue.setSpecific<A>(key:value:)()
{
  return OS_dispatch_queue.setSpecific<A>(key:value:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNAutoShortcutMetadata.asJson()()
{
  uint64_t v0 = LNAutoShortcutMetadata.asJson()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static LNAutoShortcutMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNAutoShortcutMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

uint64_t static LNEntitlementsValidator.hasEntitlement<A>(_:equalTo:)()
{
  return static LNEntitlementsValidator.hasEntitlement<A>(_:equalTo:)();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNAssistantIntentMetadata.asJson()()
{
  uint64_t v0 = LNAssistantIntentMetadata.asJson()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static LNAssistantIntentMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNAssistantIntentMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNExamplePhraseDescription.asJson()()
{
  uint64_t v0 = LNExamplePhraseDescription.asJson()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static LNExamplePhraseDescription.fromJSON(_:)()
{
  return static LNExamplePhraseDescription.fromJSON(_:)();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNAssistantAppEntityMetadata.asJson()()
{
  uint64_t v0 = LNAssistantAppEntityMetadata.asJson()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static LNAssistantAppEntityMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNAssistantAppEntityMetadata.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

uint64_t LSApplicationExtensionRecord.attributionBundleIdentifier.getter()
{
  return LSApplicationExtensionRecord.attributionBundleIdentifier.getter();
}

uint64_t static LSApplicationExtensionRecord.enumeratedStandaloneAppIntentsExtensions.getter()
{
  return static LSApplicationExtensionRecord.enumeratedStandaloneAppIntentsExtensions.getter();
}

uint64_t LNStaticDeferredLocalizedString.asLocalizedStringResourceJSON(encoder:)()
{
  return LNStaticDeferredLocalizedString.asLocalizedStringResourceJSON(encoder:)();
}

uint64_t LNStaticDeferredLocalizedString.init(localizedStringResourceJSON:)()
{
  return LNStaticDeferredLocalizedString.init(localizedStringResourceJSON:)();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNAssistantIntentNegativePhrases.asJson()()
{
  uint64_t v0 = LNAssistantIntentNegativePhrases.asJson()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static LNAssistantIntentNegativePhrases.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNAssistantIntentNegativePhrases.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNValue.asJson()()
{
  uint64_t v0 = LNValue.asJson()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static LNValue.fromJSON(_:bundleURL:effectiveBundleIdentifier:)()
{
  return static LNValue.fromJSON(_:bundleURL:effectiveBundleIdentifier:)();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.lengthOfBytes(using:)()
{
  return StringProtocol.lengthOfBytes(using:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.hash.getter()
{
  return StringProtocol.hash.getter();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return _expectEnd<A>(of:is:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t ContiguousArray.append(_:)()
{
  return ContiguousArray.append(_:)();
}

uint64_t ContiguousArray.init()()
{
  return ContiguousArray.init()();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _stringCompareInternal(_:_:_:_:expecting:)()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t static Int32._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int32._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t type metadata accessor for Result()
{
  return type metadata accessor for Result();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AFDeviceSupportsSAE()
{
  return _AFDeviceSupportsSAE();
}

uint64_t AFPreferencesMobileUserSessionLanguage()
{
  return _AFPreferencesMobileUserSessionLanguage();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
}

uint64_t LNAppNotificationEventListenerXPCInterface()
{
  return _LNAppNotificationEventListenerXPCInterface();
}

uint64_t LNDaemonApplicationXPCInterface()
{
  return _LNDaemonApplicationXPCInterface();
}

uint64_t LNDaemonExtensionXPCInterface()
{
  return _LNDaemonExtensionXPCInterface();
}

uint64_t LNDaemonObservationStatusRegistryXPCInterface()
{
  return _LNDaemonObservationStatusRegistryXPCInterface();
}

uint64_t LNDaemonRegistryXPCInterface()
{
  return _LNDaemonRegistryXPCInterface();
}

uint64_t LNDaemonSuggestionsXPCInterface()
{
  return _LNDaemonSuggestionsXPCInterface();
}

uint64_t LNNextActionObserverXPCInterface()
{
  return _LNNextActionObserverXPCInterface();
}

uint64_t LNSetUserDirSuffix()
{
  return _LNSetUserDirSuffix();
}

uint64_t LNTranscriptXPCInterface()
{
  return _LNTranscriptXPCInterface();
}

uint64_t LNTranscriptXPCObservingInterface()
{
  return _LNTranscriptXPCObservingInterface();
}

uint64_t LNTranscriptXPCPrivilegedInterface()
{
  return _LNTranscriptXPCPrivilegedInterface();
}

uint64_t LNTranscriptXPCPrivilegedObservingInterface()
{
  return _LNTranscriptXPCPrivilegedObservingInterface();
}

NSUInteger NSPageSize(void)
{
  return _NSPageSize();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_truncate()
{
  return __sqlite3_db_truncate();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

uint64_t container_system_path_for_identifier()
{
  return _container_system_path_for_identifier();
}

void dispatch_main(void)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t getLNLogCategoryExecution()
{
  return _getLNLogCategoryExecution();
}

uint64_t getLNLogCategoryMetadata()
{
  return _getLNLogCategoryMetadata();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_state_remove_handler()
{
  return _os_state_remove_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_needs_more_time()
{
  return _os_transaction_needs_more_time();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return _sqlite3_backup_finish(p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return _sqlite3_backup_init(pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_pagecount(sqlite3_backup *p)
{
  return _sqlite3_backup_pagecount(p);
}

int sqlite3_backup_remaining(sqlite3_backup *p)
{
  return _sqlite3_backup_remaining(p);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return _sqlite3_backup_step(p, nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return _sqlite3_bind_parameter_count(a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return _sqlite3_bind_parameter_index(a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return _sqlite3_busy_handler(a1, a2, a3);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return _sqlite3_busy_timeout(a1, ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

void *__cdecl sqlite3_commit_hook(sqlite3 *a1, int (__cdecl *a2)(void *), void *a3)
{
  return _sqlite3_commit_hook(a1, a2, a3);
}

int sqlite3_create_collation_v2(sqlite3 *a1, const char *zName, int eTextRep, void *pArg, int (__cdecl *xCompare)(void *, int, const void *, int, const void *), void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_collation_v2(a1, zName, eTextRep, pArg, xCompare, xDestroy);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return _sqlite3_db_filename(db, zDbName);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return _sqlite3_db_readonly(db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_expanded_sql(pStmt);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return _sqlite3_extended_result_codes(a1, onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return _sqlite3_file_control(a1, zDbName, op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

void sqlite3_interrupt(sqlite3 *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

void *__cdecl sqlite3_rollback_hook(sqlite3 *a1, void (__cdecl *a2)(void *), void *a3)
{
  return _sqlite3_rollback_hook(a1, a2, a3);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_sql(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_total_changes(sqlite3 *a1)
{
  return _sqlite3_total_changes(a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return _sqlite3_trace_v2(a1, uMask, xCallback, pCtx);
}

void *__cdecl sqlite3_update_hook(sqlite3 *a1, void (__cdecl *a2)(void *, int, const char *, const char *, sqlite3_int64), void *a3)
{
  return _sqlite3_update_hook(a1, a2, a3);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return _sqlite3_user_data(a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return _sqlite3_value_blob(a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return _sqlite3_value_bytes(a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  return _sqlite3_value_double(a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return _sqlite3_value_int64(a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return _sqlite3_value_text(a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return _sqlite3_value_type(a1);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_featureEnabledWithDomain_feature_(void *a1, const char *a2, ...)
{
  return [a1 featureEnabledWithDomain:feature:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}