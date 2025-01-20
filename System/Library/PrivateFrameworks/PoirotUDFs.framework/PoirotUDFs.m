uint64_t type metadata accessor for PPayloadFunction()
{
  uint64_t result;

  result = qword_26A404150;
  if (!qword_26A404150) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A01C1D8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A01C218()
{
  return 1;
}

uint64_t sub_25A01C220(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v30 = a1;
  uint64_t v4 = sub_25A0380B0();
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  MEMORY[0x270FA5388]();
  v29 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25A038360();
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AttributedMessage();
  MEMORY[0x270FA5388]();
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A0387E0();
  uint64_t v28 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v2 + qword_26A404390;
  if (MEMORY[0x25A2F3C50](v2 + qword_26A404390))
  {
    uint64_t v16 = *(void *)(v15 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(ObjectType, v16);
    uint64_t result = swift_unknownObjectRelease();
    if (!v3)
    {
      if (*(void *)(v34 + 16))
      {
        uint64_t v20 = v18;
        uint64_t v21 = v33;
        (*(void (**)(char *, unint64_t, uint64_t))(v33 + 16))(v8, v34 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80)), v6);
        uint64_t v34 = v20;
        sub_25A0382C0();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
        swift_unknownObjectRelease();
        uint64_t v23 = v28;
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v14, &v11[*(int *)(v9 + 20)], v12);
        sub_25A01C79C((uint64_t)v11);
        uint64_t v24 = sub_25A038790();
        unint64_t v26 = v25;
        v27 = v29;
        sub_25A0380A0();
        sub_25A0381E0();
        sub_25A01C7F8(v24, v26);
        (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v32);
        return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000012;
    *(void *)(v22 + 8) = 0x800000025A039040;
    *(unsigned char *)(v22 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25A01C62C(uint64_t a1, uint64_t a2)
{
  *(void *)(swift_allocObject() + qword_26A404390 + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  uint64_t v3 = sub_25A038490();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_25A01C6A8()
{
  uint64_t v0 = sub_25A0384A0();
  sub_25A01C704(v0 + qword_26A404390);
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25A01C6FC()
{
  return type metadata accessor for PPayloadFunction();
}

uint64_t sub_25A01C704(uint64_t a1)
{
  return a1;
}

unint64_t sub_25A01C72C()
{
  unint64_t result = qword_26A404160;
  if (!qword_26A404160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404160);
  }
  return result;
}

uint64_t sub_25A01C780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return sub_25A02F8CC(a1, a2, v3, a3);
}

uint64_t sub_25A01C79C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AttributedMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A01C7F8(uint64_t a1, unint64_t a2)
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

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_25A01C868(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A01C888(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)uint64_t result = (a2 - 1);
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

void type metadata accessor for sqlite3_index_constraint()
{
  if (!qword_26A404168)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A404168);
    }
  }
}

uint64_t type metadata accessor for POneOfFunction()
{
  uint64_t result = qword_26A404170;
  if (!qword_26A404170) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A01C958()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A01C998()
{
  return 2;
}

uint64_t sub_25A01C9A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25A038360();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AttributedMessage();
  uint64_t result = MEMORY[0x270FA5388]();
  v20[0] = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = *(void *)(a2 + 16);
  if (!v13)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v20[1] = a1;
  uint64_t v14 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  if (sub_25A038300()) {
    return sub_25A0381F0();
  }
  uint64_t v15 = v4 + qword_26A404390;
  if (MEMORY[0x25A2F3C50](v15))
  {
    uint64_t v16 = *(void *)(v15 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(ObjectType, v16);
    uint64_t result = swift_unknownObjectRelease();
    if (!v3)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v14, v7);
      sub_25A0382C0();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t result = swift_unknownObjectRelease();
      if (v13 >= 2)
      {
        sub_25A0382D0();
        uint64_t v19 = v20[0];
        sub_25A0387D0();
        sub_25A038270();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return sub_25A01C79C(v19);
      }
      goto LABEL_12;
    }
  }
  else
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v18 = 0xD000000000000012;
    *(void *)(v18 + 8) = 0x800000025A039040;
    *(unsigned char *)(v18 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25A01CD14()
{
  return type metadata accessor for POneOfFunction();
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

uint64_t type metadata accessor for PHasOneOfFunction()
{
  uint64_t result = qword_26A404188;
  if (!qword_26A404188) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A01CDAC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A01CDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = sub_25A038360();
  uint64_t v4 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AttributedMessage();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25A0387E0();
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = *(void *)(a2 + 16);
  if (!v15)
  {
    __break(1u);
    goto LABEL_22;
  }
  v33[2] = a1;
  uint64_t v34 = v12;
  uint64_t v16 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t result = sub_25A038300();
  if ((result & 1) == 0)
  {
    if (v15 >= 2)
    {
      uint64_t v20 = v16 + *(void *)(v4 + 72);
      if ((sub_25A038300() & 1) != 0 || (sub_25A038310() & 1) == 0)
      {
        sub_25A01D458();
        swift_allocError();
        unint64_t v18 = 0xD00000000000002CLL;
        uint64_t v19 = "Oneof name cannot be NULL and must be a TEXT";
        goto LABEL_12;
      }
      uint64_t v21 = v37 + qword_26A404390;
      if (!MEMORY[0x25A2F3C50](v37 + qword_26A404390))
      {
        sub_25A01C72C();
        swift_allocError();
        *(void *)uint64_t v25 = 0xD000000000000012;
        *(void *)(v25 + 8) = 0x800000025A039040;
        *(unsigned char *)(v25 + 16) = 1;
        return swift_willThrow();
      }
      v33[1] = v20;
      uint64_t v22 = *(void *)(v21 + 8);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v24 = v36;
      uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(ObjectType, v22);
      uint64_t result = swift_unknownObjectRelease();
      if (v24) {
        return result;
      }
      if (sub_25A038310())
      {
        swift_unknownObjectRetain();
        sub_25A0382D0();
        swift_getObjectType();
        sub_25A038750();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        if ((sub_25A0382F0() & 1) == 0)
        {
          sub_25A01D458();
          swift_allocError();
          *uint64_t v28 = 0xD000000000000040;
          v28[1] = 0x800000025A039110;
          swift_willThrow();
          return swift_unknownObjectRelease();
        }
        uint64_t v26 = v16;
        uint64_t v27 = v35;
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v26, v35);
        sub_25A0382C0();
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v27);
        uint64_t v29 = v34;
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v14, &v9[*(int *)(v7 + 20)], v10);
        sub_25A01C79C((uint64_t)v9);
        sub_25A038780();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v10);
      }
      swift_getObjectType();
      uint64_t v30 = (void *)sub_25A038830();
      uint64_t v31 = sub_25A0382D0();
      sub_25A01D388(v31, v32, v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_25A0381D0();
      swift_unknownObjectRelease();
      return swift_unknownObjectRelease();
    }
LABEL_22:
    __break(1u);
    return result;
  }
  sub_25A01D458();
  swift_allocError();
  unint64_t v18 = 0xD000000000000016;
  uint64_t v19 = "Message cannot be NULL";
LABEL_12:
  unint64_t *v17 = v18;
  v17[1] = (unint64_t)(v19 - 32) | 0x8000000000000000;
  return swift_willThrow();
}

uint64_t sub_25A01D388(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25A038B10();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_25A038B10() & 1) != 0) {
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

uint64_t sub_25A01D450()
{
  return type metadata accessor for PHasOneOfFunction();
}

unint64_t sub_25A01D458()
{
  unint64_t result = qword_26A404198;
  if (!qword_26A404198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404198);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PHasOneOfFunctionError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PHasOneOfFunctionError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PHasOneOfFunctionError(void *a1, void *a2)
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

void *assignWithTake for PHasOneOfFunctionError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PHasOneOfFunctionError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PHasOneOfFunctionError(uint64_t result, int a2, int a3)
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

uint64_t sub_25A01D5EC()
{
  return 0;
}

ValueMetadata *type metadata accessor for PHasOneOfFunctionError()
{
  return &type metadata for PHasOneOfFunctionError;
}

uint64_t dispatch thunk of StreamTableProviding.estimatedElementCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StreamTableProviding.singleElementCost.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamTableProviding.supportsTimestampConstraints.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of StreamTableProviding.schemaProvider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of StreamTableProviding.makeEnumerator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t static Schematizer.searchValue(in:withFieldNumber:type:convertIfNeeded:setResultToSQLiteContext:withUDFContext:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v45 = a8;
  v46 = (char *)a7;
  v42 = a5;
  uint64_t v43 = a6;
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  v47 = (char *)a1;
  v48 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25A038880();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = sub_25A038620();
  uint64_t v44 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v39 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v39 - v27;
  uint64_t v29 = v51;
  uint64_t result = sub_25A038500();
  if (!v29)
  {
    uint64_t v49 = v11;
    uint64_t v50 = 0;
    v40 = v23;
    v47 = v16;
    v48 = v10;
    uint64_t v31 = v42;
    v51 = (uint64_t *)&v39;
    MEMORY[0x270FA5388](result);
    uint64_t v32 = v45;
    *(&v39 - 2) = v46;
    *(&v39 - 1) = (char *)v32;
    sub_25A01DBEC((uint64_t)v28, (uint64_t)v26);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v26, 1, v17) == 1)
    {
      sub_25A01EA14((uint64_t)v26, &qword_26A4041A8);
    }
    else
    {
      sub_25A01E974((uint64_t)v26, (uint64_t)v19, MEMORY[0x263F5F1F8]);
      if (v31)
      {
        swift_retain();
        v39 = v19;
        sub_25A038610();
        uint64_t v33 = (uint64_t)v48;
        v31(v14);
        uint64_t v34 = (uint64_t)v31;
        sub_25A01E904((uint64_t)v14, MEMORY[0x263F5F218]);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v33, 1, v49) == 1)
        {
          sub_25A01EA14(v33, &qword_26A4041A0);
          uint64_t v35 = (uint64_t)v40;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v40, 1, 1, v17);
          sub_25A01E190(v35, (uint64_t)v46, v45);
          sub_25A01E964(v34);
          sub_25A01EA14(v35, &qword_26A4041A8);
        }
        else
        {
          uint64_t v36 = (uint64_t (*)(void))MEMORY[0x263F5F218];
          uint64_t v37 = (uint64_t)v47;
          uint64_t v38 = sub_25A01E974(v33, (uint64_t)v47, MEMORY[0x263F5F218]);
          MEMORY[0x270FA5388](v38);
          *(&v39 - 2) = (char *)sub_25A01EAD4;
          *(&v39 - 1) = (char *)(&v39 - 4);
          sub_25A038870();
          sub_25A01E964(v34);
          sub_25A01E904(v37, v36);
        }
        sub_25A01E904((uint64_t)v39, MEMORY[0x263F5F1F8]);
        return sub_25A01EA14((uint64_t)v28, &qword_26A4041A8);
      }
      sub_25A01E904((uint64_t)v19, MEMORY[0x263F5F1F8]);
    }
    sub_25A01E190((uint64_t)v28, (uint64_t)v46, v32);
    return sub_25A01EA14((uint64_t)v28, &qword_26A4041A8);
  }
  return result;
}

uint64_t sub_25A01DBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static Schematizer.searchValue(in:withFieldPath:type:convertIfNeeded:setResultToSQLiteContext:withUDFContext:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v45 = a8;
  v46 = (char *)a7;
  v42 = a5;
  uint64_t v43 = a6;
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  v47 = (char *)a1;
  v48 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25A038880();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = sub_25A038620();
  uint64_t v44 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v39 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v39 - v27;
  uint64_t v29 = v51;
  uint64_t result = sub_25A0384F0();
  if (!v29)
  {
    uint64_t v49 = v11;
    uint64_t v50 = 0;
    v40 = v23;
    v47 = v16;
    v48 = v10;
    uint64_t v31 = v42;
    v51 = (uint64_t *)&v39;
    MEMORY[0x270FA5388](result);
    uint64_t v32 = v45;
    *(&v39 - 2) = v46;
    *(&v39 - 1) = (char *)v32;
    sub_25A01DBEC((uint64_t)v28, (uint64_t)v26);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v26, 1, v17) == 1)
    {
      sub_25A01EA14((uint64_t)v26, &qword_26A4041A8);
    }
    else
    {
      sub_25A01E974((uint64_t)v26, (uint64_t)v19, MEMORY[0x263F5F1F8]);
      if (v31)
      {
        swift_retain();
        v39 = v19;
        sub_25A038610();
        uint64_t v33 = (uint64_t)v48;
        v31(v14);
        uint64_t v34 = (uint64_t)v31;
        sub_25A01E904((uint64_t)v14, MEMORY[0x263F5F218]);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v33, 1, v49) == 1)
        {
          sub_25A01EA14(v33, &qword_26A4041A0);
          uint64_t v35 = (uint64_t)v40;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v40, 1, 1, v17);
          sub_25A01E190(v35, (uint64_t)v46, v45);
          sub_25A01E964(v34);
          sub_25A01EA14(v35, &qword_26A4041A8);
        }
        else
        {
          uint64_t v36 = (uint64_t (*)(void))MEMORY[0x263F5F218];
          uint64_t v37 = (uint64_t)v47;
          uint64_t v38 = sub_25A01E974(v33, (uint64_t)v47, MEMORY[0x263F5F218]);
          MEMORY[0x270FA5388](v38);
          *(&v39 - 2) = (char *)sub_25A01E9F8;
          *(&v39 - 1) = (char *)(&v39 - 4);
          sub_25A038870();
          sub_25A01E964(v34);
          sub_25A01E904(v37, v36);
        }
        sub_25A01E904((uint64_t)v39, MEMORY[0x263F5F1F8]);
        return sub_25A01EA14((uint64_t)v28, &qword_26A4041A8);
      }
      sub_25A01E904((uint64_t)v19, MEMORY[0x263F5F1F8]);
    }
    sub_25A01E190((uint64_t)v28, (uint64_t)v46, v32);
    return sub_25A01EA14((uint64_t)v28, &qword_26A4041A8);
  }
  return result;
}

uint64_t sub_25A01E190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v57 = a3;
  v64 = (char *)a1;
  uint64_t v4 = sub_25A0387E0();
  uint64_t v61 = *(void *)(v4 - 8);
  uint64_t v62 = v4;
  MEMORY[0x270FA5388](v4);
  v60 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_25A0385C0();
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  v55 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v54 = (uint64_t)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v53 - v10;
  uint64_t v12 = sub_25A038620();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v63 = (uint64_t)&v53 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041B0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_25A0382A0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = a2;
  sub_25A0382B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1) {
    return sub_25A01EA14((uint64_t)v20, &qword_26A4041B0);
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
  sub_25A01DBEC((uint64_t)v64, (uint64_t)v11);
  uint64_t v26 = v21;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25A01EA14((uint64_t)v11, &qword_26A4041A8);
    sub_25A0381F0();
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  v64 = v24;
  uint64_t v27 = v63;
  sub_25A01E974((uint64_t)v11, v63, MEMORY[0x263F5F1F8]);
  sub_25A01EA70(v27, (uint64_t)v16);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 10)
  {
    uint64_t v59 = v26;
    uint64_t v33 = v60;
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v60, v16, v62);
    uint64_t v34 = (void *)(v57 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
    if (*(void *)(v57 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge))
    {
      uint64_t v35 = (uint64_t)v64;
    }
    else
    {
      uint64_t v46 = v65;
      uint64_t v47 = sub_25A02B7B4();
      uint64_t v35 = (uint64_t)v64;
      if (v46)
      {
        (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v62);
        sub_25A01E904(v27, MEMORY[0x263F5F1F8]);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v35, v59);
      }
      uint64_t v49 = v47;
      uint64_t v50 = v48;
      uint64_t v65 = 0;
      type metadata accessor for MessageInBlobBridge();
      v51 = (void *)swift_allocObject();
      uint64_t v52 = MEMORY[0x263F8EE78];
      v51[2] = MEMORY[0x263F8EE78];
      v51[3] = sub_25A01FDD0(v52);
      v51[4] = v49;
      v51[5] = v50;
      *uint64_t v34 = v51;
      v34[1] = &off_2707ECF28;
      swift_retain();
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRetain();
    uint64_t v36 = (const void *)sub_25A038770();
    uint64_t v38 = v37;
    sub_25A038780();
    swift_getObjectType();
    uint64_t v39 = sub_25A0386C0();
    uint64_t v41 = v40;
    swift_unknownObjectRelease();
    sub_25A035280(v36, v38, v39, v41, v35);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v62);
    sub_25A01E904(v63, MEMORY[0x263F5F1F8]);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v35, v59);
  }
  if (EnumCaseMultiPayload == 7)
  {
    uint64_t v29 = v56;
    uint64_t v30 = v55;
    uint64_t v31 = v58;
    (*(void (**)(void))(v56 + 32))();
    uint64_t v32 = v65;
    sub_25A0385A0();
    if (v32)
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
      sub_25A01E904(v27, MEMORY[0x263F5F1F8]);
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v64, v26);
    }
    else
    {
      uint64_t v45 = (uint64_t)v64;
      sub_25A038270();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
      sub_25A01E904(v27, MEMORY[0x263F5F1F8]);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v45, v26);
    }
  }
  else
  {
    uint64_t v42 = v54;
    sub_25A01EA70(v27, v54);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v42, 0, 1, v12);
    sub_25A0279D8(v42);
    uint64_t v43 = v27;
    sub_25A01EA14(v42, &qword_26A4041A8);
    uint64_t v44 = (uint64_t (*)(void))MEMORY[0x263F5F1F8];
    sub_25A01E904(v43, MEMORY[0x263F5F1F8]);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v64, v26);
    return sub_25A01E904((uint64_t)v16, v44);
  }
}

uint64_t sub_25A01E904(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25A01E964(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25A01E974(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A01E9DC(uint64_t a1)
{
  return sub_25A0277D0(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_25A01E9F8(uint64_t a1)
{
  return sub_25A01E190(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25A01EA14(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25A01EA70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A038620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A01EAD4(uint64_t a1)
{
  return sub_25A01E9F8(a1);
}

uint64_t sub_25A01EAEC(uint64_t a1)
{
  return sub_25A01E9DC(a1);
}

uint64_t BaseStreamSchemaProvider.messageName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BaseStreamSchemaProvider.schemaManifest.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A020B94(v1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, a1, &qword_26A4041B8);
}

uint64_t sub_25A01EB64(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A01EBD0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25A01EC1C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25A01EC70())()
{
  return j__swift_endAccess;
}

uint64_t BaseStreamSchemaProvider.__allocating_init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x263F8EE78];
  swift_weakInit();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  sub_25A020B30(a3, v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_26A4041B8);
  return v6;
}

uint64_t BaseStreamSchemaProvider.init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x263F8EE78];
  swift_weakInit();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_25A020B30(a3, v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_26A4041B8);
  return v3;
}

uint64_t BaseStreamSchemaProvider.configure(withContext:)(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_25A038590();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)(a1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  if (!*(void *)(a1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge))
  {
    uint64_t result = sub_25A02B7B4();
    if (v2) {
      return result;
    }
    uint64_t v19 = result;
    uint64_t v18 = v12;
    type metadata accessor for MessageInBlobBridge();
    uint64_t v13 = (void *)swift_allocObject();
    uint64_t v14 = MEMORY[0x263F8EE78];
    v13[2] = MEMORY[0x263F8EE78];
    unint64_t v15 = sub_25A01FDD0(v14);
    uint64_t v16 = v19;
    v13[3] = v15;
    v13[4] = v16;
    v13[5] = v18;
    *uint64_t v9 = v13;
    v9[1] = &off_2707ECF28;
    swift_retain();
    swift_unknownObjectRelease();
  }
  type metadata accessor for MessageInBlobBridge();
  uint64_t v10 = swift_dynamicCastClass();
  swift_unknownObjectRetain();
  if (!v10) {
    swift_unknownObjectRelease();
  }
  swift_weakAssign();
  swift_release();
  uint64_t result = sub_25A02B7B4();
  if (!v2)
  {
    swift_getObjectType();
    sub_25A038760();
    swift_unknownObjectRelease();
    (*(void (**)(char *))(*(void *)v3 + 168))(v8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

void sub_25A01F014()
{
}

uint64_t sub_25A01F070(unint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = v2 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns;
  uint64_t result = swift_beginAccess();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v7 + 16) > a1)
  {
    uint64_t v9 = *(void *)v7 + 24 * a1;
    uint64_t v10 = *(void *)(v9 + 32);
    uint64_t v11 = *(void *)(v9 + 40);
    v13[0] = v4;
    v13[1] = v5;
    v13[2] = v6;
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, void *))(*(void *)v2 + 184);
    swift_bridgeObjectRetain();
    v12(v10, v11, v13);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_25A01F160()
{
}

uint64_t sub_25A01F1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v62 = a3;
  uint64_t v7 = sub_25A038690();
  uint64_t v58 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25A0388A0();
  uint64_t v59 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v60 = *(void *)a2;
  long long v17 = *(_OWORD *)(a2 + 8);
  uint64_t v19 = (char *)&v55 - v18;
  long long v61 = v17;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v3 + 176))(a1, &v60);
  if (!v4)
  {
    uint64_t v56 = v9;
    uint64_t v57 = 0;
    v55 = v12;
    uint64_t v21 = v59;
    uint64_t v22 = v62;
    sub_25A020B94((uint64_t)v19, (uint64_t)v16, &qword_26A4041A0);
    uint64_t v23 = sub_25A038880();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v16, 1, v23) == 1)
    {
      uint64_t result = sub_25A01EA14((uint64_t)v19, &qword_26A4041A0);
      *(_OWORD *)uint64_t v22 = 0u;
      *(_OWORD *)(v22 + 16) = 0u;
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          int v24 = *(_DWORD *)v16;
          uint64_t v25 = MEMORY[0x263F8E8F8];
          goto LABEL_15;
        case 2u:
          uint64_t v27 = *(void *)v16;
          uint64_t v28 = MEMORY[0x263F8E5C0];
          goto LABEL_10;
        case 3u:
          uint64_t v27 = *(void *)v16;
          uint64_t v28 = MEMORY[0x263F8E970];
LABEL_10:
          *(void *)(v22 + 24) = v28;
          *(void *)uint64_t v22 = v27;
          goto LABEL_22;
        case 4u:
          int v26 = *(_DWORD *)v16;
          *(void *)(v22 + 24) = MEMORY[0x263F8D5C8];
          *(_DWORD *)uint64_t v22 = v26;
          goto LABEL_22;
        case 5u:
          uint64_t v33 = *(void *)v16;
          *(void *)(v22 + 24) = MEMORY[0x263F8D538];
          *(void *)uint64_t v22 = v33;
          goto LABEL_22;
        case 6u:
          char v34 = *v16;
          *(void *)(v22 + 24) = MEMORY[0x263F8D4F8];
          *(unsigned char *)uint64_t v22 = v34;
          goto LABEL_22;
        case 7u:
          uint64_t v29 = v55;
          (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v55, v16, v10);
          uint64_t v30 = v57;
          uint64_t v31 = sub_25A038890();
          if (!v30)
          {
            *(void *)(v22 + 24) = MEMORY[0x263F8D310];
            *(void *)uint64_t v22 = v31;
            *(void *)(v22 + 8) = v32;
          }
          (*(void (**)(char *, uint64_t))(v21 + 8))(v29, v10);
          return sub_25A01EA14((uint64_t)v19, &qword_26A4041A0);
        case 8u:
          uint64_t v45 = *(void *)v16;
          uint64_t v46 = *((void *)v16 + 1);
          *(void *)(v22 + 24) = MEMORY[0x263F8D310];
          *(void *)uint64_t v22 = v45;
          *(void *)(v22 + 8) = v46;
          goto LABEL_22;
        case 9u:
          *(void *)(v22 + 24) = MEMORY[0x263F06F78];
          *(_OWORD *)uint64_t v22 = *(_OWORD *)v16;
          goto LABEL_22;
        case 0xAu:
          uint64_t v35 = v58;
          uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
          uint64_t v37 = v56;
          uint64_t v59 = v7;
          v36(v56, v16, v7);
          if (!swift_weakLoadStrong()) {
            goto LABEL_38;
          }
          unint64_t v38 = sub_25A038640();
          int v40 = v38;
          unsigned __int8 v41 = BYTE6(v39);
          uint64_t v42 = v37;
          uint64_t v43 = v57;
          switch(v39 >> 62)
          {
            case 1uLL:
              uint64_t v50 = v19;
              unint64_t v51 = HIDWORD(v38);
              sub_25A01C7F8(v38, v39);
              LODWORD(v44) = v51 - v40;
              if (__OFSUB__(v51, v40)) {
                goto LABEL_37;
              }
              uint64_t v44 = (int)v44;
              uint64_t v19 = v50;
              break;
            case 2uLL:
              uint64_t v47 = v19;
              uint64_t v49 = *(void *)(v38 + 16);
              uint64_t v48 = *(void *)(v38 + 24);
              sub_25A01C7F8(v38, v39);
              uint64_t v44 = v48 - v49;
              if (__OFSUB__(v48, v49)) {
                goto LABEL_36;
              }
              uint64_t v19 = v47;
              uint64_t v35 = v58;
              break;
            case 3uLL:
              sub_25A01C7F8(v38, v39);
              uint64_t v44 = 0;
              goto LABEL_30;
            default:
              sub_25A01C7F8(v38, v39);
              uint64_t v44 = v41;
              goto LABEL_30;
          }
          uint64_t v42 = v56;
LABEL_30:
          if (__OFADD__(v44, 4))
          {
            __break(1u);
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            sub_25A038A60();
            __break(1u);
            JUMPOUT(0x25A01F7D4);
          }
          uint64_t v60 = sub_25A020570(v44 + 4);
          *(void *)&long long v61 = v52;
          MEMORY[0x270FA5388](v60);
          sub_25A020274((uint64_t (*)(uint64_t, uint64_t))sub_25A020610);
          if (v43)
          {
            sub_25A01C7F8(v60, v61);
            sub_25A01EA14((uint64_t)v19, &qword_26A4041A0);
            swift_release();
          }
          else
          {
            uint64_t v53 = v60;
            uint64_t v54 = v61;
            *(void *)(v22 + 24) = MEMORY[0x263F06F78];
            swift_release();
            *(void *)uint64_t v22 = v53;
            *(void *)(v22 + 8) = v54;
            sub_25A01EA14((uint64_t)v19, &qword_26A4041A0);
          }
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v42, v59);
          break;
        default:
          int v24 = *(_DWORD *)v16;
          uint64_t v25 = MEMORY[0x263F8E548];
LABEL_15:
          *(void *)(v22 + 24) = v25;
          *(_DWORD *)uint64_t v22 = v24;
LABEL_22:
          uint64_t result = sub_25A01EA14((uint64_t)v19, &qword_26A4041A0);
          break;
      }
    }
  }
  return result;
}

