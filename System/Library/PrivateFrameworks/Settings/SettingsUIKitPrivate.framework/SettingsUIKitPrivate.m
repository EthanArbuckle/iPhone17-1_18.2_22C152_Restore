uint64_t sub_236F36D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  long long v44;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E4FE0);
  v5 = MEMORY[0x270FA5388](v4 - 8);
  v41 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v38 - v7;
  v44 = *(_OWORD *)(a1 + 16);
  v9 = *((id *)&v44 + 1);
  v10 = sub_236F3E3E8();
  v12 = v11;
  sub_236F378C0((uint64_t)&v44);
  if (v12)
  {
    v42 = v10;
    v43 = v12;
    sub_236F37B70();
    v13 = sub_236F4E738();
    v15 = v14;
    v17 = v16 & 1;
    sub_236F4E6D8();
    v18 = sub_236F4E728();
    v38 = v9;
    v39 = a1;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v40 = v8;
    swift_release();
    sub_236F37B60(v13, v15, v17);
    swift_bridgeObjectRelease();
    sub_236F4E818();
    v24 = sub_236F4E708();
    v12 = v25;
    v27 = v26;
    v29 = v28;
    swift_release();
    v30 = v27 & 1;
    v31 = v19;
    v32 = v21;
    v9 = v38;
    a1 = v39;
    sub_236F37B60(v31, v32, v23 & 1);
    v8 = v40;
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = 0;
    v30 = 0;
    v29 = 0;
  }
  if (sub_236F379D8((uint64_t)v9, *(id *)(a1 + 40)))
  {
    sub_236F37000((uint64_t)v8);
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E4FE8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v8, 0, 1, v33);
  }
  else
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E4FE8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v8, 1, 1, v34);
  }
  v35 = v41;
  sub_236F37BCC((uint64_t)v8, v41, &qword_2688E4FE0);
  *(void *)a2 = v24;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = v30;
  *(void *)(a2 + 24) = v29;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E4FF0);
  sub_236F37BCC(v35, a2 + *(int *)(v36 + 64), &qword_2688E4FE0);
  sub_236F37AC8(v24, v12, v30, v29);
  sub_236F37E78((uint64_t)v8, &qword_2688E4FE0);
  sub_236F37E78(v35, &qword_2688E4FE0);
  return sub_236F37B1C(v24, v12, v30, v29);
}

uint64_t sub_236F37000@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v29 = sub_236F4E558();
  uint64_t v32 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  v30 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5000);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_236F4E8A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5008);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  v13 = (uint64_t *)((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5010);
  MEMORY[0x270FA5388](v14);
  v27 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_236F4E878();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B540], v6);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  uint64_t *v5 = KeyPath;
  sub_236F37BCC((uint64_t)v5, (uint64_t)v13 + *(int *)(v11 + 44), &qword_2688E5000);
  uint64_t *v13 = v16;
  swift_retain();
  sub_236F37E78((uint64_t)v5, &qword_2688E5000);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v18 = (uint64_t)v27;
  swift_release();
  uint64_t v19 = sub_236F4E808();
  uint64_t v20 = swift_getKeyPath();
  sub_236F37BCC((uint64_t)v13, v18, &qword_2688E5008);
  v21 = (uint64_t *)(v18 + *(int *)(v14 + 36));
  uint64_t *v21 = v20;
  v21[1] = v19;
  sub_236F37E78((uint64_t)v13, &qword_2688E5008);
  if (sub_236F379D8(*(void *)(v28 + 24), *(id *)(v28 + 40)))
  {
    v22 = v30;
    sub_236F4E538();
    uint64_t v23 = v29;
  }
  else
  {
    uint64_t v33 = MEMORY[0x263F8EE78];
    sub_236F37C30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5020);
    sub_236F38010(&qword_2688E5028, &qword_2688E5020);
    uint64_t v24 = v29;
    v22 = v30;
    sub_236F4EAD8();
    uint64_t v23 = v24;
  }
  sub_236F37CD0();
  sub_236F4E798();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v23);
  return sub_236F37E78(v18, &qword_2688E5010);
}

uint64_t sub_236F37438()
{
  return sub_236F4E7A8();
}

uint64_t sub_236F37454@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E4FC8);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = v1[1];
  v13[0] = *v1;
  v13[1] = v6;
  v13[2] = v1[2];
  *(void *)v5 = sub_236F4E518();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E4FD0);
  sub_236F36D04((uint64_t)v13, (uint64_t)&v5[*(int *)(v7 + 44)]);
  uint64_t v8 = *(void *)&v13[0];
  char v9 = BYTE8(v13[0]);
  sub_236F375F0(*(uint64_t *)&v13[0], SBYTE8(v13[0]));
  char v10 = sub_236F3DCEC(v8, v9);
  sub_236F37644(v8, v9);
  if (v10) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.5;
  }
  sub_236F37BCC((uint64_t)v5, a1, &qword_2688E4FC8);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E4FD8) + 36)) = v11;
  return sub_236F37E78((uint64_t)v5, &qword_2688E4FC8);
}

void *sub_236F3758C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_236F3759C(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_236F375A8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t initializeBufferWithCopyOfBuffer for SUIKPCheckmarkCell(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_236F375F0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

void destroy for SUIKPCheckmarkCell(uint64_t a1)
{
  sub_236F37644(*(void *)a1, *(unsigned char *)(a1 + 8));

  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t sub_236F37644(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for SUIKPCheckmarkCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_236F375F0(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  long long v6 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  id v9 = v6;
  id v10 = v8;
  return a1;
}

uint64_t assignWithCopy for SUIKPCheckmarkCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_236F375F0(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_236F37644(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v8 = *(void **)(a2 + 24);
  id v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;
  id v10 = v8;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  double v11 = *(void **)(a2 + 40);
  uint64_t v12 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v11;
  id v13 = v11;

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

uint64_t assignWithTake for SUIKPCheckmarkCell(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_236F37644(v6, v7);
  uint64_t v8 = a2[3];
  id v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;

  uint64_t v10 = a2[5];
  double v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v10;

  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPCheckmarkCell(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SUIKPCheckmarkCell(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SUIKPCheckmarkCell()
{
  return &type metadata for SUIKPCheckmarkCell;
}

uint64_t sub_236F37860()
{
  return swift_getOpaqueTypeConformance2();
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

uint64_t sub_236F378C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_236F378EC()
{
  return sub_236F4E428();
}

uint64_t sub_236F37910(uint64_t a1)
{
  uint64_t v2 = sub_236F4E8A8();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_236F4E438();
}

id sub_236F379D8(uint64_t a1, id a2)
{
  if (objc_msgSend(a2, sel_propertyForKey_, *MEMORY[0x263F60200]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_236F37E10((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_236F37E78((uint64_t)v7, &qword_2688E5058);
    return 0;
  }
  sub_236F37ED4();
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v3 = objc_msgSend(v5, sel_isEqualToSpecifier_, a1);

  return v3;
}

uint64_t sub_236F37AC8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_236F37B0C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_236F37B0C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_236F37B1C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_236F37B60(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_236F37B60(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_236F37B70()
{
  unint64_t result = qword_2688E4FF8;
  if (!qword_2688E4FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E4FF8);
  }
  return result;
}

uint64_t sub_236F37BCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_236F37C30()
{
  unint64_t result = qword_2688E5018;
  if (!qword_2688E5018)
  {
    sub_236F4E558();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5018);
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

unint64_t sub_236F37CD0()
{
  unint64_t result = qword_2688E5030;
  if (!qword_2688E5030)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5010);
    sub_236F37D70();
    sub_236F38010(&qword_2688E5048, &qword_2688E5050);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5030);
  }
  return result;
}

unint64_t sub_236F37D70()
{
  unint64_t result = qword_2688E5038;
  if (!qword_2688E5038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5008);
    sub_236F38010(&qword_2688E5040, &qword_2688E5000);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5038);
  }
  return result;
}

uint64_t sub_236F37E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5058);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236F37E78(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_236F37ED4()
{
  unint64_t result = qword_2688E5060;
  if (!qword_2688E5060)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688E5060);
  }
  return result;
}

void type metadata accessor for PSTableCellType()
{
  if (!qword_2688E5068)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2688E5068);
    }
  }
}

unint64_t sub_236F37F70()
{
  unint64_t result = qword_2688E5070;
  if (!qword_2688E5070)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E4FD8);
    sub_236F38010(&qword_2688E5078, &qword_2688E4FC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5070);
  }
  return result;
}

uint64_t sub_236F38010(unint64_t *a1, uint64_t *a2)
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

void destroy for SUIKPSecureTextFieldCell(uint64_t a1)
{
  sub_236F37644(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for SUIKPSecureTextFieldCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_236F375F0(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for SUIKPSecureTextFieldCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_236F375F0(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_236F37644(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v8 = *(void **)(a2 + 24);
  id v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;
  id v10 = v8;

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

uint64_t assignWithTake for SUIKPSecureTextFieldCell(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_236F37644(v6, v7);
  uint64_t v8 = a2[3];
  id v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;

  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPSecureTextFieldCell(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SUIKPSecureTextFieldCell(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SUIKPSecureTextFieldCell()
{
  return &type metadata for SUIKPSecureTextFieldCell;
}

uint64_t sub_236F38258()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F38274@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5140);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5148);
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a3, sel_cellType) == (id)12)
  {
    *(void *)id v10 = sub_236F4E518();
    *((void *)v10 + 1) = 0;
    v10[16] = 1;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5150);
    char v15 = a2 & 1;
    sub_236F38560(a3, (uint64_t)&v10[*(int *)(v14 + 44)]);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v17 = sub_236F4E9A8();
    uint64_t v19 = v18;
    sub_236F37BCC((uint64_t)v10, (uint64_t)v13, &qword_2688E5140);
    uint64_t v20 = (uint64_t *)&v13[*(int *)(v11 + 36)];
    *uint64_t v20 = KeyPath;
    v20[1] = v17;
    v20[2] = v19;
    sub_236F37E78((uint64_t)v10, &qword_2688E5140);
    sub_236F375F0(a1, v15);
    LOBYTE(v17) = sub_236F3DCEC(a1, v15);
    sub_236F37644(a1, v15);
    if (v17) {
      double v21 = 1.0;
    }
    else {
      double v21 = 0.5;
    }
    sub_236F37BCC((uint64_t)v13, a4, &qword_2688E5148);
    *(double *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E5158) + 36)) = v21;
    return sub_236F37E78((uint64_t)v13, &qword_2688E5148);
  }
  else
  {
    v23[2] = 0;
    v23[3] = 0xE000000000000000;
    sub_236F4EB28();
    sub_236F4E9E8();
    v23[1] = objc_msgSend(a3, sel_cellType);
    type metadata accessor for PSTableCellType();
    sub_236F4EBB8();
    sub_236F4E9E8();
    uint64_t result = sub_236F4EBD8();
    __break(1u);
  }
  return result;
}

uint64_t sub_236F38560@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5160);
  uint64_t v54 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  v50 = &v47[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5168);
  uint64_t v56 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  v53 = &v47[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5170);
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  v55 = &v47[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5178);
  uint64_t v62 = *(void *)(v8 - 8);
  uint64_t v63 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v61 = &v47[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  v66 = &v47[-v11];
  id v12 = a1;
  uint64_t v13 = sub_236F3E3E8();
  uint64_t v15 = v14;

  if (v15)
  {
    uint64_t v67 = v13;
    uint64_t v68 = v15;
    sub_236F37B70();
    uint64_t v16 = sub_236F4E738();
    uint64_t v18 = v17;
    char v20 = v19 & 1;
    sub_236F4E6D8();
    uint64_t v65 = sub_236F4E728();
    uint64_t v51 = v22;
    uint64_t v52 = v21;
    char v24 = v23;
    swift_release();
    uint64_t v64 = v24 & 1;
    sub_236F37B60(v16, v18, v20);
    swift_bridgeObjectRelease();
    LOBYTE(v49) = sub_236F4E6C8();
    uint64_t v49 = v49;
    int v48 = 1;
  }
  else
  {
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v49 = 0;
    int v48 = 0;
  }
  sub_236F4E528();
  id v25 = v12;
  sub_236F3E548();

  uint64_t v26 = v50;
  sub_236F4E3E8();
  objc_msgSend(v25, sel_suikp_keyboardType);
  uint64_t v27 = sub_236F38010(&qword_2688E5180, &qword_2688E5160);
  uint64_t v28 = v53;
  uint64_t v29 = v57;
  sub_236F4E778();
  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v26, v29);
  objc_msgSend(v25, sel_suikp_autoCapsType);
  uint64_t v67 = v29;
  uint64_t v68 = v27;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = v55;
  uint64_t v32 = v60;
  sub_236F4E7B8();
  (*(void (**)(unsigned char *, uint64_t))(v56 + 8))(v28, v32);
  BOOL v33 = objc_msgSend(v25, sel_suikp_autoCorrectionType) == (id)1;
  uint64_t v67 = v32;
  uint64_t v68 = OpaqueTypeConformance2;
  uint64_t v34 = swift_getOpaqueTypeConformance2();
  v35 = v61;
  uint64_t v36 = v59;
  MEMORY[0x237E11230](v33, v59, v34);
  (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v31, v36);
  uint64_t v38 = v62;
  uint64_t v37 = v63;
  v39 = v66;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v62 + 32))(v66, v35, v63);
  v40 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v38 + 16);
  v40(v35, v39, v37);
  uint64_t v42 = v51;
  uint64_t v41 = v52;
  *(void *)a2 = v65;
  *(void *)(a2 + 8) = v41;
  *(void *)(a2 + 16) = v64;
  *(void *)(a2 + 24) = v42;
  *(void *)(a2 + 32) = v49;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(unsigned char *)(a2 + 72) = v48;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5188);
  v40((unsigned char *)(a2 + *(int *)(v43 + 48)), v35, v37);
  LOBYTE(v33) = v64;
  uint64_t v44 = v65;
  sub_236F37AC8(v65, v41, v64, v42);
  v45 = *(void (**)(unsigned char *, uint64_t))(v38 + 8);
  v45(v66, v37);
  v45(v35, v37);
  return sub_236F37B1C(v44, v41, v33, v42);
}

uint64_t sub_236F38BBC@<X0>(uint64_t a1@<X8>)
{
  return sub_236F38274(*(void *)v1, *(unsigned char *)(v1 + 8), *(void **)(v1 + 24), a1);
}

uint64_t sub_236F38BD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236F4E488();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_236F38C04()
{
  return sub_236F4E498();
}

unint64_t sub_236F38C48()
{
  unint64_t result = qword_2688E5190;
  if (!qword_2688E5190)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5158);
    sub_236F38CC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5190);
  }
  return result;
}

unint64_t sub_236F38CC4()
{
  unint64_t result = qword_2688E5198;
  if (!qword_2688E5198)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5148);
    sub_236F38010(&qword_2688E51A0, &qword_2688E5140);
    sub_236F38010(&qword_2688E51A8, &qword_2688E51B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5198);
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPSliderCell()
{
  return &type metadata for SUIKPSliderCell;
}

uint64_t sub_236F38D98()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_236F38DB4(void *a1@<X3>, char *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51D0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v43 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51D8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a1;
  uint64_t v13 = (void *)sub_236F3E6B4();

  uint64_t v14 = (unsigned int *)MEMORY[0x263F1B4F8];
  if (v13)
  {
    id v15 = v13;
    sub_236F4E868();
    uint64_t v16 = *v14;
    uint64_t v17 = sub_236F4E898();
    uint64_t v18 = *(void *)(v17 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v11, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
    uint64_t v13 = (void *)sub_236F4E888();

    swift_release();
    sub_236F37E78((uint64_t)v11, &qword_2688E51D8);
  }
  id v19 = v12;
  double v20 = sub_236F3E7C8();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  double v25 = v20;

  uint64_t v46 = v22;
  uint64_t v47 = v24;
  double v48 = v25;
  id v26 = v19;
  double v27 = sub_236F3E91C();

  id v28 = v26;
  double v29 = sub_236F3EA4C();

  if (v27 > v29)
  {
    __break(1u);
  }
  else
  {
    double v44 = v27;
    double v45 = v29;
    sub_236F39394();
    sub_236F4E8E8();
    id v30 = v28;
    uint64_t v31 = (void *)sub_236F3E6B4();

    if (v31)
    {
      id v32 = v31;
      sub_236F4E868();
      uint64_t v33 = *MEMORY[0x263F1B4F8];
      uint64_t v34 = sub_236F4E898();
      uint64_t v35 = *(void *)(v34 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 104))(v11, v33, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v11, 0, 1, v34);
      uint64_t v31 = (void *)sub_236F4E888();

      swift_release();
      sub_236F37E78((uint64_t)v11, &qword_2688E51D8);
    }
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    uint64_t v37 = v43;
    v36(v43, v8, v3);
    uint64_t v38 = v42;
    *(void *)uint64_t v42 = v13;
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51E8);
    v36(&v38[*(int *)(v39 + 48)], v37, v3);
    *(void *)&v38[*(int *)(v39 + 64)] = v31;
    v40 = *(void (**)(char *, uint64_t))(v4 + 8);
    swift_retain();
    swift_retain();
    v40(v8, v3);
    swift_release();
    v40(v37, v3);
    swift_release();
  }
}

uint64_t sub_236F391F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51B8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)v1;
  char v7 = *(unsigned char *)(v1 + 8);
  uint64_t v8 = *(void **)(v1 + 24);
  *(void *)uint64_t v5 = sub_236F4E518();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51C0);
  sub_236F38DB4(v8, &v5[*(int *)(v9 + 44)]);
  sub_236F375F0(v6, v7);
  LOBYTE(v8) = sub_236F3DCEC(v6, v7);
  sub_236F37644(v6, v7);
  if (v8) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.5;
  }
  sub_236F3932C((uint64_t)v5, a1);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E51C8) + 36)) = v10;
  return sub_236F37E78((uint64_t)v5, &qword_2688E51B8);
}

uint64_t sub_236F3932C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_236F39394()
{
  unint64_t result = qword_2688E51E0;
  if (!qword_2688E51E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E51E0);
  }
  return result;
}

unint64_t sub_236F393EC()
{
  unint64_t result = qword_2688E51F0;
  if (!qword_2688E51F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E51C8);
    sub_236F39468();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E51F0);
  }
  return result;
}

unint64_t sub_236F39468()
{
  unint64_t result = qword_2688E51F8;
  if (!qword_2688E51F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E51B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E51F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPSubtitleCell()
{
  return &type metadata for SUIKPSubtitleCell;
}

uint64_t sub_236F394D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F394F0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v108 = a3;
  LODWORD(v106) = a2;
  uint64_t v107 = a1;
  uint64_t v111 = a5;
  uint64_t v102 = sub_236F4E608();
  uint64_t v101 = *(void *)(v102 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v102);
  v100 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v99 = (char *)&v95 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5218);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v110 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v113 = (uint64_t)&v95 - v12;
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5220);
  MEMORY[0x270FA5388](v98);
  v103 = (char *)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5228);
  uint64_t v104 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5230);
  uint64_t v17 = MEMORY[0x270FA5388](v105);
  id v19 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v95 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5238);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (uint64_t *)((char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51D8);
  MEMORY[0x270FA5388](v25 - 8);
  double v27 = (char *)&v95 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5240);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v114 = (uint64_t)&v95 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  id v32 = (char *)&v95 - v31;
  id v33 = a4;
  uint64_t v34 = (void *)sub_236F3EB7C();

  v109 = v33;
  if (v34)
  {
    id v35 = v34;
    sub_236F4E868();
    uint64_t v36 = *MEMORY[0x263F1B4F8];
    uint64_t v37 = sub_236F4E898();
    uint64_t v38 = *(void *)(v37 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 104))(v27, v36, v37);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v27, 0, 1, v37);
    uint64_t v39 = sub_236F4E888();
    swift_release();
    sub_236F37E78((uint64_t)v27, &qword_2688E51D8);
    *uint64_t v24 = v39;
    swift_storeEnumTagMultiPayload();
    sub_236F3A71C();
    swift_retain();
    sub_236F4E5D8();
    swift_release();

    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v32, 0, 1, v40);
    uint64_t v41 = (uint64_t)v32;
    goto LABEL_7;
  }
  v96 = v16;
  uint64_t v42 = v104;
  uint64_t v97 = v22;
  id v43 = v33;
  char v44 = sub_236F3EC54();

  if ((v44 & 1) == 0)
  {
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
    uint64_t v41 = (uint64_t)v32;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v32, 1, 1, v46);
    goto LABEL_7;
  }
  id v45 = objc_msgSend(v43, sel_propertyForKey_, *MEMORY[0x263F60158]);
  v95 = v21;
  if (v45)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v115 = 0u;
    long long v116 = 0u;
  }
  uint64_t v76 = v14;
  sub_236F3A828((uint64_t)&v115, (uint64_t)v117, &qword_2688E5058);
  uint64_t v77 = (uint64_t)v24;
  if (!v118)
  {
    sub_236F37E78((uint64_t)v117, &qword_2688E5058);
    uint64_t v78 = v42;
LABEL_18:
    if (objc_msgSend(v43, sel_propertyForKey_, *MEMORY[0x263F60188], v95))
    {
      sub_236F4EAC8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v115 = 0u;
      long long v116 = 0u;
    }
    v84 = v103;
    sub_236F3A828((uint64_t)&v115, (uint64_t)v117, &qword_2688E5058);
    if (v118)
    {
      if (swift_dynamicCast())
      {
        uint64_t v79 = (uint64_t)v19;
        id v85 = objc_allocWithZone(MEMORY[0x263F4B540]);
        v86 = (void *)sub_236F4E988();
        swift_bridgeObjectRelease();
        objc_msgSend(v85, sel_initWithBundleIdentifier_, v86);

        if (qword_2688E4F40 != -1) {
          swift_once();
        }
        id v87 = (id)qword_2688E62F0;
        v83 = v96;
        sub_236F4E338();
        (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v84, v83, v76);
        swift_storeEnumTagMultiPayload();
        sub_236F38010(&qword_2688E5280, &qword_2688E5228);
        goto LABEL_26;
      }
    }
    else
    {
      sub_236F37E78((uint64_t)v117, &qword_2688E5058);
    }
    uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5268);
    uint64_t v92 = (uint64_t)v95;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v95, 1, 1, v91);
    uint64_t v41 = (uint64_t)v32;
    uint64_t v90 = v92;
    goto LABEL_29;
  }
  uint64_t v78 = v42;
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v79 = (uint64_t)v19;
  id v80 = objc_allocWithZone(MEMORY[0x263F4B540]);
  v81 = (void *)sub_236F4E988();
  swift_bridgeObjectRelease();
  objc_msgSend(v80, sel_initWithType_, v81);

  if (qword_2688E4F40 != -1) {
    swift_once();
  }
  id v82 = (id)qword_2688E62F0;
  v83 = v96;
  sub_236F4E338();
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v103, v83, v76);
  swift_storeEnumTagMultiPayload();
  sub_236F38010(&qword_2688E5280, &qword_2688E5228);
LABEL_26:
  sub_236F4E5D8();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v83, v76);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5268);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v79, 0, 1, v88);
  uint64_t v89 = (uint64_t)v95;
  sub_236F3A828(v79, (uint64_t)v95, &qword_2688E5230);
  uint64_t v41 = (uint64_t)v32;
  uint64_t v90 = v89;
LABEL_29:
  sub_236F37BCC(v90, v77, &qword_2688E5230);
  swift_storeEnumTagMultiPayload();
  sub_236F3A71C();
  uint64_t v93 = v114;
  sub_236F4E5D8();
  sub_236F37E78(v90, &qword_2688E5230);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v93, 0, 1, v94);
  sub_236F3A828(v93, v41, &qword_2688E5240);
