uint64_t assignWithTake for SQLIndexOrderingTerm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLIndexOrderingTerm(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 17))
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

uint64_t storeEnumTagSinglePayload for SQLIndexOrderingTerm(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SQLIndexOrderingTerm()
{
}

uint64_t destroy for SQLVirtualTableIndexQuery()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s15SonicFoundation25SQLVirtualTableIndexQueryVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  return a1;
}

void *assignWithCopy for SQLVirtualTableIndexQuery(void *a1, void *a2)
{
  *a1 = *a2;
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQLVirtualTableIndexQuery(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLVirtualTableIndexQuery(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
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

uint64_t storeEnumTagSinglePayload for SQLVirtualTableIndexQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)result = a2 ^ 0x80000000;
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
      *(void *)result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SQLVirtualTableIndexQuery()
{
}

uint64_t destroy for SQLVirtualTableIndexResults()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLVirtualTableIndexResults(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  return a1;
}

uint64_t assignWithCopy for SQLVirtualTableIndexResults(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t assignWithTake for SQLVirtualTableIndexResults(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

void type metadata accessor for SQLVirtualTableIndexResults()
{
}

uint64_t initializeWithCopy for SQLVirtualTableIndexResults.ConstraintUsage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  sub_25E0DB3C0();
  return a1;
}

uint64_t assignWithCopy for SQLVirtualTableIndexResults.ConstraintUsage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for SQLVirtualTableIndexResults.ConstraintUsage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLVirtualTableIndexResults.ConstraintUsage(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 41))
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

uint64_t storeEnumTagSinglePayload for SQLVirtualTableIndexResults.ConstraintUsage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SQLVirtualTableIndexResults.ConstraintUsage()
{
}

uint64_t _s13TableFunctionC19_VirtualTableCursorVwxx()
{
  return swift_release();
}

uint64_t _s13TableFunctionC19_VirtualTableCursorVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t _s13TableFunctionC19_VirtualTableCursorVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t _s13TableFunctionC19_VirtualTableCursorVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t _s13TableFunctionC19_VirtualTableCursorVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
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

uint64_t _s13TableFunctionC19_VirtualTableCursorVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *_s13TableFunctionC19_VirtualTableCursorVMa()
{
  return &_s13TableFunctionC19_VirtualTableCursorVN;
}

uint64_t _s13TableFunctionC13_VirtualTableVwxx()
{
  return swift_release();
}

uint64_t _s13TableFunctionC13_VirtualTableVwcp(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

uint64_t _s13TableFunctionC13_VirtualTableVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s13TableFunctionC13_VirtualTableVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_release();
  return a1;
}

uint64_t _s13TableFunctionC13_VirtualTableVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 24);
      if (v3 >= 0xFFFFFFFF) {
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

uint64_t _s13TableFunctionC13_VirtualTableVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *_s13TableFunctionC13_VirtualTableVMa()
{
  return &_s13TableFunctionC13_VirtualTableVN;
}

unint64_t sub_25E0BC1A4()
{
  unint64_t result = qword_26A6D5D00[0];
  if (!qword_26A6D5D00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6D5D00);
  }
  return result;
}

uint64_t sub_25E0BC1F4(uint64_t a1)
{
  return sub_25E0B962C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t (*)(void))_s13TableFunctionC13_VirtualTableV8FunctionVMa, (uint64_t)sub_25E0BC518, (uint64_t)&_s13TableFunctionC13_VirtualTableVN);
}

uint64_t sub_25E0BC244(uint64_t a1, uint64_t a2)
{
  return sub_25E0B8CA4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_25E0BC250(uint64_t a1, void *a2)
{
  return sub_25E0B9148(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_25E0BC25C(uint64_t a1)
{
  return sub_25E0B962C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t (*)(void))_s13TableFunctionC19_VirtualTableCursorV6CursorVMa, (uint64_t)sub_25E0BC448, (uint64_t)&_s13TableFunctionC19_VirtualTableCursorVN);
}

uint64_t sub_25E0BC2AC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_25E0B96F8(a1, a2, a3, a4, a5, a6, *(void *)(v6 + 16), *(void *)(v6 + 24));
}

uint64_t sub_25E0BC2B8(uint64_t a1)
{
  return sub_25E0B9C20(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25E0BC2C4(uint64_t a1, uint64_t a2, int a3)
{
  return sub_25E0B9E7C(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_25E0BC2CC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25E0BC304(sqlite3 *a1, uint64_t *a2)
{
  return sub_25E0BA2A8(a1, a2, v2[4], v2[2], v2[3]);
}

uint64_t _s13TableFunctionC13_VirtualTableV8FunctionVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E0BC340(uint64_t a1)
{
  return sub_25E0BA594(a1, v1[4], v1[2], v1[3]);
}

void sub_25E0BC364()
{
  if (!qword_26A6D4930)
  {
    unint64_t v0 = sub_25E0DB940();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6D4930);
    }
  }
}

uint64_t _s13TableFunctionC19_VirtualTableCursorV6CursorVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E0BC3C8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_25E0B9F38(a1, *(_DWORD *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_25E0BC3F0@<X0>(uint64_t a1@<X0>, int *a2@<X8>)
{
  return sub_25E0B9CBC(a1, a2);
}

uint64_t sub_25E0BC410@<X0>(uint64_t a1@<X0>, int *a2@<X8>)
{
  return sub_25E0B97CC(a1, *(_DWORD *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_25E0BC448()
{
  return sub_25E0B96C4();
}

uint64_t sub_25E0BC468(uint64_t a1)
{
  return sub_25E0B92B4(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_25E0BC48C(uint64_t a1)
{
  return sub_25E0B9374(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_25E0BC4B0@<X0>(uint64_t a1@<X0>, int *a2@<X8>)
{
  return sub_25E0B8D50(a1, *(int **)(v2 + 32), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_25E0BC4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25E0BC518()
{
  return sub_25E0B8C70();
}

uint64_t sub_25E0BC538()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = sub_25E0DBCF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25E0BC608(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v8 = *(void *)(v5 + 64);
  }
  else {
    size_t v8 = *(void *)(v5 + 64) + 1;
  }
  int v9 = v6 & 0x100000;
  if (v7 > 7 || v9 != 0 || ((v7 + 48) & ~v7) + v8 > 0x18)
  {
    uint64_t v12 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
    swift_retain();
  }
  else
  {
    uint64_t v13 = AssociatedTypeWitness;
    uint64_t v14 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v14;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 32) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
    v15 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
    v16 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
    void *v15 = *v16;
    v17 = (void *)(((unint64_t)v15 + v7 + 8) & ~v7);
    v18 = (const void *)(((unint64_t)v16 + v7 + 8) & ~v7);
    swift_retain();
    sub_25E0DB3C0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v13))
    {
      memcpy(v17, v18, v8);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v17, v18, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v13);
    }
  }
  return a1;
}

uint64_t sub_25E0BC7C0(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v3 = ((((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t result = __swift_getEnumTagSinglePayload(v3, 1, AssociatedTypeWitness);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
    return v5(v3, AssociatedTypeWitness);
  }
  return result;
}

uint64_t sub_25E0BC8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 32) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  uint64_t v4 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  int v9 = (void *)(((unint64_t)v4 + v8 + 8) & ~v8);
  v10 = (const void *)(((unint64_t)v5 + v8 + 8) & ~v8);
  swift_retain();
  sub_25E0DB3C0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v11 = *(void *)(v7 + 64);
    }
    else {
      size_t v11 = *(void *)(v7 + 64) + 1;
    }
    memcpy(v9, v10, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v9, v10, AssociatedTypeWitness);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

uint64_t sub_25E0BCA04(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 32) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  uint64_t v5 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (void *)(((unint64_t)v5 + v9 + 8) & ~v9);
  size_t v11 = (const void *)(((unint64_t)v6 + v9 + 8) & ~v9);
  LODWORD(v6) = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, AssociatedTypeWitness);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, AssociatedTypeWitness);
  if (v6)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v10, v11, AssociatedTypeWitness);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, AssociatedTypeWitness);
      return a1;
    }
    int v13 = *(_DWORD *)(v8 + 84);
    size_t v14 = *(void *)(v8 + 64);
  }
  else
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(v10, v11, AssociatedTypeWitness);
      return a1;
    }
    v16 = *(void (**)(void *, uint64_t))(v8 + 8);
    uint64_t v15 = v8 + 8;
    v16(v10, AssociatedTypeWitness);
    int v13 = *(_DWORD *)(v15 + 76);
    size_t v14 = *(void *)(v15 + 56);
  }
  if (v13) {
    size_t v17 = v14;
  }
  else {
    size_t v17 = v14 + 1;
  }
  memcpy(v10, v11, v17);
  return a1;
}

unint64_t sub_25E0BCBD0(unint64_t a1, unint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 32) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  uint64_t v3 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v4 = (void *)(((a2 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v3 = *v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (void *)(((unint64_t)v3 + v7 + 8) & ~v7);
  uint64_t v9 = (const void *)(((unint64_t)v4 + v7 + 8) & ~v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = *(void *)(v6 + 64) + 1;
    }
    memcpy(v8, v9, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v8, v9, AssociatedTypeWitness);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

uint64_t sub_25E0BCD04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  unint64_t v5 = a2 & 0xFFFFFFFFFFFFFFF8;
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF8) + 32) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  uint64_t v6 = (void *)(((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (void *)((v5 + 47) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v6 = *v7;
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  size_t v11 = (void *)(((unint64_t)v6 + v10 + 8) & ~v10);
  uint64_t v12 = (const void *)(((unint64_t)v7 + v10 + 8) & ~v10);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, AssociatedTypeWitness);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, AssociatedTypeWitness);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v11, v12, AssociatedTypeWitness);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, AssociatedTypeWitness);
      return a1;
    }
    int v15 = *(_DWORD *)(v9 + 84);
    size_t v16 = *(void *)(v9 + 64);
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(v11, v12, AssociatedTypeWitness);
      return a1;
    }
    v18 = *(void (**)(void *, uint64_t))(v9 + 8);
    uint64_t v17 = v9 + 8;
    v18(v11, AssociatedTypeWitness);
    int v15 = *(_DWORD *)(v17 + 76);
    size_t v16 = *(void *)(v17 + 56);
  }
  if (v15) {
    size_t v19 = v16;
  }
  else {
    size_t v19 = v16 + 1;
  }
  memcpy(v11, v12, v19);
  return a1;
}

uint64_t sub_25E0BCEB8(unint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (!v6) {
    ++v10;
  }
  if (!a2) {
    return 0;
  }
  if (a2 > v8)
  {
    uint64_t v11 = v10 + ((v9 + 48) & ~v9);
    char v12 = 8 * v11;
    if (v11 > 3) {
      goto LABEL_12;
    }
    unsigned int v15 = ((a2 - v8 + ~(-1 << v12)) >> v12) + 1;
    if (HIWORD(v15))
    {
      int v13 = *(_DWORD *)(a1 + v11);
      if (!v13) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      int v13 = *(unsigned __int16 *)(a1 + v11);
      if (!*(_WORD *)(a1 + v11)) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v15 >= 2)
    {
LABEL_12:
      int v13 = *(unsigned __int8 *)(a1 + v11);
      if (!*(unsigned char *)(a1 + v11)) {
        goto LABEL_28;
      }
LABEL_20:
      int v16 = (v13 - 1) << v12;
      if (v11 > 3) {
        int v16 = 0;
      }
      if (v11)
      {
        if (v11 > 3) {
          LODWORD(v11) = 4;
        }
        switch((int)v11)
        {
          case 2:
            LODWORD(v11) = *(unsigned __int16 *)a1;
            break;
          case 3:
            LODWORD(v11) = *(unsigned __int16 *)a1 | (*(unsigned __int8 *)(a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v11) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v11) = *(unsigned __int8 *)a1;
            break;
        }
      }
      int v18 = v8 + (v11 | v16);
      return (v18 + 1);
    }
  }
LABEL_28:
  if (v7 <= 0x7FFFFFFE)
  {
    unint64_t v17 = *(void *)(a1 + 8);
    if (v17 >= 0xFFFFFFFF) {
      LODWORD(v17) = -1;
    }
    int v18 = v17 - 1;
    if (v18 < 0) {
      int v18 = -1;
    }
    return (v18 + 1);
  }
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(((((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + v9 + 8) & ~v9, v6, AssociatedTypeWitness);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

void sub_25E0BD0BC(unint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  int v7 = 0;
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  unsigned int v10 = v9 - 1;
  if (!v9) {
    unsigned int v10 = 0;
  }
  if (v10 <= 0x7FFFFFFE) {
    unsigned int v11 = 2147483646;
  }
  else {
    unsigned int v11 = v10;
  }
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = (v12 + 48) & ~v12;
  if (v9) {
    size_t v14 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  }
  else {
    size_t v14 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 1;
  }
  size_t v15 = v13 + v14;
  char v16 = 8 * (v13 + v14);
  if (a3 > v11)
  {
    if (v15 <= 3)
    {
      unsigned int v17 = ((a3 - v11 + ~(-1 << v16)) >> v16) + 1;
      if (HIWORD(v17))
      {
        int v7 = 4;
      }
      else if (v17 >= 0x100)
      {
        int v7 = 2;
      }
      else
      {
        int v7 = v17 > 1;
      }
    }
    else
    {
      int v7 = 1;
    }
  }
  if (v11 < a2)
  {
    unsigned int v18 = ~v11 + a2;
    if (v15 < 4)
    {
      int v19 = (v18 >> v16) + 1;
      if (v15)
      {
        int v20 = v18 & ~(-1 << v16);
        bzero((void *)a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          *(unsigned char *)(a1 + 2) = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *(unsigned char *)a1 = v20;
        }
      }
    }
    else
    {
      bzero((void *)a1, v15);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v7)
    {
      case 1:
        *(unsigned char *)(a1 + v15) = v19;
        return;
      case 2:
        *(_WORD *)(a1 + v15) = v19;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)(a1 + v15) = v19;
        return;
      default:
        return;
    }
  }
  switch(v7)
  {
    case 1:
      *(unsigned char *)(a1 + v15) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 2:
      *(_WORD *)(a1 + v15) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x25E0BD3ECLL);
    case 4:
      *(_DWORD *)(a1 + v15) = 0;
      goto LABEL_28;
    default:
LABEL_28:
      if (a2)
      {
LABEL_29:
        if (v10 > 0x7FFFFFFE)
        {
          v21 = (unsigned char *)(((((a1 & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + v12 + 8) & ~v12);
          if (v10 >= a2)
          {
            __swift_storeEnumTagSinglePayload((uint64_t)v21, a2 + 1, v9, AssociatedTypeWitness);
          }
          else
          {
            if (v14 <= 3) {
              int v22 = ~(-1 << (8 * v14));
            }
            else {
              int v22 = -1;
            }
            if (v14)
            {
              int v23 = v22 & (~v10 + a2);
              if (v14 <= 3) {
                int v24 = v14;
              }
              else {
                int v24 = 4;
              }
              bzero(v21, v14);
              switch(v24)
              {
                case 2:
                  *(_WORD *)v21 = v23;
                  break;
                case 3:
                  *(_WORD *)v21 = v23;
                  v21[2] = BYTE2(v23);
                  break;
                case 4:
                  *(_DWORD *)v21 = v23;
                  break;
                default:
                  unsigned char *v21 = v23;
                  break;
              }
            }
          }
        }
        else if (a2 > 0x7FFFFFFE)
        {
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(unsigned char *)(a1 + 24) = 0;
          *(void *)a1 = a2 - 0x7FFFFFFF;
        }
        else
        {
          *(void *)(a1 + 8) = a2;
        }
      }
      return;
  }
}

uint64_t sub_25E0BD424()
{
  uint64_t result = sub_25E0DBCF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25E0BD4C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v9 = *(void *)(v5 + 64);
  }
  else {
    size_t v9 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v10 = ((v7 + 32) & ~(unint64_t)v7) + v9;
  int v11 = v7 & 0x100000;
  if (v8 > 7 || v11 != 0 || v10 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v15 = a2[3];
    v3[2] = a2[2];
    v3[3] = v15;
    char v16 = (void *)(((unint64_t)v3 + v8 + 32) & ~v8);
    unsigned int v17 = (const void *)(((unint64_t)a2 + v8 + 32) & ~v8);
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v4))
    {
      memcpy(v16, v17, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v16, v17, v4);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v4);
    }
  }
  return v3;
}

uint64_t sub_25E0BD618(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(v4 - 8);
  unint64_t v5 = (a1 + *(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v4);
  if (!result)
  {
    int v7 = *(uint64_t (**)(unint64_t, uint64_t))(v8 + 8);
    return v7(v5, v4);
  }
  return result;
}

uint64_t sub_25E0BD6D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (void *)((v7 + 32 + a1) & ~v7);
  size_t v9 = (const void *)((v7 + 32 + a2) & ~v7);
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = *(void *)(v6 + 64) + 1;
    }
    memcpy(v8, v9, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v8, v9, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_25E0BD7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  size_t v9 = (void *)((v8 + 32 + a1) & ~v8);
  size_t v10 = (const void *)((v8 + 32 + a2) & ~v8);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v6);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v9, v10, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
      return a1;
    }
    int v13 = *(_DWORD *)(v7 + 84);
    size_t v14 = *(void *)(v7 + 64);
  }
  else
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 24))(v9, v10, v6);
      return a1;
    }
    char v16 = *(void (**)(void *, uint64_t))(v7 + 8);
    uint64_t v15 = v7 + 8;
    v16(v9, v6);
    int v13 = *(_DWORD *)(v15 + 76);
    size_t v14 = *(void *)(v15 + 56);
  }
  if (v13) {
    size_t v17 = v14;
  }
  else {
    size_t v17 = v14 + 1;
  }
  memcpy(v9, v10, v17);
  return a1;
}

_OWORD *sub_25E0BD944(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (void *)(((unint64_t)a1 + v7 + 32) & ~v7);
  size_t v9 = (const void *)(((unint64_t)a2 + v7 + 32) & ~v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = *(void *)(v6 + 64) + 1;
    }
    memcpy(v8, v9, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v8, v9, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_25E0BDA2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_release();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  size_t v10 = (void *)((v9 + 32 + a1) & ~v9);
  int v11 = (const void *)((v9 + 32 + a2) & ~v9);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v7);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v7);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v10, v11, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v7);
      return a1;
    }
    int v14 = *(_DWORD *)(v8 + 84);
    size_t v15 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(v10, v11, v7);
      return a1;
    }
    size_t v17 = *(void (**)(void *, uint64_t))(v8 + 8);
    uint64_t v16 = v8 + 8;
    v17(v10, v7);
    int v14 = *(_DWORD *)(v16 + 76);
    size_t v15 = *(void *)(v16 + 56);
  }
  if (v14) {
    size_t v18 = v15;
  }
  else {
    size_t v18 = v15 + 1;
  }
  memcpy(v10, v11, v18);
  return a1;
}

uint64_t sub_25E0BDB94(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!v6) {
    ++v10;
  }
  if (!a2) {
    return 0;
  }
  int v11 = a2 - v8;
  if (a2 > v8)
  {
    uint64_t v12 = v10 + ((v9 + 32) & ~v9);
    char v13 = 8 * v12;
    if (v12 > 3) {
      goto LABEL_12;
    }
    unsigned int v16 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v16))
    {
      int v14 = *(_DWORD *)((char *)a1 + v12);
      if (!v14) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v16 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)((char *)a1 + v12);
      if (!*(unsigned __int16 *)((char *)a1 + v12)) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v16 >= 2)
    {
LABEL_12:
      int v14 = *((unsigned __int8 *)a1 + v12);
      if (!*((unsigned char *)a1 + v12)) {
        goto LABEL_28;
      }
LABEL_20:
      int v17 = (v14 - 1) << v13;
      if (v12 > 3) {
        int v17 = 0;
      }
      if (v12)
      {
        if (v12 > 3) {
          LODWORD(v12) = 4;
        }
        switch((int)v12)
        {
          case 2:
            LODWORD(v12) = *a1;
            break;
          case 3:
            LODWORD(v12) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v12) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v12) = *(unsigned __int8 *)a1;
            break;
        }
      }
      int v19 = v8 + (v12 | v17);
      return (v19 + 1);
    }
  }
LABEL_28:
  if (v7 <= 0x7FFFFFFE)
  {
    unint64_t v18 = *((void *)a1 + 3);
    if (v18 >= 0xFFFFFFFF) {
      LODWORD(v18) = -1;
    }
    int v19 = v18 - 1;
    if (v19 < 0) {
      int v19 = -1;
    }
    return (v19 + 1);
  }
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(((unint64_t)a1 + v9 + 32) & ~v9, v6, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

void sub_25E0BDD64(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  unsigned int v10 = v9 - 1;
  if (!v9) {
    unsigned int v10 = 0;
  }
  if (v10 <= 0x7FFFFFFE) {
    unsigned int v11 = 2147483646;
  }
  else {
    unsigned int v11 = v10;
  }
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  size_t v14 = *(void *)(*(void *)(v7 - 8) + 64);
  if (!v9) {
    ++v14;
  }
  size_t v15 = v13 + v14;
  char v16 = 8 * (v13 + v14);
  BOOL v17 = a3 >= v11;
  unsigned int v18 = a3 - v11;
  if (v18 != 0 && v17)
  {
    if (v15 <= 3)
    {
      unsigned int v19 = ((v18 + ~(-1 << v16)) >> v16) + 1;
      if (HIWORD(v19))
      {
        int v6 = 4;
      }
      else if (v19 >= 0x100)
      {
        int v6 = 2;
      }
      else
      {
        int v6 = v19 > 1;
      }
    }
    else
    {
      int v6 = 1;
    }
  }
  if (v11 < a2)
  {
    unsigned int v20 = ~v11 + a2;
    if (v15 < 4)
    {
      int v21 = (v20 >> v16) + 1;
      if (v15)
      {
        int v22 = v20 & ~(-1 << v16);
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v22;
          a1[2] = BYTE2(v22);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v22;
        }
        else
        {
          *a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v20;
      int v21 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v15] = v21;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v21;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v15] = v21;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_29;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x25E0BE068);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_28;
    default:
LABEL_28:
      if (a2)
      {
LABEL_29:
        if (v10 > 0x7FFFFFFE)
        {
          int v23 = (unsigned char *)((unint64_t)&a1[v12 + 32] & ~v12);
          if (v10 >= a2)
          {
            uint64_t v27 = a2 + 1;
            unint64_t v28 = (unint64_t)&a1[v12 + 32] & ~v12;
            __swift_storeEnumTagSinglePayload(v28, v27, v9, v7);
          }
          else
          {
            if (v14 <= 3) {
              int v24 = ~(-1 << (8 * v14));
            }
            else {
              int v24 = -1;
            }
            if (v14)
            {
              int v25 = v24 & (~v10 + a2);
              if (v14 <= 3) {
                int v26 = v14;
              }
              else {
                int v26 = 4;
              }
              bzero(v23, v14);
              switch(v26)
              {
                case 2:
                  *(_WORD *)int v23 = v25;
                  break;
                case 3:
                  *(_WORD *)int v23 = v25;
                  v23[2] = BYTE2(v25);
                  break;
                case 4:
                  *(_DWORD *)int v23 = v25;
                  break;
                default:
                  *int v23 = v25;
                  break;
              }
            }
          }
        }
        else if (a2 > 0x7FFFFFFE)
        {
          *((void *)a1 + 2) = 0;
          *((void *)a1 + 3) = 0;
          *(void *)a1 = a2 - 0x7FFFFFFF;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 3) = a2;
        }
      }
      return;
  }
}

uint64_t static SonicFeatureFlag.== infix(_:_:)()
{
  uint64_t v0 = sub_25E0DBEB0();
  uint64_t v2 = v1;
  if (v0 == sub_25E0DBEB0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25E0DC380();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t SonicFeatureFlag.description.getter()
{
  return sub_25E0DBEB0();
}

uint64_t sub_25E0BE160(uint64_t a1)
{
  return SonicFeatureFlag.init(stringLiteral:)(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t RawRepresentable<>.feature.getter()
{
  sub_25E0DB7E0();
  return v1;
}

uint64_t FeatureFlagsKey.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  v6[3] = a1;
  v6[4] = a2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v6);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_0, v2, v3);
  LOBYTE(v3) = sub_25E0DAFA0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v3 & 1;
}

unint64_t sub_25E0BE224()
{
  unint64_t result = qword_26A6D5E08;
  if (!qword_26A6D5E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E08);
  }
  return result;
}

uint64_t sub_25E0BE270()
{
  return MEMORY[0x263F8DC38];
}

unint64_t sub_25E0BE280()
{
  unint64_t result = qword_26A6D5E10;
  if (!qword_26A6D5E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E10);
  }
  return result;
}

uint64_t sub_25E0BE2CC()
{
  return MEMORY[0x263F8DC50];
}

uint64_t sub_25E0BE2D8()
{
  return MEMORY[0x263F8DC48];
}

uint64_t getEnumTagSinglePayload for SonicFeatureFlag(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SonicFeatureFlag(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SonicFeatureFlag()
{
  return &type metadata for SonicFeatureFlag;
}

uint64_t sub_25E0BE344()
{
  uint64_t v0 = sub_25E0DAEA0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SQLDatabase.Location(0);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v4);
  int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SQLDatabase.AttachedLocation();
  sub_25E0BF4D8();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v6, v0);
    uint64_t v7 = sub_25E0DADF0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0xE000000000000000;
    sub_25E0DBE80();
    swift_bridgeObjectRelease();
    uint64_t v9 = 0x3A656C6966;
    unint64_t v10 = 0xE500000000000000;
    sub_25E0DB630();
    swift_bridgeObjectRelease();
    sub_25E0DB630();
    return v9;
  }
  return v7;
}

uint64_t SQLDatabase.AttachedLocation.name.getter()
{
  uint64_t v1 = *v0;
  sub_25E0DB3C0();
  return v1;
}

uint64_t SQLDatabase.AttachedLocation.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

double (*SQLDatabase.AttachedLocation.name.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.AttachedLocation.location.getter()
{
  return sub_25E0BF4D8();
}

uint64_t type metadata accessor for SQLDatabase.AttachedLocation()
{
  uint64_t result = qword_26A6D5E28;
  if (!qword_26A6D5E28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SQLDatabase.AttachedLocation.location.setter()
{
  return sub_25E0BF584();
}

double (*SQLDatabase.AttachedLocation.location.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.attach(name:location:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  uint64_t v5 = type metadata accessor for SQLDatabase.AttachedLocation();
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E0BE7A4, v3, 0);
}

uint64_t sub_25E0BE7A4()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = (void *)v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[5];
  sub_25E0BF4D8();
  *uint64_t v1 = v5;
  v1[1] = v4;
  int v6 = (uint64_t *)(v3 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_attachedLocations);
  OUTLINED_FUNCTION_2_9();
  sub_25E0DB3C0();
  sub_25E06AE58();
  uint64_t v7 = *(void *)(*v6 + 16);
  sub_25E06AF14(v7);
  uint64_t v8 = *v6;
  *(void *)(v8 + 16) = v7 + 1;
  sub_25E0BE988((uint64_t)v1, v8+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v7);
  swift_endAccess();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t SQLDatabase.detach(name:)(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  return MEMORY[0x270FA2498](sub_25E0BE8CC, v2, 0);
}

uint64_t sub_25E0BE8CC()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_attachedLocations);
  OUTLINED_FUNCTION_2_9();
  sub_25E0DB3C0();
  uint64_t result = sub_25E0BE9EC(v4, v3, v2);
  uint64_t v6 = *(void *)(*v4 + 16);
  if (v6 < result)
  {
    __break(1u);
  }
  else
  {
    sub_25E073E20(result, v6);
    swift_endAccess();
    return OUTLINED_FUNCTION_0_15();
  }
  return result;
}

uint64_t sub_25E0BE988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SQLDatabase.AttachedLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E0BE9EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for SQLDatabase.AttachedLocation() - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v36 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v35 = (char *)v32 - v11;
  MEMORY[0x270FA5388](v10);
  size_t v14 = (void *)((char *)v32 - v13);
  uint64_t v15 = *a1;
  uint64_t v16 = *(void *)(*a1 + 16);
  if (!v16)
  {
    unint64_t v17 = 0;
    goto LABEL_36;
  }
  v33 = a1;
  unint64_t v17 = 0;
  unint64_t v18 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = *(void *)(v12 + 72);
  unint64_t v34 = v18;
  while (1)
  {
    uint64_t result = *(void *)(v15 + v18);
    if (result == a2 && *(void *)(v15 + v18 + 8) == a3) {
      break;
    }
    uint64_t result = sub_25E0DC380();
    if (result) {
      break;
    }
    ++v17;
    v18 += v19;
    if (v16 == v17)
    {
      unint64_t v17 = *(void *)(v15 + 16);
      goto LABEL_36;
    }
  }
  if (__OFADD__(v17, 1)) {
    goto LABEL_45;
  }
  unint64_t v22 = *(void *)(v15 + 16);
  if (v17 + 1 == v22)
  {
LABEL_36:
    swift_bridgeObjectRelease();
    return v17;
  }
  v32[1] = v3;
  uint64_t v23 = v19 + v18;
  unint64_t v24 = v17 + 1;
  int v25 = v33;
  while (v24 < v22)
  {
    sub_25E0BF4D8();
    if (*v14 == a2 && v14[1] == a3)
    {
      uint64_t result = sub_25E0BF52C((uint64_t)v14, (void (*)(void))type metadata accessor for SQLDatabase.AttachedLocation);
    }
    else
    {
      char v27 = sub_25E0DC380();
      uint64_t result = sub_25E0BF52C((uint64_t)v14, (void (*)(void))type metadata accessor for SQLDatabase.AttachedLocation);
      if ((v27 & 1) == 0)
      {
        if (v24 != v17)
        {
          if ((v17 & 0x8000000000000000) != 0) {
            goto LABEL_40;
          }
          uint64_t v28 = *v25;
          unint64_t v29 = *(void *)(*v25 + 16);
          if (v17 >= v29) {
            goto LABEL_41;
          }
          v32[2] = v17 * v19;
          uint64_t result = sub_25E0BF4D8();
          if (v24 >= v29) {
            goto LABEL_42;
          }
          sub_25E0BF4D8();
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          int v25 = v33;
          uint64_t *v33 = v28;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_25E0C2A90();
            uint64_t v28 = result;
            *int v25 = result;
          }
          if (v17 >= *(void *)(v28 + 16)) {
            goto LABEL_43;
          }
          uint64_t result = sub_25E0BF584();
          if (v24 >= *(void *)(*v25 + 16)) {
            goto LABEL_44;
          }
          uint64_t result = sub_25E0BF584();
        }
        if (__OFADD__(v17++, 1)) {
          goto LABEL_39;
        }
      }
    }
    unint64_t v31 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      goto LABEL_38;
    }
    unint64_t v22 = *(void *)(*v25 + 16);
    ++v24;
    v23 += v19;
    if (v31 == v22) {
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t *_s16AttachedLocationVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    type metadata accessor for SQLDatabase.Location(0);
    sub_25E0DB3C0();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_25E0DAEA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      uint64_t v11 = v8[1];
      *uint64_t v7 = *v8;
      v7[1] = v11;
      sub_25E0DB3C0();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t _s16AttachedLocationVwxx(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  type metadata accessor for SQLDatabase.Location(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25E0DAEA0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

void *_s16AttachedLocationVwcp(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  type metadata accessor for SQLDatabase.Location(0);
  sub_25E0DB3C0();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_25E0DAEA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    uint64_t v9 = v7[1];
    *uint64_t v6 = *v7;
    v6[1] = v9;
    sub_25E0DB3C0();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *_s16AttachedLocationVwca(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_25E0BF52C((uint64_t)a1 + v6, (void (*)(void))type metadata accessor for SQLDatabase.Location);
    type metadata accessor for SQLDatabase.Location(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_25E0DAEA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      v7[1] = v8[1];
      sub_25E0DB3C0();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *_s16AttachedLocationVwtk(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for SQLDatabase.Location(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_25E0DAEA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *_s16AttachedLocationVwta(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_25E0BF52C((uint64_t)a1 + v7, (void (*)(void))type metadata accessor for SQLDatabase.Location);
    uint64_t v10 = type metadata accessor for SQLDatabase.Location(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_25E0DAEA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s16AttachedLocationVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E0BF324);
}

uint64_t sub_25E0BF324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for SQLDatabase.Location(0);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t _s16AttachedLocationVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E0BF3C0);
}

uint64_t sub_25E0BF3C0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for SQLDatabase.Location(0);
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25E0BF440()
{
  uint64_t result = type metadata accessor for SQLDatabase.Location(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25E0BF4D8()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_13();
  v3(v2);
  OUTLINED_FUNCTION_6_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_25E0BF52C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_6_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25E0BF584()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_13();
  v3(v2);
  OUTLINED_FUNCTION_6_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v0, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_beginAccess();
}

uint64_t static SQLError.Code.== infix(_:_:)(int *a1, int *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  int v4 = *((unsigned __int8 *)a2 + 4);
  switch(*((unsigned char *)a1 + 4))
  {
    case 1:
      if (v4 != 1) {
        return 0;
      }
      goto LABEL_41;
    case 2:
      if (v4 != 2) {
        return 0;
      }
      goto LABEL_27;
    case 3:
      if (v4 != 3) {
        return 0;
      }
      goto LABEL_45;
    case 4:
      if (v4 != 4) {
        return 0;
      }
      goto LABEL_27;
    case 5:
      if (v4 != 5) {
        return 0;
      }
      goto LABEL_41;
    case 6:
      if (v4 != 6) {
        return 0;
      }
      goto LABEL_31;
    case 7:
      if (v4 != 7) {
        return 0;
      }
      int v7 = *a2;
      if (*a1 != 33)
      {
        BOOL v12 = v7 == 33;
        goto LABEL_55;
      }
      if (v7 == 33) {
        return OUTLINED_FUNCTION_1_7();
      }
      return 0;
    case 8:
      if (v4 != 8) {
        return 0;
      }
LABEL_27:
      int v8 = *a2;
      if (*a1 != 3)
      {
        BOOL v12 = v8 == 3;
        goto LABEL_55;
      }
      if (v8 == 3) {
        return OUTLINED_FUNCTION_1_7();
      }
      return 0;
    case 9:
      if (v4 != 9) {
        return 0;
      }
LABEL_31:
      int v9 = *a2;
      if (*a1 != 6)
      {
        BOOL v12 = v9 == 6;
        goto LABEL_55;
      }
      if (v9 == 6) {
        return OUTLINED_FUNCTION_1_7();
      }
      return 0;
    case 0xA:
      if (v4 != 10) {
        return 0;
      }
      int v10 = *a2;
      if (*a1 != 12)
      {
        BOOL v12 = v10 == 12;
LABEL_55:
        int v13 = (v3 ^ v2);
        goto LABEL_56;
      }
      if (v10 == 12) {
        return OUTLINED_FUNCTION_1_7();
      }
      return 0;
    case 0xB:
      if (v4 != 11) {
        return 0;
      }
      goto LABEL_45;
    case 0xC:
      if (v4 != 12) {
        return 0;
      }
LABEL_41:
      int v11 = *a2;
      if (*a1 == 2)
      {
        if (v11 == 2) {
          return OUTLINED_FUNCTION_1_7();
        }
      }
      else
      {
        int v13 = (v3 ^ v2) & 1;
        BOOL v12 = v11 == 2;
LABEL_56:
        if (!v12 && v13 == 0) {
          return OUTLINED_FUNCTION_1_7();
        }
      }
      return 0;
    case 0xD:
      if (v4 != 13) {
        return 0;
      }
LABEL_45:
      if (v2)
      {
        if (v3) {
          return OUTLINED_FUNCTION_1_7();
        }
      }
      else if ((v3 & 1) == 0)
      {
        return OUTLINED_FUNCTION_1_7();
      }
      return 0;
    case 0xE:
      switch(*a1)
      {
        case 1:
          if (v4 != 14 || v3 != 1) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 2:
          if (v4 != 14 || v3 != 2) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 3:
          if (v4 != 14 || v3 != 3) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 4:
          if (v4 != 14 || v3 != 4) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 5:
          if (v4 != 14 || v3 != 5) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 6:
          if (v4 != 14 || v3 != 6) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 7:
          if (v4 != 14 || v3 != 7) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 8:
          if (v4 != 14 || v3 != 8) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 9:
          if (v4 != 14 || v3 != 9) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 10:
          if (v4 != 14 || v3 != 10) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 11:
          if (v4 != 14 || v3 != 11) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 12:
          if (v4 != 14 || v3 != 12) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 13:
          if (v4 != 14 || v3 != 13) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 14:
          if (v4 != 14 || v3 != 14) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 15:
          if (v4 != 14 || v3 != 15) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 16:
          if (v4 != 14 || v3 != 16) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        case 17:
          if (v4 != 14 || v3 != 17) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
        default:
          if (v4 != 14 || v3 != 0) {
            return 0;
          }
          return OUTLINED_FUNCTION_1_7();
      }
    default:
      if (*((unsigned char *)a2 + 4)) {
        return 0;
      }
      return v2 == v3;
  }
}

uint64_t sub_25E0BF968@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2 = 0;
  int v3 = result & 0xFFFFFF00;
  char v4 = 14;
  switch((char)result)
  {
    case 0:
      char v4 = 1;
      BOOL v5 = v3 == 512;
      char v6 = 1;
      char v7 = 1;
      if (v3 == 512) {
        int v8 = 1;
      }
      else {
        int v8 = 2;
      }
      goto LABEL_65;
    case 1:
      if (v3 == 512) {
        int v9 = 1;
      }
      else {
        int v9 = 3;
      }
      if (v3 == 768) {
        int v9 = 2;
      }
      if (v3 == 256) {
        unsigned int v2 = 0;
      }
      else {
        unsigned int v2 = v9;
      }
      char v4 = 2;
      break;
    case 2:
      break;
    case 3:
      unsigned int v2 = 1;
      break;
    case 4:
      unsigned int v2 = v3 != 512;
      char v4 = 3;
      break;
    case 5:
      char v4 = 4;
      char v10 = 4;
      BOOL v11 = v3 == 512;
      char v7 = 4;
      char v12 = 4;
      goto LABEL_28;
    case 6:
      char v4 = 5;
      BOOL v5 = v3 == 512;
      char v6 = 5;
      char v7 = 5;
      goto LABEL_62;
    case 7:
      unsigned int v2 = 2;
      break;
    case 8:
      unsigned int v2 = (v3 - 256) >> 8;
      char v4 = 6;
      if (v2 >= 6) {
        unsigned int v2 = 6;
      }
      break;
    case 9:
      unsigned int v2 = 3;
      break;
    case 10:
      if ((v3 - 256) >> 8 >= 0x21) {
        unsigned int v2 = 33;
      }
      else {
        unsigned int v2 = (v3 - 256) >> 8;
      }
      char v4 = 7;
      break;
    case 11:
      char v4 = 8;
      char v10 = 8;
      BOOL v11 = v3 == 512;
      char v7 = 8;
      char v12 = 8;
LABEL_28:
      if (v11) {
        int v13 = 1;
      }
      else {
        int v13 = 3;
      }
      if (v11) {
        char v7 = v12;
      }
      if (v3 == 768) {
        int v8 = 2;
      }
      else {
        int v8 = v13;
      }
      if (v3 == 768) {
        char v7 = v10;
      }
      goto LABEL_67;
    case 12:
      unsigned int v2 = 4;
      break;
    case 13:
      unsigned int v2 = 5;
      break;
    case 14:
      if ((v3 - 256) >> 8 >= 6) {
        unsigned int v2 = 6;
      }
      else {
        unsigned int v2 = (v3 - 256) >> 8;
      }
      char v4 = 9;
      break;
    case 15:
      unsigned int v2 = 6;
      break;
    case 16:
      unsigned int v2 = 7;
      break;
    case 17:
      unsigned int v2 = 8;
      break;
    case 18:
      unsigned int v2 = 9;
      break;
    case 19:
      if ((v3 - 256) >> 8 >= 0xC) {
        unsigned int v2 = 12;
      }
      else {
        unsigned int v2 = (v3 - 256) >> 8;
      }
      char v4 = 10;
      break;
    case 20:
      unsigned int v2 = 10;
      break;
    case 21:
      unsigned int v2 = 11;
      break;
    case 22:
      unsigned int v2 = 12;
      break;
    case 23:
      unsigned int v2 = v3 != 256;
      char v4 = 11;
      break;
    case 24:
      unsigned int v2 = 13;
      break;
    case 25:
      unsigned int v2 = 14;
      break;
    case 26:
      unsigned int v2 = 15;
      break;
    case 27:
      char v4 = 12;
      BOOL v5 = v3 == 512;
      char v6 = 12;
      char v7 = 12;
LABEL_62:
      if (v5) {
        int v8 = 1;
      }
      else {
        int v8 = 2;
      }
LABEL_65:
      if (!v5) {
        char v7 = v6;
      }
LABEL_67:
      if (v3 == 256) {
        unsigned int v2 = 0;
      }
      else {
        unsigned int v2 = v8;
      }
      if (v3 != 256) {
        char v4 = v7;
      }
      break;
    case 28:
      unsigned int v2 = v3 != 256;
      char v4 = 13;
      break;
    default:
      unsigned int v2 = result;
      char v4 = 0;
      break;
  }
  *(_DWORD *)a2 = v2;
  *(unsigned char *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_25E0BFC9C()
{
  return SQLError.Code.Extended.Auth.hashValue.getter();
}

uint64_t sub_25E0BFCB4()
{
  return SQLError.Code.Extended.Auth.hash(into:)();
}

BOOL static SQLError.Code.Extended.Constraint.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SQLError.Code.Extended.Constraint.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t _s15SonicFoundation8SQLErrorV4CodeO8ExtendedO7GenericO9hashValueSivg_0()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0BFD54()
{
  return sub_25E0DC500();
}

uint64_t SQLError.Code.Extended.Auth.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t _s15SonicFoundation8SQLErrorV4CodeO8ExtendedO5AbortO9hashValueSivg_0()
{
  return sub_25E0DC500();
}

BOOL static SQLError.Code.Extended.OK.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SQLError.Code.Extended.OK.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t SQLError.codeValue.getter()
{
  return *v0;
}

uint64_t SQLError.codeValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

double (*SQLError.codeValue.modify())(void)
{
  return nullsub_1;
}

void SQLError.code.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 4);
  *(unsigned char *)(a1 + 4) = v2;
}

uint64_t SQLError.code.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 4);
  *(_DWORD *)(v1 + 4) = *(_DWORD *)result;
  *(unsigned char *)(v1 + 8) = v2;
  return result;
}

double (*SQLError.code.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLError.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25E0DB3C0();
  return v1;
}

uint64_t SQLError.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

double (*SQLError.name.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLError.message.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_25E0DB3C0();
  return v1;
}

uint64_t SQLError.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

double (*SQLError.message.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25E0BFFE4(uint64_t a1)
{
  unint64_t v2 = sub_25E0C1130();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_25E0C0020(uint64_t a1)
{
  unint64_t v2 = sub_25E0C1130();

  return MEMORY[0x270EF2668](a1, v2);
}

unint64_t static SQLError.errorDomain.getter()
{
  return 0xD000000000000017;
}

uint64_t SQLError.errorCode.getter()
{
  return *v0;
}

uint64_t SQLError.errorUserInfo.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  sub_25E0963BC();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E0DD9C0;
  *(void *)(inited + 32) = sub_25E0DB500();
  *(void *)(inited + 40) = v4;
  sub_25E0DB3C0();
  sub_25E0DB630();
  sub_25E0DB3C0();
  sub_25E0DB630();
  swift_bridgeObjectRelease();
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v1;
  return sub_25E0DB3A0();
}

unint64_t sub_25E0C0164()
{
  unint64_t result = qword_26A6D5E38;
  if (!qword_26A6D5E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E38);
  }
  return result;
}

unint64_t sub_25E0C01B4()
{
  unint64_t result = qword_26A6D5E40;
  if (!qword_26A6D5E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E40);
  }
  return result;
}

unint64_t sub_25E0C0204()
{
  unint64_t result = qword_26A6D5E48;
  if (!qword_26A6D5E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E48);
  }
  return result;
}

unint64_t sub_25E0C0254()
{
  unint64_t result = qword_26A6D5E50;
  if (!qword_26A6D5E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E50);
  }
  return result;
}

unint64_t sub_25E0C02A4()
{
  unint64_t result = qword_26A6D5E58;
  if (!qword_26A6D5E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E58);
  }
  return result;
}