uint64_t sub_25A01F810(char *a1)
{
  __src[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_25A0385E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&__src[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = a1;
  if (!a1)
  {
    sub_25A038A60();
    __break(1u);
    JUMPOUT(0x25A01FBB8);
  }
  sub_25A038630();
  uint64_t v7 = sub_25A0385D0();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v10 = sub_25A038640();
  unint64_t v12 = v11 >> 62;
  uint64_t v13 = v10;
  unint64_t v14 = v11;
  size_t v15 = 0;
  switch(v11 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v10), v10))
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
      }
      size_t v15 = HIDWORD(v10) - (int)v10;
LABEL_7:
      int v18 = sub_25A030CA8(v7, v9);
      if (!v1)
      {
        int v19 = v18;
        switch((int)v12)
        {
          case 0:
            __src[0] = v13;
            LOWORD(__src[1]) = v14;
            BYTE2(__src[1]) = BYTE2(v14);
            BYTE3(__src[1]) = BYTE3(v14);
            BYTE4(__src[1]) = BYTE4(v14);
            BYTE5(__src[1]) = BYTE5(v14);
            goto LABEL_15;
          case 1:
            if ((int)v13 > v13 >> 32) {
              goto LABEL_25;
            }
            sub_25A020C10(v13, v14);
            int v24 = (char *)sub_25A037FC0();
            if (!v24) {
              goto LABEL_20;
            }
            uint64_t v25 = sub_25A037FF0();
            if (__OFSUB__((int)v13, v25)) {
              goto LABEL_27;
            }
            v24 += (int)v13 - v25;
LABEL_20:
            uint64_t v23 = v27;
            sub_25A037FE0();
            memcpy(v23, v24, v15);
            sub_25A01C7F8(v13, v14);
LABEL_21:
            *(_DWORD *)&v23[v15] = v19;
            break;
          case 2:
            uint64_t v20 = *(void *)(v13 + 16);
            swift_retain();
            swift_retain();
            uint64_t v21 = (char *)sub_25A037FC0();
            if (!v21) {
              goto LABEL_13;
            }
            uint64_t v22 = sub_25A037FF0();
            if (__OFSUB__(v20, v22)) {
              goto LABEL_26;
            }
            v21 += v20 - v22;
LABEL_13:
            uint64_t v23 = v27;
            sub_25A037FE0();
            memcpy(v23, v21, v15);
            swift_release();
            swift_release();
            goto LABEL_21;
          case 3:
            memset(__src, 0, 14);
LABEL_15:
            uint64_t v23 = v27;
            memcpy(v27, __src, v15);
            goto LABEL_21;
          default:
            JUMPOUT(0);
        }
      }
      swift_bridgeObjectRelease();
      return sub_25A01C7F8(v13, v14);
    case 2uLL:
      uint64_t v17 = *(void *)(v10 + 16);
      uint64_t v16 = *(void *)(v10 + 24);
      size_t v15 = v16 - v17;
      if (!__OFSUB__(v16, v17)) {
        goto LABEL_7;
      }
      goto LABEL_24;
    case 3uLL:
      goto LABEL_7;
    default:
      size_t v15 = BYTE6(v11);
      goto LABEL_7;
  }
}

uint64_t BaseStreamSchemaProvider.deinit()
{
  swift_bridgeObjectRelease();
  sub_25A01EA14(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_26A4041B8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return v0;
}

uint64_t BaseStreamSchemaProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_25A01EA14(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_26A4041B8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25A01FCC4@<X0>(uint64_t a1@<X8>)
{
  return sub_25A020B94(*v1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, a1, &qword_26A4041B8);
}

uint64_t sub_25A01FCF8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25A01FD48()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 168))();
}

uint64_t sub_25A01FD8C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 176))();
}

unint64_t sub_25A01FDD0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404208);
  uint64_t v2 = (void *)sub_25A038A90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25A035044(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_25A01FEE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041E8);
  uint64_t v2 = (void *)sub_25A038A90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25A035044(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v9 = (uint64_t *)(v2[6] + 16 * result);
    *char v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_25A020004(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404200);
  uint64_t v2 = (void *)sub_25A038A90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_25A035044(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v9 = (uint64_t *)(v2[6] + 16 * result);
    *char v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_25A020130(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041F0);
  uint64_t v2 = sub_25A038A90();
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
    sub_25A020B94(v6, (uint64_t)&v15, &qword_26A4041F8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25A035044(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_25A020BF8(&v17, v3[7] + 40 * result);
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

uint64_t sub_25A020274(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v2 = v1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      *(void *)&long long v18 = *v1;
      *((void *)&v18 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_25A0204C0(a1);
      uint64_t v4 = v18;
      unint64_t v5 = *((void *)&v18 + 1) | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      *(void *)&long long v18 = *v1;
      *((void *)&v18 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_25A038010();
      uint64_t v6 = *((void *)&v18 + 1);
      uint64_t v7 = *(void *)(v18 + 16);
      uint64_t v17 = *(void *)(v18 + 24);
      uint64_t v8 = sub_25A037FC0();
      if (!v8)
      {
        __break(1u);
        JUMPOUT(0x25A0204B0);
      }
      uint64_t v9 = v8;
      uint64_t v10 = sub_25A037FF0();
      uint64_t v11 = v7 - v10;
      if (__OFSUB__(v7, v10))
      {
        __break(1u);
LABEL_15:
        __break(1u);
      }
      BOOL v12 = __OFSUB__(v17, v7);
      uint64_t v13 = v17 - v7;
      if (v12) {
        goto LABEL_15;
      }
      uint64_t v14 = sub_25A037FE0();
      if (v14 >= v13) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = v14;
      }
      uint64_t result = a1(v9 + v11, v9 + v11 + v15);
      *uint64_t v1 = v18;
      v1[1] = v6 | 0x8000000000000000;
      return result;
    case 3uLL:
      *(void *)((char *)&v18 + 7) = 0;
      *(void *)&long long v18 = 0;
      return a1((uint64_t)&v18, (uint64_t)&v18);
    default:
      *(void *)&long long v18 = *v1;
      WORD4(v18) = v2;
      BYTE10(v18) = BYTE2(v2);
      BYTE11(v18) = BYTE3(v2);
      BYTE12(v18) = BYTE4(v2);
      BYTE13(v18) = BYTE5(v2);
      BYTE14(v18) = BYTE6(v2);
      uint64_t result = a1((uint64_t)&v18, (uint64_t)&v18 + BYTE6(v2));
      uint64_t v4 = v18;
      unint64_t v5 = DWORD2(v18) | ((unint64_t)BYTE12(v18) << 32) | ((unint64_t)BYTE13(v18) << 40) | ((unint64_t)BYTE14(v18) << 48);
LABEL_4:
      *uint64_t v1 = v4;
      v1[1] = v5;
      return result;
  }
}

uint64_t sub_25A0204C0(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t result = sub_25A038020();
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_25A037FC0();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = sub_25A037FF0();
  uint64_t v7 = v4 - result;
  if (__OFSUB__(v4, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = v5 - v4;
  uint64_t v9 = sub_25A037FE0();
  if (v9 >= v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  return a1(v6 + v7, v6 + v7 + v10);
}

uint64_t sub_25A020570(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_25A038000();
      swift_allocObject();
      sub_25A037FD0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_25A038040();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_25A020610(char *a1)
{
  return sub_25A01F810(a1);
}

uint64_t sub_25A02062C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25A020688()
{
  return type metadata accessor for BaseStreamSchemaProvider();
}

uint64_t type metadata accessor for BaseStreamSchemaProvider()
{
  uint64_t result = qword_26A4041C0;
  if (!qword_26A4041C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25A0206DC()
{
  sub_25A02091C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for BaseStreamSchemaProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BaseStreamSchemaProvider);
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.columns.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.columns.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.columns.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.__allocating_init(messageName:manifest:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.configure(withSchemaStore:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.getValue(forColumnIndex:streamElement:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.getValue(forColumn:streamElement:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.getSQLValue(forColumnIndex:streamElement:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

void sub_25A02091C()
{
  if (!qword_26A4041D0)
  {
    sub_25A038600();
    unint64_t v0 = sub_25A0389C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A4041D0);
    }
  }
}

unint64_t sub_25A020974(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041E0);
    uint64_t v7 = (void *)sub_25A038A90();
    uint64_t v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_25A020B94(v9, (uint64_t)v5, &qword_26A4041D8);
      uint64_t v11 = *v5;
      unint64_t result = sub_25A0350BC(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v7[6] + 8 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
      unint64_t result = sub_25A020B30(v8, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, &qword_26A4041A0);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_25A020B30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A020B94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A020BF8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25A020C10(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for PBGetFunction()
{
  uint64_t result = qword_26A404218;
  if (!qword_26A404218) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A020CB4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A020D04()
{
  return 3;
}

uint64_t sub_25A020D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25A038360();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(a2 + 16);
  if (!v12)
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v58 = a1;
  uint64_t v13 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v13, v7);
  MEMORY[0x270FA5388](v14);
  *(&v46 - 2) = (uint64_t)v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404228);
  sub_25A0382C0();
  if (v3) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  if (v57)
  {
    sub_25A021368();
    swift_allocError();
    *(void *)(v15 + 8) = 0;
    *(void *)(v15 + 16) = 0;
    *(void *)uint64_t v15 = 6;
    *(unsigned char *)(v15 + 24) = 5;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  uint64_t v51 = 0;
  uint64_t v16 = v55;
  uint64_t v17 = v56;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  if (v12 < 2) {
    goto LABEL_47;
  }
  uint64_t v18 = *(void *)(v8 + 72);
  uint64_t v19 = (sqlite3_value *)sub_25A038320();
  uint64_t result = (uint64_t)sqlite3_value_text(v19);
  if (!result)
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v45 = 0xD000000000000024;
    *(void *)(v45 + 8) = 0x800000025A0392C0;
    *(unsigned char *)(v45 + 16) = 0;
    return swift_willThrow();
  }
  uint64_t v20 = result;
  uint64_t v49 = v18;
  uint64_t v50 = v17;
  uint64_t v48 = v16;
  LOBYTE(v16) = *(unsigned char *)result;
  if (!*(unsigned char *)result) {
    goto LABEL_40;
  }
  uint64_t v21 = 0;
  char v22 = 0;
  unint64_t v53 = v12;
  uint64_t v54 = qword_26A404210;
  uint64_t v52 = v4;
  while (1)
  {
    if (v16 < 0x30u)
    {
      if ((v22 & (v21 != 0)) == 0) {
        goto LABEL_40;
      }
      uint64_t v24 = 0;
LABEL_15:
      uint64_t v25 = v13;
      uint64_t v26 = v21;
      uint64_t v27 = v54;
      uint64_t v28 = *(void *)(v4 + v54);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v4 + v27) = v28;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25A031240(0, *(void *)(v28 + 16) + 1, 1, (char *)v28);
        uint64_t v28 = result;
        *(void *)(v4 + v54) = result;
      }
      unint64_t v30 = *(void *)(v28 + 16);
      unint64_t v29 = *(void *)(v28 + 24);
      if (v30 >= v29 >> 1)
      {
        uint64_t result = (uint64_t)sub_25A031240((char *)(v29 > 1), v30 + 1, 1, (char *)v28);
        uint64_t v28 = result;
        *(void *)(v52 + v54) = result;
      }
      *(void *)(v28 + 16) = v30 + 1;
      unint64_t v31 = v28 + 24 * v30;
      uint64_t v21 = v26;
      *(void *)(v31 + 32) = v26;
      *(void *)(v31 + 40) = v24;
      *(unsigned char *)(v31 + 48) = 1;
      uint64_t v4 = v52;
      unint64_t v12 = v53;
      uint64_t v13 = v25;
      if (!(_BYTE)v16) {
        goto LABEL_40;
      }
      char v22 = 0;
      goto LABEL_11;
    }
    if (v16 > 0x39u)
    {
      if (v16 == 105)
      {
        uint64_t v21 = 0;
        char v22 = 1;
        goto LABEL_11;
      }
      if ((v22 & (v21 != 0)) == 0) {
        goto LABEL_40;
      }
      uint64_t v24 = 0;
      LOBYTE(v16) = 1;
      goto LABEL_15;
    }
    uint64_t v24 = 0;
    do
    {
      uint64_t v32 = 10 * v24;
      if ((unsigned __int128)(v24 * (__int128)10) >> 64 != (10 * v24) >> 63)
      {
        __break(1u);
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      uint64_t v24 = v32 + (v16 - 48);
      if (__OFADD__(v32, (v16 - 48))) {
        goto LABEL_45;
      }
      int v33 = *(unsigned __int8 *)++v20;
      LODWORD(v16) = v33;
    }
    while ((v33 - 58) > 0xF5u);
    if (v16 == 105)
    {
      char v22 = 1;
      uint64_t v21 = v24;
      goto LABEL_11;
    }
    if (v22) {
      break;
    }
    if (!v24) {
      goto LABEL_40;
    }
    uint64_t v47 = v21;
    uint64_t v34 = v54;
    uint64_t v35 = *(void *)(v4 + v54);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v4 + v34) = v35;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25A031240(0, *(void *)(v35 + 16) + 1, 1, (char *)v35);
      uint64_t v35 = result;
      *(void *)(v4 + v54) = result;
    }
    unint64_t v37 = *(void *)(v35 + 16);
    unint64_t v36 = *(void *)(v35 + 24);
    if (v37 >= v36 >> 1)
    {
      uint64_t result = (uint64_t)sub_25A031240((char *)(v36 > 1), v37 + 1, 1, (char *)v35);
      uint64_t v35 = result;
      *(void *)(v4 + v54) = result;
    }
    char v22 = 0;
    *(void *)(v35 + 16) = v37 + 1;
    unint64_t v38 = v35 + 24 * v37;
    *(void *)(v38 + 32) = v24;
    *(void *)(v38 + 40) = 0;
    *(unsigned char *)(v38 + 48) = 0;
    unint64_t v12 = v53;
    uint64_t v21 = v47;
    if (!v16) {
      goto LABEL_40;
    }
LABEL_11:
    int v23 = *(unsigned __int8 *)++v20;
    LOBYTE(v16) = v23;
    if (!v23) {
      goto LABEL_40;
    }
  }
  if (v21) {
    goto LABEL_15;
  }
LABEL_40:
  if (v12 < 3)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  unint64_t v39 = (sqlite3_value *)sub_25A038320();
  uint64_t result = (uint64_t)sqlite3_value_text(v39);
  uint64_t v40 = v58;
  uint64_t v41 = v50;
  if (result)
  {
    uint64_t v42 = qword_26A404210;
    uint64_t v43 = *(void *)(v4 + qword_26A404210);
    char v44 = *(unsigned char *)result;
    swift_bridgeObjectRetain();
    sub_25A037BF4(v40, v48, v41, v43, v44);
    swift_bridgeObjectRelease();
    *(void *)(v4 + v42) = MEMORY[0x263F8EE78];
    return swift_bridgeObjectRelease();
  }
LABEL_49:
  __break(1u);
  return result;
}

uint64_t sub_25A021240(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + qword_26A404210) = MEMORY[0x263F8EE78];
  *(void *)(v3 + qword_26A404390 + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  uint64_t v4 = sub_25A038490();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_25A0212D0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A0212E0()
{
  uint64_t v0 = sub_25A0384A0();
  sub_25A01C704(v0 + qword_26A404390);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_25A021344()
{
  return type metadata accessor for PBGetFunction();
}

uint64_t sub_25A02134C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25A02E75C(a1, a2, a3);
}

unint64_t sub_25A021368()
{
  unint64_t result = qword_26A404230;
  if (!qword_26A404230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404230);
  }
  return result;
}

uint64_t type metadata accessor for PGetManyConnection(uint64_t a1)
{
  return sub_25A021E1C(a1, (uint64_t *)&unk_26A404240);
}

uint64_t sub_25A0213DC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A021428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25A023688();
  return MEMORY[0x270F54A08](a1, a2, a3, v6);
}

uint64_t sub_25A02147C()
{
  return sub_25A038BB0();
}

uint64_t sub_25A021578()
{
  sub_25A038940();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A02165C()
{
  return sub_25A038BB0();
}

uint64_t sub_25A021754@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A023FC8();
  *a1 = result;
  return result;
}

void sub_25A021784(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x65756C6176;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE600000000000000;
      uint64_t v3 = 0x7463656A626FLL;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x64616F6C796170;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    case 3:
      *(void *)a1 = 0x614E616D65686373;
      *(void *)(a1 + 8) = 0xEA0000000000656DLL;
      break;
    case 4:
      strcpy((char *)a1, "propertyPath");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

BOOL sub_25A021844()
{
  return *v0 != 0;
}

void sub_25A021854(void *a1@<X8>)
{
  *a1 = &unk_2707EC920;
}

uint64_t sub_25A021864()
{
  uint64_t v1 = MEMORY[0x263F8D310];
  switch(*v0)
  {
    case 1:
    case 2:
      uint64_t v1 = MEMORY[0x263F06F78];
      sub_25A0237E0();
      break;
    case 3:
    case 4:
      return v1;
    default:
      uint64_t v1 = sub_25A0384D0();
      sub_25A023834();
      break;
  }
  return v1;
}

uint64_t sub_25A0218F0(uint64_t a1)
{
  unint64_t v2 = sub_25A023630();
  unint64_t v3 = sub_25A02378C();
  return MEMORY[0x270F54CD8](a1, v2, v3);
}

uint64_t sub_25A021940()
{
  return sub_25A0380F0() & 1;
}

uint64_t sub_25A02195C()
{
  return sub_25A0380D0();
}

uint64_t sub_25A021994()
{
  return sub_25A0219F8();
}

uint64_t sub_25A0219F8()
{
  uint64_t v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042C0);
  unint64_t v3 = (void *)swift_dynamicCastClass();
  if (!v3)
  {
    sub_25A0239E4();
    swift_allocError();
    *uint64_t v10 = xmmword_25A039EB0;
LABEL_7:
    swift_willThrow();
    swift_release();
    goto LABEL_8;
  }
  uint64_t v4 = (char *)v3 + *(void *)(qword_26A404740 + *v3 + 16);
  if (!MEMORY[0x25A2F3C50](v4))
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v11 = 0xD000000000000012;
    *(void *)(v11 + 8) = 0x800000025A039040;
    *(unsigned char *)(v11 + 16) = 1;
    goto LABEL_7;
  }
  uint64_t v5 = *((void *)v4 + 1);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  swift_retain();
  swift_retain();
  uint64_t v8 = v7(ObjectType, v5);
  if (!v1)
  {
    uint64_t v13 = v8;
    uint64_t v14 = v9;
    swift_unknownObjectRelease();
    uint64_t v15 = (uint64_t *)(v0 + qword_26A404238);
    *uint64_t v15 = v13;
    v15[1] = v14;
    swift_release();
    uint64_t v2 = sub_25A038440();
    swift_release();
    return v2;
  }
  swift_release();
  swift_release_n();
  swift_unknownObjectRelease();
LABEL_8:
  swift_deallocPartialClassInstance();
  return v2;
}

uint64_t sub_25A021C50(uint64_t result)
{
  uint64_t v10 = (void *)result;
  uint64_t v1 = *(int *)result;
  if ((v1 & 0x80000000) != 0)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  if (v1)
  {
    uint64_t v2 = 0;
    int v3 = 0;
    uint64_t v11 = *(void *)(result + 8);
    uint64_t v4 = (unsigned __int8 *)(v11 + 5);
    while (v11)
    {
      int v6 = *(v4 - 1);
      int v7 = *v4;
      sub_25A023688();
      sub_25A02388C();
      sub_25A02378C();
      uint64_t result = sub_25A038110();
      if (v12)
      {
        uint64_t result = 19;
        if (v12 == 5 || !v7 || v6 != 2) {
          return result;
        }
        if (__OFADD__(v3++, 1))
        {
          __break(1u);
          goto LABEL_18;
        }
        uint64_t v9 = v10[4];
        if (!v9)
        {
          __break(1u);
          goto LABEL_14;
        }
        uint64_t v5 = v9 + v2;
        *(_DWORD *)uint64_t v5 = v3;
        *(unsigned char *)(v5 + 4) = 1;
      }
      v2 += 8;
      v4 += 12;
      if (!--v1) {
        goto LABEL_15;
      }
    }
    goto LABEL_19;
  }
LABEL_14:
  int v3 = 0;
LABEL_15:
  v10[8] = 0;
  v10[9] = 1;
  return (v3 & 0xFFFFFFFE) != 2;
}

uint64_t sub_25A021D94()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_25A021DA4()
{
  uint64_t v0 = sub_25A038430();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25A021DF4()
{
  return type metadata accessor for PGetManyConnection(0);
}

uint64_t type metadata accessor for PGetManyCursor(uint64_t a1)
{
  return sub_25A021E1C(a1, (uint64_t *)&unk_26A404250);
}

uint64_t sub_25A021E1C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25A021E54()
{
  sub_25A0235BC();
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

uint64_t sub_25A021F0C()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + qword_26A4046C0;
  uint64_t v2 = sub_25A038690();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  int v3 = (void *)(v0 + qword_26A4046C8);
  *int v3 = 0;
  v3[1] = 0;
  *(void *)(v0 + qword_26A4046D8) = MEMORY[0x263F8EE78];
  type metadata accessor for PGetManyConnection(0);
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    *(_OWORD *)(v0 + qword_26A4046D0) = *(_OWORD *)(v4 + qword_26A404238);
    swift_unknownObjectRetain();
    return sub_25A0383F0();
  }
  else
  {
    sub_25A0239E4();
    swift_allocError();
    *int v6 = xmmword_25A039EB0;
    swift_willThrow();
    swift_release();
    sub_25A01EA14(v1, &qword_26A4042A0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_deallocPartialClassInstance();
  }
}

uint64_t sub_25A0220BC(uint64_t a1)
{
  uint64_t v56 = sub_25A038360();
  uint64_t v2 = *(void *)(v56 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v56);
  uint64_t v5 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  int v7 = (char *)v50 - v6;
  uint64_t v8 = type metadata accessor for AttributedMessage();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25A0387E0();
  uint64_t v54 = *(void *)(v11 - 8);
  uint64_t v55 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v50 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042A0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v50 - v20;
  uint64_t v22 = *(void *)(a1 + 16);
  if (v22 == 3)
  {
    uint64_t v52 = v19;
    unint64_t v53 = v5;
    uint64_t v26 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v27 = *(void *)(v2 + 72);
    swift_unknownObjectRetain();
    uint64_t v28 = v57;
    sub_25A0382D0();
    if (v28) {
      return swift_unknownObjectRelease();
    }
    uint64_t v51 = v26;
    uint64_t v57 = v27;
    swift_getObjectType();
    v50[1] = sub_25A038750();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v40 = v2;
    uint64_t v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v42 = v53;
    uint64_t v43 = v56;
    uint64_t v44 = v41(v53, v51, v56);
    MEMORY[0x270FA5388](v44);
    v50[-2] = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A404228);
    sub_25A0382C0();
    if (v58)
    {
      sub_25A021368();
      swift_allocError();
      *(void *)(v45 + 8) = 0;
      *(void *)(v45 + 16) = 0;
      *(void *)uint64_t v45 = 6;
      *(unsigned char *)(v45 + 24) = 5;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v43);
      return swift_unknownObjectRelease();
    }
    swift_getObjectType();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v43);
    sub_25A038800();
    swift_unknownObjectRelease();
    uint64_t v46 = v52;
    sub_25A0387C0();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v55);
    uint64_t v47 = sub_25A038690();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 0, 1, v47);
    uint64_t v48 = v59;
    uint64_t v49 = v59 + qword_26A4046C0;
    swift_beginAccess();
    sub_25A023A38(v46, v49);
    swift_endAccess();
    uint64_t v38 = sub_25A0382D0();
    unint64_t v39 = (uint64_t *)(v48 + qword_26A4046C8);
  }
  else
  {
    if (v22 != 2)
    {
      sub_25A0239E4();
      swift_allocError();
      *unint64_t v30 = 0;
      v30[1] = 0;
      return swift_willThrow();
    }
    int v23 = *(void (**)(char *))(v2 + 16);
    unint64_t v53 = (char *)(a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
    uint64_t v24 = v56;
    v23(v7);
    swift_unknownObjectRetain();
    uint64_t v25 = v57;
    sub_25A0382C0();
    if (v25)
    {
      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v24);
      return swift_unknownObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v24);
    swift_unknownObjectRelease();
    unint64_t v31 = &v10[*(int *)(v8 + 20)];
    uint64_t v33 = v54;
    uint64_t v32 = v55;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v16, v31, v55);
    sub_25A023AA0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AttributedMessage);
    sub_25A0387C0();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v16, v32);
    uint64_t v34 = sub_25A038690();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v21, 0, 1, v34);
    uint64_t v35 = v59;
    uint64_t v36 = v59 + qword_26A4046C0;
    swift_beginAccess();
    sub_25A023A38((uint64_t)v21, v36);
    swift_endAccess();
    uint64_t v38 = sub_25A0382D0();
    unint64_t v39 = (uint64_t *)(v35 + qword_26A4046C8);
  }
  uint64_t *v39 = v38;
  v39[1] = v37;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A022810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042A0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A038690();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042B0);
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25A038180();
  uint64_t v17 = v16(a1, a2, a3);
  uint64_t v18 = v17;
  if (!v4 && !v17)
  {
    sub_25A0220BC(a3);
    uint64_t v19 = v5 + qword_26A4046C0;
    swift_beginAccess();
    sub_25A020B94(v19, (uint64_t)v11, &qword_26A4042A0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      sub_25A01EA14((uint64_t)v11, &qword_26A4042A0);
LABEL_8:
      sub_25A0239E4();
      swift_allocError();
      *uint64_t v20 = 0xD000000000000012;
      v20[1] = 0x800000025A039370;
      swift_willThrow();
      return v18;
    }
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    if (!*(void *)(v5 + qword_26A4046C8 + 8))
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25A038680();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    swift_bridgeObjectRelease();
    *(void *)(v5 + qword_26A4046D8) = v21;
    swift_bridgeObjectRelease();
  }
  return v18;
}

uint64_t sub_25A022B20()
{
  return *(void *)(*(void *)(v0 + qword_26A4046D8) + 16);
}