LABEL_7:
  uint64_t v47 = sub_236F4E588();
  double v48 = v109;
  sub_236F3A37C(v109, v117);
  uint64_t v107 = v117[0];
  uint64_t v106 = v117[1];
  uint64_t v104 = v117[2];
  v103 = v118;
  uint64_t v49 = v120;
  uint64_t v105 = v119;
  uint64_t v50 = v121;
  uint64_t v108 = v122;
  id v51 = objc_msgSend(v48, sel_buttonAction);
  uint64_t v52 = (uint64_t)v110;
  uint64_t v53 = v113;
  uint64_t v112 = v41;
  if (v51)
  {
    uint64_t v98 = v50;
    uint64_t v54 = v99;
    sub_236F4E5F8();
    LOBYTE(v117[0]) = 1;
    v109 = v49;
    uint64_t v55 = v101;
    uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
    uint64_t v57 = v100;
    uint64_t v58 = v102;
    v56(v100, v54, v102);
    char v59 = v117[0];
    *(void *)uint64_t v52 = 0;
    *(unsigned char *)(v52 + 8) = v59;
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5260);
    v56((char *)(v52 + *(int *)(v60 + 48)), v57, v58);
    v61 = *(void (**)(char *, uint64_t))(v55 + 8);
    uint64_t v50 = v98;
    v61(v54, v58);
    v61(v57, v58);
    uint64_t v41 = v112;
    uint64_t v49 = v109;
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5250);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v52, 0, 1, v62);
    sub_236F3A828(v52, v53, &qword_2688E5218);
  }
  else
  {
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5250);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v53, 1, 1, v63);
  }
  uint64_t v64 = v114;
  sub_236F37BCC(v41, v114, &qword_2688E5240);
  sub_236F37BCC(v53, v52, &qword_2688E5218);
  uint64_t v65 = v52;
  uint64_t v66 = v111;
  sub_236F37BCC(v64, v111, &qword_2688E5240);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5258);
  uint64_t v68 = v66 + *(int *)(v67 + 48);
  *(void *)uint64_t v68 = v47;
  *(void *)(v68 + 8) = 0;
  *(unsigned char *)(v68 + 16) = 1;
  uint64_t v69 = v107;
  uint64_t v70 = v106;
  *(void *)(v68 + 24) = v107;
  *(void *)(v68 + 32) = v70;
  char v71 = v104;
  uint64_t v72 = (uint64_t)v103;
  *(void *)(v68 + 40) = v104;
  *(void *)(v68 + 48) = v72;
  uint64_t v73 = v105;
  *(void *)(v68 + 56) = v105;
  *(void *)(v68 + 64) = v49;
  uint64_t v74 = v108;
  *(void *)(v68 + 72) = v50;
  *(void *)(v68 + 80) = v74;
  sub_236F37BCC(v65, v66 + *(int *)(v67 + 64), &qword_2688E5218);
  sub_236F37AC8(v69, v70, v71, v72);
  sub_236F37AC8(v73, (uint64_t)v49, v50, v74);
  sub_236F37E78(v113, &qword_2688E5218);
  sub_236F37E78(v112, &qword_2688E5240);
  sub_236F37E78(v65, &qword_2688E5218);
  sub_236F37B1C(v69, v70, v71, v72);
  sub_236F37B1C(v73, (uint64_t)v49, v50, v74);
  return sub_236F37E78(v114, &qword_2688E5240);
}

uint64_t sub_236F3A37C@<X0>(void *a1@<X3>, uint64_t *a2@<X8>)
{
  id v3 = a1;
  sub_236F3E3E8();
  uint64_t v5 = v4;

  if (v5)
  {
    sub_236F37B70();
    uint64_t v6 = sub_236F4E738();
    uint64_t v8 = v7;
    char v10 = v9 & 1;
    sub_236F4E6D8();
    uint64_t v5 = sub_236F4E728();
    uint64_t v12 = v11;
    char v14 = v13;
    uint64_t v42 = v15;
    swift_release();
    uint64_t v16 = v14 & 1;
    sub_236F37B60(v6, v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v16 = 0;
    uint64_t v42 = 0;
  }
  id v17 = v3;
  sub_236F3ED60();
  uint64_t v19 = v18;

  if (v19)
  {
    sub_236F37B70();
    uint64_t v20 = sub_236F4E738();
    uint64_t v22 = v21;
    char v24 = v23 & 1;
    sub_236F4E828();
    uint64_t v25 = sub_236F4E708();
    uint64_t v40 = v12;
    uint64_t v41 = v5;
    uint64_t v27 = v26;
    char v29 = v28;
    swift_release();
    sub_236F37B60(v20, v22, v24);
    swift_bridgeObjectRelease();
    sub_236F4E6E8();
    uint64_t v30 = sub_236F4E728();
    uint64_t v19 = v31;
    char v33 = v32;
    uint64_t v35 = v34;
    swift_release();
    uint64_t v36 = v33 & 1;
    uint64_t v37 = v27;
    char v38 = v29 & 1;
    uint64_t v12 = v40;
    uint64_t v5 = v41;
    sub_236F37B60(v25, v37, v38);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v36 = 0;
    uint64_t v35 = 0;
  }
  *a2 = v5;
  a2[1] = v12;
  a2[2] = v16;
  a2[3] = v42;
  a2[4] = v30;
  a2[5] = v19;
  a2[6] = v36;
  a2[7] = v35;
  sub_236F37AC8(v5, v12, v16, v42);
  sub_236F37AC8(v30, v19, v36, v35);
  sub_236F37B1C(v30, v19, v36, v35);
  return sub_236F37B1C(v5, v12, v16, v42);
}

uint64_t sub_236F3A5DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5200);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)v1;
  int v7 = *(unsigned __int8 *)(v1 + 8);
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v8 = *(void **)(v1 + 24);
  *(void *)uint64_t v5 = sub_236F4E518();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5208);
  sub_236F394F0(v6, v7, v9, v8, (uint64_t)&v5[*(int *)(v10 + 44)]);
  sub_236F375F0(v6, v7);
  LOBYTE(v8) = sub_236F3DCEC(v6, v7);
  sub_236F37644(v6, v7);
  if (v8) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.5;
  }
  sub_236F37BCC((uint64_t)v5, a1, &qword_2688E5200);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E5210) + 36)) = v11;
  return sub_236F37E78((uint64_t)v5, &qword_2688E5200);
}

unint64_t sub_236F3A71C()
{
  unint64_t result = qword_2688E5270;
  if (!qword_2688E5270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5230);
    sub_236F3A790();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5270);
  }
  return result;
}

unint64_t sub_236F3A790()
{
  unint64_t result = qword_2688E5278;
  if (!qword_2688E5278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5268);
    sub_236F38010(&qword_2688E5280, &qword_2688E5228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5278);
  }
  return result;
}

uint64_t sub_236F3A828(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_236F3A890()
{
  unint64_t result = qword_2688E5288;
  if (!qword_2688E5288)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5210);
    sub_236F38010(&qword_2688E5290, &qword_2688E5200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5288);
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPTextFieldCell()
{
  return &type metadata for SUIKPTextFieldCell;
}

uint64_t sub_236F3A940()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F3A95C@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5298);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a3, sel_cellType) == (id)8)
  {
    *(void *)uint64_t v10 = sub_236F4E518();
    *((void *)v10 + 1) = 0;
    v10[16] = 1;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E52A0);
    char v12 = a2 & 1;
    sub_236F3AB80(a3, (uint64_t)&v10[*(int *)(v11 + 44)]);
    sub_236F375F0(a1, v12);
    char v13 = sub_236F3DCEC(a1, v12);
    sub_236F37644(a1, v12);
    if (v13) {
      double v14 = 1.0;
    }
    else {
      double v14 = 0.5;
    }
    sub_236F3B20C((uint64_t)v10, a4);
    *(double *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E52A8) + 36)) = v14;
    return sub_236F3B274((uint64_t)v10);
  }
  else
  {
    v16[2] = 0;
    v16[3] = 0xE000000000000000;
    sub_236F4EB28();
    sub_236F4E9E8();
    v16[1] = objc_msgSend(a3, sel_cellType);
    type metadata accessor for PSTableCellType();
    sub_236F4EBB8();
    sub_236F4E9E8();
    uint64_t result = sub_236F4EBD8();
    __break(1u);
  }
  return result;
}

uint64_t sub_236F3AB80@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E52B0);
  uint64_t v54 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v50 = &v47[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E52B8);
  uint64_t v56 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v53 = &v47[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E52C0);
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v55 = &v47[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E52C8);
  uint64_t v62 = *(void *)(v8 - 8);
  uint64_t v63 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v61 = &v47[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v66 = &v47[-v11];
  id v12 = a1;
  uint64_t v13 = sub_236F3E3E8();
  uint64_t v15 = v14;

  if (v15)
  {
    uint64_t v67 = v13;
    uint64_t v68 = v15;
    sub_236F37B70();
    uint64_t v16 = sub_236F4E738();
    uint64_t v18 = v17;
    char v20 = v19 & 1;
    sub_236F4E6D8();
    uint64_t v65 = sub_236F4E728();
    uint64_t v51 = v22;
    uint64_t v52 = v21;
    char v24 = v23;
    swift_release();
    uint64_t v64 = v24 & 1;
    sub_236F37B60(v16, v18, v20);
    swift_bridgeObjectRelease();
    LOBYTE(v49) = sub_236F4E6C8();
    uint64_t v49 = v49;
    int v48 = 1;
  }
  else
  {
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v49 = 0;
    int v48 = 0;
  }
  sub_236F4E528();
  id v25 = v12;
  sub_236F3E548();

  uint64_t v26 = v50;
  sub_236F4E968();
  objc_msgSend(v25, sel_suikp_keyboardType);
  uint64_t v27 = sub_236F38010(&qword_2688E52D0, &qword_2688E52B0);
  char v28 = v53;
  uint64_t v29 = v57;
  sub_236F4E778();
  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v26, v29);
  objc_msgSend(v25, sel_suikp_autoCapsType);
  uint64_t v67 = v29;
  uint64_t v68 = v27;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = v55;
  uint64_t v32 = v60;
  sub_236F4E7B8();
  (*(void (**)(unsigned char *, uint64_t))(v56 + 8))(v28, v32);
  BOOL v33 = objc_msgSend(v25, sel_suikp_autoCorrectionType) == (id)1;
  uint64_t v67 = v32;
  uint64_t v68 = OpaqueTypeConformance2;
  uint64_t v34 = swift_getOpaqueTypeConformance2();
  uint64_t v35 = v61;
  uint64_t v36 = v59;
  MEMORY[0x237E11230](v33, v59, v34);
  (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v31, v36);
  uint64_t v38 = v62;
  uint64_t v37 = v63;
  uint64_t v39 = v66;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v62 + 32))(v66, v35, v63);
  uint64_t v40 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v38 + 16);
  v40(v35, v39, v37);
  uint64_t v42 = v51;
  uint64_t v41 = v52;
  *(void *)a2 = v65;
  *(void *)(a2 + 8) = v41;
  *(void *)(a2 + 16) = v64;
  *(void *)(a2 + 24) = v42;
  *(void *)(a2 + 32) = v49;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(unsigned char *)(a2 + 72) = v48;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E52D8);
  v40((unsigned char *)(a2 + *(int *)(v43 + 48)), v35, v37);
  LOBYTE(v33) = v64;
  uint64_t v44 = v65;
  sub_236F37AC8(v65, v41, v64, v42);
  id v45 = *(void (**)(unsigned char *, uint64_t))(v38 + 8);
  v45(v66, v37);
  v45(v35, v37);
  return sub_236F37B1C(v44, v41, v33, v42);
}

uint64_t sub_236F3B1F4@<X0>(uint64_t a1@<X8>)
{
  return sub_236F3A95C(*(void *)v1, *(unsigned char *)(v1 + 8), *(void **)(v1 + 24), a1);
}

uint64_t sub_236F3B20C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236F3B274(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5298);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_236F3B2D8()
{
  unint64_t result = qword_2688E52E0;
  if (!qword_2688E52E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E52A8);
    sub_236F38010(&qword_2688E52E8, &qword_2688E5298);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E52E0);
  }
  return result;
}

uint64_t sub_236F3B378@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v109 = a2;
  uint64_t v101 = sub_236F4E608();
  uint64_t v102 = *(void *)(v101 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v101);
  uint64_t v104 = (char *)&v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v103 = (char *)&v96 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5218);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  long long v115 = (uint64_t *)((char *)&v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v116 = (uint64_t)&v96 - v9;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5310);
  uint64_t v10 = MEMORY[0x270FA5388](v111);
  v117 = (uint64_t (**)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))((char *)&v96
                                                                          - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v108 = (char *)&v96 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5220);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5228);
  uint64_t v100 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5230);
  uint64_t v19 = MEMORY[0x270FA5388](v106);
  uint64_t v21 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  char v23 = (char *)&v96 - v22;
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5238);
  MEMORY[0x270FA5388](v107);
  uint64_t v105 = (uint64_t *)((char *)&v96 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51D8);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v96 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5240);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v113 = (uint64_t)&v96 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v96 - v31;
  v110 = a1;
  long long v123 = *((_OWORD *)a1 + 1);
  id v33 = *((id *)&v123 + 1);
  uint64_t v34 = (void *)sub_236F3EB7C();
  sub_236F378C0((uint64_t)&v123);
  uint64_t v114 = v32;
  id v112 = v33;
  if (v34)
  {
    id v35 = v34;
    sub_236F4E868();
    uint64_t v36 = *MEMORY[0x263F1B4F8];
    uint64_t v37 = sub_236F4E898();
    uint64_t v38 = *(void *)(v37 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 104))(v27, v36, v37);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v27, 0, 1, v37);
    uint64_t v39 = sub_236F4E888();
    swift_release();
    sub_236F37E78((uint64_t)v27, &qword_2688E51D8);
    *uint64_t v105 = v39;
    swift_storeEnumTagMultiPayload();
    sub_236F3A71C();
    swift_retain();
    sub_236F4E5D8();
    swift_release();

    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v32, 0, 1, v40);
LABEL_7:
    uint64_t v45 = (uint64_t)v108;
    goto LABEL_8;
  }
  uint64_t v97 = v18;
  uint64_t v98 = v15;
  uint64_t v41 = v100;
  v99 = v23;
  id v42 = v33;
  char v43 = sub_236F3EC54();
  sub_236F378C0((uint64_t)&v123);
  if ((v43 & 1) == 0)
  {
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v114, 1, 1, v44);
    goto LABEL_7;
  }
  if (objc_msgSend(v42, sel_propertyForKey_, *MEMORY[0x263F60158]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v118 = 0u;
    long long v119 = 0u;
  }
  uint64_t v75 = (uint64_t)v21;
  sub_236F3A828((uint64_t)&v118, (uint64_t)&v120, &qword_2688E5058);
  uint64_t v76 = v16;
  if (!v122)
  {
    sub_236F37E78((uint64_t)&v120, &qword_2688E5058);
    uint64_t v77 = v41;
LABEL_19:
    if (objc_msgSend(v42, sel_propertyForKey_, *MEMORY[0x263F60188]))
    {
      sub_236F4EAC8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v118 = 0u;
      long long v119 = 0u;
    }
    uint64_t v83 = (uint64_t)v99;
    v84 = v98;
    sub_236F3A828((uint64_t)&v118, (uint64_t)&v120, &qword_2688E5058);
    if (v122)
    {
      if (swift_dynamicCast())
      {
        id v85 = objc_allocWithZone(MEMORY[0x263F4B540]);
        v86 = (void *)sub_236F4E988();
        swift_bridgeObjectRelease();
        objc_msgSend(v85, sel_initWithBundleIdentifier_, v86);

        if (qword_2688E4F40 != -1) {
          swift_once();
        }
        id v87 = (id)qword_2688E62F0;
        uint64_t v88 = v97;
        sub_236F4E338();
        (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v84, v88, v76);
        swift_storeEnumTagMultiPayload();
        sub_236F38010(&qword_2688E5280, &qword_2688E5228);
        sub_236F4E5D8();
        (*(void (**)(char *, uint64_t))(v77 + 8))(v88, v76);
        goto LABEL_27;
      }
    }
    else
    {
      sub_236F37E78((uint64_t)&v120, &qword_2688E5058);
    }
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5268);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v83, 1, 1, v93);
    uint64_t v90 = v108;
    uint64_t v91 = (uint64_t)v114;
    uint64_t v92 = (uint64_t)v105;
    goto LABEL_30;
  }
  uint64_t v77 = v41;
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_19;
  }
  id v78 = objc_allocWithZone(MEMORY[0x263F4B540]);
  uint64_t v79 = (void *)sub_236F4E988();
  swift_bridgeObjectRelease();
  objc_msgSend(v78, sel_initWithType_, v79);

  id v80 = v98;
  v81 = v97;
  if (qword_2688E4F40 != -1) {
    swift_once();
  }
  id v82 = (id)qword_2688E62F0;
  sub_236F4E338();
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v80, v81, v76);
  swift_storeEnumTagMultiPayload();
  sub_236F38010(&qword_2688E5280, &qword_2688E5228);
  sub_236F4E5D8();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v81, v76);
LABEL_27:
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5268);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v75, 0, 1, v89);
  uint64_t v83 = (uint64_t)v99;
  sub_236F3A828(v75, (uint64_t)v99, &qword_2688E5230);
  uint64_t v90 = v108;
  uint64_t v91 = (uint64_t)v114;
  uint64_t v92 = (uint64_t)v105;
LABEL_30:
  sub_236F37BCC(v83, v92, &qword_2688E5230);
  swift_storeEnumTagMultiPayload();
  sub_236F3A71C();
  uint64_t v94 = v113;
  sub_236F4E5D8();
  sub_236F37E78(v83, &qword_2688E5230);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v94, 0, 1, v95);
  sub_236F3A828(v94, v91, &qword_2688E5240);
  uint64_t v45 = (uint64_t)v90;
LABEL_8:
  uint64_t v46 = v110;
  uint64_t v120 = *v110;
  char v121 = *((unsigned char *)v110 + 8);
  uint64_t v47 = swift_allocObject();
  long long v48 = *((_OWORD *)v46 + 1);
  *(_OWORD *)(v47 + 16) = *(_OWORD *)v46;
  *(_OWORD *)(v47 + 32) = v48;
  *(unsigned char *)(v47 + 48) = *((unsigned char *)v46 + 32);
  sub_236F3CBE4((uint64_t)&v123);
  sub_236F3CC10((uint64_t)&v120);
  uint64_t v49 = sub_236F4E518();
  uint64_t v50 = sub_236F4E578();
  uint64_t v51 = (int *)v111;
  uint64_t v52 = v117;
  uint64_t v53 = (uint64_t *)((char *)v117 + *(int *)(v111 + 36));
  uint64_t *v53 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  swift_storeEnumTagMultiPayload();
  *(uint64_t (**)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))((char *)v52 + v51[10]) = (uint64_t (*)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))v49;
  *(uint64_t (**)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))((char *)v52 + v51[11]) = (uint64_t (*)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))v50;
  uint64_t v54 = (char *)v52 + v51[12];
  *(void *)uint64_t v54 = 0;
  v54[8] = 1;
  *uint64_t v52 = sub_236F3CBDC;
  v52[1] = (uint64_t (*)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))v47;
  sub_236F3A828((uint64_t)v52, v45, &qword_2688E5310);
  if (objc_msgSend(v112, sel_buttonAction))
  {
    uint64_t v55 = v103;
    sub_236F4E5F8();
    LOBYTE(v118) = 1;
    uint64_t v56 = v102;
    uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
    uint64_t v58 = v104;
    uint64_t v59 = v101;
    v57(v104, v55, v101);
    char v60 = v118;
    v61 = v115;
    *long long v115 = 0;
    *((unsigned char *)v61 + 8) = v60;
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5260);
    v57((char *)v61 + *(int *)(v62 + 48), v58, v59);
    uint64_t v63 = *(void (**)(char *, uint64_t))(v56 + 8);
    v63(v55, v59);
    v63(v58, v59);
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5250);
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v61, 0, 1, v64);
    sub_236F3A828((uint64_t)v61, v116, &qword_2688E5218);
  }
  else
  {
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5250);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v116, 1, 1, v65);
  }
  uint64_t v66 = v109;
  uint64_t v67 = v113;
  uint64_t v68 = (uint64_t)v114;
  sub_236F37BCC((uint64_t)v114, v113, &qword_2688E5240);
  uint64_t v69 = (uint64_t)v117;
  sub_236F37BCC(v45, (uint64_t)v117, &qword_2688E5310);
  uint64_t v70 = v116;
  uint64_t v71 = v45;
  uint64_t v72 = v115;
  sub_236F37BCC(v116, (uint64_t)v115, &qword_2688E5218);
  sub_236F37BCC(v67, v66, &qword_2688E5240);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5320);
  sub_236F37BCC(v69, v66 + *(int *)(v73 + 48), &qword_2688E5310);
  sub_236F37BCC((uint64_t)v72, v66 + *(int *)(v73 + 64), &qword_2688E5218);
  sub_236F37E78(v70, &qword_2688E5218);
  sub_236F37E78(v71, &qword_2688E5310);
  sub_236F37E78(v68, &qword_2688E5240);
  sub_236F37E78((uint64_t)v72, &qword_2688E5218);
  sub_236F37E78(v69, &qword_2688E5310);
  return sub_236F37E78(v67, &qword_2688E5240);
}

uint64_t sub_236F3C260@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_236F3C4A4(a2, (uint64_t)&v36);
  uint64_t v29 = *((void *)&v36 + 1);
  uint64_t v30 = v36;
  uint64_t v31 = v38;
  uint64_t v32 = v37;
  char v33 = v39;
  uint64_t v35 = sub_236F4E818();
  uint64_t KeyPath = swift_getKeyPath();
  char v6 = *(unsigned char *)(a2 + 32);
  if ((v6 & 1) != 0
    && (long long v36 = *(_OWORD *)(a2 + 16),
        id v7 = *((id *)&v36 + 1),
        sub_236F3ED60(),
        uint64_t v9 = v8,
        sub_236F378C0((uint64_t)&v36),
        v9))
  {
    sub_236F37B70();
    uint64_t v10 = sub_236F4E738();
    uint64_t v12 = v11;
    char v14 = v13 & 1;
    sub_236F4E828();
    uint64_t v15 = sub_236F4E708();
    uint64_t v17 = v16;
    char v28 = v18;
    uint64_t v20 = v19;
    swift_release();
    sub_236F37B60(v10, v12, v14);
    swift_bridgeObjectRelease();
    uint64_t v21 = v28 & 1;
    uint64_t v22 = v20;
    uint64_t v23 = v17;
    uint64_t v24 = v15;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v23 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  *(void *)a3 = v30;
  *(void *)(a3 + 8) = v29;
  *(void *)(a3 + 16) = v32;
  *(void *)(a3 + 24) = v31;
  *(unsigned char *)(a3 + 32) = v33;
  *(void *)(a3 + 40) = KeyPath;
  *(void *)(a3 + 48) = v35;
  *(void *)(a3 + 56) = 0;
  *(unsigned char *)(a3 + 64) = (((v6 & 1) == 0) | (a1 ^ 1) & 1) == 0;
  *(unsigned char *)(a3 + 65) = ((v6 & 1) == 0) | (a1 ^ 1) & 1;
  *(void *)(a3 + 72) = v24;
  *(void *)(a3 + 80) = v23;
  *(void *)(a3 + 88) = v21;
  *(void *)(a3 + 96) = v22;
  uint64_t v25 = v24;
  char v26 = v21;
  sub_236F3CCA0(v30, v29, v32, v31, v33);
  swift_retain();
  swift_retain();
  sub_236F37AC8(v25, v23, v26, v22);
  sub_236F37B1C(v25, v23, v26, v22);
  sub_236F3CD00(v30, v29, v32, v31, v33);
  swift_release();
  return swift_release();
}