unint64_t sub_25E0C02F4()
{
  unint64_t result = qword_26A6D5E60;
  if (!qword_26A6D5E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E60);
  }
  return result;
}

unint64_t sub_25E0C0344()
{
  unint64_t result = qword_26A6D5E68;
  if (!qword_26A6D5E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E68);
  }
  return result;
}

unint64_t sub_25E0C0394()
{
  unint64_t result = qword_26A6D5E70;
  if (!qword_26A6D5E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E70);
  }
  return result;
}

unint64_t sub_25E0C03E4()
{
  unint64_t result = qword_26A6D5E78;
  if (!qword_26A6D5E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E78);
  }
  return result;
}

unint64_t sub_25E0C0434()
{
  unint64_t result = qword_26A6D5E80;
  if (!qword_26A6D5E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E80);
  }
  return result;
}

unint64_t sub_25E0C0484()
{
  unint64_t result = qword_26A6D5E88;
  if (!qword_26A6D5E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E88);
  }
  return result;
}

unint64_t sub_25E0C04D4()
{
  unint64_t result = qword_26A6D5E90;
  if (!qword_26A6D5E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E90);
  }
  return result;
}

unint64_t sub_25E0C0524()
{
  unint64_t result = qword_26A6D5E98;
  if (!qword_26A6D5E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5E98);
  }
  return result;
}

unint64_t sub_25E0C0574()
{
  return 0xD000000000000017;
}

uint64_t destroy for SQLError()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = v3;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  return a1;
}

uint64_t assignWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  int v4 = *(_DWORD *)(a2 + 4);
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_DWORD *)(a1 + 4) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQLError(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = v4;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for SQLError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SQLError()
{
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLError.Code(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xF2 && *(unsigned char *)(a1 + 5))
    {
      int v2 = *(_DWORD *)a1 + 241;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
      if (v3 <= 0xE) {
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

uint64_t storeEnumTagSinglePayload for SQLError.Code(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF1)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 242;
    if (a3 >= 0xF2) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF2) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25E0C0838(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 4) <= 0xDu) {
    return *(unsigned __int8 *)(a1 + 4);
  }
  else {
    return (*(_DWORD *)a1 + 14);
  }
}

uint64_t sub_25E0C0850(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xE)
  {
    *(_DWORD *)unint64_t result = a2 - 14;
    LOBYTE(a2) = 14;
  }
  *(unsigned char *)(result + 4) = a2;
  return result;
}

void type metadata accessor for SQLError.Code()
{
}

void type metadata accessor for SQLError.Code.Extended()
{
}

void type metadata accessor for SQLError.Code.Extended.Generic()
{
}

uint64_t getEnumTagSinglePayload for SQLError.Code.Extended.IO(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE0)
  {
    if (a2 + 32 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 32) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 33;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x21;
  int v5 = v6 - 33;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SQLError.Code.Extended.IO(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 32 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 32) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDF)
  {
    unsigned int v6 = ((a2 - 224) >> 8) + 1;
    *unint64_t result = a2 + 32;
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
        JUMPOUT(0x25E0C09E8);
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
          *unint64_t result = a2 + 32;
        break;
    }
  }
  return result;
}

void type metadata accessor for SQLError.Code.Extended.IO()
{
}

void type metadata accessor for SQLError.Code.Extended.Locked()
{
}

void type metadata accessor for SQLError.Code.Extended.Busy()
{
}

void type metadata accessor for SQLError.Code.Extended.CantOpen()
{
}

uint64_t _s15SonicFoundation8SQLErrorV4CodeO8ExtendedO7GenericOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_2_10(-1);
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
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 3);
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
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_2_10(v8);
}

unsigned char *_s15SonicFoundation8SQLErrorV4CodeO8ExtendedO7GenericOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_7_16((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_4_13((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E0C0B90);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_5_15((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_6_14(result, a2 + 2);
        break;
    }
  }
  return result;
}

void type metadata accessor for SQLError.Code.Extended.Corrupt()
{
}

uint64_t _s15SonicFoundation8SQLErrorV4CodeO8ExtendedO8ReadOnlyOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_2_10(-1);
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
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 6);
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
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 6);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 6);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_2_10(v8);
}

unsigned char *_s15SonicFoundation8SQLErrorV4CodeO8ExtendedO8ReadOnlyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_7_16((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_4_13((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E0C0D04);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_5_15((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_6_14(result, a2 + 5);
        break;
    }
  }
  return result;
}

void type metadata accessor for SQLError.Code.Extended.ReadOnly()
{
}

void type metadata accessor for SQLError.Code.Extended.Abort()
{
}

uint64_t getEnumTagSinglePayload for SQLError.Code.Extended.Constraint(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 11) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v5 = v6 - 12;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SQLError.Code.Extended.Constraint(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x25E0C0EA0);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

void type metadata accessor for SQLError.Code.Extended.Constraint()
{
}

void type metadata accessor for SQLError.Code.Extended.Notice()
{
}

void type metadata accessor for SQLError.Code.Extended.Warning()
{
}

unsigned char *_s15SonicFoundation8SQLErrorV4CodeO8ExtendedO5AbortOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E0C0F88);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for SQLError.Code.Extended.Auth()
{
}

uint64_t _s15SonicFoundation8SQLErrorV4CodeO8ExtendedO2OKOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_2_10(-1);
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
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_2_10((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_2_10(v8);
}

unsigned char *_s15SonicFoundation8SQLErrorV4CodeO8ExtendedO2OKOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_7_16((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_4_13((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E0C10FCLL);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_5_15((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_6_14(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for SQLError.Code.Extended.OK()
{
}

unint64_t sub_25E0C1130()
{
  unint64_t result = qword_26A6D5EA0;
  if (!qword_26A6D5EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5EA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_10@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_7_16@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

SonicFoundation::MarkdownTable __swiftcall MarkdownTable.init(headers:rows:)(Swift::OpaquePointer headers, Swift::OpaquePointer rows)
{
  *(unsigned char *)uint64_t v2 = 0;
  *(Swift::OpaquePointer *)(v2 + 8) = headers;
  *(Swift::OpaquePointer *)(v2 + 16) = rows;
  result.headers = rows;
  result._updatingHeaders = (Swift::Bool)headers._rawValue;
  return result;
}

{
  uint64_t v2;
  void *rawValue;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  SonicFoundation::MarkdownTable result;

  rawValue = rows._rawValue;
  uint64_t v5 = v2;
  unsigned int v6 = *((void *)headers._rawValue + 2);
  if (v6)
  {
    unint64_t v17 = v2;
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_25E03CBEC(0, v6, 0);
    BOOL v7 = v19;
    int v8 = (uint64_t *)((char *)headers._rawValue + 40);
    do
    {
      int v9 = *(v8 - 1);
      char v10 = *v8;
      BOOL v11 = *(void *)(v19 + 16);
      char v12 = *(void *)(v19 + 24);
      sub_25E0DB3C0();
      if (v11 >= v12 >> 1) {
        sub_25E03CBEC((char *)(v12 > 1), v11 + 1, 1);
      }
      *(void *)(v19 + 16) = v11 + 1;
      int v13 = v19 + 24 * v11;
      *(unsigned char *)(v13 + 32) = 3;
      v8 += 2;
      *(void *)(v13 + 40) = v9;
      *(void *)(v13 + 48) = v10;
      --v6;
    }
    while (v6);
    size_t v14 = swift_bridgeObjectRelease();
    uint64_t v5 = v17;
    rawValue = rows._rawValue;
  }
  else
  {
    size_t v14 = swift_bridgeObjectRelease();
    BOOL v7 = MEMORY[0x263F8EE78];
  }
  *(unsigned char *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = v7;
  *(void *)(v5 + 16) = rawValue;
  result.rows._rawValue = v16;
  result.headers._rawValue = v15;
  result._updatingHeaders = v14;
  return result;
}

uint64_t MarkdownTable.Header.Alignment.hash(into:)()
{
  return sub_25E0DC4E0();
}

BOOL static MarkdownTable.Header.Alignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MarkdownTable.Header.Alignment.hashValue.getter()
{
  return sub_25E0DC500();
}

uint64_t static MarkdownTable.Header.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = *a1;
  uint64_t v5 = *((void *)a1 + 1);
  uint64_t v6 = *((void *)a1 + 2);
  int v7 = *a2;
  if (v4 != 3)
  {
    if (v7 != 3 && v4 == v7) {
      goto LABEL_3;
    }
    return 0;
  }
  if (v7 != 3) {
    return 0;
  }
LABEL_3:
  if (v5 == *((void *)a2 + 1) && v6 == *((void *)a2 + 2)) {
    return 1;
  }
  else {
    return sub_25E0DC380();
  }
}

uint64_t MarkdownTable.headers.getter()
{
  return sub_25E0DB3C0();
}

uint64_t sub_25E0C12E0()
{
  uint64_t v0 = sub_25E0DB3C0();
  return MarkdownTable.headers.setter(v0);
}

uint64_t MarkdownTable.headers.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  *(void *)(v1 + 8) = a1;
  sub_25E0C134C(v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0C134C(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_25E0C2FE8();
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v69 = (uint64_t)&v65 - v9;
  char v10 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8DFD0];
  sub_25E0C31B4(0, &qword_26A6D5EC0, (uint64_t)&type metadata for MarkdownTable.Header, MEMORY[0x263F8DFD0]);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v76 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v65 - v16;
  v83[0] = *(void *)(v2 + 8);
  v83[4] = a1;
  unint64_t v18 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D488];
  sub_25E0C31B4(0, &qword_26A6D5ED0, (uint64_t)&type metadata for MarkdownTable.Header, MEMORY[0x263F8D488]);
  sub_25E0C30A4(&qword_26A6D5ED8, &qword_26A6D5ED0, v18);
  sub_25E0C30F4();
  sub_25E0DB470();
  *(unsigned char *)uint64_t v2 = 1;
  uint64_t v67 = v13;
  v74 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v75 = v13 + 16;
  v74(v8, v17, v12);
  uint64_t v19 = v12;
  uint64_t v20 = sub_25E0C30A4(&qword_26A6D5EC8, &qword_26A6D5EC0, v10);
  v66 = v17;
  sub_25E0DBB90();
  *(void *)&v8[*(int *)(v5 + 44)] = v83[0];
  uint64_t v21 = (uint64_t)v8;
  uint64_t v22 = v69;
  sub_25E0C3140(v21, v69);
  uint64_t v23 = (uint64_t *)(v22 + *(int *)(v5 + 44));
  uint64_t v24 = *v23;
  sub_25E0DBBE0();
  if (v24 == v83[0])
  {
LABEL_52:
    sub_25E0C3200(v22);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v66, v19);
    *(unsigned char *)uint64_t v2 = 0;
    return result;
  }
  uint64_t v72 = v12;
  v73 = (void (**)(char *, uint64_t))(v67 + 8);
  uint64_t v68 = v2;
  v70 = v23;
  uint64_t v71 = v20;
  while (1)
  {
    int v25 = (void (*)(void *, void))sub_25E0DBC30();
    uint64_t v27 = *v26;
    uint64_t v28 = v26[2];
    uint64_t v29 = v26[3];
    uint64_t v30 = v26[4];
    int v31 = *((unsigned __int8 *)v26 + 40);
    int v32 = *((unsigned __int8 *)v26 + 41);
    uint64_t v78 = v26[1];
    uint64_t v79 = v28;
    uint64_t v80 = v29;
    uint64_t v81 = v30;
    int v82 = v31;
    sub_25E0C31A4();
    v25(v83, 0);
    v33 = v76;
    v74(v76, (char *)v22, v19);
    sub_25E0DBBF0();
    (*v73)(v33, v19);
    unint64_t v34 = *(void **)(v2 + 16);
    uint64_t v35 = v34[2];
    int v77 = v32;
    if (v32)
    {
      if (v35)
      {
        v83[0] = MEMORY[0x263F8EE78];
        sub_25E0DB3C0();
        sub_25E03CBA4(0, v35, 0);
        if (v27 < 0) {
          goto LABEL_60;
        }
        uint64_t v36 = 0;
        uint64_t v37 = v83[0];
        while (1)
        {
          uint64_t v38 = v34[v36 + 4];
          swift_bridgeObjectRetain_n();
          uint64_t v39 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25E0C2AA4();
            uint64_t v39 = v45;
          }
          uint64_t v40 = *(void *)(v39 + 16);
          if (v27 >= v40) {
            break;
          }
          uint64_t v41 = v40 - 1;
          uint64_t v42 = v40 - 1 - v27;
          if (v42 < 0) {
            goto LABEL_62;
          }
          memmove((void *)(v39 + 16 * v27 + 32), (const void *)(v39 + 16 * v27 + 48), 16 * v42);
          *(void *)(v39 + 16) = v41;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v83[0] = v37;
          unint64_t v44 = *(void *)(v37 + 16);
          unint64_t v43 = *(void *)(v37 + 24);
          if (v44 >= v43 >> 1)
          {
            sub_25E03CBA4(v43 > 1, v44 + 1, 1);
            uint64_t v37 = v83[0];
          }
          ++v36;
          *(void *)(v37 + 16) = v44 + 1;
          *(void *)(v37 + 8 * v44 + 32) = v39;
          if (v35 == v36)
          {
            swift_bridgeObjectRelease();
            uint64_t v2 = v68;
            uint64_t v22 = v69;
            goto LABEL_29;
          }
        }
        __break(1u);
        goto LABEL_54;
      }
      uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_29:
      if ((*(unsigned char *)v2 & 1) == 0)
      {
        uint64_t v55 = v34[2];
        if (v55)
        {
          uint64_t v56 = *(void *)(*(void *)(v2 + 8) + 16);
          if (*(void *)(v34[4] + 16) != v56) {
            goto LABEL_56;
          }
          if (v55 != 1)
          {
            if (*(void *)(v34[5] + 16) != v56) {
              goto LABEL_56;
            }
            if (v55 != 2)
            {
              uint64_t v57 = 6;
              while (1)
              {
                uint64_t v58 = v57 - 3;
                if (__OFADD__(v57 - 4, 1)) {
                  goto LABEL_58;
                }
                if (*(void *)(v34[v57] + 16) != v56) {
                  goto LABEL_56;
                }
                ++v57;
                if (v58 == v55) {
                  goto LABEL_51;
                }
              }
            }
          }
        }
      }
      goto LABEL_51;
    }
    if (v35)
    {
      v83[0] = MEMORY[0x263F8EE78];
      sub_25E0DB3C0();
      sub_25E03CBA4(0, v35, 0);
      if (v27 < 0) {
        goto LABEL_61;
      }
      uint64_t v46 = 0;
      uint64_t v37 = v83[0];
      while (1)
      {
        uint64_t v47 = v34[v46 + 4];
        unint64_t v48 = *(void *)(v47 + 16);
        if ((uint64_t)v48 < v27) {
          break;
        }
        sub_25E0DB3C0();
        if (!swift_isUniquelyReferenced_nonNull_native() || v48 >= *(void *)(v47 + 24) >> 1)
        {
          sub_25E0577F0();
          uint64_t v47 = v49;
        }
        sub_25E0C31B4(0, (unint64_t *)&qword_26A6D42E8, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
        swift_arrayDestroy();
        uint64_t v50 = *(void *)(v47 + 16);
        BOOL v51 = __OFSUB__(v50, v27);
        uint64_t v52 = v50 - v27;
        if (v51) {
          goto LABEL_55;
        }
        if (v52 < 0) {
          goto LABEL_62;
        }
        memmove((void *)(v47 + 16 * v27 + 48), (const void *)(v47 + 16 * v27 + 32), 16 * v52);
        ++*(void *)(v47 + 16);
        *(void *)(v47 + 16 * v27 + 32) = 0;
        *(void *)(v47 + 16 * v27 + 40) = 0;
        v83[0] = v37;
        unint64_t v54 = *(void *)(v37 + 16);
        unint64_t v53 = *(void *)(v37 + 24);
        if (v54 >= v53 >> 1)
        {
          sub_25E03CBA4(v53 > 1, v54 + 1, 1);
          uint64_t v37 = v83[0];
        }
        ++v46;
        *(void *)(v37 + 16) = v54 + 1;
        *(void *)(v37 + 8 * v54 + 32) = v47;
        if (v35 == v46)
        {
          swift_bridgeObjectRelease();
          uint64_t v2 = v68;
          uint64_t v22 = v69;
          goto LABEL_41;
        }
      }
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      swift_bridgeObjectRelease();
      sub_25E0C31AC();
      __break(1u);
LABEL_57:
      swift_bridgeObjectRelease();
      sub_25E0C31AC();
      __break(1u);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_41:
    if ((*(unsigned char *)v2 & 1) == 0)
    {
      uint64_t v59 = v34[2];
      if (v59)
      {
        uint64_t v60 = *(void *)(*(void *)(v2 + 8) + 16);
        if (*(void *)(v34[4] + 16) != v60) {
          goto LABEL_57;
        }
        if (v59 != 1)
        {
          if (*(void *)(v34[5] + 16) != v60) {
            goto LABEL_57;
          }
          if (v59 != 2) {
            break;
          }
        }
      }
    }
LABEL_51:
    swift_bridgeObjectRelease();
    sub_25E0C31AC();
    *(void *)(v2 + 16) = v37;
    uint64_t v63 = *v70;
    uint64_t v19 = v72;
    sub_25E0DBBE0();
    if (v63 == v83[0]) {
      goto LABEL_52;
    }
  }
  uint64_t v61 = 6;
  while (1)
  {
    uint64_t v62 = v61 - 3;
    if (__OFADD__(v61 - 4, 1)) {
      break;
    }
    if (*(void *)(v34[v61] + 16) != v60) {
      goto LABEL_57;
    }
    ++v61;
    if (v62 == v59) {
      goto LABEL_51;
    }
  }
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  uint64_t result = sub_25E0DC1C0();
  __break(1u);
  return result;
}

uint64_t MarkdownTable.rows.setter(uint64_t a1)
{
  sub_25E0C1CA4();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*MarkdownTable.headers.modify(void *a1))(void *a1, char a2)
{
  *a1 = *(void *)(v1 + 8);
  a1[1] = v1;
  sub_25E0DB3C0();
  return sub_25E0C1C04;
}

uint64_t sub_25E0C1C04(void *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *(void *)(v2 + 8);
  *(void *)(v2 + 8) = *a1;
  if (a2)
  {
    sub_25E0DB3C0();
    sub_25E0C134C(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25E0C134C(v3);
  }

  return swift_bridgeObjectRelease();
}

uint64_t MarkdownTable.rows.getter()
{
  return sub_25E0DB3C0();
}

uint64_t sub_25E0C1C78()
{
  uint64_t v0 = sub_25E0DB3C0();
  return MarkdownTable.rows.setter(v0);
}

void sub_25E0C1CA4()
{
  if ((*(unsigned char *)v0 & 1) == 0)
  {
    uint64_t v1 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      uint64_t v3 = *(void *)(*(void *)(v0 + 8) + 16);
      if (*(void *)(*(void *)(v1 + 32) + 16) != v3)
      {
LABEL_12:
        __break(1u);
        return;
      }
      if (v2 != 1)
      {
        for (uint64_t i = 5; ; ++i)
        {
          uint64_t v5 = i - 3;
          if (__OFADD__(i - 4, 1)) {
            break;
          }
          if (*(void *)(*(void *)(v1 + 8 * i) + 16) != v3) {
            goto LABEL_11;
          }
          if (v5 == v2) {
            return;
          }
        }
        __break(1u);
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
  }
}

uint64_t (*MarkdownTable.rows.modify(void *a1))(uint64_t *a1, char a2)
{
  *a1 = *(void *)(v1 + 16);
  a1[1] = v1;
  sub_25E0DB3C0();
  return sub_25E0C1D60;
}

uint64_t sub_25E0C1D60(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  sub_25E0C1CA4();
  if (a2)
  {
    sub_25E0DB3C0();
    swift_bridgeObjectRelease();
    *(void *)(v4 + 16) = v3;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v4 + 16) = v3;
  }
  return result;
}

uint64_t MarkdownTable.RenderOptions.fitColumns.getter()
{
  return *v0;
}

uint64_t MarkdownTable.RenderOptions.fitColumns.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

double (*MarkdownTable.RenderOptions.fitColumns.modify())(void)
{
  return nullsub_1;
}

uint64_t MarkdownTable.RenderOptions.raw.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t MarkdownTable.RenderOptions.raw.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

double (*MarkdownTable.RenderOptions.raw.modify())(void)
{
  return nullsub_1;
}

SonicFoundation::MarkdownTable::RenderOptions __swiftcall MarkdownTable.RenderOptions.init(fitColumns:raw:)(Swift::Bool fitColumns, Swift::Bool raw)
{
  *uint64_t v2 = fitColumns;
  v2[1] = raw;
  result.fitColumns = fitColumns;
  return result;
}

Swift::String __swiftcall MarkdownTable.render(options:)(SonicFoundation::MarkdownTable::RenderOptions options)
{
  char v2 = *(unsigned char *)(*(void *)&options.fitColumns + 1);
  int v48 = **(unsigned __int8 **)&options.fitColumns;
  unsigned int v49 = *v1;
  uint64_t v3 = *((void *)v1 + 1);
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t v53 = 0;
  unint64_t v54 = 0xE000000000000000;
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v43 = v4;
  uint64_t v47 = v3;
  if (v5)
  {
    uint64_t v51 = MEMORY[0x263F8EE78];
    sub_25E0DB3C0();
    sub_25E03CDDC(0, v5, 0);
    uint64_t v6 = v3 + 48;
    do
    {
      sub_25E0DB3C0();
      uint64_t v7 = sub_25E0DB5F0();
      swift_bridgeObjectRelease();
      if (v7 <= 3) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = v7;
      }
      unint64_t v10 = *(void *)(v51 + 16);
      unint64_t v9 = *(void *)(v51 + 24);
      if (v10 >= v9 >> 1) {
        sub_25E03CDDC(v9 > 1, v10 + 1, 1);
      }
      *(void *)(v51 + 16) = v10 + 1;
      *(void *)(v51 + 8 * v10 + 32) = v8;
      v6 += 24;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    uint64_t v11 = v51;
  }
  else
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  uint64_t v52 = v11;
  if (v48)
  {
    uint64_t v41 = *(void *)(v4 + 16);
    if (v41)
    {
      uint64_t v40 = v4 + 32;
      sub_25E0DB3C0();
      unint64_t v12 = 0;
      while (1)
      {
        if (v12 >= *(void *)(v4 + 16)) {
          goto LABEL_65;
        }
        uint64_t v13 = *(void *)(*(void *)(v40 + 8 * v12) + 16);
        if (!v13) {
          goto LABEL_29;
        }
        unint64_t v44 = v12;
        unint64_t v14 = 0;
        uint64_t v15 = sub_25E0DB3C0() + 40;
        do
        {
          if (v2)
          {
            sub_25E0DB3C0();
          }
          else
          {
            OUTLINED_FUNCTION_4_14();
            sub_25E0C2A08();
            sub_25E0567C4();
            sub_25E0DB3C0();
            OUTLINED_FUNCTION_0_16();
            OUTLINED_FUNCTION_4_14();
            OUTLINED_FUNCTION_0_16();
          }
          if (v14 >= *(void *)(v11 + 16)) {
            goto LABEL_59;
          }
          uint64_t v16 = *(void *)(v11 + 8 * v14 + 32);
          uint64_t v17 = sub_25E0DB5F0();
          swift_bridgeObjectRelease();
          if (v17 <= v16) {
            uint64_t v18 = v16;
          }
          else {
            uint64_t v18 = v17;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25E0C2AB8();
            uint64_t v11 = v19;
          }
          if (v14 >= *(void *)(v11 + 16))
          {
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
LABEL_62:
            __break(1u);
LABEL_63:
            __break(1u);
LABEL_64:
            __break(1u);
LABEL_65:
            __break(1u);
            JUMPOUT(0x25E0C27A8);
          }
          v15 += 16;
          *(void *)(v11 + 8 * v14++ + 32) = v18;
        }
        while (v13 != v14);
        swift_bridgeObjectRelease();
        uint64_t v52 = v11;
        uint64_t v4 = v43;
        unint64_t v12 = v44;
LABEL_29:
        if (++v12 == v41)
        {
          swift_bridgeObjectRelease();
          break;
        }
      }
    }
  }
  sub_25E0DB630();
  uint64_t v20 = *(void *)(v47 + 16);
  if (v20)
  {
    uint64_t v21 = v11;
    uint64_t v45 = v11 + 32;
    sub_25E0DB3C0();
    unint64_t v22 = 0;
    uint64_t v23 = (uint64_t *)(v47 + 48);
    uint64_t v24 = v47;
    do
    {
      uint64_t v25 = *(v23 - 1);
      uint64_t v26 = *v23;
      sub_25E0DB3C0();
      sub_25E0C27B8(v25, v26, v22, v48, v49, v24, v43, (uint64_t)&v52);
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      sub_25E0DB3C0();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v22 >= *(void *)(v21 + 16)) {
        goto LABEL_63;
      }
      v23 += 3;
      MEMORY[0x2611CDBF0](45, 0xE100000000000000, *(void *)(v45 + 8 * v22));
      sub_25E0C2A08();
      sub_25E0567C4();
      sub_25E0DBC40();
      swift_bridgeObjectRelease();
      sub_25E0DB3C0();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      ++v22;
      uint64_t v24 = v47;
    }
    while (v20 != v22);
    swift_bridgeObjectRelease();
    uint64_t v4 = v43;
    uint64_t v11 = v21;
  }
  else
  {
    uint64_t v24 = v47;
  }
  sub_25E0DB630();
  sub_25E0DB630();
  swift_bridgeObjectRelease();
  uint64_t v39 = *(void *)(v4 + 16);
  if (v39)
  {
    uint64_t v46 = v11;
    uint64_t v38 = v4 + 32;
    sub_25E0DB3C0();
    unint64_t v27 = 0;
    do
    {
      if (v27 >= *(void *)(v4 + 16)) {
        goto LABEL_64;
      }
      unint64_t v42 = v27;
      uint64_t v28 = *(void *)(v38 + 8 * v27);
      sub_25E0DB3C0();
      sub_25E0DB630();
      uint64_t v50 = *(void *)(v28 + 16);
      if (v50)
      {
        unint64_t v29 = 0;
        uint64_t v30 = v28 + 40;
        uint64_t v31 = v24 + 48;
        do
        {
          if (v48)
          {
            if (v29 >= *(void *)(v47 + 16))
            {
              __break(1u);
LABEL_58:
              __break(1u);
LABEL_59:
              __break(1u);
              goto LABEL_60;
            }
            if (v29 >= *(void *)(v46 + 16)) {
              goto LABEL_58;
            }
            uint64_t v32 = *(void *)(v46 + 8 * v29 + 32);
            switch(*(unsigned char *)(v31 - 16))
            {
              case 1:
                sub_25E0DB3C0();
                sub_25E0DB3C0();
                uint64_t v33 = sub_25E0DB5F0();
                if (__OFSUB__(v32, v33)) {
                  goto LABEL_61;
                }
                MEMORY[0x2611CDBF0](32, 0xE100000000000000, (v32 - v33) / 2);
                sub_25E0DB3C0();
                OUTLINED_FUNCTION_2_11();
                swift_bridgeObjectRelease();
                sub_25E03FD80();
                OUTLINED_FUNCTION_5_16();
                sub_25E0DBDA0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                break;
              case 2:
                sub_25E0DB3C0();
                sub_25E0DB3C0();
                uint64_t v34 = sub_25E0DB5F0();
                if (__OFSUB__(v32, v34)) {
                  goto LABEL_62;
                }
                MEMORY[0x2611CDBF0](32, 0xE100000000000000, v32 - v34);
                sub_25E0DB3C0();
                OUTLINED_FUNCTION_2_11();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                break;
              default:
                sub_25E03FD80();
                sub_25E0DB3C0();
                OUTLINED_FUNCTION_5_16();
                sub_25E0DBDA0();
                swift_bridgeObjectRelease();
                break;
            }
          }
          else
          {
            sub_25E0DB3C0();
          }
          ++v29;
          v30 += 16;
          OUTLINED_FUNCTION_2_11();
          swift_bridgeObjectRelease();
          sub_25E0DB3C0();
          sub_25E0DB630();
          swift_bridgeObjectRelease();
          sub_25E0DB630();
          swift_bridgeObjectRelease();
          v31 += 24;
        }
        while (v50 != v29);
      }
      unint64_t v27 = v42 + 1;
      swift_bridgeObjectRelease();
      uint64_t v4 = v43;
    }
    while (v42 + 1 != v39);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v35 = v53;
  uint64_t v36 = (void *)v54;
  result._object = v36;
  result._countAndFlagsBits = v35;
  return result;
}

uint64_t sub_25E0C27B8(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a4 & 1) == 0)
  {
    sub_25E0DB3C0();
    return a1;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (*(void *)(a6 + 16) <= a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v11 = *(unsigned __int8 *)(a6 + 24 * a3 + 32);
  swift_beginAccess();
  if (*(void *)(*(void *)a8 + 16) <= a3)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    JUMPOUT(0x25E0C29F8);
  }
  uint64_t v12 = *(void *)(*(void *)a8 + 8 * a3 + 32);
  switch(v11)
  {
    case 1:
      sub_25E0DB3C0();
      uint64_t v13 = sub_25E0DB5F0();
      if (__OFSUB__(v12, v13)) {
        goto LABEL_16;
      }
      MEMORY[0x2611CDBF0](32, 0xE100000000000000, (v12 - v13) / 2);
      sub_25E0DB3C0();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      sub_25E03FD80();
      a1 = sub_25E0DBDA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 2:
      sub_25E0DB3C0();
      uint64_t v14 = sub_25E0DB5F0();
      if (__OFSUB__(v12, v14)) {
        goto LABEL_17;
      }
      uint64_t v16 = MEMORY[0x2611CDBF0](32, 0xE100000000000000, v12 - v14);
      sub_25E0DB3C0();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 = v16;
      break;
    default:
      sub_25E03FD80();
      return sub_25E0DBDA0();
  }
  return a1;
}

unint64_t sub_25E0C2A08()
{
  unint64_t result = qword_26A6D5EA8;
  if (!qword_26A6D5EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5EA8);
  }
  return result;
}

void sub_25E0C2A54()
{
}

void sub_25E0C2A68()
{
}

void sub_25E0C2A7C(uint64_t a1)
{
}

uint64_t sub_25E0C2A90()
{
  return sub_25E0575F0();
}

void sub_25E0C2AA4()
{
}

void sub_25E0C2AB8()
{
}

unint64_t sub_25E0C2AD0()
{
  unint64_t result = qword_26A6D5EB0;
  if (!qword_26A6D5EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5EB0);
  }
  return result;
}

uint64_t sub_25E0C2B1C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return OUTLINED_FUNCTION_1_20(*(void *)(a1 + 8), a2);
}

uint64_t sub_25E0C2B28@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return OUTLINED_FUNCTION_1_20(*(void *)(a1 + 16), a2);
}

uint64_t destroy for MarkdownTable()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s15SonicFoundation13MarkdownTableVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  return a1;
}

uint64_t assignWithCopy for MarkdownTable(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MarkdownTable(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for MarkdownTable()
{
}

uint64_t sub_25E0C2C74(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  sub_25E0DB3C0();
  return a1;
}

uint64_t assignWithCopy for MarkdownTable.Header(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MarkdownTable.Header(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for MarkdownTable.Header()
{
}

unsigned char *storeEnumTagSinglePayload for MarkdownTable.Header.Alignment(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E0C2E0CLL);
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

void type metadata accessor for MarkdownTable.Header.Alignment()
{
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MarkdownTable.RenderOptions(unsigned __int16 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarkdownTable.RenderOptions(uint64_t result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E0C2FB4);
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

void type metadata accessor for MarkdownTable.RenderOptions()
{
}

void sub_25E0C2FE8()
{
  if (!qword_26A6D5EB8)
  {
    uint64_t v0 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8DFD0];
    sub_25E0C31B4(255, &qword_26A6D5EC0, (uint64_t)&type metadata for MarkdownTable.Header, MEMORY[0x263F8DFD0]);
    sub_25E0C30A4(&qword_26A6D5EC8, &qword_26A6D5EC0, v0);
    unint64_t v1 = sub_25E0DC0F0();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_26A6D5EB8);
    }
  }
}

uint64_t sub_25E0C30A4(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(void, uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25E0C31B4(255, a2, (uint64_t)&type metadata for MarkdownTable.Header, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25E0C30F4()
{
  unint64_t result = qword_26A6D5EE0;
  if (!qword_26A6D5EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5EE0);
  }
  return result;
}

uint64_t sub_25E0C3140(uint64_t a1, uint64_t a2)
{
  sub_25E0C2FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E0C31A4()
{
  return sub_25E0DB3C0();
}

uint64_t sub_25E0C31AC()
{
  return swift_bridgeObjectRelease();
}

void sub_25E0C31B4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_25E0C3200(uint64_t a1)
{
  sub_25E0C2FE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_25E0DB630();
}

BOOL static UUID.v7Precision.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t UUID.v7Precision.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t UUID.v7Precision.hashValue.getter()
{
  return sub_25E0DC500();
}

BOOL sub_25E0C32F8(char *a1, char *a2)
{
  return static UUID.v7Precision.== infix(_:_:)(*a1, *a2);
}

uint64_t sub_25E0C3304()
{
  return UUID.v7Precision.hashValue.getter();
}

uint64_t sub_25E0C330C()
{
  return UUID.v7Precision.hash(into:)();
}

uint64_t static UUID.v7(precision:)(char a1)
{
  if (qword_26A6D4278 != -1) {
    swift_once();
  }
  uint64_t v2 = off_26A6D5EE8;
  int v3 = (os_unfair_lock_s *)((char *)off_26A6D5EE8 + 56);
  swift_retain();
  os_unfair_lock_lock(v3);
  __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_REALTIME);
  unint64_t v5 = v4 / 0x3B9ACA00;
  unint64_t v6 = v4 % 0x3B9ACA00;
  uint64_t v13 = 0;
  uint64_t result = MEMORY[0x2611CF780](&v13, 8);
  if (!a1)
  {
    uint64_t v10 = v6 / 0xF4240;
    if (v2[2] != v5 || v2[3] != v10)
    {
      v2[2] = v5;
      v2[3] = v10;
      v2[6] = 0;
      goto LABEL_20;
    }
    uint64_t v11 = v2[6];
    if (!__OFADD__(v11, 1))
    {
      v2[6] = v11 + 1;
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  if (a1 == 1)
  {
    uint64_t v8 = v6 / 0x3E8;
    if (v2[2] != v5 || v2[4] != v8)
    {
      v2[2] = v5;
      v2[4] = v8;
      v2[6] = 0;
      goto LABEL_20;
    }
    uint64_t v9 = v2[6];
    if (!__OFADD__(v9, 1))
    {
      v2[6] = v9 + 1;
LABEL_20:
      sub_25E0DAF80();
      os_unfair_lock_unlock(v3);
      return swift_release();
    }
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v2[2] != v5 || v2[5] != v6)
  {
    v2[2] = v5;
    v2[5] = v6;
    v2[6] = 0;
    goto LABEL_20;
  }
  uint64_t v12 = v2[6];
  if (!__OFADD__(v12, 1))
  {
    v2[6] = v12 + 1;
    goto LABEL_20;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t static UUID._v7<A>(precision:ns:random:counters:)(char a1, unint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v6 = a2 / 0x3B9ACA00;
  unint64_t v7 = a2 % 0x3B9ACA00;
  uint64_t result = sub_25E0DB440();
  if (!a1)
  {
    unint64_t v11 = v7 / 0xF4240;
    if (*a4 != v6 || a4[1] != v11)
    {
      *a4 = v6;
      a4[1] = v11;
      a4[4] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = a4[4];
    if (!__OFADD__(v12, 1))
    {
      a4[4] = v12 + 1;
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  if (a1 == 1)
  {
    unint64_t v9 = v7 / 0x3E8;
    if (*a4 != v6 || a4[2] != v9)
    {
      *a4 = v6;
      a4[2] = v9;
      a4[4] = 0;
      goto LABEL_16;
    }
    unint64_t v10 = a4[4];
    if (!__OFADD__(v10, 1))
    {
      a4[4] = v10 + 1;
LABEL_16:
      OUTLINED_FUNCTION_0_17(result);
      return sub_25E0DAF80();
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*a4 != v6 || a4[3] != v7)
  {
    *a4 = v6;
    a4[3] = v7;
    a4[4] = 0;
    return sub_25E0DAF80();
  }
  unint64_t v13 = a4[4];
  if (!__OFADD__(v13, 1))
  {
    a4[4] = v13 + 1;
    return sub_25E0DAF80();
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t UUID.UUIDv7Counters.s.getter()
{
  return *(void *)v0;
}

uint64_t UUID.UUIDv7Counters.s.setter(uint64_t result)
{
  *unint64_t v1 = result;
  return result;
}

double (*UUID.UUIDv7Counters.s.modify())(void)
{
  return nullsub_1;
}

uint64_t UUID.UUIDv7Counters.ms.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t UUID.UUIDv7Counters.ms.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

double (*UUID.UUIDv7Counters.ms.modify())(void)
{
  return nullsub_1;
}

uint64_t UUID.UUIDv7Counters.us.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t UUID.UUIDv7Counters.us.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

double (*UUID.UUIDv7Counters.us.modify())(void)
{
  return nullsub_1;
}

uint64_t UUID.UUIDv7Counters.ns.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t UUID.UUIDv7Counters.ns.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

double (*UUID.UUIDv7Counters.ns.modify())(void)
{
  return nullsub_1;
}

uint64_t UUID.UUIDv7Counters.counter.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t UUID.UUIDv7Counters.counter.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

double (*UUID.UUIDv7Counters.counter.modify())(void)
{
  return nullsub_1;
}

double sub_25E0C3878()
{
  sub_25E0C3CA8();
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 44) = 0u;
  off_26A6D5EE8 = (_UNKNOWN *)v0;
  return result;
}

uint64_t UUID.UUIDVersion.init(rawValue:)(char a1)
{
  if ((a1 - 1) >= 0xFu) {
    return 15;
  }
  else {
    return (a1 - 1);
  }
}

uint64_t UUID.UUIDVersion.rawValue.getter(int a1)
{
  return (a1 + 1);
}

uint64_t sub_25E0C38D4()
{
  return sub_25E0D9118();
}

uint64_t sub_25E0C38DC()
{
  return sub_25E0D94BC();
}

uint64_t sub_25E0C38E4()
{
  return sub_25E0D94E4();
}

uint64_t sub_25E0C38EC@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = UUID.UUIDVersion.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_25E0C3918@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = UUID.UUIDVersion.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t UUID.version.getter()
{
  unint64_t v0 = sub_25E0DAF90();
  uint64_t result = UUID.UUIDVersion.init(rawValue:)((v0 >> 52) & 0xF);
  if (result == 15) {
    __break(1u);
  }
  return result;
}

unint64_t sub_25E0C3978()
{
  unint64_t result = qword_26A6D5EF0;
  if (!qword_26A6D5EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5EF0);
  }
  return result;
}

unint64_t sub_25E0C39C8()
{
  unint64_t result = qword_26A6D5EF8;
  if (!qword_26A6D5EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5EF8);
  }
  return result;
}

unsigned char *_s11v7PrecisionOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E0C3AE0);
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

void type metadata accessor for UUID.v7Precision()
{
}

void type metadata accessor for UUID.UUIDv7Counters()
{
}

uint64_t _s11UUIDVersionOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF2)
  {
    if (a2 + 14 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 14) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 15;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v5 = v6 - 15;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s11UUIDVersionOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x25E0C3C74);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

void type metadata accessor for UUID.UUIDVersion()
{
}

void sub_25E0C3CA8()
{
  if (!qword_26A6D5F00)
  {
    unint64_t locked = type metadata accessor for ManagedCriticalState.LockedBuffer();
    if (!v1) {
      atomic_store(locked, (unint64_t *)&qword_26A6D5F00);
    }
  }
}

uint64_t _s13UUIDv7StorageVwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s13UUIDv7StorageVwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *_s13UUIDv7StorageVMa()
{
  return &_s13UUIDv7StorageVN;
}

uint64_t static LRUDictionary.Container<>.== infix(_:_:)()
{
  return sub_25E0DB4B0() & 1;
}

uint64_t sub_25E0C3D90()
{
  return static LRUDictionary.Container<>.== infix(_:_:)();
}

uint64_t static LRUDictionary<>.== infix(_:_:)()
{
  return sub_25E0DB100() & 1;
}

uint64_t sub_25E0C3E64()
{
  return static LRUDictionary<>.== infix(_:_:)();
}

uint64_t sub_25E0C3E78(Swift::OpaquePointer a1, Swift::Int a2)
{
  return sub_25E0C3E94(a1, a2);
}

uint64_t sub_25E0C3E94(Swift::OpaquePointer a1, Swift::Int a2)
{
  return swift_bridgeObjectRelease();
}

uint64_t SQLBindable<>.bind(to:index:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v12 = (char *)&v15 - v11;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
  if (!v4)
  {
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedConformanceWitness + 8) + 8))(a1, a2, AssociatedTypeWitness);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  }
  return result;
}

uint64_t SQLBindPosition.Error.message.getter()
{
  uint64_t v1 = *v0;
  sub_25E0DB3C0();
  return v1;
}

uint64_t SQLBindPosition.Error.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int v2 = a1;
  v2[1] = a2;
  return result;
}

double (*SQLBindPosition.Error.message.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLBindPosition.hash(into:)()
{
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    sub_25E0DC4E0();
    return sub_25E0DB5E0();
  }
  else
  {
    sub_25E0DC4E0();
    return sub_25E0DC4E0();
  }
}

uint64_t static SQLBindPosition.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  char v7 = *(unsigned char *)(a2 + 16);
  if (v4 != 1)
  {
    if ((*(unsigned char *)(a2 + 16) & 1) == 0)
    {
      sub_25E0540B4(*(void *)a1, v3, 0);
      sub_25E0540B4(v5, v6, 0);
      char v9 = v2 == v5;
      return v9 & 1;
    }
LABEL_11:
    sub_25E0C42A4(v5, v6, v7);
    sub_25E0540B4(v2, v3, v4);
    sub_25E0540B4(v5, v6, v7);
    char v9 = 0;
    return v9 & 1;
  }
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    sub_25E0DB3C0();
    goto LABEL_11;
  }
  if (v2 == v5 && v3 == v6) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25E0DC380();
  }
  sub_25E0C42A4(v5, v6, 1);
  sub_25E0C42A4(v2, v3, 1);
  sub_25E0540B4(v2, v3, 1);
  sub_25E0540B4(v5, v6, 1);
  return v9 & 1;
}

uint64_t sub_25E0C42A4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return sub_25E0DB3C0();
  }
  return result;
}

uint64_t SQLBindPosition.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_25E0DC4D0();
  sub_25E0DC4E0();
  if (v1 == 1) {
    sub_25E0DB5E0();
  }
  else {
    sub_25E0DC4E0();
  }
  return sub_25E0DC500();
}

uint64_t sub_25E0C4344()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_25E0DC4D0();
  sub_25E0DC4E0();
  if (v1 == 1) {
    sub_25E0DB5E0();
  }
  else {
    sub_25E0DC4E0();
  }
  return sub_25E0DC500();
}

unint64_t sub_25E0C43CC()
{
  unint64_t result = qword_26A6D5F08;
  if (!qword_26A6D5F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5F08);
  }
  return result;
}

uint64_t dispatch thunk of SQLBindable.bind(to:index:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SQLBindable.debugSQL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t destroy for SQLBindPosition(uint64_t a1)
{
  return sub_25E0540B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s15SonicFoundation15SQLBindPositionOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25E0C42A4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SQLBindPosition(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25E0C42A4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_25E0540B4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SQLBindPosition(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_25E0540B4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLBindPosition(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SQLBindPosition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
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

uint64_t sub_25E0C45DC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25E0C45E4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SQLBindPosition()
{
  return &type metadata for SQLBindPosition;
}

ValueMetadata *type metadata accessor for SQLBindPosition.Error()
{
  return &type metadata for SQLBindPosition.Error;
}

void ManagedCriticalState.withCriticalRegion<A>(_:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25E0C4834(*(void *)v4 + *(void *)(*MEMORY[0x263F8DD00] + **(void **)v4 + 16), (os_unfair_lock_t)(*(void *)v4 + ((*(unsigned int *)(**(void **)v4 + 48) + 3) & 0x1FFFFFFFCLL)), a1, a2, *(void *)(a3 + 16), a4, &v5);
}

uint64_t ManagedCriticalState.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  type metadata accessor for ManagedCriticalState.LockedBuffer();
  uint64_t v6 = sub_25E0DBF30();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  *a3 = v6;
  return result;
}

uint64_t sub_25E0C474C()
{
  MEMORY[0x2611CE460]();

  return swift_deallocClassInstance();
}

uint64_t sub_25E0C47A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(v2 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v2 + *MEMORY[0x263F8DD00]) - 8) + 16))(a2);
}

void sub_25E0C4834(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v7) {
    *a7 = v7;
  }
}

uint64_t type metadata accessor for ManagedCriticalState.LockedBuffer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E0C48D4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E0C47A0(a1, a2);
}