uint64_t sub_25A022B34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = a2;
  uint64_t v4 = sub_25A0385E0();
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v36 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25A0380B0();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25A038880();
  uint64_t v33 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v34 = (uint64_t)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042A0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25A038690();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v35 = sub_25A038170();
  sub_25A023688();
  sub_25A02388C();
  sub_25A02378C();
  sub_25A038110();
  int v18 = v42;
  uint64_t v19 = v3 + qword_26A4046C0;
  swift_beginAccess();
  sub_25A020B94(v19, (uint64_t)v13, &qword_26A4042A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_25A01EA14((uint64_t)v13, &qword_26A4042A0);
    return 1;
  }
  uint64_t v21 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  switch(v18)
  {
    case 0:
      if ((v35 & 0x8000000000000000) != 0)
      {
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v22 = *(void *)(v3 + qword_26A4046D8);
      if (v35 >= *(void *)(v22 + 16))
      {
LABEL_20:
        __break(1u);
        JUMPOUT(0x25A02318CLL);
      }
      uint64_t v23 = v34;
      uint64_t v24 = sub_25A023918(v22+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v35, v34, MEMORY[0x263F5F218]);
      MEMORY[0x270FA5388](v24);
      uint64_t v25 = v41;
      *(&v33 - 2) = v3;
      *(&v33 - 1) = v25;
      uint64_t v26 = v43;
      sub_25A038870();
      sub_25A023AA0(v23, MEMORY[0x263F5F218]);
      if (v26) {
        return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      }
LABEL_16:
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      return 0;
    case 1:
      MEMORY[0x270FA5388](v21);
      uint64_t v27 = v41;
      *(&v33 - 2) = v3;
      *(&v33 - 1) = v27;
      uint64_t v28 = v43;
      sub_25A038670();
      if (v28) {
        return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      }
      goto LABEL_16;
    case 2:
      uint64_t v29 = sub_25A038640();
      unint64_t v31 = v30;
      sub_25A0380A0();
      sub_25A0381E0();
      sub_25A01C7F8(v29, v31);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v38);
      goto LABEL_16;
    case 3:
      uint64_t v32 = v36;
      sub_25A038630();
      sub_25A0385D0();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v32, v40);
      sub_25A038270();
      goto LABEL_15;
    case 4:
      swift_bridgeObjectRetain();
      sub_25A038270();
LABEL_15:
      swift_bridgeObjectRelease();
      goto LABEL_16;
    default:
      return 1;
  }
}

uint64_t sub_25A0231A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = a3;
  uint64_t v5 = sub_25A038620();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v17 - v13;
  uint64_t v15 = *(void *)(a2 + qword_26A4046D0);
  sub_25A023918(a1, (uint64_t)&v17 - v13, MEMORY[0x263F5F1F8]);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v14, 0, 1, v5);
  sub_25A020B94((uint64_t)v14, (uint64_t)v12, &qword_26A4041A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5) == 1)
  {
    swift_unknownObjectRetain();
    sub_25A01EA14((uint64_t)v12, &qword_26A4041A8);
    sub_25A0381F0();
  }
  else
  {
    sub_25A023980((uint64_t)v12, (uint64_t)v8);
    swift_unknownObjectRetain();
    sub_25A02EDAC(v18, v15);
    sub_25A023AA0((uint64_t)v8, MEMORY[0x263F5F1F8]);
  }
  sub_25A01EA14((uint64_t)v14, &qword_26A4041A8);
  return swift_unknownObjectRelease();
}

uint64_t sub_25A0233E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  uint64_t v4 = (const void *)sub_25A038770();
  uint64_t v6 = v5;
  sub_25A038780();
  swift_getObjectType();
  uint64_t v7 = sub_25A0386C0();
  uint64_t v9 = v8;
  swift_unknownObjectRelease();
  sub_25A035280(v4, v6, v7, v9, a3);
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A0234A0()
{
  sub_25A01EA14(v0 + qword_26A4046C0, &qword_26A4042A0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A02350C()
{
  uint64_t v0 = sub_25A0383E0();
  sub_25A01EA14(v0 + qword_26A4046C0, &qword_26A4042A0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

void sub_25A0235BC()
{
  if (!qword_26A404260)
  {
    sub_25A038690();
    unint64_t v0 = sub_25A0389C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A404260);
    }
  }
}

uint64_t sub_25A023614()
{
  return type metadata accessor for PGetManyCursor(0);
}

ValueMetadata *type metadata accessor for PGetManyConfig()
{
  return &type metadata for PGetManyConfig;
}

unint64_t sub_25A023630()
{
  unint64_t result = qword_26A404268;
  if (!qword_26A404268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404268);
  }
  return result;
}

unint64_t sub_25A023688()
{
  unint64_t result = qword_26A404270;
  if (!qword_26A404270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404270);
  }
  return result;
}

unint64_t sub_25A0236E0()
{
  unint64_t result = qword_26A404278;
  if (!qword_26A404278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404278);
  }
  return result;
}

unint64_t sub_25A023738()
{
  unint64_t result = qword_26A404280;
  if (!qword_26A404280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404280);
  }
  return result;
}

unint64_t sub_25A02378C()
{
  unint64_t result = qword_26A404288;
  if (!qword_26A404288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404288);
  }
  return result;
}

unint64_t sub_25A0237E0()
{
  unint64_t result = qword_26A404290;
  if (!qword_26A404290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404290);
  }
  return result;
}

unint64_t sub_25A023834()
{
  unint64_t result = qword_26A404298;
  if (!qword_26A404298)
  {
    sub_25A0384D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404298);
  }
  return result;
}

unint64_t sub_25A02388C()
{
  unint64_t result = qword_26A4042A8;
  if (!qword_26A4042A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4042A8);
  }
  return result;
}

uint64_t sub_25A0238E0(uint64_t a1)
{
  return sub_25A0233E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25A0238FC(uint64_t a1)
{
  return sub_25A0231A0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25A023918(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A023980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A038620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25A0239E4()
{
  unint64_t result = qword_26A4042B8;
  if (!qword_26A4042B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4042B8);
  }
  return result;
}

uint64_t sub_25A023A38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A023AA0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t destroy for PGetManyError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s10PoirotUDFs13PGetManyErrorOwCP_0(uint64_t a1, uint64_t a2)
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

void *assignWithCopy for PGetManyError(void *a1, void *a2)
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

uint64_t assignWithTake for PGetManyError(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for PGetManyError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PGetManyError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_25A023D20(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25A023D38(void *result, int a2)
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

ValueMetadata *type metadata accessor for PGetManyError()
{
  return &type metadata for PGetManyError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PGetManyColumn(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PGetManyColumn(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A023ED0);
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

uint64_t sub_25A023EF8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25A023F00(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PGetManyColumn()
{
  return &type metadata for PGetManyColumn;
}

unint64_t sub_25A023F24()
{
  unint64_t result = qword_26A4042C8;
  if (!qword_26A4042C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4042D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4042C8);
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

uint64_t sub_25A023FC8()
{
  unint64_t v0 = sub_25A038AA0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t DefaultStreamSchemaProvider.__allocating_init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  BOOL v7 = (void *)(v6 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema);
  *BOOL v7 = 0;
  v7[1] = 0;
  *(void *)(v6 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs) = MEMORY[0x263F8EE88];
  int v8 = (void *)(v6 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
  void *v8 = 0;
  v8[1] = 0;
  sub_25A0241C8(a3, v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest);
  *(void *)(v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x263F8EE78];
  swift_weakInit();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  sub_25A01EA14(a3, &qword_26A4041B8);
  return v6;
}

uint64_t DefaultStreamSchemaProvider.init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema);
  *BOOL v7 = 0;
  v7[1] = 0;
  *(void *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs) = MEMORY[0x263F8EE88];
  int v8 = (void *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
  void *v8 = 0;
  v8[1] = 0;
  sub_25A0241C8(a3, v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest);
  *(void *)(v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x263F8EE78];
  swift_weakInit();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_25A01EA14(a3, &qword_26A4041B8);
  return v3;
}

uint64_t sub_25A0241C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A024230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25A038B90();
    sub_25A038940();
    uint64_t v6 = sub_25A038BB0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25A038B10() & 1) != 0) {
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
          if (v17 || (sub_25A038B10() & 1) != 0) {
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

uint64_t sub_25A024368()
{
  uint64_t v2 = v0;
  uint64_t v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema);
  if (*(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v4 = (char *)sub_25A038820();
    swift_unknownObjectRelease();
    char v26 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042F0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_25A03A200;
    swift_beginAccess();
    uint64_t v6 = aEventtimestamp[1];
    char v7 = byte_26A404450;
    char v8 = byte_26A404451;
    *(void *)(v5 + 32) = aEventtimestamp[0];
    *(void *)(v5 + 40) = v6;
    *(unsigned char *)(v5 + 48) = v7;
    *(unsigned char *)(v5 + 49) = v8;
    uint64_t v25 = v4;
    uint64_t v9 = *v3;
    if (*v3)
    {
      uint64_t v10 = v3[1];
      swift_getObjectType();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_25A038830();
      swift_unknownObjectRetain();
      swift_retain();
      uint64_t v12 = sub_25A0262C8(v11, v9, v10, &v25);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      swift_release();
      uint64_t v13 = v25;
      if (v1)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      uint64_t v15 = *v3;
      if (*v3)
      {
        uint64_t v16 = v3[1];
        swift_retain();
        swift_unknownObjectRetain();
        BOOL v17 = sub_25A0265E0((uint64_t)v13, v15, v16, &v26);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        swift_release();
        if (*(void *)(v12 + 16) || v26 == 1)
        {
          uint64_t v18 = swift_allocObject();
          *(_OWORD *)(v18 + 16) = xmmword_25A03A200;
          swift_beginAccess();
          uint64_t v19 = aEventmessage[1];
          char v20 = byte_26A404468;
          char v21 = byte_26A404469;
          *(void *)(v18 + 32) = aEventmessage[0];
          *(void *)(v18 + 40) = v19;
          *(unsigned char *)(v18 + 48) = v20;
          *(unsigned char *)(v18 + 49) = v21;
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v18 = MEMORY[0x263F8EE78];
          if (!*(void *)(MEMORY[0x263F8EE78] + 16))
          {
            uint64_t v22 = 0;
            uint64_t v23 = 0;
            goto LABEL_10;
          }
        }
        uint64_t v22 = *(void *)(v18 + 32);
        uint64_t v23 = swift_bridgeObjectRetain();
LABEL_10:
        uint64_t v24 = (void *)(v2 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
        *uint64_t v24 = v22;
        v24[1] = v23;
        swift_bridgeObjectRelease();
        sub_25A025D00((uint64_t)v17);
        sub_25A025D00(v12);
        sub_25A025D00(v18);
        return v5;
      }
    }
  }
  uint64_t result = sub_25A038A60();
  __break(1u);
  return result;
}

uint64_t sub_25A0246C0()
{
  uint64_t v2 = v0;
  sub_25A038580();
  swift_getObjectType();
  uint64_t v3 = sub_25A038750();
  if (v1) {
    return swift_unknownObjectRelease();
  }
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  swift_unknownObjectRelease();
  char v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema);
  *char v7 = v5;
  v7[1] = v6;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v8 = sub_25A024368();
  uint64_t v9 = (uint64_t *)(v2 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *uint64_t v9 = v8;
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A0247C8@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = v3;
  uint64_t v9 = sub_25A038570();
  uint64_t v70 = *(void *)(v9 - 8);
  uint64_t v71 = v9;
  MEMORY[0x270FA5388](v9);
  v69 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042D8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v72 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v75 = (char *)&v66 - v14;
  uint64_t v15 = sub_25A038540();
  uint64_t v73 = *(void *)(v15 - 8);
  uint64_t v74 = v15;
  MEMORY[0x270FA5388](v15);
  v68 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_25A038690();
  uint64_t v17 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  v77 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0x8000000000000000) != 0) {
    goto LABEL_32;
  }
  uint64_t v19 = *a2;
  uint64_t v20 = v5 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns;
  swift_beginAccess();
  if (*(void *)(*(void *)v20 + 16) <= a1) {
    goto LABEL_32;
  }
  uint64_t v21 = *(void *)v20 + 24 * a1;
  uint64_t v22 = *(void *)(v21 + 32);
  unint64_t v23 = *(void *)(v21 + 40);
  swift_beginAccess();
  BOOL v24 = v22 == aEventtimestamp[0] && v23 == aEventtimestamp[1];
  if (v24 || (sub_25A038B10() & 1) != 0)
  {
    *a3 = v19;
    uint64_t v25 = sub_25A038880();
    swift_storeEnumTagMultiPayload();
    char v26 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
    uint64_t v27 = a3;
LABEL_9:
    uint64_t v28 = 0;
    uint64_t v29 = v25;
    return v26(v27, v28, 1, v29);
  }
  uint64_t v66 = v17;
  v67 = a3;
  if (!*(void *)(v5 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema)) {
    goto LABEL_32;
  }
  swift_getObjectType();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_25A038810();
  swift_unknownObjectRelease();
  if (!v4)
  {
    uint64_t v31 = *(void *)(v5 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName + 8);
    if (v31
      && (v22 == *(void *)(v5 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName)
       && v31 == v23
       || (sub_25A038B10() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v32 = v67;
      (*(void (**)(uint64_t *, char *, uint64_t))(v66 + 32))(v67, v77, v76);
      uint64_t v25 = sub_25A038880();
      swift_storeEnumTagMultiPayload();
      char v26 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
      uint64_t v27 = v32;
      goto LABEL_9;
    }
    char v33 = sub_25A038990();
    uint64_t v34 = v67;
    if ((v33 & 1) == 0)
    {
      uint64_t v49 = (uint64_t *)(v5 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs);
      swift_beginAccess();
      uint64_t v50 = *v49;
      swift_bridgeObjectRetain();
      char v51 = sub_25A024230(v22, v23, v50);
      swift_bridgeObjectRelease();
      if ((v51 & 1) == 0)
      {
        uint64_t v57 = v77;
        sub_25A038650();
        (*(void (**)(char *, uint64_t))(v66 + 8))(v57, v76);
        return swift_bridgeObjectRelease();
      }
      uint64_t v52 = (uint64_t)v72;
      unint64_t v53 = v77;
      sub_25A038660();
      uint64_t v54 = v66;
      swift_bridgeObjectRelease();
      uint64_t v56 = v73;
      uint64_t v55 = v74;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v52, 1, v74) != 1)
      {
        sub_25A038530();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v76);
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v52, v55);
        uint64_t v29 = sub_25A038880();
        char v26 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
        uint64_t v27 = v34;
        uint64_t v28 = 0;
        return v26(v27, v28, 1, v29);
      }
      (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v76);
      sub_25A01EA14(v52, &qword_26A4042D8);
      uint64_t v29 = sub_25A038880();
      char v26 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
      uint64_t v27 = v34;
LABEL_28:
      uint64_t v28 = 1;
      return v26(v27, v28, 1, v29);
    }
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_25A038950();
    swift_bridgeObjectRelease();
    uint64_t v36 = sub_25A038950();
    BOOL v38 = __OFSUB__(v35, v36);
    uint64_t v39 = v35 - v36;
    if (!v38)
    {
      uint64_t v40 = sub_25A026C4C(v39, v22, v23, v37);
      uint64_t v42 = v41;
      uint64_t v44 = v43;
      uint64_t v46 = v45;
      swift_bridgeObjectRelease();
      MEMORY[0x25A2F3600](v40, v42, v44, v46);
      swift_bridgeObjectRelease();
      uint64_t v47 = (uint64_t)v75;
      uint64_t v48 = v77;
      sub_25A038660();
      swift_bridgeObjectRelease();
      uint64_t v59 = v73;
      uint64_t v58 = v74;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v47, 1, v74) != 1)
      {
        uint64_t v60 = v68;
        (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v68, v47, v58);
        long long v61 = v69;
        sub_25A038520();
        uint64_t v62 = sub_25A038560();
        uint64_t v64 = v63;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v61, v71);
        (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v58);
        (*(void (**)(char *, uint64_t))(v66 + 8))(v48, v76);
        uint64_t v65 = v67;
        uint64_t *v67 = v62;
        v65[1] = v64;
        uint64_t v25 = sub_25A038880();
        swift_storeEnumTagMultiPayload();
        char v26 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
        uint64_t v27 = v65;
        goto LABEL_9;
      }
      (*(void (**)(char *, uint64_t))(v66 + 8))(v48, v76);
      sub_25A01EA14(v47, &qword_26A4042D8);
      uint64_t v29 = sub_25A038880();
      char v26 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
      uint64_t v27 = v67;
      goto LABEL_28;
    }
    __break(1u);
    while (1)
    {
LABEL_32:
      sub_25A038A60();
      __break(1u);
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A0250B0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t DefaultStreamSchemaProvider.deinit()
{
  swift_bridgeObjectRelease();
  sub_25A01EA14(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_26A4041B8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DefaultStreamSchemaProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_25A01EA14(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_26A4041B8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25A025270(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25A038B90();
  swift_bridgeObjectRetain();
  sub_25A038940();
  uint64_t v8 = sub_25A038BB0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25A038B10() & 1) != 0)
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25A038B10() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25A025700(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25A025420()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042F8);
  uint64_t v3 = sub_25A038A10();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
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
      sub_25A038B90();
      sub_25A038940();
      uint64_t result = sub_25A038BB0();
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
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25A025700(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25A025420();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25A02589C();
      goto LABEL_22;
    }
    sub_25A025A50();
  }
  uint64_t v11 = *v4;
  sub_25A038B90();
  sub_25A038940();
  uint64_t result = sub_25A038BB0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25A038B10(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25A038B20();
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
          uint64_t result = sub_25A038B10();
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

void *sub_25A02589C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A038A00();
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

uint64_t sub_25A025A50()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042F8);
  uint64_t v3 = sub_25A038A10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
    sub_25A038B90();
    swift_bridgeObjectRetain();
    sub_25A038940();
    uint64_t result = sub_25A038BB0();
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
    uint64_t v1 = v0;
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

uint64_t sub_25A025D00(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_25A031128((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_25A025DF0(uint64_t a1)
{
  return sub_25A03134C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25A025E04(char **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *((void *)*a1 + 2);
  if (v3)
  {
    uint64_t v4 = a2;
    uint64_t v47 = a2 + 56;
    swift_bridgeObjectRetain();
    unint64_t v5 = 0;
    uint64_t v46 = v4;
    while (1)
    {
      if (!*(void *)(v4 + 16)) {
        goto LABEL_4;
      }
      uint64_t v6 = &v2[16 * v5 + 32];
      uint64_t v8 = *(void *)v6;
      uint64_t v7 = *((void *)v6 + 1);
      sub_25A038B90();
      swift_bridgeObjectRetain();
      sub_25A038940();
      uint64_t v9 = sub_25A038BB0();
      uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v47 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11)) {
        break;
      }
LABEL_3:
      swift_bridgeObjectRelease();
      uint64_t v4 = v46;
LABEL_4:
      if (++v5 == v3)
      {
        swift_bridgeObjectRelease();
        return *((void *)v2 + 2);
      }
    }
    unint64_t v12 = *(void *)(v46 + 48);
    int64_t v13 = (void *)(v12 + 16 * v11);
    BOOL v14 = *v13 == v8 && v13[1] == v7;
    if (!v14 && (sub_25A038B10() & 1) == 0)
    {
      do
      {
        unint64_t v11 = (v11 + 1) & ~v10;
        if (((*(void *)(v47 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
          goto LABEL_3;
        }
        unint64_t v15 = (void *)(v12 + 16 * v11);
        BOOL v16 = *v15 == v8 && v15[1] == v7;
      }
      while (!v16 && (sub_25A038B10() & 1) == 0);
    }
    unint64_t v17 = v2;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v19 = v5 + 1;
    uint64_t v20 = v46;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    while (1)
    {
      while (1)
      {
        unint64_t v23 = *((void *)v17 + 2);
        if (v19 == v23) {
          return v5;
        }
        if (v19 >= v23)
        {
          __break(1u);
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
LABEL_62:
          __break(1u);
          return result;
        }
        unint64_t v24 = v17 + 32;
        char v25 = &v17[16 * v19 + 32];
        if (*(void *)(v20 + 16)) {
          break;
        }
LABEL_45:
        if (v5 != v19)
        {
          if ((v5 & 0x8000000000000000) != 0) {
            goto LABEL_59;
          }
          unint64_t v39 = *((void *)v17 + 2);
          if (v5 >= v39) {
            goto LABEL_60;
          }
          if (v19 >= v39) {
            goto LABEL_61;
          }
          uint64_t v40 = (unint64_t *)&v24[16 * v5];
          unint64_t v11 = *v40;
          unint64_t v12 = v40[1];
          uint64_t v41 = *(void *)v25;
          uint64_t v42 = *((void *)v25 + 1);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v17 = sub_25A025DF0((uint64_t)v17);
          }
          uint64_t v2 = v17 + 32;
          uint64_t v43 = &v17[16 * v5 + 32];
          *(void *)uint64_t v43 = v41;
          *((void *)v43 + 1) = v42;
          uint64_t result = swift_bridgeObjectRelease();
          if (v19 >= *((void *)v17 + 2)) {
            goto LABEL_62;
          }
LABEL_21:
          uint64_t v21 = (unint64_t *)&v2[16 * v19];
          *uint64_t v21 = v11;
          v21[1] = v12;
          uint64_t result = swift_bridgeObjectRelease();
          *a1 = v17;
          uint64_t v20 = v46;
        }
        BOOL v22 = __OFADD__(v5++, 1);
        if (v22) {
          goto LABEL_58;
        }
        BOOL v22 = __OFADD__(v19++, 1);
        if (v22) {
          goto LABEL_57;
        }
      }
      uint64_t v45 = v17;
      uint64_t v27 = *(void *)v25;
      uint64_t v26 = *((void *)v25 + 1);
      sub_25A038B90();
      swift_bridgeObjectRetain();
      sub_25A038940();
      uint64_t v28 = sub_25A038BB0();
      uint64_t v29 = -1 << *(unsigned char *)(v20 + 32);
      unint64_t v30 = v28 & ~v29;
      if (((*(void *)(v47 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0) {
        goto LABEL_44;
      }
      uint64_t v31 = *(void *)(v46 + 48);
      uint64_t v32 = (void *)(v31 + 16 * v30);
      BOOL v33 = *v32 == v27 && v32[1] == v26;
      if (!v33 && (sub_25A038B10() & 1) == 0) {
        break;
      }
LABEL_33:
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v17 = v45;
      uint64_t v20 = v46;
      BOOL v22 = __OFADD__(v19++, 1);
      if (v22) {
        goto LABEL_57;
      }
    }
    unint64_t v34 = v30 + 1;
    uint64_t v35 = ~v29;
    for (unint64_t i = v34 & ~v29; ((*(void *)(v47 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v35)
    {
      unint64_t v37 = (void *)(v31 + 16 * i);
      BOOL v38 = *v37 == v27 && v37[1] == v26;
      if (v38 || (sub_25A038B10() & 1) != 0) {
        goto LABEL_33;
      }
    }
LABEL_44:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v17 = v45;
    uint64_t v20 = v46;
    goto LABEL_45;
  }
  return 0;
}

uint64_t sub_25A0261B0(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_25A03134C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  unint64_t v15 = &v4[16 * a2 + 32];
  if (v6 != a2 || &v4[16 * v6 + 32] >= &v15[16 * v14]) {
    uint64_t result = (uint64_t)memmove(&v4[16 * v6 + 32], v15, 16 * v14);
  }
  uint64_t v16 = *((void *)v4 + 2);
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (!v13)
  {
    *((void *)v4 + 2) = v17;
LABEL_19:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_25A0262C8(uint64_t a1, uint64_t a2, uint64_t a3, char **a4)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    swift_getObjectType();
    uint64_t v8 = a1 + 40;
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v26 = a4;
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_25A038840();
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v9;
      }
      uint64_t v27 = v5;
      uint64_t v31 = v9;
      swift_getObjectType();
      uint64_t v10 = sub_25A038730();
      uint64_t result = sub_25A025E04(a4, v10);
      int64_t v12 = *((void *)*a4 + 2);
      if (v12 < result) {
        break;
      }
      sub_25A0261B0(result, v12);
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_25A0386C0();
      uint64_t v15 = v14;
      swift_beginAccess();
      sub_25A025270(&v30, v13, v15);
      swift_endAccess();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042F0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25A03A210;
      uint64_t v28 = sub_25A0386C0();
      uint64_t v29 = v17;
      swift_bridgeObjectRetain();
      sub_25A038970();
      swift_bridgeObjectRelease();
      *(void *)(inited + 32) = v28;
      *(void *)(inited + 40) = v29;
      *(_WORD *)(inited + 48) = 256;
      *(void *)(inited + 56) = sub_25A0386C0();
      *(void *)(inited + 64) = v18;
      *(_WORD *)(inited + 72) = 266;
      swift_bridgeObjectRelease();
      uint64_t result = swift_unknownObjectRelease();
      uint64_t v9 = v31;
      int64_t v19 = *(void *)(v31 + 16);
      int64_t v20 = v19 + 2;
      if (__OFADD__(v19, 2)) {
        goto LABEL_20;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0 || (int64_t v21 = *(void *)(v9 + 24) >> 1, v21 < v20))
      {
        if (v19 <= v20) {
          int64_t v22 = v19 + 2;
        }
        else {
          int64_t v22 = v19;
        }
        uint64_t result = (uint64_t)sub_25A031128((char *)result, v22, 1, (char *)v9);
        uint64_t v9 = result;
        int64_t v21 = *(void *)(result + 24) >> 1;
      }
      a4 = v26;
      if (v21 - *(void *)(v9 + 16) < 2) {
        goto LABEL_21;
      }
      uint64_t result = swift_arrayInitWithCopy();
      uint64_t v23 = *(void *)(v9 + 16);
      BOOL v24 = __OFADD__(v23, 2);
      uint64_t v25 = v23 + 2;
      if (v24) {
        goto LABEL_22;
      }
      v8 += 16;
      *(void *)(v9 + 16) = v25;
      swift_bridgeObjectRelease();
      --v5;
      if (v27 == 1)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

char *sub_25A0265E0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = v4;
  uint64_t v58 = a4;
  uint64_t v9 = sub_25A038550();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v59 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = *(void *)(a1 + 16);
  if (v14)
  {
    uint64_t v63 = (char *)&v35 - v13;
    swift_bridgeObjectRetain();
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v10 + 16);
    int v54 = *MEMORY[0x263F5F110];
    unint64_t v53 = (uint64_t (**)(char *, uint64_t))(v10 + 88);
    int v51 = *MEMORY[0x263F5F178];
    int v50 = *MEMORY[0x263F5F128];
    int v48 = *MEMORY[0x263F5F158];
    int v47 = *MEMORY[0x263F5F140];
    int v46 = *MEMORY[0x263F5F168];
    int v45 = *MEMORY[0x263F5F180];
    int v44 = *MEMORY[0x263F5F130];
    int v43 = *MEMORY[0x263F5F160];
    int v42 = *MEMORY[0x263F5F148];
    int v41 = *MEMORY[0x263F5F170];
    int v40 = *MEMORY[0x263F5F188];
    int v39 = *MEMORY[0x263F5F138];
    int v38 = *MEMORY[0x263F5F120];
    int v37 = *MEMORY[0x263F5F108];
    int v36 = *MEMORY[0x263F5F150];
    uint64_t v52 = (void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v49 = a1;
    uint64_t v16 = a1 + 40;
    int v35 = *MEMORY[0x263F5F118];
    uint64_t v64 = a2;
    uint64_t v65 = (char *)MEMORY[0x263F8EE78];
    uint64_t v56 = a3;
    uint64_t v57 = v9;
    while (1)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = v5;
      uint64_t v18 = ObjectType;
      sub_25A0387F0();
      uint64_t v66 = v17;
      if (v17)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_47:
        swift_bridgeObjectRelease();
        return v65;
      }
      swift_getObjectType();
      if ((sub_25A038710() & 1) == 0) {
        break;
      }
      swift_unknownObjectRelease();
      *uint64_t v58 = 1;
      swift_bridgeObjectRelease();
      uint64_t v5 = v66;
LABEL_4:
      v16 += 16;
      if (!--v14) {
        goto LABEL_47;
      }
    }
    uint64_t v61 = v14;
    uint64_t v60 = sub_25A0386C0();
    uint64_t v62 = v19;
    int64_t v20 = v63;
    uint64_t v21 = v66;
    sub_25A038720();
    uint64_t v66 = v21;
    if (v21)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_47;
    }
    int64_t v22 = v59;
    uint64_t v23 = v57;
    (*v55)(v59, v20, v57);
    int v24 = (*v53)(v22, v23);
    if (v24 == v54)
    {
      char v25 = 0;
      uint64_t ObjectType = v18;
LABEL_12:
      uint64_t v26 = v52;
      (*v52)(v59, v23);
      uint64_t v27 = v26;
      uint64_t v14 = v61;
LABEL_18:
      (*v27)(v63, v23);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v5 = v66;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v65 = sub_25A031128(0, *((void *)v65 + 2) + 1, 1, v65);
      }
      unint64_t v30 = *((void *)v65 + 2);
      unint64_t v29 = *((void *)v65 + 3);
      if (v30 >= v29 >> 1) {
        uint64_t v65 = sub_25A031128((char *)(v29 > 1), v30 + 1, 1, v65);
      }
      uint64_t v31 = v65;
      *((void *)v65 + 2) = v30 + 1;
      uint64_t v32 = &v31[24 * v30];
      uint64_t v33 = v62;
      *((void *)v32 + 4) = v60;
      *((void *)v32 + 5) = v33;
      v32[48] = v25;
      v32[49] = 0;
      goto LABEL_4;
    }
    uint64_t ObjectType = v18;
    if (v24 == v51)
    {
      char v25 = 10;
      goto LABEL_12;
    }
    if (v24 == v50) {
      goto LABEL_14;
    }
    if (v24 == v48)
    {
LABEL_16:
      char v25 = 4;
      goto LABEL_17;
    }
    if (v24 == v47) {
      goto LABEL_14;
    }
    if (v24 == v46) {
      goto LABEL_16;
    }
    if (v24 == v45)
    {
LABEL_14:
      char v25 = 2;
LABEL_17:
      uint64_t v14 = v61;
      uint64_t v27 = v52;
      goto LABEL_18;
    }
    if (v24 == v44)
    {
LABEL_27:
      char v25 = 3;
      goto LABEL_17;
    }
    if (v24 != v43)
    {
      if (v24 == v42) {
        goto LABEL_27;
      }
      if (v24 != v41)
      {
        if (v24 != v40)
        {
          if (v24 == v39)
          {
            char v25 = 7;
          }
          else if (v24 == v38)
          {
            char v25 = 6;
          }
          else if (v24 == v37)
          {
            char v25 = 9;
          }
          else if (v24 == v36)
          {
            char v25 = 0;
          }
          else
          {
            if (v24 != v35)
            {
              uint64_t result = (char *)sub_25A038A60();
              __break(1u);
              return result;
            }
            char v25 = 1;
            uint64_t v23 = v57;
            uint64_t ObjectType = v18;
          }
          goto LABEL_17;
        }
        goto LABEL_27;
      }
    }
    char v25 = 5;
    goto LABEL_17;
  }
  return (char *)MEMORY[0x263F8EE78];
}

uint64_t sub_25A026C4C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_25A038960();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_25A026CE8()
{
  return type metadata accessor for DefaultStreamSchemaProvider();
}

uint64_t type metadata accessor for DefaultStreamSchemaProvider()
{
  uint64_t result = qword_26A4042E0;
  if (!qword_26A4042E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A026D3C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for DefaultStreamSchemaProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultStreamSchemaProvider);
}

uint64_t static Schematizer.searchValue(in:withFieldNumber:type:convertIfNeeded:setResultToSQLiteContext:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7)
{
  uint64_t v44 = a7;
  int v45 = (char *)a1;
  int v41 = a5;
  uint64_t v42 = a6;
  uint64_t v47 = a3;
  uint64_t v48 = a4;
  int v46 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25A038880();
  uint64_t v40 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_25A038620();
  uint64_t v43 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  int64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  char v25 = (char *)&v37 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v37 - v26;
  uint64_t v28 = v49;
  uint64_t result = sub_25A038500();
  if (!v28)
  {
    uint64_t v47 = v10;
    uint64_t v48 = 0;
    int v39 = v22;
    int v45 = v15;
    int v46 = v9;
    unint64_t v30 = v41;
    uint64_t v49 = &v37;
    MEMORY[0x270FA5388](result);
    *(&v37 - 2) = v44;
    sub_25A01DBEC((uint64_t)v27, (uint64_t)v25);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v25, 1, v16) == 1)
    {
      sub_25A01EA14((uint64_t)v25, &qword_26A4041A8);
    }
    else
    {
      sub_25A01E974((uint64_t)v25, (uint64_t)v18, MEMORY[0x263F5F1F8]);
      if (v30)
      {
        swift_retain();
        int v38 = v18;
        sub_25A038610();
        uint64_t v31 = (uint64_t)v46;
        v30(v13);
        uint64_t v32 = (uint64_t)v30;
        sub_25A01E904((uint64_t)v13, MEMORY[0x263F5F218]);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v31, 1, v47) == 1)
        {
          sub_25A01EA14(v31, &qword_26A4041A0);
          uint64_t v33 = (uint64_t)v39;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56))(v39, 1, 1, v16);
          sub_25A0279D8(v33);
          sub_25A01E964((uint64_t)v30);
          sub_25A01EA14(v33, &qword_26A4041A8);
        }
        else
        {
          unint64_t v34 = (uint64_t (*)(void))MEMORY[0x263F5F218];
          uint64_t v35 = (uint64_t)v45;
          uint64_t v36 = sub_25A01E974(v31, (uint64_t)v45, MEMORY[0x263F5F218]);
          MEMORY[0x270FA5388](v36);
          *(&v37 - 2) = (uint64_t)sub_25A02833C;
          *(&v37 - 1) = (uint64_t)(&v37 - 4);
          sub_25A038870();
          sub_25A01E964(v32);
          sub_25A01E904(v35, v34);
        }
        sub_25A01E904((uint64_t)v38, MEMORY[0x263F5F1F8]);
        return sub_25A01EA14((uint64_t)v27, &qword_26A4041A8);
      }
      sub_25A01E904((uint64_t)v18, MEMORY[0x263F5F1F8]);
    }
    sub_25A0279D8((uint64_t)v27);
    return sub_25A01EA14((uint64_t)v27, &qword_26A4041A8);
  }
  return result;
}

uint64_t static Schematizer.searchValue(in:withFieldPath:type:convertIfNeeded:setResultToSQLiteContext:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7)
{
  uint64_t v44 = a7;
  int v45 = (char *)a1;
  int v41 = a5;
  uint64_t v42 = a6;
  uint64_t v47 = a3;
  uint64_t v48 = a4;
  int v46 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25A038880();
  uint64_t v40 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_25A038620();
  uint64_t v43 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  int64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  char v25 = (char *)&v37 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v37 - v26;
  uint64_t v28 = v49;
  uint64_t result = sub_25A0384F0();
  if (!v28)
  {
    uint64_t v47 = v10;
    uint64_t v48 = 0;
    int v39 = v22;
    int v45 = v15;
    int v46 = v9;
    unint64_t v30 = v41;
    uint64_t v49 = &v37;
    MEMORY[0x270FA5388](result);
    *(&v37 - 2) = v44;
    sub_25A01DBEC((uint64_t)v27, (uint64_t)v25);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v25, 1, v16) == 1)
    {
      sub_25A01EA14((uint64_t)v25, &qword_26A4041A8);
    }
    else
    {
      sub_25A01E974((uint64_t)v25, (uint64_t)v18, MEMORY[0x263F5F1F8]);
      if (v30)
      {
        swift_retain();
        int v38 = v18;
        sub_25A038610();
        uint64_t v31 = (uint64_t)v46;
        v30(v13);
        uint64_t v32 = (uint64_t)v30;
        sub_25A01E904((uint64_t)v13, MEMORY[0x263F5F218]);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v31, 1, v47) == 1)
        {
          sub_25A01EA14(v31, &qword_26A4041A0);
          uint64_t v33 = (uint64_t)v39;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56))(v39, 1, 1, v16);
          sub_25A0279D8(v33);
          sub_25A01E964((uint64_t)v30);
          sub_25A01EA14(v33, &qword_26A4041A8);
        }
        else
        {
          unint64_t v34 = (uint64_t (*)(void))MEMORY[0x263F5F218];
          uint64_t v35 = (uint64_t)v45;
          uint64_t v36 = sub_25A01E974(v31, (uint64_t)v45, MEMORY[0x263F5F218]);
          MEMORY[0x270FA5388](v36);
          *(&v37 - 2) = (uint64_t)sub_25A02822C;
          *(&v37 - 1) = (uint64_t)(&v37 - 4);
          sub_25A038870();
          sub_25A01E964(v32);
          sub_25A01E904(v35, v34);
        }
        sub_25A01E904((uint64_t)v38, MEMORY[0x263F5F1F8]);
        return sub_25A01EA14((uint64_t)v27, &qword_26A4041A8);
      }
      sub_25A01E904((uint64_t)v18, MEMORY[0x263F5F1F8]);
    }
    sub_25A0279D8((uint64_t)v27);
    return sub_25A01EA14((uint64_t)v27, &qword_26A4041A8);
  }
  return result;
}