double sub_236F3C4A4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v26 = *(_OWORD *)(a1 + 16);
  id v3 = *((id *)&v26 + 1);
  uint64_t v4 = sub_236F3E3E8();
  unint64_t v6 = v5;
  sub_236F378C0((uint64_t)&v26);
  if (v6)
  {
    uint64_t v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0) {
      uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v7)
    {
      *(void *)&long long v23 = v4;
      *((void *)&v23 + 1) = v6;
      sub_236F37B70();
      uint64_t v8 = sub_236F4E738();
      uint64_t v10 = v9;
      char v12 = v11 & 1;
      sub_236F4E6D8();
      sub_236F4E728();
      swift_release();
      sub_236F37B60(v8, v10, v12);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  id v13 = v3;
  uint64_t v14 = sub_236F3ED60();
  uint64_t v16 = v15;
  sub_236F378C0((uint64_t)&v26);
  if (v16)
  {
    *(void *)&long long v23 = v14;
    *((void *)&v23 + 1) = v16;
    sub_236F37B70();
    uint64_t v17 = sub_236F4E738();
    uint64_t v19 = v18;
    char v21 = v20 & 1;
    sub_236F4E6D8();
    sub_236F4E728();
    swift_release();
    sub_236F37B60(v17, v19, v21);
    swift_bridgeObjectRelease();
  }
LABEL_9:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5328);
  sub_236F3CD60();
  sub_236F4E5D8();
  double result = *(double *)&v23;
  *(_OWORD *)a2 = v23;
  *(_OWORD *)(a2 + 16) = v24;
  *(unsigned char *)(a2 + 32) = v25;
  return result;
}

uint64_t sub_236F3C6C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E52F8);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)(v1 + 16);
  v13[0] = *(_OWORD *)v1;
  v13[1] = v6;
  char v14 = *(unsigned char *)(v1 + 32);
  *(void *)unint64_t v5 = sub_236F4E518();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5300);
  sub_236F3B378((uint64_t *)v13, (uint64_t)&v5[*(int *)(v7 + 44)]);
  uint64_t v8 = *(void *)&v13[0];
  char v9 = BYTE8(v13[0]);
  sub_236F375F0(*(uint64_t *)&v13[0], SBYTE8(v13[0]));
  char v10 = sub_236F3DCEC(v8, v9);
  sub_236F37644(v8, v9);
  if (v10) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.5;
  }
  sub_236F37BCC((uint64_t)v5, a1, &qword_2688E52F8);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E5308) + 36)) = v11;
  return sub_236F37E78((uint64_t)v5, &qword_2688E52F8);
}

uint64_t sub_236F3C7FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236F4E468();
  *a1 = result;
  return result;
}

uint64_t sub_236F3C828()
{
  return sub_236F4E478();
}

void sub_236F3C854(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  sub_236F37ED4();
  sub_236F3C93C();
  id v5 = a1;
  uint64_t v6 = sub_236F4E418();
  uint64_t v8 = v7;
  uint64_t v9 = sub_236F3E3E8();
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = v9;
  unint64_t v12 = v10;
  swift_bridgeObjectRelease();
  uint64_t v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v13 = v11 & 0xFFFFFFFFFFFFLL;
  }
  if (!v13)
  {
LABEL_7:

    goto LABEL_8;
  }
  sub_236F3ED60();
  uint64_t v15 = v14;

  if (!v15)
  {
LABEL_8:
    char v16 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  char v16 = 1;
LABEL_9:
  *(void *)a2 = KeyPath;
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v8;
  *(unsigned char *)(a2 + 32) = v16;
}

unint64_t sub_236F3C93C()
{
  unint64_t result = qword_2688E52F0;
  if (!qword_2688E52F0)
  {
    sub_236F37ED4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E52F0);
  }
  return result;
}

uint64_t initializeWithCopy for SUIKPTitleValueCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_236F375F0(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for SUIKPTitleValueCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_236F375F0(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_236F37644(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v8 = *(void **)(a2 + 24);
  uint64_t v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;
  id v10 = v8;

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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

uint64_t assignWithTake for SUIKPTitleValueCell(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_236F37644(v6, v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;

  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPTitleValueCell(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SUIKPTitleValueCell(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPTitleValueCell()
{
  return &type metadata for SUIKPTitleValueCell;
}

uint64_t sub_236F3CB7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F3CB98()
{
  sub_236F37644(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_236F3CBDC@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  return sub_236F3C260(a1, v2 + 16, a2);
}

uint64_t sub_236F3CBE4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_236F3CC10(uint64_t a1)
{
  return a1;
}

uint64_t sub_236F3CC48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236F4E468();
  *a1 = result;
  return result;
}

uint64_t sub_236F3CC74()
{
  return sub_236F4E478();
}

uint64_t sub_236F3CCA0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if (a5)
  {
    return sub_236F37AC8(a1, a2, a3, a4);
  }
  else
  {
    sub_236F37B0C(a1, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_236F3CD00(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if (a5)
  {
    return sub_236F37B1C(a1, a2, a3, a4);
  }
  else
  {
    sub_236F37B60(a1, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_236F3CD60()
{
  unint64_t result = qword_2688E5330;
  if (!qword_2688E5330)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5330);
  }
  return result;
}

unint64_t sub_236F3CDD0()
{
  unint64_t result = qword_2688E5338;
  if (!qword_2688E5338)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5308);
    sub_236F38010(&qword_2688E5340, &qword_2688E52F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5338);
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPToggleCell()
{
  return &type metadata for SUIKPToggleCell;
}

uint64_t sub_236F3CE80()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_236F3CE9C()
{
  id v0 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
  id v1 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v1, sel_scale);
  double v3 = v2;

  objc_msgSend(v0, sel_setScale_, v3);
  id result = objc_msgSend(v0, sel_setDrawBorder_, 1);
  qword_2688E62F0 = (uint64_t)v0;
  return result;
}

uint64_t sub_236F3CF5C@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5360);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5348);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v18[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)id v10 = sub_236F4E518();
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5368);
  a2 &= 1u;
  sub_236F3D100(a3, (uint64_t)&v10[*(int *)(v15 + 44)]);
  sub_236F375F0(a1, a2);
  LOBYTE(a3) = sub_236F3DCEC(a1, a2);
  sub_236F37644(a1, a2);
  if (a3) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.5;
  }
  sub_236F37BCC((uint64_t)v10, (uint64_t)v14, &qword_2688E5360);
  *(double *)&v14[*(int *)(v12 + 44)] = v16;
  sub_236F37E78((uint64_t)v10, &qword_2688E5360);
  return sub_236F3A828((uint64_t)v14, a4, &qword_2688E5348);
}

uint64_t sub_236F3D100@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v83 = a2;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5220);
  MEMORY[0x270FA5388](v79);
  v81 = (char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5228);
  uint64_t v80 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5230);
  uint64_t v7 = MEMORY[0x270FA5388](v82);
  uint64_t v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v73 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5238);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (uint64_t *)((char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E51D8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5240);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v84 = (uint64_t)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v73 - v21;
  id v23 = a1;
  long long v24 = (void *)sub_236F3EB7C();

  if (v24)
  {
    id v25 = v24;
    sub_236F4E868();
    uint64_t v26 = *MEMORY[0x263F1B4F8];
    uint64_t v27 = sub_236F4E898();
    uint64_t v28 = *(void *)(v27 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v17, v26, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v17, 0, 1, v27);
    uint64_t v29 = sub_236F4E888();
    swift_release();
    sub_236F37E78((uint64_t)v17, &qword_2688E51D8);
    *uint64_t v14 = v29;
    swift_storeEnumTagMultiPayload();
    sub_236F3A71C();
    swift_retain();
    sub_236F4E5D8();
    swift_release();

    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v22, 0, 1, v30);
    goto LABEL_23;
  }
  uint64_t v74 = v6;
  uint64_t v75 = v4;
  uint64_t v76 = v11;
  uint64_t v32 = v80;
  uint64_t v31 = v81;
  id v78 = v22;
  uint64_t v73 = v14;
  uint64_t v77 = v12;
  id v33 = v23;
  id v34 = v23;
  char v35 = sub_236F3EC54();

  if ((v35 & 1) == 0)
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
    uint64_t v22 = v78;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v78, 1, 1, v36);
    goto LABEL_23;
  }
  if (objc_msgSend(v34, sel_propertyForKey_, *MEMORY[0x263F60158]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
  }
  uint64_t v37 = (uint64_t)v9;
  uint64_t v38 = v31;
  sub_236F3A828((uint64_t)&v85, (uint64_t)v87, &qword_2688E5058);
  uint64_t v39 = v32;
  uint64_t v40 = v75;
  if (v88)
  {
    char v41 = swift_dynamicCast();
    id v42 = v74;
    if (v41)
    {
      id v43 = objc_allocWithZone(MEMORY[0x263F4B540]);
      uint64_t v44 = (void *)sub_236F4E988();
      swift_bridgeObjectRelease();
      objc_msgSend(v43, sel_initWithType_, v44);

      if (qword_2688E4F40 == -1) {
        goto LABEL_19;
      }
      goto LABEL_27;
    }
  }
  else
  {
    sub_236F37E78((uint64_t)v87, &qword_2688E5058);
    id v42 = v74;
  }
  if (objc_msgSend(v34, (SEL)&off_264CC3498, *MEMORY[0x263F60188]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
  }
  sub_236F3A828((uint64_t)&v85, (uint64_t)v87, &qword_2688E5058);
  if (!v88)
  {
    sub_236F37E78((uint64_t)v87, &qword_2688E5058);
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5268);
    uint64_t v49 = (uint64_t)v76;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v76, 1, 1, v50);
    goto LABEL_22;
  }
  id v45 = objc_allocWithZone(MEMORY[0x263F4B540]);
  uint64_t v46 = (void *)sub_236F4E988();
  swift_bridgeObjectRelease();
  objc_msgSend(v45, sel_initWithBundleIdentifier_, v46);

  if (qword_2688E4F40 != -1) {
LABEL_27:
  }
    swift_once();
LABEL_19:
  id v47 = (id)qword_2688E62F0;
  sub_236F4E338();
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v38, v42, v40);
  swift_storeEnumTagMultiPayload();
  sub_236F38010(&qword_2688E5280, &qword_2688E5228);
  sub_236F4E5D8();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v42, v40);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5268);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v37, 0, 1, v48);
  uint64_t v49 = (uint64_t)v76;
  sub_236F3A828(v37, (uint64_t)v76, &qword_2688E5230);
LABEL_22:
  id v23 = v33;
  sub_236F37BCC(v49, (uint64_t)v73, &qword_2688E5230);
  swift_storeEnumTagMultiPayload();
  sub_236F3A71C();
  uint64_t v51 = v84;
  sub_236F4E5D8();
  sub_236F37E78(v49, &qword_2688E5230);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5248);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v51, 0, 1, v52);
  uint64_t v22 = v78;
  sub_236F3A828(v51, (uint64_t)v78, &qword_2688E5240);
LABEL_23:
  id v53 = v23;
  uint64_t v54 = sub_236F3E3E8();
  uint64_t v56 = v55;

  if (v56)
  {
    v87[0] = v54;
    v87[1] = v56;
    sub_236F37B70();
    uint64_t v57 = sub_236F4E738();
    uint64_t v59 = v58;
    char v61 = v60 & 1;
    sub_236F4E6D8();
    uint64_t v62 = sub_236F4E728();
    uint64_t v56 = v63;
    char v65 = v64;
    uint64_t v67 = v66;
    swift_release();
    uint64_t v68 = v65 & 1;
    sub_236F37B60(v57, v59, v61);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v62 = 0;
    uint64_t v68 = 0;
    uint64_t v67 = 0;
  }
  uint64_t v69 = v84;
  sub_236F37BCC((uint64_t)v22, v84, &qword_2688E5240);
  uint64_t v70 = v83;
  sub_236F37BCC(v69, v83, &qword_2688E5240);
  uint64_t v71 = (uint64_t *)(v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E5370) + 48));
  *uint64_t v71 = v62;
  v71[1] = v56;
  v71[2] = v68;
  v71[3] = v67;
  sub_236F37AC8(v62, v56, v68, v67);
  sub_236F37E78((uint64_t)v22, &qword_2688E5240);
  sub_236F37B1C(v62, v56, v68, v67);
  return sub_236F37E78(v69, &qword_2688E5240);
}

uint64_t sub_236F3DB78()
{
  id v1 = *(id *)(v0 + 24);
  sub_236F3F0E0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5348);
  sub_236F3DC4C();
  return sub_236F4E8F8();
}

uint64_t sub_236F3DC34@<X0>(uint64_t a1@<X8>)
{
  return sub_236F3CF5C(*(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void **)(v1 + 40), a1);
}

unint64_t sub_236F3DC4C()
{
  unint64_t result = qword_2688E5350;
  if (!qword_2688E5350)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5348);
    sub_236F38010(&qword_2688E5358, &qword_2688E5360);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5350);
  }
  return result;
}

uint64_t sub_236F3DCEC(uint64_t a1, char a2)
{
  uint64_t v4 = sub_236F4E4F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_236F4EA48();
  uint64_t v9 = sub_236F4E6A8();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_236F4C85C(1819242306, 0xE400000000000000, &v15);
    sub_236F4EAA8();
    _os_log_impl(&dword_236F34000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E11C00](v12, -1, -1);
    MEMORY[0x237E11C00](v11, -1, -1);
  }

  sub_236F4E4E8();
  swift_getAtKeyPath();
  sub_236F37644(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_236F3DEF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_236F4E4F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236F37BCC(v2, (uint64_t)v10, &qword_2688E5318);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_236F4E568();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_236F4EA48();
    uint64_t v14 = sub_236F4E6A8();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_236F4C85C(0xD000000000000013, 0x8000000236F52F90, &v20);
      sub_236F4EAA8();
      _os_log_impl(&dword_236F34000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237E11C00](v18, -1, -1);
      MEMORY[0x237E11C00](v16, -1, -1);
    }

    sub_236F4E4E8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_236F3E1A8()
{
  return sub_236F38010(&qword_2688E5378, &qword_2688E5380);
}

id sub_236F3E228()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BundleClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BundleClass()
{
  return self;
}

uint64_t sub_236F3E284(uint64_t a1)
{
  return sub_236F3E2D4(a1, qword_2688E62F8);
}

uint64_t sub_236F3E2A8(uint64_t a1)
{
  return sub_236F3E2D4(a1, qword_2688E6310);
}

uint64_t sub_236F3E2D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_236F4E378();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_236F4E368();
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