uint64_t type metadata accessor for ManagedCriticalState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25E0C4908()
{
  return swift_initClassMetadata2();
}

uint64_t SQLDatabase.Options.JournalMode.rawValue.getter()
{
  uint64_t result = 0x4554454C4544;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x455441434E555254;
      break;
    case 2:
      uint64_t result = 0x54534953524550;
      break;
    case 3:
      uint64_t result = 0x59524F4D454DLL;
      break;
    case 4:
      uint64_t result = 4997463;
      break;
    case 5:
      uint64_t result = 4605519;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SQLDatabase.Options.LockingMode.rawValue.getter()
{
  if (*v0) {
    return 0x564953554C435845;
  }
  else {
    return 0x4C414D524F4ELL;
  }
}

BOOL static SQLDatabase.Options.ReadWriteMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

double SQLDatabase.Options.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = 16777473;
  *(void *)a1 = 16777473;
  *(_DWORD *)(a1 + 7) = 0;
  *(unsigned char *)(a1 + 11) = 2;
  return result;
}

uint64_t SQLDatabase.Options.ReadWriteMode.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t SQLDatabase.Options.ReadWriteMode.hashValue.getter()
{
  return sub_25E0DC500();
}

void SQLDatabase.Options.readWriteMode.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SQLDatabase.Options.readWriteMode.setter(unsigned char *result)
{
  *int v1 = *result;
  return result;
}

double (*SQLDatabase.Options.readWriteMode.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.createIfNeeded.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t SQLDatabase.Options.createIfNeeded.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

double (*SQLDatabase.Options.createIfNeeded.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.deleteWhenClosed.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t SQLDatabase.Options.deleteWhenClosed.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

double (*SQLDatabase.Options.deleteWhenClosed.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.optimizeWhenClosed.getter()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t SQLDatabase.Options.optimizeWhenClosed.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

double (*SQLDatabase.Options.optimizeWhenClosed.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.exclusiveAccess.getter()
{
  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t SQLDatabase.Options.exclusiveAccess.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 4) = result;
  return result;
}

double (*SQLDatabase.Options.exclusiveAccess.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.assertProcessDuringWriteTransactions.getter()
{
  return *(unsigned __int8 *)(v0 + 5);
}

uint64_t SQLDatabase.Options.assertProcessDuringWriteTransactions.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 5) = result;
  return result;
}

double (*SQLDatabase.Options.assertProcessDuringWriteTransactions.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.enforceForeignKeyConstraints.getter()
{
  return *(unsigned __int8 *)(v0 + 6);
}

uint64_t SQLDatabase.Options.enforceForeignKeyConstraints.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 6) = result;
  return result;
}

double (*SQLDatabase.Options.enforceForeignKeyConstraints.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.caseSensitiveLike.getter()
{
  return *(unsigned __int8 *)(v0 + 7);
}

uint64_t SQLDatabase.Options.caseSensitiveLike.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 7) = result;
  return result;
}

double (*SQLDatabase.Options.caseSensitiveLike.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.recursiveTriggers.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t SQLDatabase.Options.recursiveTriggers.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

double (*SQLDatabase.Options.recursiveTriggers.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.JournalMode.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_25E0DC210();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 6;
  if (v2 < 6) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_25E0C4CFC(unsigned __int8 *a1, char *a2)
{
  return sub_25E0821B0(*a1, *a2);
}

uint64_t sub_25E0C4D08()
{
  return sub_25E0D9160();
}

uint64_t sub_25E0C4D10()
{
  return sub_25E0D93D8();
}

uint64_t sub_25E0C4D18()
{
  return sub_25E0D9560();
}

uint64_t sub_25E0C4D20@<X0>(char *a1@<X8>)
{
  return SQLDatabase.Options.JournalMode.init(rawValue:)(a1);
}

uint64_t sub_25E0C4D2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SQLDatabase.Options.JournalMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void SQLDatabase.Options.journalingMode.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SQLDatabase.Options.journalingMode.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 9) = *result;
  return result;
}

double (*SQLDatabase.Options.journalingMode.modify())(void)
{
  return nullsub_1;
}

uint64_t SQLDatabase.Options.LockingMode.init(rawValue:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25E0DC210();
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

uint64_t sub_25E0C4DEC(char *a1, char *a2)
{
  return sub_25E08211C(*a1, *a2);
}

uint64_t sub_25E0C4DF8()
{
  return sub_25E0D91A8();
}

uint64_t sub_25E0C4E00()
{
  return sub_25E0D936C();
}

uint64_t sub_25E0C4E08()
{
  return sub_25E0D959C();
}

uint64_t sub_25E0C4E10@<X0>(char *a1@<X8>)
{
  return SQLDatabase.Options.LockingMode.init(rawValue:)(a1);
}

uint64_t sub_25E0C4E1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SQLDatabase.Options.LockingMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void SQLDatabase.Options.lockingMode.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SQLDatabase.Options.lockingMode.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 10) = *result;
  return result;
}

double (*SQLDatabase.Options.lockingMode.modify())(void)
{
  return nullsub_1;
}

BOOL static SQLDatabase.Options.DataProtectionClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SQLDatabase.Options.DataProtectionClass.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t SQLDatabase.Options.DataProtectionClass.hashValue.getter()
{
  return sub_25E0DC500();
}

void SQLDatabase.Options.dataProtectionClass.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SQLDatabase.Options.dataProtectionClass.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 11) = *result;
  return result;
}

double (*SQLDatabase.Options.dataProtectionClass.modify())(void)
{
  return nullsub_1;
}

unint64_t sub_25E0C4F44()
{
  unint64_t result = qword_26A6D5F10;
  if (!qword_26A6D5F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5F10);
  }
  return result;
}

unint64_t sub_25E0C4F94()
{
  unint64_t result = qword_26A6D5F18;
  if (!qword_26A6D5F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5F18);
  }
  return result;
}

unint64_t sub_25E0C4FE4()
{
  unint64_t result = qword_26A6D5F20;
  if (!qword_26A6D5F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5F20);
  }
  return result;
}

unint64_t sub_25E0C5034()
{
  unint64_t result = qword_26A6D5F28;
  if (!qword_26A6D5F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5F28);
  }
  return result;
}

uint64_t __swift_memcpy12_1(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t _s7OptionsVwet(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[12])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = v3 - 2;
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

uint64_t _s7OptionsVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 12) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 12) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for SQLDatabase.Options()
{
}

void type metadata accessor for SQLDatabase.Options.ReadWriteMode()
{
}

unsigned char *_s7OptionsV11JournalModeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E0C5200);
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

void type metadata accessor for SQLDatabase.Options.JournalMode()
{
}

unsigned char *_s7OptionsV13ReadWriteModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E0C5300);
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

void type metadata accessor for SQLDatabase.Options.LockingMode()
{
}

unsigned char *_s7OptionsV19DataProtectionClassOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x25E0C5400);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for SQLDatabase.Options.DataProtectionClass()
{
}

uint64_t sub_25E0C5434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E0DBA10();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25E0CA850(a1, (uint64_t (*)(void))sub_25E05D328);
  }
  else
  {
    sub_25E0DBA00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25E0DB960();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t ActorQueue.__allocating_init(ordering:)(char *a1)
{
  uint64_t v2 = swift_allocObject();
  ActorQueue.init(ordering:)(a1);
  return v2;
}

uint64_t sub_25E0C55F0()
{
  OUTLINED_FUNCTION_12();
  v0[24] = v1;
  v0[23] = v2;
  v0[21] = v3;
  v0[22] = v4;
  v0[19] = v5;
  v0[20] = v6;
  v0[18] = v7;
  OUTLINED_FUNCTION_31_4();
  v0[25] = OUTLINED_FUNCTION_17_8();
  v0[26] = swift_task_alloc();
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for ActorQueue.QueuedTask();
  v0[29] = v8;
  OUTLINED_FUNCTION_7(v8);
  v0[30] = v9;
  v0[31] = OUTLINED_FUNCTION_17_8();
  v0[32] = swift_task_alloc();
  v0[33] = swift_task_alloc();
  v0[34] = swift_task_alloc();
  OUTLINED_FUNCTION_56_4();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25E0C56F0()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_30_7();
  OUTLINED_FUNCTION_43_5();
  if (v2 || (*(unsigned char *)(v0 + 128) & 1) != 0)
  {
    OUTLINED_FUNCTION_11_12((uint64_t)"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-");
    OUTLINED_FUNCTION_37_8(v3);
    sub_25E0CA7E4((unint64_t *)&qword_26A6D47F0, 255, (void (*)(uint64_t))sub_25E053F70);
    OUTLINED_FUNCTION_36_8();
    v1[37] = v4;
    uint64_t v5 = (void *)swift_task_alloc();
    v1[38] = v5;
    uint64_t v6 = (void *)OUTLINED_FUNCTION_35_7(v5);
    v1[39] = v6;
    OUTLINED_FUNCTION_53_5(v6);
    sub_25E0CA7E4(&qword_26A6D5978, v7, (void (*)(uint64_t))type metadata accessor for ActorQueue);
    uint64_t v8 = (void *)swift_task_alloc();
    v1[40] = v8;
    *uint64_t v8 = v1;
    v8[1] = sub_25E0C59F8;
    OUTLINED_FUNCTION_21_8();
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2338]();
  }
  else
  {
    OUTLINED_FUNCTION_61_3();
    uint64_t v10 = (void *)swift_task_alloc();
    v1[35] = v10;
    void *v10 = v1;
    v10[1] = sub_25E0C5904;
    OUTLINED_FUNCTION_46_4();
    OUTLINED_FUNCTION_15();
    return sub_25E0A4C2C(v16, v11, v12, v13, v14, v15);
  }
}