uint64_t sub_25A0277D0(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A01EA70(a1, (uint64_t)v6);
  uint64_t v7 = sub_25A038620();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  a2(v6);
  return sub_25A01EA14((uint64_t)v6, &qword_26A4041A8);
}

uint64_t sub_25A0278CC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, char *))
{
  uint64_t v7 = sub_25A0380B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return sub_25A0381F0();
  }
  sub_25A0380A0();
  a4(a1, a2 - a1, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_25A0279D8(uint64_t a1)
{
  uint64_t v49 = a1;
  uint64_t v48 = sub_25A0380B0();
  uint64_t v46 = *(void *)(v48 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v40 = (char *)&v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_25A0387E0();
  uint64_t v45 = *(void *)(v43 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v44 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25A0385C0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  uint64_t v42 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_25A038620();
  uint64_t v9 = *(void *)(v47 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (long long *)((char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041B0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25A0382A0();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v21;
  sub_25A0382B0();
  uint64_t v52 = v22;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v17, 1, v18) == 1) {
    return sub_25A01EA14((uint64_t)v17, &qword_26A4041B0);
  }
  uint64_t v24 = v48;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v20, v17, v18);
  sub_25A01DBEC(v49, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v47) == 1)
  {
    sub_25A01EA14((uint64_t)v8, &qword_26A4041A8);
    sub_25A0381F0();
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v20, v18);
  }
  else
  {
    uint64_t v49 = v18;
    uint64_t v25 = (uint64_t)v14;
    sub_25A01E974((uint64_t)v8, (uint64_t)v14, MEMORY[0x263F5F1F8]);
    sub_25A01EA70((uint64_t)v14, (uint64_t)v12);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v27 = v24;
    uint64_t v29 = v45;
    uint64_t v28 = v46;
    switch(EnumCaseMultiPayload)
    {
      case 1:
        uint64_t v30 = v50;
        sub_25A038280();
        goto LABEL_10;
      case 2:
        sub_25A038240();
        goto LABEL_23;
      case 3:
        uint64_t v30 = v50;
        sub_25A038290();
LABEL_10:
        if (!v30) {
          goto LABEL_11;
        }
        goto LABEL_18;
      case 4:
        sub_25A038220();
        goto LABEL_23;
      case 5:
        sub_25A038260();
        goto LABEL_23;
      case 6:
        sub_25A0381D0();
        goto LABEL_23;
      case 7:
        uint64_t v31 = v41;
        uint64_t v32 = v42;
        (*(void (**)(char *, long long *, uint64_t))(v42 + 32))(v6, v12, v41);
        uint64_t v33 = v50;
        sub_25A0385B0();
        if (v33)
        {
          (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v31);
LABEL_18:
          uint64_t v34 = v49;
          sub_25A01E904(v25, MEMORY[0x263F5F1F8]);
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v20, v34);
        }
        else
        {
          sub_25A0381B0();
          (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v31);
LABEL_11:
          sub_25A01E904(v25, MEMORY[0x263F5F1F8]);
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v20, v49);
        }
        break;
      case 8:
      case 9:
        sub_25A020BF8(v12, (uint64_t)v51);
        uint64_t v35 = __swift_project_boxed_opaque_existential_1(v51, v51[3]);
        MEMORY[0x270FA5388](v35);
        *(&v40 - 2) = v20;
        sub_25A0386D0();
        sub_25A01E904((uint64_t)v14, MEMORY[0x263F5F1F8]);
        (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v49);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      case 10:
        uint64_t v36 = v44;
        uint64_t v37 = v12;
        uint64_t v38 = v43;
        (*(void (**)(char *, long long *, uint64_t))(v45 + 32))(v44, v37, v43);
        if (sub_25A038770())
        {
          sub_25A038770();
          int v39 = v40;
          sub_25A0380A0();
          sub_25A038250();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v39, v27);
          (*(void (**)(char *, uint64_t))(v29 + 8))(v44, v38);
        }
        else
        {
          sub_25A0381F0();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v38);
        }
        goto LABEL_23;
      default:
        sub_25A038230();
LABEL_23:
        sub_25A01E904((uint64_t)v14, MEMORY[0x263F5F1F8]);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v20, v49);
        break;
    }
  }
  return result;
}

uint64_t sub_25A02822C(uint64_t a1)
{
  return sub_25A0279D8(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25A02828C(uint64_t a1, uint64_t a2)
{
  return sub_25A0278CC(a1, a2, *(void *)(v2 + 16), MEMORY[0x263F5F060]);
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

uint64_t sub_25A02830C(uint64_t a1, uint64_t a2)
{
  return sub_25A0278CC(a1, a2, *(void *)(v2 + 16), MEMORY[0x263F5F068]);
}

uint64_t sub_25A02833C(uint64_t a1)
{
  return sub_25A02822C(a1);
}

uint64_t type metadata accessor for PStreamConnection()
{
  uint64_t result = qword_26A404310;
  if (!qword_26A404310) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A0283A0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A0283F4()
{
  uint64_t v0 = swift_allocObject() + qword_26A404300;
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(void *)(v0 + 32) = 0;
  swift_weakInit();
  type metadata accessor for PStreamTable();
  if (swift_dynamicCastClass())
  {
    swift_weakAssign();
    return sub_25A038420();
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t sub_25A028510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v1 + qword_26A404300;
  swift_beginAccess();
  sub_25A029680(v4, (uint64_t)&v13);
  if (v14) {
    return sub_25A020BF8(&v13, a1);
  }
  sub_25A029604((uint64_t)&v13);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = Strong + qword_26A404518;
    if (MEMORY[0x25A2F3C50](Strong + qword_26A404518))
    {
      uint64_t v8 = *(void *)(v7 + 8);
      swift_getObjectType();
      uint64_t v9 = sub_25A038140();
      (*(void (**)(long long *__return_ptr, uint64_t))(v8 + 24))(&v13, v9);
      if (!v2)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        sub_25A0296E8((uint64_t)&v13, (uint64_t)v12);
        sub_25A020B30((uint64_t)v12, (uint64_t)v11, &qword_26A404320);
        swift_beginAccess();
        sub_25A02974C((uint64_t)v11, v4);
        swift_endAccess();
        return sub_25A020BF8(&v13, a1);
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25A01C72C();
      swift_allocError();
      *(void *)uint64_t v10 = 0xD000000000000012;
      *(void *)(v10 + 8) = 0x800000025A039040;
      *(unsigned char *)(v10 + 16) = 1;
      swift_willThrow();
    }
    return swift_release();
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t sub_25A028744()
{
  uint64_t result = sub_25A028510((uint64_t)v9);
  if (!v0)
  {
    uint64_t v2 = v10;
    uint64_t v3 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v3 + 32))(v6, v2, v3);
    uint64_t v4 = v7;
    uint64_t v5 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
    sub_25A038400();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  return result;
}

uint64_t sub_25A028818()
{
  sub_25A028510((uint64_t)v11);
  if (v1) {
    return v0;
  }
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v0 = Strong;
    uint64_t v4 = Strong + qword_26A404518;
    if (MEMORY[0x25A2F3C50](Strong + qword_26A404518))
    {
      uint64_t v5 = *(void *)(v4 + 8);
      swift_release();
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);
      uint64_t v10 = v9;
      swift_unknownObjectRelease();
      type metadata accessor for PStreamEnumerator();
      swift_allocObject();
      uint64_t v0 = sub_25A0355A0(v11, v8, v10);
      swift_unknownObjectRelease();
    }
    else
    {
      sub_25A01C72C();
      swift_allocError();
      *(void *)uint64_t v7 = 0xD000000000000012;
      *(void *)(v7 + 8) = 0x800000025A039040;
      *(unsigned char *)(v7 + 16) = 1;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      swift_release();
    }
    return v0;
  }
  uint64_t result = sub_25A038A60();
  __break(1u);
  return result;
}

uint64_t sub_25A0289E4(uint64_t a1)
{
  sub_25A028510((uint64_t)v3);
  sub_25A028A50(a1, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  return 0;
}

uint64_t sub_25A028A50(uint64_t a1, void *a2)
{
  long long v5 = *(_OWORD *)(a1 + 48);
  v33[2] = *(_OWORD *)(a1 + 32);
  void v33[3] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  v33[4] = *(_OWORD *)(a1 + 64);
  long long v34 = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  v33[0] = *(_OWORD *)a1;
  v33[1] = v7;
  uint64_t v8 = sub_25A028F58((unsigned int *)v33, a2);
  if (!v2)
  {
    uint64_t v11 = v9;
    unint64_t v35 = v10;
    uint64_t v13 = a2[3];
    uint64_t v12 = a2[4];
    uint64_t v31 = v8;
    __swift_project_boxed_opaque_existential_1(a2, v13);
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v13, v12);
    if (v15) {
      uint64_t v16 = 100;
    }
    else {
      uint64_t v16 = v14;
    }
    uint64_t v17 = a2[3];
    uint64_t v18 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v17);
    uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    unint64_t v21 = *((void *)&v34 + 1);
    if (v16 >= 0) {
      uint64_t v22 = v16;
    }
    else {
      uint64_t v22 = v16 + 1;
    }
    v32[0] = v16;
    v32[1] = v22 >> 1;
    v32[2] = 1;
    uint64_t v23 = v32[v11 + v31];
    *(void *)(a1 + 72) = v23;
    double v24 = 0.0;
    if (v21 >= 2)
    {
      double v25 = *(double *)&v19;
      if (v20) {
        double v25 = 0.01;
      }
      double v24 = v25 * (double)v23;
    }
    *(double *)(a1 + 64) = v24;
    char v26 = sub_25A028C14(a1, a2);
    uint64_t v27 = sub_25A0357C4((v26 & 1) == 0, v35, v21, 0);
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    sub_25A02938C(v27, v29, a1);
    swift_bridgeObjectRelease();
  }
  return 1;
}

uint64_t sub_25A028C14(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 16);
  if (!v2) {
    return 1;
  }
  if (v2 != 1)
  {
    uint64_t v20 = a2[3];
    uint64_t v21 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v20);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v21 + 24))(v20, v21) & 1) == 0) {
      return 1;
    }
    if ((v2 & 0x80000000) == 0)
    {
      uint64_t v36 = *(void *)(a1 + 24);
      uint64_t v22 = (unsigned __int8 *)(v36 + 4);
      while (v36)
      {
        uint64_t v24 = *((int *)v22 - 1);
        int v25 = *v22;
        uint64_t v26 = *(void *)(sub_25A038410() + 16);
        swift_bridgeObjectRelease();
        if (v26 <= v24) {
          goto LABEL_46;
        }
        uint64_t v27 = sub_25A038410();
        if ((v24 & 0x80000000) != 0)
        {
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        if (*(void *)(v27 + 16) <= v24) {
          goto LABEL_40;
        }
        uint64_t v28 = v27 + 24 * (int)v24;
        uint64_t v30 = *(void *)(v28 + 32);
        uint64_t v29 = *(void *)(v28 + 40);
        int v31 = *(unsigned __int8 *)(v28 + 48);
        int v32 = *(unsigned __int8 *)(v28 + 49);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        int v33 = byte_26A404450;
        int v34 = byte_26A404451;
        BOOL v35 = aEventtimestamp[0] == v30 && aEventtimestamp[1] == v29;
        if (v35 || (sub_25A038B10() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          if (v33 == v31 && v32 == v34) {
            return v25 == 0;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v22 += 8;
        if (!--v2) {
          return 1;
        }
      }
      goto LABEL_44;
    }
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  long long v5 = *(int **)(a1 + 24);
  if (!v5)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v6 = *v5;
  uint64_t v7 = *(void *)(sub_25A038410() + 16);
  swift_bridgeObjectRelease();
  if (v7 <= v6)
  {
LABEL_46:
    uint64_t result = sub_25A038A60();
    __break(1u);
    return result;
  }
  uint64_t v8 = sub_25A038410();
  if ((v6 & 0x80000000) != 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (*(void *)(v8 + 16) <= v6)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v9 = v8 + 24 * (int)v6;
  uint64_t v11 = *(void *)(v9 + 32);
  uint64_t v10 = *(void *)(v9 + 40);
  int v12 = *(unsigned __int8 *)(v9 + 48);
  unsigned __int8 v13 = *(unsigned char *)(v9 + 49);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  int v14 = byte_26A404450;
  char v15 = byte_26A404451;
  BOOL v16 = aEventtimestamp[0] == v11 && aEventtimestamp[1] == v10;
  if (!v16 && (sub_25A038B10() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  swift_bridgeObjectRelease();
  uint64_t result = 1;
  if (v14 == v12 && ((v13 ^ v15) & 1) == 0)
  {
    uint64_t v18 = a2[3];
    uint64_t v19 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v18);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v19 + 24))(v18, v19))
    {
      *(_DWORD *)(a1 + 60) = 1;
      return *((unsigned char *)v5 + 4) == 0;
    }
    else
    {
      *(_DWORD *)(a1 + 60) = *((unsigned char *)v5 + 4) == 0;
      return 1;
    }
  }
  return result;
}

uint64_t sub_25A028F58(unsigned int *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a2[3];
  uint64_t v6 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v5);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6))
  {
    uint64_t v7 = *a1;
    if ((v7 & 0x80000000) != 0) {
      goto LABEL_39;
    }
    if (v7)
    {
      int v34 = a1;
      sub_25A020B30((uint64_t)(a1 + 2), (uint64_t)v41, &qword_26A404328);
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      uint64_t v10 = 12 * v7;
      uint64_t v37 = 12 * v7;
      uint64_t v38 = (char *)MEMORY[0x263F8EE78];
      while (1)
      {
        if (v10 == v9)
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
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
          sub_25A038A60();
          __break(1u);
          JUMPOUT(0x25A0292DCLL);
        }
        sub_25A020B30((uint64_t)v41, (uint64_t)&v42, &qword_26A404328);
        if (!v42) {
          goto LABEL_40;
        }
        uint64_t v12 = *(int *)(v42 + v9);
        int v13 = *(unsigned __int8 *)(v42 + v9 + 4);
        int v14 = *(unsigned __int8 *)(v42 + v9 + 5);
        uint64_t v15 = *(void *)(sub_25A038410() + 16);
        swift_bridgeObjectRelease();
        if (v15 <= v12) {
          goto LABEL_42;
        }
        uint64_t v16 = sub_25A038410();
        if ((v12 & 0x80000000) != 0) {
          goto LABEL_36;
        }
        if (*(void *)(v16 + 16) <= v12) {
          goto LABEL_37;
        }
        int v39 = v13;
        uint64_t v40 = v8;
        uint64_t v17 = v3;
        uint64_t v18 = v16 + 24 * (int)v12;
        uint64_t v19 = *(void *)(v18 + 32);
        uint64_t v20 = *(void *)(v18 + 40);
        int v21 = *(unsigned __int8 *)(v18 + 48);
        char v22 = *(unsigned char *)(v18 + 49);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        int v23 = byte_26A404450;
        char v24 = byte_26A404451;
        BOOL v25 = aEventtimestamp[0] == v19 && aEventtimestamp[1] == v20;
        if (v25 || (sub_25A038B10() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          if (v23 == v21)
          {
            char v26 = v22 ^ v24;
            uint64_t v10 = v37;
            uint64_t v3 = v17;
            if ((v26 & 1) != 0 || !v14)
            {
              uint64_t v11 = v40;
            }
            else
            {
              HIDWORD(v27) = v39;
              LODWORD(v27) = v39 - 4;
              uint64_t v11 = v40;
              switch((v27 >> 2))
              {
                case 0u:
                case 7u:
                  uint64_t v35 = 1;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                    goto LABEL_32;
                  }
                  uint64_t v35 = 1;
                  goto LABEL_27;
                case 1u:
                case 3u:
                  if (swift_isUniquelyReferenced_nonNull_native()) {
                    goto LABEL_27;
                  }
LABEL_32:
                  uint64_t v38 = sub_25A031450(0, *((void *)v38 + 2) + 1, 1, v38);
LABEL_27:
                  unint64_t v29 = *((void *)v38 + 2);
                  unint64_t v28 = *((void *)v38 + 3);
                  if (v29 >= v28 >> 1) {
                    uint64_t v38 = sub_25A031450((char *)(v28 > 1), v29 + 1, 1, v38);
                  }
                  *((void *)v38 + 2) = v29 + 1;
                  v38[v29 + 32] = v39;
                  if (__OFADD__(v36++, 1)) {
                    goto LABEL_38;
                  }
                  uint64_t v31 = *((void *)v34 + 4);
                  if (!v31) {
                    goto LABEL_41;
                  }
                  uint64_t v32 = v31 + v40;
                  *(_DWORD *)uint64_t v32 = v36;
                  *(unsigned char *)(v32 + 4) = 1;
                  break;
                default:
                  goto LABEL_6;
              }
            }
            goto LABEL_6;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v3 = v17;
        uint64_t v11 = v40;
        uint64_t v10 = v37;
LABEL_6:
        v9 += 12;
        uint64_t v8 = v11 + 8;
        if (v10 == v9) {
          return v35;
        }
      }
    }
  }
  return 0;
}