uint64_t sub_236F3E3E8()
{
  id v1 = objc_msgSend(v0, sel_name);
  if (v1)
  {
    objc_super v2 = v1;
    uint64_t v3 = sub_236F4E9A8();
  }
  else
  {
    unint64_t v4 = (unint64_t)objc_msgSend(v0, sel_cellType);
    BOOL v5 = v4 > 0xD || ((1 << v4) & 0x200A) == 0;
    if (v5 && objc_msgSend(v0, sel_hasValidGetter))
    {
      if (objc_msgSend(v0, sel_performGetter))
      {
        sub_236F4EAC8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v8 = 0u;
        long long v9 = 0u;
      }
      sub_236F37E10((uint64_t)&v8, (uint64_t)v10);
    }
    else
    {
      memset(v10, 0, sizeof(v10));
    }
    sub_236F37E10((uint64_t)v10, (uint64_t)&v8);
    if (*((void *)&v9 + 1))
    {
      if (swift_dynamicCast()) {
        return v7;
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_236F37E78((uint64_t)&v8, &qword_2688E5058);
      return 0;
    }
  }
  return v3;
}

uint64_t sub_236F3E548()
{
  if ((objc_msgSend(v0, sel_cellType) == (id)8 || objc_msgSend(v0, sel_cellType) == (id)12)
    && objc_msgSend(v0, sel_hasValidGetter)
    && objc_msgSend(v0, sel_hasValidSetter))
  {
    uint64_t v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    objc_super v2 = (void *)swift_allocObject();
    v2[2] = 0;
    v2[3] = 0;
    v2[4] = v1;
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v4 = (void *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    sub_236F4E928();
  }
  else
  {
    sub_236F4E938();
  }
  return v6;
}

uint64_t sub_236F3E6B4()
{
  sub_236F4E9A8();
  uint64_t v1 = (void *)sub_236F4E988();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_propertyForKey_, v1);

  if (v2)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_236F37E10((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    sub_236F41F20(0, &qword_2688E53B8);
    if (swift_dynamicCast()) {
      return v4;
    }
  }
  else
  {
    sub_236F37E78((uint64_t)v6, &qword_2688E5058);
  }
  return 0;
}

double sub_236F3E7C8()
{
  if (objc_msgSend(v0, sel_cellType) == (id)5
    && objc_msgSend(v0, sel_hasValidGetter)
    && objc_msgSend(v0, sel_hasValidSetter))
  {
    uint64_t v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v2 = (void *)swift_allocObject();
    v2[2] = 0;
    v2[3] = 0;
    v2[4] = v1;
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v4 = (void *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    sub_236F4E928();
  }
  else
  {
    sub_236F4E938();
  }
  return v6;
}

double sub_236F3E91C()
{
  *(void *)&v7[0] = sub_236F4E9A8();
  *((void *)&v7[0] + 1) = v1;
  id v2 = objc_msgSend(v0, sel_objectForKeyedSubscript_, sub_236F4EC28());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_236F37E10((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_236F37E78((uint64_t)v8, &qword_2688E5058);
    return 0.0;
  }
  sub_236F41F20(0, &qword_2688E53E0);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0.0;
  }
  objc_msgSend(v6, sel_doubleValue);
  double v4 = v3;

  return v4;
}

double sub_236F3EA4C()
{
  *(void *)&v7[0] = sub_236F4E9A8();
  *((void *)&v7[0] + 1) = v1;
  id v2 = objc_msgSend(v0, sel_objectForKeyedSubscript_, sub_236F4EC28());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_236F37E10((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_236F37E78((uint64_t)v8, &qword_2688E5058);
    return 1.0;
  }
  sub_236F41F20(0, &qword_2688E53E0);
  if ((swift_dynamicCast() & 1) == 0) {
    return 1.0;
  }
  objc_msgSend(v6, sel_doubleValue);
  double v4 = v3;

  return v4;
}

uint64_t sub_236F3EB7C()
{
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x263F60140]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_236F37E10((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_236F41F20(0, &qword_2688E53B8);
    if (swift_dynamicCast()) {
      return v2;
    }
  }
  else
  {
    sub_236F37E78((uint64_t)v4, &qword_2688E5058);
  }
  return 0;
}

uint64_t sub_236F3EC54()
{
  id v1 = objc_msgSend(v0, sel_properties);
  if (!v1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_236F4E978();

  *(void *)&long long v10 = sub_236F4E9A8();
  *((void *)&v10 + 1) = v4;
  sub_236F4EB08();
  if (*(void *)(v3 + 16) && (unint64_t v5 = sub_236F41B60((uint64_t)v9), (v6 & 1) != 0))
  {
    sub_236F41BA4(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_236F41B0C((uint64_t)v9);
  if (!*((void *)&v11 + 1)) {
    goto LABEL_9;
  }
  uint64_t v7 = 1;
LABEL_10:
  sub_236F37E78((uint64_t)&v10, &qword_2688E5058);
  return v7;
}

uint64_t sub_236F3ED60()
{
  id v1 = v0;
  memset(v17, 0, sizeof(v17));
  if (objc_msgSend(v0, sel_hasValidGetter))
  {
    if (objc_msgSend(v0, sel_performGetter))
    {
      sub_236F4EAC8();
      swift_unknownObjectRelease();
      sub_236F37E78((uint64_t)v17, &qword_2688E5058);
    }
    else
    {
      sub_236F37E78((uint64_t)v17, &qword_2688E5058);
      long long v14 = 0u;
      long long v15 = 0u;
    }
    sub_236F37E10((uint64_t)&v14, (uint64_t)v17);
  }
  sub_236F41AA4((uint64_t)v17, (uint64_t)&v14);
  uint64_t v2 = *((void *)&v15 + 1);
  sub_236F37E78((uint64_t)&v14, &qword_2688E5058);
  if (v2 && objc_msgSend(v1, sel_cellType) != (id)9)
  {
    if (objc_msgSend(v1, sel_cellType) == (id)2 || objc_msgSend(v1, sel_cellType) == (id)4) {
      id v3 = objc_msgSend(v1, sel_shortTitleDictionary);
    }
    else {
      id v3 = objc_msgSend(v1, sel_titleDictionary);
    }
    id v4 = v3;
    if (v4)
    {
      uint64_t v5 = sub_236F4E978();
    }
    else
    {
      uint64_t v5 = 0;
    }
    sub_236F41AA4((uint64_t)v17, (uint64_t)v10);
    if (v10[3])
    {
      if (swift_dynamicCast())
      {
        if (*((void *)&v12 + 1))
        {
          long long v14 = v11;
          long long v15 = v12;
          uint64_t v16 = v13;
          if (v5)
          {
            if (*(void *)(v5 + 16) && (unint64_t v6 = sub_236F41B60((uint64_t)&v14), (v7 & 1) != 0))
            {
              sub_236F41BA4(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v11);
            }
            else
            {
              long long v11 = 0u;
              long long v12 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_236F41B0C((uint64_t)&v14);
            sub_236F37E78((uint64_t)v17, &qword_2688E5058);
            sub_236F37E10((uint64_t)&v11, (uint64_t)v17);
          }
          else
          {
            sub_236F41B0C((uint64_t)&v14);
          }
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
      }
    }
    else
    {
      sub_236F37E78((uint64_t)v10, &qword_2688E5058);
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v13 = 0;
    }
    swift_bridgeObjectRelease();
    sub_236F37E78((uint64_t)&v11, &qword_2688E5390);
  }
LABEL_25:
  sub_236F41AA4((uint64_t)v17, (uint64_t)&v14);
  uint64_t v8 = *((void *)&v15 + 1);
  sub_236F37E78((uint64_t)&v14, &qword_2688E5058);
  if (!v8)
  {
    if (objc_msgSend(v1, sel_propertyForKey_, *MEMORY[0x263F60308]))
    {
      sub_236F4EAC8();
      swift_unknownObjectRelease();
      sub_236F37E78((uint64_t)v17, &qword_2688E5058);
    }
    else
    {
      sub_236F37E78((uint64_t)v17, &qword_2688E5058);
      long long v14 = 0u;
      long long v15 = 0u;
    }
    sub_236F37E10((uint64_t)&v14, (uint64_t)v17);
  }
  sub_236F37E10((uint64_t)v17, (uint64_t)&v14);
  if (*((void *)&v15 + 1))
  {
    if (swift_dynamicCast()) {
      return v11;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_236F37E78((uint64_t)&v14, &qword_2688E5058);
    return 0;
  }
}

uint64_t sub_236F3F0E0()
{
  if (objc_msgSend(v0, sel_cellType) == (id)6
    && objc_msgSend(v0, sel_hasValidGetter)
    && objc_msgSend(v0, sel_hasValidSetter))
  {
    uint64_t v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v2 = (void *)swift_allocObject();
    v2[2] = 0;
    v2[3] = 0;
    v2[4] = v1;
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v4 = (void *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    sub_236F4E928();
  }
  else
  {
    sub_236F4E938();
  }
  return v6;
}

uint64_t sub_236F3F234()
{
  uint64_t result = sub_236F4E988();
  qword_2688E6328 = result;
  return result;
}

void PSSpecifier.objectWillChange.getter()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  if (qword_2688E4F58 != -1) {
    swift_once();
  }
  sub_236F4EA78();
}

void sub_236F3F31C()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  if (qword_2688E4F58 != -1) {
    swift_once();
  }
  sub_236F4EA78();
}

id PSSpecifier.id.getter()
{
  id result = objc_msgSend(v0, sel_identifier);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_236F4E9A8();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_236F3F430()
{
  unint64_t result = qword_2688E5388;
  if (!qword_2688E5388)
  {
    sub_236F4EA68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5388);
  }
  return result;
}

uint64_t sub_236F3F488()
{
  return MEMORY[0x263F8D320];
}

void sub_236F3F494(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_identifier);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_236F4E9A8();
    uint64_t v7 = v6;

    *a1 = v5;
    a1[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_236F3F4F4()
{
  if (objc_msgSend(v0, sel_cellType)) {
    return 0;
  }
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x263F600F8]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_236F37E10((uint64_t)v3, (uint64_t)v4);
  if (!v5)
  {
    sub_236F37E78((uint64_t)v4, &qword_2688E5058);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t sub_236F3F5DC()
{
  uint64_t v1 = v0;
  if (objc_msgSend(v0, sel_cellType)) {
    return 0;
  }
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x263F600E8]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  sub_236F37E10((uint64_t)&v29, (uint64_t)v31);
  if (v32)
  {
    if (swift_dynamicCast())
    {
      uint64_t v2 = v27;
      unint64_t v4 = v28;
      goto LABEL_12;
    }
  }
  else
  {
    sub_236F37E78((uint64_t)v31, &qword_2688E5058);
  }
  uint64_t v2 = 0;
  unint64_t v4 = 0xE000000000000000;
LABEL_12:
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if (objc_msgSend(v1, sel_propertyForKey_, *MEMORY[0x263F600D0]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  sub_236F37E10((uint64_t)&v29, (uint64_t)v31);
  if (v32) {
    swift_dynamicCast();
  }
  else {
    sub_236F37E78((uint64_t)v31, &qword_2688E5058);
  }
  uint64_t v6 = (NSString *)sub_236F4E988();
  swift_bridgeObjectRelease();
  NSRangeFromString(v6);

  uint64_t v7 = sub_236F4EA28();
  if (v9) {
    return v2;
  }
  unint64_t v10 = v7;
  unint64_t v11 = v8;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_236F4EA08();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = MEMORY[0x237E11410](v12, v14, v16, v18);
  uint64_t result = swift_bridgeObjectRelease();
  if (v11 >> 14 >= v10 >> 14)
  {
    uint64_t v20 = sub_236F4EA08();
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    MEMORY[0x237E11410](v20, v22, v24, v26);
    swift_bridgeObjectRelease();
    return v19;
  }
  __break(1u);
  return result;
}

void sub_236F3F8B8(uint64_t a1@<X2>, unsigned __int8 *a2@<X8>)
{
  uint64_t v4 = sub_236F4E378();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  unint64_t v11 = (char *)&v67 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v67 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v67 - v15;
  uint64_t v17 = a1 + 16;
  swift_beginAccess();
  uint64_t v18 = (void *)MEMORY[0x237E11CA0](v17);
  if (!v18)
  {
    long long v72 = 0u;
    long long v73 = 0u;
LABEL_12:
    sub_236F37E78((uint64_t)&v72, &qword_2688E5058);
LABEL_13:
    swift_beginAccess();
    uint64_t v31 = MEMORY[0x237E11CA0](v17);
    if (v31)
    {
      uint64_t v32 = (void *)v31;
      id v33 = (void *)sub_236F4E988();
      id v34 = objc_msgSend(v32, sel_propertyForKey_, v33);

      if (v34)
      {
        sub_236F4EAC8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v71 = 0u;
        long long v70 = 0u;
      }
      uint64_t v35 = v5;
      sub_236F37E10((uint64_t)&v70, (uint64_t)&v72);
      if (*((void *)&v73 + 1))
      {
        if (swift_dynamicCast())
        {
          long long v36 = v70;
          uint64_t v37 = HIBYTE(*((void *)&v70 + 1)) & 0xFLL;
          if ((*((void *)&v70 + 1) & 0x2000000000000000) == 0) {
            uint64_t v37 = v70 & 0xFFFFFFFFFFFFLL;
          }
          if (v37)
          {
            if (qword_2688E4F48 != -1) {
              swift_once();
            }
            uint64_t v38 = __swift_project_value_buffer(v4, (uint64_t)qword_2688E62F8);
            (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v38, v4);
            swift_bridgeObjectRetain();
            uint64_t v39 = sub_236F4E358();
            os_log_type_t v40 = sub_236F4EA58();
            if (os_log_type_enabled(v39, v40))
            {
              char v41 = (uint8_t *)swift_slowAlloc();
              uint64_t v42 = swift_slowAlloc();
              uint64_t v69 = a2;
              uint64_t v43 = v42;
              *(void *)&long long v72 = v42;
              uint64_t v68 = (uint8_t *)v5;
              *(_DWORD *)char v41 = 136315138;
              swift_bridgeObjectRetain();
              *(void *)&long long v70 = sub_236F4C85C(v36, *((unint64_t *)&v36 + 1), (uint64_t *)&v72);
              sub_236F4EAA8();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_236F34000, v39, v40, "No value returned from some getter of specifier for bundleIdentifier '%s.", v41, 0xCu);
              swift_arrayDestroy();
              uint64_t v44 = v43;
              a2 = v69;
              MEMORY[0x237E11C00](v44, -1, -1);
              MEMORY[0x237E11C00](v41, -1, -1);

              (*((void (**)(char *, uint64_t))v68 + 1))(v11, v4);
            }
            else
            {

              swift_bridgeObjectRelease_n();
              (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
            }
LABEL_33:
            unsigned __int8 v30 = 0;
            goto LABEL_34;
          }
          swift_bridgeObjectRelease();
        }
LABEL_28:
        if (qword_2688E4F48 != -1) {
          swift_once();
        }
        uint64_t v45 = __swift_project_value_buffer(v4, (uint64_t)qword_2688E62F8);
        (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v8, v45, v4);
        uint64_t v46 = sub_236F4E358();
        os_log_type_t v47 = sub_236F4EA58();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v48 = 0;
          _os_log_impl(&dword_236F34000, v46, v47, "No value returned from getter of specifier (no bundleIdentifier found).", v48, 2u);
          MEMORY[0x237E11C00](v48, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v4);
        goto LABEL_33;
      }
    }
    else
    {
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v35 = v5;
    }
    sub_236F37E78((uint64_t)&v72, &qword_2688E5058);
    goto LABEL_28;
  }
  uint64_t v19 = v18;
  uint64_t v69 = a2;
  id v20 = objc_msgSend(v18, sel_performGetter);

  if (v20)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v71 = 0u;
    long long v70 = 0u;
  }
  sub_236F37E10((uint64_t)&v70, (uint64_t)&v72);
  a2 = v69;
  if (!*((void *)&v73 + 1)) {
    goto LABEL_12;
  }
  sub_236F41F20(0, &qword_2688E53C0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v21 = (void *)v70;
  self;
  if (!swift_dynamicCastObjCClass()
    || (v72 = 0uLL, v22 = v21, sub_236F4E998(), v22, (unint64_t v23 = *((void *)&v72 + 1)) == 0))
  {
    self;
    uint64_t v49 = (void *)swift_dynamicCastObjCClass();
    if (v49)
    {
      unsigned __int8 v30 = objc_msgSend(v49, sel_BOOLValue);

      goto LABEL_34;
    }
    uint64_t v50 = v5;
    if (qword_2688E4F48 != -1) {
      swift_once();
    }
    uint64_t v51 = __swift_project_value_buffer(v4, (uint64_t)qword_2688E62F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v51, v4);
    uint64_t v52 = v21;
    id v53 = sub_236F4E358();
    os_log_type_t v54 = sub_236F4EA58();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = (void *)swift_slowAlloc();
      uint64_t v68 = v55;
      *(_DWORD *)uint64_t v55 = 138543362;
      *(void *)&long long v72 = v52;
      uint64_t v56 = v52;
      uint64_t v50 = v5;
      a2 = v69;
      sub_236F4EAA8();
      uint64_t v57 = v67;
      *uint64_t v67 = v52;

      uint64_t v58 = v68;
      _os_log_impl(&dword_236F34000, v53, v54, "Could not resolve value of type '%{public}@' to a BOOLean.", v68, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688E53C8);
      swift_arrayDestroy();
      MEMORY[0x237E11C00](v57, -1, -1);
      MEMORY[0x237E11C00](v58, -1, -1);
    }
    else
    {

      id v53 = v52;
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v14, v4);
    goto LABEL_33;
  }
  uint64_t v24 = v72;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E53D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_236F4F9C0;
  *(void *)(inited + 32) = 1702195828;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(void *)(inited + 48) = 7562617;
  *(void *)(inited + 56) = 0xE300000000000000;
  *(void *)(inited + 64) = 49;
  *(void *)(inited + 72) = 0xE100000000000000;
  *(void *)(inited + 80) = 121;
  *(void *)(inited + 88) = 0xE100000000000000;
  uint64_t v26 = sub_236F41D7C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v27 = sub_236F4E9B8();
  char v29 = sub_236F403B8(v27, v28, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29)
  {
    swift_bridgeObjectRelease();

    unsigned __int8 v30 = 1;
LABEL_53:
    a2 = v69;
    goto LABEL_34;
  }
  uint64_t v59 = (void *)sub_236F4E988();
  uint64_t v60 = (uint64_t)objc_msgSend(v59, sel_integerValue);

  a2 = v69;
  if (v60 < 1)
  {
    if (qword_2688E4F48 != -1) {
      swift_once();
    }
    uint64_t v61 = __swift_project_value_buffer(v4, (uint64_t)qword_2688E62F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v16, v61, v4);
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_236F4E358();
    os_log_type_t v63 = sub_236F4EA58();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = swift_slowAlloc();
      uint64_t v68 = (uint8_t *)v5;
      char v65 = (uint8_t *)v64;
      uint64_t v66 = swift_slowAlloc();
      *(void *)&long long v72 = v66;
      *(_DWORD *)char v65 = 136446210;
      uint64_t v67 = v65 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v70 = sub_236F4C85C(v24, v23, (uint64_t *)&v72);
      sub_236F4EAA8();
      swift_bridgeObjectRelease_n();
      swift_arrayDestroy();
      MEMORY[0x237E11C00](v66, -1, -1);
      MEMORY[0x237E11C00](v65, -1, -1);

      (*((void (**)(char *, uint64_t))v68 + 1))(v16, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
    }
    unsigned __int8 v30 = 0;
    goto LABEL_53;
  }
  swift_bridgeObjectRelease();

  unsigned __int8 v30 = 1;
LABEL_34:
  *a2 = v30;
}

uint64_t sub_236F403B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_236F4EC38();
    sub_236F4E9D8();
    uint64_t v6 = sub_236F4EC48();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_236F4EC18() & 1) != 0) {
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
          if (v17 || (sub_236F4EC18() & 1) != 0) {
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

void sub_236F404F0(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a4 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x237E11CA0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v4);
    objc_msgSend(v7, sel_performSetterWithValue_, v8);
  }
  id v9 = objc_msgSend(self, sel_defaultCenter);
  if (qword_2688E4F58 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_2688E6328;
  swift_beginAccess();
  unint64_t v11 = (void *)MEMORY[0x237E11CA0](v5);
  objc_msgSend(v9, sel_postNotificationName_object_, v10, v11);
}

void sub_236F40620(uint64_t a1@<X2>, void *a2@<X8>)
{
  uint64_t v4 = sub_236F4E378();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  unint64_t v11 = (char *)&v46 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v46 - v12;
  uint64_t v14 = a1 + 16;
  swift_beginAccess();
  unint64_t v15 = (void *)MEMORY[0x237E11CA0](v14);
  if (!v15)
  {
    long long v51 = 0u;
    long long v52 = 0u;
LABEL_11:
    sub_236F37E78((uint64_t)&v51, &qword_2688E5058);
LABEL_12:
    swift_beginAccess();
    uint64_t v22 = MEMORY[0x237E11CA0](v14);
    if (v22)
    {
      unint64_t v23 = (void *)v22;
      uint64_t v24 = (void *)sub_236F4E988();
      id v25 = objc_msgSend(v23, sel_propertyForKey_, v24);

      if (v25)
      {
        sub_236F4EAC8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v49 = 0u;
        long long v50 = 0u;
      }
      sub_236F37E10((uint64_t)&v49, (uint64_t)&v51);
      if (*((void *)&v52 + 1))
      {
        if (swift_dynamicCast())
        {
          long long v26 = v49;
          uint64_t v27 = HIBYTE(*((void *)&v49 + 1)) & 0xFLL;
          if ((*((void *)&v49 + 1) & 0x2000000000000000) == 0) {
            uint64_t v27 = v49 & 0xFFFFFFFFFFFFLL;
          }
          if (v27)
          {
            if (qword_2688E4F48 != -1) {
              swift_once();
            }
            uint64_t v28 = __swift_project_value_buffer(v4, (uint64_t)qword_2688E62F8);
            (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v28, v4);
            swift_bridgeObjectRetain();
            char v29 = sub_236F4E358();
            os_log_type_t v30 = sub_236F4EA58();
            if (os_log_type_enabled(v29, v30))
            {
              uint64_t v31 = (uint8_t *)swift_slowAlloc();
              uint64_t v48 = (uint8_t *)swift_slowAlloc();
              *(void *)&long long v51 = v48;
              *(_DWORD *)uint64_t v31 = 136315138;
              os_log_type_t v47 = v31 + 4;
              swift_bridgeObjectRetain();
              *(void *)&long long v49 = sub_236F4C85C(v26, *((unint64_t *)&v26 + 1), (uint64_t *)&v51);
              sub_236F4EAA8();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_236F34000, v29, v30, "No value returned from some getter of specifier for bundleIdentifier '%s.", v31, 0xCu);
              uint64_t v32 = v48;
              swift_arrayDestroy();
              MEMORY[0x237E11C00](v32, -1, -1);
              MEMORY[0x237E11C00](v31, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
            goto LABEL_32;
          }
          swift_bridgeObjectRelease();
        }
LABEL_27:
        if (qword_2688E4F48 != -1) {
          swift_once();
        }
        uint64_t v33 = __swift_project_value_buffer(v4, (uint64_t)qword_2688E62F8);
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v33, v4);
        id v34 = sub_236F4E358();
        os_log_type_t v35 = sub_236F4EA58();
        if (os_log_type_enabled(v34, v35))
        {
          long long v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v36 = 0;
          _os_log_impl(&dword_236F34000, v34, v35, "No value returned from getter of specifier (no bundleIdentifier found).", v36, 2u);
          MEMORY[0x237E11C00](v36, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        goto LABEL_32;
      }
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
    }
    sub_236F37E78((uint64_t)&v51, &qword_2688E5058);
    goto LABEL_27;
  }
  uint64_t v16 = v15;
  id v17 = objc_msgSend(v15, sel_performGetter);

  if (v17)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
  }
  sub_236F37E10((uint64_t)&v49, (uint64_t)&v51);
  if (!*((void *)&v52 + 1)) {
    goto LABEL_11;
  }
  sub_236F41F20(0, &qword_2688E53C0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v18 = (void *)v49;
  self;
  uint64_t v19 = (void *)swift_dynamicCastObjCClass();
  if (!v19)
  {
    self;
    uint64_t v19 = (void *)swift_dynamicCastObjCClass();
    if (!v19)
    {
      if (qword_2688E4F48 != -1) {
        swift_once();
      }
      uint64_t v37 = __swift_project_value_buffer(v4, (uint64_t)qword_2688E62F8);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v37, v4);
      uint64_t v38 = v18;
      uint64_t v39 = sub_236F4E358();
      os_log_type_t v40 = sub_236F4EA58();
      if (os_log_type_enabled(v39, v40))
      {
        char v41 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v47 = (void *)swift_slowAlloc();
        uint64_t v48 = v41;
        *(_DWORD *)char v41 = 138543362;
        uint64_t v46 = v41 + 4;
        *(void *)&long long v51 = v38;
        uint64_t v42 = v38;
        sub_236F4EAA8();
        uint64_t v43 = v47;
        *os_log_type_t v47 = v38;

        os_log_type_t v44 = v40;
        uint64_t v45 = v48;
        _os_log_impl(&dword_236F34000, v39, v44, "Could not resolve value of type '%{public}@' to a double.", v48, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2688E53C8);
        swift_arrayDestroy();
        MEMORY[0x237E11C00](v43, -1, -1);
        MEMORY[0x237E11C00](v45, -1, -1);
      }
      else
      {

        uint64_t v39 = v38;
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
LABEL_32:
      uint64_t v21 = 0;
      goto LABEL_33;
    }
  }
  objc_msgSend(v19, sel_doubleValue);
  uint64_t v21 = v20;

LABEL_33:
  *a2 = v21;
}

void sub_236F40D70(double *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4 = *a1;
  uint64_t v5 = a4 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x237E11CA0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v4);
    objc_msgSend(v7, sel_performSetterWithValue_, v8);
  }
  id v9 = objc_msgSend(self, sel_defaultCenter);
  if (qword_2688E4F58 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_2688E6328;
  swift_beginAccess();
  unint64_t v11 = (void *)MEMORY[0x237E11CA0](v5);
  objc_msgSend(v9, sel_postNotificationName_object_, v10, v11);
}

uint64_t sub_236F40EA8@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  double v4 = (void *)MEMORY[0x237E11CA0](v3);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_performGetter);

    if (v6)
    {
      sub_236F4EAC8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }
    sub_236F37E10((uint64_t)&v14, (uint64_t)v16);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_236F41AA4((uint64_t)v16, (uint64_t)&v14);
  if (!*((void *)&v15 + 1))
  {
    sub_236F37E78((uint64_t)&v14, &qword_2688E5058);
LABEL_11:
    sub_236F41AA4((uint64_t)v16, (uint64_t)&v14);
    if (*((void *)&v15 + 1))
    {
      sub_236F41F20(0, &qword_2688E53E0);
      if (swift_dynamicCast())
      {
        id v9 = objc_msgSend(v12, sel_stringValue);
        uint64_t v7 = sub_236F4E9A8();
        unint64_t v8 = v10;

        goto LABEL_16;
      }
    }
    else
    {
      sub_236F37E78((uint64_t)&v14, &qword_2688E5058);
    }
    uint64_t v7 = 0;
    unint64_t v8 = 0xE000000000000000;
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v7 = (uint64_t)v12;
  unint64_t v8 = v13;
LABEL_16:
  uint64_t result = sub_236F37E78((uint64_t)v16, &qword_2688E5058);
  *a2 = v7;
  a2[1] = v8;
  return result;
}

void sub_236F41060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x237E11CA0](v4);
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = (void *)sub_236F4E988();
    objc_msgSend(v6, sel_performSetterWithValue_, v7);
  }
  id v8 = objc_msgSend(self, sel_defaultCenter);
  if (qword_2688E4F58 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_2688E6328;
  swift_beginAccess();
  unint64_t v10 = (void *)MEMORY[0x237E11CA0](v4);
  objc_msgSend(v8, sel_postNotificationName_object_, v9, v10);
}

id sub_236F41180()
{
  if (!objc_msgSend(self, sel_cellClassForSpecifier_, v0)) {
    return 0;
  }
  swift_getObjCClassMetadata();
  sub_236F41F20(0, &qword_2688E53A0);
  id v1 = (id)swift_dynamicCastMetatype();
  if (!v1) {
    return v1;
  }
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  sub_236F41F20(0, &qword_2688E53A8);
  if (!-[objc_class isSubclassOfClass:](ObjCClassFromMetadata, sel_isSubclassOfClass_, swift_getObjCClassFromMetadata()))return objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_initWithStyle_reuseIdentifier_, 1, 0); {
  if (!swift_dynamicCastMetatype())
  }
    return 0;
  uint64_t v3 = (void *)swift_getObjCClassFromMetadata();
  id v4 = objc_msgSend(v3, sel_cellStyle);
  id v5 = objc_msgSend(v3, sel_reuseIdentifierForSpecifier_, v0);
  if (v5)
  {
    sub_236F4E9A8();

    id v6 = v0;
    id v5 = (id)sub_236F4E988();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = v0;
  }
  id v1 = objc_msgSend(objc_allocWithZone((Class)v3), sel_initWithStyle_reuseIdentifier_specifier_, v4, v5, v0);

  return v1;
}

uint64_t sub_236F41324()
{
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x263F60168]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_236F37E10((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v2;
    }
  }
  else
  {
    sub_236F37E78((uint64_t)v4, &qword_2688E5058);
    return 0;
  }
  return result;
}

uint64_t sub_236F413E8()
{
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x263F600A8]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_236F37E10((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v2;
    }
  }
  else
  {
    sub_236F37E78((uint64_t)v4, &qword_2688E5058);
  }
  return 1;
}

uint64_t sub_236F414AC()
{
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x263F5FFE0]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_236F37E10((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_236F37E78((uint64_t)v6, &qword_2688E5058);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5398);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  unsigned __int8 v2 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v3 = sub_236F4E9A8();

  return v3;
}

uint64_t sub_236F415B0()
{
  if (!objc_msgSend(v0, sel_cellType))
  {
    if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x263F600C0]))
    {
      sub_236F4EAC8();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v10, 0, sizeof(v10));
    }
    sub_236F37E10((uint64_t)v10, (uint64_t)v11);
    if (v12)
    {
      if (swift_dynamicCast())
      {
        sub_236F41F20(0, &qword_2688E53B0);
        ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
        uint64_t v3 = NSStringFromClass(ObjCClassFromMetadata);
        uint64_t v4 = sub_236F4E9A8();
        uint64_t v6 = v5;

        if (v8 == v4 && v9 == v6)
        {
          swift_bridgeObjectRelease_n();
          return 1;
        }
        char v7 = sub_236F4EC18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v7) {
          return 1;
        }
      }
    }
    else
    {
      sub_236F37E78((uint64_t)v11, &qword_2688E5058);
    }
  }
  return 0;
}

uint64_t sub_236F41730()
{
  id v1 = objc_msgSend(v0, sel_identifier);
  if (!v1) {
    goto LABEL_9;
  }
  unsigned __int8 v2 = v1;
  uint64_t v3 = sub_236F4E9A8();
  uint64_t v5 = v4;

  if (!v5) {
    goto LABEL_9;
  }
  if (v3 == 0x4143494649544F4ELL && v5 == 0xED0000534E4F4954) {
    goto LABEL_12;
  }
  char v7 = sub_236F4EC18();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
LABEL_9:
    uint64_t v9 = sub_236F414AC();
    if (!v10)
    {
      char v8 = 0;
      return v8 & 1;
    }
    if (v9 != 0xD00000000000002BLL || v10 != 0x8000000236F53070)
    {
      char v8 = sub_236F4EC18();
      goto LABEL_15;
    }
LABEL_12:
    char v8 = 1;
LABEL_15:
    swift_bridgeObjectRelease();
    return v8 & 1;
  }
  char v8 = 1;
  return v8 & 1;
}

void sub_236F4186C()
{
  id v1 = objc_msgSend(v0, sel_identifier);
  if (!v1 || (unsigned __int8 v2 = v1, v3 = sub_236F4E9A8(), v5 = v4, v2, !v5))
  {
LABEL_8:
    uint64_t v8 = sub_236F414AC();
    if (!v9) {
      return;
    }
    if (v8 != 0xD00000000000002BLL || v9 != 0x8000000236F53070)
    {
      char v10 = sub_236F4EC18();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0) {
        return;
      }
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 0x4143494649544F4ELL || v5 != 0xED0000534E4F4954)
  {
    char v7 = sub_236F4EC18();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
LABEL_11:
  swift_bridgeObjectRelease();
LABEL_13:
  id v11 = sub_236F41180();
  if (v11)
  {
    id v19 = v11;
    self;
    uint64_t v12 = (void *)swift_dynamicCastObjCClass();
    if (v12
      && (unint64_t v13 = v12,
          objc_msgSend(v12, sel_refreshCellContentsWithSpecifier_, v0),
          (id v14 = objc_msgSend(v13, sel_detailTextLabel)) != 0)
      && (long long v15 = v14, v16 = objc_msgSend(v14, sel_text), v15, v16))
    {
      sub_236F4E9A8();

      uint64_t v17 = sub_236F4E988();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setProperty_forKey_, v17, *MEMORY[0x263F60308]);

      uint64_t v18 = (void *)v17;
    }
    else
    {
      uint64_t v18 = v19;
    }
  }
}

uint64_t sub_236F41AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5058);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236F41B0C(uint64_t a1)
{
  return a1;
}

unint64_t sub_236F41B60(uint64_t a1)
{
  uint64_t v2 = sub_236F4EAE8();
  return sub_236F41C00(a1, v2);
}

uint64_t sub_236F41BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_236F41C00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_236F41CC8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x237E11540](v9, a1);
      sub_236F41B0C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_236F41CC8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_236F41D24()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_236F41D60(unsigned __int8 *a1@<X8>)
{
  sub_236F3F8B8(*(void *)(v1 + 32), a1);
}