uint64_t sub_25E0C5904()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 288) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25E0C59F8()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_11_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_3();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_25E0C5B34()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_58_2();
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_25E0C5BD8;
    uint64_t v3 = OUTLINED_FUNCTION_46_4();
    sub_25E0A4C2C(v8, v3, v4, v5, v6, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25E0C5BD8()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 336) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25E0C5CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v13)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v14 = OUTLINED_FUNCTION_48();
  if (v15 != v16)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v17 = v12[42];
    uint64_t v14 = OUTLINED_FUNCTION_7_17(v12[28]);
    if (v17)
    {
      OUTLINED_FUNCTION_29();
      return;
    }
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_21(v14, v18);
  OUTLINED_FUNCTION_29_7();
  if (v13)
  {
    uint64_t v19 = v12[19];
    sub_25E0CA850(v12[28], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v12[34];
    sub_25E0CD0E4(v12[28], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_47_5();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_29();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

void sub_25E0C5E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_16_9();
  if (!v16)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v17 = OUTLINED_FUNCTION_48();
  if (v18 != v19)
  {
    uint64_t v20 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v17 = OUTLINED_FUNCTION_45(v15[27]);
    if (v14)
    {
      OUTLINED_FUNCTION_87();
      return;
    }
    uint64_t v20 = 0;
  }
  OUTLINED_FUNCTION_21(v17, v20);
  OUTLINED_FUNCTION_29_7();
  if (v16)
  {
    uint64_t v21 = v15[19];
    sub_25E0CA850(v15[27], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v21 + 128) = 0;
  }
  else
  {
    uint64_t v22 = v15[33];
    sub_25E0CD0E4(v15[27], v22, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v22, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_45_6();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_41_5();
  OUTLINED_FUNCTION_87();
  v24(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12, a13, a14);
}

void sub_25E0C5FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_49_3();
  if (v13)
  {
    OUTLINED_FUNCTION_25();
    uint64_t v14 = OUTLINED_FUNCTION_48();
    if (v15 != v16)
    {
      uint64_t v18 = 1;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        OUTLINED_FUNCTION_23_10();
      }
      uint64_t v17 = v12[36];
      uint64_t v14 = OUTLINED_FUNCTION_7_17(v12[26]);
      if (v17)
      {
        OUTLINED_FUNCTION_29();
        return;
      }
      uint64_t v18 = 0;
    }
    OUTLINED_FUNCTION_21(v14, v18);
    OUTLINED_FUNCTION_29_7();
    if (v19)
    {
      uint64_t v20 = v12[19];
      sub_25E0CA850(v12[26], (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v20 + 128) = 0;
    }
    else
    {
      uint64_t v21 = v12[32];
      sub_25E0CD0E4(v12[26], v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_47_5();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_29();
    v23(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10, a11, a12);
  }
  else
  {
    __break(1u);
  }
}

void sub_25E0C6174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_49_3();
  if (v16)
  {
    OUTLINED_FUNCTION_25();
    uint64_t v17 = OUTLINED_FUNCTION_48();
    if (v18 != v19)
    {
      uint64_t v20 = 1;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        OUTLINED_FUNCTION_23_10();
      }
      uint64_t v17 = OUTLINED_FUNCTION_45(v15[25]);
      if (v14)
      {
        OUTLINED_FUNCTION_87();
        return;
      }
      uint64_t v20 = 0;
    }
    uint64_t v21 = v15[29];
    OUTLINED_FUNCTION_21(v17, v20);
    OUTLINED_FUNCTION_29_7();
    if (v22)
    {
      uint64_t v23 = OUTLINED_FUNCTION_71_2();
      sub_25E0CA850(v23, (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v21 + 128) = 0;
    }
    else
    {
      uint64_t v24 = v15[31];
      sub_25E0CD0E4(v15[25], v24, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v24, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_45_6();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_41_5();
    OUTLINED_FUNCTION_87();
    v26(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25E0C6300()
{
  OUTLINED_FUNCTION_12();
  v0[21] = v1;
  v0[22] = v2;
  v0[19] = v3;
  v0[20] = v4;
  v0[18] = v5;
  OUTLINED_FUNCTION_31_4();
  uint64_t v6 = OUTLINED_FUNCTION_17_8();
  uint64_t v7 = OUTLINED_FUNCTION_69_2(v6);
  v0[25] = OUTLINED_FUNCTION_67_2(v7);
  v0[26] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for ActorQueue.QueuedTask();
  v0[27] = v8;
  OUTLINED_FUNCTION_7(v8);
  v0[28] = v9;
  uint64_t v10 = OUTLINED_FUNCTION_17_8();
  uint64_t v11 = OUTLINED_FUNCTION_68_1(v10);
  v0[31] = OUTLINED_FUNCTION_66_2(v11);
  v0[32] = swift_task_alloc();
  OUTLINED_FUNCTION_56_4();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_25E0C63D8()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_30_7();
  OUTLINED_FUNCTION_43_5();
  if (v2 || (*(unsigned char *)(v0 + 128) & 1) != 0)
  {
    OUTLINED_FUNCTION_11_12((uint64_t)"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-");
    OUTLINED_FUNCTION_37_8(v3);
    sub_25E0CA7E4((unint64_t *)&qword_26A6D47F0, 255, (void (*)(uint64_t))sub_25E053F70);
    uint64_t v4 = OUTLINED_FUNCTION_36_8();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_73_2(v4, v5);
    *(void *)(v1 + 288) = v6;
    uint64_t v7 = (void *)OUTLINED_FUNCTION_35_7(v6);
    *(void *)(v1 + 296) = v7;
    OUTLINED_FUNCTION_53_5(v7);
    sub_25E0CA7E4(&qword_26A6D5978, v8, (void (*)(uint64_t))type metadata accessor for ActorQueue);
    uint64_t v9 = swift_task_alloc();
    uint64_t v10 = (void *)OUTLINED_FUNCTION_62_3(v9);
    void *v10 = v11;
    v10[1] = sub_25E0C6A30;
    OUTLINED_FUNCTION_21_8();
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2338]();
  }
  else
  {
    OUTLINED_FUNCTION_61_3();
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2498](v13, v14, v15);
  }
}

uint64_t sub_25E0C659C()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_18_0();
  *(void *)(v0 + 264) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25E0C6628;
  uint64_t v2 = OUTLINED_FUNCTION_28_11();
  return v3(v2);
}

uint64_t sub_25E0C6628()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 272) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25E0C671C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v14)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v15 = *(void *)(v12 + 120);
  if (*(uint64_t *)(v15 + 24) <= 0)
  {
    uint64_t v17 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v16 = v13[34];
    uint64_t v15 = OUTLINED_FUNCTION_7_17(v13[26]);
    if (v16)
    {
      OUTLINED_FUNCTION_20();
      return;
    }
    uint64_t v17 = 0;
  }
  OUTLINED_FUNCTION_21(v15, v17);
  OUTLINED_FUNCTION_29_7();
  if (v14)
  {
    uint64_t v18 = v13[19];
    sub_25E0CA850(v13[26], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v18 + 128) = 0;
  }
  else
  {
    uint64_t v19 = v13[32];
    sub_25E0CD0E4(v13[26], v19, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v19, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_55_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_20();
  v21(v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12);
}

void sub_25E0C68A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v15)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v16 = *(void *)(v12 + 120);
  if (*(uint64_t *)(v16 + 24) <= 0)
  {
    uint64_t v17 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v16 = OUTLINED_FUNCTION_45(v14[25]);
    if (v13)
    {
      OUTLINED_FUNCTION_29();
      return;
    }
    uint64_t v17 = 0;
  }
  uint64_t v18 = v14[27];
  OUTLINED_FUNCTION_21(v16, v17);
  OUTLINED_FUNCTION_29_7();
  if (v15)
  {
    uint64_t v19 = OUTLINED_FUNCTION_71_2();
    sub_25E0CA850(v19, (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v18 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v14[31];
    sub_25E0CD0E4(v14[25], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_54_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_29();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

uint64_t sub_25E0C6A30()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_11_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_3();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_25E0C6B6C()
{
  OUTLINED_FUNCTION_58_2();
  if (v0) {
    OUTLINED_FUNCTION_5_1((uint64_t)sub_25E0C6B98, 0);
  }
  else {
    __break(1u);
  }
}

uint64_t sub_25E0C6B98()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_18_0();
  *(void *)(v0 + 312) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25E0C6C24;
  uint64_t v2 = OUTLINED_FUNCTION_28_11();
  return v3(v2);
}

uint64_t sub_25E0C6C24()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 320) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25E0C6D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v13)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v14 = OUTLINED_FUNCTION_48();
  if (v15 != v16)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v17 = v12[40];
    uint64_t v14 = OUTLINED_FUNCTION_7_17(v12[24]);
    if (v17)
    {
      OUTLINED_FUNCTION_20();
      return;
    }
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_21(v14, v18);
  OUTLINED_FUNCTION_29_7();
  if (v13)
  {
    uint64_t v19 = v12[19];
    sub_25E0CA850(v12[24], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v12[30];
    sub_25E0CD0E4(v12[24], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_55_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_20();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

void sub_25E0C6EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v14)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v15 = OUTLINED_FUNCTION_48();
  if (v16 != v17)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v15 = OUTLINED_FUNCTION_45(v13[23]);
    if (v12)
    {
      OUTLINED_FUNCTION_29();
      return;
    }
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_21(v15, v18);
  OUTLINED_FUNCTION_29_7();
  if (v14)
  {
    uint64_t v19 = v13[19];
    sub_25E0CA850(v13[23], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v13[29];
    sub_25E0CD0E4(v13[23], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_54_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_29();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

uint64_t sub_25E0C7028()
{
  OUTLINED_FUNCTION_12();
  *(void *)(v0 + 168) = v1;
  *(void *)(v0 + 176) = v2;
  *(unsigned char *)(v0 + 328) = v3;
  *(void *)(v0 + 152) = v4;
  *(void *)(v0 + 160) = v5;
  *(void *)(v0 + 144) = v6;
  OUTLINED_FUNCTION_31_4();
  uint64_t v7 = OUTLINED_FUNCTION_17_8();
  uint64_t v8 = OUTLINED_FUNCTION_69_2(v7);
  *(void *)(v0 + 200) = OUTLINED_FUNCTION_67_2(v8);
  *(void *)(v0 + 208) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for ActorQueue.QueuedTask();
  *(void *)(v0 + 216) = v9;
  OUTLINED_FUNCTION_7(v9);
  *(void *)(v0 + 224) = v10;
  uint64_t v11 = OUTLINED_FUNCTION_17_8();
  uint64_t v12 = OUTLINED_FUNCTION_68_1(v11);
  *(void *)(v0 + 248) = OUTLINED_FUNCTION_66_2(v12);
  *(void *)(v0 + 256) = swift_task_alloc();
  OUTLINED_FUNCTION_56_4();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_25E0C7104()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_30_7();
  OUTLINED_FUNCTION_43_5();
  if (v2 || (*(unsigned char *)(v0 + 128) & 1) != 0)
  {
    OUTLINED_FUNCTION_11_12((uint64_t)"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-");
    OUTLINED_FUNCTION_37_8(v3);
    sub_25E0CA7E4((unint64_t *)&qword_26A6D47F0, 255, (void (*)(uint64_t))sub_25E053F70);
    uint64_t v4 = OUTLINED_FUNCTION_36_8();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_73_2(v4, v5);
    v1[36] = v6;
    uint64_t v7 = (void *)OUTLINED_FUNCTION_35_7(v6);
    v1[37] = v7;
    OUTLINED_FUNCTION_53_5(v7);
    sub_25E0CA7E4(&qword_26A6D5978, v8, (void (*)(uint64_t))type metadata accessor for ActorQueue);
    uint64_t v9 = swift_task_alloc();
    uint64_t v10 = (void *)OUTLINED_FUNCTION_62_3(v9);
    void *v10 = v11;
    v10[1] = sub_25E0C73F4;
    OUTLINED_FUNCTION_21_8();
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2338]();
  }
  else
  {
    OUTLINED_FUNCTION_61_3();
    uint64_t v13 = (void *)swift_task_alloc();
    v1[33] = v13;
    *uint64_t v13 = v1;
    v13[1] = sub_25E0C7300;
    OUTLINED_FUNCTION_46_4();
    OUTLINED_FUNCTION_15();
    return sub_25E0A5378(v14, v15, v16, v17, v18);
  }
}

uint64_t sub_25E0C7300()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 272) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25E0C73F4()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_11_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_3();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_25E0C7530()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_58_2();
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_25E0C75D0;
    uint64_t v3 = OUTLINED_FUNCTION_46_4();
    sub_25E0A5378(v3, v4, v5, v6, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25E0C75D0()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 320) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25E0C76C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v13)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v14 = OUTLINED_FUNCTION_48();
  if (v15 != v16)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v17 = v12[40];
    uint64_t v14 = OUTLINED_FUNCTION_7_17(v12[26]);
    if (v17)
    {
      OUTLINED_FUNCTION_29();
      return;
    }
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_21(v14, v18);
  OUTLINED_FUNCTION_29_7();
  if (v13)
  {
    uint64_t v19 = v12[19];
    sub_25E0CA850(v12[26], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v12[32];
    sub_25E0CD0E4(v12[26], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_48_5();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_29();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

void sub_25E0C784C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_16_9();
  if (!v16)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v17 = OUTLINED_FUNCTION_48();
  if (v18 != v19)
  {
    uint64_t v20 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v17 = OUTLINED_FUNCTION_45(v15[25]);
    if (v14)
    {
      OUTLINED_FUNCTION_87();
      return;
    }
    uint64_t v20 = 0;
  }
  uint64_t v21 = v15[27];
  OUTLINED_FUNCTION_21(v17, v20);
  OUTLINED_FUNCTION_29_7();
  if (v16)
  {
    uint64_t v22 = OUTLINED_FUNCTION_71_2();
    sub_25E0CA850(v22, (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v21 + 128) = 0;
  }
  else
  {
    uint64_t v23 = v15[31];
    sub_25E0CD0E4(v15[25], v23, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v23, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_44_6();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_41_5();
  OUTLINED_FUNCTION_87();
  v25(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12, a13, a14);
}

void sub_25E0C79D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_49_3();
  if (v13)
  {
    OUTLINED_FUNCTION_25();
    uint64_t v14 = OUTLINED_FUNCTION_48();
    if (v15 != v16)
    {
      uint64_t v18 = 1;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        OUTLINED_FUNCTION_23_10();
      }
      uint64_t v17 = v12[34];
      uint64_t v14 = OUTLINED_FUNCTION_7_17(v12[24]);
      if (v17)
      {
        OUTLINED_FUNCTION_29();
        return;
      }
      uint64_t v18 = 0;
    }
    OUTLINED_FUNCTION_21(v14, v18);
    OUTLINED_FUNCTION_29_7();
    if (v19)
    {
      uint64_t v20 = v12[19];
      sub_25E0CA850(v12[24], (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v20 + 128) = 0;
    }
    else
    {
      uint64_t v21 = v12[30];
      sub_25E0CD0E4(v12[24], v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_48_5();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_29();
    v23(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10, a11, a12);
  }
  else
  {
    __break(1u);
  }
}

void sub_25E0C7B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_49_3();
  if (v16)
  {
    OUTLINED_FUNCTION_25();
    uint64_t v17 = OUTLINED_FUNCTION_48();
    if (v18 != v19)
    {
      uint64_t v20 = 1;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        OUTLINED_FUNCTION_23_10();
      }
      uint64_t v17 = OUTLINED_FUNCTION_45(v15[23]);
      if (v14)
      {
        OUTLINED_FUNCTION_87();
        return;
      }
      uint64_t v20 = 0;
    }
    OUTLINED_FUNCTION_21(v17, v20);
    OUTLINED_FUNCTION_29_7();
    if (v21)
    {
      uint64_t v22 = v15[19];
      sub_25E0CA850(v15[23], (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v22 + 128) = 0;
    }
    else
    {
      uint64_t v23 = v15[29];
      sub_25E0CD0E4(v15[23], v23, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v23, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_44_6();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_41_5();
    OUTLINED_FUNCTION_87();
    v25(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12, a13, a14);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25E0C7CF8()
{
  OUTLINED_FUNCTION_12();
  v0[21] = v1;
  v0[19] = v2;
  v0[20] = v3;
  OUTLINED_FUNCTION_31_4();
  v0[22] = OUTLINED_FUNCTION_17_8();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = OUTLINED_FUNCTION_69_2(v4);
  v0[25] = OUTLINED_FUNCTION_67_2(v5);
  uint64_t v6 = type metadata accessor for ActorQueue.QueuedTask();
  v0[26] = v6;
  OUTLINED_FUNCTION_7(v6);
  v0[27] = v7;
  v0[28] = OUTLINED_FUNCTION_17_8();
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = OUTLINED_FUNCTION_68_1(v8);
  v0[31] = OUTLINED_FUNCTION_66_2(v9);
  OUTLINED_FUNCTION_56_4();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25E0C7DCC()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_30_7();
  OUTLINED_FUNCTION_43_5();
  if (v2 || (*(unsigned char *)(v0 + 128) & 1) != 0)
  {
    OUTLINED_FUNCTION_11_12((uint64_t)"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-");
    OUTLINED_FUNCTION_37_8(v3);
    sub_25E0CA7E4((unint64_t *)&qword_26A6D47F0, 255, (void (*)(uint64_t))sub_25E053F70);
    uint64_t v4 = OUTLINED_FUNCTION_36_8();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_72_2(v4, v5);
    v1[35] = v6;
    uint64_t v7 = (void *)OUTLINED_FUNCTION_35_7(v6);
    v1[36] = v7;
    OUTLINED_FUNCTION_53_5(v7);
    sub_25E0CA7E4(&qword_26A6D5978, v8, (void (*)(uint64_t))type metadata accessor for ActorQueue);
    uint64_t v9 = (void *)swift_task_alloc();
    v1[37] = v9;
    *uint64_t v9 = v1;
    v9[1] = sub_25E0C80C8;
    OUTLINED_FUNCTION_21_8();
    OUTLINED_FUNCTION_15();
    return MEMORY[0x270FA2338]();
  }
  else
  {
    OUTLINED_FUNCTION_61_3();
    uint64_t v11 = (void *)swift_task_alloc();
    v1[32] = v11;
    *uint64_t v11 = v1;
    v11[1] = sub_25E0C7FD4;
    OUTLINED_FUNCTION_15();
    return sub_25E0A583C(v12, v13, v14);
  }
}

uint64_t sub_25E0C7FD4()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 264) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25E0C80C8()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_11_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_3();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_25E0C8204()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_58_2();
  if (v1)
  {
    uint64_t v2 = swift_task_alloc();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_62_3(v2);
    *uint64_t v3 = v4;
    v3[1] = sub_25E0C82A8;
    double v5 = *(double *)(v0 + 168);
    uint64_t v6 = *(void *)(v0 + 160);
    sub_25E0A583C(v0 + 144, v6, v5);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25E0C82A8()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 312) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25E0C839C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v13)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v14 = OUTLINED_FUNCTION_48();
  if (v15 != v16)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v17 = v12[39];
    uint64_t v14 = OUTLINED_FUNCTION_7_17(v12[25]);
    if (v17)
    {
      OUTLINED_FUNCTION_29();
      return;
    }
    uint64_t v18 = 0;
  }
  uint64_t v19 = v12[26];
  OUTLINED_FUNCTION_21(v14, v18);
  OUTLINED_FUNCTION_29_7();
  if (v13)
  {
    uint64_t v20 = OUTLINED_FUNCTION_71_2();
    sub_25E0CA850(v20, (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v21 = v12[31];
    sub_25E0CD0E4(v12[25], v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_52_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_74_2();
  OUTLINED_FUNCTION_29();
  v24(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10, a11, a12);
}

void sub_25E0C851C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_16_9();
  if (!v14)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v15 = OUTLINED_FUNCTION_48();
  if (v16 != v17)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_23_10();
    }
    uint64_t v15 = OUTLINED_FUNCTION_45(v13[24]);
    if (v12)
    {
      OUTLINED_FUNCTION_29();
      return;
    }
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_21(v15, v18);
  OUTLINED_FUNCTION_29_7();
  if (v14)
  {
    uint64_t v19 = v13[19];
    sub_25E0CA850(v13[24], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v13[30];
    sub_25E0CD0E4(v13[24], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_60_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_29();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

void sub_25E0C86A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_49_3();
  if (v13)
  {
    OUTLINED_FUNCTION_25();
    uint64_t v14 = OUTLINED_FUNCTION_48();
    if (v15 != v16)
    {
      uint64_t v18 = 1;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        OUTLINED_FUNCTION_23_10();
      }
      uint64_t v17 = v12[33];
      uint64_t v14 = OUTLINED_FUNCTION_7_17(v12[23]);
      if (v17)
      {
        OUTLINED_FUNCTION_29();
        return;
      }
      uint64_t v18 = 0;
    }
    OUTLINED_FUNCTION_21(v14, v18);
    OUTLINED_FUNCTION_29_7();
    if (v19)
    {
      uint64_t v20 = v12[19];
      sub_25E0CA850(v12[23], (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v20 + 128) = 0;
    }
    else
    {
      uint64_t v21 = v12[29];
      sub_25E0CD0E4(v12[23], v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_52_5();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_74_2();
    OUTLINED_FUNCTION_29();
    v24(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10, a11, a12);
  }
  else
  {
    __break(1u);
  }
}

void sub_25E0C8830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_49_3();
  if (v14)
  {
    OUTLINED_FUNCTION_25();
    uint64_t v15 = OUTLINED_FUNCTION_48();
    if (v16 != v17)
    {
      uint64_t v18 = 1;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        OUTLINED_FUNCTION_23_10();
      }
      uint64_t v15 = OUTLINED_FUNCTION_45(v13[22]);
      if (v12)
      {
        OUTLINED_FUNCTION_29();
        return;
      }
      uint64_t v18 = 0;
    }
    OUTLINED_FUNCTION_21(v15, v18);
    OUTLINED_FUNCTION_29_7();
    if (v19)
    {
      uint64_t v20 = v13[19];
      sub_25E0CA850(v13[22], (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v20 + 128) = 0;
    }
    else
    {
      uint64_t v21 = v13[28];
      sub_25E0CD0E4(v13[22], v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_60_4();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_29();
    v23(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10, a11, a12);
  }
  else
  {
    __break(1u);
  }
}

uint64_t ActorQueue.run<A>(_:)()
{
  OUTLINED_FUNCTION_12();
  v1[20] = v2;
  v1[21] = v0;
  v1[18] = v3;
  v1[19] = v4;
  OUTLINED_FUNCTION_31_4();
  v1[22] = OUTLINED_FUNCTION_17_8();
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = OUTLINED_FUNCTION_69_2(v5);
  v1[25] = OUTLINED_FUNCTION_67_2(v6);
  uint64_t v7 = type metadata accessor for ActorQueue.QueuedTask();
  v1[26] = v7;
  OUTLINED_FUNCTION_7(v7);
  v1[27] = v8;
  v1[28] = OUTLINED_FUNCTION_17_8();
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = OUTLINED_FUNCTION_68_1(v9);
  v1[31] = OUTLINED_FUNCTION_66_2(v10);
  OUTLINED_FUNCTION_56_4();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_25E0C8A88()
{
  uint64_t v1 = v0[21];
  swift_beginAccess();
  uint64_t v2 = *(void *)(*(void *)(v1 + 120) + 24);
  uint64_t v3 = v0[21];
  if (v2 || (*(unsigned char *)(v3 + 128) & 1) != 0)
  {
    OUTLINED_FUNCTION_11_12((uint64_t)"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-");
    OUTLINED_FUNCTION_37_8(v4);
    sub_25E0CA7E4((unint64_t *)&qword_26A6D47F0, 255, (void (*)(uint64_t))sub_25E053F70);
    uint64_t v5 = OUTLINED_FUNCTION_36_8();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_72_2(v5, v6);
    v0[35] = v7;
    uint64_t v8 = (void *)OUTLINED_FUNCTION_35_7(v7);
    v0[36] = v8;
    OUTLINED_FUNCTION_53_5(v8);
    sub_25E0CA7E4(&qword_26A6D5978, v9, (void (*)(uint64_t))type metadata accessor for ActorQueue);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[37] = v10;
    void *v10 = v0;
    v10[1] = sub_25E0C8F68;
    OUTLINED_FUNCTION_21_8();
    return MEMORY[0x270FA2338]();
  }
  else
  {
    uint64_t v11 = (int *)v0[19];
    *(unsigned char *)(v3 + 128) = 1;
    uint64_t v15 = (uint64_t (*)(uint64_t))((char *)v11 + *v11);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[32] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_25E0C8CEC;
    uint64_t v13 = v0[18];
    return v15(v13);
  }
}

uint64_t sub_25E0C8CEC()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 264) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25E0C8DE0()
{
  OUTLINED_FUNCTION_25_10();
  if (!v1)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v2 = OUTLINED_FUNCTION_48();
  if (v3 != v4)
  {
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    OUTLINED_FUNCTION_92_1();
  }
  uint64_t v5 = v0[33];
  uint64_t v2 = OUTLINED_FUNCTION_7_17(v0[25]);
  if (!v5)
  {
    uint64_t v6 = 0;
LABEL_10:
    OUTLINED_FUNCTION_21(v2, v6);
    OUTLINED_FUNCTION_29_7();
    if (v1)
    {
      uint64_t v7 = v0[21];
      sub_25E0CA850(v0[25], (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v7 + 128) = 0;
    }
    else
    {
      uint64_t v8 = v0[31];
      sub_25E0CD0E4(v0[25], v8, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v8, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_65_2();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_7_0();
    __asm { BRAA            X1, X16 }
  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_25E0C8F68()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_11_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_59_3();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_25E0C90A4()
{
  OUTLINED_FUNCTION_12();
  if (*(unsigned char *)(v0[21] + 128) == 1)
  {
    uint64_t v5 = (void (*)(uint64_t))(v0[19] + *(int *)v0[19]);
    uint64_t v1 = swift_task_alloc();
    uint64_t v2 = (void *)OUTLINED_FUNCTION_62_3(v1);
    *uint64_t v2 = v3;
    v2[1] = sub_25E0C9184;
    uint64_t v4 = v0[18];
    v5(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25E0C9184()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_32_0();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 312) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_33_6();
  OUTLINED_FUNCTION_40();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25E0C9278()
{
  OUTLINED_FUNCTION_25_10();
  if (!v1)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v2 = OUTLINED_FUNCTION_48();
  if (v3 != v4)
  {
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    OUTLINED_FUNCTION_92_1();
  }
  uint64_t v5 = v0[39];
  uint64_t v2 = OUTLINED_FUNCTION_7_17(v0[24]);
  if (!v5)
  {
    uint64_t v6 = 0;
LABEL_10:
    OUTLINED_FUNCTION_21(v2, v6);
    OUTLINED_FUNCTION_29_7();
    if (v1)
    {
      uint64_t v7 = v0[21];
      sub_25E0CA850(v0[24], (uint64_t (*)(void))sub_25E0A94E8);
      *(unsigned char *)(v7 + 128) = 0;
    }
    else
    {
      uint64_t v8 = v0[30];
      sub_25E0CD0E4(v0[24], v8, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      OUTLINED_FUNCTION_44();
      sub_25E0DB980();
      sub_25E0CA850(v8, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    }
    OUTLINED_FUNCTION_65_2();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_7_0();
    __asm { BRAA            X1, X16 }
  }
  OUTLINED_FUNCTION_7_0();
}

void sub_25E0C9408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_25_10();
  if (!v14)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v15 = OUTLINED_FUNCTION_48();
  if (v16 != v17)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_92_1();
    }
    uint64_t v15 = OUTLINED_FUNCTION_45(v13[23]);
    if (v12)
    {
      OUTLINED_FUNCTION_20();
      return;
    }
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_21(v15, v18);
  OUTLINED_FUNCTION_29_7();
  if (v14)
  {
    uint64_t v19 = v13[21];
    sub_25E0CA850(v13[23], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v13[29];
    sub_25E0CD0E4(v13[23], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_91_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_20();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

void sub_25E0C958C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_25_10();
  if (!v14)
  {
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_25();
  uint64_t v15 = OUTLINED_FUNCTION_48();
  if (v16 != v17)
  {
    uint64_t v18 = 1;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      OUTLINED_FUNCTION_92_1();
    }
    uint64_t v15 = OUTLINED_FUNCTION_45(v13[22]);
    if (v12)
    {
      OUTLINED_FUNCTION_20();
      return;
    }
    uint64_t v18 = 0;
  }
  OUTLINED_FUNCTION_21(v15, v18);
  OUTLINED_FUNCTION_29_7();
  if (v14)
  {
    uint64_t v19 = v13[21];
    sub_25E0CA850(v13[22], (uint64_t (*)(void))sub_25E0A94E8);
    *(unsigned char *)(v19 + 128) = 0;
  }
  else
  {
    uint64_t v20 = v13[28];
    sub_25E0CD0E4(v13[22], v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    OUTLINED_FUNCTION_44();
    sub_25E0DB980();
    sub_25E0CA850(v20, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  }
  OUTLINED_FUNCTION_91_1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_20();
  v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

BOOL static ActorQueue.OrderingPolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ActorQueue.OrderingPolicy.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t ActorQueue.OrderingPolicy.hashValue.getter()
{
  return sub_25E0DC500();
}

void ActorQueue.ordering.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 112);
}

uint64_t ActorQueue.init(ordering:)(char *a1)
{
  char v2 = *a1;
  swift_defaultActor_initialize();
  *(void *)(v1 + 120) = *(void *)sub_25E0DB140();
  *(unsigned char *)(v1 + 128) = 0;
  *(unsigned char *)(v1 + 112) = v2;
  swift_retain();
  return v1;
}

uint64_t type metadata accessor for ActorQueue.QueuedTask()
{
  uint64_t result = qword_26A6D5F48;
  if (!qword_26A6D5F48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ActorQueue.count.getter()
{
  swift_beginAccess();
  return *(void *)(*(void *)(v0 + 120) + 24);
}

uint64_t sub_25E0C9870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_5_1((uint64_t)sub_25E0C988C, a2);
}

uint64_t sub_25E0C988C()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_25E0CA7E4(&qword_26A6D5978, v4, (void (*)(uint64_t))type metadata accessor for ActorQueue);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  v5[2] = v3;
  v5[3] = v2;
  v5[4] = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_25E0C99C4;
  OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA2318]();
}

uint64_t sub_25E0C99C4()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_11_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  return v3();
}

uint64_t sub_25E0C9AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ActorQueue.QueuedTask();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t *)((char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  char v14 = (uint64_t *)((char *)&v31 - v13);
  char v15 = *(unsigned char *)(a2 + 112);
  sub_25E0DB3C0();
  if (v15)
  {
    sub_25E0DBAE0();
    char v16 = (char *)v12 + *(int *)(v8 + 24);
    sub_25E0A95D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v16, a1, v17);
    *uint64_t v12 = a3;
    v12[1] = a4;
    uint64_t v18 = (uint64_t *)(a2 + 120);
    swift_beginAccess();
    uint64_t result = *(void *)(a2 + 120);
    uint64_t v20 = *(void *)(result + 24);
    uint64_t v21 = v20 + 1;
    if (!__OFADD__(v20, 1))
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v23 = *v18;
      if (*(void *)(*v18 + 16) < v21 || (isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25E0CB550(v21);
        uint64_t v23 = *v18;
      }
      sub_25E0CBC90((void *)(v23 + 16), v23 + ((*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), (uint64_t)v12);
      swift_endAccess();
      sub_25E0CA850((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      swift_beginAccess();
      sub_25E0C9DA8(v18);
      return swift_endAccess();
    }
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  sub_25E0DB9F0();
  uint64_t v24 = (char *)v14 + *(int *)(v8 + 24);
  sub_25E0A95D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v24, a1, v25);
  *char v14 = a3;
  v14[1] = a4;
  uint64_t v26 = (uint64_t *)(a2 + 120);
  swift_beginAccess();
  uint64_t result = *(void *)(a2 + 120);
  uint64_t v27 = *(void *)(result + 24);
  uint64_t v28 = v27 + 1;
  if (__OFADD__(v27, 1)) {
    goto LABEL_14;
  }
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v30 = *v26;
  if (*(void *)(*v26 + 16) < v28 || (v29 & 1) == 0)
  {
    sub_25E0CB550(v28);
    uint64_t v30 = *v26;
  }
  sub_25E0CBC90((void *)(v30 + 16), v30 + ((*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), (uint64_t)v14);
  swift_endAccess();
  return sub_25E0CA850((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
}

uint64_t sub_25E0C9DA8(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for ActorQueue.QueuedTask();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_25E05B9AC();
  }
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v7 + 40) & ~v7;
  uint64_t result = (uint64_t)sub_25E0CDDB8((uint64_t *)(*a1 + 16), *a1 + v8);
  if (!v1 && (result & 1) != 0)
  {
    uint64_t v33 = v4;
    uint64_t v10 = *a1;
    uint64_t v11 = (void *)(*a1 + 16);
    uint64_t v12 = *(void *)(*a1 + 24);
    swift_retain();
    uint64_t v31 = sub_25E0CA6C8(v12);
    unint64_t v14 = v13;
    uint64_t result = (uint64_t)sub_25E05BDD4(v11, v10 + v8, (uint64_t)&v34);
    uint64_t v15 = v35;
    if (v35 < 0)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    unint64_t v30 = v14;
    uint64_t v32 = v12;
    sub_25E0CDE78(v34, v35, 0, v35, v14);
    sub_25E0CD0E4((uint64_t)&v36, (uint64_t)v37, (uint64_t (*)(void))sub_25E0CDFE8);
    uint64_t result = sub_25E0CD0E4((uint64_t)v37, (uint64_t)&v38, (uint64_t (*)(void))sub_25E0CDFE8);
    if (v40)
    {
      uint64_t v16 = v32;
    }
    else
    {
      uint64_t v17 = v15 + v39;
      if (__OFADD__(v15, v39))
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      uint64_t v16 = v32;
      if (v17 < v15)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      uint64_t result = sub_25E0CDE78(v38, v39, v15, v15 + v39, v30);
      uint64_t v15 = v17;
    }
    if (v16 < v15)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    uint64_t v18 = v31;
    *(void *)(v31 + 16) = v15;
    swift_release();
    uint64_t v41 = v18;
    uint64_t result = sub_25E0CA0B0(&v41);
    uint64_t v19 = v41;
    uint64_t v20 = *(void *)(*a1 + 24);
    if (v20 < 0)
    {
LABEL_36:
      __break(1u);
      return result;
    }
    if (v20)
    {
      uint64_t v21 = *(void *)(v41 + 16);
      if (v21)
      {
        unint64_t v22 = 0;
        uint64_t v32 = v41 + ((v7 + 32) & ~v7);
        uint64_t v23 = v20 - 1;
        uint64_t v24 = v21 - 1;
        while (v22 < *(void *)(v19 + 16))
        {
          uint64_t v25 = *(void *)(v33 + 72);
          sub_25E0CB4EC(v32 + v25 * v22, (uint64_t)v6);
          uint64_t result = *a1;
          if ((int64_t)v22 >= *(void *)(*a1 + 24)) {
            goto LABEL_31;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_25E05B9AC();
          }
          uint64_t v26 = *(void *)(*a1 + 32);
          if ((int64_t)(v22 + v26) >= *(void *)(*a1 + 16)) {
            uint64_t v27 = *(void *)(*a1 + 16);
          }
          else {
            uint64_t v27 = 0;
          }
          sub_25E0CE050((uint64_t)v6, *a1 + v8 + (v22 + v26 - v27) * v25);
          uint64_t result = sub_25E0CA850((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
          BOOL v28 = v23 == v22 || v24 == v22;
          ++v22;
          if (v28) {
            return swift_release();
          }
        }
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_25E0CA0B0(uint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_25E0CA7D0(v3);
    uint64_t v3 = v4;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  v7[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v7[1] = v5;
  uint64_t result = sub_25E0CBD4C(v7);
  *a1 = v3;
  return result;
}

uint64_t sub_25E0CA158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25E05D328();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25E0DBA10();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a2;
  v10[6] = a3;
  swift_retain();
  sub_25E0DB3C0();
  sub_25E0C5434((uint64_t)v8, (uint64_t)&unk_26A6D5F70, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_25E0CA24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_25E0CA270, a4, 0);
}

uint64_t sub_25E0CA270()
{
  OUTLINED_FUNCTION_12();
  sub_25E0CA2CC(*(void *)(v0 + 24), *(void *)(v0 + 32));
  OUTLINED_FUNCTION_9();
  return v1();
}

uint64_t sub_25E0CA2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = type metadata accessor for ActorQueue.QueuedTask();
  uint64_t v5 = *(void *)(v33 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v33);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (uint64_t *)((char *)&v30 - v10);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v30 - v12;
  unint64_t v14 = (uint64_t *)(v2 + 120);
  uint64_t result = swift_beginAccess();
  uint64_t v16 = *(void **)(v2 + 120);
  uint64_t v17 = v16[3];
  if (!v17) {
    return result;
  }
  unint64_t v31 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v32 = v8;
  uint64_t v18 = (char *)v16 + v31;
  sub_25E0DB3C0();
  uint64_t result = swift_retain();
  uint64_t v19 = 0;
  while (1)
  {
    if (v19 >= v17)
    {
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v20 = v16[4];
    uint64_t v21 = v19 + v20 >= v16[2] ? v16[2] : 0;
    uint64_t v22 = *(void *)(v5 + 72);
    sub_25E0CB4EC((uint64_t)&v18[(v19 + v20 - v21) * v22], (uint64_t)v13);
    sub_25E0CD0E4((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    BOOL v23 = *v11 == a1 && v11[1] == a2;
    if (v23 || (sub_25E0DC380() & 1) != 0) {
      break;
    }
    uint64_t result = sub_25E0CA850((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
    ++v19;
    uint64_t v17 = v16[3];
    if (v19 == v17)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  sub_25E0CA850((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t result = *v14;
  if (v19 >= *(void *)(*v14 + 24))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    uint64_t result = sub_25E05B9AC();
  }
  uint64_t v24 = *v14;
  if (v19 >= *(void *)(*v14 + 24)) {
    goto LABEL_25;
  }
  uint64_t v25 = *(void *)(v24 + 32);
  if (v25 + v19 >= *(void *)(v24 + 16)) {
    uint64_t v26 = *(void *)(v24 + 16);
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = v24 + v31;
  uint64_t v28 = v24 + v31 + (v25 - v26 + v19) * v22;
  uint64_t v29 = (uint64_t)v32;
  sub_25E0CB4EC(v28, (uint64_t)v32);
  swift_retain();
  sub_25E0CCF7C(v19, v19 + 1, v24 + 16, v27, (void (*)(long long *__return_ptr))sub_25E0CBBB0, (void (*)(long long *, uint64_t *))sub_25E0CD0CC, (void (*)(void))type metadata accessor for ActorQueue.QueuedTask, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25E0CD708);
  swift_endAccess();
  swift_release();
  sub_25E0A95D0();
  sub_25E0DB980();
  return sub_25E0CA850(v29, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
}

uint64_t ActorQueue.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ActorQueue.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t ActorQueue.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25E0CA6AC()
{
  return ActorQueue.unownedExecutor.getter();
}

uint64_t sub_25E0CA6C8(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_25E0DC130();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      type metadata accessor for ActorQueue.QueuedTask();
      uint64_t v2 = sub_25E0DB8D0();
      *(void *)(v2 + 16) = a1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
    }
    type metadata accessor for ActorQueue.QueuedTask();
    return v2;
  }
  return result;
}

void sub_25E0CA7A8(uint64_t a1)
{
}

void sub_25E0CA7BC(uint64_t a1)
{
}

void sub_25E0CA7D0(uint64_t a1)
{
}

uint64_t sub_25E0CA7E4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t type metadata accessor for ActorQueue()
{
  return self;
}

uint64_t sub_25E0CA850(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25E0CA8B0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1[2];
  uint64_t v7 = type metadata accessor for ActorQueue.QueuedTask();
  uint64_t result = sub_25E0CD0E4(a2 + *(void *)(*(void *)(v7 - 8) + 72) * v6, a3, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
  uint64_t v9 = a1[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = a1[1];
    if (v11 >= *a1) {
      uint64_t v11 = 0;
    }
    a1[2] = v11;
    if (!__OFSUB__(v12, 1))
    {
      a1[1] = v12 - 1;
      return result;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_25E0CA964()
{
  unint64_t result = qword_26A6D5F40;
  if (!qword_26A6D5F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D5F40);
  }
  return result;
}

uint64_t method lookup function for ActorQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActorQueue);
}

uint64_t dispatch thunk of ActorQueue.__allocating_init(ordering:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

unsigned char *storeEnumTagSinglePayload for ActorQueue.OrderingPolicy(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E0CAAA8);
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

ValueMetadata *type metadata accessor for ActorQueue.OrderingPolicy()
{
  return &type metadata for ActorQueue.OrderingPolicy;
}

uint64_t *sub_25E0CAAE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    BOOL v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25E0DBA10();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    sub_25E0DB3C0();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    unint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    sub_25E0A95D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t sub_25E0CAC20(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25E0DBA10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  sub_25E0A95D0();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *sub_25E0CACE0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25E0DBA10();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  sub_25E0DB3C0();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  unint64_t v14 = (char *)a2 + v12;
  sub_25E0A95D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

void *sub_25E0CADD0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E0DBA10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  sub_25E0A95D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_25E0CAEBC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E0DBA10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  sub_25E0A95D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

void *sub_25E0CAF90(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25E0DBA10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  sub_25E0A95D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_25E0CB06C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E0CB080);
}

uint64_t sub_25E0CB080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_25E0DBA10();
    OUTLINED_FUNCTION_23_9();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      sub_25E0A95D0();
      uint64_t v10 = v12;
      uint64_t v11 = *(int *)(a3 + 24);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_25E0CB12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E0CB140);
}

uint64_t sub_25E0CB140(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_25E0DBA10();
    OUTLINED_FUNCTION_23_9();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      sub_25E0A95D0();
      uint64_t v10 = v12;
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_25E0CB1E8()
{
  sub_25E0DBA10();
  if (v0 <= 0x3F)
  {
    sub_25E0A95D0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_25E0CB2BC()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_38_4();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)OUTLINED_FUNCTION_5(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_25E046DD4;
  uint64_t v3 = OUTLINED_FUNCTION_22_8();
  return sub_25E0C9870(v3, v4, v5, v6);
}

void sub_25E0CB34C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_25E0CB3B0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25E0CB3F8()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)OUTLINED_FUNCTION_5(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_25E046DD4;
  return sub_25E0CA24C(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_25E0CB4B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E0CB4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActorQueue.QueuedTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E0CB550(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(*v1 + 16);
  uint64_t v5 = *v4;
  if (*v4 >= a1)
  {
    uint64_t v12 = *(unsigned __int8 *)(*(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 80);
    sub_25E0CB34C(0, &qword_26A6D4A18, (uint64_t (*)(uint64_t))type metadata accessor for ActorQueue.QueuedTask, MEMORY[0x263F331B8]);
    uint64_t v11 = swift_allocObject();
    long long v13 = *(_OWORD *)(v3 + 24);
    *(void *)(v11 + 16) = v5;
    *(_OWORD *)(v11 + 24) = v13;
    if ((uint64_t)v13 >= 1) {
      sub_25E05BC40(v11 + 16, v11 + ((v12 + 40) & ~v12), v4, v3 + ((v12 + 40) & ~v12));
    }
  }
  else
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v7 = *v1;
    uint64_t v8 = type metadata accessor for ActorQueue.QueuedTask();
    sub_25E0DB160();
    uint64_t v9 = *(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v10 = *(void *)(v7 + 24);
      sub_25E0CB34C(0, &qword_26A6D4A18, (uint64_t (*)(uint64_t))type metadata accessor for ActorQueue.QueuedTask, MEMORY[0x263F331B8]);
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = sub_25E05BED0();
      *(void *)(v11 + 24) = v10;
      *(void *)(v11 + 32) = 0;
      if (v10 >= 1)
      {
        swift_retain();
        sub_25E0CB860(v11 + 16, v11 + ((v9 + 40) & ~v9), (void *)(v7 + 16), v7 + ((v9 + 40) & ~v9));
        *(void *)(v7 + 24) = 0;
        swift_release();
      }
    }
    else
    {
      sub_25E0CB34C(0, &qword_26A6D4A18, (uint64_t (*)(uint64_t))type metadata accessor for ActorQueue.QueuedTask, MEMORY[0x263F331B8]);
      uint64_t v11 = swift_allocObject();
      uint64_t v14 = sub_25E05BED0();
      uint64_t v15 = *(void *)(v7 + 24);
      *(void *)(v11 + 16) = v14;
      *(void *)(v11 + 24) = v15;
      *(void *)(v11 + 32) = 0;
      if (v15 >= 1) {
        sub_25E0CB990(v11 + 16, v11 + ((v9 + 40) & ~v9), (void *)(v7 + 16), v7 + ((v9 + 40) & ~v9));
      }
    }
  }
  uint64_t result = swift_release();
  *uint64_t v2 = v11;
  return result;
}

uint64_t sub_25E0CB820(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (a2 < 0)
  {
LABEL_7:
    if ((result & 0x8000000000000000) == 0) {
      return result;
    }
    BOOL v4 = __OFADD__(result, *a3);
    result += *a3;
    if (!v4) {
      return result;
    }
LABEL_11:
    __break(1u);
    return result;
  }
  BOOL v4 = __OFSUB__(result, *a3);
  if (result >= *a3)
  {
    result -= *a3;
    if (v4)
    {
      __break(1u);
      goto LABEL_7;
    }
  }
  return result;
}

void sub_25E0CB860(uint64_t a1, unint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v4 = a3[2];
  uint64_t v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v8 = a3[1];
  uint64_t v9 = *(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8);
  if (v5 < v8)
  {
    uint64_t v10 = v8 - v5;
    if (!__OFSUB__(v8, v5))
    {
      uint64_t v11 = v5;
      unint64_t v12 = a4;
      goto LABEL_6;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v12 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = v8;
LABEL_6:
  BOOL v13 = v5 < v8;
  uint64_t v14 = *(void *)(v9 + 72);
  BOOL v15 = v10 != 0;
  BOOL v16 = v13 && v15;
  if (v13 && v15) {
    unint64_t v17 = v12;
  }
  else {
    unint64_t v17 = 0;
  }
  if (v13 && v15) {
    uint64_t v18 = v10;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v11 >= 1)
  {
    if (a4)
    {
      sub_25E03BA54(a4 + v14 * v4, v11, a2);
      goto LABEL_16;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v11 = 0;
LABEL_16:
  if (!v16 || v18 <= 0) {
    return;
  }
  if (!v17)
  {
LABEL_23:
    __break(1u);
    return;
  }
  sub_25E03BA54(v17, v18, a2 + v14 * v11);
}

uint64_t sub_25E0CB990(uint64_t a1, unint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v4 = a3[2];
  uint64_t v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v8 = a3[1];
  uint64_t result = type metadata accessor for ActorQueue.QueuedTask();
  if (v5 < v8)
  {
    uint64_t v10 = v8 - v5;
    if (!__OFSUB__(v8, v5))
    {
      uint64_t v11 = v5;
      unint64_t v12 = a4;
      goto LABEL_6;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unint64_t v12 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = v8;
LABEL_6:
  uint64_t v13 = *(void *)(*(void *)(result - 8) + 72);
  if (v11 < 1)
  {
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  unint64_t v14 = a4 + v13 * v4;
  if (v14 < a2 + v13 * v11 && v14 + v13 * v11 > a2) {
    goto LABEL_30;
  }
  uint64_t result = swift_arrayInitWithCopy();
LABEL_14:
  if (v5 >= v8 || v10 < 1) {
    return result;
  }
  if (!v12)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    uint64_t result = sub_25E0DC1C0();
    __break(1u);
    return result;
  }
  unint64_t v17 = a2 + v13 * v11;
  if (v17 + v13 * v10 > v12 && v17 < v12 + v13 * v10) {
    goto LABEL_30;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_25E0CBB34@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5 = a3[2];
  uint64_t v6 = v5 + result;
  uint64_t v7 = *a3;
  if (v5 + result >= *a3) {
    uint64_t v8 = *a3;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v5 + a2;
  if (v5 + a2 >= v7) {
    uint64_t v10 = *a3;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = v6 - v8;
    uint64_t v13 = v9 - v10;
    if (v11) {
      BOOL v14 = v12 < v13;
    }
    else {
      BOOL v14 = 1;
    }
    int v15 = v14;
    if (v15 == 1)
    {
      uint64_t v16 = 0;
      uint64_t v13 = 0;
LABEL_18:
      *(void *)a5 = a4 + 40 * v12;
      *(void *)(a5 + 8) = v11;
      *(void *)(a5 + 16) = v16;
      *(void *)(a5 + 24) = v13;
      *(unsigned char *)(a5 + 32) = v15;
      return result;
    }
    uint64_t v11 = v7 - v12;
    if (!__OFSUB__(v7, v12))
    {
      uint64_t v16 = a4;
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E0CBBB0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = a3[2];
  uint64_t v7 = v6 + result;
  uint64_t v8 = *a3;
  if (v6 + result >= *a3) {
    uint64_t v9 = *a3;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v6 + a2;
  if (v10 >= v8) {
    uint64_t v11 = *a3;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v14 = v7 - v9;
    uint64_t v15 = v10 - v11;
    if (v12) {
      BOOL v16 = v14 < v15;
    }
    else {
      BOOL v16 = 1;
    }
    int v17 = v16;
    uint64_t v18 = type metadata accessor for ActorQueue.QueuedTask();
    uint64_t v20 = *(void *)(v18 - 8);
    uint64_t result = v18 - 8;
    uint64_t v19 = v20;
    if (v17 == 1)
    {
      uint64_t v21 = 0;
      uint64_t v15 = 0;
LABEL_18:
      *(void *)a5 = a4 + *(void *)(v19 + 72) * v14;
      *(void *)(a5 + 8) = v12;
      *(void *)(a5 + 16) = v21;
      *(void *)(a5 + 24) = v15;
      *(unsigned char *)(a5 + 32) = v17;
      return result;
    }
    uint64_t v12 = v8 - v14;
    if (!__OFSUB__(v8, v14))
    {
      uint64_t v21 = a4;
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

void *sub_25E0CBC90(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[1];
  uint64_t v4 = result[2];
  uint64_t v5 = v4 + v3;
  if (!__OFADD__(v4, v3))
  {
    uint64_t v8 = result;
    if ((v3 & 0x8000000000000000) == 0)
    {
      BOOL v9 = __OFSUB__(v5, *result);
      if (v5 < *result || (v5 -= *result, !v9))
      {
LABEL_9:
        uint64_t v10 = type metadata accessor for ActorQueue.QueuedTask();
        uint64_t result = (void *)sub_25E0CB4EC(a3, a2 + *(void *)(*(void *)(v10 - 8) + 72) * v5);
        uint64_t v11 = v8[1];
        BOOL v9 = __OFADD__(v11, 1);
        uint64_t v12 = v11 + 1;
        if (!v9)
        {
          v8[1] = v12;
          return result;
        }
        goto LABEL_12;
      }
      __break(1u);
    }
    if (v5 < 0)
    {
      BOOL v9 = __OFADD__(v5, *result);
      v5 += *result;
      if (v9) {
        goto LABEL_13;
      }
    }
    goto LABEL_9;
  }
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_25E0CBD4C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v135 = type metadata accessor for ActorQueue.QueuedTask();
  uint64_t v128 = *(void *)(v135 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v135);
  uint64_t v125 = (uint64_t)&v119 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v136 = (uint64_t)&v119 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v132 = (uint64_t)&v119 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v131 = (uint64_t)&v119 - v10;
  uint64_t v11 = a1[1];
  uint64_t result = sub_25E0DC2C0();
  if (result >= v11)
  {
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (v11) {
        return sub_25E0CC720(0, v11, 1, a1);
      }
      return result;
    }
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
    goto LABEL_143;
  }
  uint64_t v13 = result;
  uint64_t result = sub_25E0CA6C8(v11 / 2);
  uint64_t v121 = result;
  uint64_t v122 = v11;
  unint64_t v127 = v14;
  if (v11 <= 0)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    unint64_t v61 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_101:
    if (v61 < 2) {
      goto LABEL_115;
    }
    uint64_t v112 = *a1;
    while (1)
    {
      unint64_t v113 = v61 - 2;
      if (v61 < 2) {
        break;
      }
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v114 = v17;
      uint64_t v115 = *(void *)(v17 + 32 + 16 * v113);
      uint64_t v116 = *(void *)(v17 + 32 + 16 * (v61 - 1) + 8);
      uint64_t result = sub_25E0CC9B8(v112 + *(void *)(v128 + 72) * v115, v112 + *(void *)(v128 + 72) * *(void *)(v17 + 32 + 16 * (v61 - 1)), v112 + *(void *)(v128 + 72) * v116, v127);
      if (v2) {
        goto LABEL_113;
      }
      if (v116 < v115) {
        goto LABEL_134;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25E0CCF14(v17);
        uint64_t v114 = result;
      }
      if (v113 >= *(void *)(v114 + 16)) {
        goto LABEL_135;
      }
      v117 = (void *)(v114 + 32 + 16 * v113);
      void *v117 = v115;
      v117[1] = v116;
      unint64_t v118 = *(void *)(v114 + 16);
      if (v61 > v118) {
        goto LABEL_136;
      }
      uint64_t result = (uint64_t)memmove((void *)(v114 + 32 + 16 * (v61 - 1)), (const void *)(v114 + 32 + 16 * v61), 16 * (v118 - v61));
      *(void *)(v114 + 16) = v118 - 1;
      unint64_t v61 = v118 - 1;
      uint64_t v17 = v114;
      if (v118 <= 2) {
        goto LABEL_115;
      }
    }
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
    goto LABEL_139;
  }
  uint64_t v15 = v11;
  uint64_t v120 = v13;
  uint64_t v16 = 0;
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v18 = v15;
  v134 = a1;
  while (1)
  {
    uint64_t v19 = v16;
    uint64_t v20 = v16 + 1;
    if (v16 + 1 >= v18)
    {
      uint64_t v26 = v16 + 1;
    }
    else
    {
      uint64_t v129 = *a1;
      uint64_t v21 = v129;
      uint64_t v22 = *(void *)(v128 + 72);
      uint64_t v137 = v22;
      uint64_t v23 = v131;
      sub_25E0CB4EC(v129 + v22 * v20, v131);
      uint64_t v24 = v21 + v22 * v19;
      uint64_t v25 = v132;
      sub_25E0CB4EC(v24, v132);
      LODWORD(v133) = sub_25E0DB9E0();
      sub_25E0CA850(v25, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      uint64_t result = sub_25E0CA850(v23, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
      uint64_t v26 = v19 + 2;
      if (v19 + 2 < v18)
      {
        uint64_t v126 = v19;
        uint64_t v123 = v17;
        uint64_t v130 = v137 * v20;
        uint64_t v27 = v129;
        uint64_t v28 = v137 * v26;
        while (1)
        {
          uint64_t v29 = v18;
          uint64_t v30 = v131;
          sub_25E0CB4EC(v27 + v28, v131);
          uint64_t v31 = v132;
          sub_25E0CB4EC(v27 + v130, v132);
          int v32 = sub_25E0DB9E0();
          sub_25E0CA850(v31, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
          uint64_t result = sub_25E0CA850(v30, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
          if ((v133 ^ v32)) {
            break;
          }
          ++v26;
          v27 += v137;
          uint64_t v18 = v29;
          if (v26 >= v29)
          {
            uint64_t v26 = v29;
            uint64_t v17 = v123;
            a1 = v134;
            uint64_t v19 = v126;
            goto LABEL_12;
          }
        }
        uint64_t v17 = v123;
        a1 = v134;
        uint64_t v19 = v126;
        uint64_t v18 = v29;
      }
LABEL_12:
      if (v133)
      {
        if (v26 < v19) {
          goto LABEL_140;
        }
        if (v19 < v26)
        {
          uint64_t v130 = v18;
          uint64_t v123 = v17;
          uint64_t v33 = 0;
          uint64_t v34 = v19;
          uint64_t v35 = v137;
          uint64_t v36 = v137 * (v26 - 1);
          uint64_t v37 = v26 * v137;
          uint64_t v38 = v34;
          uint64_t v126 = v34;
          uint64_t v39 = v34 * v137;
          do
          {
            if (v38 != v26 + v33 - 1)
            {
              uint64_t v40 = v129;
              if (!v129) {
                goto LABEL_146;
              }
              unint64_t v41 = v129 + v39;
              uint64_t v133 = v129 + v36;
              sub_25E0CD0E4(v129 + v39, v125, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
              if (v39 < v36 || v41 >= v40 + v37)
              {
                swift_arrayInitWithTakeFrontToBack();
                uint64_t v35 = v137;
              }
              else
              {
                uint64_t v35 = v137;
                if (v39 != v36) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              uint64_t result = sub_25E0CD0E4(v125, v133, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
            }
            ++v38;
            --v33;
            v36 -= v35;
            v37 -= v35;
            v39 += v35;
          }
          while (v38 < v26 + v33);
          uint64_t v17 = v123;
          a1 = v134;
          uint64_t v19 = v126;
          uint64_t v18 = v130;
        }
      }
    }
    if (v26 < v18)
    {
      if (__OFSUB__(v26, v19)) {
        goto LABEL_138;
      }
      if (v26 - v19 < v120)
      {
        if (__OFADD__(v19, v120)) {
          goto LABEL_141;
        }
        if (v19 + v120 >= v18) {
          uint64_t v43 = v18;
        }
        else {
          uint64_t v43 = v19 + v120;
        }
        if (v43 < v19) {
          goto LABEL_142;
        }
        if (v26 != v43)
        {
          uint64_t v126 = v19;
          uint64_t v123 = v17;
          uint64_t v124 = v43;
          uint64_t v119 = v2;
          uint64_t v44 = *(void *)(v128 + 72);
          uint64_t v45 = v44 * (v26 - 1);
          uint64_t v129 = v44;
          uint64_t v46 = v26 * v44;
          do
          {
            uint64_t v47 = 0;
            uint64_t v48 = v126;
            uint64_t v133 = v26;
            uint64_t v130 = v46;
            while (1)
            {
              uint64_t v137 = v48;
              unsigned int v49 = v134;
              uint64_t v50 = *v134;
              uint64_t v51 = v46 + v47 + *v134;
              uint64_t v52 = v131;
              sub_25E0CB4EC(v51, v131);
              uint64_t v53 = v45;
              uint64_t v54 = v45 + v47 + v50;
              uint64_t v55 = v132;
              sub_25E0CB4EC(v54, v132);
              LOBYTE(v50) = sub_25E0DB9E0();
              sub_25E0CA850(v55, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
              uint64_t result = sub_25E0CA850(v52, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
              if ((v50 & 1) == 0) {
                break;
              }
              uint64_t v56 = *v49;
              if (!*v49) {
                goto LABEL_144;
              }
              uint64_t v46 = v130;
              uint64_t v45 = v53;
              uint64_t v57 = v56 + v53 + v47;
              sub_25E0CD0E4(v56 + v130 + v47, v136, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
              swift_arrayInitWithTakeFrontToBack();
              uint64_t result = sub_25E0CD0E4(v136, v57, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
              v47 -= v129;
              uint64_t v48 = v137 + 1;
              uint64_t v58 = v133;
              if (v133 == v137 + 1) {
                goto LABEL_45;
              }
            }
            uint64_t v58 = v133;
            uint64_t v45 = v53;
            uint64_t v46 = v130;
LABEL_45:
            uint64_t v26 = v58 + 1;
            v45 += v129;
            v46 += v129;
          }
          while (v26 != v124);
          uint64_t v26 = v124;
          uint64_t v2 = v119;
          uint64_t v17 = v123;
          a1 = v134;
          uint64_t v19 = v126;
        }
      }
    }
    if (v26 < v19) {
      goto LABEL_137;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v133 = v26;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25E0CCDF0(0, *(void *)(v17 + 16) + 1, 1, (char *)v17);
      uint64_t v17 = result;
    }
    unint64_t v60 = *(void *)(v17 + 16);
    unint64_t v59 = *(void *)(v17 + 24);
    unint64_t v61 = v60 + 1;
    if (v60 >= v59 >> 1)
    {
      uint64_t result = (uint64_t)sub_25E0CCDF0((char *)(v59 > 1), v60 + 1, 1, (char *)v17);
      uint64_t v17 = result;
    }
    *(void *)(v17 + 16) = v61;
    uint64_t v62 = v17 + 32;
    uint64_t v63 = (uint64_t *)(v17 + 32 + 16 * v60);
    uint64_t v64 = v133;
    *uint64_t v63 = v19;
    v63[1] = v64;
    if (v60) {
      break;
    }
    unint64_t v61 = 1;
LABEL_95:
    uint64_t v18 = a1[1];
    uint64_t v16 = v133;
    if (v133 >= v18) {
      goto LABEL_101;
    }
  }
  while (1)
  {
    unint64_t v65 = v61 - 1;
    if (v61 >= 4)
    {
      unint64_t v70 = v62 + 16 * v61;
      uint64_t v71 = *(void *)(v70 - 64);
      uint64_t v72 = *(void *)(v70 - 56);
      BOOL v76 = __OFSUB__(v72, v71);
      uint64_t v73 = v72 - v71;
      if (v76) {
        goto LABEL_122;
      }
      uint64_t v75 = *(void *)(v70 - 48);
      uint64_t v74 = *(void *)(v70 - 40);
      BOOL v76 = __OFSUB__(v74, v75);
      uint64_t v68 = v74 - v75;
      char v69 = v76;
      if (v76) {
        goto LABEL_123;
      }
      unint64_t v77 = v61 - 2;
      uint64_t v78 = (uint64_t *)(v62 + 16 * (v61 - 2));
      uint64_t v80 = *v78;
      uint64_t v79 = v78[1];
      BOOL v76 = __OFSUB__(v79, v80);
      uint64_t v81 = v79 - v80;
      if (v76) {
        goto LABEL_124;
      }
      BOOL v76 = __OFADD__(v68, v81);
      uint64_t v82 = v68 + v81;
      if (v76) {
        goto LABEL_126;
      }
      if (v82 >= v73)
      {
        v100 = (uint64_t *)(v62 + 16 * v65);
        uint64_t v102 = *v100;
        uint64_t v101 = v100[1];
        BOOL v76 = __OFSUB__(v101, v102);
        uint64_t v103 = v101 - v102;
        if (v76) {
          goto LABEL_132;
        }
        BOOL v93 = v68 < v103;
        goto LABEL_84;
      }
    }
    else
    {
      if (v61 != 3)
      {
        uint64_t v94 = *(void *)(v17 + 32);
        uint64_t v95 = *(void *)(v17 + 40);
        BOOL v76 = __OFSUB__(v95, v94);
        uint64_t v87 = v95 - v94;
        char v88 = v76;
        goto LABEL_78;
      }
      uint64_t v67 = *(void *)(v17 + 32);
      uint64_t v66 = *(void *)(v17 + 40);
      BOOL v76 = __OFSUB__(v66, v67);
      uint64_t v68 = v66 - v67;
      char v69 = v76;
    }
    if (v69) {
      goto LABEL_125;
    }
    unint64_t v77 = v61 - 2;
    v83 = (uint64_t *)(v62 + 16 * (v61 - 2));
    uint64_t v85 = *v83;
    uint64_t v84 = v83[1];
    BOOL v86 = __OFSUB__(v84, v85);
    uint64_t v87 = v84 - v85;
    char v88 = v86;
    if (v86) {
      goto LABEL_127;
    }
    v89 = (uint64_t *)(v62 + 16 * v65);
    uint64_t v91 = *v89;
    uint64_t v90 = v89[1];
    BOOL v76 = __OFSUB__(v90, v91);
    uint64_t v92 = v90 - v91;
    if (v76) {
      goto LABEL_129;
    }
    if (__OFADD__(v87, v92)) {
      goto LABEL_131;
    }
    if (v87 + v92 >= v68)
    {
      BOOL v93 = v68 < v92;
LABEL_84:
      if (v93) {
        unint64_t v65 = v77;
      }
      goto LABEL_86;
    }
LABEL_78:
    if (v88) {
      goto LABEL_128;
    }
    v96 = (uint64_t *)(v62 + 16 * v65);
    uint64_t v98 = *v96;
    uint64_t v97 = v96[1];
    BOOL v76 = __OFSUB__(v97, v98);
    uint64_t v99 = v97 - v98;
    if (v76) {
      goto LABEL_130;
    }
    if (v99 < v87) {
      goto LABEL_95;
    }
LABEL_86:
    unint64_t v104 = v65 - 1;
    if (v65 - 1 >= v61)
    {
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }
    uint64_t v105 = *a1;
    if (!*a1) {
      goto LABEL_145;
    }
    uint64_t v106 = v17;
    v107 = (uint64_t *)(v62 + 16 * v104);
    uint64_t v108 = *v107;
    v109 = (void *)(v62 + 16 * v65);
    uint64_t v110 = v109[1];
    uint64_t result = sub_25E0CC9B8(v105 + *(void *)(v128 + 72) * *v107, v105 + *(void *)(v128 + 72) * *v109, v105 + *(void *)(v128 + 72) * v110, v127);
    if (v2) {
      break;
    }
    if (v110 < v108) {
      goto LABEL_119;
    }
    if (v65 > *(void *)(v106 + 16)) {
      goto LABEL_120;
    }
    uint64_t *v107 = v108;
    *(void *)(v62 + 16 * v104 + 8) = v110;
    unint64_t v111 = *(void *)(v106 + 16);
    if (v65 >= v111) {
      goto LABEL_121;
    }
    uint64_t v17 = v106;
    unint64_t v61 = v111 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v62 + 16 * v65), v109 + 2, 16 * (v111 - 1 - v65));
    *(void *)(v106 + 16) = v111 - 1;
    a1 = v134;
    if (v111 <= 2) {
      goto LABEL_95;
    }
  }
LABEL_113:
  swift_bridgeObjectRelease();
  if (v122 >= -1) {
    goto LABEL_116;
  }
  __break(1u);
LABEL_115:
  uint64_t result = swift_bridgeObjectRelease();
  if (v122 >= -1)
  {
LABEL_116:
    *(void *)(v121 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
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
  return result;
}

uint64_t sub_25E0CC720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = a1;
  uint64_t v27 = type metadata accessor for ActorQueue.QueuedTask();
  uint64_t v7 = MEMORY[0x270FA5388](v27);
  uint64_t v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v26 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v30 = v16 * (v26 - 1);
    uint64_t v25 = v16;
    uint64_t v29 = v16 * v26;
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v24;
      do
      {
        uint64_t v19 = *a4;
        sub_25E0CB4EC(v29 + v17 + *a4, (uint64_t)v15);
        sub_25E0CB4EC(v30 + v17 + v19, (uint64_t)v11);
        LOBYTE(v19) = sub_25E0DB9E0();
        sub_25E0CA850((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        uint64_t result = sub_25E0CA850((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        if ((v19 & 1) == 0) {
          break;
        }
        uint64_t v20 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        uint64_t v21 = v20 + v30 + v17;
        sub_25E0CD0E4(v20 + v29 + v17, v28, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = sub_25E0CD0E4(v28, v21, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        v17 -= v25;
        ++v18;
      }
      while (v26 != v18);
      v30 += v25;
      v29 += v25;
      if (++v26 != v23) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_25E0CC9B8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v57 = type metadata accessor for ActorQueue.QueuedTask();
  uint64_t v8 = MEMORY[0x270FA5388](v57);
  uint64_t v56 = (uint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v55 = (uint64_t)&v49 - v11;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  int64_t v14 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_76;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_77;
  }
  uint64_t v18 = v14 / v13;
  uint64_t v19 = v16 / v13;
  if (v14 / v13 >= v16 / v13)
  {
    unint64_t v30 = a2;
    uint64_t result = sub_25E03BA54(a2, v16 / v13, a4);
    unint64_t v20 = a4 + v19 * v13;
    if (v19 * v13 >= 1 && a1 < a2)
    {
      unint64_t v52 = a1;
      uint64_t v53 = -v13;
      uint64_t v50 = v13;
      unint64_t v51 = a4;
      do
      {
        unint64_t v32 = a3;
        uint64_t v33 = v53;
        unint64_t v34 = a3 + v53;
        unint64_t v54 = v20 + v53;
        uint64_t v35 = v55;
        unint64_t v36 = v20;
        sub_25E0CB4EC(v20 + v53, v55);
        unint64_t v37 = v30 + v33;
        uint64_t v38 = v30 + v33;
        uint64_t v39 = v56;
        sub_25E0CB4EC(v38, v56);
        char v40 = sub_25E0DB9E0();
        sub_25E0CA850(v39, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        uint64_t result = sub_25E0CA850(v35, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        if (v40)
        {
          BOOL v41 = a3 < v30 || v34 >= v30;
          a3 = v34;
          if (v41)
          {
            uint64_t result = swift_arrayInitWithTakeFrontToBack();
            unint64_t v30 = v37;
            uint64_t v13 = v50;
            a4 = v51;
            unint64_t v42 = v52;
          }
          else
          {
            unint64_t v42 = v52;
            if (v32 != v30) {
              uint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v30 = v37;
            uint64_t v13 = v50;
            a4 = v51;
          }
          unint64_t v20 = v36;
        }
        else
        {
          BOOL v43 = a3 < v36 || v34 >= v36;
          a3 = v34;
          if (v43)
          {
            unint64_t v44 = v54;
            uint64_t result = swift_arrayInitWithTakeFrontToBack();
            unint64_t v20 = v44;
            uint64_t v13 = v50;
            a4 = v51;
            unint64_t v42 = v52;
          }
          else
          {
            unint64_t v42 = v52;
            if (v32 == v36)
            {
              unint64_t v20 = v54;
            }
            else
            {
              unint64_t v45 = v54;
              uint64_t result = swift_arrayInitWithTakeBackToFront();
              unint64_t v20 = v45;
            }
            uint64_t v13 = v50;
            a4 = v51;
          }
        }
      }
      while (v20 > a4 && v30 > v42);
    }
  }
  else
  {
    uint64_t result = sub_25E03BA54(a1, v14 / v13, a4);
    unint64_t v20 = a4 + v18 * v13;
    if (v18 * v13 >= 1 && a2 < a3)
    {
      unint64_t v22 = a2;
      unint64_t v54 = a4 + v18 * v13;
      do
      {
        uint64_t v23 = v55;
        sub_25E0CB4EC(v22, v55);
        uint64_t v24 = v56;
        sub_25E0CB4EC(a4, v56);
        char v25 = sub_25E0DB9E0();
        sub_25E0CA850(v24, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        uint64_t result = sub_25E0CA850(v23, (uint64_t (*)(void))type metadata accessor for ActorQueue.QueuedTask);
        if (v25)
        {
          unint64_t v26 = v22 + v13;
          if (a1 < v22 || a1 >= v26)
          {
            uint64_t result = swift_arrayInitWithTakeFrontToBack();
          }
          else if (a1 != v22)
          {
            uint64_t result = swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          if (a1 < a4 || a1 >= a4 + v13)
          {
            uint64_t result = swift_arrayInitWithTakeFrontToBack();
          }
          else if (a1 != a4)
          {
            uint64_t result = swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v26 = v22;
          a4 += v13;
        }
        unint64_t v20 = v54;
        a1 += v13;
        BOOL v29 = a4 >= v54 || v26 >= a3;
        unint64_t v22 = v26;
      }
      while (!v29);
    }
    unint64_t v30 = a1;
  }
  int64_t v47 = v20 - a4;
  if (v13 != -1 || v47 != 0x8000000000000000)
  {
    sub_25E03BA54(a4, v47 / v13, v30);
    return 1;
  }
LABEL_78:
  __break(1u);
  return result;
}

char *sub_25E0CCDF0(char *result, int64_t a2, char a3, char *a4)
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
    sub_25E0CB34C(0, &qword_26A6D4980, (uint64_t (*)(uint64_t))sub_25E058D1C, MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25E0CCF14(uint64_t a1)
{
  return sub_25E0CCDF0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E0CCF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25E0CCF7C(a1, a2, a3, a4, (void (*)(long long *__return_ptr))sub_25E0CBB34, (void (*)(long long *, uint64_t *))sub_25E0CE144, (void (*)(void))sub_25E05B88C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25E0CD1B4);
}

uint64_t sub_25E0CCF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(long long *__return_ptr), void (*a6)(long long *, uint64_t *), void (*a7)(void), uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  a5(&v18);
  char v15 = v21 | (v20 == 0);
  if (v21 & 1 | (v20 == 0)) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v19;
  }
  long long v22 = v18;
  a6(&v22, (uint64_t *)v23);
  a6((long long *)v23, &v24);
  if (v24)
  {
    a7(0);
    swift_arrayDestroy();
  }
  if (!(v15 & 1 | (v16 == 0)))
  {
    a7(0);
    swift_arrayDestroy();
  }
  return a8(a1, a2, a3, a4);
}

uint64_t sub_25E0CD0CC(uint64_t a1, uint64_t a2)
{
  return sub_25E0CD0E4(a1, a2, (uint64_t (*)(void))sub_25E0CD14C);
}

uint64_t sub_25E0CD0E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_25E0CD14C(uint64_t a1)
{
}

void sub_25E0CD180(uint64_t a1)
{
}

uint64_t sub_25E0CD1B4(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (v4 < 1) {
    return result;
  }
  uint64_t v6 = result;
  uint64_t v8 = a3[1];
  uint64_t v7 = a3[2];
  uint64_t v9 = *a3;
  if (v7 + result >= *a3) {
    uint64_t v10 = *a3;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v7 + a2 >= v9) {
    uint64_t v11 = *a3;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v8 - a2;
  if (__OFSUB__(v8, a2)) {
    goto LABEL_84;
  }
  uint64_t v14 = v7 + result - v10;
  uint64_t v15 = v7 + a2 - v11;
  uint64_t result = a3[2];
  if (v12 > v6)
  {
    uint64_t result = sub_25E0CB820(result, v4, a3);
    uint64_t v12 = result;
    if (!v6) {
      goto LABEL_68;
    }
    if (v15 <= 0) {
      uint64_t v16 = v9;
    }
    else {
      uint64_t v16 = v15;
    }
    if (v14 <= 0) {
      uint64_t v17 = v9;
    }
    else {
      uint64_t v17 = v14;
    }
    if (v7 >= v17)
    {
      if (v16 >= result)
      {
        if (__OFSUB__(0, v14))
        {
LABEL_90:
          __break(1u);
LABEL_91:
          __break(1u);
          goto LABEL_92;
        }
        if (v14 > 0)
        {
          v15 -= v14;
          sub_25E03B684(a4, v14, a4 + 40 * v15);
          sub_25E0CB820(0, v14, a3);
          uint64_t result = sub_25E0CB820(v15, v14, a3);
        }
        BOOL v18 = __OFSUB__(v6, v14);
        v6 -= v14;
        if (v18) {
          goto LABEL_91;
        }
        goto LABEL_65;
      }
      if (v14 > 0)
      {
        sub_25E03B684(a4, v14, a4 + 40 * v4);
        sub_25E0CB820(0, v14, a3);
        sub_25E0CB820(v4, v14, a3);
      }
      uint64_t v14 = *a3 - v4;
      sub_25E03B684(a4 + 40 * v14, v4, a4);
      sub_25E0CB820(v14, v4, a3);
      uint64_t result = sub_25E0CB820(0, v4, a3);
      BOOL v18 = __OFSUB__(v6, v15);
      v6 -= v15;
      if (!v18) {
        goto LABEL_65;
      }
      __break(1u);
      goto LABEL_50;
    }
    if (v16 >= result)
    {
      if (v6 > 0)
      {
        sub_25E03B684(a4 + 40 * v7, v6, a4 + 40 * result);
        uint64_t v30 = v7;
LABEL_67:
        sub_25E0CB820(v30, v6, a3);
        uint64_t result = sub_25E0CB820(v12, v6, a3);
      }
LABEL_68:
      a3[2] = v12;
      uint64_t v31 = a3[1];
      BOOL v18 = __OFSUB__(v31, v4);
      uint64_t v32 = v31 - v4;
      if (!v18) {
        goto LABEL_81;
      }
      __break(1u);
      goto LABEL_71;
    }
    if (v15 > 0)
    {
      uint64_t v14 = v9 - v4;
      sub_25E03B684(a4 + 40 * (v9 - v4), v15, a4);
      sub_25E0CB820(v9 - v4, v15, a3);
      uint64_t result = sub_25E0CB820(0, v15, a3);
    }
    BOOL v18 = __OFSUB__(v6, v15);
    v6 -= v15;
    if (!v18)
    {
LABEL_65:
      if (v6 >= 1)
      {
        uint64_t v14 = a3[2];
        sub_25E03B684(a4 + 40 * v14, v6, a4 + 40 * v12);
        uint64_t v30 = v14;
        goto LABEL_67;
      }
      goto LABEL_68;
    }
    __break(1u);
  }
  uint64_t result = sub_25E0CB820(result, v8, a3);
  uint64_t v19 = v8 - v4;
  if (__OFSUB__(v8, v4))
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  uint64_t v8 = v4;
  uint64_t v20 = v19 + v7;
  if (v20 >= v9) {
    uint64_t v21 = v9;
  }
  else {
    uint64_t v21 = 0;
  }
  if (!v12) {
    goto LABEL_80;
  }
  uint64_t v6 = result;
  uint64_t v4 = v20 - v21;
  if (v20 - v21 <= 0) {
    uint64_t v22 = v9;
  }
  else {
    uint64_t v22 = v20 - v21;
  }
  if (result <= 0) {
    uint64_t v23 = v9;
  }
  else {
    uint64_t v23 = result;
  }
  if (v15 < v23)
  {
    if (v22 >= v14)
    {
LABEL_71:
      if (v12 <= 0) {
        goto LABEL_80;
      }
      sub_25E03B684(a4 + 40 * v15, v12, a4 + 40 * v14);
      sub_25E0CB820(v15, v12, a3);
      uint64_t v25 = v14;
      uint64_t v29 = v12;
      goto LABEL_79;
    }
    uint64_t v24 = v9 - v14;
    if (__OFSUB__(v9, v14))
    {
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
    if (v24 > 0)
    {
      sub_25E03B684(a4 + 40 * v15, v9 - v14, a4 + 40 * v14);
      uint64_t v15 = sub_25E0CB820(v15, v9 - v14, a3);
      uint64_t result = sub_25E0CB820(v14, v9 - v14, a3);
    }
    BOOL v18 = __OFSUB__(v12, v24);
    uint64_t v6 = v12 - v24;
    if (v18) {
      goto LABEL_88;
    }
    if (v6 >= 1)
    {
      sub_25E03B684(a4 + 40 * v15, v6, a4);
      sub_25E0CB820(v15, v6, a3);
      uint64_t v25 = 0;
LABEL_78:
      uint64_t v29 = v6;
      goto LABEL_79;
    }
    goto LABEL_80;
  }
LABEL_50:
  uint64_t v26 = v9 - v15;
  BOOL v27 = __OFSUB__(v9, v15);
  if (v22 >= v14)
  {
    if (v27)
    {
LABEL_92:
      __break(1u);
      return result;
    }
    if (v26 > 0)
    {
      sub_25E03B684(a4 + 40 * v15, v9 - v15, a4 + 40 * v14);
      sub_25E0CB820(v15, v9 - v15, a3);
      uint64_t result = sub_25E0CB820(v14, v9 - v15, a3);
      uint64_t v14 = result;
    }
    if (v6 >= 1)
    {
      sub_25E03B684(a4, v6, a4 + 40 * v14);
      sub_25E0CB820(0, v6, a3);
      uint64_t v25 = v14;
      goto LABEL_78;
    }
  }
  else
  {
    if (v27)
    {
LABEL_89:
      __break(1u);
      goto LABEL_90;
    }
    if (v26 > 0)
    {
      sub_25E03B684(a4 + 40 * v15, v9 - v15, a4 + 40 * v14);
      sub_25E0CB820(v15, v9 - v15, a3);
      uint64_t v14 = sub_25E0CB820(v14, v9 - v15, a3);
    }
    sub_25E03B684(a4, v8, a4 + 40 * v14);
    uint64_t v28 = sub_25E0CB820(0, v8, a3);
    uint64_t result = sub_25E0CB820(v14, v8, a3);
    if (v4 >= 1)
    {
      sub_25E03B684(a4 + 40 * v28, v4, a4);
      sub_25E0CB820(v28, v4, a3);
      uint64_t v25 = 0;
      uint64_t v29 = v4;
LABEL_79:
      uint64_t result = sub_25E0CB820(v25, v29, a3);
    }
  }
LABEL_80:
  uint64_t v33 = a3[1];
  BOOL v18 = __OFSUB__(v33, v8);
  uint64_t v32 = v33 - v8;
  if (v18)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
LABEL_81:
  a3[1] = v32;
  return result;
}

uint64_t sub_25E0CD708(uint64_t result, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (v4 < 1) {
    return result;
  }
  uint64_t v6 = result;
  uint64_t v8 = a3[1];
  uint64_t v7 = a3[2];
  uint64_t v9 = *a3;
  if (v7 + result >= *a3) {
    uint64_t v10 = *a3;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v7 + a2 >= v9) {
    uint64_t v11 = *a3;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v8 - a2;
  if (__OFSUB__(v8, a2)) {
    goto LABEL_84;
  }
  uint64_t v14 = v7 + result - v10;
  uint64_t v15 = v7 + a2 - v11;
  uint64_t result = a3[2];
  if (v12 > v6)
  {
    uint64_t result = sub_25E0CB820(result, v4, a3);
    uint64_t v12 = result;
    if (!v6) {
      goto LABEL_69;
    }
    if (v15 <= 0) {
      uint64_t v16 = v9;
    }
    else {
      uint64_t v16 = v15;
    }
    if (v14 <= 0) {
      uint64_t v17 = v9;
    }
    else {
      uint64_t v17 = v14;
    }
    if (v7 >= v17)
    {
      if (v16 < result)
      {
        if (v14 > 0)
        {
          uint64_t v32 = type metadata accessor for ActorQueue.QueuedTask();
          sub_25E03BA54(a4, v14, a4 + *(void *)(*(void *)(v32 - 8) + 72) * v4);
          sub_25E0CB820(0, v14, a3);
          sub_25E0CB820(v4, v14, a3);
        }
        uint64_t v14 = *a3 - v4;
        uint64_t v33 = *(void *)(*(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72);
        sub_25E03BA54(a4 + v33 * v14, v4, a4);
        sub_25E0CB820(v14, v4, a3);
        uint64_t result = sub_25E0CB820(0, v4, a3);
        BOOL v19 = __OFSUB__(v6, v15);
        v6 -= v15;
        if (v19) {
          goto LABEL_89;
        }
        if (v6 < 1) {
          goto LABEL_69;
        }
        uint64_t v14 = a3[2];
        unint64_t v34 = a4 + v33 * v12;
        unint64_t v35 = a4 + v14 * v33;
        goto LABEL_67;
      }
      if (__OFSUB__(0, v14))
      {
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
        goto LABEL_93;
      }
      if (v14 > 0)
      {
        v15 -= v14;
        uint64_t v43 = type metadata accessor for ActorQueue.QueuedTask();
        sub_25E03BA54(a4, v14, a4 + *(void *)(*(void *)(v43 - 8) + 72) * v15);
        sub_25E0CB820(0, v14, a3);
        uint64_t result = sub_25E0CB820(v15, v14, a3);
      }
      BOOL v19 = __OFSUB__(v6, v14);
      v6 -= v14;
      if (v19) {
        goto LABEL_92;
      }
      goto LABEL_65;
    }
    if (v16 >= result)
    {
      if (v6 > 0)
      {
        uint64_t v41 = type metadata accessor for ActorQueue.QueuedTask();
        sub_25E03BA54(a4 + *(void *)(*(void *)(v41 - 8) + 72) * v7, v6, a4 + *(void *)(*(void *)(v41 - 8) + 72) * v12);
        uint64_t v42 = v7;
LABEL_68:
        sub_25E0CB820(v42, v6, a3);
        uint64_t result = sub_25E0CB820(v12, v6, a3);
        goto LABEL_69;
      }
      goto LABEL_69;
    }
    if (v15 > 0)
    {
      uint64_t v14 = v9 - v4;
      uint64_t v18 = type metadata accessor for ActorQueue.QueuedTask();
      sub_25E03BA54(a4 + *(void *)(*(void *)(v18 - 8) + 72) * (v9 - v4), v15, a4);
      sub_25E0CB820(v9 - v4, v15, a3);
      uint64_t result = sub_25E0CB820(0, v15, a3);
    }
    BOOL v19 = __OFSUB__(v6, v15);
    v6 -= v15;
    if (!v19)
    {
LABEL_65:
      if (v6 >= 1)
      {
        uint64_t v14 = a3[2];
        uint64_t v44 = *(void *)(*(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72);
        unint64_t v34 = a4 + v44 * v12;
        unint64_t v35 = a4 + v44 * v14;
LABEL_67:
        sub_25E03BA54(v35, v6, v34);
        uint64_t v42 = v14;
        goto LABEL_68;
      }
LABEL_69:
      a3[2] = v12;
      uint64_t v45 = a3[1];
      BOOL v19 = __OFSUB__(v45, v4);
      uint64_t v46 = v45 - v4;
      if (!v19) {
        goto LABEL_81;
      }
      __break(1u);
      goto LABEL_72;
    }
    __break(1u);
  }
  uint64_t result = sub_25E0CB820(result, v8, a3);
  uint64_t v20 = v8 - v4;
  if (__OFSUB__(v8, v4))
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  uint64_t v8 = v4;
  uint64_t v21 = v20 + v7;
  if (v21 >= v9) {
    uint64_t v22 = v9;
  }
  else {
    uint64_t v22 = 0;
  }
  if (v12)
  {
    uint64_t v23 = result;
    uint64_t v24 = v21 - v22;
    if (v21 - v22 <= 0) {
      uint64_t v25 = v9;
    }
    else {
      uint64_t v25 = v21 - v22;
    }
    if (result <= 0) {
      uint64_t v26 = v9;
    }
    else {
      uint64_t v26 = result;
    }
    if (v15 >= v26)
    {
      uint64_t v36 = v9 - v15;
      BOOL v37 = __OFSUB__(v9, v15);
      if (v25 >= v14)
      {
        if (v37)
        {
LABEL_93:
          __break(1u);
          return result;
        }
        if (v36 > 0)
        {
          uint64_t v48 = type metadata accessor for ActorQueue.QueuedTask();
          sub_25E03BA54(a4 + *(void *)(*(void *)(v48 - 8) + 72) * v15, v9 - v15, a4 + *(void *)(*(void *)(v48 - 8) + 72) * v14);
          sub_25E0CB820(v15, v9 - v15, a3);
          uint64_t result = sub_25E0CB820(v14, v9 - v15, a3);
          uint64_t v14 = result;
        }
        if (v23 >= 1)
        {
          uint64_t v49 = type metadata accessor for ActorQueue.QueuedTask();
          sub_25E03BA54(a4, v23, a4 + *(void *)(*(void *)(v49 - 8) + 72) * v14);
          sub_25E0CB820(0, v23, a3);
          uint64_t v30 = v14;
          uint64_t v31 = v23;
          goto LABEL_79;
        }
      }
      else
      {
        if (v37)
        {
LABEL_90:
          __break(1u);
          goto LABEL_91;
        }
        if (v36 > 0)
        {
          uint64_t v38 = type metadata accessor for ActorQueue.QueuedTask();
          sub_25E03BA54(a4 + *(void *)(*(void *)(v38 - 8) + 72) * v15, v9 - v15, a4 + *(void *)(*(void *)(v38 - 8) + 72) * v14);
          sub_25E0CB820(v15, v9 - v15, a3);
          uint64_t v14 = sub_25E0CB820(v14, v9 - v15, a3);
        }
        uint64_t v39 = *(void *)(*(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72);
        sub_25E03BA54(a4, v8, a4 + v39 * v14);
        uint64_t v40 = sub_25E0CB820(0, v8, a3);
        uint64_t result = sub_25E0CB820(v14, v8, a3);
        if (v24 >= 1)
        {
          sub_25E03BA54(a4 + v40 * v39, v24, a4);
          sub_25E0CB820(v40, v24, a3);
          uint64_t v30 = 0;
          uint64_t v31 = v24;
          goto LABEL_79;
        }
      }
    }
    else
    {
      if (v25 >= v14)
      {
LABEL_72:
        if (v12 <= 0) {
          goto LABEL_80;
        }
        uint64_t v47 = type metadata accessor for ActorQueue.QueuedTask();
        sub_25E03BA54(a4 + *(void *)(*(void *)(v47 - 8) + 72) * v15, v12, a4 + *(void *)(*(void *)(v47 - 8) + 72) * v14);
        sub_25E0CB820(v15, v12, a3);
        uint64_t v30 = v14;
        uint64_t v31 = v12;
        goto LABEL_79;
      }
      uint64_t v27 = v9 - v14;
      if (__OFSUB__(v9, v14))
      {
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
        goto LABEL_90;
      }
      if (v27 > 0)
      {
        uint64_t v28 = type metadata accessor for ActorQueue.QueuedTask();
        sub_25E03BA54(a4 + *(void *)(*(void *)(v28 - 8) + 72) * v15, v9 - v14, a4 + *(void *)(*(void *)(v28 - 8) + 72) * v14);
        uint64_t v15 = sub_25E0CB820(v15, v9 - v14, a3);
        uint64_t result = sub_25E0CB820(v14, v9 - v14, a3);
      }
      if (__OFSUB__(v12, v27)) {
        goto LABEL_88;
      }
      if (v12 - v27 >= 1)
      {
        uint64_t v29 = type metadata accessor for ActorQueue.QueuedTask();
        sub_25E03BA54(a4 + *(void *)(*(void *)(v29 - 8) + 72) * v15, v12 - v27, a4);
        sub_25E0CB820(v15, v12 - v27, a3);
        uint64_t v30 = 0;
        uint64_t v31 = v12 - v27;
LABEL_79:
        uint64_t result = sub_25E0CB820(v30, v31, a3);
      }
    }
  }
LABEL_80:
  uint64_t v50 = a3[1];
  BOOL v19 = __OFSUB__(v50, v8);
  uint64_t v46 = v50 - v8;
  if (v19)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
LABEL_81:
  a3[1] = v46;
  return result;
}

uint64_t sub_25E0CDDAC(uint64_t a1)
{
  return sub_25E0C9AA4(a1, v1[2], v1[3], v1[4]);
}

uint64_t *sub_25E0CDDB8(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = result[2];
  uint64_t v4 = *result;
  uint64_t v5 = result[1] + v3;
  if (*result >= v5)
  {
    if (v5 < v3)
    {
      __break(1u);
    }
    else
    {
      uint64_t v7 = type metadata accessor for ActorQueue.QueuedTask();
      uint64_t v9 = *(void *)(v7 - 8);
      uint64_t result = (uint64_t *)(v7 - 8);
      uint64_t v8 = v9;
      if (!__OFSUB__(v5, v3))
      {
        v10[0] = a2 + *(void *)(v8 + 72) * v3;
        v10[1] = v5 - v3;
        uint64_t result = (uint64_t *)sub_25E0CBD4C(v10);
        if (v2) {
          return result;
        }
        return (uint64_t *)(v4 < v5);
      }
    }
    __break(1u);
    return result;
  }
  return (uint64_t *)(v4 < v5);
}

uint64_t sub_25E0CDE78(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5 = a5;
  if (a5) {
    unint64_t v5 = a5 + *(void *)(*(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72) * a3;
  }
  if (a1)
  {
    if (a2)
    {
      if (a4 - a3 < a2)
      {
LABEL_17:
        __break(1u);
LABEL_18:
        uint64_t result = sub_25E0DC1C0();
        __break(1u);
        return result;
      }
      if (v5)
      {
        if (a2 < 0) {
          goto LABEL_18;
        }
        uint64_t v10 = *(void *)(*(void *)(type metadata accessor for ActorQueue.QueuedTask() - 8) + 72) * a2;
        unint64_t v11 = v5 + v10;
        unint64_t v12 = a1 + v10;
        if (v11 > a1 && v12 > v5) {
          goto LABEL_18;
        }
        swift_arrayInitWithCopy();
      }
    }
  }
  else
  {
    a2 = 0;
  }
  uint64_t result = a3 + a2;
  if (__OFADD__(a3, a2))
  {
    __break(1u);
    goto LABEL_17;
  }
  return result;
}

void sub_25E0CDFE8(uint64_t a1)
{
}

void sub_25E0CE01C(uint64_t a1)
{
}

uint64_t sub_25E0CE050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActorQueue.QueuedTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E0CE0B4()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_38_4();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_5(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25E04A1EC;
  uint64_t v3 = OUTLINED_FUNCTION_22_8();
  return sub_25E0C9870(v3, v4, v5, v6);
}

uint64_t sub_25E0CE144(uint64_t a1, uint64_t a2)
{
  return sub_25E0CD0E4(a1, a2, (uint64_t (*)(void))sub_25E0CE15C);
}

void sub_25E0CE15C(uint64_t a1)
{
}

void sub_25E0CE190(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_7_17@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 120);
  uint64_t v5 = v4 + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25E0CA8B0((void *)(v4 + 16), v5, a1);
}

uint64_t OUTLINED_FUNCTION_22_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_10()
{
  return sub_25E05B9AC();
}

uint64_t OUTLINED_FUNCTION_28_11()
{
  return *(void *)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_30_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  sub_25E0A94E8(0);
  return v0 - 8;
}

uint64_t OUTLINED_FUNCTION_36_8()
{
  return sub_25E0DB6F0();
}

void OUTLINED_FUNCTION_37_8(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
  sub_25E053F70();
}

uint64_t OUTLINED_FUNCTION_41_5()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_44_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_45_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_46_4()
{
  return *(void *)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_47_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_48_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_52_5()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_53_5(void *result)
{
  result[2] = v2;
  result[3] = v1;
  result[4] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_54_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_55_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_60_4()
{
  return swift_release();
}

void OUTLINED_FUNCTION_61_3()
{
  *(unsigned char *)(v0 + 128) = 1;
}

uint64_t OUTLINED_FUNCTION_62_3(uint64_t result)
{
  *(void *)(v1 + 304) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_65_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_66_2(uint64_t a1)
{
  *(void *)(v1 + 240) = a1;
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_67_2(uint64_t a1)
{
  *(void *)(v1 + 192) = a1;
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_68_1(uint64_t a1)
{
  *(void *)(v1 + 232) = a1;
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_69_2(uint64_t a1)
{
  *(void *)(v1 + 184) = a1;
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_71_2()
{
  return *(void *)(v0 + 200);
}

uint64_t OUTLINED_FUNCTION_72_2(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 272) = a2;
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_73_2(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 280) = a2;
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_74_2()
{
  return v0;
}

uint64_t WeakCache.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  WeakCache.init()();
  return v0;
}

uint64_t WeakCache.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[7] = *v3;
  return MEMORY[0x270FA2498](sub_25E0CE62C, 0, 0);
}

uint64_t sub_25E0CE62C()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 40);
  long long v7 = *(_OWORD *)(v0 + 24);
  uint64_t v3 = *(void *)(*(void *)(v0 + 48) + 16);
  *(void *)(v0 + 64) = v3;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *(void *)(v4 + 16) = v1[10];
  uint64_t v5 = v1[11];
  *(void *)(v0 + 80) = v5;
  *(void *)(v4 + 24) = v5;
  *(void *)(v4 + 32) = v1[12];
  *(_OWORD *)(v4 + 40) = v7;
  *(void *)(v4 + 56) = v2;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25E0CE6EC, v3, 0);
}

uint64_t sub_25E0CE6EC()
{
  sub_25E0DBCF0();
  ActorBox.withValue<A>(_:)();
  *(void *)(v0 + 88) = 0;
  swift_release();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25E06D46C, 0, 0);
}

uint64_t sub_25E0CE7B8()
{
  OUTLINED_FUNCTION_12();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return v0();
}

uint64_t WeakCache.clean(keys:)(uint64_t a1)
{
  uint64_t v3 = sub_25E0DBA30();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v7 = v1;
  uint64_t v8 = a1;
  sub_25E0CF7F0((uint64_t)&v6[-v4]);
  return sub_25E0DBAA0();
}

uint64_t sub_25E0CE8EC()
{
  swift_unknownObjectWeakInit();

  return swift_unknownObjectRelease();
}

uint64_t WeakCache.init()()
{
  type metadata accessor for WeakCache.WeakRef();
  sub_25E0DB400();
  type metadata accessor for ActorBox();
  uint64_t v2 = sub_25E0DB350();
  *(void *)(v0 + 16) = ActorBox.__allocating_init(value:)((uint64_t)&v2);
  return v0;
}

uint64_t sub_25E0CEA04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t *a7@<X8>)
{
  uint64_t v29 = a4;
  uint64_t v30 = a7;
  uint64_t v25 = *(void *)(a5 - 8);
  unint64_t v12 = (uint64_t *)MEMORY[0x270FA5388](a1);
  uint64_t v27 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v14;
  uint64_t v15 = *v12;
  uint64_t v16 = type metadata accessor for WeakCache.WeakRef();
  uint64_t v26 = a2;
  MEMORY[0x2611CD930](v33, a2, v15, a5, v16, a6);
  uint64_t v17 = sub_25E0DBCF0();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, void *, uint64_t))(v18 + 16))(v31, v33, v17);
  if (v32 == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v31, v17);
  }
  else
  {
    uint64_t v19 = MEMORY[0x2611CF880](v31);
    (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v31, v16);
    if (v19)
    {
      uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v18 + 8))(v33, v17);
      goto LABEL_9;
    }
  }
  if (a3)
  {
    v24[1] = a1;
    uint64_t v21 = swift_retain();
    uint64_t v22 = (uint64_t)v34;
    uint64_t v23 = a3(v21);
    if (v22)
    {
      (*(void (**)(void *, uint64_t))(v18 + 8))(v33, v17);
      return sub_25E04E474((uint64_t)a3);
    }
    uint64_t v19 = v23;
    unint64_t v34 = a3;
    if (v23)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v26, a5);
      swift_unknownObjectRetain();
      sub_25E0CE8EC();
      char v32 = 0;
      sub_25E0DB400();
      sub_25E0DB420();
      sub_25E04E474((uint64_t)v34);
      uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v18 + 8))(v33, v17);
    }
    else
    {
      (*(void (**)(void *, uint64_t))(v18 + 8))(v33, v17);
      uint64_t result = sub_25E04E474((uint64_t)v34);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v18 + 8))(v33, v17);
    uint64_t v19 = 0;
  }
LABEL_9:
  *uint64_t v30 = v19;
  return result;
}

uint64_t sub_25E0CED34@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E0CEA04(a1, *(void *)(v2 + 40), *(uint64_t (**)(uint64_t))(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 32), a2);
}

uint64_t sub_25E0CED58(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v19 = a3;
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(*a2 + 80);
  uint64_t v7 = sub_25E0DBA60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - v9;
  sub_25E05D328();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25E0DBA10();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = 0;
  *((void *)v16 + 3) = 0;
  *((void *)v16 + 4) = v6;
  *((void *)v16 + 5) = *(void *)(v5 + 88);
  *((void *)v16 + 6) = *(void *)(v5 + 96);
  *((void *)v16 + 7) = a2;
  *((void *)v16 + 8) = v19;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v16[v15], v10, v7);
  sub_25E0DB3C0();
  swift_retain();
  sub_25E04C534();
  return swift_release();
}

uint64_t sub_25E0CEF70(uint64_t a1)
{
  return sub_25E0CED58(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25E0CEF78(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  uint64_t v6[5] = *a4;
  return MEMORY[0x270FA2498](sub_25E0CEFC4, 0, 0);
}

uint64_t sub_25E0CEFC4()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = *(void *)(v0[2] + 16);
  v0[6] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  uint64_t v6 = v1[10];
  v0[8] = v6;
  v5[2] = v6;
  v5[3] = v1[11];
  v5[4] = v1[12];
  v5[5] = v3;
  v5[6] = v2;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25E0CF074, v4, 0);
}

uint64_t sub_25E0CF074()
{
  ActorBox.withValue<A>(_:)();
  *(void *)(v0 + 72) = 0;
  swift_release();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25E0CF130, 0, 0);
}

uint64_t sub_25E0CF130()
{
  OUTLINED_FUNCTION_12();
  sub_25E0DBA60();
  sub_25E0DBA50();
  OUTLINED_FUNCTION_9();
  return v0();
}

uint64_t sub_25E0CF198()
{
  OUTLINED_FUNCTION_12();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return v0();
}

uint64_t sub_25E0CF1FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v42 = a3;
  uint64_t v41 = sub_25E0DBA20();
  uint64_t v11 = *(void *)(v41 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)&v36 - v13;
  uint64_t v48 = *(void *)(a4 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v39 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v36 - v17;
  uint64_t v37 = v19;
  MEMORY[0x270FA5388](v16);
  uint64_t v47 = (char *)&v36 - v20;
  if (a2)
  {
    uint64_t v21 = a2;
  }
  else
  {
    type metadata accessor for WeakCache.WeakRef();
    uint64_t v50 = sub_25E0DB3C0();
    sub_25E0DB3B0();
    swift_getWitnessTable();
    uint64_t v21 = sub_25E0DB950();
  }
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  uint64_t v22 = sub_25E0DB840();
  swift_bridgeObjectRelease();
  uint64_t v53 = v22;
  if (v22 == MEMORY[0x2611CDE30](v21, a4)) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v49 = (void (**)(char *, uint64_t *, uint64_t))(v48 + 16);
  uint64_t v45 = (void (**)(char *, char *, uint64_t))(v48 + 32);
  uint64_t v46 = (void (**)(char *, uint64_t))(v48 + 8);
  uint64_t v38 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v43 = a5;
  uint64_t v44 = a1;
  while (1)
  {
    char v24 = sub_25E0DB8E0();
    sub_25E0DB880();
    if ((v24 & 1) == 0) {
      break;
    }
    uint64_t v25 = v47;
    uint64_t v26 = *(void (**)(char *, uint64_t *, uint64_t))(v48 + 16);
    v26(v47, (uint64_t *)(v21+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(void *)(v48 + 72) * v22), a4);
LABEL_9:
    sub_25E0DB3C0();
    MEMORY[0x2611CDE40](&v53, v21, a4);
    swift_bridgeObjectRelease();
    (*v45)(v18, v25, a4);
    uint64_t v27 = *a1;
    uint64_t v28 = type metadata accessor for WeakCache.WeakRef();
    MEMORY[0x2611CD930](&v50, v18, v27, a4, v28, a6);
    if (v51)
    {
      (*v46)(v18, a4);
      uint64_t v29 = sub_25E0DBCF0();
      (*(void (**)(uint64_t *, uint64_t))(*(void *)(v29 - 8) + 8))(&v50, v29);
    }
    else
    {
      uint64_t v30 = a6;
      uint64_t v31 = *(void *)(v28 - 8);
      (*(void (**)(char *, uint64_t *, uint64_t))(v31 + 32))(v52, &v50, v28);
      uint64_t v32 = MEMORY[0x2611CF880](v52);
      swift_unknownObjectRelease();
      if (v32)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v52, v28);
        (*v46)(v18, a4);
        a6 = v30;
      }
      else
      {
        uint64_t v33 = v18;
        unint64_t v34 = v39;
        v26(v39, (uint64_t *)v33, a4);
        uint64_t v50 = 0;
        char v51 = 1;
        sub_25E0DB400();
        sub_25E0DB420();
        v26(v34, (uint64_t *)v33, a4);
        sub_25E0DBA60();
        unint64_t v35 = v40;
        uint64_t v18 = v33;
        sub_25E0DBA40();
        (*v38)(v35, v41);
        (*(void (**)(char *, uint64_t))(v31 + 8))(v52, v28);
        a6 = v30;
        (*v46)(v33, a4);
      }
      a1 = v44;
    }
    uint64_t v22 = v53;
    if (v22 == MEMORY[0x2611CDE30](v21, a4)) {
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t result = sub_25E0DBF00();
  if (v37 == 8)
  {
    uint64_t v50 = result;
    uint64_t v26 = *v49;
    uint64_t v25 = v47;
    (*v49)(v47, &v50, a4);
    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E0CF7F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F580];
  uint64_t v3 = sub_25E0DBA30();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t type metadata accessor for WeakCache.WeakRef()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t WeakCache.deinit()
{
  swift_release();
  return v0;
}

uint64_t WeakCache.__deallocating_deinit()
{
  WeakCache.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_25E0CF8D4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakCache()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for WeakCache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WeakCache);
}

uint64_t dispatch thunk of WeakCache.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_25E0CF974()
{
  uint64_t v1 = sub_25E0DBA60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25E0CFA54(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_25E0DBA60() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (void *)v1[7];
  uint64_t v8 = v1[8];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_25E0CFB58;
  return sub_25E0CEF78(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_25E0CFB58()
{
  OUTLINED_FUNCTION_12();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  return v0();
}

uint64_t sub_25E0CFC44(void *a1)
{
  return sub_25E0CF1FC(a1, v1[5], v1[6], v1[2], v1[3], v1[4]);
}

uint64_t sub_25E0CFC68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    sub_25E0DBFB0();
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      id v6 = v5;
      id v7 = v5;
      sub_25E03E530(0, (unint64_t *)&qword_26B384A08);
      sub_25E0730D4();
      swift_dynamicCast();
      MEMORY[0x2611CF510](v5);
      sub_25E0DBF80();
      sub_25E0DBFC0();
      sub_25E0DBFD0();
      sub_25E0DBF90();
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t wrappingErrors<A, B>(in:_:_:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = *(void *)(a7 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v15(v12);
  if (v7)
  {
    uint64_t v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a1, a7);
    uint64_t v18 = a2(v17);
    uint64_t v20 = v19;
    sub_25E0D41E4(0, &qword_26A6D4950, (unint64_t *)&qword_26B384A08, MEMORY[0x263F8E4D8], MEMORY[0x263F8E0F8]);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_25E0DD9C0;
    *(void *)(v21 + 32) = v7;
    type metadata accessor for SonicError();
    swift_getWitnessTable();
    swift_allocError();
    _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0((uint64_t)v14, v18, v20, v21, a7, v22);
    return swift_willThrow();
  }
  return result;
}

uint64_t wrappingErrors<A, B>(in:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a8;
  v8[6] = v15;
  v8[3] = a3;
  v8[4] = a4;
  v8[2] = a2;
  v8[7] = *(void *)(a8 - 8);
  v8[8] = swift_task_alloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)a5 + *a5);
  uint64_t v11 = (void *)swift_task_alloc();
  v8[9] = v11;
  *uint64_t v11 = v8;
  v11[1] = sub_25E0D0088;
  return v13(a1);
}

uint64_t sub_25E0D0088()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25E0D01C4, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25E0D01C4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[3];
  OUTLINED_FUNCTION_15_0();
  uint64_t v6 = v5();
  uint64_t v7 = v4(v6);
  uint64_t v9 = v8;
  sub_25E0D41E4(0, &qword_26A6D4950, (unint64_t *)&qword_26B384A08, MEMORY[0x263F8E4D8], MEMORY[0x263F8E0F8]);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25E0DD9C0;
  *(void *)(v10 + 32) = v1;
  type metadata accessor for SonicError();
  swift_getWitnessTable();
  OUTLINED_FUNCTION_25_2();
  _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0(v2, v7, v9, v10, v3, v11);
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_25E0D0334()
{
  return static SonicErrorCode.domainName.getter();
}

uint64_t static SonicErrorCode.domainName.getter()
{
  return sub_25E0DB570();
}

uint64_t sub_25E0D037C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v7 = (char *)v9 - v6;
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  sub_25E0DB630();
  swift_bridgeObjectRelease();
  sub_25E0DB630();
  sub_25E0DC350();
  sub_25E0DB630();
  sub_25E0DB7E0();
  swift_getAssociatedConformanceWitness();
  sub_25E0DC360();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  sub_25E0DB630();
  return v9[0];
}

uint64_t SonicError.init(stringLiteral:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_25E0DB5F0();
  SonicError.Interpolation.init(literalCapacity:interpolationCount:)(a3, a4, &v11);
  v8._countAndFlagsBits = a1;
  v8._object = a2;
  SonicError.Interpolation.appendLiteral(_:)(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = v11;
  return SonicError.init(stringInterpolation:)(&v10, a3, a4);
}

uint64_t SonicError.Interpolation.init(literalCapacity:interpolationCount:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  v24[0] = a1;
  v24[1] = a1;
  void v24[2] = a2;
  v24[3] = a2;
  uint64_t v6 = type metadata accessor for SonicError.Interpolation.State();
  OUTLINED_FUNCTION_0_3();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_17();
  uint64_t v12 = v10 - v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v24 - v14;
  *a3 = MEMORY[0x263F8EE78];
  sub_25E0D0EC4(a1, a2, (uint64_t)v24 - v14);
  sub_25E06AE28();
  uint64_t v16 = *(void *)(*a3 + 16);
  sub_25E06AEE4(v16);
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_15_0();
  v21(v17, v18, v19, v20);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25E0D2E74(v16, v12, a3, v6, WitnessTable);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v15, v6);
}

Swift::Void __swiftcall SonicError.Interpolation.appendLiteral(_:)(Swift::String a1)
{
  uint64_t v2 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v5 = sub_25E0DAC10();
  OUTLINED_FUNCTION_0_3();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5_3();
  uint64_t v11 = v10 - v9;
  v24[0] = countAndFlagsBits;
  v24[1] = object;
  sub_25E0DAC00();
  sub_25E03FD80();
  uint64_t v12 = sub_25E0DBD70();
  unint64_t v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
  swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (v15)
  {
    uint64_t v16 = *v2;
    unint64_t v17 = *(void *)(*v2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v2 = v16;
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v17) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_25E0C2A7C(v16);
      uint64_t v16 = v23;
      *uint64_t v2 = v23;
      if (v17)
      {
LABEL_6:
        if (v17 <= *(void *)(v16 + 16))
        {
          uint64_t v19 = v16 + 40 * (v17 - 1);
          uint64_t v20 = *(void *)(v19 + 56);
          uint64_t v21 = *(void *)(v19 + 64);
          __swift_mutable_project_boxed_opaque_existential_1(v19 + 32, v20);
          uint64_t v22 = (void (*)(void *, void))(*(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 64))(v24, v20, v21);
          sub_25E0DB630();
          v22(v24, 0);
          *uint64_t v2 = v16;
          return;
        }
LABEL_11:
        __break(1u);
        return;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t SonicError.init(stringInterpolation:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(*a1 + 16);
  if (v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v4 + 40 * v5 - 8;
    while (v5 <= *(void *)(v4 + 16))
    {
      sub_25E03DF54(v8, (uint64_t)v30);
      if (v7)
      {
        uint64_t v9 = v31;
        uint64_t v10 = v32;
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, v31);
        uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 88);
        id v12 = v7;
        unint64_t v13 = (void (*)(void *, void))v11(v27, v9, v10);
        uint64_t v15 = v14;
        uint64_t v16 = *v14;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v15 = v16;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_25E056AE0(0, *(void *)(v16 + 16) + 1, 1, v16);
          uint64_t v16 = v23;
          uint64_t *v15 = v23;
        }
        unint64_t v19 = *(void *)(v16 + 16);
        unint64_t v18 = *(void *)(v16 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_25E056AE0(v18 > 1, v19 + 1, 1, v16);
          uint64_t v16 = v24;
          uint64_t *v15 = v24;
        }
        *(void *)(v16 + 16) = v19 + 1;
        *(void *)(v16 + 8 * v19 + 32) = v7;
        v13(v27, 0);
      }
      --v5;
      sub_25E03DF54((uint64_t)v30, (uint64_t)v27);
      uint64_t v20 = v28;
      uint64_t v21 = v29;
      uint64_t v22 = __swift_project_boxed_opaque_existential_1(v27, v28);
      uint64_t v3 = sub_25E0D1B2C((uint64_t)v22, a2, v20, a3, v21);
      MEMORY[0x2611CF510](v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      v8 -= 40;
      uint64_t v7 = (void *)v3;
      if (!v5) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_13:
    uint64_t result = swift_bridgeObjectRelease();
    if (v3)
    {
      v30[0] = v3;
      sub_25E03E530(0, (unint64_t *)&qword_26B384A08);
      type metadata accessor for SonicError();
      return swift_dynamicCast();
    }
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t static SonicError.+ infix(_:_:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SonicError();
  OUTLINED_FUNCTION_6_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a3, a1, v6);
  uint64_t v8 = (uint64_t *)(a3 + *(int *)(v6 + 40));
  id v9 = a2;
  sub_25E06AE40();
  uint64_t v10 = *(void *)(*v8 + 16);
  uint64_t result = sub_25E06AEFC(v10);
  uint64_t v12 = *v8;
  *(void *)(v12 + 16) = v10 + 1;
  *(void *)(v12 + 8 * v10 + 32) = a2;
  *uint64_t v8 = v12;
  return result;
}

uint64_t SonicError.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for SonicError();
  OUTLINED_FUNCTION_6_1();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);

  return v6(a2, a1, v4);
}

uint64_t type metadata accessor for SonicError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SonicError.Interpolation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SonicError.Interpolation.State()
{
  return swift_getGenericMetadata();
}

uint64_t _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a6, a1, a5);
  uint64_t result = type metadata accessor for SonicError();
  uint64_t v11 = (void *)(a6 + *(int *)(result + 36));
  *uint64_t v11 = a2;
  v11[1] = a3;
  *(void *)(a6 + *(int *)(result + 40)) = a4;
  return result;
}

uint64_t sub_25E0D0CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E0DAC10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 24);
  MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, v2, v11);
  uint64_t v15 = (void *)(v2 + *(int *)(a1 + 52));
  uint64_t v16 = v15[1];
  v21[0] = *v15;
  v21[1] = v16;
  sub_25E0DB3C0();
  sub_25E0DAC00();
  sub_25E03FD80();
  uint64_t v17 = sub_25E0DBD70();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_bridgeObjectRelease();
  _s15SonicFoundation0A5ErrorV4code_16underlyingErrorsACyxGx_SSSays0C0_pGtcfC_0((uint64_t)v13, v17, v19, *(void *)(v3 + *(int *)(a1 + 56)), v11, a2);
  return sub_25E0DB3C0();
}

uint64_t sub_25E0D0EC4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  uint64_t result = type metadata accessor for SonicError.Interpolation.State();
  uint64_t v5 = (void *)(a3 + *(int *)(result + 52));
  *uint64_t v5 = 0;
  v5[1] = 0xE000000000000000;
  *(void *)(a3 + *(int *)(result + 56)) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_25E0D0F5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a6, a1, a5);
  uint64_t result = type metadata accessor for SonicError.Interpolation.State();
  uint64_t v11 = (void *)(a6 + *(int *)(result + 52));
  *uint64_t v11 = a2;
  v11[1] = a3;
  *(void *)(a6 + *(int *)(result + 56)) = a4;
  return result;
}

double (*sub_25E0D1014())(void)
{
  return nullsub_1;
}

double (*sub_25E0D1038())(void)
{
  return nullsub_1;
}

void SonicError.Interpolation.appendInterpolation(code:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v75 = a1;
  uint64_t v4 = *(void *)(a2 + 16);
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5_3();
  uint64_t v10 = v9 - v8;
  uint64_t v12 = *(void *)(v11 + 24);
  *(void *)&long long v76 = v4;
  *((void *)&v76 + 1) = v4;
  uint64_t v77 = v12;
  uint64_t v78 = v12;
  uint64_t v13 = type metadata accessor for SonicError.Interpolation.State();
  uint64_t v14 = sub_25E0DBCF0();
  OUTLINED_FUNCTION_0_3();
  unint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v69 - v18;
  OUTLINED_FUNCTION_0_3();
  uint64_t v73 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_5_17();
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v69 - v26;
  uint64_t v74 = v3;
  uint64_t v28 = *v3;
  uint64_t v29 = *(void *)(*v3 + 16);
  if (!v29)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v71 = v25;
  uint64_t v72 = v24;
  sub_25E03DF54(v28 + 40 * v29 - 8, (uint64_t)&v76);
  sub_25E03E530(0, &qword_26A6D4960);
  if (!swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 1, 1, v13);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v14);
    uint64_t v41 = (*((uint64_t (**)(uint64_t, uint64_t, uint64_t))v6 + 2))(v10, v75, v4);
    OUTLINED_FUNCTION_2_12(v41, v42, v43, MEMORY[0x263F8EE78]);
    uint64_t v44 = v74;
    sub_25E06AE28();
    uint64_t v45 = *(void *)(*v44 + 16);
    sub_25E06AEE4(v45);
    uint64_t v46 = v71;
    OUTLINED_FUNCTION_15_0();
    v47();
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_25E0D2E74(v45, v46, v44, v13, WitnessTable);
    uint64_t v49 = OUTLINED_FUNCTION_18_11();
    v50(v49);
    uint64_t v51 = OUTLINED_FUNCTION_12_13();
    v53._uint64_t countAndFlagsBits = sub_25E0D037C(v51, v52);
    SonicError.Interpolation.appendLiteral(_:)(v53);
    swift_bridgeObjectRelease();
    return;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v13);
  uint64_t v30 = v73;
  (*((void (**)(char *, char *, uint64_t))v73 + 4))(v27, v19, v13);
  uint64_t v31 = OUTLINED_FUNCTION_12_13();
  v32(v31);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  char v33 = sub_25E0DC3F0();
  (*((void (**)(uint64_t, uint64_t))v6 + 1))(v10, v4);
  if (v33)
  {
    (*((void (**)(char *, uint64_t, uint64_t))v6 + 3))(v27, v75, v4);
    uint64_t v3 = v74;
    uint64_t v19 = (char *)*v74;
    unint64_t v34 = v30;
    unint64_t v16 = *(void *)(*v74 + 16);
    uint64_t v78 = v13;
    uint64_t v79 = swift_getWitnessTable();
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v76);
    OUTLINED_FUNCTION_15_0();
    v35();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v3 = (uint64_t)v19;
    uint64_t v6 = v27;
    uint64_t v27 = v34;
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v16) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
LABEL_12:
    sub_25E0C2A7C((uint64_t)v19);
    uint64_t v19 = v68;
    *uint64_t v3 = (uint64_t)v68;
    if (v16)
    {
LABEL_6:
      if (v16 <= *((void *)v19 + 2))
      {
        uint64_t v37 = (uint64_t)&v19[40 * v16 - 8];
        __swift_destroy_boxed_opaque_existential_1(v37);
        sub_25E03DF3C(&v76, v37);
        uint64_t v38 = OUTLINED_FUNCTION_12_13();
        v40._uint64_t countAndFlagsBits = sub_25E0D037C(v38, v39);
        SonicError.Interpolation.appendLiteral(_:)(v40);
        swift_bridgeObjectRelease();
        (*((void (**)(char *, uint64_t))v27 + 1))(v6, v13);
        return;
      }
      goto LABEL_14;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  uint64_t v54 = (*((uint64_t (**)(uint64_t, uint64_t, uint64_t))v6 + 2))(v10, v75, v4);
  unint64_t v70 = v27;
  OUTLINED_FUNCTION_2_12(v54, v55, v56, MEMORY[0x263F8EE78]);
  uint64_t v57 = v74;
  sub_25E06AE28();
  uint64_t v58 = *(void *)(*v57 + 16);
  sub_25E06AEE4(v58);
  unint64_t v59 = v30;
  uint64_t v60 = v71;
  OUTLINED_FUNCTION_15_0();
  v61();
  uint64_t v62 = swift_getWitnessTable();
  sub_25E0D2E74(v58, v60, v57, v13, v62);
  uint64_t v63 = (void (*)(uint64_t))*((void *)v59 + 1);
  uint64_t v64 = OUTLINED_FUNCTION_18_11();
  v63(v64);
  uint64_t v65 = OUTLINED_FUNCTION_12_13();
  v67._uint64_t countAndFlagsBits = sub_25E0D037C(v65, v66);
  SonicError.Interpolation.appendLiteral(_:)(v67);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v63)(v70, v13);
}

uint64_t SonicError.Interpolation.appendInterpolation<A>(underlying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v33 = a4;
  uint64_t v34 = a1;
  OUTLINED_FUNCTION_0_3();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_3();
  uint64_t v12 = v11 - v10;
  uint64_t v14 = *(void *)(v13 + 24);
  uint64_t v35 = *(void *)(v13 + 16);
  uint64_t v36 = v15;
  uint64_t v37 = v14;
  uint64_t v38 = v16;
  uint64_t v17 = type metadata accessor for SonicError.Interpolation.State();
  OUTLINED_FUNCTION_0_3();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_5_17();
  uint64_t v23 = v21 - v22;
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v33 - v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v12, v34, a3);
  uint64_t v27 = v33;
  sub_25E0D0F5C(v12, 0, 0xE000000000000000, MEMORY[0x263F8EE78], a3, (uint64_t)v26);
  sub_25E06AE28();
  uint64_t v28 = *(void *)(*v5 + 16);
  sub_25E06AEE4(v28);
  OUTLINED_FUNCTION_15_0();
  v29();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25E0D2E74(v28, v23, v5, v17, WitnessTable);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v26, v17);
  v31._uint64_t countAndFlagsBits = sub_25E0D037C(a3, v27);
  SonicError.Interpolation.appendLiteral(_:)(v31);
  return swift_bridgeObjectRelease();
}

void SonicError.Interpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_3();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_6();
  unint64_t v10 = *(void *)(*v5 + 16);
  OUTLINED_FUNCTION_15_0();
  v11();
  uint64_t v12 = sub_25E0DC340();
  if (v12)
  {
    uint64_t v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v4, a3);
  }
  else
  {
    uint64_t v13 = OUTLINED_FUNCTION_25_2();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v14, v4, a3);
  }
  uint64_t v15 = *v5;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v5 = v15;
  if (isUniquelyReferenced_nonNull_native)
  {
    if (v10) {
      goto LABEL_6;
    }
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  sub_25E0C2A7C(v15);
  uint64_t v15 = v25;
  *uint64_t v5 = v25;
  if (!v10) {
    goto LABEL_9;
  }
LABEL_6:
  if (v10 <= *(void *)(v15 + 16))
  {
    uint64_t v17 = v15 + 40 * v10;
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t v19 = *(void *)(v17 + 24);
    __swift_mutable_project_boxed_opaque_existential_1(v17 - 8, v18);
    uint64_t v20 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v19 + 88))(v26, v18, v19);
    uint64_t v22 = v21;
    sub_25E06AE40();
    uint64_t v23 = *(void *)(*v22 + 16);
    sub_25E06AEFC(v23);
    uint64_t v24 = *v22;
    *(void *)(v24 + 16) = v23 + 1;
    *(void *)(v24 + 8 * v23 + 32) = v13;
    v20(v26, 0);
    *uint64_t v5 = v15;
    return;
  }
LABEL_10:
  __break(1u);
}

uint64_t SonicError.Interpolation.appendInterpolation<A>(_:)()
{
  v0._uint64_t countAndFlagsBits = sub_25E0DC2D0();
  SonicError.Interpolation.appendLiteral(_:)(v0);

  return swift_bridgeObjectRelease();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;

  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_5_3();
  (*(void (**)(uint64_t))(v3 + 16))(v2 - v1);
  v4._uint64_t countAndFlagsBits = sub_25E0DB550();
  SonicError.Interpolation.appendLiteral(_:)(v4);
  return swift_bridgeObjectRelease();
}

uint64_t SonicError.Interpolation.appendInterpolation(_:)()
{
  sub_25E0D2F0C();
  v0._uint64_t countAndFlagsBits = sub_25E0DB550();
  SonicError.Interpolation.appendLiteral(_:)(v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0D1B14@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  return SonicError.Interpolation.init(literalCapacity:interpolationCount:)(*(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

void sub_25E0D1B20(Swift::String *a1)
{
}

uint64_t sub_25E0D1B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(a5 + 96);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for SonicError();
  swift_getWitnessTable();
  uint64_t v8 = swift_allocError();
  v7(a3, a5);
  return v8;
}

uint64_t SonicError.code.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t SonicError.code.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2, a1);
}

double (*SonicError.code.modify())(void)
{
  return nullsub_1;
}

uint64_t SonicError.debugMessage.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  sub_25E0DB3C0();
  return v2;
}

uint64_t SonicError.debugMessage.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3 + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

double (*SonicError.debugMessage.modify())(void)
{
  return nullsub_1;
}

uint64_t SonicError.underlyingErrors.getter()
{
  return sub_25E0DB3C0();
}

uint64_t SonicError.underlyingErrors.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + v4) = a1;
  return result;
}

double (*SonicError.underlyingErrors.modify())(void)
{
  return nullsub_1;
}

uint64_t SonicError.withUnderlyingErrors(_:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_15_0();
  v7();
  uint64_t v8 = sub_25E0DB3C0();
  sub_25E05B080(v8);
  swift_getWitnessTable();
  uint64_t v9 = OUTLINED_FUNCTION_25_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v10, v2, a2);
  return v9;
}

uint64_t SonicError.codeDescription.getter(uint64_t a1)
{
  return sub_25E0D037C(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_25E0D1EA0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2670](a1, WitnessTable);
}

uint64_t sub_25E0D1EF4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2668](a1, WitnessTable);
}

uint64_t sub_25E0D1F48(uint64_t *a1, uint64_t a2)
{
  return SonicError.init(stringInterpolation:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_25E0D1F5C(uint64_t a1, uint64_t a2)
{
  return SonicError.init(stringLiteral:)(*(void *)a1, *(void **)(a1 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t static SonicError.errorDomain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t SonicError.errorCode.getter()
{
  swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(*(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x270FA5388](v0);
  uint64_t v56 = (char *)&v52 - v1;
  uint64_t v2 = swift_checkMetadataState();
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_17();
  uint64_t v55 = v6 - v7;
  OUTLINED_FUNCTION_17_9();
  MEMORY[0x270FA5388](v8);
  uint64_t v58 = (char *)&v52 - v9;
  OUTLINED_FUNCTION_17_9();
  MEMORY[0x270FA5388](v10);
  uint64_t v60 = (char *)&v52 - v11;
  OUTLINED_FUNCTION_17_9();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  unint64_t v59 = (char *)&v52 - v14;
  OUTLINED_FUNCTION_17_9();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v52 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v52 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v52 - v22;
  sub_25E0DB7E0();
  char v24 = OUTLINED_FUNCTION_1_21();
  unint64_t v61 = (void (*)(char *, char *, uint64_t))v4[2];
  v61(v21, v23, v2);
  if ((v24 & 1) == 0)
  {
    uint64_t v29 = (void (*)(void))v4[1];
    OUTLINED_FUNCTION_14_11();
    v29();
    goto LABEL_20;
  }
  uint64_t v25 = OUTLINED_FUNCTION_8_17();
  Swift::String v53 = v4;
  uint64_t v26 = (uint64_t (*)(void))v4[1];
  OUTLINED_FUNCTION_4_15();
  v27();
  if (v25 <= 64)
  {
    uint64_t v4 = v53;
    uint64_t v29 = (void (*)(void))v26;
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_10_14();
  v28();
  int64_t v63 = 0x8000000000000000;
  if (OUTLINED_FUNCTION_1_21())
  {
    if (OUTLINED_FUNCTION_8_17() < 64)
    {
LABEL_14:
      uint64_t v35 = OUTLINED_FUNCTION_16_10();
      uint64_t v29 = (void (*)(void))v26;
      OUTLINED_FUNCTION_4_15();
      uint64_t result = v26();
      uint64_t v4 = v53;
      if (v35 < v63) {
        goto LABEL_34;
      }
LABEL_20:
      uint64_t v40 = OUTLINED_FUNCTION_8_17();
      OUTLINED_FUNCTION_10_14();
      v41();
      if (v40 < 65)
      {
        uint64_t v42 = OUTLINED_FUNCTION_8_17();
        OUTLINED_FUNCTION_14_11();
        v29();
        if (v42 != 64 || (OUTLINED_FUNCTION_1_21() & 1) != 0) {
          goto LABEL_32;
        }
      }
      else
      {
        OUTLINED_FUNCTION_14_11();
        v29();
      }
      uint64_t v43 = v60;
      v61(v60, v23, v2);
      int64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
      char v44 = OUTLINED_FUNCTION_1_21();
      uint64_t v45 = OUTLINED_FUNCTION_8_17();
      if (v44)
      {
        if (v45 > 64)
        {
          unint64_t v46 = sub_25E07036C();
          OUTLINED_FUNCTION_9_16((uint64_t)&v63, MEMORY[0x263F8D6C8], v46);
          char v47 = sub_25E0DB490();
          OUTLINED_FUNCTION_42_0();
          v29();
          while (1)
          {
            OUTLINED_FUNCTION_42_0();
            v29();
            if ((v47 & 1) == 0) {
              break;
            }
LABEL_29:
            __break(1u);
LABEL_30:
            uint64_t v62 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v49 = (void (*)(char *, char *, uint64_t))v4[4];
            v4 += 4;
            v49(v59, v43, v2);
            unint64_t v50 = sub_25E07036C();
            uint64_t v43 = v58;
            OUTLINED_FUNCTION_9_16((uint64_t)&v62, MEMORY[0x263F8D6C8], v50);
            char v47 = sub_25E0DB490();
            OUTLINED_FUNCTION_42_0();
            v29();
          }
          goto LABEL_32;
        }
      }
      else if (v45 > 63)
      {
        goto LABEL_30;
      }
      uint64_t v48 = OUTLINED_FUNCTION_16_10();
      OUTLINED_FUNCTION_42_0();
      v29();
      if (v63 < v48) {
        goto LABEL_29;
      }
LABEL_32:
      uint64_t v51 = OUTLINED_FUNCTION_16_10();
      ((void (*)(char *, uint64_t))v29)(v23, v2);
      return v51;
    }
LABEL_10:
    unint64_t v32 = sub_25E07036C();
    OUTLINED_FUNCTION_9_16((uint64_t)&v63, MEMORY[0x263F8D6C8], v32);
    char v33 = OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_4_15();
    v26();
    uint64_t v29 = (void (*)(void))v26;
    OUTLINED_FUNCTION_4_15();
    uint64_t result = v26();
    uint64_t v4 = v53;
    if ((v33 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_34;
  }
  char v30 = OUTLINED_FUNCTION_1_21();
  uint64_t v31 = OUTLINED_FUNCTION_8_17();
  if ((v30 & 1) == 0)
  {
    if (v31 >= 64)
    {
      uint64_t v29 = (void (*)(void))v26;
      OUTLINED_FUNCTION_4_15();
      v26();
      uint64_t v4 = v53;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (v31 > 64) {
    goto LABEL_10;
  }
  swift_getAssociatedConformanceWitness();
  sub_25E0DC400();
  sub_25E0DC370();
  LODWORD(v57) = OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_4_15();
  v26();
  uint64_t v36 = v55;
  ((void (*)(uint64_t, char *, uint64_t))v53[4])(v55, v18, v2);
  if ((v57 & 1) == 0)
  {
    int64_t v37 = v63;
    uint64_t v38 = OUTLINED_FUNCTION_16_10();
    OUTLINED_FUNCTION_4_15();
    uint64_t result = v26();
    BOOL v39 = v38 < v37;
    uint64_t v4 = v53;
    uint64_t v29 = (void (*)(void))v26;
    if (v39) {
      goto LABEL_34;
    }
    goto LABEL_20;
  }
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v26)(v36, v2);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t SonicError.errorUserInfo.getter(uint64_t a1)
{
  uint64_t v9 = sub_25E0DB3A0();
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(a1 + 36));
  uint64_t v5 = *v3;
  unint64_t v4 = v3[1];
  uint64_t v6 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    sub_25E0DB500();
    sub_25E0DB3C0();
    sub_25E070A3C();
  }
  uint64_t v7 = *(void *)(v1 + *(int *)(a1 + 40));
  if (*(void *)(v7 + 16))
  {
    sub_25E0DB500();
    sub_25E0CFC68(v7);
    sub_25E0D2F4C();
    sub_25E070A3C();
  }
  return v9;
}

uint64_t sub_25E0D273C(uint64_t a1)
{
  return static SonicError.errorDomain.getter(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t SonicError.description.getter(uint64_t a1)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0xE000000000000000;
  swift_getWitnessTable();
  unint64_t v4 = (void *)OUTLINED_FUNCTION_25_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(v5, v1, a1);
  sub_25E0D285C(v4, 0, v3);
  MEMORY[0x2611CF510](v4);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v3 + 16);
  sub_25E0DB3C0();
  swift_release();
  return v6;
}

void sub_25E0D285C(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  *(void *)&long long v43 = 0;
  *((void *)&v43 + 1) = 0xE000000000000000;
  if (a2)
  {
    uint64_t v6 = a2;
    do
    {
      sub_25E0DB630();
      --v6;
    }
    while (v6);
    long long v46 = v43;
    if (a2 > 0)
    {
      swift_beginAccess();
      sub_25E0DB630();
      swift_endAccess();
      sub_25E0DB630();
    }
  }
  else
  {
    *(void *)&long long v46 = 0;
    *((void *)&v46 + 1) = 0xE000000000000000;
  }
  *(void *)&long long v38 = a1;
  id v7 = a1;
  sub_25E03E530(0, (unint64_t *)&qword_26B384A08);
  sub_25E03E530(0, &qword_26B384960);
  if (swift_dynamicCast())
  {
    sub_25E03DF3C(&v40, (uint64_t)&v43);
    uint64_t v8 = v44;
    uint64_t v9 = v45;
    __swift_project_boxed_opaque_existential_1(&v43, v44);
    (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
    uint64_t v10 = v44;
    uint64_t v11 = v45;
    __swift_project_boxed_opaque_existential_1(&v43, v44);
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v10, v11);
    uint64_t v14 = v13;
    swift_beginAccess();
    sub_25E0DB630();
    swift_endAccess();
    swift_bridgeObjectRelease();
    if ((sub_25E0DB6B0() & 1) == 0)
    {
      *(void *)&long long v40 = v12;
      *((void *)&v40 + 1) = v14;
      sub_25E0DB3C0();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_25E0DB630();
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_25E0DB630();
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v16 = v44;
    uint64_t v15 = v45;
    __swift_project_boxed_opaque_existential_1(&v43, v44);
    uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)(v15 + 8) + 8))(v16);
    uint64_t v18 = *(void *)(v17 + 16);
    if (!v18) {
      goto LABEL_27;
    }
    BOOL v19 = __OFADD__(a2, 1);
    uint64_t v20 = a2 + 1;
    if (!v19)
    {
      uint64_t v21 = (void **)(v17 + 32);
      do
      {
        uint64_t v22 = *v21++;
        id v23 = v22;
        sub_25E0D285C(v22, v20, a3);
        MEMORY[0x2611CF510](v22);
        --v18;
      }
      while (v18);
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  uint64_t v42 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  sub_25E0D415C((uint64_t)&v40);
  char v24 = (void *)sub_25E0DADB0();
  id v25 = objc_msgSend(v24, sel_userInfo, (void)v38);
  uint64_t v26 = sub_25E0DB390();

  sub_25E0DB500();
  sub_25E055560(v26, &v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v41 + 1))
  {
    sub_25E040108(&v40, &v43);
  }
  else
  {
    id v27 = objc_msgSend(v24, sel_userInfo);
    uint64_t v28 = MEMORY[0x263F8D310];
    uint64_t v29 = sub_25E0DB390();

    sub_25E0DB500();
    sub_25E055560(v29, &v38);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39)
    {
      sub_25E040108(&v38, &v43);
    }
    else
    {
      uint64_t v44 = v28;
      *(void *)&long long v43 = 0xD00000000000001ELL;
      *((void *)&v43 + 1) = 0x800000025E0E5760;
      sub_25E07305C((uint64_t)&v38);
    }
    sub_25E07305C((uint64_t)&v40);
  }
  *(void *)&long long v40 = 0;
  *((void *)&v40 + 1) = 0xE000000000000000;
  sub_25E0DB630();
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend(v24, sel_domain);
  sub_25E0DB500();

  sub_25E0DB630();
  swift_bridgeObjectRelease();
  sub_25E0DB630();
  *(void *)&long long v38 = objc_msgSend(v24, sel_code);
  sub_25E0DC2D0();
  sub_25E0DB630();
  swift_bridgeObjectRelease();
  sub_25E0DB630();
  sub_25E0DC0D0();
  swift_beginAccess();
  sub_25E0DB630();
  swift_endAccess();
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v24, sel_underlyingErrors);
  uint64_t v32 = sub_25E0DB830();

  uint64_t v33 = *(void *)(v32 + 16);
  if (!v33)
  {
LABEL_26:

LABEL_27:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v43);
    return;
  }
  BOOL v19 = __OFADD__(a2, 1);
  uint64_t v34 = a2 + 1;
  if (!v19)
  {
    uint64_t v35 = (void **)(v32 + 32);
    do
    {
      uint64_t v36 = *v35++;
      id v37 = v36;
      sub_25E0D285C(v36, v34, a3);
      MEMORY[0x2611CF510](v36);
      --v33;
    }
    while (v33);
    goto LABEL_26;
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_25E0D2E74(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_25E03DF3C(&v12, v10 + 40 * a1 + 32);
}

unint64_t sub_25E0D2F0C()
{
  unint64_t result = qword_26A6D60F8;
  if (!qword_26A6D60F8)
  {
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6D60F8);
  }
  return result;
}

void sub_25E0D2F4C()
{
  if (!qword_26B3849F0)
  {
    sub_25E0730D4();
    unint64_t v0 = sub_25E0DB940();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B3849F0);
    }
  }
}

uint64_t sub_25E0D2FA4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E0D2FDC()
{
  return MEMORY[0x263F8D388];
}

uint64_t sub_25E0D2FE8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E0D3004()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E0D3020()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E0D303C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E0D3058()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_25E0D3064()
{
  return MEMORY[0x263F8D390];
}

uint64_t sub_25E0D3070()
{
  return swift_getWitnessTable();
}

uint64_t dispatch thunk of static SonicErrorCode.domainName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static SonicErrorCode.unknown.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25E0D30B4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25E0D315C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    void *v10 = *v11;
    v10[1] = v11[1];
    *(void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    sub_25E0DB3C0();
    sub_25E0DB3C0();
  }
  return v4;
}

uint64_t sub_25E0D3288(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0D3308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  return a1;
}

uint64_t sub_25E0D33B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25E0D346C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_25E0D34F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25E0D35A4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
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
        JUMPOUT(0x25E0D36E8);
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
  if (v5 >= 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_25E0D36FC(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
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
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
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
      JUMPOUT(0x25E0D38DCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            void *v17 = a2 ^ 0x80000000;
            v17[1] = 0;
          }
          else
          {
            v17[1] = (a2 - 1);
          }
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_25E0D3904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_25E0D390C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25E0D39B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    void *v10 = *v11;
    v10[1] = v11[1];
    *(void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    sub_25E0DB3C0();
    sub_25E0DB3C0();
  }
  return v4;
}

uint64_t sub_25E0D3AE0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0D3B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  return a1;
}

uint64_t sub_25E0D3C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25E0D3CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_25E0D3D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25E0D3DFC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
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
        JUMPOUT(0x25E0D3F40);
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
  if (v5 >= 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_25E0D3F54(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
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
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
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
      JUMPOUT(0x25E0D4134);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            void *v17 = a2 ^ 0x80000000;
            v17[1] = 0;
          }
          else
          {
            v17[1] = (a2 - 1);
          }
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_25E0D415C(uint64_t a1)
{
  sub_25E0D41E4(0, qword_26B384968, &qword_26B384960, (uint64_t)&protocol descriptor for _SonicError, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25E0D41E4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_25E03E530(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_2_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(v6 - 152);
  return sub_25E0D0F5C(v5, 0, 0xE000000000000000, a4, v4, v8);
}

uint64_t OUTLINED_FUNCTION_12_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_10()
{
  return sub_25E0DB490();
}

uint64_t OUTLINED_FUNCTION_18_11()
{
  return v0;
}

char *sub_25E0D42C8(int a1)
{
  uint64_t v3 = sub_25E0DB500();
  uint64_t v5 = v4;
  sub_25E0D54A0(0, (unint64_t *)&qword_26A6D5000, (uint64_t (*)(uint64_t))sub_25E07403C, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E0DEAA0;
  *(void *)(inited + 32) = sub_25E0DB500();
  *(void *)(inited + 40) = v7;
  uint64_t v8 = sub_25E0DAEA0();
  *(void *)(inited + 72) = v8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_0, v1, v8);
  *(void *)(inited + 80) = sub_25E0DB500();
  *(void *)(inited + 88) = v10;
  uint64_t result = strerror(a1);
  if (result)
  {
    uint64_t v12 = MEMORY[0x2611CDAC0]();
    *(void *)(inited + 120) = MEMORY[0x263F8D310];
    if (!v13)
    {
      sub_25E0DBE80();
      swift_bridgeObjectRelease();
      sub_25E0DC2D0();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      uint64_t v12 = 0xD000000000000013;
      unint64_t v13 = 0x800000025E0E5780;
    }
    *(void *)(inited + 96) = v12;
    *(void *)(inited + 104) = v13;
    uint64_t v14 = a1;
    uint64_t v15 = sub_25E0DB3A0();
    id v16 = objc_allocWithZone(MEMORY[0x263F087E8]);
    return (char *)sub_25E0D4F98(v3, v5, v14, v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t URL.coreURL.getter@<X0>(uint64_t a1@<X8>)
{
  sub_25E0D54A0(0, &qword_26A6D6200, MEMORY[0x263F06370], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - v3;
  uint64_t v5 = sub_25E0DACF0();
  OUTLINED_FUNCTION_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E0DAC90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_25E0D5318((uint64_t)v4, &qword_26A6D6200, MEMORY[0x263F06370]);
    uint64_t v11 = sub_25E0DAEA0();
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v11);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v4, v5);
    OUTLINED_FUNCTION_5_18();
    sub_25E0DACB0();
    OUTLINED_FUNCTION_5_18();
    sub_25E0DACE0();
    OUTLINED_FUNCTION_5_18();
    sub_25E0DACC0();
    OUTLINED_FUNCTION_5_18();
    sub_25E0DACD0();
    sub_25E0DACA0();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  }
}

uint64_t sub_25E0D4690()
{
  sub_25E0D54A0(0, &qword_26A6D57A8, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v80 = &v68[-v1];
  uint64_t v2 = sub_25E0DAEA0();
  OUTLINED_FUNCTION_1();
  uint64_t v77 = v3;
  MEMORY[0x270FA5388](v4);
  uint64_t v81 = &v68[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_25E0DADA0();
  OUTLINED_FUNCTION_1();
  uint64_t v78 = v7;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  long long v76 = &v68[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v79 = &v68[-v12];
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v68[-v14];
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (void (*)(uint64_t))&v68[-v16];
  uint64_t v18 = (char *)self;
  id v19 = objc_msgSend(v18, sel_defaultManager);
  sub_25E0DAE50();
  uint64_t v20 = (void *)sub_25E0DB4D0();
  swift_bridgeObjectRelease();
  unsigned int v21 = objc_msgSend(v19, sel_fileExistsAtPath_, v20);

  if (!v21) {
    return 0;
  }
  uint64_t v71 = (void (**)(unsigned char *, unsigned char *, uint64_t))v15;
  uint64_t v72 = v18;
  uint64_t v73 = v2;
  uint64_t v74 = v6;
  sub_25E0D54A0(0, &qword_26A6D59A0, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  long long v75 = xmmword_25E0E2760;
  *(_OWORD *)(inited + 16) = xmmword_25E0E2760;
  id v23 = (void *)*MEMORY[0x263EFF6F0];
  char v24 = (void *)*MEMORY[0x263EFF770];
  *(void *)(inited + 32) = *MEMORY[0x263EFF6F0];
  *(void *)(inited + 40) = v24;
  id v25 = (void *)*MEMORY[0x263EFF688];
  *(void *)(inited + 48) = *MEMORY[0x263EFF688];
  id v26 = v23;
  uint64_t v27 = v24;
  id v28 = v25;
  sub_25E0D50C0(inited);
  uint64_t v29 = v85;
  sub_25E0DAE00();
  swift_bridgeObjectRelease();
  uint64_t v85 = v29;
  if (v29) {
    return v27;
  }
  unint64_t v70 = v17;
  char v31 = sub_25E0DAD70();
  if (v31 == 2)
  {
LABEL_38:
    __break(1u);
  }
  else
  {
    uint64_t v32 = v74;
    if ((v31 & 1) == 0)
    {
      uint64_t v33 = swift_initStackObject();
      *(_OWORD *)(v33 + 16) = v75;
      *(void *)(v33 + 32) = v26;
      *(void *)(v33 + 40) = v27;
      *(void *)(v33 + 48) = v28;
      id v34 = v26;
      id v35 = (id)v27;
      id v36 = v28;
      sub_25E0D50C0(v33);
      uint64_t v38 = v37;
      id v39 = objc_msgSend(v72, sel_defaultManager);
      uint64_t v40 = sub_25E0DB3C0();
      sub_25E0A8A58(v40);
      *(void *)&long long v75 = v38;
      swift_bridgeObjectRelease();
      long long v41 = (void *)sub_25E0DBC60();

      swift_release();
      if (!v41)
      {
        uint64_t v27 = 0;
        long long v83 = 0u;
        long long v84 = 0u;
        id v39 = (id)v78;
        uint64_t v45 = v73;
LABEL_34:
        sub_25E07305C((uint64_t)&v83);
        char v47 = v80;
        __swift_storeEnumTagSinglePayload((uint64_t)v80, 1, 1, v45);
LABEL_36:
        swift_bridgeObjectRelease();

        (*((void (**)(void (*)(uint64_t), uint64_t))v39 + 1))(v70, v32);
        sub_25E0D5318((uint64_t)v47, &qword_26A6D57A8, MEMORY[0x263F06EA8]);
        return v27;
      }
      uint64_t v72 = 0;
      uint64_t v42 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v77 + 32);
      long long v43 = (id *)(v78 + 8);
      uint64_t v27 = v77 + 8;
      uint64_t v71 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v78 + 16);
      uint64_t v77 = MEMORY[0x263F8EE58] + 8;
      uint64_t v44 = v85;
      uint64_t v45 = v73;
      while (1)
      {
        id v46 = objc_msgSend(v41, sel_nextObject);
        if (v46)
        {
          id v39 = v46;
          sub_25E0DBE00();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v82, 0, sizeof(v82));
        }
        char v47 = v80;
        sub_25E0D5388((uint64_t)v82, (uint64_t)&v83);
        if (!*((void *)&v84 + 1))
        {
          OUTLINED_FUNCTION_4_16();
          goto LABEL_34;
        }
        int v48 = swift_dynamicCast();
        __swift_storeEnumTagSinglePayload((uint64_t)v47, v48 ^ 1u, 1, v45);
        if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v45) == 1)
        {
          OUTLINED_FUNCTION_4_16();
          goto LABEL_36;
        }
        (*v42)(v81, v47, v45);
        uint64_t v49 = v79;
        sub_25E0DAE00();
        if (v44)
        {
          uint64_t v85 = v44;
          swift_bridgeObjectRelease();

          uint64_t v65 = OUTLINED_FUNCTION_1_22();
          v66(v65);
          OUTLINED_FUNCTION_2_13();
          v67();
          return v27;
        }
        id v39 = v49;
        if ((sub_25E0DAD70() & 1) == 0)
        {
          ((void (*)(unsigned char *, uint64_t))*v43)(v49, v32);
          goto LABEL_18;
        }
        uint64_t v85 = sub_25E0DAD80();
        char v53 = v52;
        (*v71)(v76, v49, v32);
        if (v53)
        {
          uint64_t v85 = sub_25E0DAD90();
          int v69 = v54;
          id v39 = *v43;
          OUTLINED_FUNCTION_2_13();
          ((void (*)(void))v39)();
          if ((v69 & 1) == 0) {
            goto LABEL_22;
          }
          OUTLINED_FUNCTION_2_13();
          ((void (*)(void))v39)();
LABEL_18:
          uint64_t v50 = OUTLINED_FUNCTION_1_22();
          v51(v50);
        }
        else
        {
          id v39 = *v43;
          OUTLINED_FUNCTION_2_13();
          ((void (*)(void))v39)();
LABEL_22:
          if (v85 < 0) {
            goto LABEL_40;
          }
          OUTLINED_FUNCTION_2_13();
          ((void (*)(void))v39)();
          uint64_t v55 = OUTLINED_FUNCTION_1_22();
          v56(v55);
          BOOL v57 = __CFADD__(v72, v85);
          v72 += v85;
          if (v57)
          {
            __break(1u);
            goto LABEL_38;
          }
        }
      }
    }
    uint64_t v58 = v70;
    uint64_t v27 = sub_25E0DAD80();
    char v60 = v59;
    (*(void (**)(void, void (*)(uint64_t), uint64_t))(v78 + 16))(v71, v58, v32);
    if ((v60 & 1) == 0)
    {
      uint64_t v61 = OUTLINED_FUNCTION_3_15();
      v58(v61);
      goto LABEL_30;
    }
    uint64_t v27 = sub_25E0DAD90();
    char v63 = v62;
    uint64_t v64 = OUTLINED_FUNCTION_3_15();
    v58(v64);
    if ((v63 & 1) == 0)
    {
LABEL_30:
      if ((v27 & 0x8000000000000000) == 0)
      {
        ((void (*)(void (*)(uint64_t), uint64_t))v58)(v70, v32);
        return v27;
      }
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_40:
  uint64_t result = sub_25E0DC130();
  __break(1u);
  return result;
}

uint64_t sub_25E0D4ECC()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unsigned __int8 v4 = 0;
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_25E0DAE50();
  uint64_t v1 = (void *)sub_25E0DB4D0();
  swift_bridgeObjectRelease();
  unsigned int v2 = objc_msgSend(v0, sel_fileExistsAtPath_isDirectory_, v1, &v4);

  if (v2) {
    return v4;
  }
  else {
    return 2;
  }
}

id sub_25E0D4F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_25E0DB4D0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_25E0DB380();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_25E0D5048()
{
  sub_25E0DB500();
  sub_25E0DC4D0();
  sub_25E0DB5E0();
  uint64_t v0 = sub_25E0DC500();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_25E0D50C0(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(void *)(a1 + 16) || (sub_25E0D53EC(), uint64_t v2 = sub_25E0DBE60(), v3 = v2, (v32 = *(void *)(v1 + 16)) == 0))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v4 = 0;
  uint64_t v5 = v2 + 56;
  uint64_t v30 = v1;
  uint64_t v31 = v1 + 32;
  while (v4 < *(void *)(v1 + 16))
  {
    uint64_t v6 = *(void **)(v31 + 8 * v4);
    sub_25E0DB500();
    sub_25E0DC4D0();
    id v7 = v6;
    sub_25E0DB5E0();
    uint64_t v8 = sub_25E0DC500();
    swift_bridgeObjectRelease();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = v8 & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = sub_25E0DB500();
      uint64_t v16 = v15;
      if (v14 == sub_25E0DB500() && v16 == v17)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
LABEL_22:

        goto LABEL_23;
      }
      char v19 = sub_25E0DC380();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_22;
      }
      uint64_t v20 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v20;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v21 = sub_25E0DB500();
        uint64_t v23 = v22;
        if (v21 == sub_25E0DB500() && v23 == v24) {
          goto LABEL_21;
        }
        char v26 = sub_25E0DC380();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v26) {
          goto LABEL_22;
        }
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    *(void *)(*(void *)(v3 + 48) + 8 * v10) = v7;
    uint64_t v27 = *(void *)(v3 + 16);
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_26;
    }
    *(void *)(v3 + 16) = v29;
LABEL_23:
    ++v4;
    uint64_t v1 = v30;
    if (v4 == v32) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

uint64_t sub_25E0D5318(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_25E0D54A0(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_25E0D5388(uint64_t a1, uint64_t a2)
{
  sub_25E0B6C94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25E0D53EC()
{
  if (!qword_26A6D6208)
  {
    type metadata accessor for URLResourceKey(255);
    sub_25E0D5450();
    unint64_t v0 = sub_25E0DBE70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6D6208);
    }
  }
}

unint64_t sub_25E0D5450()
{
  unint64_t result = qword_26A6D4410;
  if (!qword_26A6D4410)
  {
    type metadata accessor for URLResourceKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D4410);
  }
  return result;
}

void sub_25E0D54A0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t Sequence<>.hexString.getter()
{
  sub_25E0DB740();
  sub_25E0BC364();
  sub_25E056704();
  uint64_t v0 = sub_25E0DB480();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25E0D55B8@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3 = *a1;
  sub_25E0991EC();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8E778];
  *(_OWORD *)(v4 + 16) = xmmword_25E0DD9C0;
  uint64_t v6 = MEMORY[0x263F8E7C0];
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = v6;
  *(unsigned char *)(v4 + 32) = v3;
  uint64_t result = sub_25E0DB520();
  *a2 = result;
  a2[1] = v8;
  return result;
}

uint64_t sub_25E0D563C(uint64_t a1)
{
  uint64_t v13 = sub_25E0DAC30();
  uint64_t v3 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v12 = v1;
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_25E03CE0C(0, v6, 0);
    uint64_t v7 = v14;
    uint64_t v8 = a1 + 56;
    do
    {
      sub_25E0DB3C0();
      sub_25E0DB3C0();
      sub_25E0DAC20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = v7;
      unint64_t v10 = *(void *)(v7 + 16);
      unint64_t v9 = *(void *)(v7 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_25E03CE0C(v9 > 1, v10 + 1, 1);
        uint64_t v7 = v14;
      }
      v8 += 32;
      *(void *)(v7 + 16) = v10 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v10, v5, v13);
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t URLQueryItemCollection.init<A>(contentsOf:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_25E0DAC30();
  uint64_t v8 = sub_25E0DB950();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  *a3 = v8;
  return result;
}

uint64_t URLQueryItemCollection.queryItems.getter()
{
  return sub_25E0DB3C0();
}

uint64_t URLQueryItemCollection.queryItems.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

double (*URLQueryItemCollection.queryItems.modify())(void)
{
  return nullsub_1;
}

uint64_t URLQueryItemCollection.init(dictionaryLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_25E0D563C(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t URLQueryItemCollection.init(arrayLiteral:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t URL.appending(queryItems:)(void *a1)
{
  return MEMORY[0x270EEFF38](*a1);
}

uint64_t URL.append(queryItems:)(void *a1)
{
  return MEMORY[0x270EEFEB8](*a1);
}

ValueMetadata *type metadata accessor for URLQueryItemCollection()
{
  return &type metadata for URLQueryItemCollection;
}

uint64_t sub_25E0D59D8()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t result = sub_25E0D4ECC();
  if (result)
  {
    int v2 = 0;
    sub_25E0D5E88(&v2, 0x80084A02uLL, &v1);
    uint64_t result = v1;
    if (v1)
    {
      sub_25E0D42C8(v1);
      return swift_willThrow();
    }
  }
  return result;
}

void sub_25E0D5A78(int *a1, char *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  uint64_t v3 = *a2;
  id v4 = objc_msgSend(self, sel_defaultManager);
  sub_25E0DAE50();
  uint64_t v5 = (void *)sub_25E0DB4D0();
  swift_bridgeObjectRelease();
  unsigned int v6 = objc_msgSend(v4, sel_fileExistsAtPath_, v5);

  if (v6)
  {
    if (v2 < 0)
    {
      sub_25E0DC130();
      __break(1u);
    }
    else
    {
      int v8 = v2 | dword_25E0E0060[v3] | 0x10000;
      sub_25E0D5E88(&v8, 0xC0084A44uLL, &v7);
      if (v7)
      {
        sub_25E0D42C8(v7);
        swift_willThrow();
      }
    }
  }
}

uint64_t sub_25E0D5BE8()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = 0;
  sub_25E0D5E88(v2, 0xC0084A44uLL, &v1);
  uint64_t result = v1;
  if (v1)
  {
    sub_25E0D42C8(v1);
    return swift_willThrow();
  }
  return result;
}

void static URL.PurgeContentType.music.getter(_DWORD *a1@<X8>)
{
}

void static URL.PurgeContentType.podcasts.getter(_DWORD *a1@<X8>)
{
}

void static URL.PurgeContentType.data.getter(_DWORD *a1@<X8>)
{
}

BOOL static URL.PurgeUrgency.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t URL.PurgeUrgency.hash(into:)()
{
  return sub_25E0DC4E0();
}

uint64_t URL.PurgeUrgency.hashValue.getter()
{
  return sub_25E0DC500();
}

unint64_t sub_25E0D5D28()
{
  unint64_t result = qword_26A6D6210;
  if (!qword_26A6D6210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A6D6210);
  }
  return result;
}

ValueMetadata *type metadata accessor for URL.PurgeContentType()
{
  return &type metadata for URL.PurgeContentType;
}

unsigned char *_s12PurgeUrgencyOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x25E0D5E50);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for URL.PurgeUrgency()
{
  return &type metadata for URL.PurgeUrgency;
}

uint64_t sub_25E0D5E88@<X0>(void *a1@<X0>, unint64_t a2@<X3>, _DWORD *a3@<X8>)
{
  uint64_t v6 = sub_25E0DB540();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = sub_25E0DAE50();
  v16[1] = v10;
  sub_25E0DB530();
  sub_25E03FD80();
  uint64_t v11 = sub_25E0DBD90();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  if (v11) {
    uint64_t v12 = (const char *)(v11 + 32);
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = fsctl(v12, a2, a1, 0);
  uint64_t v14 = swift_bridgeObjectRelease();
  if (v13) {
    uint64_t result = MEMORY[0x2611CD6F0](v14);
  }
  else {
    uint64_t result = 0;
  }
  *a3 = result;
  return result;
}

uint64_t SQL.init(stringLiteral:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 0;
  return result;
}

void SQL.Interpolation.init(literalCapacity:interpolationCount:)(uint64_t a1@<X1>, void *a2@<X8>)
{
  a2[1] = 0;
  a2[2] = 0;
  a2[3] = MEMORY[0x263F8EE78];
  if (__OFADD__(a1, 2))
  {
    __break(1u);
  }
  else
  {
    sub_25E056BE8();
    *a2 = v3;
  }
}

Swift::Void __swiftcall SQL.Interpolation.appendLiteral(_:)(Swift::String a1)
{
  Swift::String v4 = a1;
  char v5 = 0;
  sub_25E0DB3C0();
  sub_25E06AE10();
  OUTLINED_FUNCTION_2_14();
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = v1 + 1;
  sub_25E07DE30((uint64_t)&v4, v3 + 80 * v1 + 32);
  *int v2 = v3;
}

uint64_t SQL.Interpolation.appendInterpolation<A>(unsafe:)()
{
  uint64_t v1 = v0;
  v6[0] = sub_25E0DC2D0();
  v6[1] = v2;
  char v7 = 0;
  sub_25E06AE10();
  uint64_t v3 = *(void *)(*v0 + 16);
  sub_25E06AECC(v3);
  uint64_t v4 = *v0;
  *(void *)(v4 + 16) = v3 + 1;
  uint64_t result = sub_25E07DE30((uint64_t)v6, v4 + 80 * v3 + 32);
  *uint64_t v1 = v4;
  return result;
}

uint64_t SQL.init(stringInterpolation:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = *a1;
  long long v8 = *(_OWORD *)(a1 + 1);
  uint64_t v9 = a1[3];
  sub_25E0D6330();
  uint64_t result = v9;
  uint64_t v4 = *(void *)(v9 + 16);
  if (v4)
  {
    uint64_t v5 = v7;
    long long v6 = v8;
LABEL_5:
    *(void *)a2 = v5;
    *(_OWORD *)(a2 + 8) = v6;
    *(void *)(a2 + 24) = result;
    *(unsigned char *)(a2 + 32) = v4 != 0;
    return result;
  }
  if (*((void *)&v8 + 1))
  {
    uint64_t v5 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    long long v6 = *((unint64_t *)&v8 + 1);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

SonicFoundation::LiteralSQL __swiftcall LiteralSQL.init(stringLiteral:)(SonicFoundation::LiteralSQL stringLiteral)
{
  *uint64_t v1 = stringLiteral;
  return stringLiteral;
}

uint64_t SQL.Interpolation.appendInterpolation(_:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(a1, v2);

  return sub_25E0D7AB8((uint64_t)v4, v1, v2, v3);
}

SonicFoundation::LiteralSQL_optional __swiftcall LiteralSQL.init(rawValue:)(SonicFoundation::LiteralSQL_optional rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t LiteralSQL.sql.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[1];
  *(void *)a1 = *v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  return sub_25E0DB3C0();
}

uint64_t LiteralSQL.rawValue.getter()
{
  uint64_t v1 = *v0;
  sub_25E0DB3C0();
  return v1;
}

uint64_t LiteralSQL.rawValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

double (*LiteralSQL.rawValue.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25E0D62DC(Swift::String *a1)
{
  return LiteralSQL.init(rawValue:)(*a1).value.rawValue._countAndFlagsBits;
}

uint64_t sub_25E0D62E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LiteralSQL.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25E0D6310(uint64_t *a1, uint64_t *a2)
{
  return sub_25E082354(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_25E0D6324(Swift::String *a1)
{
  return LiteralSQL.init(stringLiteral:)(*a1).rawValue._countAndFlagsBits;
}

uint64_t sub_25E0D6330()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xE000000000000000;
  uint64_t v33 = 0;
  unint64_t v34 = 0xE000000000000000;
  uint64_t v3 = *(void *)(*v1 + 16);
  if (v3)
  {
    uint64_t v4 = *v1 + 32;
    sub_25E0DB3C0();
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      sub_25E0D8CCC(v4, (uint64_t)v27);
      if (v32)
      {
        if (v32 == 1)
        {
          sub_25E03DF3C(v27, (uint64_t)v25);
          sub_25E0DB630();
          uint64_t __src = *(void *)(v5 + 16) + 1;
          uint64_t v21 = 0;
          char v22 = 0;
          sub_25E03DF54((uint64_t)v25, (uint64_t)v23);
          char v24 = 0;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_1_23();
            uint64_t v5 = v14;
          }
          unint64_t v6 = *(void *)(v5 + 16);
          if (v6 >= *(void *)(v5 + 24) >> 1)
          {
            OUTLINED_FUNCTION_1_23();
            uint64_t v5 = v15;
          }
          *(void *)(v5 + 16) = v6 + 1;
          sub_25E0D8D04(&__src, (void *)(v5 + 88 * v6 + 32));
        }
        else
        {
          uint64_t v7 = v28;
          uint64_t v8 = v29;
          uint64_t v9 = v30;
          uint64_t v10 = v31;
          sub_25E03DF3C(v27, (uint64_t)v25);
          uint64_t __src = v7;
          uint64_t v21 = v8;
          sub_25E0DB630();
          sub_25E0DB630();
          swift_bridgeObjectRelease();
          uint64_t __src = *(void *)(v5 + 16) + 1;
          uint64_t v21 = 0;
          char v22 = 0;
          uint64_t v11 = v26;
          uint64_t v12 = __swift_project_boxed_opaque_existential_1(v25, v26);
          sub_25E0D6670((uint64_t)v12, v11, v23);
          v23[5] = v9;
          v23[6] = v10;
          char v24 = 1;
          swift_retain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25E056CAC();
            uint64_t v5 = v16;
          }
          unint64_t v13 = *(void *)(v5 + 16);
          if (v13 >= *(void *)(v5 + 24) >> 1)
          {
            OUTLINED_FUNCTION_1_23();
            uint64_t v5 = v17;
          }
          *(void *)(v5 + 16) = v13 + 1;
          sub_25E0D8D04(&__src, (void *)(v5 + 88 * v13 + 32));
          swift_release();
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      else
      {
        sub_25E0DB630();
        swift_bridgeObjectRelease();
      }
      v4 += 80;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v18 = v33;
    unint64_t v2 = v34;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  v1[1] = v18;
  v1[2] = v2;
  if (!*(void *)(v5 + 16)) {
    return swift_bridgeObjectRelease();
  }
  uint64_t result = swift_bridgeObjectRelease();
  v1[3] = v5;
  return result;
}

void SQL.Interpolation.appendInterpolation(_:)(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (a1[4])
  {
    sub_25E0DB3C0();
    sub_25E05B320();
  }
  else
  {
    uint64_t v5 = a1[1];
    v7[0] = v4;
    v7[1] = v5;
    char v8 = 0;
    sub_25E0DB3C0();
    sub_25E06AE10();
    OUTLINED_FUNCTION_2_14();
    uint64_t v6 = *v2;
    *(void *)(v6 + 16) = v1 + 1;
    sub_25E07DE30((uint64_t)v7, v6 + 80 * v1 + 32);
    *unint64_t v2 = v6;
  }
}

uint64_t sub_25E0D6670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  char v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _s12ReferenceBoxCMa();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  uint64_t result = sub_25E082370((uint64_t)v8);
  a3[3] = v9;
  a3[4] = (uint64_t)&off_270AF1268;
  *a3 = result;
  return result;
}

uint64_t sub_25E0D675C()
{
  uint64_t v1 = *v0;
  v16[0] = 0;
  v16[1] = 0xE000000000000000;
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    sub_25E0DB3C0();
    do
    {
      sub_25E0D8CCC(v3, (uint64_t)v14);
      if (v15)
      {
        if (v15 == 1)
        {
          sub_25E03DF3C(v14, (uint64_t)v11);
          uint64_t v4 = v12;
          uint64_t v5 = v13;
          __swift_project_boxed_opaque_existential_1(v11, v12);
          (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 16))(&v10, v4, v5);
          swift_beginAccess();
          sub_25E0DB630();
          swift_endAccess();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_release();
          sub_25E03DF3C(v14, (uint64_t)v11);
          uint64_t v6 = v12;
          uint64_t v7 = v13;
          char v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
          sub_25E0D68F4((uint64_t)v8, (uint64_t)v16, v6, v7);
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      }
      else
      {
        swift_beginAccess();
        sub_25E0DB630();
        swift_endAccess();
        swift_bridgeObjectRelease();
      }
      v3 += 80;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  return v16[0];
}

uint64_t sub_25E0D68F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (**v28)(void *__return_ptr, void *, char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void *__return_ptr, void *, char *, uint64_t, uint64_t);
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  void (**v44)(char *, uint64_t);
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void v59[3];
  uint64_t v60;
  void v61[3];
  uint64_t v62;
  uint64_t v63;

  uint64_t v7 = *(void (***)(char *, uint64_t))(*(void *)(a4 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v51 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v39 - v9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v50 = sub_25E0DBCF0();
  int v54 = *(void *)(v50 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v50);
  uint64_t v49 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  int v48 = (char *)&v39 - v14;
  char v47 = (void (*)(char *, char *, uint64_t))sub_25E0DC180();
  MEMORY[0x270FA5388](v47);
  id v46 = (void (*)(char *, char *, uint64_t))((char *)&v39 - v15);
  char v53 = sub_25E0DC170();
  uint64_t v40 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  char v52 = (char *)&v39 - v16;
  swift_beginAccess();
  sub_25E0DB630();
  swift_endAccess();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);
  uint64_t v58 = a4;
  uint64_t v18 = v17(a3, a4);
  uint64_t v19 = *(void *)(v18 + 16);
  long long v43 = AssociatedTypeWitness;
  uint64_t v20 = v10;
  uint64_t v42 = TupleTypeMetadata2;
  uint64_t v56 = v18;
  BOOL v57 = v19;
  if (v19)
  {
    uint64_t v44 = v7;
    uint64_t v45 = a1;
    uint64_t v21 = sub_25E0DB3C0();
    uint64_t v22 = 0;
    uint64_t v55 = v19 - 1;
    uint64_t v23 = v21 + 40;
    do
    {
      uint64_t v24 = v22 + 1;
      v61[0] = 0x6E6D756C6F63;
      v61[1] = 0xE600000000000000;
      v59[0] = v22 + 1;
      sub_25E0DB3C0();
      sub_25E0DC2D0();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      sub_25E0DB630();
      sub_25E0DB630();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_25E0DB630();
      swift_endAccess();
      swift_bridgeObjectRelease();
      if (v55 != v22)
      {
        swift_beginAccess();
        sub_25E0DB630();
        swift_endAccess();
      }
      v23 += 24;
      ++v22;
    }
    while (v57 != v24);
    swift_bridgeObjectRelease();
    uint64_t AssociatedTypeWitness = v43;
    uint64_t v10 = v20;
    TupleTypeMetadata2 = v42;
    uint64_t v7 = v44;
  }
  swift_beginAccess();
  sub_25E0DB630();
  swift_endAccess();
  MEMORY[0x2611CDC70](a3, v7);
  sub_25E0DC150();
  id v25 = v49;
  sub_25E0DC160();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
  uint64_t v27 = (uint64_t *)v48;
  v54 += 32;
  char v47 = v26;
  v26(v48, v25, v50);
  if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, TupleTypeMetadata2) != 1)
  {
    id v46 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
    uint64_t v28 = (void (**)(void *__return_ptr, void *, char *, uint64_t, uint64_t))(v58 + 32);
    uint64_t v45 = v57 - 1;
    v51 += 32;
    uint64_t v44 = (void (**)(char *, uint64_t))(v51 - 24);
    long long v41 = (uint64_t *)(v56 + 40);
    do
    {
      uint64_t v29 = *v27;
      v46(v10, (char *)v27 + *(int *)(TupleTypeMetadata2 + 48), AssociatedTypeWitness);
      swift_beginAccess();
      sub_25E0DB630();
      swift_endAccess();
      uint64_t v30 = v57;
      if (v57)
      {
        uint64_t v55 = v29;
        uint64_t v31 = *v28;
        sub_25E0DB3C0();
        char v32 = v41;
        uint64_t v33 = v30;
        do
        {
          unint64_t v34 = *v32;
          v59[0] = *(v32 - 1);
          v59[1] = v34;
          sub_25E0DB3C0();
          v31(v61, v59, v20, a3, v58);
          swift_bridgeObjectRelease();
          id v36 = v62;
          id v35 = v63;
          __swift_project_boxed_opaque_existential_1(v61, v62);
          (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)(v35 + 8) + 8))(&v60, v36);
          swift_beginAccess();
          sub_25E0DB630();
          swift_endAccess();
          swift_bridgeObjectRelease();
          if (v33 != 1)
          {
            swift_beginAccess();
            sub_25E0DB630();
            swift_endAccess();
          }
          v32 += 3;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
          --v33;
        }
        while (v33);
        swift_bridgeObjectRelease();
        uint64_t AssociatedTypeWitness = v43;
        uint64_t v10 = v20;
        TupleTypeMetadata2 = v42;
        uint64_t v29 = v55;
      }
      swift_beginAccess();
      sub_25E0DB630();
      swift_endAccess();
      if (v29 != v45)
      {
        swift_beginAccess();
        sub_25E0DB630();
        swift_endAccess();
      }
      (*v44)(v10, AssociatedTypeWitness);
      uint64_t v37 = v49;
      sub_25E0DC160();
      uint64_t v27 = (uint64_t *)v48;
      v47(v48, v37, v50);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, TupleTypeMetadata2) != 1);
  }
  (*(void (**)(char *, uint64_t))(v40 + 8))(v52, v53);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_25E0DB630();
  return swift_endAccess();
}

void sub_25E0D7158(Swift::String *a1)
{
}

uint64_t SQL.debugSQL.getter()
{
  uint64_t v1 = sub_25E0DAC10();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)v0;
  uint64_t v5 = *(void *)(v0 + 8);
  if (*(unsigned char *)(v0 + 32))
  {
    uint64_t v8 = *(void *)(v0 + 16);
    uint64_t v7 = *(void *)(v0 + 24);
    uint64_t v12 = *(void *)v0;
    uint64_t v13 = v5;
    uint64_t v14 = v8;
    uint64_t v15 = v7;
    uint64_t v6 = sub_25E0D675C();
    uint64_t v5 = v9;
  }
  else
  {
    sub_25E0DB3C0();
  }
  uint64_t v12 = v6;
  uint64_t v13 = v5;
  sub_25E0DAC00();
  sub_25E03FD80();
  uint64_t v10 = sub_25E0DBD70();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25E0D729C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return SQL.init(stringLiteral:)(*a1, a1[1], a2);
}

void Array<A>.joined(by:)(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7)
  {
    long long v34 = a1[1];
    long long v35 = *a1;
    char v33 = *((unsigned char *)a1 + 32);
    sub_25E0DB3C0();
    OUTLINED_FUNCTION_4_17();
    uint64_t v9 = (unsigned char *)(a2 + 64);
    unint64_t v10 = 0xE000000000000000;
    do
    {
      uint64_t v36 = v10;
      uint64_t v37 = v7;
      uint64_t v11 = *((void *)v9 - 4);
      uint64_t v12 = *((void *)v9 - 3);
      uint64_t v14 = *((void *)v9 - 2);
      uint64_t v13 = *((void *)v9 - 1);
      char v15 = *v9;
      uint64_t v41 = v4;
      unint64_t v42 = v10;
      uint64_t v43 = v5;
      uint64_t v44 = v3;
      char v16 = v6 & 1;
      char v45 = v16;
      *(void *)&long long v38 = v11;
      *((void *)&v38 + 1) = v12;
      *(void *)&long long v39 = v14;
      *((void *)&v39 + 1) = v13;
      char v40 = v15;
      OUTLINED_FUNCTION_5_19();
      sub_25E03DDF4(v17, v18, v19, v20, v21);
      static SQL.+ infix(_:_:)((uint64_t)&v41, (uint64_t)&v38, (uint64_t)&v46);
      sub_25E03DEA4(v4, v36, v5, v3, v16);
      OUTLINED_FUNCTION_5_19();
      sub_25E03DEA4(v22, v23, v24, v25, v26);
      uint64_t v4 = v46;
      unint64_t v10 = v47;
      uint64_t v5 = v48;
      uint64_t v3 = v49;
      char v6 = v50;
      if (v37 != 1)
      {
        uint64_t v41 = v46;
        unint64_t v42 = v47;
        uint64_t v43 = v48;
        uint64_t v44 = v49;
        char v45 = v50;
        long long v38 = v35;
        long long v39 = v34;
        char v40 = v33;
        uint64_t v27 = v46;
        uint64_t v28 = v47;
        static SQL.+ infix(_:_:)((uint64_t)&v41, (uint64_t)&v38, (uint64_t)&v46);
        sub_25E03DEA4(v27, v28, v5, v3, v6);
        uint64_t v4 = v46;
        unint64_t v10 = v47;
        uint64_t v5 = v48;
        uint64_t v3 = v49;
        char v6 = v50;
      }
      v9 += 40;
      uint64_t v7 = v37 - 1;
    }
    while (v37 != 1);
    unint64_t v29 = v10;
    swift_bridgeObjectRelease();
    unint64_t v30 = v29;
    uint64_t v31 = a3;
  }
  else
  {
    OUTLINED_FUNCTION_4_17();
    unint64_t v30 = 0xE000000000000000;
  }
  *(void *)uint64_t v31 = v4;
  *(void *)(v31 + 8) = v30;
  *(void *)(v31 + 16) = v5;
  *(void *)(v31 + 24) = v3;
  *(unsigned char *)(v31 + 32) = v6;
}

double static SQL.+= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  v15[0] = *(void *)a1;
  uint64_t v4 = v15[0];
  v15[1] = v5;
  v15[2] = v6;
  v15[3] = v7;
  char v16 = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  char v14 = v3;
  static SQL.+ infix(_:_:)((uint64_t)v15, (uint64_t)v13, (uint64_t)v17);
  sub_25E03DEA4(v4, v5, v6, v7, v8);
  char v10 = v18;
  double result = *(double *)v17;
  long long v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *(_OWORD *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 32) = v10;
  return result;
}

uint64_t static SQL.+ infix(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  if (*(unsigned char *)(a1 + 32))
  {
    if ((*(unsigned char *)(a2 + 32) & 1) == 0)
    {
      uint64_t v11 = *(void *)(a2 + 16);
      uint64_t v12 = *(void *)(a2 + 24);
      sub_25E0D7B80();
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25E0DD9C0;
      *(void *)(inited + 32) = v5;
      *(void *)(inited + 40) = v6;
      *(unsigned char *)(inited + 104) = 0;
      uint64_t v19 = v4;
      sub_25E03DDF4(v5, v6, v11, v12, 0);
      sub_25E0DB3C0();
      goto LABEL_8;
    }
    uint64_t v19 = *(void *)a1;
    sub_25E0DB3C0();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 8);
    if ((*(unsigned char *)(a2 + 32) & 1) == 0)
    {
      sub_25E0DB3C0();
      uint64_t result = sub_25E0DB630();
      uint64_t v18 = 0;
      char v17 = 0;
      uint64_t v15 = v4;
      uint64_t v16 = v7;
      goto LABEL_10;
    }
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v9 = *(void *)(a1 + 24);
    sub_25E0D7B80();
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_25E0DD9C0;
    *(void *)(v10 + 32) = v4;
    *(void *)(v10 + 40) = v7;
    *(unsigned char *)(v10 + 104) = 0;
    uint64_t v19 = v10;
    sub_25E03DDF4(v4, v7, v8, v9, 0);
  }
  sub_25E0DB3C0();
LABEL_8:
  sub_25E05B320();
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25E0D6330();
  uint64_t v15 = v19;
  uint64_t v16 = 0;
  char v17 = 1;
  uint64_t v18 = v20;
LABEL_10:
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v16;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v18;
  *(unsigned char *)(a3 + 32) = v17;
  return result;
}

uint64_t SQL.Interpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v10[3] = swift_getAssociatedTypeWitness();
  v10[4] = a4;
  __swift_allocate_boxed_opaque_existential_0(v10);
  sub_25E0DB7E0();
  char v11 = 1;
  sub_25E06AE10();
  uint64_t v7 = *(void *)(*v5 + 16);
  sub_25E06AECC(v7);
  uint64_t v8 = *v5;
  *(void *)(v8 + 16) = v7 + 1;
  uint64_t result = sub_25E07DE30((uint64_t)v10, v8 + 80 * v7 + 32);
  *uint64_t v5 = v8;
  return result;
}

uint64_t SQL.Interpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[3] = a2;
  v12[4] = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_0, a1, a2);
  v12[5] = sub_25E08252C();
  v12[6] = v8;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  v12[7] = (uint64_t)&unk_26A6D6220;
  v12[8] = v9;
  char v13 = 2;
  sub_25E06AE10();
  OUTLINED_FUNCTION_2_14();
  uint64_t v10 = *v3;
  *(void *)(v10 + 16) = a3 + 1;
  uint64_t result = sub_25E07DE30((uint64_t)v12, v10 + 80 * a3 + 32);
  *char v3 = v10;
  return result;
}

uint64_t sub_25E0D7810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_25E0D7834, 0, 0);
}

uint64_t sub_25E0D7834()
{
  uint64_t v1 = _s15CollectionTableVMa();
  uint64_t v2 = sub_25E08252C();
  uint64_t v4 = v3;
  *(void *)(v0 + 40) = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v5 = v0;
  v5[1] = sub_25E0D793C;
  return SQLDatabase.registerFunction<A>(_:named:)(v1, v2, v4, v1, WitnessTable);
}

uint64_t sub_25E0D793C()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = *v1;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25E0D7A54, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_25E0D7A54()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25E0D7AB8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  v12[3] = a3;
  v12[4] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_0, a1, a3);
  sub_25E03DF54((uint64_t)v12, (uint64_t)v11);
  v11[72] = 1;
  sub_25E06AE10();
  uint64_t v8 = *(void *)(*a2 + 16);
  sub_25E06AECC(v8);
  uint64_t v9 = *a2;
  *(void *)(v9 + 16) = v8 + 1;
  sub_25E07DE30((uint64_t)v11, v9 + 80 * v8 + 32);
  *a2 = v9;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

void sub_25E0D7B80()
{
  if (!qword_26A6D49A8)
  {
    unint64_t v0 = sub_25E0DC2E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6D49A8);
    }
  }
}

uint64_t sub_25E0D7BCC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E0D7BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25E0D7C8C;
  return sub_25E0D7810(a1, a2, v7, v6);
}

uint64_t sub_25E0D7C8C()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_25E0D7D60()
{
  unint64_t result = qword_26A6D6228;
  if (!qword_26A6D6228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6228);
  }
  return result;
}

unint64_t sub_25E0D7DB0()
{
  unint64_t result = qword_26A6D6230;
  if (!qword_26A6D6230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6230);
  }
  return result;
}

unint64_t sub_25E0D7E00()
{
  unint64_t result = qword_26A6D6238;
  if (!qword_26A6D6238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6238);
  }
  return result;
}

unint64_t sub_25E0D7E50()
{
  unint64_t result = qword_26A6D6240;
  if (!qword_26A6D6240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6240);
  }
  return result;
}

unint64_t sub_25E0D7EA0()
{
  unint64_t result = qword_26A6D6248;
  if (!qword_26A6D6248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6248);
  }
  return result;
}

unint64_t sub_25E0D7EF0()
{
  unint64_t result = qword_26A6D6250;
  if (!qword_26A6D6250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6250);
  }
  return result;
}

void type metadata accessor for LiteralSQL()
{
}

uint64_t destroy for SQL(uint64_t a1)
{
  return sub_25E03DEA4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for SQL(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_25E03DDF4(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for SQL(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_25E03DDF4(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_25E03DEA4(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SQL(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  sub_25E03DEA4(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQL(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for SQL(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25E0D811C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_25E0D8124(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

void type metadata accessor for SQL()
{
}

uint64_t destroy for SQL.Interpolation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SQL.Interpolation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  sub_25E0DB3C0();
  return a1;
}

void *assignWithCopy for SQL.Interpolation(void *a1, void *a2)
{
  *a1 = *a2;
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  sub_25E0DB3C0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQL.Interpolation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQL.Interpolation(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SQL.Interpolation(uint64_t result, int a2, int a3)
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

void type metadata accessor for SQL.Interpolation()
{
}

uint64_t sub_25E0D8334(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 80);
  if (v2 >= 2) {
    unsigned int v2 = *(_DWORD *)a1 + 2;
  }
  sub_25E0540B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  if (v2 == 1)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 24);
    return swift_release();
  }
  else
  {
    return __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  }
}

uint64_t sub_25E0D83B8(uint64_t a1, uint64_t *a2)
{
  unsigned int v4 = *((unsigned __int8 *)a2 + 80);
  if (v4 >= 2) {
    unsigned int v4 = *(_DWORD *)a2 + 2;
  }
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  char v7 = *((unsigned char *)a2 + 16);
  sub_25E0C42A4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  long long v8 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 48) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 24, (uint64_t)(a2 + 3));
  if (v4 == 1)
  {
    uint64_t v9 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v9;
    swift_retain();
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
  *(unsigned char *)(a1 + 80) = v10;
  return a1;
}

uint64_t sub_25E0D84B8(uint64_t a1, uint64_t *a2)
{
  if ((uint64_t *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    sub_25E0540B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
    __swift_destroy_boxed_opaque_existential_1(a1 + 24);
    if (v4 == 1) {
      swift_release();
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 80);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    uint64_t v6 = *a2;
    uint64_t v7 = a2[1];
    char v8 = *((unsigned char *)a2 + 16);
    sub_25E0C42A4(*a2, v7, v8);
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = v8;
    uint64_t v9 = a2[6];
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = a2[7];
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 24, (uint64_t)(a2 + 3));
    if (v5 == 1)
    {
      uint64_t v10 = a2[9];
      *(void *)(a1 + 64) = a2[8];
      *(void *)(a1 + 72) = v10;
      *(unsigned char *)(a1 + 80) = 1;
      swift_retain();
    }
    else
    {
      *(unsigned char *)(a1 + 80) = 0;
    }
  }
  return a1;
}

void *__swift_memcpy81_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

uint64_t sub_25E0D8610(uint64_t a1, _OWORD *a2)
{
  if ((_OWORD *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    sub_25E0540B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
    __swift_destroy_boxed_opaque_existential_1(a1 + 24);
    if (v4 == 1) {
      swift_release();
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 80);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      memcpy((void *)a1, a2, 0x50uLL);
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
      long long v7 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v7;
      long long v8 = a2[3];
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 48) = v8;
    }
    *(unsigned char *)(a1 + 80) = v6;
  }
  return a1;
}

uint64_t sub_25E0D86D4(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_25E0D8710(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25E0D8764(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_25E0D8780(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 80) = a2;
  return result;
}

void type metadata accessor for SQL.BindStrategy()
{
}

uint64_t destroy for SQL.Interpolation.Token(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 72);
  if (v1 >= 3) {
    unsigned int v1 = *(_DWORD *)a1 + 3;
  }
  if (v1 == 2)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else if (v1 == 1)
  {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for SQL.Interpolation.Token(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 72);
  if (v4 >= 3) {
    unsigned int v4 = *(_DWORD *)a2 + 3;
  }
  if (v4 == 2)
  {
    long long v6 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    uint64_t v7 = *(void *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = v7;
    *(unsigned char *)(a1 + 72) = 2;
    sub_25E0DB3C0();
    swift_retain();
  }
  else if (v4 == 1)
  {
    long long v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    *(unsigned char *)(a1 + 72) = 1;
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 72) = 0;
    sub_25E0DB3C0();
  }
  return a1;
}

uint64_t assignWithCopy for SQL.Interpolation.Token(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 == 2)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 == 2)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      uint64_t v8 = *(void *)(a2 + 56);
      uint64_t v9 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v8;
      *(void *)(a1 + 64) = v9;
      *(unsigned char *)(a1 + 72) = 2;
      sub_25E0DB3C0();
      swift_retain();
    }
    else if (v5 == 1)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(unsigned char *)(a1 + 72) = 1;
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(unsigned char *)(a1 + 72) = 0;
      sub_25E0DB3C0();
    }
  }
  return a1;
}

void *__swift_memcpy73_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x49uLL);
}

uint64_t assignWithTake for SQL.Interpolation.Token(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 == 2)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 == 2)
    {
      memcpy((void *)a1, (const void *)a2, 0x48uLL);
      char v7 = 2;
    }
    else if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    *(unsigned char *)(a1 + 72) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SQL.Interpolation.Token(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 73)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SQL.Interpolation.Token(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 57) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 73) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 73) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 72) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25E0D8C74(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 72);
  if (result >= 3) {
    return (*(_DWORD *)a1 + 3);
  }
  return result;
}

uint64_t sub_25E0D8C90(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(void *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 72) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQL.Interpolation.Token()
{
  return &type metadata for SQL.Interpolation.Token;
}

uint64_t sub_25E0D8CCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_25E0D8D04(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x51uLL);
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  uint64_t v2 = *(void *)(*(void *)v0 + 16);
  return sub_25E06AECC(v2);
}

uint64_t sub_25E0D8D3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E0DABD0();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

uint64_t sub_25E0D8D6C()
{
  return sub_25E0DABA0();
}

uint64_t static SQLCodable<>.encoder.getter(uint64_t a1, uint64_t a2)
{
  return sub_25E0D8DF8(a1, a2, MEMORY[0x263F061E0], MEMORY[0x263F061D8]);
}

uint64_t static SQLCodable<>.decoder.getter(uint64_t a1, uint64_t a2)
{
  return sub_25E0D8DF8(a1, a2, MEMORY[0x263F06128], MEMORY[0x263F06120]);
}

uint64_t sub_25E0D8DF8(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void))
{
  return a4();
}

uint64_t SQLCodable<>.init(nativeValue:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a4 + 72))(&v7, a3, a4);
  sub_25E0DABA0();
  sub_25E06B99C(a1, a2);
  return swift_release();
}

uint64_t SQLCodable<>.nativeValue.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t *__return_ptr))(a2 + 64))(&v4);
  uint64_t v2 = sub_25E0DABD0();
  swift_release();
  return v2;
}

uint64_t dispatch thunk of TopLevelEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of TopLevelDecoder.decode<A>(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

_UNKNOWN **sub_25E0D8FCC()
{
  return &protocol witness table for JSONDecoder;
}

_UNKNOWN **sub_25E0D8FD8()
{
  return &protocol witness table for JSONEncoder;
}

uint64_t dispatch thunk of static SQLCodable.encoder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static SQLCodable.decoder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_25E0D9010()
{
  return sub_25E0D9614();
}

uint64_t sub_25E0D901C()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9058()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9098()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D90D8()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9118()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9160()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D91A8()
{
  return sub_25E0D959C();
}

uint64_t sub_25E0D91B4()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9214()
{
  return sub_25E0DC4E0();
}

uint64_t sub_25E0D9240()
{
  return sub_25E0DC4E0();
}

uint64_t sub_25E0D9274()
{
  return sub_25E0DC4E0();
}

uint64_t sub_25E0D92A8()
{
  sub_25E0DB3C0();
  sub_25E0DB5E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0D9304()
{
  sub_25E0DB5E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0D936C()
{
  sub_25E0DB5E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0D93D8()
{
  sub_25E0DB5E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E0D94BC()
{
  return sub_25E0DC4F0();
}

uint64_t sub_25E0D94E4()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9524()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9560()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D959C()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9614()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9688()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D96E4()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9724()
{
  return sub_25E0DC500();
}

uint64_t sub_25E0D9764()
{
  return sub_25E0DC500();
}

SonicFoundation::SQLColumnName __swiftcall SQLColumnName.init(stringLiteral:)(SonicFoundation::SQLColumnName stringLiteral)
{
  *uint64_t v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_25E0D97AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E0DAEA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SQLDatabase.Location(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E0D9F90(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    uint64_t v9 = sub_25E0DADF0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0xE000000000000000;
    sub_25E0DBE80();
    swift_bridgeObjectRelease();
    uint64_t v11 = 0x3A656C6966;
    unint64_t v12 = 0xE500000000000000;
    sub_25E0DB630();
    swift_bridgeObjectRelease();
    sub_25E0DB630();
    return v11;
  }
  return v9;
}

uint64_t SQLDatabase.__allocating_init(location:options:)(uint64_t a1, char *a2)
{
  swift_allocObject();
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unsigned int v5 = v2;
  v5[1] = sub_25E0D9A38;
  return SQLDatabase.init(location:options:)(a1, a2);
}

uint64_t sub_25E0D9A38()
{
  OUTLINED_FUNCTION_0_19();
  uint64_t v3 = *v2;
  OUTLINED_FUNCTION_5_2();
  *uint64_t v4 = v3;
  uint64_t v5 = swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v3 + 8);
  if (!v1) {
    uint64_t v5 = v0;
  }
  return v6(v5);
}

uint64_t static SQLDatabase.Location.memory()@<X0>(uint64_t *a1@<X8>)
{
  sub_25E0B07D0(0, 15, 0xD000000000000040, 0x800000025E0E3CD0);
  sub_25E053F70();
  sub_25E0B0CAC();
  *a1 = sub_25E0DB6F0();
  a1[1] = v2;
  type metadata accessor for SQLDatabase.Location(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t SQLDatabase.location.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E0D9F90(v1 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_location, a1);
}

uint64_t SQLDatabase.init(location:options:)(uint64_t a1, char *a2)
{
  v3[2] = a1;
  v3[3] = v2;
  char v5 = a2[1];
  char v6 = a2[2];
  char v7 = a2[3];
  char v20 = a2[4];
  char v21 = *a2;
  char v18 = a2[6];
  char v19 = a2[5];
  char v16 = a2[8];
  char v17 = a2[7];
  char v14 = a2[10];
  char v15 = a2[9];
  char v13 = a2[11];
  swift_defaultActor_initialize();
  *(void *)(v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_connection) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_attachedLocations) = MEMORY[0x263F8EE78];
  uint64_t v8 = OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_scalarFunctions;
  _s14ScalarFunctionCMa();
  *(void *)(v2 + v8) = sub_25E0DB3A0();
  uint64_t v9 = OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_tableFunctions;
  _s13TableFunctionCMa();
  *(void *)(v2 + v9) = sub_25E0DB3A0();
  sub_25E0D9F90(a1, v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_location);
  uint64_t v10 = (unsigned char *)(v2 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_options);
  unsigned char *v10 = v21;
  v10[1] = v5;
  uint64_t v10[2] = v6;
  v10[3] = v7;
  v10[4] = v20;
  v10[5] = v19;
  v10[6] = v18;
  v10[7] = v17;
  v10[8] = v16;
  uint64_t v10[9] = v15;
  v10[10] = v14;
  v10[11] = v13;
  _s10ConnectionCMa();
  swift_allocObject();
  swift_retain();
  uint64_t v11 = (void *)swift_task_alloc();
  v3[4] = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_25E0D9DD8;
  return sub_25E090290();
}

uint64_t sub_25E0D9DD8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  OUTLINED_FUNCTION_5_2();
  *char v6 = v5;
  uint64_t v7 = *v2;
  *char v6 = *v2;
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v4 + 24);
  uint64_t v9 = *(void *)(v4 + 16);
  if (v1)
  {
    swift_release();
    sub_25E0D9FF4(v9);
    uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
    return v10();
  }
  else
  {
    sub_25E0D9FF4(v9);
    *(void *)(v8 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_connection) = a1;
    swift_release();
    unint64_t v12 = *(uint64_t (**)(uint64_t))(v7 + 8);
    uint64_t v13 = *(void *)(v5 + 24);
    return v12(v13);
  }
}

uint64_t type metadata accessor for SQLDatabase.Location(uint64_t a1)
{
  return sub_25E0A28F0(a1, qword_26A6D6298);
}

uint64_t sub_25E0D9F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SQLDatabase.Location(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E0D9FF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SQLDatabase.Location(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SQLDatabase.attachedLocations.getter()
{
  return sub_25E0DB3C0();
}

uint64_t SQLDatabase.deinit()
{
  sub_25E0D9FF4(v0 + OBJC_IVAR____TtC15SonicFoundation11SQLDatabase_location);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SQLDatabase.__deallocating_deinit()
{
  SQLDatabase.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t SQLDatabase.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25E0DA144()
{
  return SQLDatabase.unownedExecutor.getter();
}

uint64_t SQLColumnName.rawValue.getter()
{
  uint64_t v1 = *v0;
  sub_25E0DB3C0();
  return v1;
}

uint64_t SQLColumnName.rawValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

double (*SQLColumnName.rawValue.modify())(void)
{
  return nullsub_1;
}

uint64_t static SQLColumnName.ROWID.getter()
{
  return 0x4449574F52;
}

unint64_t sub_25E0DA200()
{
  unint64_t result = qword_26A6D6268;
  if (!qword_26A6D6268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6268);
  }
  return result;
}

uint64_t sub_25E0DA24C()
{
  return sub_25E0D91B4();
}

uint64_t sub_25E0DA254()
{
  return sub_25E0D92A8();
}

uint64_t sub_25E0DA25C()
{
  return sub_25E0D9688();
}

uint64_t sub_25E0DA264@<X0>(Swift::String *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = SQLColumnName.init(stringLiteral:)(*a1).rawValue._countAndFlagsBits;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_25E0DA2A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SQLColumnName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_25E0DA2D0()
{
  unint64_t result = qword_26A6D6270;
  if (!qword_26A6D6270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6270);
  }
  return result;
}

uint64_t sub_25E0DA31C(Swift::String *a1)
{
  return SQLColumnName.init(stringLiteral:)(*a1).rawValue._countAndFlagsBits;
}

uint64_t sub_25E0DA328(void *a1, void *a2)
{
  return sub_25E08788C(*a1, a1[1], *a2, a2[1]);
}

unint64_t sub_25E0DA340()
{
  unint64_t result = qword_26A6D6278;
  if (!qword_26A6D6278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D6278);
  }
  return result;
}

uint64_t sub_25E0DA38C()
{
  return type metadata accessor for SQLDatabase(0);
}

uint64_t type metadata accessor for SQLDatabase(uint64_t a1)
{
  return sub_25E0A28F0(a1, (uint64_t *)&unk_26A6D6280);
}

uint64_t sub_25E0DA3B4()
{
  uint64_t result = type metadata accessor for SQLDatabase.Location(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SQLDatabase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SQLDatabase);
}

uint64_t dispatch thunk of SQLDatabase.__allocating_init(location:options:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 136) + **(int **)(v2 + 136));
  char v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *char v6 = v3;
  v6[1] = sub_25E0DA580;
  return v8(a1, a2);
}

uint64_t sub_25E0DA580()
{
  OUTLINED_FUNCTION_0_19();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_5_2();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return v4(v0);
}

uint64_t *initializeBufferWithCopyOfBuffer for SQLDatabase.Location(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25E0DAEA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      sub_25E0DB3C0();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SQLDatabase.Location(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_25E0DAEA0();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

void *initializeWithCopy for SQLDatabase.Location(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_25E0DAEA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    sub_25E0DB3C0();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for SQLDatabase.Location(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25E0D9FF4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_25E0DAEA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      sub_25E0DB3C0();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for SQLDatabase.Location(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25E0DAEA0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SQLDatabase.Location(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25E0D9FF4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25E0DAEA0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_25E0DAAE0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25E0DAAF0()
{
  uint64_t result = sub_25E0DAEA0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLColumnName()
{
  return &type metadata for SQLColumnName;
}

uint64_t sub_25E0DABA0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25E0DABB0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25E0DABC0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25E0DABD0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25E0DABE0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25E0DABF0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25E0DAC00()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25E0DAC10()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25E0DAC20()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_25E0DAC30()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_25E0DAC40()
{
  return MEMORY[0x270EEE420]();
}

uint64_t sub_25E0DAC50()
{
  return MEMORY[0x270EEE428]();
}

uint64_t sub_25E0DAC60()
{
  return MEMORY[0x270EEE430]();
}

uint64_t sub_25E0DAC70()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_25E0DAC80()
{
  return MEMORY[0x270EEE450]();
}

uint64_t sub_25E0DAC90()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_25E0DACA0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_25E0DACB0()
{
  return MEMORY[0x270EEE588]();
}

uint64_t sub_25E0DACC0()
{
  return MEMORY[0x270EEE598]();
}

uint64_t sub_25E0DACD0()
{
  return MEMORY[0x270EEE5E0]();
}

uint64_t sub_25E0DACE0()
{
  return MEMORY[0x270EEE5F0]();
}

uint64_t sub_25E0DACF0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_25E0DAD00()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_25E0DAD10()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25E0DAD20()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25E0DAD30()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_25E0DAD40()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25E0DAD50()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25E0DAD60()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25E0DAD70()
{
  return MEMORY[0x270EEEF18]();
}

uint64_t sub_25E0DAD80()
{
  return MEMORY[0x270EEEFA0]();
}

uint64_t sub_25E0DAD90()
{
  return MEMORY[0x270EEEFD0]();
}

uint64_t sub_25E0DADA0()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_25E0DADB0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25E0DADC0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25E0DADD0()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_25E0DADE0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25E0DADF0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25E0DAE00()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_25E0DAE10()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25E0DAE20()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25E0DAE30()
{
  return MEMORY[0x270EEFD48]();
}

uint64_t sub_25E0DAE40()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_25E0DAE50()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25E0DAE80()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25E0DAE90()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_25E0DAEA0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25E0DAEB0()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_25E0DAEC0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25E0DAED0()
{
  return MEMORY[0x270EF00E8]();
}

uint64_t sub_25E0DAEE0()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_25E0DAEF0()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_25E0DAF00()
{
  return MEMORY[0x270EF01A8]();
}

uint64_t sub_25E0DAF10()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_25E0DAF20()
{
  return MEMORY[0x270EF0218]();
}

uint64_t sub_25E0DAF40()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_25E0DAF50()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25E0DAF60()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25E0DAF70()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25E0DAF80()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_25E0DAF90()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_25E0DAFA0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25E0DAFB0()
{
  return MEMORY[0x270F18138]();
}

uint64_t sub_25E0DAFC0()
{
  return MEMORY[0x270F18140]();
}

uint64_t sub_25E0DAFD0()
{
  return MEMORY[0x270F18148]();
}

uint64_t sub_25E0DAFE0()
{
  return MEMORY[0x270F18150]();
}

uint64_t sub_25E0DAFF0()
{
  return MEMORY[0x270F18158]();
}

uint64_t sub_25E0DB000()
{
  return MEMORY[0x270F18160]();
}

uint64_t sub_25E0DB010()
{
  return MEMORY[0x270F18168]();
}

uint64_t sub_25E0DB020()
{
  return MEMORY[0x270F18170]();
}

uint64_t sub_25E0DB030()
{
  return MEMORY[0x270F18178]();
}

uint64_t sub_25E0DB040()
{
  return MEMORY[0x270F18180]();
}

uint64_t sub_25E0DB050()
{
  return MEMORY[0x270F18188]();
}

uint64_t sub_25E0DB060()
{
  return MEMORY[0x270F18190]();
}

uint64_t sub_25E0DB070()
{
  return MEMORY[0x270F181B8]();
}

uint64_t sub_25E0DB080()
{
  return MEMORY[0x270F181C0]();
}

uint64_t sub_25E0DB090()
{
  return MEMORY[0x270F181C8]();
}

uint64_t sub_25E0DB0A0()
{
  return MEMORY[0x270F181D0]();
}

uint64_t sub_25E0DB0B0()
{
  return MEMORY[0x270F181D8]();
}

uint64_t sub_25E0DB0C0()
{
  return MEMORY[0x270F181F8]();
}

uint64_t sub_25E0DB0D0()
{
  return MEMORY[0x270F18200]();
}

uint64_t sub_25E0DB0E0()
{
  return MEMORY[0x270F18208]();
}

uint64_t sub_25E0DB0F0()
{
  return MEMORY[0x270F18218]();
}

uint64_t sub_25E0DB100()
{
  return MEMORY[0x270F18220]();
}

uint64_t sub_25E0DB110()
{
  return MEMORY[0x270F18228]();
}

uint64_t sub_25E0DB120()
{
  return MEMORY[0x270F18238]();
}

uint64_t sub_25E0DB130()
{
  return MEMORY[0x270F18240]();
}

uint64_t sub_25E0DB140()
{
  return MEMORY[0x270F18248]();
}

uint64_t sub_25E0DB150()
{
  return MEMORY[0x270F18280]();
}

uint64_t sub_25E0DB160()
{
  return MEMORY[0x270F18290]();
}

uint64_t sub_25E0DB170()
{
  return MEMORY[0x270F18298]();
}

uint64_t sub_25E0DB180()
{
  return MEMORY[0x270F182B0]();
}

uint64_t sub_25E0DB190()
{
  return MEMORY[0x270F182B8]();
}

uint64_t sub_25E0DB1A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25E0DB1B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25E0DB1C0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25E0DB1D0()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_25E0DB1E0()
{
  return MEMORY[0x270FA2C60]();
}

uint64_t sub_25E0DB1F0()
{
  return MEMORY[0x270FA2C48]();
}

uint64_t sub_25E0DB200()
{
  return MEMORY[0x270FA2C50]();
}

uint64_t sub_25E0DB210()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25E0DB220()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25E0DB230()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25E0DB240()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_25E0DB250()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_25E0DB260()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_25E0DB270()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_25E0DB280()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_25E0DB290()
{
  return MEMORY[0x270F5C1D0]();
}

uint64_t sub_25E0DB2A0()
{
  return MEMORY[0x270F5C1D8]();
}

uint64_t sub_25E0DB2B0()
{
  return MEMORY[0x270F5C1E0]();
}

uint64_t sub_25E0DB2C0()
{
  return MEMORY[0x270F5C1F0]();
}

uint64_t sub_25E0DB2D0()
{
  return MEMORY[0x270F5C1F8]();
}

uint64_t sub_25E0DB2E0()
{
  return MEMORY[0x270F5C208]();
}

uint64_t sub_25E0DB2F0()
{
  return MEMORY[0x270F5C210]();
}

uint64_t sub_25E0DB300()
{
  return MEMORY[0x270F5C218]();
}

uint64_t sub_25E0DB310()
{
  return MEMORY[0x270F5C228]();
}

uint64_t sub_25E0DB320()
{
  return MEMORY[0x270F5C230]();
}

uint64_t sub_25E0DB330()
{
  return MEMORY[0x270F5C250]();
}

uint64_t sub_25E0DB340()
{
  return MEMORY[0x270F5C258]();
}

uint64_t sub_25E0DB350()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_25E0DB360()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_25E0DB370()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_25E0DB380()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25E0DB390()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25E0DB3A0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25E0DB3B0()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_25E0DB3C0()
{
  return MEMORY[0x270F9D0F0]();
}

uint64_t sub_25E0DB3D0()
{
  return MEMORY[0x270F9D150]();
}

uint64_t sub_25E0DB3E0()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_25E0DB3F0()
{
  return MEMORY[0x270F9D198]();
}

uint64_t sub_25E0DB400()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25E0DB410()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25E0DB420()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_25E0DB430()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_25E0DB440()
{
  return MEMORY[0x270F9D300]();
}

uint64_t sub_25E0DB450()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25E0DB460()
{
  return MEMORY[0x270F9D458]();
}

uint64_t sub_25E0DB470()
{
  return MEMORY[0x270F9D468]();
}

uint64_t sub_25E0DB480()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25E0DB490()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25E0DB4A0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_25E0DB4B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25E0DB4C0()
{
  return MEMORY[0x270EF1890]();
}

uint64_t sub_25E0DB4D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E0DB4E0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25E0DB4F0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25E0DB500()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E0DB510()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25E0DB520()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25E0DB530()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25E0DB540()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25E0DB550()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25E0DB560()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25E0DB570()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_25E0DB580()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25E0DB590()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25E0DB5A0()
{
  return MEMORY[0x270F9D658]();
}

uint64_t sub_25E0DB5B0()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_25E0DB5C0()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_25E0DB5D0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25E0DB5E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E0DB5F0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25E0DB600()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25E0DB610()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_25E0DB620()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25E0DB630()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E0DB640()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25E0DB650()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25E0DB660()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25E0DB670()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25E0DB680()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_25E0DB690()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25E0DB6A0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25E0DB6B0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25E0DB6C0()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25E0DB6D0()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_25E0DB6E0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25E0DB6F0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_25E0DB700()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25E0DB710()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25E0DB720()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25E0DB730()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_25E0DB740()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_25E0DB750()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_25E0DB760()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_25E0DB770()
{
  return MEMORY[0x270F9D960]();
}

uint64_t sub_25E0DB780()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_25E0DB790()
{
  return MEMORY[0x270F9D980]();
}

uint64_t sub_25E0DB7A0()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_25E0DB7B0()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_25E0DB7C0()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_25E0DB7D0()
{
  return MEMORY[0x270F9D9B8]();
}

uint64_t sub_25E0DB7E0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25E0DB7F0()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_25E0DB830()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25E0DB840()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_25E0DB850()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25E0DB870()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_25E0DB880()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_25E0DB890()
{
  return MEMORY[0x270F9DBE0]();
}

uint64_t sub_25E0DB8A0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25E0DB8B0()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_25E0DB8C0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25E0DB8D0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25E0DB8E0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_25E0DB8F0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_25E0DB900()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25E0DB910()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25E0DB920()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_25E0DB930()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_25E0DB940()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25E0DB950()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_25E0DB960()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25E0DB970()
{
  return MEMORY[0x270FA1E00]();
}

uint64_t sub_25E0DB980()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25E0DB990()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_25E0DB9A0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_25E0DB9D0()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_25E0DB9E0()
{
  return MEMORY[0x270FA1ED0]();
}

uint64_t sub_25E0DB9F0()
{
  return MEMORY[0x270FA1F00]();
}

uint64_t sub_25E0DBA00()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25E0DBA10()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25E0DBA20()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_25E0DBA30()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_25E0DBA40()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25E0DBA50()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_25E0DBA60()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_25E0DBA70()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25E0DBA90()
{
  return MEMORY[0x270FA1F80]();
}

uint64_t sub_25E0DBAA0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_25E0DBAC0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_25E0DBAE0()
{
  return MEMORY[0x270FA1FE0]();
}

uint64_t sub_25E0DBAF0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25E0DBB10()
{
  return MEMORY[0x270FA2008]();
}

uint64_t sub_25E0DBB20()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_25E0DBB40()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25E0DBB50()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25E0DBB60()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_25E0DBB70()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_25E0DBB80()
{
  return MEMORY[0x270F9E028]();
}

uint64_t sub_25E0DBB90()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25E0DBBA0()
{
  return MEMORY[0x270FA2B98]();
}

uint64_t sub_25E0DBBB0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25E0DBBC0()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t sub_25E0DBBD0()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_25E0DBBE0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25E0DBBF0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25E0DBC00()
{
  return MEMORY[0x270F9E100]();
}

uint64_t sub_25E0DBC10()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_25E0DBC20()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25E0DBC30()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25E0DBC40()
{
  return MEMORY[0x270FA2BC0]();
}

uint64_t sub_25E0DBC50()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_25E0DBC60()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_25E0DBC70()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25E0DBC80()
{
  return MEMORY[0x270FA0E38]();
}

uint64_t sub_25E0DBC90()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25E0DBCA0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_25E0DBCB0()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_25E0DBCC0()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_25E0DBCD0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_25E0DBCE0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25E0DBCF0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25E0DBD00()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_25E0DBD10()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_25E0DBD20()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_25E0DBD30()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_25E0DBD40()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25E0DBD50()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25E0DBD60()
{
  return MEMORY[0x270F9E570]();
}

uint64_t sub_25E0DBD70()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25E0DBD80()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25E0DBD90()
{
  return MEMORY[0x270EF2578]();
}

uint64_t sub_25E0DBDA0()
{
  return MEMORY[0x270EF25A0]();
}

uint64_t sub_25E0DBE00()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25E0DBE20()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25E0DBE30()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_25E0DBE60()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25E0DBE70()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_25E0DBE80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25E0DBE90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25E0DBEA0()
{
  return MEMORY[0x270F9E9E0]();
}

uint64_t sub_25E0DBEB0()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25E0DBEC0()
{
  return MEMORY[0x270F9E9F0]();
}

uint64_t sub_25E0DBED0()
{
  return MEMORY[0x270F9E9F8]();
}

uint64_t sub_25E0DBEE0()
{
  return MEMORY[0x270F9EA00]();
}

uint64_t sub_25E0DBEF0()
{
  return MEMORY[0x270F9EA08]();
}

uint64_t sub_25E0DBF00()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25E0DBF10()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25E0DBF20()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25E0DBF30()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_25E0DBF40()
{
  return MEMORY[0x270F9EAE8]();
}

uint64_t sub_25E0DBF50()
{
  return MEMORY[0x270F9EB08]();
}

uint64_t sub_25E0DBF60()
{
  return MEMORY[0x270F9EB10]();
}

uint64_t sub_25E0DBF70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25E0DBF80()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25E0DBF90()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25E0DBFA0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25E0DBFB0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25E0DBFC0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25E0DBFD0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25E0DBFE0()
{
  return MEMORY[0x270F9EC18]();
}

uint64_t sub_25E0DBFF0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25E0DC000()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25E0DC010()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25E0DC020()
{
  return MEMORY[0x270F9ECB8]();
}

uint64_t sub_25E0DC030()
{
  return MEMORY[0x270FA2160]();
}

uint64_t sub_25E0DC050()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_25E0DC060()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_25E0DC070()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25E0DC080()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25E0DC090()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25E0DC0A0()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t sub_25E0DC0B0()
{
  return MEMORY[0x270F9ED40]();
}

uint64_t sub_25E0DC0C0()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_25E0DC0D0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25E0DC0E0()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_25E0DC0F0()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t sub_25E0DC100()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25E0DC110()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25E0DC120()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_25E0DC130()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25E0DC140()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25E0DC150()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_25E0DC160()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_25E0DC170()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_25E0DC180()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_25E0DC190()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25E0DC1A0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E0DC1B0()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_25E0DC1C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25E0DC1D0()
{
  return MEMORY[0x270F9F148]();
}

uint64_t sub_25E0DC1F0()
{
  return MEMORY[0x270F9F1F8]();
}

uint64_t sub_25E0DC200()
{
  return MEMORY[0x270F9F200]();
}

uint64_t sub_25E0DC210()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25E0DC220()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25E0DC230()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25E0DC240()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25E0DC250()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25E0DC260()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25E0DC270()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25E0DC280()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25E0DC290()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25E0DC2A0()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25E0DC2B0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25E0DC2C0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25E0DC2D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25E0DC2E0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_25E0DC300()
{
  return MEMORY[0x270F9F508]();
}

uint64_t sub_25E0DC310()
{
  return MEMORY[0x270F9F550]();
}

uint64_t sub_25E0DC330()
{
  return MEMORY[0x270F9F610]();
}

uint64_t sub_25E0DC340()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25E0DC350()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_25E0DC360()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_25E0DC370()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_25E0DC380()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E0DC3A0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_25E0DC3B0()
{
  return MEMORY[0x270F9F858]();
}

uint64_t sub_25E0DC3C0()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_25E0DC3E0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25E0DC3F0()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_25E0DC400()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_25E0DC410()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_25E0DC420()
{
  return MEMORY[0x270F9FAB8]();
}

uint64_t sub_25E0DC430()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25E0DC460()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25E0DC470()
{
  return MEMORY[0x270F9FB28]();
}

uint64_t sub_25E0DC480()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25E0DC490()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25E0DC4A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25E0DC4B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25E0DC4C0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25E0DC4D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E0DC4E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25E0DC4F0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25E0DC500()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25E0DC510()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_25E0DC520()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_25E0DC530()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_25E0DC540()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_25E0DC550()
{
  return MEMORY[0x270F9FD40]();
}

uint64_t sub_25E0DC560()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_25E0DC570()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_25E0DC580()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25E0DC590()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_25E0DC5A0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_25E0DC5B0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25E0DC5C0()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_25E0DC5E0()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_25E0DC5F0()
{
  return MEMORY[0x270FA0098]();
}

uint64_t sub_25E0DC600()
{
  return MEMORY[0x270FA00A0]();
}

uint64_t sub_25E0DC630()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t sub_25E0DC650()
{
  return MEMORY[0x270FA0128]();
}

uint64_t sub_25E0DC660()
{
  return MEMORY[0x270FA0130]();
}

uint64_t MobileGestalt_copy_nVRAMDictionary_obj()
{
  return MEMORY[0x270F96090]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
}

uint64_t MobileGestalt_get_isSimulator()
{
  return MEMORY[0x270F96158]();
}

uint64_t MobileGestalt_get_isVirtualDevice()
{
  return MEMORY[0x270F96160]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

int isprint(int _c)
{
  return MEMORY[0x270ED9F10](*(void *)&_c);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B498](a1, *(void *)&a2, a3, a4, a5);
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

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B4C0](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x270F9B4C8](a1, zName);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4D8](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_text64(sqlite3_stmt *a1, int a2, const char *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *), unsigned __int8 encoding)
{
  return MEMORY[0x270F9B4F0](a1, *(void *)&a2, a3, a4, a5, encoding);
}

int sqlite3_bind_value(sqlite3_stmt *a1, int a2, const sqlite3_value *a3)
{
  return MEMORY[0x270F9B4F8](a1, *(void *)&a2, a3);
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

sqlite3_value *__cdecl sqlite3_column_value(sqlite3_stmt *a1, int iCol)
{
  return (sqlite3_value *)MEMORY[0x270F9B5D8](a1, *(void *)&iCol);
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

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x270F9B670](pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x270F9B680](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x270F9B6F0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v3(sqlite3 *db, const char *zSql, int nByte, unsigned int prepFlags, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B728](db, zSql, *(void *)&nByte, *(void *)&prepFlags, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

void sqlite3_result_blob64(sqlite3_context *a1, const void *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *))
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

void sqlite3_result_pointer(sqlite3_context *a1, void *a2, const char *a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_text64(sqlite3_context *a1, const char *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *), unsigned __int8 encoding)
{
}

void sqlite3_result_value(sqlite3_context *a1, sqlite3_value *a2)
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

sqlite3_value *__cdecl sqlite3_value_dup(const sqlite3_value *a1)
{
  return (sqlite3_value *)MEMORY[0x270F9B890](a1);
}

void sqlite3_value_free(sqlite3_value *a1)
{
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8A0](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8A8](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x270F9B8B0](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B8C0](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8D0](a1);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return (char *)MEMORY[0x270F9B8E8](a1, a2);
}

int sqlite3_vtab_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x270F9B8F0](a1, *(void *)&op);
}

int sqlite3_vtab_rhs_value(sqlite3_index_info *a1, int a2, sqlite3_value **ppVal)
{
  return MEMORY[0x270F9B8F8](a1, *(void *)&a2, ppVal);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
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

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x270FA01B0]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x270FA01B8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x270FA0360]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x270EDB8F8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}