void *sub_25A0292FC(const char *a1, uint64_t a2)
{
  uint64_t result = (void *)strlen(a1);
  int64_t v5 = (int64_t)result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = sqlite3_malloc((int)result + 1);
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  *(void *)(a2 + 48) = result;
  *(_DWORD *)(a2 + 56) = 1;
  return memcpy(result, a1, v5);
}

void *sub_25A02938C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000)) {
    return (void *)sub_25A038A20();
  }
  if ((a2 & 0x2000000000000000) != 0)
  {
    *(void *)__s = a1;
    uint64_t v11 = a2 & 0xFFFFFFFFFFFFFFLL;
    uint64_t result = (void *)strlen(__s);
    uint64_t v9 = (uint64_t)result + 1;
    if (__OFADD__(result, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v9 < (uint64_t)0xFFFFFFFF80000000)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (v9 > 0x7FFFFFFF)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    uint64_t result = sqlite3_malloc((int)result + 1);
    if (!result)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    *(void *)(a3 + 48) = result;
    *(_DWORD *)(a3 + 56) = 1;
    uint64_t v7 = __s;
LABEL_16:
    size_t v8 = v9;
    return memcpy(result, v7, v8);
  }
  if ((a1 & 0x1000000000000000) != 0)
  {
    uint64_t v4 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    goto LABEL_6;
  }
  uint64_t v4 = (const char *)sub_25A038A40();
  if (!v4)
  {
    uint64_t result = (void *)strlen(0);
    uint64_t v9 = (uint64_t)result + 1;
    if (__OFADD__(result, 1))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v9 < (uint64_t)0xFFFFFFFF80000000)
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    if (v9 > 0x7FFFFFFF)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    uint64_t result = sqlite3_malloc((int)result + 1);
    if (!result)
    {
LABEL_37:
      __break(1u);
      return result;
    }
    *(void *)(a3 + 48) = result;
    *(_DWORD *)(a3 + 56) = 1;
    uint64_t v7 = 0;
    goto LABEL_16;
  }
LABEL_6:
  uint64_t result = (void *)strlen(v4);
  uint64_t v6 = (uint64_t)result + 1;
  if (__OFADD__(result, 1))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v6 > 0x7FFFFFFF)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t result = sqlite3_malloc((int)result + 1);
  if (!result)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  *(void *)(a3 + 48) = result;
  *(_DWORD *)(a3 + 56) = 1;
  uint64_t v7 = (char *)v4;
  size_t v8 = v6;
  return memcpy(result, v7, v8);
}

uint64_t sub_25A02955C()
{
  sub_25A029604(v0 + qword_26A404300);
  return swift_weakDestroy();
}

uint64_t sub_25A02959C()
{
  uint64_t v0 = sub_25A038430();
  sub_25A029604(v0 + qword_26A404300);
  swift_weakDestroy();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_25A0295FC()
{
  return type metadata accessor for PStreamConnection();
}

uint64_t sub_25A029604(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A404320);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_25A029664(const char *a1)
{
  return sub_25A0292FC(a1, *(void *)(v1 + 16));
}

uint64_t sub_25A029680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A404320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A0296E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25A02974C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A404320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_25A0297B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404378);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25A03A2D0;
  *(void *)(inited + 32) = 0x6D756E655F70;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = type metadata accessor for PEnumFunction();
  *(void *)(inited + 56) = &off_2707ECC70;
  *(void *)(inited + 64) = 0x6A626F5F70;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = type metadata accessor for PObjFunction();
  *(void *)(inited + 88) = &off_2707ECC70;
  *(void *)(inited + 96) = 0x7465675F70;
  *(void *)(inited + 104) = 0xE500000000000000;
  *(void *)(inited + 112) = type metadata accessor for PGetFunction();
  *(void *)(inited + 120) = &off_2707ECC70;
  *(void *)(inited + 128) = 0x6E616D7465675F70;
  *(void *)(inited + 136) = 0xE900000000000079;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042C0);
  unint64_t v2 = sub_25A02CF1C();
  *(void *)(inited + 144) = v1;
  *(void *)(inited + 152) = v2;
  *(void *)(inited + 160) = 0x666F656E6F5F70;
  *(void *)(inited + 168) = 0xE700000000000000;
  *(void *)(inited + 176) = type metadata accessor for POneOfFunction();
  *(void *)(inited + 184) = &off_2707ECC70;
  *(void *)(inited + 192) = 0x6E6F5F7361685F70;
  *(void *)(inited + 200) = 0xEB00000000666F65;
  *(void *)(inited + 208) = type metadata accessor for PHasOneOfFunction();
  *(void *)(inited + 216) = &off_2707ECC70;
  *(void *)(inited + 224) = 0x6E6F736A5F70;
  *(void *)(inited + 232) = 0xE600000000000000;
  *(void *)(inited + 240) = type metadata accessor for PJSONFunction();
  *(void *)(inited + 248) = &off_2707ECC70;
  *(void *)(inited + 256) = 0x616F6C7961705F70;
  *(void *)(inited + 264) = 0xE900000000000064;
  *(void *)(inited + 272) = type metadata accessor for PPayloadFunction();
  *(void *)(inited + 280) = &off_2707ECC70;
  strcpy((char *)(inited + 288), "p_message_name");
  *(unsigned char *)(inited + 303) = -18;
  *(void *)(inited + 304) = type metadata accessor for PMessageNameFunction();
  *(void *)(inited + 312) = &off_2707ECC70;
  *(void *)(inited + 320) = 0x7465675F6270;
  *(void *)(inited + 328) = 0xE600000000000000;
  *(void *)(inited + 336) = type metadata accessor for PBGetFunction();
  *(void *)(inited + 344) = &off_2707ECC70;
  *(void *)(inited + 352) = 0x65646F6365645F70;
  *(void *)(inited + 360) = 0xEF3436657361625FLL;
  *(void *)(inited + 368) = type metadata accessor for PBase64DecodeFunction();
  *(void *)(inited + 376) = &off_2707ECC70;
  unint64_t result = sub_25A01FEE4(inited);
  qword_26A404718 = result;
  return result;
}

uint64_t sub_25A0299C0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(*a1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database);
  if (v2)
  {
    *a2 = v2;
    return swift_retain();
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t sub_25A029A50()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    return swift_retain();
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t sub_25A029AD8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = a1;
  return swift_release();
}

uint64_t (*sub_25A029AF0(void *a1))(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database;
  a1[1] = v1;
  a1[2] = v3;
  uint64_t v4 = *(void *)(v1 + v3);
  if (v4)
  {
    *a1 = v4;
    swift_retain();
    return sub_25A029BA0;
  }
  else
  {
    uint64_t result = (uint64_t (*)(void *))sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t sub_25A029BA0(void *a1)
{
  *(void *)(a1[1] + a1[2]) = *a1;
  return swift_release();
}

uint64_t sub_25A029BB4()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_25A038160();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule;
  if (*(void *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule))
  {
    uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule);
    goto LABEL_3;
  }
  type metadata accessor for PStreamTable();
  *(void *)(swift_allocObject() + qword_26A404518 + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = &off_2707ECC48;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F5F030], v3);
  uint64_t v9 = sub_25A038460();
  if (*(void *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    uint64_t v8 = v9;
    swift_retain();
    sub_25A038190();
    if (v1)
    {
      swift_release();
      swift_release();
      return v8;
    }
    swift_release();
    *(void *)(v2 + v7) = v8;
    swift_retain();
    swift_release();
LABEL_3:
    swift_retain();
    return v8;
  }
  uint64_t result = sub_25A038A60();
  __break(1u);
  return result;
}

uint64_t sub_25A029DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_25A035044(a1, a2);
    if (v10)
    {
      sub_25A0296E8(*(void *)(v8 + 56) + 40 * v9, (uint64_t)&v12);
    }
    else
    {
      uint64_t v14 = 0;
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v13 + 1)) {
      return sub_25A020BF8(&v12, a3);
    }
  }
  else
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  sub_25A01EA14((uint64_t)&v12, &qword_26A404320);
  *(void *)&long long v12 = 0;
  *((void *)&v12 + 1) = 0xE000000000000000;
  sub_25A038A30();
  swift_bridgeObjectRelease();
  *(void *)&long long v12 = 0x206E776F6E6B6E55;
  *((void *)&v12 + 1) = 0xEF203A656C626174;
  sub_25A038970();
  uint64_t result = sub_25A038A60();
  __break(1u);
  return result;
}

uint64_t sub_25A029F44(uint64_t a1)
{
  type metadata accessor for UDFContext(0);
  uint64_t v2 = swift_allocObject();
  UDFContext.init(databaseConnection:ownsConnection:)(a1, 0);
  return v2;
}

uint64_t UDFContext.__allocating_init(databaseConnection:ownsConnection:)(uint64_t a1, char a2)
{
  uint64_t v4 = swift_allocObject();
  UDFContext.init(databaseConnection:ownsConnection:)(a1, a2);
  return v4;
}

uint64_t type metadata accessor for UDFContext(uint64_t a1)
{
  return sub_25A021E1C(a1, (uint64_t *)&unk_26A404358);
}

uint64_t sub_25A02A018(uint64_t a1)
{
  uint64_t v22 = a1;
  uint64_t v2 = sub_25A038600();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UDFContext.StoreState(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  long long v12 = (char *)&v21 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v21 - v13;
  uint64_t v15 = v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState;
  swift_beginAccess();
  sub_25A02AE74(v15, (uint64_t)v14);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      swift_unknownObjectRelease();
      sub_25A01C72C();
      swift_allocError();
      unint64_t v19 = 0xD00000000000003DLL;
      uint64_t v20 = "Manifest data must be registered before first use of the UDFs";
      goto LABEL_8;
    case 2u:
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v22, v2);
      swift_storeEnumTagMultiPayload();
      swift_beginAccess();
      sub_25A02AED8((uint64_t)v12, v15);
      uint64_t result = swift_endAccess();
      break;
    case 3u:
      sub_25A01C72C();
      swift_allocError();
      unint64_t v19 = 0xD00000000000002FLL;
      uint64_t v20 = "Attempt to register schema with destroyed store";
LABEL_8:
      *(void *)uint64_t v18 = v19;
      *(void *)(v18 + 8) = (unint64_t)(v20 - 32) | 0x8000000000000000;
      *(unsigned char *)(v18 + 16) = 1;
      uint64_t result = swift_willThrow();
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v14, v2);
      uint64_t v16 = v23;
      sub_25A0385F0();
      if (!v16)
      {
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        sub_25A02AED8((uint64_t)v9, v15);
        swift_endAccess();
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
  }
  return result;
}