void sub_236F41D70(unsigned __int8 *a1)
{
  sub_236F404F0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_236F41D7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E53D8);
    uint64_t v3 = sub_236F4EB18();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_236F4EC38();
      swift_bridgeObjectRetain();
      sub_236F4E9D8();
      uint64_t result = sub_236F4EC48();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        id v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_236F4EC18(), (result & 1) != 0))
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
          id v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_236F4EC18();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
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

uint64_t sub_236F41F20(uint64_t a1, unint64_t *a2)
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

void sub_236F41F60(void *a1@<X8>)
{
  sub_236F40620(*(void *)(v1 + 32), a1);
}

void sub_236F41F70(double *a1)
{
  sub_236F40D70(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_236F41F80@<X0>(uint64_t *a1@<X8>)
{
  return sub_236F40EA8(*(void *)(v1 + 32), a1);
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_236F41FD0(uint64_t a1)
{
  sub_236F41060(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_236F41FDC()
{
  uint64_t result = sub_236F4E988();
  qword_2688E6330 = result;
  return result;
}

uint64_t sub_236F42014()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236F4E3A8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236F42088(void *a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage) = a1;
  id v2 = a1;
  id v3 = objc_msgSend(v2, sel_numberOfSections);
  swift_beginAccess();
  sub_236F4E398();
  swift_endAccess();
  id v4 = objc_msgSend(self, sel_defaultCenter, v3);
  uint64_t v5 = qword_2688E4F60;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v1, sel_reloadWithNotification_, qword_2688E6330, 0);

  swift_release();
  return v1;
}

uint64_t sub_236F42254()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__numberOfSections;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5410);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_236F42308()
{
  return type metadata accessor for SpecifierController();
}

uint64_t type metadata accessor for SpecifierController()
{
  uint64_t result = qword_2688E53F8;
  if (!qword_2688E53F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_236F4235C()
{
  sub_236F423F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_236F423F8()
{
  if (!qword_2688E5408)
  {
    unint64_t v0 = sub_236F4E3C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2688E5408);
    }
  }
}

uint64_t sub_236F42450()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_236F4245C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236F4E388();
  *a1 = result;
  return result;
}

uint64_t ContentSizeCategory.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236F4280C(MEMORY[0x263F19A00], a1);
}

uint64_t ContentSizeCategory.description.getter()
{
  uint64_t v1 = sub_236F4E568();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  int v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x263F199C0]) {
    return 0x6D53206172747845;
  }
  if (v5 == *MEMORY[0x263F199F0]) {
    return 0x6C6C616D53;
  }
  if (v5 == *MEMORY[0x263F199F8]) {
    return 0x6D756964654DLL;
  }
  if (v5 == *MEMORY[0x263F199E8]) {
    return 0x656772614CLL;
  }
  if (v5 == *MEMORY[0x263F199B8]) {
    return 0x614C206172747845;
  }
  uint64_t v6 = 0xD000000000000011;
  if (v5 != *MEMORY[0x263F199C8])
  {
    if (v5 == *MEMORY[0x263F199A0])
    {
      return 0xD000000000000017;
    }
    else if (v5 == *MEMORY[0x263F199D8])
    {
      return 0x756964654D205841;
    }
    else if (v5 == *MEMORY[0x263F199D0])
    {
      return 0x656772614C205841;
    }
    else if (v5 == *MEMORY[0x263F199E0])
    {
      return 0x6172747845205841;
    }
    else if (v5 == *MEMORY[0x263F199A8])
    {
      return 0xD000000000000014;
    }
    else if (v5 == *MEMORY[0x263F199B0])
    {
      return 0xD00000000000001ALL;
    }
    else
    {
      uint64_t v6 = ContentSizeCategory.description.getter();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
  }
  return v6;
}

uint64_t ColorScheme.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_236F4280C(MEMORY[0x263F18520], a1);
}

uint64_t sub_236F4280C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, v2, v4);
}

uint64_t sub_236F4287C()
{
  return sub_236F4290C(&qword_2688E5418, MEMORY[0x263F19A00]);
}

uint64_t sub_236F428C4()
{
  return sub_236F4290C((unint64_t *)&unk_2688E5420, MEMORY[0x263F18520]);
}

uint64_t sub_236F4290C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236F42954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t View.then(_:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, v3);
  return a1(a3);
}

void *static _ControllerFactory.thirdPartySettingsControllerForSpecifier(specifier:)(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for SUIKPThirdPartyAppListController());
  sub_236F42C48();
  uint64_t v4 = v3;
  objc_msgSend(v3, sel_setSpecifier_, a1);
  return v4;
}

id _ControllerFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id _ControllerFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _ControllerFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _ControllerFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _ControllerFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for _ControllerFactory()
{
  return self;
}

uint64_t type metadata accessor for SUIKPThirdPartyAppListController()
{
  uint64_t result = qword_2688E5448;
  if (!qword_2688E5448) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_236F42BF8()
{
  return swift_initClassMetadata2();
}

void sub_236F42C48()
{
  *(void *)&v0[qword_2688E5430] = 0;
  *(void *)&v0[qword_2688E5438] = 0;
  uint64_t v1 = qword_2688E5440;
  *(void *)&v0[qword_2688E5440] = 0;
  id v2 = objc_allocWithZone(MEMORY[0x263F5FCC0]);
  uint64_t v3 = v0;
  id v4 = objc_msgSend(v2, sel_init);
  int v5 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v4;

  uint64_t v6 = *(void **)&v0[v1];
  if (v6)
  {
    swift_unknownObjectWeakInit();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v14 = sub_236F4423C;
    uint64_t v15 = v7;
    LOBYTE(v16) = 0;
    uint64_t v17 = 0;
    swift_unknownObjectWeakAssign();
    sub_236F441DC((uint64_t)&v14, (uint64_t)v18);
    id v8 = v6;
    uint64_t v9 = (char *)(id)sub_236F4E5A8();
    uint64_t v10 = (void (*)(unsigned char *, void))sub_236F4E5B8();
    *(void *)(v11 + 32) = &off_26EA0CCC0;
    swift_unknownObjectWeakAssign();
    v10(v18, 0);
    unint64_t v12 = *(void **)&v9[qword_2688E5440];
    if (v12)
    {
      objc_msgSend(v12, sel_setViewController_, v9, v14, v15, v16);
      id v13 = objc_msgSend(v9, sel_navigationItem);
      objc_msgSend(v13, sel_setLargeTitleDisplayMode_, 2);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_236F42DF4(void *a1)
{
  *(void *)&v1[qword_2688E5430] = 0;
  *(void *)&v1[qword_2688E5438] = 0;
  uint64_t v3 = qword_2688E5440;
  *(void *)&v1[qword_2688E5440] = 0;
  id v4 = objc_allocWithZone(MEMORY[0x263F5FCC0]);
  int v5 = v1;
  id v6 = objc_msgSend(v4, sel_init);
  uint64_t v7 = *(void **)&v1[v3];
  *(void *)&v1[v3] = v6;

  id v8 = *(void **)&v1[v3];
  if (v8)
  {
    swift_unknownObjectWeakInit();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v18 = sub_236F441D4;
    uint64_t v19 = v9;
    LOBYTE(v20) = 0;
    uint64_t v21 = 0;
    swift_unknownObjectWeakAssign();
    sub_236F441DC((uint64_t)&v18, (uint64_t)v22);
    id v10 = a1;
    id v11 = v8;
    unint64_t v12 = (void *)sub_236F4E598();
    if (!v12)
    {
LABEL_5:

      return;
    }
    id v13 = v12;
    uint64_t v14 = (void (*)(unsigned char *, void))sub_236F4E5B8();
    *(void *)(v15 + 32) = &off_26EA0CCC0;
    swift_unknownObjectWeakAssign();
    v14(v22, 0);
    uint64_t v16 = *(void **)&v13[qword_2688E5440];
    if (v16)
    {
      objc_msgSend(v16, sel_setViewController_, v13, v18, v19, v20);
      id v17 = objc_msgSend(v13, sel_navigationItem);
      objc_msgSend(v17, sel_setLargeTitleDisplayMode_, 2);

      goto LABEL_5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_236F42FBC(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_236F42FE4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)&a1[qword_2688E5440];
  if (v3)
  {
    int v5 = a1;
    objc_msgSend(v3, sel_viewWillAppear_, a3);
    v6.receiver = v5;
    v6.super_class = (Class)type metadata accessor for SUIKPThirdPartyAppListController();
    objc_msgSendSuper2(&v6, sel_viewWillAppear_, a3);
  }
  else
  {
    __break(1u);
  }
}

void sub_236F43064()
{
}

void sub_236F43094()
{
}

void sub_236F430C4()
{
  uint64_t v1 = *(void **)(v0 + qword_2688E5440);
}

id sub_236F43114()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SUIKPThirdPartyAppListController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_236F4314C(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + qword_2688E5440);
}

uint64_t sub_236F431A8()
{
  return type metadata accessor for SUIKPThirdPartyAppListController();
}

void sub_236F431B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_236F4E378();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2688E4F50 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2688E6310);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_236F4E358();
  os_log_type_t v8 = sub_236F4EA58();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v13 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v12 = sub_236F4C85C(0xD000000000000015, 0x8000000236F532F0, &v13);
    sub_236F4EAA8();
    _os_log_impl(&dword_236F34000, v7, v8, "SUIKPThirdPartyAppListController %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E11C00](v10, -1, -1);
    MEMORY[0x237E11C00](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v11 = objc_msgSend(self, sel_defaultCenter);
  if (qword_2688E4F60 != -1) {
    swift_once();
  }
  objc_msgSend(v11, sel_postNotificationName_object_, qword_2688E6330, *(void *)(v1 + qword_2688E5440));
}

void sub_236F4345C(void *a1)
{
  id v1 = a1;
  sub_236F431B0();
}

void sub_236F434A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(id *)(a1 + qword_2688E5438);
  *(void *)(a1 + qword_2688E5438) = a3;
  id v3 = a3;
}

void sub_236F434EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(id *)(a1 + qword_2688E5430);
  *(void *)(a1 + qword_2688E5430) = a3;
  id v3 = a3;
}

id sub_236F43534(uint64_t a1)
{
  return *(id *)(a1 + qword_2688E5430);
}

id sub_236F43544(uint64_t a1)
{
  return *(id *)(a1 + qword_2688E5438);
}

void sub_236F43554(uint64_t a1)
{
  uint64_t v3 = qword_2688E5440;
  id v4 = *(void **)&v1[qword_2688E5440];
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!a1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_msgSend(v4, sel_setSpecifier_);
  int v5 = *(void **)&v1[v3];
  if (!v5)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v6 = objc_msgSend(v5, sel_specifier);
  id v7 = objc_msgSend(v6, sel_name);

  objc_msgSend(v1, sel_setTitle_, v7);
}

void sub_236F4360C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_236F43554((uint64_t)a3);
}

id sub_236F43678(uint64_t a1)
{
  id result = *(id *)(a1 + qword_2688E5440);
  if (result)
  {
    id v2 = objc_msgSend(result, sel_specifier);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_236F436C4(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, sel_showController_animate_, a3, 1);
}

void sub_236F436D4(void *a1, uint64_t a2, void *a3, int a4)
{
  if (a4)
  {
    if (a3)
    {
      objc_msgSend(a1, sel_showViewController_sender_);
      return;
    }
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  id v9 = a1;
  id v5 = a3;
  id v6 = objc_msgSend(v9, sel_navigationController);
  if (v6)
  {
    if (!v5) {
      goto LABEL_14;
    }
    id v8 = v6;
    objc_msgSend(v6, sel_pushViewController_animated_, v5, 0);

    id v7 = v8;
  }
  else
  {

    id v7 = v9;
  }
}

uint64_t sub_236F437B0(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + qword_2688E5440);
  if (!v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  id result = sub_236F41AA4(result, (uint64_t)v12);
  uint64_t v5 = v13;
  if (!v13)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v6 = __swift_project_boxed_opaque_existential_0(v12, v13);
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  id v10 = v3;
  uint64_t v11 = sub_236F4EC08();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  id result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  if (a2)
  {
    objc_msgSend(v10, sel_setPreferenceValue_specifier_, v11, a2);

    return swift_unknownObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_236F4391C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a1;
    swift_unknownObjectRetain();
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    id v8 = a4;
    id v9 = a1;
  }
  sub_236F437B0((uint64_t)v11, (uint64_t)a4);

  return sub_236F44098((uint64_t)v11);
}

char *sub_236F439A8(char *result, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)&result[qword_2688E5440];
  if (!v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  id v4 = result;
  id v5 = a3;
  id v6 = v4;
  id v7 = objc_msgSend(v3, sel_readPreferenceValue_, v5);
  sub_236F4EAC8();

  swift_unknownObjectRelease();
  uint64_t v8 = v15;
  if (v15)
  {
    id v9 = __swift_project_boxed_opaque_existential_0(v14, v15);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v9);
    uint64_t v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = (void *)sub_236F4EC08();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  else
  {
    uint64_t v13 = 0;
  }
  return (char *)v13;
}

uint64_t sub_236F43B38(void *a1, int a2, uint64_t a3, void *aBlock)
{
  id v6 = _Block_copy(aBlock);
  if (a3) {
    sub_236F4E978();
  }
  if (v6)
  {
    id v7 = (void (*)(void *))v6[2];
    id v8 = a1;
    v7(v6);
    _Block_release(v6);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_236F43BE0()
{
  return 1;
}

id sub_236F43BE8(uint64_t a1)
{
  id result = *(id *)(a1 + qword_2688E5440);
  if (result) {
    return objc_msgSend(result, sel_reloadSpecifiers);
  }
  __break(1u);
  return result;
}

void sub_236F43C08(int a1, id a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a2, sel_buttonAction))
  {
    objc_msgSend(a2, sel_performButtonAction);
    return;
  }
  if (objc_msgSend(a2, sel_cellType) != (id)3) {
    return;
  }
  uint64_t v19 = -1;
  uint64_t v20 = -1;
  uint64_t v4 = qword_2688E5440;
  id v5 = *(void **)(v2 + qword_2688E5440);
  if (!v5)
  {
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (!objc_msgSend(v5, sel_getGroup_row_ofSpecifier_, &v20, &v19, a2)) {
    return;
  }
  id v6 = *(void **)(v2 + v4);
  if (!v6) {
    goto LABEL_35;
  }
  uint64_t v7 = v20;
  id v8 = v6;
  id v9 = objc_msgSend(v8, sel_specifierAtIndex_, objc_msgSend(v8, sel_indexOfGroup_, v7));

  if (objc_msgSend(v9, sel_propertyForKey_, *MEMORY[0x263F60168]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  sub_236F37E10((uint64_t)&v21, (uint64_t)&v23);
  if (!*((void *)&v24 + 1))
  {
    sub_236F44098((uint64_t)&v23);
LABEL_18:

    return;
  }
  if (!swift_dynamicCast() || (v18 & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v10 = *MEMORY[0x263F60200];
  if (objc_msgSend(v9, sel_propertyForKey_, *MEMORY[0x263F60200]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  sub_236F37E10((uint64_t)&v21, (uint64_t)&v23);
  if (!*((void *)&v24 + 1))
  {

    sub_236F44098((uint64_t)&v23);
    return;
  }
  sub_236F37ED4();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  if (objc_msgSend(v18, sel_isEqualToSpecifier_, a2))
  {

    goto LABEL_18;
  }
  objc_msgSend(v9, sel_setProperty_forKey_, a2, v10);
  uint64_t v11 = *(void **)(v2 + v4);
  if (!v11) {
    goto LABEL_36;
  }
  id v12 = v11;
  if (!objc_msgSend(v9, sel_propertyForKey_, v10))
  {
LABEL_37:
    __break(1u);
    return;
  }
  sub_236F4EAC8();
  swift_unknownObjectRelease();
  sub_236F440F8(&v21, &v23);
  swift_dynamicCast();
  id v13 = objc_msgSend(v18, sel_propertyForKey_, *MEMORY[0x263F60308]);

  if (v13)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5058);
  uint64_t v14 = sub_236F4EA98();
  sub_236F44098((uint64_t)&v23);
  objc_msgSend(v12, sel_setPreferenceValue_specifier_, v14, v9);

  swift_unknownObjectRelease();
  uint64_t v15 = self;
  id v16 = objc_msgSend(v15, sel_defaultCenter);
  if (qword_2688E4F58 != -1) {
    swift_once();
  }
  objc_msgSend(v16, sel_postNotificationName_object_, qword_2688E6328, v9);

  id v17 = objc_msgSend(v15, sel_defaultCenter);
  objc_msgSend(v17, sel_postNotificationName_object_, qword_2688E6328, a2);
}

uint64_t sub_236F44098(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5058);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_236F440F8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_236F4419C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_236F441D4()
{
  return sub_236F470E8(*(void **)(v0 + 16));
}

uint64_t sub_236F441DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_236F44240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

void sub_236F44248()
{
  sub_236F44B80();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_236F442FC(void *a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    *a1 = v5;
    a1[1] = v8;
    uint64_t v9 = a3[9];
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_236F4E568();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[11];
    *(void *)((char *)a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(void *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    uint64_t v14 = a3[12];
    uint64_t v15 = (char *)a1 + v14;
    id v16 = (char *)a2 + v14;
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = v16[8];
  }
  return a1;
}

uint64_t sub_236F44458(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_236F4E568();
    id v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_236F44510(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_236F4E568();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v12 = a3[12];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  return a1;
}

void *sub_236F44618(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = a3[9];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_236F44740((uint64_t)a1 + v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_236F4E568();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  uint64_t v11 = a3[12];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  v12[8] = v13[8];
  *(void *)uint64_t v12 = v14;
  return a1;
}

uint64_t sub_236F44740(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_236F447A0(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_236F4E568();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v12 = a3[12];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  return a1;
}

_OWORD *sub_236F448B4(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[9];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_236F44740((uint64_t)a1 + v6);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_236F4E568();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v12 = a3[12];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  return a1;
}

uint64_t sub_236F449E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_236F449F4);
}

uint64_t sub_236F449F4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2688E54B8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_236F44AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_236F44ABC);
}

void *sub_236F44ABC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *id result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2688E54B8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 36);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AdaptiveStack()
{
  return __swift_instantiateGenericMetadata();
}

void sub_236F44B80()
{
  if (!qword_2688E5540)
  {
    sub_236F4E568();
    unint64_t v0 = sub_236F4E3D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2688E5540);
    }
  }
}

uint64_t sub_236F44BD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F44C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236F4E5C8();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_236F4E5D8();
}

uint64_t sub_236F44D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_236F4E5C8();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_236F4E5D8();
}

uint64_t sub_236F44E0C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  sub_236F4E918();
  sub_236F4E8D8();
  sub_236F4E5E8();
  uint64_t v5 = sub_236F4E858();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v20 = v3;
  uint64_t v21 = v4;
  uint64_t v22 = v2;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v24 = WitnessTable;
  uint64_t v25 = v13;
  uint64_t v14 = swift_getWitnessTable();
  sub_236F4E848();
  uint64_t v23 = v14;
  swift_getWitnessTable();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v15(v11, v9, v5);
  id v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v15(v19, v11, v5);
  return ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
}

uint64_t sub_236F4504C@<X0>(char *a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v55 = a4;
  uint64_t v7 = sub_236F4E8D8();
  uint64_t v50 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v49 = (char *)&v44 - v10;
  uint64_t v11 = sub_236F4E918();
  uint64_t WitnessTable = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  os_log_type_t v44 = (char *)&v44 - v15;
  uint64_t v16 = sub_236F4E568();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = v7;
  uint64_t v20 = sub_236F4E5E8();
  uint64_t v53 = *(void *)(v20 - 8);
  uint64_t v54 = v20;
  MEMORY[0x270FA5388](v20);
  long long v52 = (char *)&v44 - v21;
  uint64_t v22 = type metadata accessor for AdaptiveStack();
  sub_236F3DEF0((uint64_t)v19);
  uint64_t v45 = v17;
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t))(v17 + 88);
  uint64_t v47 = v16;
  int v24 = v23(v19, v16);
  if (v24 == *MEMORY[0x263F199D0]
    || v24 == *MEMORY[0x263F199E0]
    || v24 == *MEMORY[0x263F199A8]
    || v24 == *MEMORY[0x263F199B0])
  {
    MEMORY[0x270FA5388](*(void *)&a1[*(int *)(v22 + 44)]);
    *(&v44 - 4) = a2;
    *(&v44 - 3) = a3;
    *(&v44 - 2) = a1;
    sub_236F4E908();
    swift_getWitnessTable();
    uint64_t v28 = WitnessTable;
    char v29 = *(void (**)(char *, char *, uint64_t))(WitnessTable + 16);
    os_log_type_t v30 = v44;
    v29(v44, v14, v11);
    uint64_t v31 = *(void (**)(char *, uint64_t))(v28 + 8);
    v31(v14, v11);
    v29(v14, v30, v11);
    swift_getWitnessTable();
    uint64_t v38 = v52;
    sub_236F44C1C((uint64_t)v14, v11);
    v31(v14, v11);
    v31(v30, v11);
  }
  else
  {
    MEMORY[0x270FA5388](*(void *)&a1[*(int *)(v22 + 40)]);
    *(&v44 - 4) = a2;
    *(&v44 - 3) = a3;
    *(&v44 - 2) = a1;
    uint64_t v32 = (uint64_t)v46;
    sub_236F4E8C8();
    uint64_t v33 = v51;
    uint64_t WitnessTable = swift_getWitnessTable();
    id v34 = v49;
    uint64_t v35 = v50;
    long long v36 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
    v36(v49, v32, v33);
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v37(v32, v33);
    v36((char *)v32, (uint64_t)v34, v33);
    swift_getWitnessTable();
    uint64_t v38 = v52;
    sub_236F44D14(v32, v11, v33);
    v37(v32, v33);
    v37((uint64_t)v34, v33);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v19, v47);
  }
  uint64_t v39 = swift_getWitnessTable();
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v56 = v39;
  uint64_t v57 = v40;
  uint64_t v41 = v54;
  swift_getWitnessTable();
  uint64_t v42 = v53;
  (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v55, v38, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v38, v41);
}

uint64_t sub_236F456A8@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void (**)(uint64_t))MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v15 - v9;
  (*v8)(v11);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v12(v10, v7, a1);
  uint64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v12(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v13)(v10, a1);
}

uint64_t sub_236F457F0@<X0>(uint64_t a1@<X8>)
{
  return sub_236F4504C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_236F457FC@<X0>(char *a1@<X8>)
{
  return sub_236F456A8(*(void *)(v1 + 16), a1);
}

uint64_t sub_236F45820@<X0>(char *a1@<X8>)
{
  return sub_236F456A8(*(void *)(v1 + 16), a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_236F45874()
{
  return swift_getWitnessTable();
}

void *initializeBufferWithCopyOfBuffer for SUIKPDestinationViewControllerRepresentable(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for SUIKPDestinationViewControllerRepresentable(uint64_t a1)
{
}

void *assignWithCopy for SUIKPDestinationViewControllerRepresentable(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for SUIKPDestinationViewControllerRepresentable(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPDestinationViewControllerRepresentable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SUIKPDestinationViewControllerRepresentable(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SUIKPDestinationViewControllerRepresentable()
{
  return &type metadata for SUIKPDestinationViewControllerRepresentable;
}

unint64_t sub_236F45AC4()
{
  unint64_t result = qword_2688E5550;
  if (!qword_2688E5550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5550);
  }
  return result;
}

id sub_236F45B18(int a1, int a2, id a3)
{
  if (!objc_msgSend(a3, sel_detailControllerClass))
  {
    id result = (id)sub_236F4EBD8();
    __break(1u);
    return result;
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (ObjCClassMetadata == sub_236F45DE8()) {
    goto LABEL_5;
  }
  id v5 = (id)CreateDetailControllerInstanceWithClass();
  if (!v5)
  {
    __break(1u);
LABEL_5:
    id v6 = objc_allocWithZone((Class)type metadata accessor for SUIKPThirdPartyAppListController());
    id v7 = a3;
    sub_236F42C48();
    id v5 = v8;
    objc_msgSend(v8, sel_setSpecifier_, v7);
  }
  uint64_t v9 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v9) {
    objc_msgSend(v9, sel_setSpecifier_, a3);
  }
  return v5;
}

id sub_236F45C48(int a1, int a2)
{
  return sub_236F45B18(a1, a2, *(id *)(v2 + 8));
}

uint64_t sub_236F45C5C()
{
  return sub_236F4E638();
}

uint64_t sub_236F45C98()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_236F45CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236F45D94();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_236F45D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236F45D94();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_236F45D6C()
{
}

unint64_t sub_236F45D94()
{
  unint64_t result = qword_2688E5558;
  if (!qword_2688E5558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5558);
  }
  return result;
}

unint64_t sub_236F45DE8()
{
  unint64_t result = qword_2688E5560;
  if (!qword_2688E5560)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688E5560);
  }
  return result;
}

uint64_t *sub_236F45E2C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_236F4E568();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    swift_unknownObjectWeakCopyInit();
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (uint64_t *)((char *)a1 + v10);
    uint64_t v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = (void *)v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
    id v17 = v16;
  }
  return a1;
}

void sub_236F45F78(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_236F4E568();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 28) + 8);
}

