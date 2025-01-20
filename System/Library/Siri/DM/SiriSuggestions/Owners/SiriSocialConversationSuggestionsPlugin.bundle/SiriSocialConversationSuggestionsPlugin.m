uint64_t sub_569C()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_56D4()
{
  return 20;
}

uint64_t sub_56F0()
{
  return 1;
}

BOOL sub_570C(uint64_t a1)
{
  BOOL v4 = a1 >= sub_56F0();
  swift_retain();
  BOOL v2 = !v4 || a1 >= sub_56D4();
  swift_release();
  return v2;
}

uint64_t sub_57B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[8] = v4;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  v5[7] = 0;
  v5[3] = a1;
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = v4;
  return _swift_task_switch(sub_5824, 0);
}

uint64_t sub_5824()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = sub_58C4();
  BOOL v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  return v2(v1);
}

uint64_t sub_58C4()
{
  v15 = 0;
  uint64_t v14 = 0;
  uint64_t v2 = 0;
  uint64_t v7 = sub_E2E0();
  uint64_t v5 = *(void *)(v7 - 8);
  uint64_t v6 = v7 - 8;
  unint64_t v3 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v8 = (uint64_t)&v2 - v3;
  uint64_t v12 = sub_E280();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v4 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v12);
  uint64_t v11 = (uint64_t)&v2 - v4;
  v15 = (char *)&v2 - v4;
  uint64_t v14 = v0;
  sub_E270();
  sub_5A44(v8);
  uint64_t v13 = sub_5B2C(v11, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v7);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v12);
  return v13;
}

void sub_5A44(uint64_t a1@<X8>)
{
  uint64_t v5 = a1;
  uint64_t v7 = sub_E2E0();
  uint64_t v3 = *(void *)(v7 - 8);
  uint64_t v4 = v7 - 8;
  unint64_t v2 = (*(void *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  uint64_t v6 = (char *)&v1 - v2;
  id v8 = [self currentCalendar];
  sub_E2B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v5, v6, v7);
}

uint64_t sub_5B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  v11[2] = a2;
  uint64_t v3 = v2;
  uint64_t v13 = v3;
  uint64_t v24 = 0;
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v16 = sub_E2C0();
  uint64_t v14 = *(void *)(v16 - 8);
  uint64_t v15 = v16 - 8;
  __chkstk_darwin();
  v17 = (char *)v11 - v5;
  uint64_t v24 = v12;
  uint64_t v23 = a2;
  uint64_t v22 = v13;
  (*(void (**)(void))(v14 + 104))();
  uint64_t v18 = sub_E2D0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v16);
  uint64_t v21 = v18;
  uint64_t v19 = sub_E7B0();
  v20 = v6;
  if (sub_570C(v18)) {
    v11[0] = sub_5CF0(0);
  }
  else {
    v11[0] = sub_5CF0(1);
  }
  v11[1] = v7;
  uint64_t result = v19;
  uint64_t v9 = v20;
  uint64_t v10 = v11[0];
  v20[3] = &type metadata for String;
  *uint64_t v9 = v10;
  v9[1] = v7;
  sub_5D7C();
  return result;
}