uint64_t sub_25A02A350(uint64_t result)
{
  if (*(void *)(result + 16))
  {
    uint64_t v2 = result;
    uint64_t result = sub_25A029BB4();
    if (!v1)
    {
      sub_25A02BEE8(v2, (void (*)(uint64_t, uint64_t, unsigned char *))sub_25A02AF3C);
      uint64_t v3 = sub_25A02C314(v2, (void (*)(void, void, _OWORD *))sub_25A02C0B8);
      MEMORY[0x270FA5388](v3);
      sub_25A02C314(v2, (void (*)(void, void, _OWORD *))sub_25A02C538);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_25A02A450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (uint64_t *)(a4 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (!*(void *)(*v7 + 16))
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
LABEL_7:
    sub_25A01EA14((uint64_t)&v12, &qword_26A404320);
    sub_25A0296E8(a3, (uint64_t)&v12);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_25A02A61C((uint64_t)&v12, a1, a2);
    return swift_endAccess();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_25A035044(a1, a2);
  if (v10)
  {
    sub_25A0296E8(*(void *)(v8 + 56) + 40 * v9, (uint64_t)&v12);
  }
  else
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1)) {
    goto LABEL_7;
  }
  sub_25A01EA14((uint64_t)&v12, &qword_26A404320);
  *(void *)&long long v12 = 0;
  *((void *)&v12 + 1) = 0xE000000000000000;
  sub_25A038A30();
  swift_bridgeObjectRelease();
  *(void *)&long long v12 = 0xD000000000000021;
  *((void *)&v12 + 1) = 0x800000025A0396D0;
  sub_25A038970();
  sub_25A038970();
  uint64_t result = sub_25A038A60();
  __break(1u);
  return result;
}

uint64_t sub_25A02A61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_25A020BF8((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25A031CD4(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A01EA14(a1, &qword_26A404320);
    sub_25A02BBF0(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_25A01EA14((uint64_t)v9, &qword_26A404320);
  }
}

uint64_t sub_25A02A6F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A038600();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_25A038920();
  if (!v3)
  {
    uint64_t v13 = a3[3];
    uint64_t v14 = a3[4];
    __swift_project_boxed_opaque_existential_1(a3, v13);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v14 + 32))(v18, v13, v14);
    uint64_t v15 = v19;
    uint64_t v16 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_25A01EA14((uint64_t)v7, &qword_26A4041B8);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      sub_25A02A018((uint64_t)v11);
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
  return result;
}

uint64_t sub_25A02A928(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v16[1] = a1;
  v16[2] = a2;
  uint64_t v7 = sub_25A038590();
  uint64_t v20 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a3[3];
  uint64_t v11 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v10);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v11 + 32))(v17, v10, v11);
  uint64_t v13 = v18;
  uint64_t v12 = v19;
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_25A02B7B4();
  if (v4) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  v16[0] = v7;
  uint64_t v14 = v20;
  swift_getObjectType();
  sub_25A038760();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 24))(v9, v13, v12);
  (*(void (**)(char *, void))(v14 + 8))(v9, v16[0]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  if (*(void *)(a4 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    swift_retain();
    sub_25A032F70();
    return swift_release();
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t sub_25A02AB78(uint64_t a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    swift_retain();
    uint64_t v3 = sub_25A038390();
    swift_release();
    if (v3) {
      BOOL v4 = v3 == a1;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4)
    {
      return sub_25A02B1FC();
    }
    else
    {
      sub_25A01C72C();
      swift_allocError();
      *(void *)uint64_t v5 = 0xD00000000000003ALL;
      *(void *)(v5 + 8) = 0x800000025A0395B0;
      *(unsigned char *)(v5 + 16) = 3;
      return swift_willThrow();
    }
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t UDFContext.init(databaseConnection:ownsConnection:)(uint64_t a1, char a2)
{
  BOOL v4 = (void *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  *BOOL v4 = 0;
  v4[1] = 0;
  uint64_t v5 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)(v2 + v5) = sub_25A020004(MEMORY[0x263F8EE78]);
  uint64_t v7 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders;
  *(void *)(v2 + v7) = sub_25A020130(v6);
  *(void *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule) = 0;
  uint64_t v8 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database;
  *(void *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = 0;
  sub_25A0383D0();
  swift_allocObject();
  uint64_t v9 = sub_25A038380();
  if (v3)
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    type metadata accessor for UDFContext(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v2 + v8) = v9;
    swift_release();
    *(unsigned char *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection) = a2 & 1;
    type metadata accessor for UDFContext.StoreState(0);
    swift_storeEnumTagMultiPayload();
    sub_25A02B670();
  }
  return v2;
}

uint64_t type metadata accessor for UDFContext.StoreState(uint64_t a1)
{
  return sub_25A021E1C(a1, (uint64_t *)&unk_26A404368);
}

uint64_t sub_25A02AE74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UDFContext.StoreState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A02AED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UDFContext.StoreState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A02AF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A02A450(a1, a2, a3, v3);
}

uint64_t UDFContext.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v0 + v2) = sub_25A020004(MEMORY[0x263F8EE78]);
  uint64_t v4 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders;
  *(void *)(v0 + v4) = sub_25A020130(v3);
  *(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection) = 0;
  type metadata accessor for UDFContext.StoreState(0);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t UDFContext.init()()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v0 + v2) = sub_25A020004(MEMORY[0x263F8EE78]);
  uint64_t v4 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders;
  *(void *)(v0 + v4) = sub_25A020130(v3);
  *(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection) = 0;
  type metadata accessor for UDFContext.StoreState(0);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t UDFContext.deinit()
{
  sub_25A02B1FC();
  sub_25A02C554(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t UDFContext.__deallocating_deinit()
{
  sub_25A02B1FC();
  sub_25A02C554(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25A02B1FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UDFContext.StoreState(0);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database;
  if (*(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    swift_retain();
    uint64_t v7 = sub_25A0383A0();
    uint64_t result = swift_release();
    if (v7)
    {
      if (*(void *)(v0 + v6))
      {
        uint64_t v8 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
        uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions);
        swift_bridgeObjectRetain();
        uint64_t v10 = swift_retain();
        sub_25A02CF80(v10, v9);
        swift_bridgeObjectRelease();
        swift_release();
        if (*(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule))
        {
          uint64_t v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders);
          uint64_t v12 = swift_beginAccess();
          uint64_t v13 = *v11;
          MEMORY[0x270FA5388](v12);
          swift_bridgeObjectRetain();
          swift_retain();
          sub_25A02BEE8(v13, (void (*)(uint64_t, uint64_t, unsigned char *))sub_25A02CF78);
          swift_bridgeObjectRelease();
          if (!*(void *)(v0 + v6)) {
            goto LABEL_11;
          }
          swift_retain();
          sub_25A038150();
          swift_release();
          swift_release();
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v14 = v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState;
        swift_beginAccess();
        sub_25A02AED8((uint64_t)v5, v14);
        swift_endAccess();
        *(void *)(v1 + v8) = MEMORY[0x263F8EE80];
        uint64_t result = swift_bridgeObjectRelease();
        if (*(unsigned char *)(v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection)) {
          return result;
        }
        if (*(void *)(v1 + v6))
        {
          swift_retain();
          sub_25A038390();
          return swift_release();
        }
      }
LABEL_11:
      uint64_t result = sub_25A038A60();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25A02B490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = sub_25A0384C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a5 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    strcpy((char *)v12, "DROP TABLE \"");
    HIBYTE(v12[6]) = 0;
    v12[7] = -5120;
    swift_retain();
    sub_25A038970();
    sub_25A038970();
    sub_25A0383C0();
    swift_bridgeObjectRelease();
    sub_25A0384B0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return swift_release();
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

void sub_25A02B670()
{
  uint64_t v1 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  if (!*(void *)(*(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions) + 16))
  {
    if (qword_26A404140 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_26A404718;
    swift_retain();
    uint64_t v3 = sub_25A02C0D4(v2);
    swift_release();
    *(void *)(v0 + v1) = v3;
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
    {
      uint64_t v4 = *(void *)(v0 + v1);
      swift_bridgeObjectRetain();
      uint64_t v5 = swift_retain();
      sub_25A02D160(v5, v4);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      sub_25A038A60();
      __break(1u);
    }
  }
}

uint64_t sub_25A02B7B4()
{
  uint64_t v2 = sub_25A038600();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for UDFContext.StoreState(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)&v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)&v20[-v10];
  uint64_t v12 = v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState;
  swift_beginAccess();
  sub_25A02AE74(v12, (uint64_t)v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v3 = *v11;
      break;
    case 2u:
      sub_25A01C72C();
      swift_allocError();
      unint64_t v17 = 0xD000000000000031;
      uint64_t v18 = "Schema store accessed when is not yet initialized";
      goto LABEL_7;
    case 3u:
      sub_25A01C72C();
      swift_allocError();
      unint64_t v17 = 0xD00000000000002CLL;
      uint64_t v18 = "Schema store accessed when already destroyed";
LABEL_7:
      *(void *)uint64_t v16 = v17;
      *(void *)(v16 + 8) = (unint64_t)(v18 - 32) | 0x8000000000000000;
      *(unsigned char *)(v16 + 16) = 1;
      swift_willThrow();
      break;
    default:
      (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v3 + 32))(v5, v11, v2);
      uint64_t v13 = sub_25A038510();
      uint64_t v15 = v3;
      if (v1)
      {
        (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
      }
      else
      {
        uint64_t v3 = v13;
        *uint64_t v9 = v13;
        v9[1] = v14;
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        swift_unknownObjectRetain();
        sub_25A02AED8((uint64_t)v9, v12);
        swift_endAccess();
        (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v5, v2);
      }
      break;
  }
  return v3;
}

void *sub_25A02BAA0()
{
  uint64_t v2 = (void *)((char *)v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  if (*(void *)((char *)v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge))
  {
    uint64_t v0 = *(void **)((char *)v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  }
  else
  {
    uint64_t v3 = sub_25A02B7B4();
    if (v1) {
      return v0;
    }
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    type metadata accessor for MessageInBlobBridge();
    uint64_t v0 = (void *)swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8EE78];
    v0[2] = MEMORY[0x263F8EE78];
    v0[3] = sub_25A01FDD0(v8);
    v0[4] = v6;
    v0[5] = v7;
    *uint64_t v2 = v0;
    v2[1] = &off_2707ECF28;
    swift_retain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v0;
}

void *sub_25A02BB70()
{
  return sub_25A02BAA0();
}

uint64_t sub_25A02BB88()
{
  return sub_25A02B7B4();
}

uint64_t sub_25A02BBA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25A029DD4(a1, a2, a3);
}

uint64_t sub_25A02BBC8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

double sub_25A02BBF0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_25A035044(a1, a2);
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
      sub_25A03204C();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_25A020BF8((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_25A02BCFC(v8, v11);
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

unint64_t sub_25A02BCFC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_25A0389F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25A038B90();
        swift_bridgeObjectRetain();
        sub_25A038940();
        uint64_t v11 = sub_25A038BB0();
        double result = swift_bridgeObjectRelease();
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
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            _OWORD *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
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

uint64_t sub_25A02BEE8(uint64_t a1, void (*a2)(uint64_t, uint64_t, unsigned char *))
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v15);
    ++v9;
    if (!v16)
    {
      int64_t v9 = v15 + 1;
      if (v15 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v20 + 8 * v9);
      if (!v16)
      {
        int64_t v9 = v15 + 2;
        if (v15 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v20 + 8 * v9);
        if (!v16)
        {
          int64_t v9 = v15 + 3;
          if (v15 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v20 + 8 * v9);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    unint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    sub_25A0296E8(*(void *)(a1 + 56) + 40 * v11, (uint64_t)v19);
    v18[0] = v13;
    v18[1] = v14;
    swift_bridgeObjectRetain();
    a2(v13, v14, v19);
    uint64_t result = sub_25A01EA14((uint64_t)v18, &qword_26A404388);
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v7) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v20 + 8 * v17);
  if (v16)
  {
    int64_t v9 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v9);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25A02C0B8(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_25A02A6F4(a1, a2, a3);
}

uint64_t sub_25A02C0D4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404200);
  uint64_t result = sub_25A038A70();
  int64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v33 = a1;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v29 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v30 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v31 = (void *)result;
  uint64_t v32 = result + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  int64_t v10 = v4;
  for (unint64_t i = v9 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    unint64_t v16 = (uint64_t *)(*(void *)(v33 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = (uint64_t *)(*(void *)(v33 + 56) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = *(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v21 + 24);
    swift_bridgeObjectRetain();
    uint64_t v23 = swift_retain();
    uint64_t result = v22(v23, &off_2707ECC48, v20, v21);
    int64_t v3 = v31;
    *(void *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v24 = (void *)(v31[6] + 16 * i);
    *uint64_t v24 = v17;
    v24[1] = v18;
    BOOL v25 = (uint64_t *)(v31[7] + 16 * i);
    *BOOL v25 = result;
    v25[1] = v21;
    uint64_t v26 = v31[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v31[2] = v28;
    int64_t v4 = v10;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v30) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v12);
    int64_t v14 = v4 + 1;
    if (!v13)
    {
      int64_t v14 = v4 + 2;
      if (v4 + 2 >= v30) {
        return (uint64_t)v3;
      }
      unint64_t v13 = *(void *)(v29 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v4 + 3;
        if (v4 + 3 >= v30) {
          return (uint64_t)v3;
        }
        unint64_t v13 = *(void *)(v29 + 8 * v14);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
    int64_t v10 = v14;
  }
  uint64_t v15 = v4 + 4;
  if (v4 + 4 >= v30) {
    return (uint64_t)v3;
  }
  unint64_t v13 = *(void *)(v29 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v4 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v30) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25A02C314(uint64_t a1, void (*a2)(void, void, _OWORD *))
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
    sub_25A0296E8(*(void *)(a1 + 56) + 40 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    long long v20 = v23;
    v21[0] = v24[0];
    v21[1] = v24[1];
    uint64_t v22 = v25;
    long long v14 = v23;
    swift_bridgeObjectRetain();
    v26(v14, *((void *)&v14 + 1), v21);
    uint64_t result = sub_25A01EA14((uint64_t)&v20, &qword_26A404388);
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

uint64_t sub_25A02C538(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_25A02A928(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_25A02C554(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UDFContext.StoreState(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A02C5B4(void *a1, void *a2)
{
  *(void *)(*a2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t sub_25A02C600()
{
  return type metadata accessor for UDFContext(0);
}

uint64_t sub_25A02C608()
{
  uint64_t result = type metadata accessor for UDFContext.StoreState(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for UDFContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UDFContext);
}

uint64_t dispatch thunk of UDFContext.database.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of UDFContext.database.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of UDFContext.database.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of static UDFContext.makeUDFContext(withSQLiteConnection:)()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of UDFContext.register(schema:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of UDFContext.register(streamTables:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of UDFContext.unregister(withSQLiteConnection:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of UDFContext.__allocating_init(databaseConnection:ownsConnection:)()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t dispatch thunk of UDFContext.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of UDFContext.ensureFunctions()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of UDFContext.getSchemaStore()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t *sub_25A02C91C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      swift_unknownObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_25A038600();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25A02CA40(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    return swift_unknownObjectRelease();
  }
  else if (!result)
  {
    uint64_t v3 = sub_25A038600();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

_OWORD *sub_25A02CAE0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_unknownObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_25A038600();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_25A02CBC0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25A02C554((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_unknownObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_25A038600();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_25A02CCB0(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_25A038600();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_25A02CD64(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25A02C554((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_25A038600();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25A02CE28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25A02CE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25A02CE7C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25A02CE8C()
{
  uint64_t result = sub_25A038600();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_25A02CF1C()
{
  unint64_t result = qword_26A404380;
  if (!qword_26A404380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4042C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404380);
  }
  return result;
}

uint64_t sub_25A02CF78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A02B490(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_25A02CF80(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a2 + 64);
  int64_t v18 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_17;
    }
    if (__OFADD__(v8++, 1))
    {
      __break(1u);
LABEL_26:
      __break(1u);
      return result;
    }
    if (v8 >= v18) {
      goto LABEL_22;
    }
    unint64_t v12 = *(void *)(v17 + 8 * v8);
    if (!v12) {
      break;
    }
LABEL_16:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_17:
    uint64_t v14 = *(void *)(*(void *)(a2 + 56) + 16 * v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    unint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
    swift_unknownObjectRetain();
    v16(a1, ObjectType, v14);
    uint64_t result = swift_unknownObjectRelease();
  }
  int64_t v13 = v8 + 1;
  if (v8 + 1 >= v18) {
    goto LABEL_22;
  }
  unint64_t v12 = *(void *)(v17 + 8 * v13);
  if (v12) {
    goto LABEL_15;
  }
  int64_t v13 = v8 + 2;
  if (v8 + 2 >= v18) {
    goto LABEL_22;
  }
  unint64_t v12 = *(void *)(v17 + 8 * v13);
  if (v12)
  {
LABEL_15:
    int64_t v8 = v13;
    goto LABEL_16;
  }
  int64_t v13 = v8 + 3;
  if (v8 + 3 < v18)
  {
    unint64_t v12 = *(void *)(v17 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_26;
        }
        if (v8 >= v18) {
          goto LABEL_22;
        }
        unint64_t v12 = *(void *)(v17 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_16;
        }
      }
    }
    goto LABEL_15;
  }
LABEL_22:
  return swift_release();
}

uint64_t sub_25A02D160(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 64);
  int64_t v12 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  for (v6 &= v6 - 1; ; uint64_t v6 = (v10 - 1) & v10)
  {
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25A0383B0();
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease_n();
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_unknownObjectRelease_n();
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v8++, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v8 >= v12) {
      return swift_release();
    }
    uint64_t v10 = *(void *)(v3 + 8 * v8);
    if (!v10) {
      break;
    }
LABEL_15:
    ;
  }
  int64_t v11 = v8 + 1;
  if (v8 + 1 >= v12) {
    return swift_release();
  }
  uint64_t v10 = *(void *)(v3 + 8 * v11);
  if (v10) {
    goto LABEL_14;
  }
  int64_t v11 = v8 + 2;
  if (v8 + 2 >= v12) {
    return swift_release();
  }
  uint64_t v10 = *(void *)(v3 + 8 * v11);
  if (v10) {
    goto LABEL_14;
  }
  int64_t v11 = v8 + 3;
  if (v8 + 3 >= v12) {
    return swift_release();
  }
  uint64_t v10 = *(void *)(v3 + 8 * v11);
  if (v10)
  {
LABEL_14:
    int64_t v8 = v11;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v12) {
      return swift_release();
    }
    uint64_t v10 = *(void *)(v3 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_15;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BasePoirotScalarUDF()
{
  uint64_t result = qword_26A404398;
  if (!qword_26A404398) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A02D390()
{
  return swift_initClassMetadata2();
}

void sub_25A02D3DC()
{
}

uint64_t sub_25A02D40C()
{
  return 2049;
}

void sub_25A02D414(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)MEMORY[0x25A2F38F0]();
  uint64_t v6 = v2 + qword_26A404390;
  if (MEMORY[0x25A2F3C50](v2 + qword_26A404390))
  {
    uint64_t v7 = *(void *)(v6 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 32))(v2, a1, a2, ObjectType, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v9 = 0xD000000000000012;
    *(void *)(v9 + 8) = 0x800000025A039040;
    *(unsigned char *)(v9 + 16) = 1;
    swift_willThrow();
  }
}

uint64_t sub_25A02D518(uint64_t a1, uint64_t a2)
{
  *(void *)(swift_allocObject() + qword_26A404390 + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  uint64_t v3 = sub_25A038490();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_25A02D590()
{
  return sub_25A01C704(v0 + qword_26A404390);
}

uint64_t sub_25A02D5A0()
{
  uint64_t v0 = sub_25A0384A0();
  sub_25A01C704(v0 + qword_26A404390);
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25A02D5F0()
{
  return type metadata accessor for BasePoirotScalarUDF();
}

uint64_t sub_25A02D5F8()
{
  return (*(uint64_t (**)(void))(qword_26A404730 + v0 + 32))();
}

uint64_t sub_25A02D614()
{
  return sub_25A038480();
}

uint64_t dispatch thunk of StreamSchemaProviding.schemaManifest.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StreamSchemaProviding.columns.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamSchemaProviding.configure(withSchemaStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of StreamSchemaProviding.getValue(forColumnIndex:streamElement:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_25A02D6A8()
{
  return swift_initClassMetadata2();
}

void sub_25A02D6F8()
{
}

uint64_t sub_25A02D728()
{
  return sub_25A01C704((uint64_t)v0 + *(void *)(qword_26A404740 + *v0 + 16));
}

uint64_t sub_25A02D764()
{
  uint64_t v0 = (void *)sub_25A038470();
  sub_25A01C704((uint64_t)v0 + *(void *)(qword_26A404740 + *v0 + 16));
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for BasePoirotTableUDF()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A02D7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_25A02D9BC(a1, a2);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_25A02D82C()
{
  return sub_25A038150();
}

uint64_t sub_25A02D854(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25A02D890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A038160();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)((char *)v2 + *(void *)(qword_26A404740 + *v2 + 16) + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F5F028], v4);
  return sub_25A038460();
}

uint64_t sub_25A02D9BC(uint64_t a1, uint64_t a2)
{
  return sub_25A02D890(a1, a2);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25A02DA4C(uint64_t a1)
{
  sub_25A02DB28(a1, (uint64_t)&v3);
  if (v4)
  {
    sub_25A020BF8(&v3, (uint64_t)v5);
    unint64_t v1 = __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    MEMORY[0x270FA5388](v1);
    sub_25A0386D0();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    sub_25A02DB90((uint64_t)&v3);
    return sub_25A0381F0();
  }
}

uint64_t sub_25A02DB28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A404428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A02DB90(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A404428);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25A02DBF0(const void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25A0380B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A0381C0();
  if (a1) {
    uint64_t v9 = a2 - (void)a1;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v9 <= 0x7FFFFFFF)
  {
    uint64_t v10 = (sqlite3_context *)v8;
    sub_25A0380A0();
    int64_t v11 = (void (__cdecl *)(void *))sub_25A038080();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sqlite3_result_blob(v10, a1, v9, v11);
    return;
  }
  __break(1u);
}

void sub_25A02DD28(const void *a1, uint64_t a2)
{
}

uint64_t type metadata accessor for PObjFunction()
{
  uint64_t result = qword_26A404430;
  if (!qword_26A404430) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A02DD90()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A02DDD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25A038360();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = MEMORY[0x270FA5388](v7);
  int64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(a2 + 16);
  if (!v12)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v13 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  if (sub_25A038300()) {
    return sub_25A0381F0();
  }
  uint64_t v14 = v4 + qword_26A404390;
  if (MEMORY[0x25A2F3C50](v14))
  {
    uint64_t v15 = *(void *)(v14 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(ObjectType, v15);
    uint64_t result = swift_unknownObjectRelease();
    if (!v3)
    {
      uint64_t v33 = (uint64_t *)v17;
      uint64_t v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v13, v7);
      MEMORY[0x270FA5388](v18);
      v30[-2] = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A404228);
      sub_25A0382C0();
      if (v31)
      {
        sub_25A021368();
        swift_allocError();
        *(void *)(v19 + 8) = 0;
        *(void *)(v19 + 16) = 0;
        *(void *)uint64_t v19 = 6;
        *(unsigned char *)(v19 + 24) = 5;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
        return swift_unknownObjectRelease();
      }
      uint64_t v21 = v30[0];
      uint64_t v22 = v30[1];
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      void v32[3] = MEMORY[0x263F8D3E8];
      v32[4] = MEMORY[0x263F5F220];
      v32[0] = v21;
      v32[1] = v22;
      if (v12 >= 2)
      {
        uint64_t v23 = sub_25A0382D0();
        uint64_t v24 = v33;
        uint64_t v25 = v23;
        uint64_t v27 = v26;
        uint64_t v28 = MEMORY[0x263F8D3E8];
        uint64_t v29 = __swift_project_boxed_opaque_existential_1(v32, MEMORY[0x263F8D3E8]);
        sub_25A02FB20((uint64_t)v29, v25, v27, a1, v24, v28, MEMORY[0x263F5F220]);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      }
      goto LABEL_13;
    }
  }
  else
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v20 = 0xD000000000000012;
    *(void *)(v20 + 8) = 0x800000025A039040;
    *(unsigned char *)(v20 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25A02E128()
{
  return type metadata accessor for PObjFunction();
}

uint64_t sub_25A02E134(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for UDFError(uint64_t a1)
{
  return sub_25A02E15C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25A02E15C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s10PoirotUDFs8UDFErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25A02E134(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UDFError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25A02E134(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25A02E15C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for UDFError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25A02E15C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for UDFError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UDFError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25A02E300(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25A02E308(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UDFError()
{
  return &type metadata for UDFError;
}

uint64_t static Column.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A02E3C0(aEventtimestamp, &aEventtimestamp[1], &byte_26A404450, &byte_26A404451, a1);
}

uint64_t static Column.timestamp.setter(uint64_t *a1)
{
  return sub_25A02E450(a1, aEventtimestamp, &aEventtimestamp[1], &byte_26A404450, &byte_26A404451);
}

uint64_t (*static Column.timestamp.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static Column.message.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A02E3C0(aEventmessage, &aEventmessage[1], &byte_26A404468, &byte_26A404469, a1);
}

uint64_t sub_25A02E3C0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  swift_beginAccess();
  uint64_t v10 = *a2;
  char v11 = *a3;
  char v12 = *a4;
  *(void *)a5 = *a1;
  *(void *)(a5 + 8) = v10;
  *(unsigned char *)(a5 + 16) = v11;
  *(unsigned char *)(a5 + 17) = v12;
  return swift_bridgeObjectRetain();
}

uint64_t static Column.message.setter(uint64_t *a1)
{
  return sub_25A02E450(a1, aEventmessage, &aEventmessage[1], &byte_26A404468, &byte_26A404469);
}

uint64_t sub_25A02E450(uint64_t *a1, void *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  char v11 = *((unsigned char *)a1 + 16);
  char v12 = *((unsigned char *)a1 + 17);
  swift_beginAccess();
  *a2 = v9;
  *a3 = v10;
  *a4 = v11;
  *a5 = v12;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Column.message.modify())()
{
  return j__swift_endAccess;
}

uint64_t getEnumTagSinglePayload for PStreamError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PStreamError(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25A02E620);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PStreamError()
{
  return &type metadata for PStreamError;
}

unint64_t sub_25A02E65C()
{
  unint64_t result = qword_26A404470;
  if (!qword_26A404470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404470);
  }
  return result;
}

uint64_t sub_25A02E6B0()
{
  return sub_25A038BB0();
}

uint64_t sub_25A02E6F4()
{
  return sub_25A038BA0();
}

uint64_t sub_25A02E71C()
{
  return sub_25A038BB0();
}

uint64_t sub_25A02E75C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result)
  {
    *(void *)a3 = result;
    *(void *)(a3 + 8) = result + a2;
  }
  else
  {
    unint64_t result = sub_25A038300();
    if (result)
    {
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(unsigned char *)(a3 + 16) = 1;
      return result;
    }
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
  }
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

double StreamElement.timestamp.getter()
{
  return *(double *)v0;
}

uint64_t StreamElement.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_25A020C10(v1, *(void *)(v0 + 16));
  return v1;
}

uint64_t StreamElement.init(timestamp:data:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(double *)a3 = a4;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

uint64_t destroy for StreamElement(uint64_t a1)
{
  return sub_25A01C7F8(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

void *_s10PoirotUDFs13StreamElementVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  unint64_t v4 = a2[2];
  sub_25A020C10(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

void *assignWithCopy for StreamElement(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  unint64_t v4 = a2[2];
  sub_25A020C10(v3, v4);
  uint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_25A01C7F8(v5, v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for StreamElement(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  uint64_t v3 = a1[1];
  unint64_t v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_25A01C7F8(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for StreamElement(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for StreamElement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StreamElement()
{
  return &type metadata for StreamElement;
}

uint64_t sub_25A02E9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_25A038620();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)v19 - v15;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v21 = 64;
  unint64_t v22 = 0xE100000000000000;
  sub_25A02ED0C();
  if (sub_25A0389D0()) {
    return sub_25A038200();
  }
  uint64_t v20 = a3;
  v19[1] = (char *)v3 + *(int *)(type metadata accessor for AttributedMessage() + 20);
  sub_25A0387A0();
  uint64_t v18 = *v3;
  sub_25A01DBEC((uint64_t)v16, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v14, 1, v7) == 1)
  {
    sub_25A01EA14((uint64_t)v14, &qword_26A4041A8);
    sub_25A0381F0();
  }
  else
  {
    sub_25A023980((uint64_t)v14, (uint64_t)v10);
    sub_25A02EDAC(v20, v18);
    sub_25A02F2A8((uint64_t)v10);
  }
  return sub_25A01EA14((uint64_t)v16, &qword_26A4041A8);
}

unint64_t sub_25A02ED0C()
{
  unint64_t result = qword_26A404478;
  if (!qword_26A404478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404478);
  }
  return result;
}

uint64_t type metadata accessor for AttributedMessage()
{
  uint64_t result = qword_26A404480;
  if (!qword_26A404480) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A02EDAC(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v33 = a1;
  uint64_t v3 = sub_25A0380B0();
  uint64_t v29 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_25A0387E0();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A0385C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A038620();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (long long *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25A01EA70(v2, (uint64_t)v14);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t result = sub_25A038280();
      break;
    case 2u:
      uint64_t result = sub_25A038240();
      break;
    case 3u:
      uint64_t result = sub_25A038290();
      break;
    case 4u:
      uint64_t result = sub_25A038220();
      break;
    case 5u:
      uint64_t result = sub_25A038260();
      break;
    case 6u:
      uint64_t result = sub_25A0381D0();
      break;
    case 7u:
      (*(void (**)(char *, long long *, uint64_t))(v9 + 32))(v11, v14, v8);
      uint64_t v16 = v36;
      sub_25A0385A0();
      if (v16)
      {
        MEMORY[0x25A2F3A70](v16);
        sub_25A0381F0();
      }
      else
      {
        sub_25A038270();
        swift_bridgeObjectRelease();
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      break;
    case 8u:
      sub_25A020BF8(v14, (uint64_t)v35);
      sub_25A0296E8((uint64_t)v35, (uint64_t)v34);
      sub_25A0381A0();
      goto LABEL_14;
    case 9u:
      sub_25A020BF8(v14, (uint64_t)v35);
      sub_25A0296E8((uint64_t)v35, (uint64_t)v34);
      sub_25A02DA4C((uint64_t)v34);
LABEL_14:
      sub_25A01EA14((uint64_t)v34, &qword_26A404428);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
      break;
    case 0xAu:
      uint64_t v17 = v30;
      uint64_t v18 = v32;
      (*(void (**)(char *, long long *, uint64_t))(v30 + 32))(v7, v14, v32);
      if (v31)
      {
        swift_unknownObjectRetain();
        uint64_t v19 = (const void *)sub_25A038770();
        uint64_t v21 = v20;
        sub_25A038780();
        swift_getObjectType();
        uint64_t v22 = sub_25A0386C0();
        uint64_t v24 = v23;
        swift_unknownObjectRelease();
        sub_25A035280(v19, v21, v22, v24, v33);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v25 = sub_25A038790();
        unint64_t v27 = v26;
        sub_25A0380A0();
        sub_25A0381E0();
        sub_25A01C7F8(v25, v27);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v3);
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v7, v18);
      break;
    default:
      uint64_t result = sub_25A038230();
      break;
  }
  return result;
}

uint64_t sub_25A02F2A8(uint64_t a1)
{
  uint64_t v2 = sub_25A038620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_25A02F304(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    uint64_t v3 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = v5;
    a1[1] = v6;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25A0387E0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_unknownObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_25A02F3F0(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25A0387E0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

_OWORD *sub_25A02F468(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25A0387E0();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_unknownObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_25A02F508(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25A0387E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

_OWORD *sub_25A02F5A8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25A0387E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_25A02F624(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25A0387E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25A02F6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A02F6C8);
}

uint64_t sub_25A02F6C8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25A0387E0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25A02F778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A02F78C);
}

void *sub_25A02F78C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25A0387E0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A02F834()
{
  uint64_t result = sub_25A0387E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25A02F8CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v9 = sub_25A0387E0();
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (__OFSUB__(a2, 4))
    {
      __break(1u);
    }
    else
    {
      uint64_t v19 = v11;
      uint64_t result = sub_25A032238(*(_DWORD *)(a1 + a2 - 4));
      if (!v4)
      {
        uint64_t v18 = a4;
        swift_getObjectType();
        swift_unknownObjectRetain();
        sub_25A038800();
        swift_unknownObjectRelease();
        uint64_t v15 = v18;
        *(void *)uint64_t v18 = a3;
        *((void *)v15 + 1) = &off_2707ECF28;
        uint64_t v16 = type metadata accessor for AttributedMessage();
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v15[*(int *)(v16 + 20)], v13, v9);
        return swift_retain();
      }
    }
  }
  else
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v14 = 0xD000000000000031;
    *(void *)(v14 + 8) = 0x800000025A039840;
    *(unsigned char *)(v14 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25A02FAB4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for MessageInBlobBridge()
{
  return self;
}

uint64_t (*sub_25A02FB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7))(uint64_t)
{
  uint64_t v27 = a3;
  uint64_t v28 = a5;
  uint64_t v26 = a2;
  uint64_t v11 = sub_25A0380B0();
  uint64_t v24 = *(void *)(v11 - 8);
  uint64_t v25 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(boxed_opaque_existential_1, a1, a6);
  __swift_project_boxed_opaque_existential_1(v32, v33);
  uint64_t result = (uint64_t (*)(uint64_t))sub_25A0386E0();
  uint64_t v16 = (uint64_t)result + 4;
  if (__OFADD__(result, 4))
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = (uint64_t (*)(uint64_t))sub_25A0380C0();
  if (v16 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v16 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v29 = a4;
  uint64_t v17 = result(v16);
  swift_release();
  if (v17)
  {
    uint64_t v31 = v17;
    uint64_t v18 = sub_25A0386E0();
    unint64_t v19 = sub_25A030CA8(v26, v27);
    uint64_t v28 = &v24;
    int v22 = MEMORY[0x270FA5388](v19);
    *(&v24 - 2) = (uint64_t)&v31;
    *(&v24 - 1) = v18;
    int v23 = v22;
    sub_25A0386D0();
    *(_DWORD *)(v30 + v18) = v23;
    sub_25A0380A0();
    sub_25A038250();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v25);
  }
  else
  {
    sub_25A02FEB0();
    uint64_t v20 = swift_allocError();
    *uint64_t v21 = 3;
    swift_willThrow();
    uint64_t v31 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A404180);
    sub_25A038210();
    MEMORY[0x25A2F3A70](v20);
  }
  return (uint64_t (*)(uint64_t))__swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_25A02FEB0()
{
  unint64_t result = qword_26A404490;
  if (!qword_26A404490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404490);
  }
  return result;
}

void *sub_25A02FF04@<X0>(void *__src@<X0>, void *a2@<X8>)
{
  uint64_t v4 = **(void ***)(v2 + 16);
  unint64_t result = memcpy(v4, __src, *(void *)(v2 + 24));
  if (v4) {
    *a2 = v4;
  }
  else {
    __break(1u);
  }
  return result;
}

PoirotUDFs::Column __swiftcall Column.init(name:type:hidden:)(Swift::String name, PoirotUDFs::ColumnType type, Swift::Bool hidden)
{
  char v4 = *(unsigned char *)type;
  *(Swift::String *)uint64_t v3 = name;
  *(unsigned char *)(v3 + 16) = v4;
  *(unsigned char *)(v3 + 17) = hidden;
  result.name = name;
  result.type = type;
  return result;
}

uint64_t Column.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void Column.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t Column.hidden.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t _s10PoirotUDFs6ColumnV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 17);
  int v4 = *(unsigned __int8 *)(a2 + 16);
  int v5 = *(unsigned __int8 *)(a2 + 17);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    if (v2 != v4) {
      return 0;
    }
    return v3 ^ v5 ^ 1u;
  }
  char v7 = sub_25A038B10();
  uint64_t result = 0;
  if ((v7 & 1) != 0 && v2 == v4) {
    return v3 ^ v5 ^ 1u;
  }
  return result;
}

uint64_t sub_25A030044(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Column(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Column(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Column(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Column(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Column()
{
  return &type metadata for Column;
}

uint64_t type metadata accessor for PStreamCursor()
{
  uint64_t result = qword_26A4044A8;
  if (!qword_26A4044A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A03021C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A030274()
{
  return sub_25A0302C0();
}

uint64_t sub_25A0302C0()
{
  uint64_t v2 = v0;
  swift_weakInit();
  type metadata accessor for PStreamConnection();
  if (swift_dynamicCastClass())
  {
    swift_weakAssign();
    swift_retain();
    swift_retain();
    uint64_t v3 = sub_25A028818();
    if (!v1)
    {
      *(void *)(v0 + qword_26A4044A0) = v3;
      swift_release();
      uint64_t v2 = sub_25A0383F0();
      swift_release();
      return v2;
    }
    swift_release();
    swift_release();
  }
  else
  {
    sub_25A030BC8();
    swift_allocError();
    swift_willThrow();
  }
  swift_release();
  swift_weakDestroy();
  type metadata accessor for PStreamCursor();
  swift_deallocPartialClassInstance();
  return v2;
}

uint64_t sub_25A030404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_25A038070();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044B8);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25A038180();
  uint64_t v16 = v15(a1, a2, a3);
  uint64_t v17 = v16;
  if (!v4 && !v16)
  {
    char v18 = sub_25A036218(a2);
    unint64_t v21 = v20;
    uint64_t v30 = v9;
    sub_25A030670(v18 & 1, v19, v20, 0, a3);
    uint64_t v29 = 0;
    int v22 = *(void **)(v3 + qword_26A4044A0);
    sub_25A038060();
    for (uint64_t i = 0; i != 64; ++i)
    {
      if ((v21 >> i)) {
        sub_25A038050();
      }
    }
    uint64_t v24 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v14, v12, v8);
    swift_bridgeObjectRelease();
    uint64_t v25 = (char *)v22 + OBJC_IVAR____TtC10PoirotUDFs17PStreamEnumerator_columns;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v25, v14, v8);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v8);
    uint64_t v26 = v22[5];
    uint64_t v27 = v22[6];
    __swift_project_boxed_opaque_existential_1(v22 + 2, v26);
    (*(void (**)(uint64_t, uint64_t))(v27 + 24))(v26, v27);
  }
  return v17;
}

uint64_t sub_25A030670(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  char v7 = result;
  unint64_t v8 = *(void *)(a5 + 16);
  if (!v8) {
    goto LABEL_32;
  }
  if (v8 > *(void *)(a2 + 16))
  {
    __break(1u);
    JUMPOUT(0x25A0308B4);
  }
  uint64_t v10 = (unsigned __int8 *)(a2 + 32);
  uint64_t v11 = *(void *)(sub_25A038360() - 8);
  uint64_t v12 = a5 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v13 = *(void *)(v11 + 72);
  double v14 = INFINITY;
  double v15 = 0.0;
  do
  {
    int v16 = *v10++;
    uint64_t result = sub_25A038340();
    HIDWORD(v18) = v16;
    LODWORD(v18) = v16 - 4;
    switch((v18 >> 2))
    {
      case 0u:
        if (v15 < v17)
        {
          double v15 = v17 + 0.0;
          if (v17 + 0.0 < INFINITY) {
            *(void *)&v15 += (*(uint64_t *)&v15 >> 63) | 1;
          }
        }
        break;
      case 1u:
        if (v17 <= v14) {
          double v14 = v17;
        }
        break;
      case 3u:
        if (v17 < v14)
        {
          double v19 = 0.0 - v17;
          if (v19 < INFINITY) {
            *(void *)&v19 += (*(uint64_t *)&v19 >> 63) | 1;
          }
          double v14 = -v19;
        }
        break;
      case 7u:
        if (v15 <= v17) {
          double v15 = v17;
        }
        break;
      default:
        break;
    }
    v12 += v13;
    --v8;
  }
  while (v8);
  if (v14 >= v15) {
    double v20 = v14;
  }
  else {
    double v20 = v15;
  }
  double v21 = fmax(v15, 0.0);
  if (v14 >= 0.0)
  {
    double v22 = v14;
  }
  else
  {
    double v20 = v21;
    double v22 = 0.0;
  }
  if (v15 < 0.0) {
    double v23 = v22;
  }
  else {
    double v23 = v20;
  }
  if (v15 < 0.0) {
    double v24 = 0.0;
  }
  else {
    double v24 = v15;
  }
  if (v24 > v23)
  {
    __break(1u);
LABEL_32:
    double v24 = 0.0;
    double v23 = INFINITY;
  }
  BOOL v25 = v24 == 0.0 && v23 == INFINITY;
  if (!v25 || (v7 & 1) != 0)
  {
    uint64_t v26 = *(void **)(v6 + qword_26A4044A0);
    uint64_t v27 = v26[5];
    uint64_t v28 = v26[6];
    __swift_project_boxed_opaque_existential_1(v26 + 2, v27);
    return (*(uint64_t (**)(void, uint64_t, uint64_t, double, double))(v28 + 16))(v7 & 1, v27, v28, v24, v23);
  }
  return result;
}

uint64_t sub_25A0308D4(int a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A034470(a1, (uint64_t)v7);
  if (!v2)
  {
    sub_25A03468C((uint64_t)v7, a2);
    sub_25A030B68((uint64_t)v7);
  }
  return 0;
}

uint64_t sub_25A0309A0()
{
  uint64_t v2 = *(void **)(v0 + qword_26A4044A0);
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v3);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044B8);
    uint64_t v6 = (uint64_t (*)(void))sub_25A038180();
    return v6();
  }
  return result;
}

uint64_t sub_25A030A5C()
{
  uint64_t v1 = *(void **)(v0 + qword_26A4044A0);
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3) & 1;
}

uint64_t sub_25A030AC0()
{
  swift_weakDestroy();
  return swift_release();
}

uint64_t sub_25A030B00()
{
  uint64_t v0 = sub_25A0383E0();
  swift_weakDestroy();
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25A030B60()
{
  return type metadata accessor for PStreamCursor();
}

uint64_t sub_25A030B68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25A030BC8()
{
  unint64_t result = qword_26A4044C0;
  if (!qword_26A4044C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4044C0);
  }
  return result;
}

uint64_t dispatch thunk of StreamEnumerating.currentElement.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StreamEnumerating.setTimeRange(_:reversed:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of StreamEnumerating.startEnumeration()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of StreamEnumerating.advance()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of StreamEnumerating.hasEvent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t sub_25A030CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2;
  swift_beginAccess();
  uint64_t v9 = *(void **)(v2 + 24);
  if (v9[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_25A035044(a1, a2);
    if (v11)
    {
      unint64_t v4 = *(void *)(v9[7] + 8 * v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v4 & 0x8000000000000000) != 0)
      {
        __break(1u);
        goto LABEL_16;
      }
      if (!HIDWORD(v4)) {
        return v4;
      }
      __break(1u);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v12 = *(void *)(*(void *)(v6 + 16) + 16);
  if (v12 > 0x7FFFFFFE)
  {
    sub_25A02FEB0();
    swift_allocError();
    *double v19 = 0;
    swift_willThrow();
    return v4;
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v5 = sub_25A038750();
  unint64_t v4 = v13;
  swift_unknownObjectRelease();
  if (!v3)
  {
    unint64_t v21 = v4;
    unint64_t v4 = v12 + 1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *(void *)(v6 + 24);
    *(void *)(v6 + 24) = 0x8000000000000000;
    sub_25A031B70(v12 + 1, a1, a2, isUniquelyReferenced_nonNull_native);
    *(void *)(v6 + 24) = v22;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v9 = *(void **)(v6 + 16);
    swift_unknownObjectRetain();
    char v15 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v6 + 16) = v9;
    if (v15)
    {
LABEL_10:
      unint64_t v17 = v9[2];
      unint64_t v16 = v9[3];
      if (v17 >= v16 >> 1)
      {
        uint64_t v9 = sub_25A031004((void *)(v16 > 1), v17 + 1, 1, v9);
        *(void *)(v6 + 16) = v9;
      }
      long long v9[2] = v17 + 1;
      unint64_t v18 = &v9[2 * v17];
      v18[4] = v5;
      v18[5] = v21;
      swift_unknownObjectRelease();
      return v4;
    }
LABEL_16:
    uint64_t v9 = sub_25A031004(0, v9[2] + 1, 1, v9);
    *(void *)(v6 + 16) = v9;
    goto LABEL_10;
  }
  return v4;
}

BOOL sub_25A030F14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25A030F28()
{
  return sub_25A038BB0();
}

uint64_t sub_25A030F70()
{
  return sub_25A038BA0();
}

uint64_t sub_25A030F9C()
{
  return sub_25A038BB0();
}

uint64_t type metadata accessor for MessageSchemaRegistry()
{
  return self;
}

void *sub_25A031004(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044C8);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044D0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25A031128(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4042F0);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25A031240(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044E0);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25A03134C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044E8);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25A031450(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044D8);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25A03153C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404208);
  char v37 = a2;
  uint64_t v6 = sub_25A038A80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25A038B90();
    sub_25A038940();
    uint64_t result = sub_25A038BB0();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25A031848(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041F0);
  char v37 = a2;
  uint64_t v6 = sub_25A038A80();
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
    unint64_t v19 = (void *)(v5 + 64);
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
    char v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_25A020BF8(v25, (uint64_t)v38);
    }
    else
    {
      sub_25A0296E8((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_25A038B90();
    sub_25A038940();
    uint64_t result = sub_25A038BB0();
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
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_25A020BF8(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25A031B70(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25A035044(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25A031E9C();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_25A03153C(result, a4 & 1);
  uint64_t result = sub_25A035044(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_25A038B30();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v23;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25A031CD4(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_25A035044(a2, a3);
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
      sub_25A03204C();
      goto LABEL_7;
    }
    sub_25A031848(v15, a4 & 1);
    unint64_t v21 = sub_25A035044(a2, a3);
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
    uint64_t result = sub_25A038B30();
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
    return sub_25A020BF8(a1, v19);
  }
LABEL_13:
  sub_25A031E2C(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25A031E2C(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_25A020BF8(a4, a5[7] + 40 * a1);
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

void *sub_25A031E9C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404208);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A038A70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    char v22 = (void *)(*(void *)(v4 + 48) + v16);
    *char v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25A03204C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A038A70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
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
    sub_25A0296E8(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_25A020BF8(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
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

uint64_t sub_25A032238(unsigned int a1)
{
  if (!a1)
  {
    char v3 = 2;
    goto LABEL_5;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  if (*(void *)(v2 + 16) < (unint64_t)a1)
  {
    char v3 = 1;
LABEL_5:
    sub_25A02FEB0();
    swift_allocError();
    *uint64_t v4 = v3;
    return swift_willThrow();
  }
  return *(void *)(v2 + 16 * (a1 - 1) + 32);
}

uint64_t getEnumTagSinglePayload for MessageSchemaRegistry.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MessageSchemaRegistry.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A032418);
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

ValueMetadata *type metadata accessor for MessageSchemaRegistry.Error()
{
  return &type metadata for MessageSchemaRegistry.Error;
}

unint64_t sub_25A032454()
{
  unint64_t result = qword_26A4044F0;
  if (!qword_26A4044F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4044F0);
  }
  return result;
}

uint64_t type metadata accessor for PMessageNameFunction()
{
  uint64_t result = qword_26A4044F8;
  if (!qword_26A4044F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A0324F4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A032534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v30 = sub_25A038360();
  uint64_t v7 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  int64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AttributedMessage();
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25A0387E0();
  uint64_t result = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16))
  {
    uint64_t v28 = v15;
    uint64_t v29 = result;
    uint64_t v31 = a1;
    uint64_t v18 = a2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    if (sub_25A038300())
    {
      return sub_25A0381F0();
    }
    else
    {
      uint64_t v19 = v4 + qword_26A404390;
      if (MEMORY[0x25A2F3C50](v19))
      {
        uint64_t v20 = *(void *)(v19 + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(ObjectType, v20);
        uint64_t result = swift_unknownObjectRelease();
        if (!v3)
        {
          uint64_t v22 = v18;
          uint64_t v23 = v30;
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v22, v30);
          sub_25A0382C0();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
          swift_unknownObjectRelease();
          uint64_t v26 = v28;
          uint64_t v25 = v29;
          (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v17, &v12[*(int *)(v10 + 20)], v29);
          sub_25A01C79C((uint64_t)v12);
          sub_25A038780();
          (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v25);
          swift_getObjectType();
          sub_25A0386C0();
          swift_unknownObjectRelease();
          sub_25A038270();
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        sub_25A01C72C();
        swift_allocError();
        *(void *)uint64_t v24 = 0xD000000000000012;
        *(void *)(v24 + 8) = 0x800000025A039040;
        *(unsigned char *)(v24 + 16) = 1;
        return swift_willThrow();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25A0328D4()
{
  return type metadata accessor for PMessageNameFunction();
}

uint64_t type metadata accessor for PEnumFunction()
{
  uint64_t result = qword_26A404508;
  if (!qword_26A404508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A032928()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A032968(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) < 2uLL)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v4 = v2;
  sub_25A038360();
  uint64_t result = sub_25A0382D0();
  if (v3) {
    return result;
  }
  uint64_t v6 = v2 + qword_26A404390;
  if (!MEMORY[0x25A2F3C50](v4 + qword_26A404390))
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v9 = 0xD000000000000012;
    *(void *)(v9 + 8) = 0x800000025A039040;
    *(unsigned char *)(v9 + 16) = 1;
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
  uint64_t v7 = *(void *)(v6 + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(ObjectType, v7);
  swift_unknownObjectRelease();
  swift_getObjectType();
  sub_25A038740();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (sub_25A038310())
  {
    sub_25A0382D0();
    swift_getObjectType();
    uint64_t v10 = sub_25A038700();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (v10 <= 0x7FFFFFFF)
      {
        sub_25A038230();
        return swift_unknownObjectRelease();
      }
LABEL_18:
      __break(1u);
      return result;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (sub_25A038350())
  {
    sub_25A038330();
    swift_getObjectType();
    sub_25A0386F0();
    sub_25A038270();
    swift_unknownObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_25A032C8C()
{
  return type metadata accessor for PEnumFunction();
}

uint64_t type metadata accessor for PStreamTable()
{
  uint64_t result = qword_26A404520;
  if (!qword_26A404520) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A032CE0()
{
  return swift_initClassMetadata2();
}

void sub_25A032D2C()
{
}

uint64_t sub_25A032D5C()
{
  return sub_25A01C704(v0 + qword_26A404518);
}

uint64_t sub_25A032D6C()
{
  uint64_t v0 = sub_25A038470();
  sub_25A01C704(v0 + qword_26A404518);
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25A032DBC()
{
  return type metadata accessor for PStreamTable();
}

uint64_t sub_25A032DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25A038160();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PStreamTable();
  *(void *)(swift_allocObject() + qword_26A404518 + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F5F030], v3);
  uint64_t v7 = sub_25A038460();
  swift_unknownObjectRelease();
  return v7;
}

unint64_t sub_25A032EF0(uint64_t a1)
{
  unint64_t result = sub_25A032F18();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25A032F18()
{
  unint64_t result = qword_26A404530;
  if (!qword_26A404530)
  {
    type metadata accessor for PStreamTable();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404530);
  }
  return result;
}

uint64_t sub_25A032F70()
{
  uint64_t v1 = sub_25A0384C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = 0;
  unint64_t v7 = 0xE000000000000000;
  sub_25A038A30();
  swift_bridgeObjectRelease();
  unint64_t v6 = 0xD000000000000016;
  unint64_t v7 = 0x800000025A0399F0;
  sub_25A038970();
  sub_25A038970();
  sub_25A038970();
  sub_25A0383C0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v0)
  {
    sub_25A0384B0();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PStreamTableConfig()
{
  return &type metadata for PStreamTableConfig;
}

unint64_t sub_25A033114()
{
  unint64_t result = qword_26A404538;
  if (!qword_26A404538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404538);
  }
  return result;
}

uint64_t type metadata accessor for PBase64DecodeFunction()
{
  uint64_t result = qword_26A404540;
  if (!qword_26A404540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A0331B4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A0331F4()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_25A0331FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_25A038360();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_25A0380B0();
  uint64_t v54 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25A038900();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v19 = (char *)v47 - v18;
  uint64_t v20 = *(void *)(a2 + 16);
  if ((unint64_t)(v20 - 1) > 1)
  {
    *(void *)&long long v58 = 0;
    *((void *)&v58 + 1) = 0xE000000000000000;
    sub_25A038A30();
    swift_bridgeObjectRelease();
    return sub_25A038200();
  }
  uint64_t v48 = v17;
  uint64_t v49 = v16;
  uint64_t v52 = a1;
  uint64_t v53 = v2;
  uint64_t v50 = v15;
  uint64_t v51 = v14;
  uint64_t v21 = a2 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v22 = sub_25A0382E0();
  uint64_t v24 = v6;
  if (v23 >> 60 == 15)
  {
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v21, v5);
    MEMORY[0x270FA5388](v25);
    v47[-2] = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A404228);
    uint64_t v26 = v53;
    sub_25A0382C0();
    if (v26) {
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    uint64_t v36 = v55;
    uint64_t v37 = v56;
    char v38 = v57;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v38)
    {
      uint64_t v60 = 0;
      long long v58 = 0u;
      long long v59 = 0u;
    }
    else
    {
      *((void *)&v59 + 1) = MEMORY[0x263F8D3E8];
      uint64_t v60 = MEMORY[0x263F5F220];
      *(void *)&long long v58 = v36;
      *((void *)&v58 + 1) = v37;
    }
    sub_25A02DA4C((uint64_t)&v58);
    return sub_25A02DB90((uint64_t)&v58);
  }
  uint64_t v28 = v22;
  unint64_t v29 = v23;
  v47[1] = v24;
  sub_25A0388F0();
  sub_25A0388D0();
  if (v30)
  {
    while (1)
    {
      uint64_t v32 = sub_25A038030();
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      if (v34 >> 60 == 15) {
        break;
      }
      switch(v34 >> 62)
      {
        case 1uLL:
          if ((int)v32 != v32 >> 32) {
            goto LABEL_9;
          }
          goto LABEL_15;
        case 2uLL:
          if (*(void *)(v32 + 16) == *(void *)(v32 + 24)) {
            goto LABEL_15;
          }
          goto LABEL_9;
        case 3uLL:
          goto LABEL_15;
        default:
          if ((v34 & 0xFF000000000000) == 0)
          {
LABEL_15:
            sub_25A0338D0(v32, v34);
            goto LABEL_16;
          }
LABEL_9:
          sub_25A01C7F8(v28, v29);
          sub_25A0388F0();
          sub_25A0388D0();
          unint64_t v29 = v34;
          uint64_t v28 = v32;
          if (!v31) {
            goto LABEL_17;
          }
          break;
      }
    }
  }
LABEL_16:
  uint64_t v32 = v28;
  unint64_t v34 = v29;
LABEL_17:
  if (v20 != 2)
  {
    sub_25A020C10(v32, v34);
    sub_25A0380A0();
    sub_25A0381E0();
    sub_25A01C7F8(v32, v34);
    sub_25A01C7F8(v32, v34);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v10, v61);
  }
  uint64_t v35 = v53;
  sub_25A0382D0();
  if (v35) {
    return sub_25A01C7F8(v32, v34);
  }
  if (sub_25A038910() == 946238581 && v39 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v41 = sub_25A038B10();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0)
    {
      *(void *)&long long v58 = 0;
      *((void *)&v58 + 1) = 0xE000000000000000;
      sub_25A038A30();
      swift_bridgeObjectRelease();
      *(void *)&long long v58 = 0xD000000000000011;
      *((void *)&v58 + 1) = 0x800000025A039A70;
      sub_25A038970();
      swift_bridgeObjectRelease();
      sub_25A038970();
      sub_25A038200();
      sub_25A01C7F8(v32, v34);
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t v42 = v48;
  sub_25A0388F0();
  swift_bridgeObjectRelease();
  uint64_t v44 = v49;
  uint64_t v43 = v50;
  uint64_t v45 = v51;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v49, v42, v51);
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v19, v44, v45);
  sub_25A0388D0();
  if (v46)
  {
    sub_25A038270();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A0381F0();
  }
  sub_25A01C7F8(v32, v34);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 8))(v44, v45);
}

uint64_t sub_25A0338C8()
{
  return type metadata accessor for PBase64DecodeFunction();
}

uint64_t sub_25A0338D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25A01C7F8(a1, a2);
  }
  return a1;
}

uint64_t type metadata accessor for PGetFunction()
{
  uint64_t result = qword_26A404550;
  if (!qword_26A404550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A033930()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A033970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25A038360();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AttributedMessage();
  uint64_t result = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = *(void *)(a2 + 16);
  if (!v15)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v25 = v14;
  uint64_t v26 = a1;
  uint64_t v16 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  if (sub_25A038300()) {
    return sub_25A0381F0();
  }
  uint64_t v17 = v4 + qword_26A404390;
  if (MEMORY[0x25A2F3C50](v17))
  {
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(ObjectType, v18);
    uint64_t result = swift_unknownObjectRelease();
    if (!v3)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v16, v7);
      sub_25A0382C0();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t result = swift_unknownObjectRelease();
      if (v15 >= 2)
      {
        uint64_t v21 = sub_25A0382D0();
        uint64_t v22 = (uint64_t)v25;
        sub_25A02E9BC(v21, v23, v26);
        swift_bridgeObjectRelease();
        return sub_25A01C79C(v22);
      }
      goto LABEL_12;
    }
  }
  else
  {
    sub_25A01C72C();
    swift_allocError();
    *(void *)uint64_t v20 = 0xD000000000000012;
    *(void *)(v20 + 8) = 0x800000025A039040;
    *(unsigned char *)(v20 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25A033C5C()
{
  return type metadata accessor for PGetFunction();
}

uint64_t Column.columnType.getter()
{
  uint64_t v1 = MEMORY[0x263F8D310];
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
    case 0xA:
      uint64_t v1 = MEMORY[0x263F06F78];
      sub_25A0237E0();
      break;
    case 2:
      uint64_t v1 = MEMORY[0x263F8E548];
      break;
    case 3:
      uint64_t v1 = MEMORY[0x263F8E5C0];
      break;
    case 4:
      uint64_t v1 = MEMORY[0x263F8E8F8];
      break;
    case 5:
      uint64_t v1 = MEMORY[0x263F8E970];
      break;
    case 6:
      uint64_t v1 = MEMORY[0x263F8D5C8];
      break;
    case 7:
    case 8:
      uint64_t v1 = MEMORY[0x263F8D538];
      break;
    case 9:
      uint64_t v1 = MEMORY[0x263F8D4F8];
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t Column.columnName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Column.isValid(_:)(void *a1)
{
  uint64_t v39 = a1;
  uint64_t v2 = sub_25A038370();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v34 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v34 - v12;
  uint64_t v14 = *v1;
  uint64_t v15 = v1[1];
  int v16 = *((unsigned __int8 *)v1 + 16);
  int v17 = *((unsigned __int8 *)v1 + 17);
  uint64_t v43 = *v1;
  uint64_t v44 = v15;
  char v45 = v16;
  char v46 = v17;
  sub_25A034354();
  uint64_t v18 = v42;
  sub_25A038130();
  if (!v18)
  {
    int v36 = v17;
    int v47 = v16;
    uint64_t v37 = v15;
    uint64_t v38 = v14;
    uint64_t v35 = v5;
    uint64_t v42 = v13;
    uint64_t v19 = v39;
    __swift_project_boxed_opaque_existential_1(v39, v39[3]);
    sub_25A038120();
    uint64_t v21 = v41;
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    unint64_t v34 = v11;
    uint64_t v23 = v11;
    uint64_t v24 = v40;
    v22(v8, v23, v41);
    int v25 = (*(uint64_t (**)(char *, uint64_t))(v24 + 88))(v8, v21);
    int v26 = *MEMORY[0x263F5F070];
    uint64_t v27 = v21;
    uint64_t v28 = *(void (**)(char *, uint64_t))(v24 + 8);
    v28(v8, v27);
    if (v25 == v26)
    {
      uint64_t v43 = v38;
      uint64_t v44 = v37;
      char v45 = v47;
      char v46 = v36;
      sub_25A0341BC();
      if ((sub_25A038100() & 1) == 0)
      {
        LOBYTE(v11) = 0;
        uint64_t v33 = v41;
        uint64_t v31 = v42;
        uint64_t v32 = v34;
        goto LABEL_10;
      }
      __swift_project_boxed_opaque_existential_1(v19, v19[3]);
      swift_getDynamicType();
      unint64_t v29 = v35;
      sub_25A038130();
      uint64_t v30 = v41;
      uint64_t v31 = v42;
      uint64_t v32 = v34;
      v28(v34, v41);
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v32, v29, v30);
    }
    else
    {
      uint64_t v31 = v42;
      uint64_t v32 = v34;
    }
    sub_25A034164();
    uint64_t v33 = v41;
    sub_25A0389B0();
    sub_25A0389B0();
    LOBYTE(v11) = v43 == v48;
LABEL_10:
    v28(v32, v33);
    v28(v31, v33);
  }
  return v11 & 1;
}

unint64_t sub_25A034164()
{
  unint64_t result = qword_26A404560;
  if (!qword_26A404560)
  {
    sub_25A038370();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404560);
  }
  return result;
}

unint64_t sub_25A0341BC()
{
  unint64_t result = qword_26A404568;
  if (!qword_26A404568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404568);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Column.ensureValidSQLNameCharacters()()
{
}

uint64_t sub_25A034230()
{
  return *(unsigned __int8 *)(v0 + 17);
}

unint64_t sub_25A03423C()
{
  unint64_t result = qword_26A404570;
  if (!qword_26A404570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404570);
  }
  return result;
}

unint64_t sub_25A034294()
{
  unint64_t result = qword_26A404578;
  if (!qword_26A404578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404578);
  }
  return result;
}

uint64_t sub_25A0342EC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25A03431C(void *a1)
{
  return Column.isValid(_:)(a1) & 1;
}

uint64_t sub_25A034338()
{
  return sub_25A038920();
}

uint64_t sub_25A034354()
{
  uint64_t v1 = MEMORY[0x263F8D310];
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
    case 0xA:
      uint64_t v1 = MEMORY[0x263F06F78];
      sub_25A0237E0();
      break;
    case 2:
      uint64_t v1 = MEMORY[0x263F8E548];
      break;
    case 3:
      uint64_t v1 = MEMORY[0x263F8E5C0];
      break;
    case 4:
      uint64_t v1 = MEMORY[0x263F8E8F8];
      break;
    case 5:
      uint64_t v1 = MEMORY[0x263F8E970];
      break;
    case 6:
      uint64_t v1 = MEMORY[0x263F8D5C8];
      break;
    case 7:
    case 8:
      uint64_t v1 = MEMORY[0x263F8D538];
      break;
    case 9:
      uint64_t v1 = MEMORY[0x263F8D4F8];
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t sub_25A034470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = v2[12];
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_25A0350BC(a1), (v15 & 1) != 0))
  {
    sub_25A034E98(*(void *)(v13 + 56) + *(void *)(v7 + 72) * v14, (uint64_t)v10);
    sub_25A035538((uint64_t)v10, (uint64_t)v12);
    return sub_25A035538((uint64_t)v12, a2);
  }
  else
  {
    uint64_t v17 = v3[5];
    uint64_t v18 = v3[6];
    __swift_project_boxed_opaque_existential_1(v3 + 2, v17);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v18 + 8))(&v26, v17, v18);
    unint64_t v19 = v28;
    if (v28 >> 60 == 15)
    {
      uint64_t result = sub_25A038A60();
      __break(1u);
    }
    else
    {
      uint64_t v20 = v26;
      uint64_t v21 = v27;
      uint64_t v22 = v3 + 7;
      uint64_t v24 = v3[10];
      uint64_t v23 = v3[11];
      __swift_project_boxed_opaque_existential_1(v22, v24);
      uint64_t v26 = v20;
      uint64_t v27 = v21;
      unint64_t v28 = v19;
      (*(void (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v23 + 32))(a1, &v26, v24, v23);
      return sub_25A03551C(v20, v21, v19);
    }
  }
  return result;
}

uint64_t sub_25A03468C(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = sub_25A038690();
  uint64_t v34 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v33 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25A0388A0();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A038880();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  int v16 = (long long *)((char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v30 - v17;
  sub_25A034E98(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25A01EA14((uint64_t)v11, &qword_26A4041A0);
    return sub_25A0381F0();
  }
  else
  {
    uint64_t v20 = a2;
    sub_25A034F00((uint64_t)v11, (uint64_t)v18);
    sub_25A034F64((uint64_t)v18, (uint64_t)v16);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        sub_25A038280();
        goto LABEL_18;
      case 2u:
        sub_25A038240();
        goto LABEL_18;
      case 3u:
        sub_25A038290();
        goto LABEL_18;
      case 4u:
        sub_25A038220();
        goto LABEL_18;
      case 5u:
        sub_25A038260();
        goto LABEL_18;
      case 6u:
        sub_25A0381D0();
        goto LABEL_18;
      case 7u:
        uint64_t v22 = v31;
        uint64_t v21 = v32;
        (*(void (**)(char *, long long *, uint64_t))(v31 + 32))(v8, v16, v32);
        sub_25A038890();
        if (v2)
        {
          MEMORY[0x25A2F3A70](v2);
          sub_25A0381F0();
          (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v21);
          uint64_t result = sub_25A034FC8((uint64_t)v18);
        }
        else
        {
          sub_25A038270();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v21);
LABEL_18:
          uint64_t result = sub_25A034FC8((uint64_t)v18);
        }
        break;
      case 8u:
        sub_25A038270();
        swift_bridgeObjectRelease();
        goto LABEL_18;
      case 9u:
        uint64_t v36 = MEMORY[0x263F06F78];
        uint64_t v37 = MEMORY[0x263F5F100];
        long long v35 = *v16;
        sub_25A02DA4C((uint64_t)&v35);
        sub_25A034FC8((uint64_t)v18);
        return sub_25A01EA14((uint64_t)&v35, &qword_26A404428);
      case 0xAu:
        uint64_t v23 = v33;
        uint64_t v24 = v34;
        uint64_t v25 = v38;
        (*(void (**)(char *, long long *, uint64_t))(v34 + 32))(v33, v16, v38);
        uint64_t v26 = MEMORY[0x25A2F3C50](v30[1] + OBJC_IVAR____TtC10PoirotUDFs17PStreamEnumerator_bridge);
        if (!v26)
        {
          int v29 = 0;
          uint64_t v28 = 122;
          sub_25A038A60();
          __break(1u);
          JUMPOUT(0x25A034BFCLL);
        }
        v30[-4] = MEMORY[0x270FA5388](v26);
        v30[-3] = v27;
        uint64_t v28 = v20;
        sub_25A038670();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v25);
        sub_25A034FC8((uint64_t)v18);
        return swift_unknownObjectRelease();
      default:
        sub_25A038230();
        goto LABEL_18;
    }
  }
  return result;
}

uint64_t sub_25A034C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (const void *)sub_25A038770();
  uint64_t v7 = v6;
  sub_25A038780();
  swift_getObjectType();
  uint64_t v8 = sub_25A0386C0();
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  sub_25A035280(v5, v7, v8, v10, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A034CC8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC10PoirotUDFs17PStreamEnumerator_columns;
  uint64_t v2 = sub_25A038070();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_25A01C704(v0 + OBJC_IVAR____TtC10PoirotUDFs17PStreamEnumerator_bridge);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25A034D90()
{
  return type metadata accessor for PStreamEnumerator();
}

uint64_t type metadata accessor for PStreamEnumerator()
{
  uint64_t result = qword_26A404580;
  if (!qword_26A404580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A034DE4()
{
  uint64_t result = sub_25A038070();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25A034E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A034F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A038880();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A034F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A038880();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A034FC8(uint64_t a1)
{
  uint64_t v2 = sub_25A038880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A035024(uint64_t a1)
{
  return sub_25A034C28(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_25A035044(uint64_t a1, uint64_t a2)
{
  sub_25A038B90();
  sub_25A038940();
  uint64_t v4 = sub_25A038BB0();
  return sub_25A035100(a1, a2, v4);
}

unint64_t sub_25A0350BC(uint64_t a1)
{
  uint64_t v2 = sub_25A038B80();
  return sub_25A0351E4(a1, v2);
}

unint64_t sub_25A035100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25A038B10() & 1) == 0)
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
      while (!v14 && (sub_25A038B10() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25A0351E4(uint64_t a1, uint64_t a2)
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

uint64_t (*sub_25A035280(const void *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5))(void)
{
  uint64_t v10 = sub_25A0380B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = (const void *)MEMORY[0x263F8D3E8];
  v24[4] = (const void *)MEMORY[0x263F5F220];
  v24[0] = a1;
  v24[1] = a2;
  unint64_t result = (uint64_t (*)(void))__swift_project_boxed_opaque_existential_1(v24, MEMORY[0x263F8D3E8]);
  int64_t v15 = (unsigned char *)a2 - (unsigned char *)a1;
  if (!a1) {
    int64_t v15 = 0;
  }
  uint64_t v16 = v15 + 4;
  if (__OFADD__(v15, 4))
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v17 = result;
  unint64_t result = (uint64_t (*)(void))sub_25A0380C0();
  if (v16 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v16 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v23[0] = a5;
  uint64_t v18 = (char *)result(v16);
  swift_release();
  if (v18)
  {
    if (*v17) {
      size_t v19 = v17[1] - *v17;
    }
    else {
      size_t v19 = 0;
    }
    int v22 = sub_25A030CA8(a3, a4);
    memcpy(v18, v24[0], v19);
    *(_DWORD *)&v18[v19] = v22;
    sub_25A0380A0();
    sub_25A038250();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    sub_25A02FEB0();
    uint64_t v20 = swift_allocError();
    *uint64_t v21 = 3;
    swift_willThrow();
    v23[1] = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A404180);
    sub_25A038210();
    MEMORY[0x25A2F3A70](v20);
  }
  return (uint64_t (*)(void))__swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

uint64_t sub_25A03551C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15) {
    return sub_25A01C7F8(a2, a3);
  }
  return result;
}

uint64_t sub_25A035538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A0355A0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)(v4 + 96) = sub_25A020974(MEMORY[0x263F8EE78]);
  sub_25A038070();
  *(void *)&v13[0] = v7;
  sub_25A035710();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A404598);
  sub_25A035768();
  sub_25A0389E0();
  *(void *)(v4 + OBJC_IVAR____TtC10PoirotUDFs17PStreamEnumerator_bridge + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v9 + 40))(v13, v8, v9);
  sub_25A020BF8(v13, v4 + 16);
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v11 + 32))(v13, v10, v11);
  sub_25A020BF8(v13, v4 + 56);
  *(void *)(v4 + OBJC_IVAR____TtC10PoirotUDFs17PStreamEnumerator_bridge + 8) = a3;
  swift_unknownObjectWeakAssign();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v4;
}

unint64_t sub_25A035710()
{
  unint64_t result = qword_26A404590;
  if (!qword_26A404590)
  {
    sub_25A038070();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404590);
  }
  return result;
}

unint64_t sub_25A035768()
{
  unint64_t result = qword_26A4045A0;
  if (!qword_26A4045A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A404598);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4045A0);
  }
  return result;
}

uint64_t sub_25A0357C4(char a1, unint64_t a2, uint64_t a3, int a4)
{
  int v21 = a4;
  unint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v5 = sub_25A038900();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A037F70();
  MEMORY[0x270FA5388](v8);
  sub_25A037FB0();
  swift_allocObject();
  sub_25A037FA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4045B0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25A03A200;
  sub_25A037F60();
  uint64_t v22 = v9;
  sub_25A0364B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4045C0);
  sub_25A036510();
  sub_25A0389E0();
  sub_25A037F80();
  LOBYTE(v22) = a1;
  unint64_t v23 = v19;
  uint64_t v24 = v20;
  char v25 = v21;
  sub_25A03656C();
  uint64_t v10 = v26;
  uint64_t v11 = sub_25A037F90();
  if (v10) {
    goto LABEL_3;
  }
  uint64_t v13 = v11;
  unint64_t v14 = v12;
  uint64_t v22 = v11;
  unint64_t v23 = v12;
  sub_25A0388F0();
  sub_25A0365C0();
  uint64_t v7 = (char *)sub_25A0388E0();
  uint64_t v16 = v15;
  sub_25A01C7F8(v13, v14);
  if (v16)
  {
LABEL_3:
    swift_release();
    return (uint64_t)v7;
  }
  else
  {
    uint64_t result = sub_25A038A60();
    __break(1u);
  }
  return result;
}

uint64_t sub_25A035A88(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 7304306;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 7304306;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v5 = 28532;
      break;
    case 2:
      unint64_t v3 = 0xE100000000000000;
      uint64_t v5 = 99;
      break;
    case 3:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v5 = 25444;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE200000000000000;
      if (v5 == 28532) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE100000000000000;
      uint64_t v2 = 99;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE200000000000000;
      if (v5 == 25444) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25A038B10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A035BC0(unsigned __int8 *a1, char *a2)
{
  return sub_25A035A88(*a1, *a2);
}

uint64_t sub_25A035BCC()
{
  return sub_25A038BB0();
}

uint64_t sub_25A035C7C()
{
  sub_25A038940();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A035D14()
{
  return sub_25A038BB0();
}

uint64_t sub_25A035DC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A0367E8();
  *a1 = result;
  return result;
}

void sub_25A035DF0(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 7304306;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE200000000000000;
      uint64_t v3 = 28532;
      goto LABEL_3;
    case 2:
      *a1 = 99;
      a1[1] = 0xE100000000000000;
      break;
    case 3:
      *a1 = 25444;
      a1[1] = 0xE200000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25A035E60()
{
  uint64_t result = 7304306;
  switch(*v0)
  {
    case 1:
      uint64_t result = 28532;
      break;
    case 2:
      uint64_t result = 99;
      break;
    case 3:
      uint64_t result = 25444;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A035EC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A0367E8();
  *a1 = result;
  return result;
}

uint64_t sub_25A035EEC()
{
  return 0;
}

void sub_25A035EF8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_25A035F04(uint64_t a1)
{
  unint64_t v2 = sub_25A036AEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25A035F40(uint64_t a1)
{
  unint64_t v2 = sub_25A036AEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25A035F7C()
{
  byte_26A4047D0 = 0;
  qword_26A4047D8 = MEMORY[0x263F8EE78];
  unk_26A4047E0 = 0;
  byte_26A4047E8 = 0;
}

uint64_t sub_25A035F9C(void *a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  int v15 = a5;
  uint64_t v16 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A404600);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25A036AEC();
  sub_25A038BD0();
  if ((a2 & 1) == 0 || (char v17 = 0, sub_25A038AE0(), !v5))
  {
    if (!*(void *)(a3 + 16)
      || (uint64_t v21 = a3,
          char v20 = 1,
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4045F0),
          sub_25A036B40(&qword_26A404608),
          sub_25A038AF0(),
          !v5))
    {
      char v19 = 2;
      sub_25A038B00();
      if (!v5 && (v15 & 1) != 0)
      {
        char v18 = 3;
        sub_25A038AE0();
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

BOOL sub_25A0361B8@<W0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL result = sub_25A036834(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = v7 & 1;
  }
  return result;
}

uint64_t sub_25A0361F4(void *a1)
{
  return sub_25A035F9C(a1, *(unsigned char *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t sub_25A036218(uint64_t a1)
{
  uint64_t v3 = sub_25A038900();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!a1)
  {
    if (qword_26A404148 != -1) {
      swift_once();
    }
    LOBYTE(v7) = byte_26A4047D0;
    swift_bridgeObjectRetain();
    return v7 & 1;
  }
  sub_25A038980();
  sub_25A0388F0();
  uint64_t v7 = sub_25A0388C0();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  if (v9 >> 60 != 15)
  {
    sub_25A037F50();
    swift_allocObject();
    sub_25A037F40();
    sub_25A036464();
    sub_25A037F30();
    sub_25A0338D0(v7, v9);
    swift_release();
    if (!v1) {
      LOBYTE(v7) = v11[0];
    }
    return v7 & 1;
  }
  uint64_t result = sub_25A038A60();
  __break(1u);
  return result;
}

unint64_t sub_25A036464()
{
  unint64_t result = qword_26A4045A8;
  if (!qword_26A4045A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4045A8);
  }
  return result;
}

unint64_t sub_25A0364B8()
{
  unint64_t result = qword_26A4045B8;
  if (!qword_26A4045B8)
  {
    sub_25A037F70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4045B8);
  }
  return result;
}

unint64_t sub_25A036510()
{
  unint64_t result = qword_26A4045C8;
  if (!qword_26A4045C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4045C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4045C8);
  }
  return result;
}

unint64_t sub_25A03656C()
{
  unint64_t result = qword_26A4045D0;
  if (!qword_26A4045D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4045D0);
  }
  return result;
}

unint64_t sub_25A0365C0()
{
  unint64_t result = qword_26A4045D8;
  if (!qword_26A4045D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4045D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for QueryPlanInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for QueryPlanInfo(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for QueryPlanInfo(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for QueryPlanInfo(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryPlanInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QueryPlanInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QueryPlanInfo()
{
  return &type metadata for QueryPlanInfo;
}

uint64_t sub_25A0367E8()
{
  unint64_t v0 = sub_25A038AA0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

BOOL sub_25A036834(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4045E0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25A036AEC();
  sub_25A038BC0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v18 = 0;
    uint64_t v8 = sub_25A038AB0();
    BOOL v2 = (v9 & 1) == 0 && v8 == 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4045F0);
    char v17 = 1;
    sub_25A036B40(&qword_26A4045F8);
    sub_25A038AC0();
    char v16 = 2;
    swift_bridgeObjectRetain();
    sub_25A038AD0();
    char v15 = 3;
    uint64_t v12 = sub_25A038AB0();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v14 = v12;
    v13(v7, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v2;
}

unint64_t sub_25A036AEC()
{
  unint64_t result = qword_26A4045E8;
  if (!qword_26A4045E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4045E8);
  }
  return result;
}

uint64_t sub_25A036B40(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4045F0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for QueryPlanInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A036C70);
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

ValueMetadata *type metadata accessor for QueryPlanInfo.CodingKeys()
{
  return &type metadata for QueryPlanInfo.CodingKeys;
}

unint64_t sub_25A036CAC()
{
  unint64_t result = qword_26A404610;
  if (!qword_26A404610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404610);
  }
  return result;
}

unint64_t sub_25A036D04()
{
  unint64_t result = qword_26A404618;
  if (!qword_26A404618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404618);
  }
  return result;
}

unint64_t sub_25A036D5C()
{
  unint64_t result = qword_26A404620;
  if (!qword_26A404620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404620);
  }
  return result;
}

BOOL static ColumnType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ColumnType.hash(into:)()
{
  return sub_25A038BA0();
}

uint64_t ColumnType.hashValue.getter()
{
  return sub_25A038BB0();
}

unint64_t sub_25A036E3C()
{
  unint64_t result = qword_26A404628;
  if (!qword_26A404628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404628);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ColumnType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x25A036FECLL);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColumnType()
{
  return &type metadata for ColumnType;
}

uint64_t type metadata accessor for PJSONFunction()
{
  uint64_t result = qword_26A404630;
  if (!qword_26A404630) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A037070()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25A0370B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25A038360();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AttributedMessage();
  uint64_t result = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16))
  {
    v20[1] = a1;
    uint64_t v15 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    if (sub_25A038300())
    {
      return sub_25A0381F0();
    }
    else
    {
      uint64_t v16 = v4 + qword_26A404390;
      if (MEMORY[0x25A2F3C50](v16))
      {
        uint64_t v17 = *(void *)(v16 + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(ObjectType, v17);
        uint64_t result = swift_unknownObjectRelease();
        if (!v3)
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v15, v7);
          sub_25A0382C0();
          (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
          swift_unknownObjectRelease();
          sub_25A0387B0();
          sub_25A038270();
          swift_bridgeObjectRelease();
          return sub_25A01C79C((uint64_t)v14);
        }
      }
      else
      {
        sub_25A01C72C();
        swift_allocError();
        *(void *)uint64_t v19 = 0xD000000000000012;
        *(void *)(v19 + 8) = 0x800000025A039040;
        *(unsigned char *)(v19 + 16) = 1;
        return swift_willThrow();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25A0373D0()
{
  return type metadata accessor for PJSONFunction();
}

uint64_t sub_25A0373D8@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25A038550();
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (unsigned int *)MEMORY[0x263F5F128];
  switch(a1)
  {
    case 'F':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F170];
      goto LABEL_17;
    case 'G':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F188];
      goto LABEL_17;
    case 'I':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F130];
      goto LABEL_17;
    case 'S':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F148];
      goto LABEL_17;
    case 'U':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F160];
      goto LABEL_17;
    case 'b':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F118];
      goto LABEL_17;
    case 'd':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F138];
      goto LABEL_17;
    case 'f':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F168];
      goto LABEL_17;
    case 'g':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F180];
      goto LABEL_17;
    case 'i':
      goto LABEL_17;
    case 's':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F140];
      goto LABEL_17;
    case 't':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F150];
      goto LABEL_17;
    case 'u':
      uint64_t v8 = (unsigned int *)MEMORY[0x263F5F158];
LABEL_17:
      uint64_t v11 = *v8;
      uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
      uint64_t v14 = v5;
      v12(v7, v11, v4);
      (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v7, v4);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v4);
      break;
    default:
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
      uint64_t result = v9(a2, 1, 1, v4);
      break;
  }
  return result;
}

char *sub_25A0376B0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A0376D0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_25A0376D0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4044E8);
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
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_25A0377D4(uint64_t a1)
{
  uint64_t v2 = sub_25A038620();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4041A8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int64_t v11 = (char *)&v13 - v10;
  sub_25A038850();
  sub_25A038860();
  sub_25A01DBEC((uint64_t)v11, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2) == 1)
  {
    sub_25A01EA14((uint64_t)v9, &qword_26A4041A8);
    sub_25A0381F0();
  }
  else
  {
    sub_25A023980((uint64_t)v9, (uint64_t)v5);
    sub_25A02EDAC(a1, 0);
    sub_25A037ED0((uint64_t)v5, MEMORY[0x263F5F1F8]);
  }
  return sub_25A01EA14((uint64_t)v11, &qword_26A4041A8);
}

uint64_t sub_25A037BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  v21[1] = a3;
  uint64_t v7 = sub_25A0386B0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A404640);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25A038550();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v21 - v18;
  sub_25A0373D8(a5, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_25A01EA14((uint64_t)v12, &qword_26A404640);
    return sub_25A038200();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    swift_bridgeObjectRetain();
    sub_25A0386A0();
    sub_25A0377D4(a1);
    sub_25A037ED0((uint64_t)v9, MEMORY[0x263F5F208]);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  }
}

unint64_t sub_25A037E74()
{
  unint64_t result = qword_26A404650;
  if (!qword_26A404650)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A404648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A404650);
  }
  return result;
}

uint64_t sub_25A037ED0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25A037F30()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25A037F40()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25A037F50()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25A037F60()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_25A037F70()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_25A037F80()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_25A037F90()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25A037FA0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25A037FB0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25A037FC0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25A037FD0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_25A037FE0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25A037FF0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25A038000()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25A038010()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_25A038020()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_25A038030()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_25A038040()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25A038050()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_25A038060()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_25A038070()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_25A038080()
{
  return MEMORY[0x270F549C8]();
}

uint64_t sub_25A038090()
{
  return MEMORY[0x270F549D0]();
}

uint64_t sub_25A0380A0()
{
  return MEMORY[0x270F549D8]();
}

uint64_t sub_25A0380B0()
{
  return MEMORY[0x270F549E0]();
}

uint64_t sub_25A0380C0()
{
  return MEMORY[0x270F549E8]();
}

uint64_t sub_25A0380D0()
{
  return MEMORY[0x270F54A00]();
}

uint64_t sub_25A0380F0()
{
  return MEMORY[0x270F54A10]();
}

uint64_t sub_25A038100()
{
  return MEMORY[0x270F54A18]();
}

uint64_t sub_25A038110()
{
  return MEMORY[0x270F54A28]();
}

uint64_t sub_25A038120()
{
  return MEMORY[0x270F54A68]();
}

uint64_t sub_25A038130()
{
  return MEMORY[0x270F54A88]();
}

uint64_t sub_25A038140()
{
  return MEMORY[0x270F54AA8]();
}

uint64_t sub_25A038150()
{
  return MEMORY[0x270F54AB0]();
}

uint64_t sub_25A038160()
{
  return MEMORY[0x270F54AB8]();
}

uint64_t sub_25A038170()
{
  return MEMORY[0x270F54AC0]();
}

uint64_t sub_25A038180()
{
  return MEMORY[0x270F54AC8]();
}

uint64_t sub_25A038190()
{
  return MEMORY[0x270F54AD0]();
}

uint64_t sub_25A0381A0()
{
  return MEMORY[0x270F54CE8]();
}

uint64_t sub_25A0381B0()
{
  return MEMORY[0x270F54AD8]();
}

uint64_t sub_25A0381C0()
{
  return MEMORY[0x270F54AE0]();
}

uint64_t sub_25A0381D0()
{
  return MEMORY[0x270F54AE8]();
}

uint64_t sub_25A0381E0()
{
  return MEMORY[0x270F54AF0]();
}

uint64_t sub_25A0381F0()
{
  return MEMORY[0x270F54AF8]();
}

uint64_t sub_25A038200()
{
  return MEMORY[0x270F54B00]();
}

uint64_t sub_25A038210()
{
  return MEMORY[0x270F54B08]();
}

uint64_t sub_25A038220()
{
  return MEMORY[0x270F54B10]();
}

uint64_t sub_25A038230()
{
  return MEMORY[0x270F54B18]();
}

uint64_t sub_25A038240()
{
  return MEMORY[0x270F54B20]();
}

uint64_t sub_25A038250()
{
  return MEMORY[0x270F54B28]();
}

uint64_t sub_25A038260()
{
  return MEMORY[0x270F54B30]();
}

uint64_t sub_25A038270()
{
  return MEMORY[0x270F54B38]();
}

uint64_t sub_25A038280()
{
  return MEMORY[0x270F54B40]();
}

uint64_t sub_25A038290()
{
  return MEMORY[0x270F54B48]();
}

uint64_t sub_25A0382A0()
{
  return MEMORY[0x270F54B50]();
}

uint64_t sub_25A0382B0()
{
  return MEMORY[0x270F54B58]();
}

uint64_t sub_25A0382C0()
{
  return MEMORY[0x270F54B60]();
}

uint64_t sub_25A0382D0()
{
  return MEMORY[0x270F54B68]();
}

uint64_t sub_25A0382E0()
{
  return MEMORY[0x270F54B70]();
}

uint64_t sub_25A0382F0()
{
  return MEMORY[0x270F54B78]();
}

uint64_t sub_25A038300()
{
  return MEMORY[0x270F54B80]();
}

uint64_t sub_25A038310()
{
  return MEMORY[0x270F54B88]();
}

uint64_t sub_25A038320()
{
  return MEMORY[0x270F54B90]();
}

uint64_t sub_25A038330()
{
  return MEMORY[0x270F54B98]();
}

uint64_t sub_25A038340()
{
  return MEMORY[0x270F54BA0]();
}

uint64_t sub_25A038350()
{
  return MEMORY[0x270F54BA8]();
}

uint64_t sub_25A038360()
{
  return MEMORY[0x270F54BB0]();
}

uint64_t sub_25A038370()
{
  return MEMORY[0x270F54BB8]();
}

uint64_t sub_25A038380()
{
  return MEMORY[0x270F54BC0]();
}

uint64_t sub_25A038390()
{
  return MEMORY[0x270F54BD0]();
}

uint64_t sub_25A0383A0()
{
  return MEMORY[0x270F54BD8]();
}

uint64_t sub_25A0383B0()
{
  return MEMORY[0x270F54BF0]();
}

uint64_t sub_25A0383C0()
{
  return MEMORY[0x270F54BF8]();
}

uint64_t sub_25A0383D0()
{
  return MEMORY[0x270F54C00]();
}

uint64_t sub_25A0383E0()
{
  return MEMORY[0x270F54C10]();
}

uint64_t sub_25A0383F0()
{
  return MEMORY[0x270F54C18]();
}

uint64_t sub_25A038400()
{
  return MEMORY[0x270F54C20]();
}

uint64_t sub_25A038410()
{
  return MEMORY[0x270F54C28]();
}

uint64_t sub_25A038420()
{
  return MEMORY[0x270F54C30]();
}

uint64_t sub_25A038430()
{
  return MEMORY[0x270F54C38]();
}

uint64_t sub_25A038440()
{
  return MEMORY[0x270F54C40]();
}

uint64_t sub_25A038450()
{
  return MEMORY[0x270F54C48]();
}

uint64_t sub_25A038460()
{
  return MEMORY[0x270F54C50]();
}

uint64_t sub_25A038470()
{
  return MEMORY[0x270F54C58]();
}

uint64_t sub_25A038480()
{
  return MEMORY[0x270F54C60]();
}

uint64_t sub_25A038490()
{
  return MEMORY[0x270F54C68]();
}

uint64_t sub_25A0384A0()
{
  return MEMORY[0x270F54C70]();
}

uint64_t sub_25A0384B0()
{
  return MEMORY[0x270F54CB0]();
}

uint64_t sub_25A0384C0()
{
  return MEMORY[0x270F54CC8]();
}

uint64_t sub_25A0384D0()
{
  return MEMORY[0x270F54CD0]();
}

uint64_t sub_25A0384F0()
{
  return MEMORY[0x270F54CF0]();
}

uint64_t sub_25A038500()
{
  return MEMORY[0x270F54CF8]();
}

uint64_t sub_25A038510()
{
  return MEMORY[0x270F54D00]();
}

uint64_t sub_25A038520()
{
  return MEMORY[0x270F54D08]();
}

uint64_t sub_25A038530()
{
  return MEMORY[0x270F54D10]();
}

uint64_t sub_25A038540()
{
  return MEMORY[0x270F54D18]();
}

uint64_t sub_25A038550()
{
  return MEMORY[0x270F54D20]();
}

uint64_t sub_25A038560()
{
  return MEMORY[0x270F54D28]();
}

uint64_t sub_25A038570()
{
  return MEMORY[0x270F54D30]();
}

uint64_t sub_25A038580()
{
  return MEMORY[0x270F54D40]();
}

uint64_t sub_25A038590()
{
  return MEMORY[0x270F54D48]();
}

uint64_t sub_25A0385A0()
{
  return MEMORY[0x270F54D88]();
}

uint64_t sub_25A0385B0()
{
  return MEMORY[0x270F54D90]();
}

uint64_t sub_25A0385C0()
{
  return MEMORY[0x270F54D98]();
}

uint64_t sub_25A0385D0()
{
  return MEMORY[0x270F54DD0]();
}

uint64_t sub_25A0385E0()
{
  return MEMORY[0x270F54DD8]();
}

uint64_t sub_25A0385F0()
{
  return MEMORY[0x270F54E18]();
}

uint64_t sub_25A038600()
{
  return MEMORY[0x270F54E28]();
}

uint64_t sub_25A038610()
{
  return MEMORY[0x270F54E30]();
}

uint64_t sub_25A038620()
{
  return MEMORY[0x270F54E38]();
}

uint64_t sub_25A038630()
{
  return MEMORY[0x270F54E68]();
}

uint64_t sub_25A038640()
{
  return MEMORY[0x270F54E70]();
}

uint64_t sub_25A038650()
{
  return MEMORY[0x270F54E78]();
}

uint64_t sub_25A038660()
{
  return MEMORY[0x270F54E88]();
}

uint64_t sub_25A038670()
{
  return MEMORY[0x270F54E98]();
}

uint64_t sub_25A038680()
{
  return MEMORY[0x270F54EA0]();
}

uint64_t sub_25A038690()
{
  return MEMORY[0x270F54EA8]();
}

uint64_t sub_25A0386A0()
{
  return MEMORY[0x270F54EB0]();
}

uint64_t sub_25A0386B0()
{
  return MEMORY[0x270F54EB8]();
}

uint64_t sub_25A0386C0()
{
  return MEMORY[0x270F54EC0]();
}

uint64_t sub_25A0386D0()
{
  return MEMORY[0x270F54EC8]();
}

uint64_t sub_25A0386E0()
{
  return MEMORY[0x270F54ED0]();
}

uint64_t sub_25A0386F0()
{
  return MEMORY[0x270F54ED8]();
}

uint64_t sub_25A038700()
{
  return MEMORY[0x270F54EE0]();
}

uint64_t sub_25A038710()
{
  return MEMORY[0x270F54EE8]();
}

uint64_t sub_25A038720()
{
  return MEMORY[0x270F54EF0]();
}

uint64_t sub_25A038730()
{
  return MEMORY[0x270F54EF8]();
}

uint64_t sub_25A038740()
{
  return MEMORY[0x270F54F00]();
}

uint64_t sub_25A038750()
{
  return MEMORY[0x270F54F08]();
}

uint64_t sub_25A038760()
{
  return MEMORY[0x270F54F10]();
}

uint64_t sub_25A038770()
{
  return MEMORY[0x270F54F18]();
}

uint64_t sub_25A038780()
{
  return MEMORY[0x270F54F20]();
}

uint64_t sub_25A038790()
{
  return MEMORY[0x270F54F28]();
}

uint64_t sub_25A0387A0()
{
  return MEMORY[0x270F54F30]();
}

uint64_t sub_25A0387B0()
{
  return MEMORY[0x270F54F38]();
}

uint64_t sub_25A0387C0()
{
  return MEMORY[0x270F54F40]();
}

uint64_t sub_25A0387D0()
{
  return MEMORY[0x270F54F48]();
}

uint64_t sub_25A0387E0()
{
  return MEMORY[0x270F54F50]();
}

uint64_t sub_25A0387F0()
{
  return MEMORY[0x270F54F58]();
}

uint64_t sub_25A038800()
{
  return MEMORY[0x270F54F60]();
}

uint64_t sub_25A038810()
{
  return MEMORY[0x270F54F68]();
}

uint64_t sub_25A038820()
{
  return MEMORY[0x270F54F70]();
}

uint64_t sub_25A038830()
{
  return MEMORY[0x270F54F78]();
}

uint64_t sub_25A038840()
{
  return MEMORY[0x270F54F80]();
}

uint64_t sub_25A038850()
{
  return MEMORY[0x270F54F88]();
}

uint64_t sub_25A038860()
{
  return MEMORY[0x270F54F90]();
}

uint64_t sub_25A038870()
{
  return MEMORY[0x270F54F98]();
}

uint64_t sub_25A038880()
{
  return MEMORY[0x270F54FA0]();
}

uint64_t sub_25A038890()
{
  return MEMORY[0x270F54FA8]();
}

uint64_t sub_25A0388A0()
{
  return MEMORY[0x270F54FB0]();
}

uint64_t sub_25A0388B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25A0388C0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25A0388D0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25A0388E0()
{
  return MEMORY[0x270EF1A18]();
}

uint64_t sub_25A0388F0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25A038900()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25A038910()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25A038920()
{
  return MEMORY[0x270F54CE0]();
}

uint64_t sub_25A038930()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25A038940()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A038950()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25A038960()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25A038970()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A038980()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25A038990()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25A0389B0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25A0389C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A0389D0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25A0389E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A0389F0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25A038A00()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25A038A10()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25A038A20()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25A038A30()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A038A40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A038A50()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A038A60()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25A038A70()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25A038A80()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A038A90()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A038AA0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25A038AB0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25A038AC0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25A038AD0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25A038AE0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25A038AF0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25A038B00()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25A038B10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A038B20()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25A038B30()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A038B40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A038B50()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A038B60()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A038B70()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A038B80()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25A038B90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A038BA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A038BB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A038BC0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25A038BD0()
{
  return MEMORY[0x270F9FD98]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x270F9B6E8](*(void *)&a1);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B8C0](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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