void *sub_236F46038(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_236F4E568();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  swift_unknownObjectWeakCopyInit();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = (void *)v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  id v15 = v14;
  return a1;
}

void *sub_236F46134(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_236F37E78((uint64_t)a1, &qword_2688E5318);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_236F4E568();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  swift_unknownObjectWeakCopyAssign();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  uint64_t v13 = (void *)v12[1];
  uint64_t v14 = (void *)v11[1];
  v11[1] = v13;
  id v15 = v13;

  return a1;
}

char *sub_236F46270(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_236F4E568();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  swift_unknownObjectWeakTakeInit();
  uint64_t v8 = *(int *)(a3 + 28);
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  return a1;
}

char *sub_236F4635C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_236F37E78((uint64_t)a1, &qword_2688E5318);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_236F4E568();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  swift_unknownObjectWeakTakeAssign();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = &a1[v13];
  id v15 = &a2[v13];
  uint64_t v17 = *(void *)v15;
  uint64_t v16 = *((void *)v15 + 1);
  uint64_t v18 = (void *)*((void *)v14 + 1);
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = v16;

  return a1;
}

uint64_t sub_236F46484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_236F46498);
}

uint64_t sub_236F46498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2688E54B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_236F46560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_236F46574);
}

uint64_t sub_236F46574(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(qword_2688E54B8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SUIKPFooterHyperlinkView()
{
  uint64_t result = qword_2688E5568;
  if (!qword_2688E5568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_236F46684()
{
  sub_236F44B80();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_236F4672C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F46748()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SUIKPFooterHyperlinkView() + 28);
  id v2 = *(id *)(v1 + 8);
  sub_236F3F5DC();
  uint64_t v4 = v3;
  uint64_t v6 = v5;

  if (objc_msgSend(v2, sel_propertyForKey_, *MEMORY[0x263F600E0]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  sub_236F37E10((uint64_t)&v43, (uint64_t)&v45);
  if (!v46)
  {
    sub_236F37E78((uint64_t)&v45, &qword_2688E5058);
    goto LABEL_23;
  }
  sub_236F440F8(&v45, &v37);
  sub_236F41F20(0, &qword_2688E5598);
  swift_dynamicCast();
  if (!v35)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_25;
  }
  if (objc_msgSend(v35, sel_nonretainedObjectValue))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  sub_236F37E10((uint64_t)&v43, (uint64_t)&v45);
  if (v46)
  {
    sub_236F440F8(&v45, &v37);
    sub_236F41F20(0, &qword_2688E53C0);
    swift_dynamicCast();
    id v34 = v35;
  }
  else
  {
    sub_236F37E78((uint64_t)&v45, &qword_2688E5058);
    id v34 = 0;
  }
  if (objc_msgSend(*(id *)(v1 + 8), sel_propertyForKey_, *MEMORY[0x263F600C8]))
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  sub_236F37E10((uint64_t)&v43, (uint64_t)&v45);
  uint64_t v7 = v6;
  if (v46)
  {
    sub_236F440F8(&v45, &v37);
    swift_dynamicCast();
    id v8 = v35;
    uint64_t v33 = v36;
  }
  else
  {
    sub_236F37E78((uint64_t)&v45, &qword_2688E5058);
    id v8 = 0;
    uint64_t v33 = 0;
  }
  id v9 = objc_msgSend(self, sel_appearance);
  id v10 = objc_msgSend(v9, sel_footerHyperlinkColor);

  if (!v10) {
    goto LABEL_24;
  }
  MEMORY[0x237E11280](v10);
  if (!v4)
  {
LABEL_25:
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_26;
  }
  sub_236F4E828();
  uint64_t v11 = sub_236F4E708();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (v7)
  {
    char v17 = v15 & 1;
    swift_retain();
    uint64_t v18 = sub_236F4E708();
    uint64_t v20 = v19;
    char v22 = v21;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v23 = sub_236F4E718();
    uint64_t v32 = v24;
    uint64_t v26 = v25;
    char v31 = v27;
    sub_236F37B60(v18, v20, v22 & 1);
    swift_bridgeObjectRelease();
    sub_236F37B60(v11, v13, v17);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)&long long v37 = v23;
    *((void *)&v37 + 1) = v26;
    char v38 = v31 & 1;
    uint64_t v39 = v32;
    uint64_t v40 = KeyPath;
    uint64_t v41 = 0;
    char v42 = 1;
    char v29 = (void *)swift_allocObject();
    v29[2] = v34;
    v29[3] = v8;
    v29[4] = v33;
    id v30 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5578);
    sub_236F46D10();
    sub_236F4E788();

    swift_release();
    swift_release();
    sub_236F37B60(v37, *((uint64_t *)&v37 + 1), v38);
    swift_bridgeObjectRelease();
    return swift_release();
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_236F46C40(id result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a3)
    {
      uint64_t v3 = result;
      uint64_t v4 = (NSString *)sub_236F4E988();
      SEL v5 = NSSelectorFromString(v4);

      id v6 = v3;
      return objc_msgSend(v6, sel_performSelector_, v5);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_236F46CC4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_236F46D04()
{
  return sub_236F46C40(*(id *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_236F46D10()
{
  unint64_t result = qword_2688E5580;
  if (!qword_2688E5580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5578);
    sub_236F46D8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5580);
  }
  return result;
}

unint64_t sub_236F46D8C()
{
  unint64_t result = qword_2688E5588;
  if (!qword_2688E5588)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5588);
  }
  return result;
}

uint64_t sub_236F46DE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F46E44()
{
  return swift_retain();
}

uint64_t destroy for SUIKPThirdPartyAppListView()
{
  sub_236F46E90();
  return swift_unknownObjectWeakDestroy();
}

uint64_t sub_236F46E90()
{
  return swift_release();
}

uint64_t initializeWithCopy for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_236F46E44();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  swift_unknownObjectWeakCopyInit();
  *(void *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t assignWithCopy for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_236F46E44();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_236F46E90();
  swift_unknownObjectWeakCopyAssign();
  *(void *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t initializeWithTake for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_unknownObjectWeakTakeInit();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_236F46E90();
  swift_unknownObjectWeakTakeAssign();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPThirdPartyAppListView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 32) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)(a1 + 24) & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SUIKPThirdPartyAppListView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      *(void *)(result + 32) = 1;
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPThirdPartyAppListView()
{
  return &type metadata for SUIKPThirdPartyAppListView;
}

uint64_t sub_236F470CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F470E8(void *a1)
{
  return sub_236F42088(a1);
}

uint64_t sub_236F47128@<X0>(uint64_t a1@<X8>)
{
  int v2 = v1;
  uint64_t v33 = a1;
  uint64_t v32 = sub_236F4E508();
  uint64_t v3 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  char v31 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E55A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E55A8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E55B0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v29 = v12;
  uint64_t v30 = v13;
  MEMORY[0x270FA5388](v12);
  char v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v34 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E55B8);
  sub_236F38010(&qword_2688E55C0, &qword_2688E55B8);
  sub_236F4E6F8();
  sub_236F4C3F4(v2, (uint64_t)&v35);
  uint64_t v16 = swift_allocObject();
  sub_236F441DC((uint64_t)&v35, v16 + 16);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v8, v5);
  char v17 = (void (**)())&v11[*(int *)(v9 + 36)];
  *char v17 = sub_236F4C430;
  v17[1] = (void (*)())v16;
  _OWORD v17[2] = 0;
  v17[3] = 0;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  unint64_t v18 = sub_236F4C438();
  sub_236F4E748();
  sub_236F37E78((uint64_t)v11, &qword_2688E55A8);
  uint64_t v35 = sub_236F49424();
  unint64_t v36 = v19;
  sub_236F37B70();
  uint64_t v20 = sub_236F4E738();
  uint64_t v22 = v21;
  LOBYTE(v8) = v23 & 1;
  uint64_t v24 = v31;
  uint64_t v25 = v32;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v31, *MEMORY[0x263F19698], v32);
  uint64_t v35 = v9;
  unint64_t v36 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v29;
  sub_236F4E7C8();
  sub_236F37B60(v20, v22, (char)v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v24, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v15, v26);
}

uint64_t sub_236F47548(uint64_t *a1)
{
  sub_236F4763C();
  sub_236F4C3F4(a1, (uint64_t)v4);
  uint64_t v2 = swift_allocObject();
  sub_236F441DC((uint64_t)v4, v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E55E8);
  sub_236F4CFF0(&qword_2688E55F0, &qword_2688E55E8, (void (*)(void))sub_236F4CEC4);
  return sub_236F4E348();
}

void sub_236F4763C()
{
  type metadata accessor for SpecifierController();
  sub_236F4DF38(&qword_2688E55D8, (void (*)(uint64_t))type metadata accessor for SpecifierController);
  id v0 = objc_msgSend(*(id *)(sub_236F4E3F8() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifier);
  swift_release();
  *(void *)&long long v4 = sub_236F4E9A8();
  *((void *)&v4 + 1) = v1;
  id v2 = objc_msgSend(v0, sel_objectForKeyedSubscript_, sub_236F4EC28());
  swift_unknownObjectRelease();

  if (v2)
  {
    sub_236F4EAC8();
    swift_unknownObjectRelease();
    sub_236F440F8(&v3, &v4);
    swift_dynamicCast();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_236F4779C(uint64_t *a1)
{
  id v5 = sub_236F478D8();
  sub_236F4C3F4(a1, (uint64_t)v4);
  uint64_t v2 = swift_allocObject();
  sub_236F441DC((uint64_t)v4, v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5600);
  sub_236F38010(&qword_2688E57F0, &qword_2688E57E8);
  sub_236F4CEC4();
  sub_236F4DF38(&qword_2688E57F8, (void (*)(uint64_t))sub_236F37ED4);
  return sub_236F4E948();
}

id sub_236F478D8()
{
  type metadata accessor for SpecifierController();
  sub_236F4DF38(&qword_2688E55D8, (void (*)(uint64_t))type metadata accessor for SpecifierController);
  sub_236F4E3F8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236F4E3A8();
  swift_release();
  swift_release();
  id result = (id)swift_release();
  int64_t v1 = v17;
  if (v17 < 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t v2 = sub_236F4E3F8();
  uint64_t v3 = MEMORY[0x263F8EE78];
  long long v4 = &qword_2688E5000;
  if (v17)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    id result = (id)sub_236F4DBB4(0, v1, 0);
    uint64_t v5 = 0;
    uint64_t v6 = v18;
    uint64_t v7 = OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage;
    while (v1 != v5)
    {
      id result = objc_msgSend(*(id *)(v2 + v7), sel_indexOfGroup_, v5);
      id v8 = result;
      unint64_t v10 = *(void *)(v18 + 16);
      unint64_t v9 = *(void *)(v18 + 24);
      if (v10 >= v9 >> 1) {
        id result = (id)sub_236F4DBB4(v9 > 1, v10 + 1, 1);
      }
      ++v5;
      *(void *)(v18 + 16) = v10 + 1;
      *(void *)(v18 + 8 * v10 + 32) = v8;
      if (v1 == v5)
      {
        swift_release();
        long long v4 = &qword_2688E5000;
        uint64_t v3 = MEMORY[0x263F8EE78];
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_release();
  uint64_t v6 = MEMORY[0x263F8EE78];
LABEL_10:
  uint64_t v11 = sub_236F4E3F8();
  uint64_t v12 = *(void *)(v6 + 16);
  if (v12)
  {
    sub_236F4EB88();
    uint64_t v13 = 0;
    uint64_t v14 = v4[126];
    do
    {
      uint64_t v15 = v13 + 1;
      id v16 = objc_msgSend(*(id *)(v11 + v14), sel_specifierAtIndex_, *(void *)(v6 + 8 * v13 + 32));
      sub_236F4EB68();
      sub_236F4EB98();
      sub_236F4EBA8();
      sub_236F4EB78();
      uint64_t v13 = v15;
    }
    while (v12 != v15);
  }
  swift_release();
  swift_bridgeObjectRelease();
  return (id)v3;
}

uint64_t sub_236F47BA4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  id v4 = sub_236F478D8();
  sub_236F47C00(v3, (unint64_t)v4, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_236F47C00@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57A8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v153 = (uint64_t)&v143 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5610);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v147 = (uint64_t)&v143 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v156 = (uint64_t)&v143 - v15;
  uint64_t v152 = sub_236F4E378();
  uint64_t v16 = *(void *)(v152 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v152);
  v146 = (char *)&v143 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v158 = (char *)&v143 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  char v23 = (char *)&v143 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v154 = (char *)&v143 - v25;
  MEMORY[0x270FA5388](v24);
  char v27 = (char *)&v143 - v26;
  sub_236F497FC((uint64_t)a1, a2);
  if (v28) {
    goto LABEL_67;
  }
  uint64_t v148 = v12;
  v149 = v10;
  uint64_t v150 = v7;
  uint64_t v151 = a3;
  id v155 = a1;
  uint64_t v157 = a2;
  sub_236F497FC((uint64_t)a1, a2);
  if (v30)
  {
    __break(1u);
LABEL_67:
    uint64_t v105 = v3;
    uint64_t v106 = a1;
    uint64_t v145 = v16;
    id v107 = objc_msgSend(self, sel_currentDevice);
    unsigned int v108 = objc_msgSend(v107, sel_sf_isInternalInstall);

    if (v108)
    {
      if (qword_2688E4F50 != -1) {
        swift_once();
      }
      uint64_t v109 = v152;
      uint64_t v110 = __swift_project_value_buffer(v152, (uint64_t)qword_2688E6310);
      (*(void (**)(char *, uint64_t, uint64_t))(v145 + 16))(v27, v110, v109);
      sub_236F4C3F4(v105, (uint64_t)v164);
      id v111 = v106;
      swift_bridgeObjectRetain_n();
      id v112 = v111;
      uint64_t v113 = sub_236F4E358();
      os_log_type_t v114 = sub_236F4EA48();
      LODWORD(v158) = v114;
      if (os_log_type_enabled(v113, v114))
      {
        uint64_t v115 = swift_slowAlloc();
        uint64_t v116 = (void *)swift_slowAlloc();
        uint64_t v157 = swift_slowAlloc();
        *(void *)&long long v161 = v157;
        *(_DWORD *)uint64_t v115 = 136315906;
        uint64_t v159 = sub_236F4C85C(0xD00000000000001FLL, 0x8000000236F536D0, (uint64_t *)&v161);
        sub_236F4EAA8();
        *(_WORD *)(v115 + 12) = 2080;
        sub_236F4763C();
        uint64_t v159 = sub_236F4C85C(v117, v118, (uint64_t *)&v161);
        sub_236F4EAA8();
        swift_bridgeObjectRelease();
        sub_236F4C4D8((uint64_t)v164);
        *(_WORD *)(v115 + 22) = 2114;
        uint64_t v159 = (uint64_t)v112;
        id v119 = v112;
        sub_236F4EAA8();
        *uint64_t v116 = v112;

        *(_WORD *)(v115 + 32) = 2082;
        unint64_t v120 = sub_236F37ED4();
        uint64_t v121 = swift_bridgeObjectRetain();
        uint64_t v122 = MEMORY[0x237E11460](v121, v120);
        unint64_t v124 = v123;
        swift_bridgeObjectRelease();
        uint64_t v159 = sub_236F4C85C(v122, v124, (uint64_t *)&v161);
        sub_236F4EAA8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_236F34000, v113, (os_log_type_t)v158, "%s: app: %s s: %{public}@ not in [s]: %{public}s'", (uint8_t *)v115, 0x2Au);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2688E53C8);
        swift_arrayDestroy();
        MEMORY[0x237E11C00](v116, -1, -1);
        uint64_t v125 = v157;
        swift_arrayDestroy();
        MEMORY[0x237E11C00](v125, -1, -1);
        MEMORY[0x237E11C00](v115, -1, -1);
      }
      else
      {
        sub_236F4C4D8((uint64_t)v164);

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v145 + 8))(v27, v152);
    }
    LODWORD(v142) = 0;
    uint64_t v141 = 78;
    goto LABEL_81;
  }
  uint64_t v31 = v29;
  uint64_t v32 = (uint64_t)v3;
  type metadata accessor for SpecifierController();
  sub_236F4DF38(&qword_2688E55D8, (void (*)(uint64_t))type metadata accessor for SpecifierController);
  uint64_t v33 = (uint64_t)objc_msgSend(*(id *)(sub_236F4E3F8() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_numberOfRowsInSection_, v31);
  uint64_t v34 = swift_release();
  uint64_t v35 = v152;
  if ((v33 & 0x8000000000000000) == 0) {
    goto LABEL_10;
  }
  id v36 = objc_msgSend(self, sel_currentDevice);
  unsigned int v37 = objc_msgSend(v36, sel_sf_isInternalInstall);

  if (!v37)
  {
    if (qword_2688E4F50 != -1) {
      swift_once();
    }
    uint64_t v38 = __swift_project_value_buffer(v35, (uint64_t)qword_2688E6310);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v23, v38, v35);
    uint64_t v39 = sub_236F4E358();
    os_log_type_t v40 = sub_236F4EA38();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_236F34000, v39, v40, "numberOfItemsInSection < 0", v41, 2u);
      MEMORY[0x237E11C00](v41, -1, -1);
    }

    uint64_t v34 = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v23, v35);
    uint64_t v33 = 0;
LABEL_10:
    MEMORY[0x270FA5388](v34);
    uint64_t v142 = v31;
    char v42 = sub_236F495B8(sub_236F4DB04, (uint64_t)(&v143 - 4), 0, v33);
    MEMORY[0x270FA5388](v42);
    uint64_t v141 = v32;
    unint64_t v43 = sub_236F4970C((void (*)(uint64_t *__return_ptr, uint64_t *))sub_236F4DB24, (uint64_t)(&v143 - 4), (uint64_t)v42);
    swift_bridgeObjectRelease();
    id v44 = v155;
    objc_msgSend(v155, sel_loadValuesAndTitlesFromDataSource);
    uint64_t v45 = v156;
    sub_236F49C14(v44, v156);
    uint64_t v46 = v153;
    sub_236F4A054(v44, v153);
    id v47 = objc_msgSend(self, sel_currentDevice);
    unsigned int v48 = objc_msgSend(v47, sel_sf_isInternalInstall);

    if (!v48)
    {
LABEL_62:
      sub_236F37BCC(v45, v147, &qword_2688E5610);
      uint64_t v101 = sub_236F37BCC(v46, (uint64_t)v149, &qword_2688E57A8);
      v158 = (char *)&v143;
      MEMORY[0x270FA5388](v101);
      *(&v143 - 4) = v43;
      *(&v143 - 3) = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5668);
      sub_236F4CFF0(&qword_2688E5608, &qword_2688E5610, (void (*)(void))sub_236F4D05C);
      uint64_t v102 = sub_236F4CFF0(&qword_2688E5660, &qword_2688E5668, (void (*)(void))sub_236F4D240);
      uint64_t v103 = sub_236F4CFF0(&qword_2688E57A0, &qword_2688E57A8, (void (*)(void))sub_236F4D8F8);
      uint64_t v141 = v102;
      uint64_t v142 = v103;
      sub_236F4E958();
      swift_bridgeObjectRelease();
      sub_236F37E78(v46, &qword_2688E57A8);
      return sub_236F37E78(v156, &qword_2688E5610);
    }
    v163 = (void *)MEMORY[0x263F8EE78];
    uint64_t v145 = v16;
    uint64_t v144 = v32;
    if (v43 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_236F4EBE8();
    }
    else
    {
      uint64_t v49 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    uint64_t v50 = v158;
    uint64_t v157 = v43;
    if (v49)
    {
      if (v49 >= 1)
      {
        uint64_t v51 = 0;
        unint64_t v52 = v43 & 0xC000000000000001;
        uint64_t v53 = (void *)MEMORY[0x263F8EE78];
        v154 = (char *)(MEMORY[0x263F8EE58] + 8);
        while (1)
        {
          id v55 = v52 ? (id)MEMORY[0x237E11590](v51, v43) : *(id *)(v43 + 8 * v51 + 32);
          uint64_t v56 = v55;
          id v57 = objc_msgSend(v55, sel_name);
          if (v57) {
            break;
          }
          unint64_t v64 = (unint64_t)objc_msgSend(v56, sel_cellType);
          BOOL v65 = v64 > 0xD || ((1 << v64) & 0x200A) == 0;
          if (v65 && objc_msgSend(v56, sel_hasValidGetter))
          {
            if (objc_msgSend(v56, sel_performGetter))
            {
              sub_236F4EAC8();
              swift_unknownObjectRelease();
            }
            else
            {
              long long v161 = 0u;
              long long v162 = 0u;
            }
            sub_236F3A828((uint64_t)&v161, (uint64_t)v164, &qword_2688E5058);
          }
          else
          {
            memset(v164, 0, 32);
          }
          sub_236F3A828((uint64_t)v164, (uint64_t)&v161, &qword_2688E5058);
          if (*((void *)&v162 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v59 = v159;
              uint64_t v61 = v160;
              goto LABEL_24;
            }
          }
          else
          {
            sub_236F37E78((uint64_t)&v161, &qword_2688E5058);
          }
          id v66 = objc_msgSend(v56, sel_identifier);
          if (!v66)
          {

            goto LABEL_18;
          }
          uint64_t v67 = v66;
          uint64_t v68 = sub_236F4E9A8();
          uint64_t v70 = v69;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v53 = sub_236F4C74C(0, v53[2] + 1, 1, v53);
          }
          unint64_t v72 = v53[2];
          unint64_t v71 = v53[3];
          if (v72 >= v71 >> 1) {
            uint64_t v53 = sub_236F4C74C((void *)(v71 > 1), v72 + 1, 1, v53);
          }
          v53[2] = v72 + 1;
          long long v73 = &v53[2 * v72];
          v73[4] = v68;
          v73[5] = v70;
LABEL_17:

          v163 = v53;
          unint64_t v43 = v157;
          uint64_t v50 = v158;
LABEL_18:
          if (v49 == ++v51) {
            goto LABEL_49;
          }
        }
        uint64_t v58 = v57;
        uint64_t v59 = sub_236F4E9A8();
        uint64_t v61 = v60;

LABEL_24:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v53 = sub_236F4C74C(0, v53[2] + 1, 1, v53);
        }
        unint64_t v63 = v53[2];
        unint64_t v62 = v53[3];
        if (v63 >= v62 >> 1) {
          uint64_t v53 = sub_236F4C74C((void *)(v62 > 1), v63 + 1, 1, v53);
        }
        v53[2] = v63 + 1;
        uint64_t v54 = &v53[2 * v63];
        v54[4] = v59;
        v54[5] = v61;
        goto LABEL_17;
      }
      __break(1u);
    }
    else
    {
LABEL_49:
      swift_bridgeObjectRelease();
      uint64_t v74 = sub_236F3E3E8();
      if (!v75)
      {
        if (qword_2688E4F50 != -1) {
          swift_once();
        }
        uint64_t v87 = v152;
        uint64_t v88 = __swift_project_value_buffer(v152, (uint64_t)qword_2688E6310);
        uint64_t v89 = v145;
        uint64_t v90 = v146;
        (*(void (**)(char *, uint64_t, uint64_t))(v145 + 16))(v146, v88, v87);
        uint64_t v91 = sub_236F4E358();
        os_log_type_t v92 = sub_236F4EA58();
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v93 = swift_slowAlloc();
          uint64_t v94 = swift_slowAlloc();
          *(void *)&long long v161 = v94;
          *(_DWORD *)uint64_t v93 = 136315394;
          *(void *)&v164[0] = sub_236F4C85C(0xD00000000000001FLL, 0x8000000236F536D0, (uint64_t *)&v161);
          sub_236F4EAA8();
          *(_WORD *)(v93 + 12) = 2082;
          swift_beginAccess();
          uint64_t v95 = swift_bridgeObjectRetain();
          uint64_t v96 = MEMORY[0x237E11460](v95, MEMORY[0x263F8D310]);
          uint64_t v97 = v89;
          unint64_t v99 = v98;
          swift_bridgeObjectRelease();
          uint64_t v100 = v96;
          unint64_t v43 = v157;
          uint64_t v159 = sub_236F4C85C(v100, v99, (uint64_t *)&v161);
          sub_236F4EAA8();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_236F34000, v91, v92, "%s: creating section with specifiers: '%{public}s'", (uint8_t *)v93, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x237E11C00](v94, -1, -1);
          MEMORY[0x237E11C00](v93, -1, -1);

          (*(void (**)(char *, uint64_t))(v97 + 8))(v146, v87);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v87);
        }
        swift_bridgeObjectRelease();
        uint64_t v32 = v144;
        uint64_t v46 = v153;
        goto LABEL_61;
      }
      uint64_t v16 = v74;
      uint64_t v46 = v75;
      if (qword_2688E4F50 == -1)
      {
LABEL_51:
        uint64_t v76 = v152;
        uint64_t v77 = __swift_project_value_buffer(v152, (uint64_t)qword_2688E6310);
        uint64_t v78 = v145;
        (*(void (**)(char *, uint64_t, uint64_t))(v145 + 16))(v50, v77, v76);
        swift_bridgeObjectRetain();
        uint64_t v79 = sub_236F4E358();
        os_log_type_t v80 = sub_236F4EA58();
        if (os_log_type_enabled(v79, v80))
        {
          uint64_t v81 = swift_slowAlloc();
          uint64_t v82 = swift_slowAlloc();
          *(void *)&long long v161 = v82;
          *(_DWORD *)uint64_t v81 = 136315650;
          *(void *)&v164[0] = sub_236F4C85C(0xD00000000000001FLL, 0x8000000236F536D0, (uint64_t *)&v161);
          sub_236F4EAA8();
          *(_WORD *)(v81 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)&v164[0] = sub_236F4C85C(v16, v46, (uint64_t *)&v161);
          sub_236F4EAA8();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v81 + 22) = 2082;
          swift_beginAccess();
          uint64_t v83 = swift_bridgeObjectRetain();
          uint64_t v84 = MEMORY[0x237E11460](v83, MEMORY[0x263F8D310]);
          unint64_t v86 = v85;
          swift_bridgeObjectRelease();
          uint64_t v159 = sub_236F4C85C(v84, v86, (uint64_t *)&v161);
          sub_236F4EAA8();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_236F34000, v79, v80, "%s: creating section '%s' with specifiers: '%{public}s'", (uint8_t *)v81, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x237E11C00](v82, -1, -1);
          MEMORY[0x237E11C00](v81, -1, -1);

          (*(void (**)(char *, uint64_t))(v78 + 8))(v158, v76);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v78 + 8))(v50, v76);
        }
        swift_bridgeObjectRelease();
        uint64_t v32 = v144;
        uint64_t v46 = v153;
        unint64_t v43 = v157;