uint64_t sub_5CF0(char a1)
{
  if (a1) {
    return sub_E570("other", 5uLL, 1);
  }
  else {
    return sub_E570("bedtime", 7uLL, 1);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_5D7C()
{
}

uint64_t sub_5DC0()
{
  sub_723C();
  return v1;
}

uint64_t sub_5DF4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_5E34()
{
  return sub_5E70();
}

uint64_t sub_5E70()
{
  uint64_t v0 = sub_E570("typeOfTimeOfDay", 0xFuLL, 1);
  uint64_t result = v3;
  *(void *)(v3 + 16) = v0;
  *(void *)(v3 + 24) = v2;
  return result;
}

uint64_t sub_5EC4(uint64_t a1, uint64_t a2)
{
  return sub_5B2C(a1, a2);
}

uint64_t sub_5EE8()
{
  return sub_569C();
}

uint64_t sub_5F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  void *v5 = *(void *)(v7 + 16);
  v5[1] = sub_5FDC;
  return sub_57B8(a1, a2, a3, a4);
}

uint64_t sub_5FDC(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t sub_6110()
{
  return sub_E4E0();
}

uint64_t sub_6128(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  v2._rawValue = (void *)sub_E7A0();
  *(void *)uint64_t v3 = "bedtime";
  *(void *)(v3 + 8) = 7;
  *(unsigned char *)(v3 + 16) = 2;
  *(void *)(v3 + 24) = "other";
  *(void *)(v3 + 32) = 5;
  *(unsigned char *)(v3 + 40) = 2;
  sub_5D7C();
  Swift::Int v7 = sub_E760(v2, v6);
  swift_bridgeObjectRelease();
  if (!v7)
  {
    char v8 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v8 & 1;
  }
  if (v7 == 1)
  {
    char v8 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_6260()
{
  return sub_E7C0() & 1;
}

unint64_t sub_62AC()
{
  uint64_t v2 = qword_14238;
  if (!qword_14238)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14238);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_632C()
{
  return sub_E5A0();
}

uint64_t sub_636C()
{
  return sub_E5C0();
}

uint64_t sub_63B4()
{
  return sub_E5B0();
}

uint64_t sub_63FC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_6128(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_6434@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_5CF0(*v1 & 1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for TimeOfDayResolver()
{
  return self;
}

unsigned char *sub_6494(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_64A4(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_6654(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_6898(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_68A8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for TimeOfDay()
{
  return &unk_10858;
}

uint64_t type metadata accessor for URLResourceKey()
{
  uint64_t v4 = qword_142E0;
  if (!qword_142E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_142E0);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_6970()
{
  return sub_E750();
}

uint64_t sub_69AC()
{
  return sub_E720();
}

uint64_t sub_69F8()
{
  return sub_E730() & 1;
}

uint64_t sub_6A48()
{
  return sub_E740();
}

uint64_t sub_6A94()
{
  return sub_E6E0();
}

uint64_t sub_6AD4()
{
  return sub_E710();
}

uint64_t sub_6B1C()
{
  return sub_E6F0();
}

uint64_t sub_6B64()
{
  return sub_E7C0() & 1;
}

NSString sub_6BB0@<X0>(void *a1@<X8>)
{
  NSString result = sub_6BE8();
  *a1 = result;
  return result;
}

NSString sub_6BE8()
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_E540();
  id v0 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_6C44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_6C78(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_6C78(void *a1)
{
  id v1 = a1;
  uint64_t v4 = sub_E550();

  return v4;
}

uint64_t sub_6CC8()
{
  return sub_E700();
}

unint64_t sub_6D14()
{
  return sub_6D2C();
}

unint64_t sub_6D2C()
{
  uint64_t v2 = qword_142E8;
  if (!qword_142E8)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_142E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_6DB0()
{
  return sub_6DC8();
}

unint64_t sub_6DC8()
{
  uint64_t v2 = qword_142F0;
  if (!qword_142F0)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_142F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_6E4C()
{
  return sub_6E64();
}

unint64_t sub_6E64()
{
  uint64_t v2 = qword_142F8;
  if (!qword_142F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_142F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_6EE4()
{
  return sub_6EFC();
}

unint64_t sub_6EFC()
{
  uint64_t v2 = qword_14300;
  if (!qword_14300)
  {
    type metadata accessor for TimeOfDayResolver();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14300);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_6F80()
{
  return sub_6F98();
}

unint64_t sub_6F98()
{
  uint64_t v2 = qword_14308;
  if (!qword_14308)
  {
    type metadata accessor for TimeOfDayResolver();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14308);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_701C()
{
  return sub_7034();
}

unint64_t sub_7034()
{
  uint64_t v2 = qword_14310;
  if (!qword_14310)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14310);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_70B8()
{
  uint64_t v2 = qword_14318;
  if (!qword_14318)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14318);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_713C()
{
  uint64_t v2 = qword_14320;
  if (!qword_14320)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14320);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_71B8()
{
  uint64_t v2 = qword_14328;
  if (!qword_14328)
  {
    type metadata accessor for URLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14328);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_723C()
{
}

void sub_7268()
{
  *id v0 = *v0;
}

uint64_t sub_7274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[33] = a3;
  v4[32] = a1;
  v4[27] = v4;
  v4[28] = 0;
  v4[29] = 0;
  v4[30] = 0;
  v4[31] = 0;
  v4[17] = 0;
  v4[18] = 0;
  v4[19] = 0;
  v4[20] = 0;
  v4[25] = 0;
  v4[26] = 0;
  uint64_t v5 = sub_E4D0();
  v4[34] = v5;
  v4[35] = *(void *)(v5 - 8);
  v4[36] = swift_task_alloc();
  v4[28] = a1;
  v4[29] = a2;
  v4[30] = a3;
  v4[31] = v3;
  return _swift_task_switch(sub_73D8, 0);
}

uint64_t sub_73D8()
{
  id v1 = (void *)v0[32];
  v0[27] = v0;
  sub_7A14(v1, v1[3]);
  uint64_t v2 = sub_E390();
  uint64_t v20 = sub_D8FC(v2);
  uint64_t v21 = v3;
  v0[17] = v20;
  v0[18] = v3;
  swift_bridgeObjectRetain();
  if (v21)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v17 = v20;
    uint64_t v18 = v21;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  if (v18)
  {
    uint64_t v15 = v17;
    uint64_t v16 = v18;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  if (v16)
  {
    v19[19] = v15;
    v19[20] = v16;
    sub_7AFC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19[23] = v15;
    v19[24] = v16;
    sub_E510();
    sub_723C();
    uint64_t v14 = v19[22];
    if (v14)
    {
      uint64_t v12 = v19[36];
      uint64_t v13 = v19[34];
      uint64_t v10 = (void *)v19[33];
      uint64_t v11 = v19[35];
      v19[25] = v19[21];
      v19[26] = v14;
      swift_bridgeObjectRelease();
      sub_7A14(v10, v10[3]);
      sub_7A8C((uint64_t *)&unk_14340);
      sub_E7A0();
      sub_E500();
      (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v12, enum case for Objective.discoverability(_:), v13);
      sub_E450();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
      swift_bridgeObjectRelease();
      sub_7B60(v19 + 2, v19 + 12);
      if (v19[15])
      {
        sub_7CEC(v19 + 12, v19 + 7);
        sub_7A8C(&qword_14338);
        uint64_t v8 = sub_E7A0();
        sub_7D28((uint64_t)(v19 + 7), v4);
        sub_5D7C();
        sub_7C40((uint64_t)(v19 + 7));
        sub_7BFC((uint64_t)(v19 + 2));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v9 = v8;
        goto LABEL_17;
      }
      sub_7BFC((uint64_t)(v19 + 12));
      sub_7BFC((uint64_t)(v19 + 2));
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  sub_7A8C(&qword_14338);
  uint64_t v7 = sub_E7A0();
  swift_bridgeObjectRelease();
  uint64_t v9 = v7;
LABEL_17:
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v19[27] + 8);
  return v5(v9);
}

void *sub_7A14(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t sub_7A8C(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t *sub_7AFC()
{
  if (qword_141E8 != -1) {
    swift_once();
  }
  return &qword_15110;
}

void *sub_7B60(void *a1, void *a2)
{
  if (a1[3])
  {
    uint64_t v2 = a1[3];
    a2[3] = v2;
    a2[4] = a1[4];
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

uint64_t sub_7BFC(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    sub_7C40(a1);
  }
  return a1;
}

uint64_t sub_7C40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

void *sub_7CEC(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t sub_7D28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_7D94()
{
  return v0;
}

uint64_t sub_7DB8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_7DF8()
{
  return sub_7D94();
}

uint64_t sub_7E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_5FDC;
  return sub_7274(a1, a2, a3);
}

uint64_t sub_7EFC()
{
  sub_7A8C(&qword_14350);
  sub_E7A0();
  uint64_t v4 = v0;
  *uint64_t v0 = sub_E570("dalWhoIsSiri", 0xCuLL, 1);
  v4[1] = v1;
  v4[2] = sub_E570("suggestHelp", 0xBuLL, 1);
  v4[3] = v2;
  sub_5D7C();
  uint64_t result = sub_E500();
  qword_15110 = result;
  return result;
}

uint64_t type metadata accessor for SocialHintsGenerator()
{
  return self;
}

void *type metadata accessor for SocialDialogIdToSuggestionIdMapping()
{
  return &unk_108B0;
}

unint64_t sub_8004()
{
  return sub_801C();
}

unint64_t sub_801C()
{
  uint64_t v2 = qword_143F0;
  if (!qword_143F0)
  {
    type metadata accessor for SocialHintsGenerator();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_143F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_80A0()
{
  return sub_80B8();
}

unint64_t sub_80B8()
{
  uint64_t v2 = qword_143F8;
  if (!qword_143F8)
  {
    type metadata accessor for SocialHintsGenerator();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_143F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_813C()
{
  uint64_t v17 = sub_E7A0();
  uint64_t v16 = v0;
  *uint64_t v0 = sub_E570("en-US", 5uLL, 1);
  v16[1] = v1;
  v16[2] = sub_E570("en-GB", 5uLL, 1);
  v16[3] = v2;
  v16[4] = sub_E570("en-IN", 5uLL, 1);
  v16[5] = v3;
  v16[6] = sub_E570("en-AU", 5uLL, 1);
  v16[7] = v4;
  v16[8] = sub_E570("en-CA", 5uLL, 1);
  v16[9] = v5;
  v16[10] = sub_E570("es-ES", 5uLL, 1);
  v16[11] = v6;
  v16[12] = sub_E570("es-MX", 5uLL, 1);
  v16[13] = v7;
  v16[14] = sub_E570("es-US", 5uLL, 1);
  v16[15] = v8;
  v16[16] = sub_E570("zh-CN", 5uLL, 1);
  v16[17] = v9;
  v16[18] = sub_E570("zh-HK", 5uLL, 1);
  v16[19] = v10;
  v16[20] = sub_E570("de-DE", 5uLL, 1);
  v16[21] = v11;
  v16[22] = sub_E570("fr-FR", 5uLL, 1);
  v16[23] = v12;
  v16[24] = sub_E570("ja-JP", 5uLL, 1);
  v16[25] = v13;
  sub_5D7C();
  uint64_t v22 = v17;
  uint64_t v18 = sub_7A8C(&qword_14420);
  uint64_t v19 = sub_E2A0();
  unint64_t v14 = sub_8DF4();
  uint64_t v21 = sub_84B8((void (*)(char *, char *))sub_845C, 0, v18, v19, (uint64_t)&type metadata for Never, v14, (uint64_t)&protocol witness table for Never, v20);
  uint64_t result = &v22;
  sub_8EF0();
  qword_15118 = v21;
  return result;
}

uint64_t sub_845C()
{
  return sub_E290();
}

uint64_t sub_84B8(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v30 = a1;
  uint64_t v31 = a2;
  uint64_t v55 = a3;
  uint64_t v45 = a4;
  uint64_t v32 = a5;
  uint64_t v54 = a6;
  uint64_t v34 = a8;
  v35 = "Fatal error";
  v36 = "Index out of bounds";
  v37 = "Swift/Collection.swift";
  v38 = "Range requires lowerBound <= upperBound";
  v39 = "Swift/Range.swift";
  v40 = "Index out of range";
  uint64_t v70 = a3;
  uint64_t v69 = a4;
  uint64_t v68 = a5;
  uint64_t v41 = *(void *)(a5 - 8);
  uint64_t v42 = a5 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(a1);
  v44 = (char *)&v15 - v43;
  uint64_t v46 = 0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v49 = AssociatedTypeWitness - 8;
  unint64_t v50 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __chkstk_darwin(v46);
  v51 = (char *)&v15 - v50;
  unint64_t v52 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v53 = (char *)&v15 - v52;
  uint64_t v56 = swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v58 = v56 - 8;
  unint64_t v59 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = __chkstk_darwin(v55);
  v60 = (char *)&v15 - v59;
  unint64_t v61 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  v62 = (char *)&v15 - v61;
  Swift::Int v63 = sub_E610();
  if (v63)
  {
    uint64_t v67 = sub_E6A0();
    uint64_t v29 = sub_E6B0();
    sub_E680(v63);
    uint64_t result = sub_E600();
    if (v63 >= 0)
    {
      uint64_t v27 = 0;
      for (uint64_t i = v33; ; uint64_t i = v18)
      {
        uint64_t v25 = i;
        uint64_t v26 = v27;
        if (v27 == v63) {
          goto LABEL_17;
        }
        if (v26 < 0 || v26 >= v63) {
          goto LABEL_16;
        }
        uint64_t v65 = v26;
        if (v63 < 0) {
          goto LABEL_15;
        }
        if (v26 >= v63) {
          break;
        }
        uint64_t v24 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          return result;
        }
        char v66 = 0;
        uint64_t v23 = v24;
LABEL_18:
        uint64_t v22 = v23;
        if (v66)
        {
          (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v60, v62, v56);
          sub_E660();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v60, v56);
          uint64_t v19 = v67;
          swift_retain();
          swift_release();
          uint64_t v20 = v19;
          uint64_t v21 = v25;
          return v20;
        }
        uint64_t v17 = &v64;
        uint64_t v16 = (void (*)(void))sub_E640();
        (*(void (**)(char *))(v48 + 16))(v51);
        v16();
        uint64_t v14 = v25;
        v30(v51, v44);
        uint64_t v18 = v14;
        if (v14)
        {
          (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v57 + 8))(v62, v56);
          sub_D8D0();
          (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v34, v44, v32);
          return v15;
        }
        (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
        sub_E690();
        sub_E620();
        uint64_t result = v18;
        uint64_t v27 = v22;
      }
      sub_E6C0();
      __break(1u);
LABEL_15:
      sub_E6C0();
      __break(1u);
LABEL_16:
      sub_E6D0();
      __break(1u);
LABEL_17:
      uint64_t v65 = 0;
      char v66 = 1;
      uint64_t v23 = v26;
      goto LABEL_18;
    }
    sub_E6C0();
    __break(1u);
  }
  uint64_t v20 = sub_E5D0();
  uint64_t v21 = v33;
  return v20;
}

unint64_t sub_8DF4()
{
  uint64_t v2 = qword_14428;
  if (!qword_14428)
  {
    sub_8E78(&qword_14420);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14428);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_8E78(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_8EF0()
{
}

uint64_t *sub_8F1C()
{
  if (qword_141F0 != -1) {
    swift_once();
  }
  return &qword_15118;
}

uint64_t sub_8F80()
{
  uint64_t result = sub_E570("/System/Library/Assistant/FlowDelegatePlugins/SocialConversationFlowDelegatePlugin.bundle/Templates/", 0x64uLL, 1);
  qword_15120 = result;
  qword_15128 = v1;
  return result;
}

uint64_t *sub_8FC4()
{
  if (qword_141F8 != -1) {
    swift_once();
  }
  return &qword_15120;
}

uint64_t sub_9028@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v56 = a1;
  uint64_t v3 = v2;
  uint64_t v4 = v56;
  uint64_t v57 = v3;
  v92 = 0;
  v91 = 0;
  v90 = 0;
  uint64_t v89 = 0;
  uint64_t v88 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v58 = sub_E260();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  uint64_t v68 = *(void *)(v59 + 64);
  unint64_t v61 = (v68 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v58);
  v62 = (char *)&v19 - v61;
  unint64_t v63 = v61;
  uint64_t v5 = __chkstk_darwin((char *)&v19 - v61);
  char v64 = (char *)&v19 - v63;
  v92 = (char *)&v19 - v63;
  unint64_t v65 = (v68 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v5);
  char v66 = (char *)&v19 - v65;
  v91 = (char *)&v19 - v65;
  unint64_t v67 = (v68 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v6);
  uint64_t v69 = (char *)&v19 - v67;
  unint64_t v70 = (v68 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v19 - v67);
  v71 = (char *)&v19 - v70;
  v90 = (char *)&v19 - v70;
  uint64_t v89 = v4;
  uint64_t v88 = v7;
  uint64_t v73 = sub_E300();
  uint64_t v8 = sub_E570("locale", 6uLL, 1);
  v72 = v85;
  v85[0] = v8;
  v85[1] = v9;
  sub_E510();
  sub_723C();
  swift_bridgeObjectRelease();
  if (v87)
  {
    if (swift_dynamicCast())
    {
      uint64_t v53 = v74;
      uint64_t v54 = v75;
    }
    else
    {
      uint64_t v53 = 0;
      uint64_t v54 = 0;
    }
    uint64_t v51 = v53;
    uint64_t v52 = v54;
  }
  else
  {
    uint64_t v19 = 0;
    sub_7BFC((uint64_t)v86);
    uint64_t v51 = v19;
    uint64_t v52 = v19;
  }
  uint64_t v49 = v52;
  uint64_t v50 = v51;
  if (!v52) {
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v55, 1, 1, v58);
  }
  uint64_t v47 = v50;
  uint64_t v48 = v49;
  uint64_t v40 = v49;
  uint64_t v83 = v50;
  uint64_t v84 = v49;
  v82[2] = v50;
  v82[3] = v49;
  uint64_t v10 = sub_E570("-", 1uLL, 1);
  uint64_t v41 = v82;
  v82[0] = v10;
  v82[1] = v11;
  sub_9AB8();
  uint64_t v42 = sub_E650();
  sub_723C();
  swift_bridgeObjectRetain();
  v44 = v80;
  v80[0] = v42;
  uint64_t v43 = sub_7A8C(&qword_14420);
  sub_8DF4();
  sub_E630();
  sub_8EF0();
  uint64_t v45 = v80[1];
  uint64_t v46 = v81;
  if (!v81)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v55, 1, 1, v58);
  }
  uint64_t v38 = v45;
  uint64_t v39 = v46;
  uint64_t v25 = v46;
  uint64_t v24 = v45;
  uint64_t v78 = v45;
  uint64_t v79 = v46;
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_8FC4();
  uint64_t v22 = *v12;
  uint64_t v23 = v12[1];
  swift_bridgeObjectRetain();
  sub_E230();
  swift_bridgeObjectRelease();
  sub_E250();
  uint64_t v13 = v69;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v59 + 8);
  uint64_t v28 = v59 + 8;
  v29(v69, v58);
  uint64_t v14 = sub_8FC4();
  uint64_t v26 = *v14;
  uint64_t v27 = v14[1];
  swift_bridgeObjectRetain();
  sub_E230();
  swift_bridgeObjectRelease();
  id v30 = self;
  v36 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
  uint64_t v35 = v59 + 16;
  v36(v13, v66, v58);
  sub_E240(v15);
  id v31 = v16;
  v29(v69, v58);
  id v32 = [v30 getDialogAssetsVersion:v31 enableUpdates:1];

  uint64_t v33 = sub_E550();
  uint64_t v34 = v17;
  swift_bridgeObjectRetain();
  uint64_t v76 = v33;
  uint64_t v77 = v34;

  v36(v64, v66, v58);
  int v37 = sub_E580();
  swift_bridgeObjectRelease();
  v36(v62, v71, v58);
  if (v37) {
    int v21 = sub_9B34((uint64_t)v62);
  }
  else {
    int v21 = 0;
  }
  int v20 = v21;
  v29(v62, v58);
  if (v20)
  {
    v36(v69, v71, v58);
    (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v64, v69, v58);
  }
  v36(v55, v64, v58);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v55, 0, 1, v58);
  v29(v64, v58);
  sub_723C();
  v29(v66, v58);
  v29(v71, v58);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_9AB8()
{
  uint64_t v2 = qword_14430;
  if (!qword_14430)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14430);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_9B34(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v2 = v1;
  uint64_t v3 = v14;
  uint64_t v16 = v2;
  id v32 = 0;
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  char v29 = 0;
  uint64_t v4 = sub_7A8C(&qword_14438);
  unint64_t v15 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v26 = (uint64_t)&v9 - v15;
  uint64_t v17 = 0;
  uint64_t v18 = sub_E210();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = v18 - 8;
  unint64_t v21 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v9 - v21;
  id v32 = (char *)&v9 - v21;
  uint64_t v31 = v3;
  uint64_t v30 = v5;
  uint64_t v24 = type metadata accessor for URLResourceKey();
  uint64_t v23 = sub_E7A0();
  sub_9EA8((id *)&NSURLIsDirectoryKey, v6);
  uint64_t v7 = v23;
  sub_5D7C();
  uint64_t v25 = v7;
  sub_71B8();
  uint64_t v27 = sub_E5F0();
  sub_E220();
  uint64_t v28 = 0;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v26, 0, 1, v18);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v26, 1, v18) == 1)
  {
    sub_9EE0(v26);
LABEL_6:
    int v11 = 0;
    return v11 & 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v22, v26, v18);
  int v13 = sub_E200();
  if (v13 == 2)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    goto LABEL_6;
  }
  int v12 = v13;
  int v10 = v13;
  char v29 = v13 & 1;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  int v11 = v10;
  return v11 & 1;
}

void *sub_9EA8(id *a1, void *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_9EE0(uint64_t a1)
{
  uint64_t v3 = sub_E210();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_9F90(uint64_t a1, uint64_t a2)
{
  v3[25] = v2;
  v3[24] = a2;
  v3[23] = a1;
  v3[19] = v3;
  v3[17] = 0;
  v3[18] = 0;
  v3[20] = 0;
  v3[21] = 0;
  v3[17] = a1;
  v3[18] = a2;
  v3[20] = v2;
  return _swift_task_switch(sub_9FF4, 0);
}

uint64_t sub_9FF4()
{
  uint64_t v4 = (int *)v0[23];
  v0[19] = v0;
  uint64_t v3 = *sub_DB1C();
  swift_retain();
  v0[5] = sub_E370();
  v0[6] = sub_A4C8();
  uint64_t v7 = v0 + 2;
  v0[2] = v3;
  uint64_t v6 = (uint64_t (*)(void *))((char *)v4 + *v4);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v5 + 208) = v1;
  *uint64_t v1 = *(void *)(v5 + 152);
  v1[1] = sub_A128;
  return v6(v7);
}

uint64_t sub_A128(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = *v1 + 16;
  *(void *)(v4 + 152) = *v1;
  *(void *)(v4 + 216) = a1;
  swift_task_dealloc();
  sub_7C40(v3);
  return _swift_task_switch(sub_A258, 0);
}

uint64_t sub_A258()
{
  uint64_t v8 = v0[27];
  uint64_t v9 = v0[25];
  v0[19] = v0;
  v0[21] = v8;
  v0[22] = sub_A54C();
  swift_retain();
  int v10 = (void *)swift_task_alloc();
  v10[2] = v8;
  v10[3] = v9;
  v10[4] = v9;
  sub_7A8C(&qword_14450);
  sub_A7D0();
  sub_E590();
  swift_task_dealloc();
  swift_release();
  sub_8EF0();
  uint64_t v4 = type metadata accessor for SocialHintsGenerator();
  uint64_t v5 = sub_7DF8();
  v7[10] = v4;
  v7[11] = sub_A854();
  v7[7] = v5;
  sub_E460();
  sub_7C40((uint64_t)(v7 + 7));
  swift_release();
  sub_E480();
  sub_7A8C((uint64_t *)&unk_14468);
  uint64_t v6 = sub_E7A0();
  sub_7D28((uint64_t)(v7 + 12), v1);
  sub_5D7C();
  sub_7C40((uint64_t)(v7 + 12));
  swift_release();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v7[19] + 8);
  return v2(v6);
}

unint64_t sub_A4C8()
{
  uint64_t v2 = qword_14448;
  if (!qword_14448)
  {
    sub_E370();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14448);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_A54C()
{
  uint64_t result = sub_E7A0();
  *uint64_t v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  v1[4] = 4;
  sub_5D7C();
  return result;
}

uint64_t sub_A5B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = a1;
  uint64_t v20 = a3;
  uint64_t v17 = a4;
  uint64_t v18 = &unk_14558;
  uint64_t v22 = sub_D4A8;
  char v33 = 0;
  uint64_t v32 = 0;
  uint64_t v31 = 0;
  uint64_t v25 = sub_E3A0();
  uint64_t v23 = *(void *)(v25 - 8);
  uint64_t v24 = v25 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v26 = (char *)&v14 - v16;
  int v19 = *(unsigned __int8 *)__chkstk_darwin(v15);
  char v33 = v19;
  uint64_t v32 = a2;
  uint64_t v31 = v5;
  uint64_t v21 = sub_A8D8(v19);
  uint64_t v27 = v6;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v17;
  uint64_t v9 = v18;
  uint64_t v10 = v23;
  uint64_t v11 = v7;
  int v12 = v26;
  *(unsigned char *)(v11 + 16) = v19;
  *(void *)(v11 + 24) = v8;
  *(void *)int v12 = v9;
  *((void *)v12 + 1) = v11;
  (*(void (**)(void))(v10 + 104))();
  char v29 = v19;
  uint64_t v30 = v20;
  uint64_t v28 = sub_E470();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v25);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_A7A0(uint64_t a1)
{
  return sub_A5B4(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_A7D0()
{
  uint64_t v2 = qword_14458;
  if (!qword_14458)
  {
    sub_8E78(&qword_14450);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14458);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_A854()
{
  uint64_t v2 = qword_14460;
  if (!qword_14460)
  {
    type metadata accessor for SocialHintsGenerator();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14460);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_A8D8(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_E570("readMeAPoem", 0xBuLL, 1);
      break;
    case 2:
      uint64_t v2 = sub_E570("tellMeAJoke", 0xBuLL, 1);
      break;
    case 3:
      uint64_t v2 = sub_E570("tellMeAStory", 0xCuLL, 1);
      break;
    case 4:
      uint64_t v2 = sub_E570("whatAreYouDoingToday", 0x14uLL, 1);
      break;
    default:
      uint64_t v2 = sub_E570("flipACoin", 9uLL, 1);
      break;
  }
  return v2;
}

uint64_t sub_AA14(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 104) = a4;
  *(unsigned char *)(v4 + 217) = a3;
  *(void *)(v4 + 96) = a2;
  *(void *)(v4 + 88) = a1;
  *(void *)(v4 + 56) = v4;
  *(void *)(v4 + 64) = 0;
  *(unsigned char *)(v4 + 216) = 0;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 80) = 0;
  uint64_t v5 = sub_E2F0();
  *(void *)(v4 + 112) = v5;
  *(void *)(v4 + 120) = *(void *)(v5 - 8);
  *(void *)(v4 + 128) = swift_task_alloc();
  uint64_t v6 = sub_E340();
  *(void *)(v4 + 136) = v6;
  *(void *)(v4 + 144) = *(void *)(v6 - 8);
  *(void *)(v4 + 152) = swift_task_alloc();
  *(void *)(v4 + 160) = sub_7A8C(&qword_14568);
  *(void *)(v4 + 168) = swift_task_alloc();
  *(void *)(v4 + 176) = swift_task_alloc();
  sub_7A8C(&qword_14570);
  *(void *)(v4 + 184) = swift_task_alloc();
  uint64_t v7 = sub_E260();
  *(void *)(v4 + 192) = v7;
  *(void *)(v4 + 200) = *(void *)(v7 - 8);
  *(void *)(v4 + 208) = swift_task_alloc();
  *(void *)(v4 + 64) = a2;
  *(unsigned char *)(v4 + 216) = a3;
  return _swift_task_switch(sub_AC9C, 0);
}

uint64_t sub_AC9C()
{
  uint64_t v1 = *(void **)(v0 + 96);
  *(void *)(v0 + 56) = v0;
  sub_7A14(v1, v1[3]);
  uint64_t v32 = (void *)sub_E3C0();
  if (!v32)
  {
    sub_D638();
    swift_allocError();
    *uint64_t v2 = 1;
    swift_willThrow();
    goto LABEL_10;
  }
  uint64_t v30 = *(void *)(v31 + 192);
  char v29 = *(char **)(v31 + 184);
  uint64_t v28 = *(void *)(v31 + 200);
  *(void *)(v31 + 72) = v32;
  sub_9028((uint64_t)v32, v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v29, 1, v30) == 1)
  {
    sub_D6B8(*(void *)(v31 + 184));
    sub_D638();
    swift_allocError();
    *uint64_t v3 = 2;
    swift_willThrow();

    goto LABEL_10;
  }
  uint64_t v26 = *(uint64_t **)(v31 + 176);
  uint64_t v27 = *(void **)(v31 + 168);
  uint64_t v24 = *(void *)(v31 + 152);
  uint64_t v25 = *(void *)(v31 + 136);
  char v21 = *(unsigned char *)(v31 + 217);
  uint64_t v22 = *(void **)(v31 + 96);
  uint64_t v23 = *(void *)(v31 + 144);
  (*(void (**)(void))(*(void *)(v31 + 200) + 32))();
  sub_E320();
  sub_B300(v21);
  sub_7A14(v22, v22[3]);
  sub_E3B0();
  *(void *)(v31 + 16) = 0;
  *(void *)(v31 + 24) = 0;
  *(void *)(v31 + 32) = 0;
  *(void *)(v31 + 40) = 0;
  *(void *)(v31 + 48) = 0;
  sub_B420();
  sub_E310();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
  sub_7BFC(v31 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_D768(v26, v27);
  if (swift_getEnumCaseMultiPayload())
  {
    uint64_t v12 = *(void *)(v31 + 208);
    uint64_t v11 = *(void *)(v31 + 192);
    uint64_t v9 = *(void *)(v31 + 176);
    uint64_t v8 = *(void *)(v31 + 168);
    uint64_t v10 = *(void *)(v31 + 200);
    sub_D638();
    swift_allocError();
    *uint64_t v6 = 0;
    swift_willThrow();
    sub_D838(v8);
    sub_D838(v9);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v11);

LABEL_10:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v31 + 56) + 8);
    return v5();
  }
  uint64_t v18 = *(void *)(v31 + 208);
  uint64_t v17 = *(void *)(v31 + 192);
  uint64_t v19 = *(void *)(v31 + 176);
  uint64_t v20 = *(void *)(v31 + 128);
  uint64_t v15 = *(void *)(v31 + 112);
  int v13 = *(uint64_t **)(v31 + 88);
  uint64_t v16 = *(void *)(v31 + 200);
  uint64_t v14 = *(void *)(v31 + 120);
  (*(void (**)(void))(v14 + 32))();
  *(void *)(v31 + 80) = v20;
  v13[3] = v15;
  uint64_t v4 = sub_D528(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16))(v4, v20, v15);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v20, v15);
  sub_D838(v19);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v31 + 56) + 8);
  return v5();
}

uint64_t sub_B300(char a1)
{
  sub_E790();
  v3._countAndFlagsBits = sub_E570("SocialSuggestions#", 0x12uLL, 1);
  sub_E780(v3);
  swift_bridgeObjectRelease();
  sub_A8D8(a1);
  sub_E770();
  sub_723C();
  v4._countAndFlagsBits = sub_E570("", 0, 1);
  sub_E780(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_723C();
  return sub_E560();
}

uint64_t sub_B420()
{
  return sub_E330();
}

uint64_t sub_B438(void *a1, char a2, uint64_t a3)
{
  unint64_t v65 = a1;
  char v64 = a2;
  uint64_t v63 = a3;
  sub_D4B4(a1, v59);
  uint64_t v28 = v60;
  uint64_t v29 = v61;
  uint64_t v30 = v62;
  sub_7A14(v59, v60);
  sub_BA30();
  swift_bridgeObjectRetain();
  char v52 = a2;
  sub_7A8C(&qword_14490);
  sub_C700();
  sub_E510();
  swift_bridgeObjectRelease();
  uint64_t v51 = v53;
  if (v53)
  {
    uint64_t v54 = v51;
  }
  else
  {
    sub_E4C0();
    uint64_t v54 = sub_E7A0();
    sub_8EF0();
  }
  uint64_t v56 = v28;
  uint64_t v57 = v29;
  uint64_t v58 = v30;
  sub_D528(v55);
  sub_E350();
  swift_bridgeObjectRelease();
  uint64_t v11 = v56;
  uint64_t v10 = v57;
  uint64_t v12 = v58;
  sub_7A14(v55, v56);
  sub_8F1C();
  swift_bridgeObjectRetain();
  uint64_t v48 = v11;
  uint64_t v49 = v10;
  uint64_t v50 = v12;
  sub_D528(v47);
  sub_E410();
  swift_bridgeObjectRelease();
  uint64_t v19 = v48;
  uint64_t v18 = v49;
  uint64_t v20 = v50;
  sub_7A14(v47, v48);
  uint64_t v17 = sub_E360();
  sub_E7A0();
  uint64_t v15 = v3;
  uint64_t v13 = *(void *)(v17 - 8);
  uint64_t v16 = *(void (**)(void))(v13 + 104);
  v16();
  uint64_t v14 = *(void *)(v13 + 72);
  ((void (*)(uint64_t, void, uint64_t))v16)(v15 + v14, enum case for DeviceType.iPad(_:), v17);
  ((void (*)(uint64_t, void, uint64_t))v16)(v15 + 2 * v14, enum case for DeviceType.mac(_:), v17);
  sub_5D7C();
  uint64_t v44 = v19;
  uint64_t v45 = v18;
  uint64_t v46 = v20;
  sub_D528(v43);
  sub_E400();
  swift_bridgeObjectRelease();
  uint64_t v22 = v44;
  uint64_t v21 = v45;
  uint64_t v23 = v46;
  sub_7A14(v43, v44);
  sub_A8D8(a2);
  uint64_t v40 = v22;
  uint64_t v41 = v21;
  uint64_t v42 = v23;
  sub_D528(v39);
  sub_E420();
  swift_bridgeObjectRelease();
  uint64_t v25 = v40;
  uint64_t v24 = v41;
  uint64_t v26 = v42;
  sub_7A14(v39, v40);
  sub_E570("exampleUtterance", 0x10uLL, 1);
  v38[3] = v25;
  v38[4] = v24;
  v38[5] = v26;
  sub_D528(v38);
  sub_E430();
  swift_bridgeObjectRelease();
  sub_7C40((uint64_t)v38);
  sub_7C40((uint64_t)v39);
  sub_7C40((uint64_t)v43);
  sub_7C40((uint64_t)v47);
  sub_7C40((uint64_t)v55);
  uint64_t result = sub_7C40((uint64_t)v59);
  if (a2 == 3)
  {
    sub_D4B4(a1, v34);
    uint64_t v8 = v35;
    uint64_t v7 = v36;
    uint64_t v9 = v37;
    sub_7A14(v34, v35);
    sub_E570("timeOfDay", 9uLL, 1);
    uint64_t v5 = type metadata accessor for TimeOfDayResolver();
    uint64_t v6 = sub_5E34();
    v32[3] = v5;
    v32[4] = sub_D5B4();
    v32[0] = v6;
    sub_E3E0();
    sub_E570("typeOfTimeOfDay", 0xFuLL, 1);
    sub_E3D0();
    v33[3] = v8;
    v33[4] = v7;
    v33[5] = v9;
    sub_D528(v33);
    sub_E440();
    swift_release();
    sub_7BFC((uint64_t)v32);
    swift_bridgeObjectRelease();
    sub_7C40((uint64_t)v33);
    return sub_7C40((uint64_t)v34);
  }
  return result;
}

uint64_t *sub_BA30()
{
  if (qword_14218 != -1) {
    swift_once();
  }
  return &qword_14418;
}

uint64_t sub_BA94()
{
  return sub_E3F0();
}

uint64_t sub_BAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_5FDC;
  return sub_9F90(a1, a2);
}

uint64_t sub_BB6C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  v2._rawValue = (void *)sub_E7A0();
  *(void *)uint64_t v3 = "flipACoin";
  *(void *)(v3 + 8) = 9;
  *(unsigned char *)(v3 + 16) = 2;
  *(void *)(v3 + 24) = "readMeAPoem";
  *(void *)(v3 + 32) = 11;
  *(unsigned char *)(v3 + 40) = 2;
  *(void *)(v3 + 48) = "tellMeAJoke";
  *(void *)(v3 + 56) = 11;
  *(unsigned char *)(v3 + 64) = 2;
  *(void *)(v3 + 72) = "tellMeAStory";
  *(void *)(v3 + 80) = 12;
  *(unsigned char *)(v3 + 88) = 2;
  *(void *)(v3 + 96) = "whatAreYouDoingToday";
  *(void *)(v3 + 104) = 20;
  *(unsigned char *)(v3 + 112) = 2;
  sub_5D7C();
  Swift::Int v7 = sub_E760(v2, v6);
  swift_bridgeObjectRelease();
  switch(v7)
  {
    case 0:
      unsigned __int8 v8 = 0;
LABEL_12:
      swift_bridgeObjectRelease();
      return v8;
    case 1:
      unsigned __int8 v8 = 1;
      goto LABEL_12;
    case 2:
      unsigned __int8 v8 = 2;
      goto LABEL_12;
    case 3:
      unsigned __int8 v8 = 3;
      goto LABEL_12;
    case 4:
      unsigned __int8 v8 = 4;
      goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  return 5;
}

uint64_t sub_BD6C()
{
  return sub_E7C0() & 1;
}

uint64_t sub_BDB8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_BB6C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_BDF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A8D8(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_BE24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A54C();
  *a1 = result;
  return result;
}

uint64_t sub_BE50()
{
  return sub_E5A0();
}

uint64_t sub_BE90()
{
  return sub_E5C0();
}

uint64_t sub_BED8()
{
  return sub_E5B0();
}

uint64_t sub_BF20()
{
  sub_E4C0();
  uint64_t result = sub_E4B0();
  qword_14400 = result;
  return result;
}

uint64_t *sub_BF54()
{
  if (qword_14200 != -1) {
    swift_once();
  }
  return &qword_14400;
}

uint64_t sub_BFB8()
{
  sub_E4C0();
  uint64_t result = sub_E490();
  qword_14408 = result;
  return result;
}

uint64_t *sub_BFEC()
{
  if (qword_14208 != -1) {
    swift_once();
  }
  return &qword_14408;
}

uint64_t sub_C050()
{
  sub_E4C0();
  uint64_t result = sub_E4A0();
  qword_14410 = result;
  return result;
}

uint64_t *sub_C084()
{
  if (qword_14210 != -1) {
    swift_once();
  }
  return &qword_14410;
}

BOOL sub_C0E8(char a1, char a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v4 == v3;
}

uint64_t sub_C1BC()
{
  return sub_E810();
}

uint64_t sub_C268()
{
  return sub_E670();
}

uint64_t sub_C2B4()
{
  sub_7A8C(&qword_14488);
  sub_E7A0();
  uint64_t v32 = v0;
  *uint64_t v0 = 0;
  sub_E4C0();
  uint64_t v9 = sub_E7A0();
  uint64_t v10 = v1;
  uint64_t v7 = *sub_BF54();
  swift_retain();
  *uint64_t v10 = v7;
  uint64_t v8 = *sub_BFEC();
  swift_retain();
  v10[1] = v8;
  uint64_t v11 = *sub_C084();
  swift_retain();
  v10[2] = v11;
  sub_5D7C();
  *((void *)v32 + 1) = v9;
  v32[16] = 1;
  uint64_t v14 = sub_E7A0();
  uint64_t v15 = v2;
  uint64_t v12 = *sub_BF54();
  swift_retain();
  uint64_t *v15 = v12;
  uint64_t v13 = *sub_BFEC();
  swift_retain();
  v15[1] = v13;
  uint64_t v16 = *sub_C084();
  swift_retain();
  v15[2] = v16;
  sub_5D7C();
  *((void *)v32 + 3) = v14;
  v32[32] = 2;
  uint64_t v19 = sub_E7A0();
  uint64_t v20 = v3;
  uint64_t v17 = *sub_BF54();
  swift_retain();
  uint64_t *v20 = v17;
  uint64_t v18 = *sub_BFEC();
  swift_retain();
  v20[1] = v18;
  uint64_t v21 = *sub_C084();
  swift_retain();
  v20[2] = v21;
  sub_5D7C();
  *((void *)v32 + 5) = v19;
  v32[48] = 3;
  uint64_t v24 = sub_E7A0();
  uint64_t v25 = v4;
  uint64_t v22 = *sub_BF54();
  swift_retain();
  *uint64_t v25 = v22;
  uint64_t v23 = *sub_BFEC();
  swift_retain();
  v25[1] = v23;
  uint64_t v26 = *sub_C084();
  swift_retain();
  v25[2] = v26;
  sub_5D7C();
  *((void *)v32 + 7) = v24;
  v32[64] = 4;
  uint64_t v29 = sub_E7A0();
  uint64_t v30 = v5;
  uint64_t v27 = *sub_BF54();
  swift_retain();
  *uint64_t v30 = v27;
  uint64_t v28 = *sub_BFEC();
  swift_retain();
  v30[1] = v28;
  uint64_t v31 = *sub_C084();
  swift_retain();
  v30[2] = v31;
  sub_5D7C();
  *((void *)v32 + 9) = v29;
  sub_5D7C();
  sub_7A8C(&qword_14490);
  sub_C700();
  uint64_t result = sub_E500();
  qword_14418 = result;
  return result;
}

unint64_t sub_C600()
{
  uint64_t v2 = qword_14478;
  if (!qword_14478)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14478);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_C680()
{
  uint64_t v2 = qword_14480;
  if (!qword_14480)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14480);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_C700()
{
  uint64_t v2 = qword_14498;
  if (!qword_14498)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14498);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_C780(char *a1, char *a2)
{
  return sub_C0E8(*a1, *a2);
}

uint64_t sub_C7A4()
{
  return sub_C268();
}

uint64_t sub_C7C0()
{
  return sub_C1BC();
}

Swift::Int sub_C7DC(Swift::Int a1)
{
  return sub_E530(a1);
}

uint64_t sub_C7F4()
{
  return sub_E7F0();
}

uint64_t sub_C80C()
{
  return sub_E7E0();
}

uint64_t sub_C824()
{
  return sub_E800();
}

uint64_t sub_C83C()
{
  return sub_E7D0();
}

uint64_t type metadata accessor for SocialConversationOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_C87C(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFB) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 4) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 251;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 5;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_CA2C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFB)
  {
    unsigned int v5 = ((a3 + 4) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFB)
  {
    unsigned int v4 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 4;
    }
  }
  return result;
}

uint64_t sub_CC70(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_CC78(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void *type metadata accessor for SocialSuggestion()
{
  return &unk_10940;
}

void *type metadata accessor for SocialSuggestionSignals()
{
  return &unk_10960;
}

uint64_t sub_CCA8(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_CE58(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 2;
    }
  }
  return result;
}

void *type metadata accessor for DialogExecutionError()
{
  return &unk_109F0;
}

unint64_t sub_D0B0()
{
  return sub_D0C8();
}

unint64_t sub_D0C8()
{
  uint64_t v2 = qword_14538;
  if (!qword_14538)
  {
    sub_8E78(&qword_14450);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14538);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_D14C()
{
  return sub_D164();
}

unint64_t sub_D164()
{
  uint64_t v2 = qword_14540;
  if (!qword_14540)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14540);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_D1E4()
{
  return sub_D1FC();
}

unint64_t sub_D1FC()
{
  uint64_t v2 = qword_14548;
  if (!qword_14548)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14548);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_D27C()
{
  return swift_deallocObject();
}

uint64_t sub_D2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  char v8 = *(unsigned char *)(v2 + 16);
  uint64_t v9 = *(void *)(v2 + 24);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *unsigned int v4 = *(void *)(v6 + 16);
  v4[1] = sub_D37C;
  return sub_AA14(a1, a2, v8, v9);
}

uint64_t sub_D37C()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_D4A8(void *a1)
{
  return sub_B438(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24));
}

void *sub_D4B4(void *a1, void *a2)
{
  uint64_t v2 = a1[3];
  a2[3] = v2;
  uint64_t v3 = a1[5];
  a2[4] = a1[4];
  a2[5] = v3;
  (**(void (***)(void *))(v2 - 8))(a2);
  return a2;
}

uint64_t *sub_D528(uint64_t *result)
{
  uint64_t v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    uint64_t result = v2;
    *uint64_t v3 = v1;
  }
  return result;
}

unint64_t sub_D5B4()
{
  uint64_t v2 = qword_14560;
  if (!qword_14560)
  {
    type metadata accessor for TimeOfDayResolver();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14560);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_D638()
{
  uint64_t v2 = qword_14578;
  if (!qword_14578)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_14578);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_D6B8(uint64_t a1)
{
  uint64_t v3 = sub_E260();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void *sub_D768(uint64_t *a1, void *a2)
{
  sub_7A8C(&qword_14568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = *a1;
    swift_errorRetain();
    *a2 = v4;
  }
  else
  {
    uint64_t v2 = sub_E2F0();
    (*(void (**)(void *, uint64_t *))(*(void *)(v2 - 8) + 16))(a2, a1);
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_D838(uint64_t a1)
{
  sub_7A8C(&qword_14568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_errorRelease();
  }
  else
  {
    uint64_t v1 = sub_E2F0();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  }
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_D8D0()
{
}

uint64_t sub_D8FC(uint64_t a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = a1;
  sub_E570("socialConversationDialogID", 0x1AuLL, 1);
  sub_7A8C(&qword_14580);
  sub_E510();
  sub_723C();
  if (v13)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v10;
      uint64_t v7 = v11;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  else
  {
    sub_7BFC((uint64_t)v12);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_DB80(v8);
    uint64_t v3 = v1;
    swift_bridgeObjectRetain();
    uint64_t v15 = v4;
    uint64_t v16 = v3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_723C();
    return v4;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t *sub_DB1C()
{
  if (qword_14220 != -1) {
    swift_once();
  }
  return &qword_15130;
}

uint64_t sub_DB80(uint64_t a1)
{
  return a1;
}

uint64_t sub_DC04()
{
  sub_7A8C(&qword_14580);
  uint64_t v1 = sub_E4F0();
  sub_E570("socialConversationDialogID", 0x1AuLL, 1);
  swift_bridgeObjectRetain();
  sub_7A8C(&qword_14588);
  sub_E520();
  swift_bridgeObjectRetain();
  sub_8EF0();
  return v1;
}

uint64_t sub_DD2C()
{
  sub_E370();
  sub_E570("SocialConversation", 0x12uLL, 1);
  uint64_t result = sub_E380();
  qword_15130 = result;
  return result;
}

void *sub_DD7C(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[1] = v4;
  return result;
}

uint64_t sub_DDBC()
{
  return swift_bridgeObjectRelease();
}

void *sub_DDD8(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_DE24(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_DE30(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
}

uint64_t sub_DE70(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v4 = *(_OWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < 0x100000000uLL) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_DFD0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_OWORD *)__n128 result = a2 + 0x80000000;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

void *type metadata accessor for SocialSuggestionsExecutionParameter()
{
  return &unk_10A90;
}

void *type metadata accessor for SocialSuggestionsConstants()
{
  return &unk_10AB8;
}

uint64_t sub_E200()
{
  return URLResourceValues.isDirectory.getter();
}

uint64_t sub_E210()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_E220()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t sub_E230()
{
  return URL.init(fileURLWithPath:)();
}

void sub_E240(NSURL *retstr@<X8>)
{
}

uint64_t sub_E250()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_E260()
{
  return type metadata accessor for URL();
}

uint64_t sub_E270()
{
  return Date.init()();
}

uint64_t sub_E280()
{
  return type metadata accessor for Date();
}

uint64_t sub_E290()
{
  return Locale.init(identifier:)();
}

uint64_t sub_E2A0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_E2B0()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E2C0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_E2D0()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_E2E0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_E2F0()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_E300()
{
  return dispatch thunk of CATGlobals.toDictionary.getter();
}

uint64_t sub_E310()
{
  return static CATExecutor.execute(templateDir:catId:parameters:globals:callback:options:)();
}

uint64_t sub_E320()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_E330()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_E340()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_E350()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_E360()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_E370()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_E380()
{
  return DomainOwner.__allocating_init(_:)();
}

uint64_t sub_E390()
{
  return dispatch thunk of Interaction.executionParameters.getter();
}

uint64_t sub_E3A0()
{
  return type metadata accessor for DialogDetails();
}

uint64_t sub_E3B0()
{
  return dispatch thunk of DialogProperties.getParameters()();
}

uint64_t sub_E3C0()
{
  return dispatch thunk of DialogProperties.globals.getter();
}

uint64_t sub_E3D0()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)();
}

uint64_t sub_E3E0()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_E3F0()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t sub_E400()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t sub_E410()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t sub_E420()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t sub_E430()
{
  return dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)();
}

uint64_t sub_E440()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t sub_E450()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:)();
}

uint64_t sub_E460()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
}

uint64_t sub_E470()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
}

uint64_t sub_E480()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_E490()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_E4A0()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_E4B0()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_E4C0()
{
  return type metadata accessor for Signal();
}

uint64_t sub_E4D0()
{
  return type metadata accessor for Objective();
}

uint64_t sub_E4E0()
{
  return Wrappable.getRoot()();
}

uint64_t sub_E4F0()
{
  return Dictionary.init()();
}

uint64_t sub_E500()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_E510()
{
  return Dictionary.subscript.getter();
}

uint64_t sub_E520()
{
  return Dictionary.subscript.setter();
}

Swift::Int sub_E530(Swift::Int seed)
{
  return Hashable._rawHashValue(seed:)(seed);
}

NSString sub_E540()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_E550()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E560()
{
  return String.init(stringInterpolation:)();
}

uint64_t sub_E570(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII)._countAndFlagsBits;
}

uint64_t sub_E580()
{
  return String.isEmpty.getter();
}

uint64_t sub_E590()
{
  return Sequence.forEach(_:)();
}

uint64_t sub_E5A0()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t sub_E5B0()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t sub_E5C0()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t sub_E5D0()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_E5E0()
{
  return type metadata accessor for Array();
}

uint64_t sub_E5F0()
{
  return Set.init(arrayLiteral:)();
}

uint64_t sub_E600()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_E610()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_E620()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_E630()
{
  return Collection.first.getter();
}

uint64_t sub_E640()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_E650()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_E660()
{
  return _expectEnd<A>(of:is:)();
}

uint64_t sub_E670()
{
  return _hashValue<A>(for:)();
}

void sub_E680(Swift::Int a1)
{
}

uint64_t sub_E690()
{
  return ContiguousArray.append(_:)();
}

uint64_t sub_E6A0()
{
  return ContiguousArray.init()();
}

uint64_t sub_E6B0()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t sub_E6C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_E6D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_E6E0()
{
  return _SwiftNewtypeWrapper<>.hashValue.getter();
}

uint64_t sub_E6F0()
{
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)();
}

uint64_t sub_E700()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_E710()
{
  return _SwiftNewtypeWrapper<>.hash(into:)();
}

uint64_t sub_E720()
{
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_E730()
{
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_E740()
{
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E750()
{
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()();
}

Swift::Int sub_E760(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_E770()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

void sub_E780(Swift::String a1)
{
}

uint64_t sub_E790()
{
  return DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_E7A0()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t sub_E7B0()
{
  return specialized _allocateUninitializedArray<A>(_:)();
}

uint64_t sub_E7C0()
{
  return == infix<A>(_:_:)();
}

uint64_t sub_E7D0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_E7E0()
{
  return Error._code.getter();
}

uint64_t sub_E7F0()
{
  return Error._domain.getter();
}

uint64_t sub_E800()
{
  return Error._userInfo.getter();
}

uint64_t sub_E810()
{
  return Hasher.combine<A>(_:)();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}