LABEL_61:
        uint64_t v45 = v156;
        goto LABEL_62;
      }
    }
    swift_once();
    goto LABEL_51;
  }
  uint64_t v145 = v16;
  if (qword_2688E4F50 != -1) {
    swift_once();
  }
  uint64_t v126 = v152;
  uint64_t v127 = __swift_project_value_buffer(v152, (uint64_t)qword_2688E6310);
  (*(void (**)(char *, uint64_t, uint64_t))(v145 + 16))(v154, v127, v126);
  id v128 = v155;
  swift_bridgeObjectRetain_n();
  id v129 = v128;
  v130 = sub_236F4E358();
  os_log_type_t v131 = sub_236F4EA48();
  if (os_log_type_enabled(v130, v131))
  {
    uint64_t v132 = swift_slowAlloc();
    v133 = (void *)swift_slowAlloc();
    uint64_t v134 = swift_slowAlloc();
    *(void *)&v164[0] = v134;
    *(_DWORD *)uint64_t v132 = 136315650;
    *(void *)&long long v161 = sub_236F4C85C(0xD00000000000001FLL, 0x8000000236F536D0, (uint64_t *)v164);
    sub_236F4EAA8();
    *(_WORD *)(v132 + 12) = 2114;
    *(void *)&long long v161 = v129;
    id v135 = v129;
    sub_236F4EAA8();
    void *v133 = v129;

    *(_WORD *)(v132 + 22) = 2082;
    unint64_t v136 = sub_236F37ED4();
    uint64_t v137 = swift_bridgeObjectRetain();
    uint64_t v138 = MEMORY[0x237E11460](v137, v136);
    unint64_t v140 = v139;
    swift_bridgeObjectRelease();
    *(void *)&long long v161 = sub_236F4C85C(v138, v140, (uint64_t *)v164);
    sub_236F4EAA8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_236F34000, v130, v131, "%s: s: %{public}@ not in [s]: %{public}s'", (uint8_t *)v132, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E53C8);
    swift_arrayDestroy();
    MEMORY[0x237E11C00](v133, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x237E11C00](v134, -1, -1);
    MEMORY[0x237E11C00](v132, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v145 + 8))(v154, v152);
  LODWORD(v142) = 0;
  uint64_t v141 = 87;
LABEL_81:
  uint64_t result = sub_236F4EBD8();
  __break(1u);
  return result;
}

void sub_236F49198(uint64_t *a1)
{
  uint64_t v2 = sub_236F4E378();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_currentDevice);
  unsigned int v7 = objc_msgSend(v6, sel_sf_isInternalInstall);

  if (v7)
  {
    if (qword_2688E4F50 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_2688E6310);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_236F4C3F4(a1, (uint64_t)v17);
    uint64_t v9 = sub_236F4E358();
    os_log_type_t v10 = sub_236F4EA58();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v16 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      sub_236F4763C();
      v15[1] = sub_236F4C85C(v13, v14, &v16);
      sub_236F4EAA8();
      swift_bridgeObjectRelease();
      sub_236F4C4D8((uint64_t)v17);
      _os_log_impl(&dword_236F34000, v9, v10, "SUIKPThirdPartyAppListView onAppear for %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237E11C00](v12, -1, -1);
      MEMORY[0x237E11C00](v11, -1, -1);
    }
    else
    {
      sub_236F4C4D8((uint64_t)v17);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_236F49424()
{
  type metadata accessor for SpecifierController();
  sub_236F4DF38(&qword_2688E55D8, (void (*)(uint64_t))type metadata accessor for SpecifierController);
  id v1 = objc_msgSend(*(id *)(sub_236F4E3F8() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifier);
  swift_release();
  id v2 = objc_msgSend(v1, sel_name);

  if (v2)
  {
    uint64_t v3 = sub_236F4E9A8();
    uint64_t v5 = v4;

    sub_236F4C3F4(v0, (uint64_t)&v11);
    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {
    sub_236F4C3F4(v0, (uint64_t)&v11);
  }
  id v6 = objc_msgSend(*(id *)(sub_236F4E3F8() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifier);
  swift_release();
  uint64_t v7 = sub_236F3E3E8();
  uint64_t v9 = v8;

  if (v9) {
    uint64_t v3 = v7;
  }
  else {
    uint64_t v3 = 0;
  }
LABEL_8:
  sub_236F4C4D8((uint64_t)&v11);
  return v3;
}

void *sub_236F495B8(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *(*v16)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  uint64_t v16 = (void *(*)(uint64_t *__return_ptr, uint64_t *))result;
  uint64_t v5 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = v4;
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (!v5) {
    return (void *)v7;
  }
  uint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t result = (void *)sub_236F4DBB4(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = v19;
    if (a4 <= a3) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = a4;
    }
    uint64_t v15 = v10;
    uint64_t v11 = a3;
    while (a4 != v11)
    {
      uint64_t v17 = v11;
      uint64_t result = v16(&v18, &v17);
      if (v6)
      {
        swift_release();
        return (void *)v7;
      }
      uint64_t v6 = 0;
      uint64_t v12 = v18;
      uint64_t v19 = v7;
      unint64_t v14 = *(void *)(v7 + 16);
      unint64_t v13 = *(void *)(v7 + 24);
      if (v14 >= v13 >> 1)
      {
        uint64_t result = (void *)sub_236F4DBB4(v13 > 1, v14 + 1, 1);
        uint64_t v7 = v19;
      }
      *(void *)(v7 + 16) = v14 + 1;
      *(void *)(v7 + 8 * v14 + 32) = v12;
      if (a4 < a3) {
        goto LABEL_19;
      }
      if (v15 == v11) {
        goto LABEL_20;
      }
      if (a4 == ++v11) {
        return (void *)v7;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_236F4970C(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_236F4EB88();
    uint64_t v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      uint64_t v10 = *v9++;
      uint64_t v11 = v10;
      a1(&v12, &v11);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      sub_236F4EB68();
      sub_236F4EB98();
      sub_236F4EBA8();
      sub_236F4EB78();
      if (!--v6) {
        return v13;
      }
    }
    return swift_release();
  }
  return result;
}

void sub_236F497FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x237E11590](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      uint64_t v5 = v4;
      sub_236F37ED4();
      char v6 = sub_236F4EA88();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)MEMORY[0x237E11590](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = sub_236F4EA88();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_236F4EBE8();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_236F49988@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  uint64_t v16 = a3;
  uint64_t v5 = sub_236F4E328();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  type metadata accessor for SpecifierController();
  sub_236F4DF38(&qword_2688E55D8, (void (*)(uint64_t))type metadata accessor for SpecifierController);
  uint64_t v10 = sub_236F4E3F8();
  MEMORY[0x237E10D60](v9, a2);
  id v11 = *(id *)(v10 + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage);
  uint64_t v12 = (void *)sub_236F4E308();
  id v13 = objc_msgSend(v11, sel_indexForIndexPath_, v12);
  swift_release();

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *uint64_t v16 = v13;
  return result;
}

uint64_t sub_236F49B38@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  type metadata accessor for SpecifierController();
  sub_236F4DF38(&qword_2688E55D8, (void (*)(uint64_t))type metadata accessor for SpecifierController);
  id v4 = objc_msgSend(*(id *)(sub_236F4E3F8() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifierAtIndex_, v3);
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

id sub_236F49C14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_236F4E558();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5650);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5640);
  MEMORY[0x270FA5388](v38);
  id v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5630);
  uint64_t v39 = *(void *)(v12 - 8);
  uint64_t v40 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  id v37 = a1;
  uint64_t v18 = sub_236F3E3E8();
  if (!v19) {
    goto LABEL_13;
  }
  uint64_t v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0) {
    uint64_t v20 = v18 & 0xFFFFFFFFFFFFLL;
  }
  if (!v20)
  {
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v33 = v40;
    uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56);
    uint64_t v35 = v41;
    return (id)v34(v35, 1, 1, v33);
  }
  uint64_t v42 = v18;
  unint64_t v43 = v19;
  char v44 = 0;
  uint64_t v45 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_236F4E548();
  sub_236F4E798();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_236F37B60(v42, v43, v44);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_236F37BCC((uint64_t)v9, (uint64_t)v11, &qword_2688E5650);
  uint64_t v22 = &v11[*(int *)(v38 + 36)];
  *(void *)uint64_t v22 = KeyPath;
  *((void *)v22 + 1) = 0;
  v22[16] = 1;
  sub_236F37E78((uint64_t)v9, &qword_2688E5650);
  id v23 = v37;
  id result = objc_msgSend(v37, sel_identifier);
  if (result)
  {
    uint64_t v25 = result;
    uint64_t v26 = sub_236F4E9A8();
    unint64_t v28 = v27;

    swift_bridgeObjectRelease();
    uint64_t v29 = HIBYTE(v28) & 0xF;
    if ((v28 & 0x2000000000000000) == 0) {
      uint64_t v29 = v26 & 0xFFFFFFFFFFFFLL;
    }
    if (!v29) {
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    id result = objc_msgSend(v23, sel_identifier);
    if (result)
    {
      char v30 = result;
      sub_236F4E9A8();

LABEL_11:
      uint64_t v32 = v40;
      uint64_t v31 = v41;
      sub_236F4D0F4();
      sub_236F4E7F8();
      swift_bridgeObjectRelease();
      sub_236F37E78((uint64_t)v11, &qword_2688E5640);
      sub_236F3A828((uint64_t)v15, (uint64_t)v17, &qword_2688E5630);
      sub_236F3A828((uint64_t)v17, v31, &qword_2688E5630);
      return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v31, 0, 1, v32);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_236F4A054@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = type metadata accessor for SUIKPFooterHyperlinkView();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v41 - v7;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5840);
  MEMORY[0x270FA5388](v44);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57B8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57D8);
  MEMORY[0x270FA5388](v45);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_236F3F4F4();
  if (v17)
  {
    uint64_t v18 = HIBYTE(v17) & 0xF;
    if ((v17 & 0x2000000000000000) == 0) {
      uint64_t v18 = v16 & 0xFFFFFFFFFFFFLL;
    }
    if (v18)
    {
      swift_bridgeObjectRetain();
      sub_236F4E828();
      uint64_t v19 = sub_236F4E708();
      uint64_t v42 = v13;
      uint64_t v43 = v3;
      uint64_t v21 = v20;
      char v23 = v22;
      uint64_t v25 = v24;
      uint64_t v41 = v24;
      swift_bridgeObjectRelease();
      swift_release();
      v23 &= 1u;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v47 = v19;
      uint64_t v48 = v21;
      char v49 = v23;
      uint64_t v50 = v25;
      uint64_t v51 = KeyPath;
      uint64_t v52 = 0;
      char v53 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5578);
      sub_236F46D10();
      sub_236F4E7F8();
      swift_bridgeObjectRelease();
      sub_236F37B60(v19, v21, v23);
      swift_release();
      swift_bridgeObjectRelease();
      sub_236F37BCC((uint64_t)v15, (uint64_t)v10, &qword_2688E57D8);
      swift_storeEnumTagMultiPayload();
      sub_236F4DA04(&qword_2688E57D0, &qword_2688E57D8, (void (*)(void))sub_236F46D10);
      sub_236F4DF38(&qword_2688E57E0, (void (*)(uint64_t))type metadata accessor for SUIKPFooterHyperlinkView);
      uint64_t v27 = (uint64_t)v42;
      sub_236F4E5D8();
      sub_236F37E78((uint64_t)v15, &qword_2688E57D8);
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57C8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
      uint64_t v29 = v27;
      return sub_236F3A828(v29, v46, &qword_2688E57B8);
    }
    swift_bridgeObjectRelease();
  }
  if (sub_236F415B0())
  {
    *uint64_t v6 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5318);
    swift_storeEnumTagMultiPayload();
    swift_unknownObjectWeakInit();
    char v30 = (uint64_t *)((char *)v6 + *(int *)(v3 + 24));
    void *v30 = 0;
    v30[1] = 0;
    uint64_t v31 = (uint64_t)v10;
    uint64_t v32 = (uint64_t *)((char *)v6 + *(int *)(v3 + 28));
    sub_236F37ED4();
    sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
    id v33 = a1;
    *uint64_t v32 = sub_236F4E418();
    v32[1] = v34;
    sub_236F4E0DC((uint64_t)v6, (uint64_t)v8);
    sub_236F4E140((uint64_t)v8, v31);
    swift_storeEnumTagMultiPayload();
    sub_236F4DA04(&qword_2688E57D0, &qword_2688E57D8, (void (*)(void))sub_236F46D10);
    sub_236F4DF38(&qword_2688E57E0, (void (*)(uint64_t))type metadata accessor for SUIKPFooterHyperlinkView);
    sub_236F4E5D8();
    sub_236F4E1A4((uint64_t)v8);
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57C8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v13, 0, 1, v35);
    uint64_t v29 = (uint64_t)v13;
    return sub_236F3A828(v29, v46, &qword_2688E57B8);
  }
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57C8);
  uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56);
  uint64_t v39 = v37;
  uint64_t v40 = v46;
  return v38(v40, 1, 1, v39);
}

uint64_t sub_236F4A624(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v8 = a1;
  sub_236F4C3F4(a2, (uint64_t)v7);
  uint64_t v4 = swift_allocObject();
  sub_236F441DC((uint64_t)v7, v4 + 16);
  *(void *)(v4 + 56) = a3;
  swift_bridgeObjectRetain();
  id v5 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E57E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5678);
  sub_236F38010(&qword_2688E57F0, &qword_2688E57E8);
  sub_236F4D240();
  sub_236F4DF38(&qword_2688E57F8, (void (*)(uint64_t))sub_236F37ED4);
  return sub_236F4E948();
}

id sub_236F4A774@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5698);
  MEMORY[0x270FA5388](v26);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5688);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a2;
  char v10 = sub_236F41324();
  char v11 = sub_236F413E8();
  id v12 = objc_msgSend(a1, sel_buttonAction, v26);
  id v13 = objc_msgSend(a1, sel_controllerLoadAction);
  id v14 = objc_msgSend(a1, sel_editPaneClass);
  id v15 = objc_msgSend(a1, sel_detailControllerClass);
  BOOL v29 = v15 != 0;
  if (objc_msgSend(a1, sel_cellType) == (id)13
    || objc_msgSend(a1, sel_cellType) == (id)3
    || objc_msgSend(a1, sel_cellType) == (id)4)
  {
    BOOL v16 = 0;
    unint64_t v17 = v28;
    if (!v12) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v16 = objc_msgSend(a1, sel_cellType) != (id)15;
    unint64_t v17 = v28;
    if (!v12) {
      goto LABEL_10;
    }
  }
  if (!v13 || !v14 || !v15)
  {
LABEL_10:
    if ((v11 & 1) == 0) {
      goto LABEL_12;
    }
  }
  BOOL v16 = 0;
LABEL_12:
  sub_236F4C3F4(v17, (uint64_t)v31);
  uint64_t v18 = swift_allocObject();
  sub_236F441DC((uint64_t)v31, v18 + 16);
  *(void *)(v18 + 56) = a1;
  id v19 = a1;
  objc_msgSend(v19, sel_loadValuesAndTitlesFromDataSource);
  sub_236F4186C();
  sub_236F4AB38(v19, v10 & 1, (uint64_t)sub_236F4DEAC, v18, v30, v29, v12 != 0, (uint64_t)v6);
  id result = objc_msgSend(v19, sel_identifier);
  if (result)
  {
    uint64_t v21 = result;
    sub_236F4E9A8();

    sub_236F4D304();
    sub_236F4E7F8();
    swift_bridgeObjectRelease();
    sub_236F37E78((uint64_t)v6, &qword_2688E5698);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v23 = swift_allocObject();
    *(unsigned char *)(v23 + 16) = v16;
    uint64_t v24 = v27;
    sub_236F37BCC((uint64_t)v9, v27, &qword_2688E5688);
    swift_release();
    uint64_t v25 = (uint64_t *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688E5678) + 36));
    *uint64_t v25 = KeyPath;
    v25[1] = (uint64_t)sub_236F4DF20;
    v25[2] = v23;
    return (id)sub_236F37E78((uint64_t)v9, &qword_2688E5688);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236F4AAC8(uint64_t a1, void *a2)
{
  int v3 = a1;
  uint64_t result = MEMORY[0x237E11CA0](a1 + 24);
  if (result)
  {
    sub_236F43C08(v3, a2);
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_236F4AB38@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, int a7@<W6>, uint64_t a8@<X8>)
{
  int v116 = a7;
  int v129 = a6;
  uint64_t v114 = a5;
  uint64_t v123 = a4;
  uint64_t v122 = a3;
  int v140 = a2;
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5768);
  uint64_t v113 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  id v112 = &v110[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5800);
  MEMORY[0x270FA5388](v130);
  uint64_t v132 = &v110[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5808);
  MEMORY[0x270FA5388](v124);
  uint64_t v126 = &v110[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5748);
  MEMORY[0x270FA5388](v131);
  uint64_t v127 = &v110[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5810);
  uint64_t v117 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  id v15 = &v110[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5818);
  MEMORY[0x270FA5388](v119);
  uint64_t v115 = &v110[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5758);
  uint64_t v121 = *(void *)(v125 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v125);
  id v19 = &v110[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v17);
  unint64_t v120 = &v110[-v20];
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5738);
  MEMORY[0x270FA5388](v137);
  v133 = &v110[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5820);
  MEMORY[0x270FA5388](v134);
  id v135 = &v110[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5718);
  MEMORY[0x270FA5388](v23);
  uint64_t v138 = &v110[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56A8);
  MEMORY[0x270FA5388](v25 - 8);
  unint64_t v139 = &v110[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5728);
  uint64_t v27 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  BOOL v29 = &v110[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5828);
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = &v110[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (objc_msgSend(a1, sel_cellType) == (id)6)
  {
    uint64_t KeyPath = swift_getKeyPath();
    sub_236F37ED4();
    sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
    id v34 = a1;
    uint64_t v35 = sub_236F4E418();
    uint64_t v37 = v36;
    long long v141 = (unint64_t)KeyPath;
    *(void *)&long long v142 = v35;
    *((void *)&v142 + 1) = v36;
    LOBYTE(v143) = 0;
    sub_236F4D464();
    sub_236F4D4B8();
    swift_retain();
    id v38 = v37;
    sub_236F4E5D8();
    long long v141 = v144;
    long long v142 = v145;
    __int16 v143 = v146;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56F8);
    sub_236F4D428();
    sub_236F4D50C();
    sub_236F4E5D8();
    unsigned __int8 v39 = v146;
    char v40 = v147;
    long long v41 = v145;
    *(_OWORD *)uint64_t v32 = v144;
    *((_OWORD *)v32 + 1) = v41;
    v32[32] = v39;
    v32[33] = v40;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56C8);
    sub_236F4D3EC();
    sub_236F4D5F0();
    sub_236F4E5D8();

    swift_release();
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56B8);
    return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(a8, 0, 1, v42);
  }
  uint64_t v111 = a8;
  if (objc_msgSend(a1, sel_cellType, v30, v23) == (id)5)
  {
    uint64_t v44 = swift_getKeyPath();
    sub_236F37ED4();
    sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
    id v45 = a1;
    uint64_t v46 = sub_236F4E418();
    uint64_t v48 = v47;
    long long v141 = (unint64_t)v44;
    *(void *)&long long v142 = v46;
    *((void *)&v142 + 1) = v47;
    LOBYTE(v143) = 1;
    sub_236F4D464();
    sub_236F4D4B8();
    swift_retain();
    id v49 = v48;
    sub_236F4E5D8();
    long long v141 = v144;
    long long v142 = v145;
    __int16 v143 = v146;
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56F8);
    sub_236F4D428();
    sub_236F4D50C();
    sub_236F4E5D8();
    unsigned __int8 v60 = v146;
    char v61 = v147;
    long long v62 = v145;
    *(_OWORD *)uint64_t v32 = v144;
    *((_OWORD *)v32 + 1) = v62;
    v32[32] = v60;
    v32[33] = v61;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56C8);
    sub_236F4D3EC();
    sub_236F4D5F0();
    uint64_t v63 = v111;
    sub_236F4E5D8();

    swift_release();
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56B8);
    return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v63, 0, 1, v64);
  }
  if (objc_msgSend(a1, sel_cellType) == (id)8)
  {
    uint64_t v50 = swift_getKeyPath();
    sub_236F37ED4();
    sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
    id v51 = a1;
    uint64_t v52 = sub_236F4E418();
    uint64_t v54 = v53;
    long long v141 = (unint64_t)v50;
    *(void *)&long long v142 = v52;
    *((void *)&v142 + 1) = v53;
    LOBYTE(v143) = 0;
    sub_236F4D548();
    sub_236F4D59C();
    swift_retain();
    id v49 = v54;
    sub_236F4E5D8();
    long long v141 = v144;
    long long v142 = v145;
    LOBYTE(v143) = v146;
    HIBYTE(v143) = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(a1, sel_cellType) == (id)12)
  {
    uint64_t v55 = swift_getKeyPath();
    sub_236F37ED4();
    sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
    id v56 = a1;
    uint64_t v57 = sub_236F4E418();
    uint64_t v59 = v58;
    long long v141 = (unint64_t)v55;
    *(void *)&long long v142 = v57;
    *((void *)&v142 + 1) = v58;
    LOBYTE(v143) = 1;
    sub_236F4D548();
    sub_236F4D59C();
    swift_retain();
    id v49 = v59;
    sub_236F4E5D8();
    long long v141 = v144;
    long long v142 = v145;
    LOBYTE(v143) = v146;
    HIBYTE(v143) = 1;
    goto LABEL_9;
  }
  if ((v140 & 1) != 0 && objc_msgSend(a1, sel_cellType) == (id)3)
  {
    MEMORY[0x270FA5388](3);
    uint64_t v65 = v114;
    *(void *)&v110[-16] = a1;
    *(void *)&v110[-8] = v65;
    sub_236F4E060();
    swift_retain();
    sub_236F4E8B8();
    uint64_t v66 = v136;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v27 + 16))(v135, v29, v136);
    swift_storeEnumTagMultiPayload();
    sub_236F38010(&qword_2688E5720, &qword_2688E5728);
    sub_236F4D6C8(&qword_2688E5730, &qword_2688E5738, (void (*)(void))sub_236F4D750, (void (*)(void))sub_236F4D814);
    uint64_t v67 = (uint64_t)v138;
    sub_236F4E5D8();
    sub_236F37BCC(v67, (uint64_t)v32, &qword_2688E5718);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56C8);
    sub_236F4D3EC();
    sub_236F4D5F0();
    uint64_t v68 = v139;
    sub_236F4E5D8();
    sub_236F37E78(v67, &qword_2688E5718);
    (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v29, v66);
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56B8);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v68, 0, 1, v69);
    uint64_t v70 = (uint64_t)v68;
    return (id)sub_236F3A828(v70, v111, &qword_2688E56A8);
  }
  id v71 = objc_msgSend(a1, sel_cellType);
  if (v71 == (id)1
    || (id v71 = objc_msgSend(a1, sel_cellType), v71 == (id)2)
    || (id v71 = objc_msgSend(a1, sel_cellType), v71 == (id)4))
  {
    if ((v129 & 1) == 0)
    {
      if ((v116 & 1) == 0)
      {
        char v94 = sub_236F41730();
        uint64_t v93 = v139;
        uint64_t v88 = (uint64_t)v133;
        if (v94)
        {
          uint64_t v95 = swift_getKeyPath();
          sub_236F37ED4();
          sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
          id v96 = a1;
          uint64_t v97 = sub_236F4E418();
          long long v141 = (unint64_t)v95;
          *(void *)&long long v142 = v97;
          *((void *)&v142 + 1) = v98;
          __int16 v143 = 0;
        }
        else
        {
          sub_236F3C854(a1, (uint64_t)&v148);
          *(void *)&long long v141 = v148;
          *((void *)&v141 + 1) = v149;
          long long v142 = v150;
          LOBYTE(v143) = v151;
          HIBYTE(v143) = 1;
        }
        sub_236F4D850();
        sub_236F4D8A4();
        sub_236F4E5D8();
        long long v103 = v145;
        unsigned __int8 v104 = v146;
        char v105 = v147;
        uint64_t v106 = v132;
        *uint64_t v132 = v144;
        v106[1] = v103;
        *((unsigned char *)v106 + 32) = v104;
        *((unsigned char *)v106 + 33) = v105;
        swift_storeEnumTagMultiPayload();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5778);
        sub_236F4D750();
        sub_236F4D814();
        sub_236F4E5D8();
        goto LABEL_29;
      }
      MEMORY[0x270FA5388](v71);
      *(void *)&v110[-16] = a1;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5778);
      sub_236F4D814();
      uint64_t v89 = v112;
      sub_236F4E8B8();
      uint64_t v90 = v113;
      uint64_t v91 = v128;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v113 + 16))(v126, v89, v128);
      swift_storeEnumTagMultiPayload();
      sub_236F38010(&qword_2688E5750, &qword_2688E5758);
      sub_236F38010(&qword_2688E5760, &qword_2688E5768);
      uint64_t v92 = (uint64_t)v127;
      sub_236F4E5D8();
      sub_236F37BCC(v92, (uint64_t)v132, &qword_2688E5748);
      swift_storeEnumTagMultiPayload();
      sub_236F4D750();
      uint64_t v88 = (uint64_t)v133;
      sub_236F4E5D8();
      sub_236F37E78(v92, &qword_2688E5748);
      (*(void (**)(unsigned char *, uint64_t))(v90 + 8))(v89, v91);
LABEL_21:
      uint64_t v93 = v139;
LABEL_29:
      uint64_t v107 = v88;
      sub_236F37BCC(v88, (uint64_t)v135, &qword_2688E5738);
      swift_storeEnumTagMultiPayload();
      sub_236F38010(&qword_2688E5720, &qword_2688E5728);
      sub_236F4D6C8(&qword_2688E5730, &qword_2688E5738, (void (*)(void))sub_236F4D750, (void (*)(void))sub_236F4D814);
      uint64_t v108 = (uint64_t)v138;
      sub_236F4E5D8();
      sub_236F37BCC(v108, (uint64_t)v32, &qword_2688E5718);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56C8);
      sub_236F4D3EC();
      sub_236F4D5F0();
      sub_236F4E5D8();
      sub_236F37E78(v108, &qword_2688E5718);
      sub_236F37E78(v107, &qword_2688E5738);
      uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56B8);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v109 - 8) + 56))(v93, 0, 1, v109);
      uint64_t v70 = (uint64_t)v93;
      return (id)sub_236F3A828(v70, v111, &qword_2688E56A8);
    }
    sub_236F37ED4();
    sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
    id v72 = a1;
    uint64_t v73 = sub_236F4E418();
    uint64_t v75 = v74;
    *(void *)&long long v144 = v73;
    *((void *)&v144 + 1) = v74;
    id result = objc_msgSend(v72, sel_name);
    if (result)
    {
      uint64_t v76 = result;
      uint64_t v77 = sub_236F4E9A8();
      uint64_t v79 = v78;

      *(void *)&long long v141 = v77;
      *((void *)&v141 + 1) = v79;
      sub_236F45AC4();
      sub_236F37B70();
      sub_236F4E7D8();

      swift_bridgeObjectRelease();
      LOBYTE(v76) = sub_236F4E6B8();
      uint64_t v80 = v117;
      uint64_t v81 = v115;
      uint64_t v82 = v118;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v117 + 16))(v115, v15, v118);
      v81[*(int *)(v119 + 36)] = (_BYTE)v76;
      uint64_t v83 = (*(uint64_t (**)(unsigned char *, uint64_t))(v80 + 8))(v15, v82);
      MEMORY[0x270FA5388](v83);
      *(void *)&v110[-16] = v72;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5778);
      sub_236F4D814();
      sub_236F4DF9C();
      sub_236F4E408();
      uint64_t v84 = v121;
      unint64_t v85 = v120;
      uint64_t v86 = v125;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v121 + 32))(v120, v19, v125);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v84 + 16))(v126, v85, v86);
      swift_storeEnumTagMultiPayload();
      sub_236F38010(&qword_2688E5750, &qword_2688E5758);
      sub_236F38010(&qword_2688E5760, &qword_2688E5768);
      uint64_t v87 = (uint64_t)v127;
      sub_236F4E5D8();
      sub_236F37BCC(v87, (uint64_t)v132, &qword_2688E5748);
      swift_storeEnumTagMultiPayload();
      sub_236F4D750();
      uint64_t v88 = (uint64_t)v133;
      sub_236F4E5D8();
      sub_236F37E78(v87, &qword_2688E5748);
      (*(void (**)(unsigned char *, uint64_t))(v84 + 8))(v85, v86);
      goto LABEL_21;
    }
    __break(1u);
  }
  else
  {
    uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688E56B8);
    uint64_t v100 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56);
    uint64_t v101 = v99;
    uint64_t v102 = v111;
    return (id)v100(v102, 1, 1, v101);
  }
  return result;
}

uint64_t sub_236F4C1DC@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  sub_236F37ED4();
  sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = sub_236F4E418();
  uint64_t v11 = v10;
  uint64_t result = sub_236F4E418();
  *(void *)a3 = KeyPath;
  *(unsigned char *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = v9;
  *(void *)(a3 + 24) = v11;
  *(void *)(a3 + 32) = result;
  *(void *)(a3 + 40) = v13;
  return result;
}

double sub_236F4C2B8@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (sub_236F41730())
  {
    swift_getKeyPath();
    sub_236F37ED4();
    sub_236F4DF38((unint64_t *)&qword_2688E52F0, (void (*)(uint64_t))sub_236F37ED4);
    id v4 = a1;
    sub_236F4E418();
  }
  else
  {
    sub_236F3C854(a1, (uint64_t)&v10);
  }
  sub_236F4D850();
  sub_236F4D8A4();
  sub_236F4E5D8();
  double result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v7;
  *(unsigned char *)(a2 + 32) = v8;
  *(unsigned char *)(a2 + 33) = v9;
  return result;
}

uint64_t sub_236F4C3EC()
{
  return sub_236F47548(*(uint64_t **)(v0 + 16));
}

uint64_t sub_236F4C3F4(uint64_t *a1, uint64_t a2)
{
  return a2;
}

void sub_236F4C430()
{
  sub_236F49198((uint64_t *)(v0 + 16));
}

unint64_t sub_236F4C438()
{
  unint64_t result = qword_2688E55C8;
  if (!qword_2688E55C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E55A8);
    sub_236F38010(&qword_2688E55D0, &qword_2688E55A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E55C8);
  }
  return result;
}

uint64_t sub_236F4C4D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_236F4C514@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_236F4E4A8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_236F4C544()
{
  return sub_236F4E4B8();
}

uint64_t sub_236F4C56C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236F4E3A8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236F4C5EC()
{
  return sub_236F4E3B8();
}

uint64_t sub_236F4C660()
{
  return sub_236F4E448();
}

uint64_t sub_236F4C684(uint64_t a1)
{
  uint64_t v2 = sub_236F4E568();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_236F4E458();
}

void *sub_236F4C74C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688E53D0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_236F4DD34(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_236F4C85C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_236F4C930(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_236F41BA4((uint64_t)v12, *a3);
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
      sub_236F41BA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_236F4C930(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_236F4EAB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_236F4CAEC(a5, a6);
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
  uint64_t v8 = sub_236F4EB58();
  if (!v8)
  {
    sub_236F4EBC8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_236F4EBF8();
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

uint64_t sub_236F4CAEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_236F4CB84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_236F4CD64(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_236F4CD64(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_236F4CB84(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_236F4CCFC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_236F4EB38();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_236F4EBC8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_236F4E9F8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_236F4EBF8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_236F4EBC8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_236F4CCFC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688E55E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_236F4CD64(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E55E0);
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
  uint64_t result = sub_236F4EBF8();
  __break(1u);
  return result;
}

uint64_t sub_236F4CEBC()
{
  return sub_236F4779C((uint64_t *)(v0 + 16));
}

unint64_t sub_236F4CEC4()
{
  unint64_t result = qword_2688E55F8;
  if (!qword_2688E55F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5600);
    sub_236F4CFF0(&qword_2688E5608, &qword_2688E5610, (void (*)(void))sub_236F4D05C);
    sub_236F4CFF0(&qword_2688E5660, &qword_2688E5668, (void (*)(void))sub_236F4D240);
    sub_236F4CFF0(&qword_2688E57A0, &qword_2688E57A8, (void (*)(void))sub_236F4D8F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E55F8);
  }
  return result;
}

uint64_t sub_236F4CFF0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_236F4D05C()
{
  unint64_t result = qword_2688E5618;
  if (!qword_2688E5618)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5620);
    sub_236F4DA04(&qword_2688E5628, &qword_2688E5630, (void (*)(void))sub_236F4D0F4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5618);
  }
  return result;
}

unint64_t sub_236F4D0F4()
{
  unint64_t result = qword_2688E5638;
  if (!qword_2688E5638)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5640);
    sub_236F4D194();
    sub_236F38010((unint64_t *)&qword_2688E5588, &qword_2688E5590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5638);
  }
  return result;
}

unint64_t sub_236F4D194()
{
  unint64_t result = qword_2688E5648;
  if (!qword_2688E5648)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5650);
    sub_236F4DF38(&qword_2688E5658, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5648);
  }
  return result;
}

unint64_t sub_236F4D240()
{
  unint64_t result = qword_2688E5670;
  if (!qword_2688E5670)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5678);
    sub_236F4DA04(&qword_2688E5680, &qword_2688E5688, (void (*)(void))sub_236F4D304);
    sub_236F38010(&qword_2688E5790, &qword_2688E5798);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5670);
  }
  return result;
}

uint64_t sub_236F4D304()
{
  return sub_236F4CFF0(&qword_2688E5690, &qword_2688E5698, (void (*)(void))sub_236F4D340);
}

unint64_t sub_236F4D340()
{
  unint64_t result = qword_2688E56A0;
  if (!qword_2688E56A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E56A8);
    sub_236F4D6C8(&qword_2688E56B0, &qword_2688E56B8, (void (*)(void))sub_236F4D3EC, (void (*)(void))sub_236F4D5F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E56A0);
  }
  return result;
}

uint64_t sub_236F4D3EC()
{
  return sub_236F4D6C8(&qword_2688E56C0, &qword_2688E56C8, (void (*)(void))sub_236F4D428, (void (*)(void))sub_236F4D50C);
}

uint64_t sub_236F4D428()
{
  return sub_236F4D6C8(&qword_2688E56D0, &qword_2688E56D8, (void (*)(void))sub_236F4D464, (void (*)(void))sub_236F4D4B8);
}

unint64_t sub_236F4D464()
{
  unint64_t result = qword_2688E56E0;
  if (!qword_2688E56E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E56E0);
  }
  return result;
}

unint64_t sub_236F4D4B8()
{
  unint64_t result = qword_2688E56E8;
  if (!qword_2688E56E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E56E8);
  }
  return result;
}

uint64_t sub_236F4D50C()
{
  return sub_236F4D6C8(&qword_2688E56F0, &qword_2688E56F8, (void (*)(void))sub_236F4D548, (void (*)(void))sub_236F4D59C);
}

unint64_t sub_236F4D548()
{
  unint64_t result = qword_2688E5700;
  if (!qword_2688E5700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5700);
  }
  return result;
}

unint64_t sub_236F4D59C()
{
  unint64_t result = qword_2688E5708;
  if (!qword_2688E5708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5708);
  }
  return result;
}

unint64_t sub_236F4D5F0()
{
  unint64_t result = qword_2688E5710;
  if (!qword_2688E5710)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5718);
    sub_236F38010(&qword_2688E5720, &qword_2688E5728);
    sub_236F4D6C8(&qword_2688E5730, &qword_2688E5738, (void (*)(void))sub_236F4D750, (void (*)(void))sub_236F4D814);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5710);
  }
  return result;
}

uint64_t sub_236F4D6C8(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_236F4D750()
{
  unint64_t result = qword_2688E5740;
  if (!qword_2688E5740)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5748);
    sub_236F38010(&qword_2688E5750, &qword_2688E5758);
    sub_236F38010(&qword_2688E5760, &qword_2688E5768);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5740);
  }
  return result;
}

uint64_t sub_236F4D814()
{
  return sub_236F4D6C8(&qword_2688E5770, &qword_2688E5778, (void (*)(void))sub_236F4D850, (void (*)(void))sub_236F4D8A4);
}

unint64_t sub_236F4D850()
{
  unint64_t result = qword_2688E5780;
  if (!qword_2688E5780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5780);
  }
  return result;
}

unint64_t sub_236F4D8A4()
{
  unint64_t result = qword_2688E5788;
  if (!qword_2688E5788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5788);
  }
  return result;
}

uint64_t sub_236F4D8F8()
{
  return sub_236F4CFF0(&qword_2688E57B0, &qword_2688E57B8, (void (*)(void))sub_236F4D934);
}

unint64_t sub_236F4D934()
{
  unint64_t result = qword_2688E57C0;
  if (!qword_2688E57C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E57C8);
    sub_236F4DA04(&qword_2688E57D0, &qword_2688E57D8, (void (*)(void))sub_236F46D10);
    sub_236F4DF38(&qword_2688E57E0, (void (*)(uint64_t))type metadata accessor for SUIKPFooterHyperlinkView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E57C0);
  }
  return result;
}

uint64_t sub_236F4DA04(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_236F4DF38(&qword_2688E5658, MEMORY[0x263F1A470]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  sub_236F46E90();
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_236F4DAFC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F47BA4(a1, a2);
}

uint64_t sub_236F4DB04@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F49988(a1, *(void *)(v2 + 24), a2);
}

uint64_t sub_236F4DB24@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_236F49B38(a1, a2);
}

uint64_t sub_236F4DB44()
{
  return sub_236F4A624(*(void *)(v0 + 16), *(uint64_t **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_236F4DB50@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_236F4E4C8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_236F4DB84()
{
  return sub_236F4E4D8();
}

uint64_t sub_236F4DBB4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_236F4DBD4(a1, a2, a3, *v3);
  *char v3 = (char *)result;
  return result;
}

uint64_t sub_236F4DBD4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688E5848);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_236F4EBF8();
  __break(1u);
  return result;
}

uint64_t sub_236F4DD34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_236F4EBF8();
  __break(1u);
  return result;
}

id sub_236F4DE2C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236F4A774(*a1, *(void *)(v2 + 56), a2);
}

uint64_t objectdestroy_10Tm()
{
  sub_236F46E90();
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_236F4DEAC()
{
  return sub_236F4AAC8(v0 + 16, *(void **)(v0 + 56));
}

uint64_t sub_236F4DEB8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_236F4E4A8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_236F4DEE8()
{
  return sub_236F4E4B8();
}

uint64_t sub_236F4DF10()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_236F4DF20(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_236F4DF38(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_236F4DF80@<D0>(uint64_t a1@<X8>)
{
  return sub_236F4C2B8(*(void **)(v1 + 16), a1);
}

unint64_t sub_236F4DF9C()
{
  unint64_t result = qword_2688E5830;
  if (!qword_2688E5830)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688E5818);
    sub_236F45AC4();
    sub_236F37B70();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5830);
  }
  return result;
}

uint64_t sub_236F4E058@<X0>(uint64_t a1@<X8>)
{
  return sub_236F4C1DC(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_236F4E060()
{
  unint64_t result = qword_2688E5838;
  if (!qword_2688E5838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688E5838);
  }
  return result;
}

uint64_t sub_236F4E0B4()
{
  return sub_236F4E448();
}

uint64_t sub_236F4E0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SUIKPFooterHyperlinkView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236F4E140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SUIKPFooterHyperlinkView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236F4E1A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SUIKPFooterHyperlinkView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236F4E200@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_236F4E4C8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_236F4E234()
{
  return sub_236F4E4D8();
}

uint64_t sub_236F4E26C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236F4E308()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_236F4E318()
{
  return MEMORY[0x270F816E8]();
}

uint64_t sub_236F4E328()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_236F4E338()
{
  return MEMORY[0x270F87508]();
}

uint64_t sub_236F4E348()
{
  return MEMORY[0x270F7DF48]();
}

uint64_t sub_236F4E358()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_236F4E368()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_236F4E378()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_236F4E388()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_236F4E398()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_236F4E3A8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_236F4E3B8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_236F4E3C8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_236F4E3D8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_236F4E3E8()
{
  return MEMORY[0x270EFF0D8]();
}

uint64_t sub_236F4E3F8()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_236F4E408()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_236F4E418()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_236F4E428()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_236F4E438()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_236F4E448()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_236F4E458()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_236F4E468()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_236F4E478()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_236F4E488()
{
  return MEMORY[0x270F00A68]();
}

uint64_t sub_236F4E498()
{
  return MEMORY[0x270F00A70]();
}

uint64_t sub_236F4E4A8()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_236F4E4B8()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_236F4E4C8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_236F4E4D8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_236F4E4E8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_236F4E4F8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_236F4E508()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_236F4E518()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_236F4E528()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_236F4E538()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_236F4E548()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_236F4E558()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_236F4E568()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_236F4E578()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_236F4E588()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_236F4E598()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_236F4E5A8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_236F4E5B8()
{
  return MEMORY[0x270F016B0]();
}

uint64_t sub_236F4E5C8()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_236F4E5D8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_236F4E5E8()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_236F4E5F8()
{
  return MEMORY[0x270F01AA0]();
}

uint64_t sub_236F4E608()
{
  return MEMORY[0x270F01AA8]();
}

uint64_t sub_236F4E618()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_236F4E628()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_236F4E638()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_236F4E658()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_236F4E668()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_236F4E678()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_236F4E698()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_236F4E6A8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_236F4E6B8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_236F4E6C8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_236F4E6D8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_236F4E6E8()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_236F4E6F8()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_236F4E708()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_236F4E718()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_236F4E728()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_236F4E738()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_236F4E748()
{
  return MEMORY[0x270F5D070]();
}

uint64_t sub_236F4E758()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_236F4E768()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_236F4E778()
{
  return MEMORY[0x270F035B8]();
}

uint64_t sub_236F4E788()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_236F4E798()
{
  return MEMORY[0x270F03650]();
}

uint64_t sub_236F4E7A8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_236F4E7B8()
{
  return MEMORY[0x270F039D8]();
}

uint64_t sub_236F4E7C8()
{
  return MEMORY[0x270F03A60]();
}

uint64_t sub_236F4E7D8()
{
  return MEMORY[0x270F03A70]();
}

uint64_t sub_236F4E7E8()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_236F4E7F8()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_236F4E808()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_236F4E818()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_236F4E828()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_236F4E838()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_236F4E848()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_236F4E858()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_236F4E868()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_236F4E878()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_236F4E888()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_236F4E898()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_236F4E8A8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_236F4E8B8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_236F4E8C8()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_236F4E8D8()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_236F4E8E8()
{
  return MEMORY[0x270F04A40]();
}

uint64_t sub_236F4E8F8()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_236F4E908()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_236F4E918()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_236F4E928()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_236F4E938()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_236F4E948()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_236F4E958()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_236F4E968()
{
  return MEMORY[0x270F052C0]();
}

uint64_t sub_236F4E978()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_236F4E988()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_236F4E998()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_236F4E9A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_236F4E9B8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_236F4E9C8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_236F4E9D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_236F4E9E8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_236F4E9F8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_236F4EA08()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_236F4EA18()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_236F4EA28()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_236F4EA38()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_236F4EA48()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_236F4EA58()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_236F4EA68()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_236F4EA78()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_236F4EA88()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_236F4EA98()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_236F4EAA8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_236F4EAB8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_236F4EAC8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_236F4EAD8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_236F4EAE8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_236F4EAF8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_236F4EB08()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_236F4EB18()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_236F4EB28()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_236F4EB38()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_236F4EB48()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_236F4EB58()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_236F4EB68()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_236F4EB78()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_236F4EB88()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_236F4EB98()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_236F4EBA8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_236F4EBB8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_236F4EBC8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_236F4EBD8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_236F4EBE8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_236F4EBF8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_236F4EC08()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_236F4EC18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_236F4EC28()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_236F4EC38()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_236F4EC48()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t CreateDetailControllerInstanceWithClass()
{
  return MEMORY[0x270F55198]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x270EF2BA8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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