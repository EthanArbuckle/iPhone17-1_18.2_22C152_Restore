id _MSLogSystem()
{
  void *v0;
  uint64_t vars8;

  if (_MSLogSystem_onceToken[0] != -1) {
    dispatch_once(_MSLogSystem_onceToken, &__block_literal_global);
  }
  v0 = (void *)_MSLogSystem_log;
  return v0;
}

uint64_t sub_262942348()
{
  if (qword_26A97FAD0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A9836E8;
  id v1 = (id)qword_26A9836E8;
  return v0;
}

uint64_t sub_2629423C0()
{
  return 1;
}

unint64_t sub_2629423C8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FB08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
  *(void *)(inited + 32) = 4804673;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(void *)(inited + 48) = sub_26297CA50();
  *(void *)(inited + 56) = 0x6874654D70747468;
  *(void *)(inited + 64) = 0xEA0000000000646FLL;
  *(void *)(inited + 72) = sub_26297CA50();
  return sub_26297305C(inited);
}

id sub_262942464()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmailAvailableAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmailAvailableAPIRequest()
{
  uint64_t result = qword_26A97FAE8;
  if (!qword_26A97FAE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2629424E8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_262942520()
{
  return type metadata accessor for EmailAvailableAPIRequest();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmailAvailableAPIResponse(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EmailAvailableAPIResponse(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2629426A4);
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

ValueMetadata *type metadata accessor for EmailAvailableAPIResponse()
{
  return &type metadata for EmailAvailableAPIResponse;
}

uint64_t sub_2629426E4()
{
  return 0x6C69616D65;
}

uint64_t sub_2629426F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_26297CDE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_262942788()
{
  return 0;
}

void sub_262942794(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2629427A0(uint64_t a1)
{
  unint64_t v2 = sub_262943124();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2629427DC(uint64_t a1)
{
  unint64_t v2 = sub_262943124();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_262942818(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FB38);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262943124();
  sub_26297CE90();
  sub_26297CDC0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_262942950()
{
  return sub_26297CE70();
}

uint64_t sub_262942994()
{
  return sub_26297CE60();
}

uint64_t sub_2629429BC()
{
  return sub_26297CE70();
}

uint64_t sub_2629429FC()
{
  return 0x6C62616C69617661;
}

uint64_t sub_262942A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6C62616C69617661 && a2 == 0xE900000000000065)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_26297CDE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_262942ABC(uint64_t a1)
{
  unint64_t v2 = sub_262942D1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_262942AF8(uint64_t a1)
{
  unint64_t v2 = sub_262942D1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_262942B34@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FAF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262942D1C();
  sub_26297CE80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v9 = sub_26297CDA0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9 & 1;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_262942D1C()
{
  unint64_t result = qword_26A97FB00;
  if (!qword_26A97FB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB00);
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

BOOL sub_262942DC0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_262942DD4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_262942DE4(void *a1@<X8>)
{
  *a1 = *v1;
}

void *initializeBufferWithCopyOfBuffer for EmailAvailableAPIRequestBody(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for EmailAvailableAPIRequestBody()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for EmailAvailableAPIRequestBody(void *a1, void *a2)
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

void *assignWithTake for EmailAvailableAPIRequestBody(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmailAvailableAPIRequestBody(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EmailAvailableAPIRequestBody(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EmailAvailableAPIRequestBody()
{
  return &type metadata for EmailAvailableAPIRequestBody;
}

void type metadata accessor for ACAccountCredentialRenewResult(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for AccountCreationFinishView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_262942F94(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_262942FB4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_262943000()
{
  return 0;
}

ValueMetadata *type metadata accessor for EmailAvailableAPIResponse.CodingKeys()
{
  return &type metadata for EmailAvailableAPIResponse.CodingKeys;
}

unint64_t sub_262943020()
{
  unint64_t result = qword_26A97FB20;
  if (!qword_26A97FB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB20);
  }
  return result;
}

unint64_t sub_262943078()
{
  unint64_t result = qword_26A97FB28;
  if (!qword_26A97FB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB28);
  }
  return result;
}

unint64_t sub_2629430D0()
{
  unint64_t result = qword_26A97FB30;
  if (!qword_26A97FB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB30);
  }
  return result;
}

unint64_t sub_262943124()
{
  unint64_t result = qword_26A97FB40;
  if (!qword_26A97FB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB40);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmailCreateAPIResponse.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *_s19iCloudMailAccountUI25EmailAvailableAPIResponseV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x262943264);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmailAvailableAPIRequestBody.CodingKeys()
{
  return &type metadata for EmailAvailableAPIRequestBody.CodingKeys;
}

uint64_t sub_26294329C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2629432BC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_26294330C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_262943358()
{
  unint64_t result = qword_26A97FB58;
  if (!qword_26A97FB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB58);
  }
  return result;
}

unint64_t sub_2629433B0()
{
  unint64_t result = qword_26A97FB60;
  if (!qword_26A97FB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB60);
  }
  return result;
}

unint64_t sub_262943408()
{
  unint64_t result = qword_26A97FB68;
  if (!qword_26A97FB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB68);
  }
  return result;
}

uint64_t sub_262943470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBA0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FB88);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FB80);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBA8);
  uint64_t v13 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a1 + 96);
  *(void *)uint64_t v5 = sub_26297C430();
  *((void *)v5 + 1) = v16;
  v5[16] = 0;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBB0);
  sub_2629437B8(a1, &v5[*(int *)(v17 + 44)]);
  LOBYTE(a1) = sub_26297C540();
  sub_2629475F0((uint64_t)v5, (uint64_t)v8, &qword_26A97FBA0);
  v18 = &v8[*(int *)(v6 + 36)];
  char *v18 = a1;
  *(_OWORD *)(v18 + 8) = 0u;
  *(_OWORD *)(v18 + 24) = 0u;
  v18[40] = 1;
  sub_262947654((uint64_t)v5, &qword_26A97FBA0);
  unint64_t v19 = sub_262947084();
  MEMORY[0x263E57F70](2, MEMORY[0x263F8EE78], v6, v19);
  sub_262947654((uint64_t)v8, &qword_26A97FB88);
  uint64_t v26 = v6;
  unint64_t v27 = v19;
  swift_getOpaqueTypeConformance2();
  sub_26297C720();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v21 = v24;
  uint64_t v20 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v25, v15, v24);
  v22 = (uint64_t (**)())(v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A97FB70) + 36));
  *v22 = sub_262945AE4;
  v22[1] = 0;
  v22[2] = 0;
  v22[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v21);
}

uint64_t sub_2629437B8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v37 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBB8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v36 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v32 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBC0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v34 = (uint64_t)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v32 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBC8);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v35 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v18 = (char *)&v32 - v17;
  uint64_t v38 = a1;
  sub_26297C520();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBD0);
  sub_262947E80(&qword_26A97FBD8, &qword_26A97FBD0);
  sub_26297C170();
  sub_2629451F4((uint64_t)v12);
  if (*(unsigned char *)(a1 + 40))
  {
    sub_262945850((uint64_t)v7);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBE0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 0, 1, v20);
  }
  else
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBE0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v7, 1, 1, v19);
  }
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v22 = v35;
  v23 = v18;
  v21(v35, v18, v13);
  uint64_t v24 = v34;
  sub_2629475F0((uint64_t)v12, v34, &qword_26A97FBC0);
  uint64_t v25 = v36;
  sub_2629475F0((uint64_t)v7, v36, &qword_26A97FBB8);
  v33 = v12;
  uint64_t v26 = (uint64_t)v7;
  uint64_t v27 = v24;
  v28 = v37;
  v21(v37, v22, v13);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBE8);
  sub_2629475F0(v27, (uint64_t)&v28[*(int *)(v29 + 48)], &qword_26A97FBC0);
  sub_2629475F0(v25, (uint64_t)&v28[*(int *)(v29 + 64)], &qword_26A97FBB8);
  sub_262947654(v26, &qword_26A97FBB8);
  sub_262947654((uint64_t)v33, &qword_26A97FBC0);
  v30 = *(void (**)(char *, uint64_t))(v14 + 8);
  v30(v23, v13);
  sub_262947654(v25, &qword_26A97FBB8);
  sub_262947654(v27, &qword_26A97FBC0);
  return ((uint64_t (*)(char *, uint64_t))v30)(v22, v13);
}

void *sub_262943BAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_26297C430();
  sub_262943C2C(a1, (uint64_t)__src);
  memcpy(&v7[7], __src, 0x1F9uLL);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0x4030000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  return memcpy((void *)(a2 + 17), v7, 0x200uLL);
}

uint64_t sub_262943C2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_26297C940();
  unint64_t v72 = v5;
  uint64_t v73 = v4;
  sub_2629443D8(a1, (uint64_t)__src);
  char v71 = sub_26297C550();
  sub_26297C130();
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  char v92 = 0;
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v63 = self;
  id v14 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_26297CAC0();
  sub_26297CAC0();
  sub_26297BEC0();

  swift_bridgeObjectRelease();
  sub_262947368();
  uint64_t v15 = sub_26297C660();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_26297C580();
  uint64_t v20 = sub_26297C650();
  uint64_t v22 = v21;
  char v24 = v23;
  swift_release();
  sub_2629476B0(v15, v17, v19);
  swift_bridgeObjectRelease();
  sub_26297C5A0();
  uint64_t v69 = sub_26297C5E0();
  uint64_t v70 = v25;
  uint64_t v75 = v26;
  char v58 = v27;
  sub_2629476B0(v20, v22, v24 & 1);
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  sub_26297CAC0();
  sub_26297CAC0();
  sub_26297BEC0();

  swift_bridgeObjectRelease();
  uint64_t v29 = sub_26297C660();
  uint64_t v67 = v30;
  uint64_t v68 = v29;
  char v57 = v31;
  uint64_t v74 = v32;
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_26297C660();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  sub_26297C590();
  uint64_t v38 = sub_26297C650();
  uint64_t v40 = v39;
  char v42 = v41;
  swift_release();
  sub_2629476B0(v33, v35, v37);
  swift_bridgeObjectRelease();
  sub_26297C5A0();
  uint64_t v43 = sub_26297C5E0();
  uint64_t v59 = v44;
  uint64_t v60 = v43;
  char v46 = v45;
  uint64_t v62 = v47;
  sub_2629476B0(v38, v40, v42 & 1);
  swift_bridgeObjectRelease();
  id v48 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  uint64_t v83 = 2777980912;
  unint64_t v84 = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v49 = sub_26297BEC0();
  unint64_t v51 = v50;

  swift_bridgeObjectRelease();
  uint64_t v83 = v49;
  unint64_t v84 = v51;
  uint64_t v52 = sub_26297C660();
  uint64_t v64 = v54;
  uint64_t v66 = v53;
  LOBYTE(v48) = v55 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  memcpy(__dst, __src, sizeof(__dst));
  LODWORD(v76) = *(_DWORD *)v93;
  *(_DWORD *)((char *)&v76 + 3) = *(_DWORD *)&v93[3];
  v78[0] = v73;
  v78[1] = v72;
  memcpy(&v78[2], __src, 0x130uLL);
  LOBYTE(v78[40]) = v71;
  *(_DWORD *)((char *)&v78[40] + 1) = *(_DWORD *)v93;
  HIDWORD(v78[40]) = *(_DWORD *)&v93[3];
  v78[41] = v7;
  v78[42] = v9;
  v78[43] = v11;
  v78[44] = v13;
  LOBYTE(v78[45]) = 0;
  memcpy((void *)a2, v78, 0x169uLL);
  char v82 = v58 & 1;
  char v81 = v57 & 1;
  char v80 = v46 & 1;
  char v79 = (char)v48;
  *(void *)(a2 + 368) = v69;
  *(void *)(a2 + 376) = v75;
  *(unsigned char *)(a2 + 384) = v58 & 1;
  *(void *)(a2 + 392) = v70;
  *(void *)(a2 + 400) = v68;
  *(void *)(a2 + 408) = v67;
  *(unsigned char *)(a2 + 416) = v57 & 1;
  *(void *)(a2 + 424) = v74;
  *(void *)(a2 + 432) = v60;
  *(void *)(a2 + 440) = v59;
  *(unsigned char *)(a2 + 448) = v46 & 1;
  *(void *)(a2 + 456) = v62;
  *(void *)(a2 + 464) = v52;
  *(void *)(a2 + 472) = v66;
  *(unsigned char *)(a2 + 480) = (_BYTE)v48;
  *(void *)(a2 + 488) = v64;
  *(void *)(a2 + 496) = KeyPath;
  *(unsigned char *)(a2 + 504) = 1;
  sub_2629476C8((uint64_t)v78);
  sub_2629477E8(v69, v75, v58 & 1);
  swift_bridgeObjectRetain();
  sub_2629477E8(v68, v67, v57 & 1);
  swift_bridgeObjectRetain();
  sub_2629477E8(v60, v59, v46 & 1);
  swift_bridgeObjectRetain();
  sub_2629477E8(v52, v66, (char)v48);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2629476B0(v52, v66, (char)v48);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2629476B0(v60, v59, v46 & 1);
  swift_bridgeObjectRelease();
  sub_2629476B0(v68, v67, v57 & 1);
  swift_bridgeObjectRelease();
  sub_2629476B0(v69, v75, v58 & 1);
  swift_bridgeObjectRelease();
  uint64_t v83 = v73;
  unint64_t v84 = v72;
  memcpy(v85, __dst, 0x130uLL);
  v85[304] = v71;
  *(_DWORD *)v86 = v76;
  *(_DWORD *)&v86[3] = *(_DWORD *)((char *)&v76 + 3);
  uint64_t v87 = v7;
  uint64_t v88 = v9;
  uint64_t v89 = v11;
  uint64_t v90 = v13;
  char v91 = 0;
  return sub_2629477F8((uint64_t)&v83);
}

uint64_t sub_2629443D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v3 = sub_26297C830();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = a1;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = (unsigned int *)MEMORY[0x263F1B4B8];
  uint64_t v101 = v4;
  uint64_t v102 = v5;
  v100 = v7;
  if (v8)
  {
    id v108 = v8;
    sub_26297C810();
    uint64_t v10 = *v9;
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
    unint64_t v99 = (v4 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v11(v7, v10, v3);
    uint64_t v107 = sub_26297C840();
    swift_release();
    uint64_t v12 = *(void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v95 = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v12(v7, v3);
    sub_26297C940();
    sub_26297C1D0();
    uint64_t v13 = v148;
    uint64_t v14 = v149;
    uint64_t v15 = v150;
    uint64_t v16 = v151;
    uint64_t v18 = v152;
    uint64_t v17 = v153;
    sub_26297C7F0();
    uint64_t v19 = sub_26297C7E0();
    swift_release();
    uint64_t v129 = v107;
    id v130 = v13;
    uint64_t v131 = v14;
    uint64_t v132 = v15;
    uint64_t v133 = v16;
    uint64_t v134 = v18;
    uint64_t v135 = v17;
    uint64_t v136 = v19;
    long long v137 = xmmword_26297DB60;
    uint64_t v138 = 0x4010000000000000;
    long long v139 = 0uLL;
    *(void *)&long long v140 = 0;
    BYTE8(v140) = 0;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC8);
    sub_26294792C(&qword_26A97FCD0, &qword_26A97FCC0, (void (*)(void))sub_2629479AC);
    sub_26294792C(&qword_26A97FCE8, &qword_26A97FCC8, (void (*)(void))sub_262947A20);
    sub_26297C460();
    swift_release();
    swift_release();
  }
  else
  {
    sub_26297C820();
    uint64_t v20 = *v9;
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
    unint64_t v99 = (v4 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v21(v7, v20, v3);
    uint64_t v22 = sub_26297C840();
    swift_release();
    char v23 = *(void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v95 = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v23(v7, v3);
    sub_26297C940();
    sub_26297C1D0();
    uint64_t v107 = v149;
    id v108 = v148;
    *(void *)&long long v106 = v151;
    *((void *)&v106 + 1) = v150;
    uint64_t v25 = v152;
    uint64_t v24 = v153;
    uint64_t v26 = sub_26297C800();
    uint64_t KeyPath = swift_getKeyPath();
    unsigned __int8 v28 = sub_26297C540();
    sub_26297C7F0();
    uint64_t v29 = sub_26297C7E0();
    swift_release();
    uint64_t v129 = v22;
    id v130 = v108;
    uint64_t v131 = v107;
    uint64_t v132 = *((void *)&v106 + 1);
    uint64_t v133 = v106;
    uint64_t v134 = v25;
    uint64_t v135 = v24;
    uint64_t v136 = KeyPath;
    *(void *)&long long v137 = v26;
    *((void *)&v137 + 1) = v28 | 0x10000;
    uint64_t v138 = v29;
    long long v139 = xmmword_26297DB60;
    *(void *)&long long v140 = 0x4010000000000000;
    BYTE8(v140) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC8);
    sub_26294792C(&qword_26A97FCD0, &qword_26A97FCC0, (void (*)(void))sub_2629479AC);
    sub_26294792C(&qword_26A97FCE8, &qword_26A97FCC8, (void (*)(void))sub_262947A20);
    sub_26297C460();
  }
  uint64_t v97 = *((void *)&v127[0] + 1);
  uint64_t v98 = *(void *)&v127[0];
  uint64_t v107 = *((void *)&v127[1] + 1);
  id v108 = *(id *)&v127[1];
  long long v106 = v127[2];
  uint64_t v104 = *((void *)&v127[3] + 1);
  uint64_t v105 = *(void *)&v127[3];
  uint64_t v93 = *((void *)&v127[4] + 1);
  uint64_t v94 = *(void *)&v127[4];
  uint64_t v91 = *((void *)&v127[5] + 1);
  uint64_t v92 = *(void *)&v127[5];
  uint64_t v89 = *((void *)&v127[6] + 1);
  uint64_t v90 = *(void *)&v127[6];
  int v88 = LOBYTE(v127[7]);
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v31 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_26297C850();
  uint64_t v33 = v100;
  uint64_t v32 = v101;
  uint64_t v34 = v102;
  (*(void (**)(char *, void, uint64_t))(v101 + 104))(v100, *MEMORY[0x263F1B4B8], v102);
  unint64_t v99 = sub_26297C840();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  sub_26297C940();
  sub_26297C1D0();
  LOBYTE(v34) = v155;
  uint64_t v35 = v156;
  LOBYTE(v33) = v157;
  uint64_t v36 = v159;
  uint64_t v101 = v158;
  uint64_t v102 = v154;
  uint64_t v37 = v103;
  v127[0] = *(_OWORD *)(v103 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD50);
  sub_26297C870();
  uint64_t v38 = v129;
  sub_26297C990();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  sub_26297C7F0();
  uint64_t v43 = sub_26297C7E0();
  v100 = (char *)v43;
  swift_release();
  unsigned __int8 v115 = 1;
  char v112 = v34;
  char v110 = (char)v33;
  uint64_t v44 = swift_allocObject();
  long long v45 = *(_OWORD *)(v37 + 80);
  *(_OWORD *)(v44 + 80) = *(_OWORD *)(v37 + 64);
  *(_OWORD *)(v44 + 96) = v45;
  *(void *)(v44 + 112) = *(void *)(v37 + 96);
  long long v46 = *(_OWORD *)(v37 + 16);
  *(_OWORD *)(v44 + 16) = *(_OWORD *)v37;
  *(_OWORD *)(v44 + 32) = v46;
  long long v47 = *(_OWORD *)(v37 + 48);
  *(_OWORD *)(v44 + 48) = *(_OWORD *)(v37 + 32);
  *(_OWORD *)(v44 + 64) = v47;
  LODWORD(v95) = v115;
  HIWORD(v131) = v114;
  *(_DWORD *)((char *)&v131 + 2) = v113;
  *(_DWORD *)((char *)&v133 + 1) = *(_DWORD *)v111;
  HIDWORD(v133) = *(_DWORD *)&v111[3];
  *(_DWORD *)((char *)&v135 + 1) = *(_DWORD *)v109;
  HIDWORD(v135) = *(_DWORD *)&v109[3];
  WORD3(v117) = v114;
  char v48 = v112;
  *(_DWORD *)((char *)&v117 + 2) = v113;
  DWORD1(v118) = *(_DWORD *)&v111[3];
  char v49 = v110;
  unint64_t v50 = v99;
  long long v116 = v99;
  LOWORD(v117) = v115;
  uint64_t v52 = v101;
  uint64_t v51 = v102;
  *((void *)&v117 + 1) = v102;
  LOBYTE(v118) = v112;
  *(_DWORD *)((char *)&v118 + 1) = *(_DWORD *)v111;
  uint64_t v53 = v35;
  *((void *)&v118 + 1) = v35;
  LOBYTE(v119) = v110;
  DWORD1(v119) = *(_DWORD *)&v109[3];
  *(_DWORD *)((char *)&v119 + 1) = *(_DWORD *)v109;
  *((void *)&v119 + 1) = v101;
  *(void *)&long long v120 = v36;
  uint64_t v54 = v36;
  *((void *)&v120 + 1) = v38;
  *(void *)&long long v121 = v38;
  *((void *)&v121 + 1) = v40;
  *(void *)&v122[0] = v42;
  *(_OWORD *)((char *)v122 + 8) = xmmword_26297DB70;
  *((void *)&v122[1] + 1) = v43;
  v122[2] = xmmword_26297DB60;
  *(void *)&long long v123 = 0x4010000000000000;
  *((void *)&v123 + 1) = sub_262947C04;
  uint64_t v124 = v44;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  char v128 = v88;
  char v55 = v88;
  long long v56 = v122[1];
  *(void *)((char *)&v127[11] + 7) = 0;
  *(_OWORD *)((char *)&v127[10] + 7) = (unint64_t)v44;
  *(_OWORD *)((char *)&v127[9] + 7) = v123;
  *(_OWORD *)((char *)&v127[8] + 7) = xmmword_26297DB60;
  uint64_t v57 = v96;
  *(unsigned char *)(v96 + 112) = v88;
  long long v58 = v127[9];
  long long v59 = v127[10];
  *(_OWORD *)(v57 + 288) = *(_OWORD *)((char *)&v127[10] + 15);
  *(_OWORD *)(v57 + 257) = v58;
  *(_OWORD *)(v57 + 273) = v59;
  *(_OWORD *)((char *)&v127[7] + 7) = v56;
  long long v60 = v127[8];
  *(_OWORD *)((char *)&v127[6] + 7) = v122[0];
  *(_OWORD *)((char *)&v127[5] + 7) = v121;
  *(_OWORD *)((char *)&v127[4] + 7) = v120;
  *(_OWORD *)((char *)&v127[3] + 7) = v119;
  *(_OWORD *)((char *)&v127[2] + 7) = v118;
  *(_OWORD *)((char *)&v127[1] + 7) = v117;
  *(_OWORD *)((char *)v127 + 7) = v116;
  long long v61 = v127[0];
  long long v62 = v127[1];
  long long v63 = v127[2];
  long long v64 = v127[4];
  long long v65 = v127[5];
  long long v66 = v127[6];
  long long v67 = v127[7];
  *(_OWORD *)(v57 + 161) = v127[3];
  *(_OWORD *)(v57 + 145) = v63;
  *(_OWORD *)(v57 + 129) = v62;
  *(_OWORD *)(v57 + 113) = v61;
  *(_OWORD *)(v57 + 225) = v67;
  uint64_t v69 = v97;
  uint64_t v68 = v98;
  *(void *)uint64_t v57 = v98;
  *(void *)(v57 + 8) = v69;
  uint64_t v71 = v107;
  id v70 = v108;
  *(void *)(v57 + 16) = v108;
  *(void *)(v57 + 24) = v71;
  uint64_t v72 = (uint64_t)v70;
  uint64_t v107 = v71;
  id v108 = v70;
  uint64_t v73 = v106;
  *(void *)(v57 + 32) = v106;
  uint64_t v74 = v73;
  *(void *)&long long v106 = v73;
  uint64_t v75 = *((void *)&v106 + 1);
  *(void *)(v57 + 40) = *((void *)&v106 + 1);
  uint64_t v76 = v75;
  *((void *)&v106 + 1) = v75;
  uint64_t v77 = v105;
  *(void *)(v57 + 48) = v105;
  uint64_t v105 = v77;
  uint64_t v78 = v104;
  uint64_t v79 = v93;
  uint64_t v80 = v94;
  *(void *)(v57 + 56) = v104;
  *(void *)(v57 + 64) = v80;
  uint64_t v82 = v91;
  uint64_t v81 = v92;
  *(void *)(v57 + 72) = v79;
  *(void *)(v57 + 80) = v81;
  uint64_t v83 = v89;
  uint64_t v84 = v90;
  *(void *)(v57 + 88) = v82;
  *(void *)(v57 + 96) = v84;
  *(void *)(v57 + 104) = v83;
  *(_OWORD *)(v57 + 209) = v66;
  *(_OWORD *)(v57 + 193) = v65;
  *(_OWORD *)(v57 + 177) = v64;
  *(_OWORD *)(v57 + 241) = v60;
  LOWORD(v131) = v95;
  uint64_t v132 = v51;
  LOBYTE(v133) = v48;
  uint64_t v134 = v53;
  LOBYTE(v135) = v49;
  uint64_t v136 = v52;
  *(void *)&long long v137 = v54;
  v141 = v100;
  uint64_t v143 = 0x4010000000000000;
  v144 = sub_262947C04;
  uint64_t v145 = v44;
  uint64_t v146 = 0;
  uint64_t v129 = v50;
  id v130 = 0;
  *((void *)&v137 + 1) = v38;
  uint64_t v138 = v38;
  *(void *)&long long v139 = v40;
  *((void *)&v139 + 1) = v42;
  long long v140 = xmmword_26297DB70;
  long long v142 = xmmword_26297DB60;
  uint64_t v147 = 0;
  char v85 = v55;
  sub_262947774(v68, v69, v72, v71, v74, v76, v77, v78, v80, v79, v81, v82, v84, v83, v55);
  sub_262947C0C((uint64_t)&v116);
  sub_262947198(v103);
  sub_262947C74((uint64_t)&v129);
  return sub_2629478A4(v68, v69, (uint64_t)v108, v107, v106, *((uint64_t *)&v106 + 1), v105, v104, v80, v79, v81, v82, v84, v83, v85);
}

uint64_t sub_262944D94(uint64_t a1)
{
  uint64_t v2 = sub_26297C9A0();
  uint64_t v27 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26297C9D0();
  uint64_t v25 = *(void *)(v5 - 8);
  uint64_t v26 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26297C9F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v22 - v13;
  sub_262947CDC();
  uint64_t v23 = sub_26297CBE0();
  sub_26297C9E0();
  MEMORY[0x263E581F0](v12, 0.16);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
  v24(v12, v8);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v15 + 96) = v16;
  *(void *)(v15 + 112) = *(void *)(a1 + 96);
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v15 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v15 + 32) = v17;
  long long v18 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v15 + 64) = v18;
  aBlock[4] = sub_262947D80;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = &block_descriptor;
  uint64_t v19 = _Block_copy(aBlock);
  sub_262947198(a1);
  swift_release();
  sub_26297C9C0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_262947DA0((unint64_t *)&qword_26A980AE0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262947E80((unint64_t *)&qword_26A980AF0, &qword_26A97FD60);
  sub_26297CC80();
  uint64_t v20 = (void *)v23;
  MEMORY[0x263E58390](v14, v7, v4, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v26);
  return ((uint64_t (*)(char *, uint64_t))v24)(v14, v8);
}

uint64_t sub_26294516C()
{
  return swift_release();
}

uint64_t sub_2629451F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v2 = sub_26297C180();
  uint64_t v50 = *(void *)(v2 - 8);
  uint64_t v51 = v2;
  MEMORY[0x270FA5388](v2);
  char v49 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_26297C500();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v44 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC50);
  uint64_t v6 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC58);
  MEMORY[0x270FA5388](v42);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC60);
  uint64_t v45 = *(void *)(v11 - 8);
  uint64_t v46 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC68);
  MEMORY[0x270FA5388](v40);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBC0);
  MEMORY[0x270FA5388](v43);
  long long v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  long long v19 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v18 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v18 + 96) = v19;
  *(void *)(v18 + 112) = *(void *)(v1 + 96);
  long long v20 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v18 + 32) = v20;
  long long v21 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v18 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v18 + 64) = v21;
  uint64_t v53 = v1;
  sub_262947198(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC70);
  sub_262947418();
  sub_26297C890();
  long long v54 = *(_OWORD *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C870();
  char v22 = 1;
  if ((v55 & 1) == 0)
  {
    long long v54 = *(_OWORD *)(v1 + 64);
    sub_26297C870();
    char v22 = v55;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = v22;
  uint64_t v25 = v41;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v41);
  uint64_t v26 = (uint64_t *)&v10[*(int *)(v42 + 36)];
  *uint64_t v26 = KeyPath;
  v26[1] = (uint64_t)sub_262947EC4;
  v26[2] = v24;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v25);
  uint64_t v27 = v44;
  sub_26297C4F0();
  sub_2629474C8();
  sub_262947DA0((unint64_t *)&qword_26A97FCB0, MEMORY[0x263F1A3B8]);
  uint64_t v28 = v48;
  sub_26297C6A0();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v28);
  sub_262947654((uint64_t)v10, &qword_26A97FC58);
  uint64_t v30 = v49;
  uint64_t v29 = v50;
  uint64_t v31 = v51;
  (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, *MEMORY[0x263F18558], v51);
  uint64_t v32 = swift_getKeyPath();
  uint64_t v33 = (uint64_t *)&v15[*(int *)(v40 + 36)];
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC30);
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))((char *)v33 + *(int *)(v34 + 28), v30, v31);
  uint64_t *v33 = v32;
  uint64_t v36 = v45;
  uint64_t v35 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v15, v13, v46);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v35);
  LOBYTE(v35) = sub_26297C530();
  sub_2629475F0((uint64_t)v15, (uint64_t)v17, &qword_26A97FC68);
  uint64_t v37 = &v17[*(int *)(v43 + 36)];
  char *v37 = v35;
  *(_OWORD *)(v37 + 8) = 0u;
  *(_OWORD *)(v37 + 24) = 0u;
  v37[40] = 1;
  sub_262947654((uint64_t)v15, &qword_26A97FC68);
  return sub_26294758C((uint64_t)v17, v52, &qword_26A97FBC0);
}

uint64_t sub_262945850@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBF0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBE0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v10 + 96) = v11;
  *(void *)(v10 + 112) = *(void *)(v1 + 96);
  long long v12 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v10 + 32) = v12;
  long long v13 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v10 + 64) = v13;
  uint64_t v20 = v1;
  sub_262947198(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FBF8);
  sub_262947208();
  sub_26297C890();
  long long v21 = *(_OWORD *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C870();
  if (v22)
  {
    char v14 = 1;
  }
  else
  {
    long long v21 = *(_OWORD *)(v1 + 64);
    sub_26297C870();
    char v14 = v22;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = v14;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v9, v6, v3);
  long long v17 = (uint64_t *)&v9[*(int *)(v7 + 36)];
  *long long v17 = KeyPath;
  v17[1] = (uint64_t)sub_262947360;
  v17[2] = v16;
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_26294758C((uint64_t)v9, a1, &qword_26A97FBE0);
}

uint64_t sub_262945AE4()
{
  uint64_t v0 = sub_26297C000();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_26297BFE0();
  os_log_type_t v6 = sub_26297CB60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_262940000, v5, v6, "[AccountCreation - All Set] page viewed", v7, 2u);
    MEMORY[0x263E58CD0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_262945C70(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_26297C000();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1) {
    long long v8 = *(_OWORD *)(v1 + 64);
  }
  else {
    long long v8 = *(_OWORD *)(v1 + 48);
  }
  long long v15 = v8;
  v14[15] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C880();
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v4, (uint64_t)qword_26A983738);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  uint64_t v10 = sub_26297BFE0();
  os_log_type_t v11 = sub_26297CB60();
  if (os_log_type_enabled(v10, v11))
  {
    long long v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v12 = 0;
    _os_log_impl(&dword_262940000, v10, v11, "[AccountCreation - All Set] tapped on Done", v12, 2u);
    MEMORY[0x263E58CD0](v12, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(void))(v2 + 16))(a1 & 1);
}

uint64_t sub_262945E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC88);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_26297C410();
  *((void *)v6 + 1) = 0x4028000000000000;
  v6[16] = 0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCB8);
  sub_262945FA4(a1, (uint64_t)&v6[*(int *)(v7 + 44)]);
  sub_26297C940();
  sub_26297C2B0();
  sub_2629475F0((uint64_t)v6, a2, &qword_26A97FC88);
  long long v8 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC70) + 36));
  long long v9 = v13[5];
  v8[4] = v13[4];
  v8[5] = v9;
  v8[6] = v13[6];
  long long v10 = v13[1];
  *long long v8 = v13[0];
  v8[1] = v10;
  long long v11 = v13[3];
  v8[2] = v13[2];
  v8[3] = v11;
  return sub_262947654((uint64_t)v6, &qword_26A97FC88);
}

uint64_t sub_262945FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v39[2] = a2;
  v39[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC40);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v40 = (void *)((char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_26297C180();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC20);
  uint64_t v9 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  long long v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC10);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  long long v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  long long v17 = (char *)v39 - v16;
  long long v41 = *(_OWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C870();
  if (v42 == 1)
  {
    sub_26297C1C0();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F18568], v4);
    uint64_t KeyPath = swift_getKeyPath();
    v39[1] = v12;
    long long v19 = (uint64_t *)&v15[*(int *)(v12 + 36)];
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC30);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v19 + *(int *)(v20 + 28), v7, v4);
    *long long v19 = KeyPath;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_26294758C((uint64_t)v15, (uint64_t)v17, &qword_26A97FC10);
    sub_2629475F0((uint64_t)v17, (uint64_t)v40, &qword_26A97FC10);
    swift_storeEnumTagMultiPayload();
    sub_262947284();
    sub_26297C460();
    return sub_262947654((uint64_t)v17, &qword_26A97FC10);
  }
  else
  {
    _s18CurrentBundleClassCMa();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v23 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    *(void *)&long long v41 = 2777980912;
    *((void *)&v41 + 1) = 0xA400000000000000;
    sub_26297CAC0();
    sub_26297CAC0();
    uint64_t v24 = sub_26297BEC0();
    uint64_t v26 = v25;

    swift_bridgeObjectRelease();
    *(void *)&long long v41 = v24;
    *((void *)&v41 + 1) = v26;
    sub_262947368();
    uint64_t v27 = sub_26297C660();
    uint64_t v29 = v28;
    LOBYTE(v26) = v30 & 1;
    sub_26297C5B0();
    uint64_t v31 = sub_26297C5E0();
    uint64_t v33 = v32;
    char v35 = v34;
    uint64_t v37 = v36;
    sub_2629476B0(v27, v29, v26);
    swift_bridgeObjectRelease();
    uint64_t v38 = v40;
    *uint64_t v40 = v31;
    v38[1] = v33;
    *((unsigned char *)v38 + 16) = v35 & 1;
    v38[3] = v37;
    swift_storeEnumTagMultiPayload();
    sub_262947284();
    return sub_26297C460();
  }
}

uint64_t sub_262946480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC40);
  MEMORY[0x270FA5388](v34);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26297C180();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC20);
  uint64_t v9 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  long long v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC10);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  long long v17 = (char *)&v31 - v16;
  long long v35 = *(_OWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C870();
  if (v36 == 1)
  {
    sub_26297C1C0();
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F18568], v5);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v31 = v12;
    long long v19 = (uint64_t *)&v15[*(int *)(v12 + 36)];
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC30);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v19 + *(int *)(v20 + 28), v8, v5);
    *long long v19 = KeyPath;
    uint64_t v21 = v32;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v32);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v21);
    sub_26294758C((uint64_t)v15, (uint64_t)v17, &qword_26A97FC10);
    sub_2629475F0((uint64_t)v17, (uint64_t)v4, &qword_26A97FC10);
    swift_storeEnumTagMultiPayload();
    sub_262947284();
    sub_26297C460();
    return sub_262947654((uint64_t)v17, &qword_26A97FC10);
  }
  else
  {
    _s18CurrentBundleClassCMa();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v24 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    *(void *)&long long v35 = 2777980912;
    *((void *)&v35 + 1) = 0xA400000000000000;
    sub_26297CAC0();
    sub_26297CAC0();
    uint64_t v25 = sub_26297BEC0();
    uint64_t v27 = v26;

    swift_bridgeObjectRelease();
    *(void *)&long long v35 = v25;
    *((void *)&v35 + 1) = v27;
    sub_262947368();
    *(void *)uint64_t v4 = sub_26297C660();
    *((void *)v4 + 1) = v28;
    v4[16] = v29 & 1;
    *((void *)v4 + 3) = v30;
    swift_storeEnumTagMultiPayload();
    sub_262947284();
    return sub_26297C460();
  }
}

uint64_t sub_26294692C()
{
  return sub_26297C6D0();
}

uint64_t sub_262946948()
{
  return sub_26297C270();
}

uint64_t sub_2629469D4()
{
  return sub_26297C2C0();
}

uint64_t sub_2629469F8(uint64_t a1)
{
  uint64_t v2 = sub_26297C180();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x263E57AC0](v4);
}

double sub_262946AC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  sub_26297C860();
  sub_26297C860();
  sub_26297C860();
  double result = v15;
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  *(unsigned char *)(a7 + 40) = a6;
  *(unsigned char *)(a7 + 48) = LOBYTE(v15);
  *(void *)(a7 + 56) = v16;
  *(unsigned char *)(a7 + 64) = LOBYTE(v15);
  *(void *)(a7 + 72) = v16;
  *(double *)(a7 + 80) = v15;
  *(void *)(a7 + 88) = v16;
  *(void *)(a7 + 96) = 0x4030000000000000;
  return result;
}

uint64_t destroy for AccountCreationFinishView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AccountCreationFinishView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  id v7 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AccountCreationFinishView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v6;
  id v7 = v6;

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AccountCreationFinishView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  uint64_t v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountCreationFinishView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountCreationFinishView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountCreationFinishView()
{
  return &type metadata for AccountCreationFinishView;
}

uint64_t sub_262946F2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_262946F48@<X0>(uint64_t a1@<X8>)
{
  return sub_262943470(*(void *)(v1 + 16), a1);
}

unint64_t sub_262946F50()
{
  unint64_t result = qword_26A97FB78;
  if (!qword_26A97FB78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FB70);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FB80);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FB88);
    sub_262947084();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB78);
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

unint64_t sub_262947084()
{
  unint64_t result = qword_26A97FB90;
  if (!qword_26A97FB90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FB88);
    sub_262947E80(&qword_26A97FB98, &qword_26A97FBA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FB90);
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

void *sub_26294715C@<X0>(uint64_t a1@<X8>)
{
  return sub_262943BAC(*(void *)(v1 + 16), a1);
}

uint64_t sub_262947168()
{
  return sub_262945C70(1);
}

uint64_t sub_262947190@<X0>(uint64_t a1@<X8>)
{
  return sub_262946480(*(void *)(v1 + 16), a1);
}

uint64_t sub_262947198(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v3 = v2;
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_262947208()
{
  unint64_t result = qword_26A97FC00;
  if (!qword_26A97FC00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FBF8);
    sub_262947284();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FC00);
  }
  return result;
}

unint64_t sub_262947284()
{
  unint64_t result = qword_26A97FC08;
  if (!qword_26A97FC08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FC10);
    sub_262947E80(&qword_26A97FC18, &qword_26A97FC20);
    sub_262947E80(&qword_26A97FC28, &qword_26A97FC30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FC08);
  }
  return result;
}

uint64_t sub_262947350()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_262947360(unsigned char *a1)
{
  return sub_26296B914(a1, *(unsigned char *)(v1 + 16));
}

unint64_t sub_262947368()
{
  unint64_t result = qword_26A97FC48;
  if (!qword_26A97FC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FC48);
  }
  return result;
}

uint64_t sub_2629473BC()
{
  return sub_26297C2C0();
}

uint64_t sub_2629473E8()
{
  return sub_262945C70(0);
}

uint64_t sub_262947410@<X0>(uint64_t a1@<X8>)
{
  return sub_262945E5C(*(void *)(v1 + 16), a1);
}

unint64_t sub_262947418()
{
  unint64_t result = qword_26A97FC78;
  if (!qword_26A97FC78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FC70);
    sub_262947E80(&qword_26A97FC80, &qword_26A97FC88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FC78);
  }
  return result;
}

uint64_t sub_2629474B8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_2629474C8()
{
  unint64_t result = qword_26A97FC90;
  if (!qword_26A97FC90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FC58);
    sub_262947E80(&qword_26A97FC98, &qword_26A97FC50);
    sub_262947E80(&qword_26A97FCA0, &qword_26A97FCA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FC90);
  }
  return result;
}

uint64_t sub_26294758C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2629475F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_262947654(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2629476B0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2629476C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 288);
  uint64_t v3 = *(void *)(a1 + 304);
  sub_262947774(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(unsigned char *)(a1 + 128));
  swift_retain();
  swift_retain();
  sub_2629477D8(v2);
  sub_2629477D8(v3);
  return a1;
}

uint64_t sub_262947774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a15)
  {
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return swift_retain();
}

uint64_t sub_2629477D8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2629477E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2629477F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 288);
  uint64_t v3 = *(void *)(a1 + 304);
  sub_2629478A4(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(unsigned char *)(a1 + 128));
  swift_release();
  swift_release();
  sub_262947914(v2);
  sub_262947914(v3);
  return a1;
}

uint64_t sub_2629478A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  swift_release();
  uint64_t result = swift_release();
  if (a15)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_262947914(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_26294792C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2629479AC()
{
  unint64_t result = qword_26A97FCD8;
  if (!qword_26A97FCD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FCE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FCD8);
  }
  return result;
}

unint64_t sub_262947A20()
{
  unint64_t result = qword_26A97FCF0;
  if (!qword_26A97FCF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FCF8);
    sub_262947AC0();
    sub_262947E80(&qword_26A97FD40, &qword_26A97FD48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FCF0);
  }
  return result;
}

unint64_t sub_262947AC0()
{
  unint64_t result = qword_26A97FD00;
  if (!qword_26A97FD00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FD08);
    sub_262947B60();
    sub_262947E80(&qword_26A97FD30, &qword_26A97FD38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FD00);
  }
  return result;
}

unint64_t sub_262947B60()
{
  unint64_t result = qword_26A97FD10;
  if (!qword_26A97FD10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FD18);
    sub_2629479AC();
    sub_262947E80(&qword_26A97FD20, &qword_26A97FD28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FD10);
  }
  return result;
}

uint64_t sub_262947C04()
{
  return sub_262944D94(v0 + 16);
}

uint64_t sub_262947C0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 168);
  swift_retain();
  swift_retain();
  sub_2629477D8(v2);
  sub_2629477D8(v3);
  return a1;
}

uint64_t sub_262947C74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 168);
  swift_release();
  swift_release();
  sub_262947914(v2);
  sub_262947914(v3);
  return a1;
}

unint64_t sub_262947CDC()
{
  unint64_t result = qword_26A97FD58;
  if (!qword_26A97FD58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A97FD58);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_262947D80()
{
  return sub_26294516C();
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

uint64_t sub_262947DA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_262947DE8()
{
  return sub_26297C880();
}

uint64_t sub_262947E44()
{
  return sub_262947E80(&qword_26A97FD68, &qword_26A97FD70);
}

uint64_t sub_262947E80(unint64_t *a1, uint64_t *a2)
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

uint64_t destroy for MSSubmitButton()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MSSubmitButton(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MSSubmitButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for MSSubmitButton(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MSSubmitButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MSSubmitButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MSSubmitButton()
{
  return &type metadata for MSSubmitButton;
}

uint64_t sub_262948144()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_262948160@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v38 = a1;
  uint64_t v3 = sub_26297C180();
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  MEMORY[0x270FA5388](v3);
  long long v35 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26297C500();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  uint64_t v33 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD78);
  uint64_t v9 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  long long v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD80);
  uint64_t v12 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD88);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = v2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD90);
  sub_262948D4C();
  sub_26297C890();
  sub_26297C4F0();
  sub_262947E80(&qword_26A97FDC0, &qword_26A97FD78);
  sub_262948EA4();
  uint64_t v20 = v31;
  uint64_t v19 = v32;
  sub_26297C6A0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v19);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  char v22 = v35;
  uint64_t v21 = v36;
  uint64_t v23 = v37;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v35, *MEMORY[0x263F18558], v37);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = (uint64_t *)&v18[*(int *)(v16 + 44)];
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC30);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))((char *)v25 + *(int *)(v26 + 28), v22, v23);
  *uint64_t v25 = KeyPath;
  uint64_t v27 = v34;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v18, v14, v34);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v27);
  LOBYTE(v27) = sub_26297C530();
  uint64_t v28 = v38;
  sub_2629475F0((uint64_t)v18, v38, &qword_26A97FD88);
  uint64_t v29 = v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A97FDC8) + 36);
  *(unsigned char *)uint64_t v29 = v27;
  *(_OWORD *)(v29 + 8) = 0u;
  *(_OWORD *)(v29 + 24) = 0u;
  *(unsigned char *)(v29 + 40) = 1;
  return sub_262947654((uint64_t)v18, &qword_26A97FD88);
}

uint64_t sub_2629485EC@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FDD0);
  uint64_t v50 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  char v49 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FDD8);
  MEMORY[0x270FA5388](v52);
  uint64_t v53 = (uint64_t)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26297C180();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC20);
  uint64_t v46 = *(void *)(v9 - 8);
  uint64_t v47 = v9;
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC10);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FDA8);
  uint64_t v15 = MEMORY[0x270FA5388](v51);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v48 = (uint64_t)&v46 - v18;
  long long v74 = *a1;
  LOBYTE(v75) = *((unsigned char *)a1 + 16);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FDE0);
  MEMORY[0x263E580B0](&v65, v19);
  if (v65 == 1)
  {
    sub_26297C1C0();
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F18568], v5);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v21 = (uint64_t *)&v14[*(int *)(v12 + 36)];
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC30);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v21 + *(int *)(v22 + 28), v8, v5);
    *uint64_t v21 = KeyPath;
    uint64_t v24 = v46;
    uint64_t v23 = v47;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v14, v11, v47);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v23);
    uint64_t v25 = sub_26297C940();
    sub_262960DD8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, 0.0, 1, v25, v26);
    sub_262947654((uint64_t)v14, &qword_26A97FC10);
    uint64_t v27 = v48;
    sub_262948F44((uint64_t)v17, v48);
    sub_2629475F0(v27, v53, &qword_26A97FDA8);
    swift_storeEnumTagMultiPayload();
    sub_262948FF0(&qword_26A97FDA0, &qword_26A97FDA8, (void (*)(void))sub_262947284);
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FDB0);
    unint64_t v29 = sub_262948E30();
    *(void *)&long long v74 = v28;
    *((void *)&v74 + 1) = v29;
    swift_getOpaqueTypeConformance2();
    sub_26297C460();
    return sub_262947654(v27, &qword_26A97FDA8);
  }
  else
  {
    uint64_t v31 = *((void *)a1 + 6);
    *(void *)&long long v74 = *((void *)a1 + 5);
    *((void *)&v74 + 1) = v31;
    sub_262947368();
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_26297C660();
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    char v38 = v37 & 1;
    uint64_t v39 = sub_26297C940();
    sub_262960E34(0.0, 0, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v65, 0.0, 1, 0.0, 1, v39, v40, v32, v34, v38, v36);
    sub_2629476B0(v32, v34, v38);
    swift_bridgeObjectRelease();
    long long v80 = v71;
    long long v81 = v72;
    long long v82 = v73;
    long long v76 = v67;
    long long v77 = v68;
    long long v78 = v69;
    long long v79 = v70;
    long long v74 = v65;
    long long v75 = v66;
    long long v62 = v71;
    long long v63 = v72;
    long long v64 = v73;
    long long v58 = v67;
    long long v59 = v68;
    long long v60 = v69;
    long long v61 = v70;
    long long v56 = v65;
    long long v57 = v66;
    sub_26297C5B0();
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FDB0);
    unint64_t v42 = sub_262948E30();
    uint64_t v43 = v49;
    sub_26297C690();
    sub_262948F04((uint64_t)&v74);
    uint64_t v44 = v50;
    uint64_t v45 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v53, v43, v55);
    swift_storeEnumTagMultiPayload();
    sub_262948FF0(&qword_26A97FDA0, &qword_26A97FDA8, (void (*)(void))sub_262947284);
    *(void *)&long long v65 = v41;
    *((void *)&v65 + 1) = v42;
    swift_getOpaqueTypeConformance2();
    sub_26297C460();
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  }
}

uint64_t sub_262948D00@<X0>(uint64_t a1@<X8>)
{
  return sub_262948160(a1);
}

uint64_t sub_262948D44@<X0>(uint64_t a1@<X8>)
{
  return sub_2629485EC(*(long long **)(v1 + 16), a1);
}

unint64_t sub_262948D4C()
{
  unint64_t result = qword_26A97FD98;
  if (!qword_26A97FD98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FD90);
    sub_262948FF0(&qword_26A97FDA0, &qword_26A97FDA8, (void (*)(void))sub_262947284);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FDB0);
    sub_262948E30();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FD98);
  }
  return result;
}

unint64_t sub_262948E30()
{
  unint64_t result = qword_26A97FDB8;
  if (!qword_26A97FDB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FDB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FDB8);
  }
  return result;
}

unint64_t sub_262948EA4()
{
  unint64_t result = qword_26A97FCB0;
  if (!qword_26A97FCB0)
  {
    sub_26297C500();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FCB0);
  }
  return result;
}

uint64_t sub_262948F04(uint64_t a1)
{
  return a1;
}

uint64_t sub_262948F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FDA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_262948FAC()
{
  return sub_262948FF0(&qword_26A97FDE8, &qword_26A97FDC8, (void (*)(void))sub_26294906C);
}

uint64_t sub_262948FF0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_26294906C()
{
  unint64_t result = qword_26A97FDF0;
  if (!qword_26A97FDF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FD88);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FD78);
    sub_26297C500();
    sub_262947E80(&qword_26A97FDC0, &qword_26A97FD78);
    sub_262948EA4();
    swift_getOpaqueTypeConformance2();
    sub_262947E80(&qword_26A97FC28, &qword_26A97FC30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FDF0);
  }
  return result;
}

uint64_t sub_262949184()
{
  if (qword_26A97FAD0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A9836E8;
  id v1 = (id)qword_26A9836E8;
  return v0;
}

unint64_t sub_2629491FC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FB08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
  *(void *)(inited + 32) = 4804673;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(void *)(inited + 48) = sub_26297CA50();
  *(void *)(inited + 56) = 0x6874654D70747468;
  *(void *)(inited + 64) = 0xEA0000000000646FLL;
  *(void *)(inited + 72) = sub_26297CA50();
  return sub_26297305C(inited);
}

id sub_262949298()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmailCreateAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmailCreateAPIRequest()
{
  uint64_t result = qword_26A97FDF8;
  if (!qword_26A97FDF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26294931C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FE30);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262949C6C();
  sub_26297CE90();
  char v14 = 0;
  sub_26297CDC0();
  if (!v5)
  {
    char v13 = 1;
    sub_26297CDC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_262949490()
{
  return type metadata accessor for EmailCreateAPIRequest();
}

ValueMetadata *type metadata accessor for EmailCreateAPIResponse()
{
  return &type metadata for EmailCreateAPIResponse;
}

BOOL sub_2629494A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2629494C0()
{
  return sub_26297CE70();
}

uint64_t sub_262949508()
{
  return sub_26297CE60();
}

uint64_t sub_262949534()
{
  return sub_26297CE70();
}

uint64_t sub_262949578()
{
  if (*v0) {
    return 0x6C69616D65;
  }
  else {
    return 0x496E726574746170;
  }
}

uint64_t sub_2629495B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_262949F70(a1, a2);
  *a3 = result;
  return result;
}

void sub_2629495DC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2629495E8(uint64_t a1)
{
  unint64_t v2 = sub_262949C6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_262949624(uint64_t a1)
{
  unint64_t v2 = sub_262949C6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_262949660(void *a1)
{
  return sub_26294931C(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_262949680(uint64_t a1)
{
  unint64_t v2 = sub_262949870();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2629496BC(uint64_t a1)
{
  unint64_t v2 = sub_262949870();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2629496F8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FE08);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262949870();
  sub_26297CE80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v9 = sub_26297CD90();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

unint64_t sub_262949870()
{
  unint64_t result = qword_26A97FE10;
  if (!qword_26A97FE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE10);
  }
  return result;
}

uint64_t destroy for EmailCreateAPIRequestBody()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EmailCreateAPIRequestBody(void *a1, void *a2)
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

void *assignWithCopy for EmailCreateAPIRequestBody(void *a1, void *a2)
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

void *assignWithTake for EmailCreateAPIRequestBody(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for EmailCreateAPIRequestBody(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmailCreateAPIRequestBody(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmailCreateAPIRequestBody()
{
  return &type metadata for EmailCreateAPIRequestBody;
}

unsigned char *storeEnumTagSinglePayload for EmailCreateAPIResponse.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x262949B2CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmailCreateAPIResponse.CodingKeys()
{
  return &type metadata for EmailCreateAPIResponse.CodingKeys;
}

unint64_t sub_262949B68()
{
  unint64_t result = qword_26A97FE18;
  if (!qword_26A97FE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE18);
  }
  return result;
}

unint64_t sub_262949BC0()
{
  unint64_t result = qword_26A97FE20;
  if (!qword_26A97FE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE20);
  }
  return result;
}

unint64_t sub_262949C18()
{
  unint64_t result = qword_26A97FE28;
  if (!qword_26A97FE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE28);
  }
  return result;
}

unint64_t sub_262949C6C()
{
  unint64_t result = qword_26A97FE38;
  if (!qword_26A97FE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE38);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmailCreateAPIRequestBody.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EmailCreateAPIRequestBody.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x262949E1CLL);
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

uint64_t sub_262949E44(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_262949E4C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EmailCreateAPIRequestBody.CodingKeys()
{
  return &type metadata for EmailCreateAPIRequestBody.CodingKeys;
}

unint64_t sub_262949E6C()
{
  unint64_t result = qword_26A97FE40;
  if (!qword_26A97FE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE40);
  }
  return result;
}

unint64_t sub_262949EC4()
{
  unint64_t result = qword_26A97FE48;
  if (!qword_26A97FE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE48);
  }
  return result;
}

unint64_t sub_262949F1C()
{
  unint64_t result = qword_26A97FE50;
  if (!qword_26A97FE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE50);
  }
  return result;
}

uint64_t sub_262949F70(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x496E726574746170 && a2 == 0xE900000000000064;
  if (v2 || (sub_26297CDE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_26297CDE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_26294A068()
{
  if (qword_26A97FAD0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A9836E8;
  id v1 = (id)qword_26A9836E8;
  return v0;
}

id sub_26294A0E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for iCloudMailValidationRulesAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for iCloudMailValidationRulesAPIRequest()
{
  uint64_t result = qword_26A97FE58;
  if (!qword_26A97FE58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26294A164()
{
  return type metadata accessor for iCloudMailValidationRulesAPIRequest();
}

uint64_t destroy for ValidationRule()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ValidationRule(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ValidationRule(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ValidationRule(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ValidationRule(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationRule(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValidationRule()
{
  return &type metadata for ValidationRule;
}

ValueMetadata *type metadata accessor for iCloudMailValidationRulesAPIResponse()
{
  return &type metadata for iCloudMailValidationRulesAPIResponse;
}

BOOL sub_26294A430(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_26294A444()
{
  uint64_t result = 1701606770;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x74697243656C7572;
      break;
    case 2:
      uint64_t result = 0x646F43726F727265;
      break;
    case 3:
      uint64_t result = 0x73654D726F727265;
      break;
    case 4:
      uint64_t result = 0x614D646C756F6873;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_26294A504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_26294A74C(a1, a2);
  *a3 = result;
  return result;
}

void sub_26294A52C(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_26294A538(uint64_t a1)
{
  unint64_t v2 = sub_26294AD88();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26294A574(uint64_t a1)
{
  unint64_t v2 = sub_26294AD88();
  return MEMORY[0x270FA00B8](a1, v2);
}

__n128 sub_26294A5B0@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_26294A9B0(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(unsigned char *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_26294A604()
{
  return 0x73656C7572;
}

uint64_t sub_26294A618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73656C7572 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_26297CDE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_26294A6A8(uint64_t a1)
{
  unint64_t v2 = sub_26294AF54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_26294A6E4(uint64_t a1)
{
  unint64_t v2 = sub_26294AF54();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_26294A720@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_26294ADDC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_26294A74C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701606770 && a2 == 0xE400000000000000;
  if (v2 || (sub_26297CDE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74697243656C7572 && a2 == 0xEC00000061697265 || (sub_26297CDE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_26297CDE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73654D726F727265 && a2 == 0xEC00000065676173 || (sub_26297CDE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x614D646C756F6873 && a2 == 0xEB00000000686374)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_26297CDE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_26294A9B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FE68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26294AD88();
  sub_26297CE80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v35 = 0;
  uint64_t v9 = sub_26297CD90();
  uint64_t v11 = v10;
  uint64_t v29 = v9;
  char v34 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_26297CD90();
  uint64_t v30 = v13;
  uint64_t v26 = v12;
  char v33 = 2;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  uint64_t v25 = sub_26297CD90();
  char v32 = 3;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_26297CD90();
  uint64_t v27 = v15;
  uint64_t v23 = v16;
  uint64_t v24 = v17;
  char v31 = 4;
  swift_bridgeObjectRetain();
  char v18 = sub_26297CDA0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  uint64_t v19 = v24;
  swift_bridgeObjectRelease();
  uint64_t v20 = v27;
  swift_bridgeObjectRelease();
  uint64_t v21 = v30;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v29;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v21;
  *(void *)(a2 + 32) = v25;
  *(void *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v23;
  *(void *)(a2 + 56) = v19;
  *(unsigned char *)(a2 + 64) = v18 & 1;
  return result;
}

unint64_t sub_26294AD88()
{
  unint64_t result = qword_26A97FE70;
  if (!qword_26A97FE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE70);
  }
  return result;
}

void *sub_26294ADDC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FE78);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26294AF54();
  sub_26297CE80();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FE88);
    sub_26294AFA8();
    sub_26297CDB0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_26294AF54()
{
  unint64_t result = qword_26A97FE80;
  if (!qword_26A97FE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE80);
  }
  return result;
}

unint64_t sub_26294AFA8()
{
  unint64_t result = qword_26A97FE90;
  if (!qword_26A97FE90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FE88);
    sub_26294B01C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE90);
  }
  return result;
}

unint64_t sub_26294B01C()
{
  unint64_t result = qword_26A97FE98;
  if (!qword_26A97FE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FE98);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for iCloudMailValidationRulesAPIResponse.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x26294B10CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for iCloudMailValidationRulesAPIResponse.CodingKeys()
{
  return &type metadata for iCloudMailValidationRulesAPIResponse.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ValidationRule.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ValidationRule.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26294B2A0);
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

unsigned char *sub_26294B2C8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ValidationRule.CodingKeys()
{
  return &type metadata for ValidationRule.CodingKeys;
}

unint64_t sub_26294B2E4()
{
  unint64_t result = qword_26A97FEA0;
  if (!qword_26A97FEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FEA0);
  }
  return result;
}

unint64_t sub_26294B33C()
{
  unint64_t result = qword_26A97FEA8;
  if (!qword_26A97FEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FEA8);
  }
  return result;
}

unint64_t sub_26294B394()
{
  unint64_t result = qword_26A97FEB0;
  if (!qword_26A97FEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FEB0);
  }
  return result;
}

unint64_t sub_26294B3EC()
{
  unint64_t result = qword_26A97FEB8;
  if (!qword_26A97FEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FEB8);
  }
  return result;
}

unint64_t sub_26294B444()
{
  unint64_t result = qword_26A97FEC0;
  if (!qword_26A97FEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FEC0);
  }
  return result;
}

unint64_t sub_26294B49C()
{
  unint64_t result = qword_26A97FEC8;
  if (!qword_26A97FEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FEC8);
  }
  return result;
}

uint64_t sub_26294B4F0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000020;
  unint64_t v3 = 0x800000026297FCE0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000020;
  switch(v4)
  {
    case 1:
      unsigned int v6 = "iCloudMailSettings.AutoReply.Enabled";
      goto LABEL_4;
    case 2:
      unsigned int v6 = "iCloudMailSettings.MailRules.Enabled";
LABEL_4:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000024;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000029;
      BOOL v7 = "iCloudMailSettings.MailForwarding.Enabled";
      goto LABEL_7;
    case 4:
      unint64_t v5 = 0xD000000000000025;
      BOOL v7 = "iCloudMailSettings.MailImport.Enabled";
LABEL_7:
      unint64_t v3 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v8 = 0x800000026297FCE0;
  switch(a2)
  {
    case 1:
      uint64_t v9 = "iCloudMailSettings.AutoReply.Enabled";
      goto LABEL_11;
    case 2:
      uint64_t v9 = "iCloudMailSettings.MailRules.Enabled";
LABEL_11:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      unint64_t v2 = 0xD000000000000024;
      goto LABEL_12;
    case 3:
      unint64_t v10 = 0xD000000000000029;
      uint64_t v11 = "iCloudMailSettings.MailForwarding.Enabled";
      goto LABEL_16;
    case 4:
      unint64_t v10 = 0xD000000000000025;
      uint64_t v11 = "iCloudMailSettings.MailImport.Enabled";
LABEL_16:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      if (v5 == v10) {
        goto LABEL_17;
      }
      goto LABEL_19;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_17:
      if (v3 == v8) {
        char v12 = 1;
      }
      else {
LABEL_19:
      }
        char v12 = sub_26297CDE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12 & 1;
  }
}

uint64_t sub_26294B690()
{
  return sub_26297CE70();
}

uint64_t sub_26294B788()
{
  sub_26297CAA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_26294B864()
{
  return sub_26297CE70();
}

unint64_t sub_26294B958(char a1)
{
  unint64_t result = 0xD000000000000020;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000024;
      break;
    case 3:
      unint64_t result = 0xD000000000000029;
      break;
    case 4:
      unint64_t result = 0xD000000000000025;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_26294BA00(unsigned __int8 *a1, char *a2)
{
  return sub_26294B4F0(*a1, *a2);
}

uint64_t sub_26294BA0C()
{
  return sub_26294B690();
}

uint64_t sub_26294BA14()
{
  return sub_26294B788();
}

uint64_t sub_26294BA1C()
{
  return sub_26294B864();
}

uint64_t sub_26294BA24@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26294BC14();
  *a1 = result;
  return result;
}

unint64_t sub_26294BA54@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_26294B958(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_26294BA80()
{
  uint64_t result = sub_26297CA50();
  qword_26A9836E8 = result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for AccountBagKeys.SubFeature(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x26294BB84);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountBagKeys.SubFeature()
{
  return &type metadata for AccountBagKeys.SubFeature;
}

unint64_t sub_26294BBC0()
{
  unint64_t result = qword_26A97FED0;
  if (!qword_26A97FED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A97FED0);
  }
  return result;
}

uint64_t sub_26294BC14()
{
  unint64_t v0 = sub_26297CD80();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_26294BC64()
{
  return swift_initClassMetadata2();
}

uint64_t sub_26294BCCC(uint64_t a1)
{
  *(void *)(v1 + qword_26A97FED8) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_26294BCE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_26A97FEE8;
  swift_beginAccess();
  return sub_2629475F0(v3, a1, &qword_26A980108);
}

id sub_26294BD3C()
{
  uint64_t v1 = *(void **)(v0 + qword_26A97FED8);
  if (v1)
  {
    id v2 = *(id *)(v0 + qword_26A97FED8);
LABEL_5:
    id v7 = v1;
    return v2;
  }
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_defaultStore);
  uint64_t v5 = *(void **)(v0 + qword_26A97FED8);
  *(void *)(v0 + qword_26A97FED8) = v4;

  id result = objc_msgSend(v3, sel_defaultStore);
  if (result)
  {
    id v2 = result;
    uint64_t v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_26294BDD8()
{
  uint64_t v1 = qword_26A97FEF0;
  id v2 = *(void **)(v0 + qword_26A97FEF0);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_26A97FEF0);
  }
  else
  {
    sub_26294C4D8(v0);
    id v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_26294BE3C()
{
  return 0;
}

uint64_t sub_26294BE44(char a1)
{
  uint64_t result = 5522759;
  switch(a1)
  {
    case 1:
      uint64_t result = 1414745936;
      break;
    case 2:
      uint64_t result = 5526864;
      break;
    case 3:
      uint64_t result = 0x4554454C4544;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_26294BEB8()
{
  uint64_t v1 = sub_26297C000();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))(v3);
  uint64_t v8 = v7;
  unint64_t v10 = v9;
  id v11 = objc_msgSend(*(id *)((char *)v0 + qword_26A97FEE0), sel_propertiesForDataclass_, v6);
  if (v11)
  {
    char v12 = v11;
    uint64_t v13 = sub_26297CA20();

    uint64_t v30 = v8;
    unint64_t v31 = v10;
    swift_bridgeObjectRetain();
    sub_26297CCB0();
    if (*(void *)(v13 + 16) && (unint64_t v14 = sub_26295FB08((uint64_t)v32), (v15 & 1) != 0))
    {
      sub_262952218(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v33);
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_262952338((uint64_t)v32);
    if (*((void *)&v34 + 1))
    {
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();

        return v30;
      }
    }
    else
    {
      sub_262947654((uint64_t)&v33, &qword_26A980110);
    }
  }
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v1, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v17, v1);
  id v18 = v6;
  swift_bridgeObjectRetain_n();
  id v19 = v18;
  uint64_t v20 = sub_26297BFE0();
  os_log_type_t v21 = sub_26297CB70();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v32[0] = v28;
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v29 = v5;
    swift_bridgeObjectRetain();
    *(void *)&long long v33 = sub_26296B1B8(v8, v10, v32);
    uint64_t v23 = v1;
    sub_26297CC40();

    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v24 = sub_26297CA60();
    *(void *)&long long v33 = sub_26296B1B8(v24, v25, v32);
    sub_26297CC40();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_262940000, v20, v21, "Account bag has no value for key: %s in %s", (uint8_t *)v22, 0x16u);
    uint64_t v26 = v28;
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v26, -1, -1);
    MEMORY[0x263E58CD0](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v29, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  swift_bridgeObjectRelease();

  return 0;
}

id sub_26294C310(void *a1)
{
  id v1 = a1;
  sub_26294BEB8();

  uint64_t v2 = (void *)sub_26297CA50();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_26294C378()
{
}

uint64_t sub_26294C3D4()
{
  return type metadata accessor for MSAPIResponse();
}

uint64_t sub_26294C3E0()
{
  swift_getObjCClassMetadata();
  sub_26294C3D4();
  return swift_getObjCClassFromMetadata();
}

void sub_26294C418()
{
}

void sub_26294C478()
{
}

void sub_26294C4D8(uint64_t a1)
{
  id v2 = sub_26294BD3C();
  id v3 = sub_26294BD3C();
  id v4 = objc_msgSend(v3, sel_aida_accountForiCloudAccount_, *(void *)(a1 + qword_26A97FEE0));

  id v5 = objc_allocWithZone(MEMORY[0x263F25878]);
  id v6 = (void *)sub_26297CA50();
  id v7 = objc_msgSend(v5, sel_initWithAccountStore_grandSlamAccount_appTokenID_, v2, v4, v6);

  if (!v7) {
    __break(1u);
  }
}

id sub_26294C5A0(void *a1)
{
  uint64_t v2 = sub_26297BE10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = a1;
  sub_26294C698((uint64_t)v5);

  id v7 = (void *)sub_26297BDD0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

void sub_26294C698(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v35[3] = a1;
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = sub_26297C000();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v35 - v7;
  uint64_t v9 = (objc_class *)type metadata accessor for MSRequest();
  v39.receiver = v1;
  v39.super_class = v9;
  id v10 = objc_msgSendSuper2(&v39, sel_urlRequest);
  if (!v10)
  {
    __break(1u);
    JUMPOUT(0x26294CEE4);
  }
  id v11 = v10;
  objc_msgSend(v10, sel_mutableCopy);

  sub_26297CC70();
  swift_unknownObjectRelease();
  sub_2629522E4(0, &qword_26A980100);
  uint64_t v12 = swift_dynamicCast();
  uint64_t v13 = (void *)v36;
  if ((*(uint64_t (**)(uint64_t))((*v3 & *v1) + 0xE0))(v12))
  {
    id v15 = sub_26294BDD8();
    objc_msgSend(v15, sel_setUseAltDSID_, 1);

    id v16 = sub_26294BDD8();
    unsigned __int8 v17 = objc_msgSend(v16, sel_signURLRequest_isUserInitiated_, v13, 1);

    if ((v17 & 1) == 0)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v18 = __swift_project_value_buffer(v4, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v18, v4);
      id v19 = sub_26297BFE0();
      os_log_type_t v20 = sub_26297CB70();
      if (os_log_type_enabled(v19, v20))
      {
        os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v21 = 0;
        _os_log_impl(&dword_262940000, v19, v20, "Unable to sign grandslam request", v21, 2u);
        MEMORY[0x263E58CD0](v21, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    id v14 = objc_msgSend(v13, sel_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_, *(void *)((char *)v2 + qword_26A97FEE0), 0);
  }
  else
  {
    id v14 = objc_msgSend(v13, sel_aa_addAuthTokenOrBasicAuthHeaderWithAccount_preferUsingPassword_, *(void *)((char *)v1 + qword_26A97FEE0), 0);
  }
  (*(void (**)(id))((*v3 & *v2) + 0xD8))(v14);
  uint64_t v22 = (void *)sub_26297CA50();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setHTTPMethod_, v22);

  uint64_t v23 = (uint64_t)v2 + qword_26A97FEE8;
  swift_beginAccess();
  sub_2629475F0(v23, (uint64_t)&v36, &qword_26A980108);
  if (v37)
  {
    sub_262952320(&v36, (uint64_t)v38);
    __swift_project_boxed_opaque_existential_1(v38, v38[3]);
    uint64_t v24 = sub_26294CEF4();
    unint64_t v26 = v25;
    uint64_t v27 = (void *)sub_26297BF40();
    sub_26295205C(v24, v26);
    objc_msgSend(v13, sel_setHTTPBody_, v27);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
  else
  {
    sub_262947654((uint64_t)&v36, &qword_26A980108);
  }
  uint64_t v28 = (void *)sub_26297CA50();
  uint64_t v29 = (void *)sub_26297CA50();
  objc_msgSend(v13, sel_setValue_forHTTPHeaderField_, v28, v29);

  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25820]), sel_init);
  id v31 = objc_msgSend(v30, sel_udid);

  char v32 = (void *)sub_26297CA50();
  objc_msgSend(v13, sel_setValue_forHTTPHeaderField_, v31, v32);

  swift_bridgeObjectRetain();
  long long v33 = (void *)sub_26297CA50();
  swift_bridgeObjectRelease();
  long long v34 = (void *)sub_26297CA50();
  objc_msgSend(v13, sel_setValue_forHTTPHeaderField_, v33, v34);

  sub_26297BDE0();
}

uint64_t sub_26294CEF4()
{
  sub_26297BE70();
  swift_allocObject();
  sub_26297BE60();
  uint64_t v0 = sub_26297BE50();
  swift_release();
  return v0;
}

void sub_26294CF88()
{
}

uint64_t sub_26294CFCC(void *a1, uint64_t a2)
{
  return sub_26294EDD0(a1, a2, (uint64_t (*)(void, void))sub_262951750);
}

id sub_26294CFE4()
{
  return sub_26294EE30((uint64_t (*)(void, void, void))type metadata accessor for MSRequest);
}

uint64_t sub_26294CFFC(uint64_t a1)
{
  sub_262947654(a1 + qword_26A97FEE8, &qword_26A980108);
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for MSRequest()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_26294D09C()
{
  uint64_t result = type metadata accessor for MSResult();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_26294D130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC0);
  MEMORY[0x270FA5388](v8 - 8);
  v32[6] = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_26297BF30();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v33);
  v32[4] = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v32[1] = (char *)v32 - v13;
  uint64_t v44 = *(void *)(v4 + 80);
  uint64_t v36 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_26297C000();
  uint64_t v16 = *(void *)(v45 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v45);
  char v35 = (char *)v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v32[0] = (char *)v32 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v32[3] = (char *)v32 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v32 - v23;
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v41 = a2;
  *(void *)&long long v42 = a3;
  uint64_t v25 = __swift_project_value_buffer(v45, (uint64_t)qword_26A983738);
  unint64_t v26 = *(void (**)(void))(v16 + 16);
  uint64_t v38 = v25;
  objc_super v39 = v26;
  uint64_t v40 = v16 + 16;
  v26(v24);
  uint64_t v27 = sub_26297BFE0();
  os_log_type_t v28 = sub_26297CB90();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_262940000, v27, v28, "Parsing response", v29, 2u);
    MEMORY[0x263E58CD0](v29, -1, -1);
  }

  id v30 = *(void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v37 = v16 + 8;
  v30(v24, v45);
  sub_26297BE40();
  swift_allocObject();
  sub_26297BE30();
  sub_26297BE20();
  swift_release();
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(a4, v15, v44);
  type metadata accessor for MSResult();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_26294E138(uint64_t a1)
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(sub_26294E7B0(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B10);
    uint64_t v6 = sub_26297CD60();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE80];
  }
  v22[0] = v6;
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_262950A5C(v7, 1, v22);
  swift_bridgeObjectRelease();
  sub_262950E30(v22[0]);
  swift_release();
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  swift_retain();
  uint64_t v9 = sub_26297BFE0();
  os_log_type_t v10 = sub_26297CB70();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v20 = v2;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v3;
    uint64_t v13 = v12;
    v22[0] = v12;
    *(_DWORD *)uint64_t v11 = 136380675;
    uint64_t v18 = v11 + 4;
    swift_retain();
    uint64_t v14 = sub_26297CA30();
    unint64_t v16 = v15;
    swift_release();
    uint64_t v21 = sub_26296B1B8(v14, v16, v22);
    sub_26297CC40();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_262940000, v9, v10, "Response headers: %{private}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v13, -1, -1);
    MEMORY[0x263E58CD0](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v5, v20);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_26294E480()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_26297CAD0();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_26297CAD0();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_26297CDE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_26297CAD0();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_26297CAD0();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_26294E5E8(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sub_26297BF50();
  unint64_t v11 = v10;

  sub_262951890(v7, v9, v11, a5);
  uint64_t v13 = v12;
  sub_26295205C(v9, v11);

  return v13;
}

uint64_t sub_26294E67C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sub_26297BF50();
  unint64_t v9 = v8;

  sub_262951A78(v5, v7, v9);
  uint64_t v11 = v10;
  sub_26295205C(v7, v9);

  return v11;
}

uint64_t sub_26294E6FC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_26297BF50();
  unint64_t v12 = v11;

  uint64_t v13 = sub_26297CA60();
  uint64_t v15 = v14;

  sub_262951C54(v7, v10, v12, v13, v15);
  uint64_t v17 = v16;
  sub_26295205C(v10, v12);

  return v17;
}

uint64_t sub_26294E7B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v33 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & v2;
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  id v9 = (void *)MEMORY[0x263F8EE78];
  if (v5) {
    goto LABEL_31;
  }
LABEL_6:
  int64_t v10 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v10 < v6)
    {
      unint64_t v11 = *(void *)(v33 + 8 * v10);
      ++v8;
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 1;
      if (v10 + 1 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 2;
      if (v10 + 2 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 3;
      if (v10 + 3 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11)
      {
LABEL_21:
        unint64_t v5 = (v11 - 1) & v11;
        for (unint64_t i = __clz(__rbit64(v11)) + (v8 << 6); ; unint64_t i = v19 | (v8 << 6))
        {
          sub_262952284(*(void *)(a1 + 48) + 40 * i, (uint64_t)v30);
          sub_262952218(*(void *)(a1 + 56) + 32 * i, (uint64_t)v31 + 8);
          v28[0] = v31[0];
          v28[1] = v31[1];
          uint64_t v29 = v32;
          v27[0] = v30[0];
          v27[1] = v30[1];
          sub_262952284((uint64_t)v27, (uint64_t)&v20);
          if (swift_dynamicCast())
          {
            long long v24 = v23;
            sub_262952218((uint64_t)v28 + 8, (uint64_t)&v25);
          }
          else
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
          }
          sub_262947654((uint64_t)v27, &qword_26A9800E8);
          if (*((void *)&v24 + 1))
          {
            long long v20 = v24;
            long long v21 = v25;
            long long v22 = v26;
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)sub_262950934(0, v9[2] + 1, 1, v9);
              id v9 = (void *)result;
            }
            unint64_t v15 = v9[2];
            unint64_t v14 = v9[3];
            if (v15 >= v14 >> 1)
            {
              uint64_t result = (uint64_t)sub_262950934((void *)(v14 > 1), v15 + 1, 1, v9);
              id v9 = (void *)result;
            }
            void v9[2] = v15 + 1;
            uint64_t v16 = &v9[6 * v15];
            long long v17 = v20;
            long long v18 = v22;
            v16[3] = v21;
            v16[4] = v18;
            v16[2] = v17;
            if (!v5) {
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t result = sub_262947654((uint64_t)&v24, &qword_26A9800F0);
            if (!v5) {
              goto LABEL_6;
            }
          }
LABEL_31:
          unint64_t v19 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      int64_t v12 = v10 + 4;
      if (v12 < v6)
      {
        unint64_t v11 = *(void *)(v33 + 8 * v12);
        if (v11)
        {
          int64_t v8 = v12;
          goto LABEL_21;
        }
        while (1)
        {
          int64_t v8 = v12 + 1;
          if (__OFADD__(v12, 1)) {
            goto LABEL_34;
          }
          if (v8 >= v6) {
            break;
          }
          unint64_t v11 = *(void *)(v33 + 8 * v8);
          ++v12;
          if (v11) {
            goto LABEL_21;
          }
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_26294EA94(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  v37[0] = *a1;
  v37[1] = v2;
  sub_262952218(a2, (uint64_t)v38);
  v35[0] = v37[0];
  v35[1] = v2;
  sub_262952218((uint64_t)v38, (uint64_t)&v36);
  uint64_t v3 = sub_26297CA80();
  uint64_t v5 = v4;
  if (v3 == sub_26297CA80() && v5 == v6)
  {
    swift_bridgeObjectRetain_n();
    goto LABEL_8;
  }
  char v8 = sub_26297CDE0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = sub_26297CA80();
    uint64_t v13 = v12;
    if (v11 != sub_26297CA80() || v13 != v14)
    {
      char v15 = sub_26297CDE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_6;
      }
      uint64_t v16 = sub_26297CA80();
      uint64_t v18 = v17;
      if (v16 != sub_26297CA80() || v18 != v19)
      {
        char v20 = sub_26297CDE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_6;
        }
        uint64_t v21 = sub_26297CA80();
        uint64_t v23 = v22;
        if (v21 != sub_26297CA80() || v23 != v24)
        {
          char v25 = sub_26297CDE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v25) {
            goto LABEL_6;
          }
          uint64_t v26 = sub_26297CA80();
          uint64_t v28 = v27;
          if (v26 != sub_26297CA80() || v28 != v29)
          {
            char v30 = sub_26297CDE0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v30) {
              goto LABEL_6;
            }
            uint64_t v31 = sub_26297CA80();
            uint64_t v33 = v32;
            if (v31 != sub_26297CA80() || v33 != v34)
            {
              char v9 = sub_26297CDE0();
              goto LABEL_9;
            }
          }
        }
      }
    }
LABEL_8:
    char v9 = 1;
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_6:
  char v9 = 1;
LABEL_10:
  sub_262947654((uint64_t)v37, &qword_26A9800D0);
  sub_262947654((uint64_t)v35, &qword_26A9800D0);
  return v9 & 1;
}

uint64_t sub_26294EDB8(void *a1, uint64_t a2)
{
  return sub_26294EDD0(a1, a2, (uint64_t (*)(void, void))sub_262951E4C);
}

uint64_t sub_26294EDD0(void *a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  return a3(*(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x50), *(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x58));
}

id sub_26294EE18()
{
  return sub_26294EE30((uint64_t (*)(void, void, void))type metadata accessor for MSAPIResponse);
}

id sub_26294EE30(uint64_t (*a1)(void, void, void))
{
  uint64_t v2 = (objc_class *)a1(0, *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50), *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_26294EEAC(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x60);
  uint64_t v2 = type metadata accessor for MSResult();
  uint64_t v3 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t type metadata accessor for MSAPIResponse()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for MSResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t initializeWithCopy for MSError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MSError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
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

uint64_t assignWithTake for MSError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for MSError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MSError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MSError()
{
  return &type metadata for MSError;
}

uint64_t sub_26294F160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_26294F168()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_26294F1FC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x29uLL) {
    uint64_t v5 = 41;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *a2;
    *(void *)uint64_t v3 = *a2;
    uint64_t v3 = v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8);
    swift_retain();
  }
  else
  {
    unsigned int v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2) {
      unsigned int v9 = *(_DWORD *)a2 + 2;
    }
    if (v9 == 1)
    {
      uint64_t v10 = a2[1];
      *(void *)uint64_t v3 = *a2;
      *(void *)(v3 + 8) = v10;
      *(void *)(v3 + 16) = a2[2];
      *(unsigned char *)(v3 + 24) = *((unsigned char *)a2 + 24);
      *(void *)(v3 + 32) = a2[4];
      *(unsigned char *)(v3 + 40) = *((unsigned char *)a2 + 40);
      *(unsigned char *)(v3 + v5) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(uint64_t))(v4 + 16))(a1);
      *(unsigned char *)(v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_26294F320(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x29) {
    unint64_t v2 = 41;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return swift_bridgeObjectRelease();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

uint64_t sub_26294F420(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x29uLL) {
    uint64_t v4 = 41;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    uint64_t v10 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v10;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(unsigned char *)(a1 + 24) = a2[24];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(unsigned char *)(a1 + 40) = a2[40];
    swift_bridgeObjectRetain();
    char v11 = 1;
  }
  else
  {
    (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v11 = 0;
  }
  *(unsigned char *)(a1 + v4) = v11;
  return a1;
}

unsigned __int8 *sub_26294F57C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x29uLL) {
      uint64_t v7 = 41;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = *((void *)a2 + 1);
      uint64_t v18 = *((void *)a2 + 2);
      a1[24] = a2[24];
      *((void *)a1 + 2) = v18;
      uint64_t v19 = *((void *)a2 + 4);
      a1[40] = a2[40];
      *((void *)a1 + 4) = v19;
      a1[v7] = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

_OWORD *sub_26294F7C0(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x29uLL) {
    uint64_t v4 = 41;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    long long v10 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v10;
    *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)(a2 + 25);
    char v11 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v11 = 0;
  }
  *((unsigned char *)a1 + v4) = v11;
  return a1;
}

unsigned __int8 *sub_26294F900(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x29uLL) {
      uint64_t v7 = 41;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      long long v18 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v18;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
      char v19 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v19 = 0;
    }
    a1[v7] = v19;
  }
  return a1;
}

uint64_t sub_26294FB20(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 41;
  if (*(void *)(v3 + 64) > 0x29uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_26294FC54(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x29) {
    unint64_t v5 = 41;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x26294FE1CLL);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_26294FE44(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 41;
  if (*(void *)(v2 + 64) > 0x29uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_26294FEFC(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x29uLL) {
    size_t v4 = 41;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_26294FFD4()
{
  return sub_262950440();
}

uint64_t sub_26294FFF0()
{
  return sub_26297CAA0();
}

uint64_t sub_26295000C()
{
  return sub_2629504C8();
}

uint64_t sub_262950028@<X0>(BOOL *a1@<X8>)
{
  return sub_262950520(a1);
}

void sub_262950034(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x800000026297FE70;
}

unint64_t sub_262950054()
{
  return 0xD000000000000019;
}

uint64_t sub_262950070@<X0>(BOOL *a1@<X8>)
{
  return sub_2629505B8(a1);
}

uint64_t sub_26295007C(uint64_t a1)
{
  unint64_t v2 = sub_262952008();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2629500B8(uint64_t a1)
{
  unint64_t v2 = sub_262952008();
  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_2629500F4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_262951E7C(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_262950138(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980098);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262952008();
  sub_26297CE90();
  sub_26297CDC0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_262950270()
{
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v2 = sub_26297BEC0();
  uint64_t v4 = v3;

  uint64_t result = swift_bridgeObjectRelease();
  qword_26A9836F0 = v2;
  *(void *)algn_26A9836F8 = v4;
  qword_26A983700 = 0;
  byte_26A983708 = 1;
  qword_26A983710 = 0;
  byte_26A983718 = 1;
  return result;
}

uint64_t sub_262950380()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_2629503D0()
{
  unint64_t result = qword_26A980080;
  if (!qword_26A980080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980080);
  }
  return result;
}

uint64_t sub_262950424()
{
  return sub_262950440();
}

uint64_t sub_262950440()
{
  return sub_26297CE70();
}

uint64_t sub_262950490()
{
  return sub_26297CAA0();
}

uint64_t sub_2629504AC()
{
  return sub_2629504C8();
}

uint64_t sub_2629504C8()
{
  return sub_26297CE70();
}

uint64_t sub_262950514@<X0>(BOOL *a1@<X8>)
{
  return sub_262950520(a1);
}

uint64_t sub_262950520@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_26297CD80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_262950570(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000026297FE90;
}

unint64_t sub_262950590()
{
  return 0xD000000000000010;
}

uint64_t sub_2629505AC@<X0>(BOOL *a1@<X8>)
{
  return sub_2629505B8(a1);
}

uint64_t sub_2629505B8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_26297CD80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_26295060C(uint64_t a1)
{
  unint64_t v2 = sub_2629524E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_262950648(uint64_t a1)
{
  unint64_t v2 = sub_2629524E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_262950684@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980130);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unsigned int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2629524E8();
  sub_26297CE80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v9 = sub_26297CD90();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t sub_2629507FC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980140);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2629524E8();
  sub_26297CE90();
  sub_26297CDC0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *sub_262950934(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800F8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      int v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      int v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_262951780(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_262950A5C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  sub_2629475F0(a1 + 32, (uint64_t)&v44, &qword_26A9800D8);
  uint64_t v7 = v44;
  uint64_t v8 = v45;
  uint64_t v42 = v44;
  uint64_t v43 = v45;
  sub_262952274(v46, v41);
  uint64_t v9 = (void *)*a3;
  unint64_t v11 = sub_26295FA90(v7, v8);
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
      sub_26295E72C();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    char v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    uint64_t v21 = (uint64_t *)(v20[6] + 16 * v11);
    *uint64_t v21 = v7;
    v21[1] = v8;
    sub_262952274(v41, (_OWORD *)(v20[7] + 32 * v11));
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    uint64_t v25 = v4 - 1;
    if (!v25)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v26 = a1 + 80;
    while (1)
    {
      sub_2629475F0(v26, (uint64_t)&v44, &qword_26A9800D8);
      uint64_t v27 = v44;
      uint64_t v28 = v45;
      uint64_t v42 = v44;
      uint64_t v43 = v45;
      sub_262952274(v46, v41);
      uint64_t v29 = (void *)*a3;
      unint64_t v30 = sub_26295FA90(v27, v28);
      uint64_t v32 = v29[2];
      BOOL v33 = (v31 & 1) == 0;
      BOOL v23 = __OFADD__(v32, v33);
      uint64_t v34 = v32 + v33;
      if (v23) {
        break;
      }
      char v35 = v31;
      if (v29[3] < v34)
      {
        sub_26295E108(v34, 1);
        unint64_t v30 = sub_26295FA90(v27, v28);
        if ((v35 & 1) != (v36 & 1)) {
          goto LABEL_25;
        }
      }
      if (v35) {
        goto LABEL_10;
      }
      uint64_t v37 = (void *)*a3;
      *(void *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      uint64_t v38 = (uint64_t *)(v37[6] + 16 * v30);
      *uint64_t v38 = v27;
      v38[1] = v28;
      sub_262952274(v41, (_OWORD *)(v37[7] + 32 * v30));
      uint64_t v39 = v37[2];
      BOOL v23 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v23) {
        goto LABEL_24;
      }
      void v37[2] = v40;
      v26 += 48;
      if (!--v25) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_26295E108(v14, a2 & 1);
  unint64_t v16 = sub_26295FA90(v7, v8);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    long long v18 = (void *)swift_allocError();
    swift_willThrow();
    id v47 = v18;
    id v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800E0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_26297CDF0();
  __break(1u);
LABEL_26:
  sub_26297CCC0();
  sub_26297CAC0();
  sub_26297CD00();
  sub_26297CAC0();
  sub_26297CD20();
  __break(1u);
}

unint64_t *sub_262950E30(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    unint64_t v6 = sub_262950F88((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_262950F88((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x263E58CD0](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_262950F88(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = result;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_17:
    uint64_t v17 = *(void *)(a3 + 56);
    long long v18 = (void *)(*(void *)(a3 + 48) + 16 * v13);
    uint64_t v19 = v18[1];
    v23[0] = *v18;
    v23[1] = v19;
    sub_262952218(v17 + 32 * v13, (uint64_t)v22);
    swift_bridgeObjectRetain();
    char v20 = sub_26294EA94(v23, (uint64_t)v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
    if (v3) {
      return result;
    }
    if (v20)
    {
      *(unint64_t *)((char *)v24 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      BOOL v14 = __OFADD__(v5++, 1);
      if (v14) {
        goto LABEL_30;
      }
    }
  }
  BOOL v14 = __OFADD__(v6++, 1);
  if (v14)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v6 >= v11) {
    return (unint64_t *)sub_262951160(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_16:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_17;
  }
  int64_t v16 = v6 + 1;
  if (v6 + 1 >= v11) {
    return (unint64_t *)sub_262951160(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v6 + 2;
  if (v6 + 2 >= v11) {
    return (unint64_t *)sub_262951160(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v6 + 3;
  if (v6 + 3 >= v11) {
    return (unint64_t *)sub_262951160(v24, a2, v5, a3);
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
LABEL_15:
    int64_t v6 = v16;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      return (unint64_t *)sub_262951160(v24, a2, v5, a3);
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_262951160(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B10);
  uint64_t result = sub_26297CD60();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v30) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v30) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v30) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v30) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v30) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_262952218(*(void *)(v4 + 56) + 32 * v13, (uint64_t)v33);
    sub_262952274(v33, v32);
    sub_26297CE50();
    swift_bridgeObjectRetain();
    sub_26297CAA0();
    uint64_t result = sub_26297CE70();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    void *v28 = v19;
    v28[1] = v18;
    uint64_t result = (uint64_t)sub_262952274(v32, (_OWORD *)(*(void *)(v8 + 56) + 32 * v23));
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_262951424(uint64_t a1)
{
  if (a1 > -3001)
  {
    switch(a1)
    {
      case -1003:
        uint64_t result = 7;
        break;
      case -1002:
        uint64_t result = 6;
        break;
      case -1001:
        uint64_t result = 5;
        break;
      case -1000:
        uint64_t result = 3;
        break;
      default:
        if (a1 == -2000)
        {
          uint64_t result = 0;
        }
        else
        {
          if (a1 != -3000) {
            return 16;
          }
          uint64_t result = 2;
        }
        break;
    }
  }
  else if (a1 > -21123)
  {
    uint64_t v2 = a1 + 9008;
    uint64_t result = 1;
    switch(v2)
    {
      case 0:
        uint64_t result = 15;
        break;
      case 1:
        uint64_t result = 9;
        break;
      case 6:
        uint64_t result = 8;
        break;
      case 7:
        return result;
      case 8:
        uint64_t result = 4;
        break;
      default:
        return 16;
    }
  }
  else
  {
    switch(a1)
    {
      case -300009:
        return 14;
      case -23629:
        return 12;
      case -22411:
        return 11;
      default:
        return 16;
    }
  }
  return result;
}

uint64_t sub_26295159C(uint64_t a1)
{
  char v1 = sub_262951424(a1);
  uint64_t result = 48;
  switch(v1)
  {
    case 1:
      uint64_t result = 12337;
      break;
    case 2:
      uint64_t result = 12593;
      break;
    case 3:
      uint64_t result = 13105;
      break;
    case 4:
      uint64_t result = 13873;
      break;
    case 5:
      uint64_t result = 14129;
      break;
    case 6:
      uint64_t result = 14385;
      break;
    case 7:
      uint64_t result = 14641;
      break;
    case 8:
      uint64_t result = 12338;
      break;
    case 9:
      uint64_t result = 12594;
      break;
    case 10:
      uint64_t result = 12850;
      break;
    case 11:
      uint64_t result = 13106;
      break;
    case 12:
      uint64_t result = 13362;
      break;
    case 13:
      uint64_t result = 13618;
      break;
    case 14:
      uint64_t result = 13874;
      break;
    case 15:
      uint64_t result = 14130;
      break;
    case 16:
      uint64_t result = 12589;
      break;
    default:
      return result;
  }
  return result;
}

void sub_262951720()
{
}

void sub_262951750()
{
}

uint64_t sub_262951780(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800D8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_26297CD70();
  __break(1u);
  return result;
}

void sub_262951890(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v5 = v4;
  int v19 = a4;
  v18[1] = swift_getObjectType();
  v18[2] = *(void *)((*MEMORY[0x263F8EED0] & *v5) + 0x50);
  uint64_t v9 = type metadata accessor for MSResult();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v18 - v11;
  unint64_t v13 = v5;
  sub_26294D130((uint64_t)a1, a2, a3, (uint64_t)v12);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v13[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v13) + 0x60)], v12, v9);

  id v14 = a1;
  unint64_t v15 = (void *)sub_26297BF40();
  uint64_t v16 = (objc_class *)type metadata accessor for MSAPIResponse();
  v20.receiver = v13;
  v20.super_class = v16;
  id v17 = objc_msgSendSuper2(&v20, sel_initWithHTTPResponse_data_bodyIsPlist_, v14, v15, v19 & 1);

  if (!v17) {
    __break(1u);
  }
}

void sub_262951A78(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v18 = *(void *)((*MEMORY[0x263F8EED0] & *v4) + 0x50);
  uint64_t v8 = type metadata accessor for MSResult();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&ObjectType - v10;
  unint64_t v12 = v4;
  sub_26294D130((uint64_t)a1, a2, a3, (uint64_t)v11);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v12[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v12) + 0x60)], v11, v8);

  id v13 = a1;
  id v14 = (void *)sub_26297BF40();
  unint64_t v15 = (objc_class *)type metadata accessor for MSAPIResponse();
  v19.receiver = v12;
  v19.super_class = v15;
  id v16 = objc_msgSendSuper2(&v19, sel_initWithHTTPResponse_data_, v13, v14, ObjectType, v18);

  if (!v16) {
    __break(1u);
  }
}

void sub_262951C54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v19[2] = a4;
  v19[3] = a5;
  swift_getObjectType();
  v19[1] = *(void *)((*MEMORY[0x263F8EED0] & *v5) + 0x50);
  uint64_t v9 = type metadata accessor for MSResult();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v19 - v11;
  id v13 = v5;
  sub_26294D130((uint64_t)a1, a2, a3, (uint64_t)v12);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v13[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v13) + 0x60)], v12, v9);

  id v14 = a1;
  unint64_t v15 = (void *)sub_26297BF40();
  id v16 = (void *)sub_26297CA50();
  swift_bridgeObjectRelease();
  id v17 = (objc_class *)type metadata accessor for MSAPIResponse();
  v20.receiver = v13;
  v20.super_class = v17;
  id v18 = objc_msgSendSuper2(&v20, sel_initWithHTTPResponse_data_mediaType_, v14, v15, v16);

  if (!v18) {
    __break(1u);
  }
}

void sub_262951E4C()
{
}

uint64_t sub_262951E7C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980088);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262952008();
  sub_26297CE80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v9 = sub_26297CD90();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = 0;
  *(unsigned char *)(a2 + 24) = 1;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  return result;
}

unint64_t sub_262952008()
{
  unint64_t result = qword_26A980090;
  if (!qword_26A980090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980090);
  }
  return result;
}

uint64_t sub_26295205C(uint64_t a1, unint64_t a2)
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

unint64_t sub_2629520B4()
{
  unint64_t result = qword_26A9800A0;
  if (!qword_26A9800A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9800A0);
  }
  return result;
}

unint64_t sub_262952108()
{
  unint64_t result = qword_26A9800B8;
  if (!qword_26A9800B8)
  {
    sub_2629522E4(255, &qword_26A9800B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9800B8);
  }
  return result;
}

unint64_t sub_262952170()
{
  unint64_t result = qword_26A9800C0;
  if (!qword_26A9800C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9800C0);
  }
  return result;
}

unint64_t sub_2629521C4()
{
  unint64_t result = qword_26A9800C8;
  if (!qword_26A9800C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9800C8);
  }
  return result;
}

uint64_t sub_262952218(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_262952274(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_262952284(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2629522E4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_262952320(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_262952338(uint64_t a1)
{
  return a1;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

ValueMetadata *type metadata accessor for LegacyMSError()
{
  return &type metadata for LegacyMSError;
}

ValueMetadata *type metadata accessor for MSError.CodingKeys()
{
  return &type metadata for MSError.CodingKeys;
}

unint64_t sub_2629523E4()
{
  unint64_t result = qword_26A980118;
  if (!qword_26A980118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980118);
  }
  return result;
}

unint64_t sub_26295243C()
{
  unint64_t result = qword_26A980120;
  if (!qword_26A980120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980120);
  }
  return result;
}

unint64_t sub_262952494()
{
  unint64_t result = qword_26A980128;
  if (!qword_26A980128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980128);
  }
  return result;
}

unint64_t sub_2629524E8()
{
  unint64_t result = qword_26A980138;
  if (!qword_26A980138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980138);
  }
  return result;
}

unsigned char *_s19iCloudMailAccountUI7MSErrorV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2629525D8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyMSError.CodingKeys()
{
  return &type metadata for LegacyMSError.CodingKeys;
}

unint64_t sub_262952614()
{
  unint64_t result = qword_26A980148;
  if (!qword_26A980148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980148);
  }
  return result;
}

unint64_t sub_26295266C()
{
  unint64_t result = qword_26A980150;
  if (!qword_26A980150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980150);
  }
  return result;
}

unint64_t sub_2629526C4()
{
  unint64_t result = qword_26A980158;
  if (!qword_26A980158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980158);
  }
  return result;
}

uint64_t sub_26295271C()
{
  if (qword_26A97FAD0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A9836E8;
  id v1 = (id)qword_26A9836E8;
  return v0;
}

unint64_t sub_262952794()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FB08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
  *(void *)(inited + 32) = 4804673;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(void *)(inited + 48) = sub_26297CA50();
  *(void *)(inited + 56) = 0x6874654D70747468;
  *(void *)(inited + 64) = 0xEA0000000000646FLL;
  *(void *)(inited + 72) = sub_26297CA50();
  return sub_26297305C(inited);
}

id sub_262952830()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmailSuggestionsAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmailSuggestionsAPIRequest()
{
  uint64_t result = qword_26A980160;
  if (!qword_26A980160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2629528B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980180);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262953180();
  sub_26297CE90();
  char v14 = 0;
  sub_26297CDC0();
  if (!v5)
  {
    char v13 = 1;
    sub_26297CDC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_262952A28(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9801B0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26295337C();
  sub_26297CE90();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980198);
  sub_262953424(&qword_26A9801B8, (void (*)(void))sub_262953494);
  sub_26297CDD0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_262952BA8()
{
  return type metadata accessor for EmailSuggestionsAPIRequest();
}

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse.EmailSuggestion()
{
  return &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion;
}

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse()
{
  return &type metadata for EmailSuggestionsAPIResponse;
}

uint64_t sub_262952BD0()
{
  if (*v0) {
    return 1701667182;
  }
  else {
    return 0x496E726574746170;
  }
}

uint64_t sub_262952C08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_262952E88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_262952C30(uint64_t a1)
{
  unint64_t v2 = sub_262953180();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_262952C6C(uint64_t a1)
{
  unint64_t v2 = sub_262953180();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_262952CA8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_262952F78(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_262952CD8(void *a1)
{
  return sub_2629528B4(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_262952CF8()
{
  return 0x6974736567677573;
}

uint64_t sub_262952D18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_26297CDE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_262952DC8(uint64_t a1)
{
  unint64_t v2 = sub_26295337C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_262952E04(uint64_t a1)
{
  unint64_t v2 = sub_26295337C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_262952E40@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_2629531D4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_262952E6C(void *a1)
{
  return sub_262952A28(a1, *v1);
}

uint64_t sub_262952E88(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x496E726574746170 && a2 == 0xE900000000000064;
  if (v2 || (sub_26297CDE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_26297CDE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_262952F78(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980170);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262953180();
  sub_26297CE80();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_26297CD90();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_26297CD90();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_262953180()
{
  unint64_t result = qword_26A980178;
  if (!qword_26A980178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980178);
  }
  return result;
}

void *sub_2629531D4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980188);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_26295337C();
  sub_26297CE80();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980198);
    sub_262953424(&qword_26A9801A0, (void (*)(void))sub_2629533D0);
    sub_26297CDB0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_26295337C()
{
  unint64_t result = qword_26A980190;
  if (!qword_26A980190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980190);
  }
  return result;
}

unint64_t sub_2629533D0()
{
  unint64_t result = qword_26A9801A8;
  if (!qword_26A9801A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801A8);
  }
  return result;
}

uint64_t sub_262953424(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980198);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_262953494()
{
  unint64_t result = qword_26A9801C0;
  if (!qword_26A9801C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801C0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EmailSuggestionsAPIResponse.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x262953584);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse.CodingKeys()
{
  return &type metadata for EmailSuggestionsAPIResponse.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x262953688);
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

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys()
{
  return &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys;
}

unint64_t sub_2629536C4()
{
  unint64_t result = qword_26A9801C8;
  if (!qword_26A9801C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801C8);
  }
  return result;
}

unint64_t sub_26295371C()
{
  unint64_t result = qword_26A9801D0;
  if (!qword_26A9801D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801D0);
  }
  return result;
}

unint64_t sub_262953774()
{
  unint64_t result = qword_26A9801D8;
  if (!qword_26A9801D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801D8);
  }
  return result;
}

unint64_t sub_2629537CC()
{
  unint64_t result = qword_26A9801E0;
  if (!qword_26A9801E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801E0);
  }
  return result;
}

unint64_t sub_262953824()
{
  unint64_t result = qword_26A9801E8;
  if (!qword_26A9801E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801E8);
  }
  return result;
}

unint64_t sub_26295387C()
{
  unint64_t result = qword_26A9801F0;
  if (!qword_26A9801F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9801F0);
  }
  return result;
}

uint64_t sub_2629538D0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2629538E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2629538F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_26295390C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t sub_262953920(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_262953934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_262953948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t sub_26295395C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  unsigned int v6 = *(void **)(v2 + 24);
  v14[3] = &type metadata for EmailAvailableAPIRequestBody;
  v14[4] = sub_262955008();
  v14[0] = a1;
  v14[1] = a2;
  id v7 = objc_allocWithZone((Class)type metadata accessor for EmailAvailableAPIRequest());
  sub_262954FA0((uint64_t)v14, (uint64_t)v13);
  id v8 = v5;
  id v9 = v6;
  swift_bridgeObjectRetain();
  id v10 = sub_26295EAA0(v5, v9, (uint64_t)v13);

  sub_262947654((uint64_t)v14, &qword_26A980108);
  uint64_t v11 = sub_262955D88();

  return v11;
}

uint64_t sub_262953A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = *(void **)(v4 + 16);
  id v10 = *(void **)(v4 + 24);
  v19[3] = &type metadata for EmailCreateAPIRequestBody;
  void v19[4] = sub_262954F0C();
  uint64_t v11 = (void *)swift_allocObject();
  v19[0] = v11;
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = a4;
  id v12 = objc_allocWithZone((Class)type metadata accessor for EmailCreateAPIRequest());
  sub_262954FA0((uint64_t)v19, (uint64_t)v18);
  id v13 = v9;
  id v14 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = sub_26295EAAC(v9, v14, (uint64_t)v18);

  sub_262947654((uint64_t)v19, &qword_26A980108);
  uint64_t v16 = sub_262956028();

  return v16;
}

uint64_t sub_262953B20()
{
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(v0 + 24), sel_propertiesForDataclass_, *MEMORY[0x263EFACB8]);
  if (result)
  {
    uint64_t v2 = (void *)result;
    uint64_t v3 = sub_26297CA20();

    sub_262954EB8();
    sub_26297CCB0();
    if (*(void *)(v3 + 16) && (unint64_t v4 = sub_26295FB08((uint64_t)v6), (v5 & 1) != 0))
    {
      sub_262952218(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v7);
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_262952338((uint64_t)v6);
    if (*((void *)&v8 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result) {
        return 4;
      }
    }
    else
    {
      sub_262947654((uint64_t)&v7, &qword_26A980110);
      return 0;
    }
  }
  return result;
}

void sub_262953C48(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25D08]), sel_initWithAppleAccount_grandSlamAccount_accountStore_, *(void *)(v2 + 24), 0, *(void *)(v2 + 16));
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    v10[4] = sub_262954E90;
    v10[5] = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_262953D6C;
    v10[3] = &block_descriptor_45;
    long long v8 = _Block_copy(v10);
    id v9 = v6;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_profilePictureForAccountOwnerWithCompletion_, v8);
    _Block_release(v8);
  }
  else
  {
    __break(1u);
  }
}

void sub_262953D6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_262953DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v2 = sub_26297C9A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_26297C9D0();
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_26297C9B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_26297C000();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  id v15 = sub_26297BFE0();
  os_log_type_t v16 = sub_26297CB60();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = v6;
    uint64_t v18 = v3;
    uint64_t v19 = v2;
    objc_super v20 = v17;
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_262940000, v15, v16, "[AccountCreation - Startup] update ACAccount started", v17, 2u);
    unint64_t v21 = v20;
    uint64_t v2 = v19;
    uint64_t v3 = v18;
    uint64_t v6 = v33;
    MEMORY[0x263E58CD0](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  unint64_t v22 = *(void **)(v34 + 24);
  objc_msgSend(v22, sel_setEnabled_forDataclass_, 1, *MEMORY[0x263EFACB8]);
  sub_262947CDC();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F080], v6);
  unint64_t v23 = (void *)sub_26297CC00();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v24 = swift_allocObject();
  swift_weakInit();
  unint64_t v25 = (void *)swift_allocObject();
  v25[2] = v24;
  v25[3] = v22;
  uint64_t v26 = v36;
  v25[4] = v35;
  v25[5] = v26;
  aBlock[4] = sub_262954D08;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = &block_descriptor_0;
  uint64_t v27 = _Block_copy(aBlock);
  swift_retain();
  id v28 = v22;
  swift_retain();
  uint64_t v29 = v37;
  sub_26297C9C0();
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_262954D2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262954D84();
  uint64_t v30 = v39;
  sub_26297CC80();
  MEMORY[0x263E583E0](0, v29, v30, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v30, v2);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v29, v40);
  swift_release();
  return swift_release();
}

void sub_262954328(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v8 = *(id *)(Strong + 16);
    swift_release();
    uint64_t v9 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a2;
    v10[4] = a3;
    v10[5] = a4;
    v13[4] = sub_262954DE4;
    v13[5] = v10;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_262973BB4;
    v13[3] = &block_descriptor_20;
    uint64_t v11 = _Block_copy(v13);
    id v12 = a2;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_aa_updatePropertiesForAppleAccount_completion_, v12, v11);
    _Block_release(v11);
  }
}

void sub_2629544BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v10 = *(id *)(Strong + 16);
    swift_release();
    uint64_t v11 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    id v12 = (void *)swift_allocObject();
    void v12[2] = v11;
    v12[3] = a4;
    v12[4] = a5;
    v12[5] = a6;
    v15[4] = sub_262954E3C;
    v15[5] = v12;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 1107296256;
    v15[2] = sub_262973BB4;
    v15[3] = &block_descriptor_27;
    id v13 = _Block_copy(v15);
    id v14 = a4;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_saveVerifiedAccount_withCompletionHandler_, v14, v13);
    _Block_release(v13);
  }
}

void sub_262954650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9801F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
  *(void *)(inited + 32) = sub_26297CA60();
  *(void *)(inited + 40) = v10;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 56) = sub_26297CA60();
  *(void *)(inited + 64) = v11;
  *(unsigned char *)(inited + 72) = 0;
  unint64_t v12 = sub_2629732B0(inited);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v14 = *(id *)(Strong + 16);
    swift_release();
    sub_262973790(v12);
    swift_bridgeObjectRelease();
    id v15 = (void *)sub_26297CA10();
    swift_bridgeObjectRelease();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a5;
    *(void *)(v16 + 24) = a6;
    aBlock[4] = sub_262954E80;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_262973B3C;
    aBlock[3] = &block_descriptor_33;
    id v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_renewCredentialsForAccount_options_completion_, a4, v15, v17);
    _Block_release(v17);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_26295483C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_26297C9A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_26297C9D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262947CDC();
  id v14 = (void *)sub_26297CBE0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  aBlock[4] = sub_262954E88;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = &block_descriptor_39;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_26297C9C0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_262954D2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262954D84();
  sub_26297CC80();
  MEMORY[0x263E583E0](0, v13, v9, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_262954AC0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_26297BFE0();
  os_log_type_t v8 = sub_26297CB60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_262940000, v7, v8, "[AccountCreation - Startup] update ACAccount successful", v9, 2u);
    MEMORY[0x263E58CD0](v9, -1, -1);
  }

  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return a1(v10);
}

uint64_t sub_262954C68()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for ACRepositoryDefault()
{
  return self;
}

uint64_t sub_262954CCC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_262954D08()
{
  sub_262954328(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
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

unint64_t sub_262954D2C()
{
  unint64_t result = qword_26A980AE0;
  if (!qword_26A980AE0)
  {
    sub_26297C9A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980AE0);
  }
  return result;
}

unint64_t sub_262954D84()
{
  unint64_t result = qword_26A980AF0;
  if (!qword_26A980AF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A97FD60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980AF0);
  }
  return result;
}

void sub_262954DE4(uint64_t a1, uint64_t a2)
{
  sub_2629544BC(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t objectdestroy_12Tm()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_262954E3C(uint64_t a1, uint64_t a2)
{
  sub_262954650(a1, a2, v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_262954E48()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_262954E80(uint64_t a1, uint64_t a2)
{
  return sub_26295483C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_262954E88()
{
  return sub_262954AC0(*(uint64_t (**)(uint64_t))(v0 + 16));
}

uint64_t sub_262954E90()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_262954EB8()
{
  unint64_t result = qword_26A980200;
  if (!qword_26A980200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980200);
  }
  return result;
}

unint64_t sub_262954F0C()
{
  unint64_t result = qword_26A980208;
  if (!qword_26A980208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980208);
  }
  return result;
}

uint64_t sub_262954F60()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_262954FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_262955008()
{
  unint64_t result = qword_26A980210;
  if (!qword_26A980210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980210);
  }
  return result;
}

uint64_t sub_26295508C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v75 = a2;
  long long v76 = a8;
  uint64_t v74 = a7;
  uint64_t v70 = a1;
  uint64_t v71 = a6;
  uint64_t v66 = a4;
  uint64_t v67 = a5;
  int v69 = a3;
  uint64_t v9 = sub_26297C000();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v57 - v14;
  uint64_t v16 = sub_26297BF80();
  uint64_t v72 = *(void *)(v16 - 8);
  uint64_t v73 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  long long v65 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v18;
  MEMORY[0x270FA5388](v17);
  long long v68 = (char *)&v57 - v19;
  sub_26297BF70();
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
  unint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v21(v15, v20, v9);
  unint64_t v22 = v8;
  unint64_t v23 = sub_26297BFE0();
  int v24 = sub_26297CB60();
  BOOL v25 = os_log_type_enabled(v23, (os_log_type_t)v24);
  uint64_t v64 = v9;
  uint64_t v62 = v10;
  long long v61 = v13;
  if (v25)
  {
    int v58 = v24;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    aBlock[0] = v57;
    *(_DWORD *)uint64_t v26 = 136315394;
    char v27 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v22) + 0xD8))();
    unint64_t v28 = 0xE300000000000000;
    uint64_t v29 = 5522759;
    long long v59 = v21;
    uint64_t v60 = v20;
    switch(v27)
    {
      case 1:
        unint64_t v28 = 0xE400000000000000;
        uint64_t v29 = 1414745936;
        break;
      case 2:
        uint64_t v29 = 5526864;
        break;
      case 3:
        unint64_t v28 = 0xE600000000000000;
        uint64_t v29 = 0x4554454C4544;
        break;
      default:
        break;
    }
    uint64_t v77 = sub_26296B1B8(v29, v28, aBlock);
    sub_26297CC40();

    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    id v31 = objc_msgSend(v22, sel_urlString);
    uint64_t v32 = sub_26297CA60();
    unint64_t v34 = v33;

    uint64_t v77 = sub_26296B1B8(v32, v34, aBlock);
    sub_26297CC40();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_262940000, v23, (os_log_type_t)v58, "%s %s", (uint8_t *)v26, 0x16u);
    uint64_t v35 = v57;
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v35, -1, -1);
    MEMORY[0x263E58CD0](v26, -1, -1);

    uint64_t v30 = *(void (**)(char *, uint64_t))(v62 + 8);
    uint64_t v9 = v64;
    v30(v15, v64);
    id v13 = v61;
    uint64_t v20 = v60;
    unint64_t v21 = v59;
  }
  else
  {

    uint64_t v30 = *(void (**)(char *, uint64_t))(v10 + 8);
    v30(v15, v9);
  }
  v21(v13, v20, v9);
  uint64_t v36 = v22;
  uint64_t v37 = sub_26297BFE0();
  os_log_type_t v38 = sub_26297CB60();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v41 = *(void *)((char *)v36 + qword_26A97FEF8);
    unint64_t v42 = *(void *)((char *)v36 + qword_26A97FEF8 + 8);
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_26296B1B8(v41, v42, aBlock);
    sub_26297CC40();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_262940000, v37, v38, "X-Apple-Request-UUID: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v40, -1, -1);
    MEMORY[0x263E58CD0](v39, -1, -1);

    v30(v61, v64);
  }
  else
  {

    v30(v13, v9);
  }
  uint64_t v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v45 = v72;
  uint64_t v44 = v73;
  uint64_t v46 = v65;
  id v47 = v68;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v65, v68, v73);
  unint64_t v48 = (*(unsigned __int8 *)(v45 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  uint64_t v49 = v48 + v63;
  unint64_t v50 = (v48 + v63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v51 = swift_allocObject();
  unint64_t v52 = v50 + v51;
  *(void *)(v51 + 16) = v43;
  (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))(v51 + v48, v46, v44);
  *(unsigned char *)(v51 + v49) = v69 & 1;
  uint64_t v53 = v75;
  *(void *)(v52 + 8) = v70;
  *(void *)(v52 + 16) = v53;
  aBlock[4] = v71;
  aBlock[5] = v51;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_262958DB8;
  aBlock[3] = v74;
  uint64_t v54 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v55 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(v76);
  v78.receiver = v36;
  v78.super_class = v55;
  objc_msgSendSuper2(&v78, sel_performRequestWithHandler_, v54);
  _Block_release(v54);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v47, v44);
}

uint64_t sub_262955848()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980328);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980390);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980398);
  swift_allocObject();
  id v8 = v0;
  v12[1] = (id)sub_26297C050();
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  v12[0] = (id)sub_26297CBE0();
  uint64_t v9 = sub_26297CBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_262947E80(&qword_26A9803A0, &qword_26A980398);
  sub_26295EF80();
  sub_26297C0E0();
  sub_262947654((uint64_t)v3, &qword_26A980328);

  swift_release();
  sub_262947E80(&qword_26A9803A8, &qword_26A980390);
  uint64_t v10 = sub_26297C0B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_262955AE8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980328);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980330);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980338);
  swift_allocObject();
  id v8 = v0;
  v12[1] = (id)sub_26297C050();
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  v12[0] = (id)sub_26297CBE0();
  uint64_t v9 = sub_26297CBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_262947E80(&qword_26A980340, &qword_26A980338);
  sub_26295EF80();
  sub_26297C0E0();
  sub_262947654((uint64_t)v3, &qword_26A980328);

  swift_release();
  sub_262947E80(&qword_26A980350, &qword_26A980330);
  uint64_t v10 = sub_26297C0B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_262955D88()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980328);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980420);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980428);
  swift_allocObject();
  id v8 = v0;
  v12[1] = (id)sub_26297C050();
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  v12[0] = (id)sub_26297CBE0();
  uint64_t v9 = sub_26297CBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_262947E80(&qword_26A980430, &qword_26A980428);
  sub_26295EF80();
  sub_26297C0E0();
  sub_262947654((uint64_t)v3, &qword_26A980328);

  swift_release();
  sub_262947E80(&qword_26A980438, &qword_26A980420);
  uint64_t v10 = sub_26297C0B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_262956028()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980328);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803F0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803F8);
  swift_allocObject();
  id v8 = v0;
  v12[1] = (id)sub_26297C050();
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  v12[0] = (id)sub_26297CBE0();
  uint64_t v9 = sub_26297CBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_262947E80(&qword_26A980400, &qword_26A9803F8);
  sub_26295EF80();
  sub_26297C0E0();
  sub_262947654((uint64_t)v3, &qword_26A980328);

  swift_release();
  sub_262947E80(&qword_26A980408, &qword_26A9803F0);
  uint64_t v10 = sub_26297C0B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

void sub_2629562C8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(void, void, void), uint64_t a8)
{
  int v90 = a6;
  aBlock[25] = *MEMORY[0x263EF8340];
  uint64_t v14 = sub_26297C000();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v92 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v80 - v18;
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x263E58D60](a4 + 16);
  if (v20)
  {
    unint64_t v21 = (void *)v20;
    uint64_t v93 = a1;
    uint64_t v22 = a8;
    if (a2) {
      id v23 = objc_msgSend(a2, sel_statusCode);
    }
    else {
      id v23 = 0;
    }
    uint64_t v84 = a3;
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v14, (uint64_t)qword_26A983738);
    BOOL v25 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v83 = v24;
    long long v82 = v25;
    ((void (*)(char *))v25)(v19);
    uint64_t v26 = v21;
    char v27 = sub_26297BFE0();
    os_log_type_t v28 = sub_26297CB60();
    uint64_t v91 = v14;
    uint64_t v29 = v15;
    os_log_type_t v30 = v28;
    BOOL v31 = os_log_type_enabled(v27, v28);
    uint64_t v89 = a2;
    v86 = a7;
    int v88 = v26;
    uint64_t v87 = v29;
    if (v31)
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v85 = v22;
      uint64_t v80 = v33;
      aBlock[0] = v33;
      *(_DWORD *)uint64_t v32 = 134218242;
      id v81 = v23;
      uint64_t v94 = (uint64_t)v23;
      sub_26297CC40();
      *(_WORD *)(v32 + 12) = 2080;
      uint64_t v35 = *(void *)&v26[qword_26A97FEF8];
      unint64_t v34 = *(void *)&v26[qword_26A97FEF8 + 8];
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_26296B1B8(v35, v34, aBlock);
      a2 = v89;
      sub_26297CC40();

      uint64_t v36 = v93;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_262940000, v27, v30, "[%ld] Response: X-Apple-Request-UUID: %s", (uint8_t *)v32, 0x16u);
      uint64_t v37 = v80;
      swift_arrayDestroy();
      uint64_t v38 = v85;
      MEMORY[0x263E58CD0](v37, -1, -1);
      uint64_t v39 = v32;
      a7 = v86;
      MEMORY[0x263E58CD0](v39, -1, -1);

      uint64_t v40 = *(void (**)(char *, uint64_t))(v87 + 8);
      uint64_t v41 = v19;
      uint64_t v42 = v91;
      v40(v41, v91);
      if (v81 != (id)401) {
        goto LABEL_15;
      }
    }
    else
    {

      uint64_t v40 = *(void (**)(char *, uint64_t))(v29 + 8);
      uint64_t v43 = v19;
      uint64_t v42 = v91;
      v40(v43, v91);
      id v44 = v23;
      uint64_t v38 = v22;
      uint64_t v36 = v93;
      if (v44 != (id)401) {
        goto LABEL_15;
      }
    }
    if (v90)
    {
      v82(v92, v83, v42);
      id v45 = a2;
      id v46 = v36;
      id v47 = v45;
      unint64_t v48 = v46;
      uint64_t v49 = sub_26297BFE0();
      os_log_type_t v50 = sub_26297CB70();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v85 = v38;
        uint64_t v51 = swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        uint64_t v53 = v36;
        uint64_t v54 = (void *)v52;
        *(_DWORD *)uint64_t v51 = 138412546;
        if (v53)
        {
          aBlock[0] = (uint64_t)v48;
          uint64_t v55 = v48;
          a2 = v89;
        }
        else
        {
          aBlock[0] = 0;
        }
        sub_26297CC40();
        *uint64_t v54 = v93;

        *(_WORD *)(v51 + 12) = 2112;
        if (a2)
        {
          aBlock[0] = (uint64_t)v47;
          id v57 = v47;
          a2 = v89;
        }
        else
        {
          aBlock[0] = 0;
        }
        sub_26297CC40();
        v54[1] = a2;

        _os_log_impl(&dword_262940000, v49, v50, "401 response from server for request %@ response %@", (uint8_t *)v51, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A980360);
        swift_arrayDestroy();
        MEMORY[0x263E58CD0](v54, -1, -1);
        MEMORY[0x263E58CD0](v51, -1, -1);
        uint64_t v38 = v85;
      }
      else
      {

        uint64_t v49 = v48;
      }
      int v58 = v47;

      v40(v92, v91);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800F8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
      *(void *)(inited + 32) = sub_26297CA60();
      *(void *)(inited + 40) = v60;
      *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
      *(unsigned char *)(inited + 48) = 1;
      *(void *)(inited + 80) = sub_26297CA60();
      *(void *)(inited + 88) = v61;
      *(void *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802C8);
      *(void *)(inited + 96) = &unk_270DE1540;
      unint64_t v62 = sub_262973178(inited);
      uint64_t v63 = qword_26A97FED8;
      uint64_t v64 = v88;
      long long v65 = *(void **)&v88[qword_26A97FED8];
      if (v65)
      {
        uint64_t v66 = *(void **)&v88[qword_26A97FED8];
      }
      else
      {
        uint64_t v67 = self;
        id v68 = objc_msgSend(v67, sel_defaultStore);
        int v69 = *(void **)&v64[v63];
        *(void *)&v64[v63] = v68;

        id v70 = objc_msgSend(v67, sel_defaultStore);
        if (!v70)
        {
          __break(1u);
          return;
        }
        uint64_t v66 = v70;
        long long v65 = 0;
      }
      uint64_t v71 = *(void **)&v64[qword_26A97FEE0];
      id v72 = v65;
      id v73 = v71;
      sub_2629733C8(v62);
      swift_bridgeObjectRelease();
      long long v56 = (void *)sub_26297CA10();
      swift_bridgeObjectRelease();
      uint64_t v74 = (void *)swift_allocObject();
      v74[2] = v86;
      v74[3] = v38;
      uint64_t v75 = v89;
      v74[4] = v93;
      v74[5] = v75;
      v74[6] = v64;
      aBlock[4] = (uint64_t)sub_26295F19C;
      aBlock[5] = (uint64_t)v74;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_262973B3C;
      aBlock[3] = (uint64_t)&block_descriptor_151;
      long long v76 = _Block_copy(aBlock);
      uint64_t v77 = v64;
      objc_super v78 = v48;
      id v79 = v58;
      swift_retain();
      swift_release();
      objc_msgSend(v66, sel_renewCredentialsForAccount_options_completion_, v73, v56, v76);
      _Block_release(v76);

      goto LABEL_27;
    }
LABEL_15:
    a7(v36, a2, v84);
    long long v56 = v88;
LABEL_27:
  }
}

void sub_262956BA8(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(id, void *, void *), uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  int v119 = a6;
  uint64_t v117 = a5;
  uint64_t v125 = a3;
  uint64_t v133 = *MEMORY[0x263EF8340];
  uint64_t v20 = sub_26297BF80();
  uint64_t v116 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  v122 = (char *)&v108 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_26297C000();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  long long v118 = (char *)&v108 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  char v27 = (char *)&v108 - v26;
  swift_beginAccess();
  uint64_t v28 = MEMORY[0x263E58D60](a4 + 16);
  if (!v28) {
    return;
  }
  uint64_t v29 = (void *)v28;
  if (a2) {
    uint64_t v124 = objc_msgSend(a2, sel_statusCode);
  }
  else {
    uint64_t v124 = 0;
  }
  uint64_t v113 = v20;
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  id v121 = a1;
  __int16 v114 = a7;
  uint64_t v30 = __swift_project_value_buffer(v22, (uint64_t)qword_26A983738);
  BOOL v31 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  uint64_t v109 = v30;
  uint64_t v110 = v23 + 16;
  id v108 = v31;
  ((void (*)(char *))v31)(v27);
  uint64_t v32 = v23;
  uint64_t v33 = v29;
  uint64_t v34 = v22;
  uint64_t v35 = sub_26297BFE0();
  os_log_type_t v36 = sub_26297CB60();
  BOOL v37 = os_log_type_enabled(v35, v36);
  long long v123 = a2;
  uint64_t v120 = v34;
  uint64_t v115 = v32;
  if (v37)
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v111 = swift_slowAlloc();
    aBlock = (char *)v111;
    *(_DWORD *)uint64_t v38 = 134218242;
    uint64_t v126 = (uint64_t)v124;
    uint64_t v112 = a8;
    sub_26297CC40();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v39 = *(void *)((char *)v33 + qword_26A97FEF8);
    unint64_t v40 = *(void *)((char *)v33 + qword_26A97FEF8 + 8);
    swift_bridgeObjectRetain();
    uint64_t v126 = sub_26296B1B8(v39, v40, (uint64_t *)&aBlock);
    a8 = v112;
    sub_26297CC40();

    a2 = v123;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_262940000, v35, v36, "[%ld] Response: X-Apple-Request-UUID: %s", (uint8_t *)v38, 0x16u);
    uint64_t v41 = v111;
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v41, -1, -1);
    MEMORY[0x263E58CD0](v38, -1, -1);

    uint64_t v42 = *(uint64_t (**)(char *, uint64_t))(v115 + 8);
    uint64_t v43 = v27;
    uint64_t v34 = v120;
  }
  else
  {

    uint64_t v42 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
    uint64_t v43 = v27;
  }
  uint64_t v111 = (uint64_t)v42;
  uint64_t v44 = v42(v43, v34);
  id v45 = v125;
  uint64_t v46 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v33) + 0xF0))(v44);
  if (v46)
  {
    uint64_t v47 = v46;
    swift_bridgeObjectRetain();
    sub_26297BF70();
    sub_26297BF60();
    double v49 = v48 * 1000.0;
    if ((~*(void *)&v49 & 0x7FF0000000000000) != 0)
    {
      if (v49 > -9.22337204e18)
      {
        if (v49 < 9.22337204e18)
        {
          uint64_t v50 = sub_26297CB30();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          aBlock = (char *)v47;
          sub_26295E408(v50, 0x79636E6574616CLL, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
          uint64_t v52 = (uint64_t)aBlock;
          swift_bridgeObjectRelease();
          uint64_t v53 = sub_26297CB30();
          char v54 = swift_isUniquelyReferenced_nonNull_native();
          aBlock = (char *)v52;
          uint64_t v55 = v53;
          id v45 = v125;
          sub_26295E408(v55, 0x6F43737574617473, 0xEA00000000006564, v54);
          uint64_t v56 = (uint64_t)aBlock;
          swift_bridgeObjectRelease();
          if (v45)
          {
            uint64_t v126 = (uint64_t)v45;
            id v57 = v45;
            id v58 = v45;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800E0);
            if (swift_dynamicCast())
            {
              uint64_t v59 = v131;
              int v60 = v132;
              swift_bridgeObjectRelease();
              if (v60) {
                uint64_t v61 = -1;
              }
              else {
                uint64_t v61 = v59;
              }
              sub_26295159C(v61);
              uint64_t v62 = sub_26297CA50();
              swift_bridgeObjectRelease();
              char v63 = swift_isUniquelyReferenced_nonNull_native();
              aBlock = (char *)v56;
              uint64_t v64 = v62;
              id v45 = v125;
              sub_26295E408(v64, 0x646F43726F727265, 0xE900000000000065, v63);
              uint64_t v56 = (uint64_t)aBlock;
              swift_bridgeObjectRelease();
            }
          }
          long long v65 = (void *)sub_26297CA50();
          swift_bridgeObjectRelease();
          uint64_t v66 = swift_allocObject();
          *(void *)(v66 + 16) = v56;
          uint64_t v131 = a10;
          uint64_t v132 = (void *)v66;
          aBlock = (char *)MEMORY[0x263EF8330];
          uint64_t v128 = 1107296256;
          uint64_t v129 = sub_26295789C;
          uint64_t v130 = a11;
          uint64_t v67 = _Block_copy(&aBlock);
          swift_release();
          AnalyticsSendEventLazy();
          _Block_release(v67);

          (*(void (**)(char *, uint64_t))(v116 + 8))(v122, v113);
          a2 = v123;
          uint64_t v34 = v120;
          goto LABEL_22;
        }
LABEL_43:
        __break(1u);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_22:
  if (v124 == 401 && (v119 & 1) != 0)
  {
    id v68 = (char *)v33;
    uint64_t v125 = a12;
    int v69 = v118;
    v108(v118, v109, v34);
    id v70 = a2;
    id v71 = v121;
    id v72 = v121;
    id v73 = (char *)v70;
    uint64_t v74 = v72;
    uint64_t v75 = sub_26297BFE0();
    os_log_type_t v76 = sub_26297CB70();
    BOOL v77 = os_log_type_enabled(v75, v76);
    uint64_t v124 = v74;
    if (v77)
    {
      v122 = v73;
      uint64_t v112 = a8;
      uint64_t v78 = swift_slowAlloc();
      id v79 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v78 = 138412546;
      if (v71)
      {
        aBlock = (char *)v74;
        uint64_t v80 = v74;
        a2 = v123;
      }
      else
      {
        aBlock = 0;
      }
      sub_26297CC40();
      *id v79 = v121;

      *(_WORD *)(v78 + 12) = 2112;
      id v81 = v68;
      if (a2)
      {
        id v73 = v122;
        aBlock = v122;
        uint64_t v83 = v122;
        a2 = v123;
        sub_26297CC40();
        long long v82 = (void (*)(char *, uint64_t))v111;
      }
      else
      {
        aBlock = 0;
        sub_26297CC40();
        long long v82 = (void (*)(char *, uint64_t))v111;
        id v73 = v122;
      }
      v79[1] = a2;

      _os_log_impl(&dword_262940000, v75, v76, "401 response from server for request %@ response %@", (uint8_t *)v78, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A980360);
      swift_arrayDestroy();
      MEMORY[0x263E58CD0](v79, -1, -1);
      MEMORY[0x263E58CD0](v78, -1, -1);
      a8 = v112;
      uint64_t v34 = v120;
      int v69 = v118;
    }
    else
    {

      uint64_t v75 = v74;
      id v81 = v68;
      long long v82 = (void (*)(char *, uint64_t))v111;
    }
    uint64_t v84 = v125;

    v82(v69, v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
    *(void *)(inited + 32) = sub_26297CA60();
    *(void *)(inited + 40) = v86;
    *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 80) = sub_26297CA60();
    *(void *)(inited + 88) = v87;
    *(void *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802C8);
    *(void *)(inited + 96) = v84;
    unint64_t v88 = sub_262973178(inited);
    uint64_t v89 = qword_26A97FED8;
    int v90 = *(void **)&v81[qword_26A97FED8];
    if (v90)
    {
      uint64_t v91 = a8;
      uint64_t v92 = v73;
      uint64_t v93 = *(void **)&v81[qword_26A97FED8];
    }
    else
    {
      uint64_t v91 = a8;
      uint64_t v94 = self;
      id v95 = objc_msgSend(v94, sel_defaultStore);
      uint64_t v96 = *(void **)&v81[v89];
      *(void *)&v81[v89] = v95;

      id v97 = objc_msgSend(v94, sel_defaultStore);
      if (!v97)
      {
        __break(1u);
        return;
      }
      uint64_t v93 = v97;
      uint64_t v92 = v73;
      int v90 = 0;
    }
    uint64_t v98 = *(void **)&v81[qword_26A97FEE0];
    id v99 = v90;
    id v100 = v98;
    sub_2629733C8(v88);
    swift_bridgeObjectRelease();
    uint64_t v101 = sub_26297CA10();
    swift_bridgeObjectRelease();
    uint64_t v102 = (void *)swift_allocObject();
    v102[2] = v114;
    v102[3] = v91;
    uint64_t v103 = v123;
    v102[4] = v121;
    v102[5] = v103;
    v102[6] = v81;
    uint64_t v131 = a14;
    uint64_t v132 = v102;
    aBlock = (char *)MEMORY[0x263EF8330];
    uint64_t v128 = 1107296256;
    uint64_t v129 = sub_262973B3C;
    uint64_t v130 = a15;
    uint64_t v104 = _Block_copy(&aBlock);
    uint64_t v105 = v81;
    long long v106 = v124;
    uint64_t v107 = v92;
    swift_retain();
    swift_release();
    objc_msgSend(v93, sel_renewCredentialsForAccount_options_completion_, v100, v101, v104);
    _Block_release(v104);

    uint64_t v33 = (void *)v101;
  }
  else
  {
    v114(v121, a2, v45);
  }
}

id sub_26295789C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_2629522E4(0, &qword_26A9803B8);
    uint64_t v4 = (void *)sub_26297CA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_262957938(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v40 = a6;
  uint64_t v41 = a4;
  uint64_t v42 = a3;
  uint64_t v9 = sub_26297C000();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v39 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v39 - v20;
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v31 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v19, v31, v9);
      uint64_t v32 = sub_26297BFE0();
      os_log_type_t v33 = sub_26297CB50();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_262940000, v32, v33, "auth token renew failed. User rejected.", v34, 2u);
        MEMORY[0x263E58CD0](v34, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
    }
    else if (a1 == 2)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v22 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v21, v22, v9);
      uint64_t v23 = sub_26297BFE0();
      os_log_type_t v24 = sub_26297CB50();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_262940000, v23, v24, "auth token renew failed.", v25, 2u);
        MEMORY[0x263E58CD0](v25, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v21, v9);
    }
    else
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v35 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v35, v9);
      os_log_type_t v36 = sub_26297BFE0();
      os_log_type_t v37 = sub_26297CB50();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_262940000, v36, v37, "auth token renew failed. @unknown result", v38, 2u);
        MEMORY[0x263E58CD0](v38, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    return v42(a5, v40, a2);
  }
  else
  {
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v26, v9);
    char v27 = sub_26297BFE0();
    os_log_type_t v28 = sub_26297CB50();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_262940000, v27, v28, "auth token renewed. Retrying request with server.", v29, 2u);
      MEMORY[0x263E58CD0](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    return sub_26295508C((uint64_t)v42, v41, 0, (uint64_t)&unk_270DE2BE8, (uint64_t)&unk_270DE2C10, (uint64_t)sub_26295F324, (uint64_t)&block_descriptor_186, &qword_26A9803B0);
  }
}

uint64_t sub_262957E58(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v40 = a6;
  uint64_t v41 = a4;
  uint64_t v42 = a3;
  uint64_t v9 = sub_26297C000();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v39 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v39 - v20;
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v31 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v19, v31, v9);
      uint64_t v32 = sub_26297BFE0();
      os_log_type_t v33 = sub_26297CB50();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_262940000, v32, v33, "auth token renew failed. User rejected.", v34, 2u);
        MEMORY[0x263E58CD0](v34, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
    }
    else if (a1 == 2)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v22 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v21, v22, v9);
      uint64_t v23 = sub_26297BFE0();
      os_log_type_t v24 = sub_26297CB50();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_262940000, v23, v24, "auth token renew failed.", v25, 2u);
        MEMORY[0x263E58CD0](v25, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v21, v9);
    }
    else
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v35 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v35, v9);
      os_log_type_t v36 = sub_26297BFE0();
      os_log_type_t v37 = sub_26297CB50();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_262940000, v36, v37, "auth token renew failed. @unknown result", v38, 2u);
        MEMORY[0x263E58CD0](v38, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    return v42(a5, v40, a2);
  }
  else
  {
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v26, v9);
    char v27 = sub_26297BFE0();
    os_log_type_t v28 = sub_26297CB50();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_262940000, v27, v28, "auth token renewed. Retrying request with server.", v29, 2u);
      MEMORY[0x263E58CD0](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    return sub_26295508C((uint64_t)v42, v41, 0, (uint64_t)&unk_270DE2AD0, (uint64_t)&unk_270DE2AF8, (uint64_t)sub_26295F0C4, (uint64_t)&block_descriptor_1, &qword_26A980358);
  }
}

uint64_t sub_262958378(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v40 = a6;
  uint64_t v41 = a4;
  uint64_t v42 = a3;
  uint64_t v9 = sub_26297C000();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v39 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v39 - v20;
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v31 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v19, v31, v9);
      uint64_t v32 = sub_26297BFE0();
      os_log_type_t v33 = sub_26297CB50();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_262940000, v32, v33, "auth token renew failed. User rejected.", v34, 2u);
        MEMORY[0x263E58CD0](v34, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
    }
    else if (a1 == 2)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v22 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v21, v22, v9);
      uint64_t v23 = sub_26297BFE0();
      os_log_type_t v24 = sub_26297CB50();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_262940000, v23, v24, "auth token renew failed.", v25, 2u);
        MEMORY[0x263E58CD0](v25, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v21, v9);
    }
    else
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v35 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v35, v9);
      os_log_type_t v36 = sub_26297BFE0();
      os_log_type_t v37 = sub_26297CB50();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_262940000, v36, v37, "auth token renew failed. @unknown result", v38, 2u);
        MEMORY[0x263E58CD0](v38, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    return v42(a5, v40, a2);
  }
  else
  {
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v26, v9);
    char v27 = sub_26297BFE0();
    os_log_type_t v28 = sub_26297CB50();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_262940000, v27, v28, "auth token renewed. Retrying request with server.", v29, 2u);
      MEMORY[0x263E58CD0](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    return sub_26295508C((uint64_t)v42, v41, 0, (uint64_t)&unk_270DE2EB8, (uint64_t)&unk_270DE2EE0, (uint64_t)sub_26295F714, (uint64_t)&block_descriptor_267, &qword_26A980440);
  }
}

uint64_t sub_262958898(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v40 = a6;
  uint64_t v41 = a4;
  uint64_t v42 = a3;
  uint64_t v9 = sub_26297C000();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v39 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v39 - v20;
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v31 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v19, v31, v9);
      uint64_t v32 = sub_26297BFE0();
      os_log_type_t v33 = sub_26297CB50();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_262940000, v32, v33, "auth token renew failed. User rejected.", v34, 2u);
        MEMORY[0x263E58CD0](v34, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
    }
    else if (a1 == 2)
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v22 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v21, v22, v9);
      uint64_t v23 = sub_26297BFE0();
      os_log_type_t v24 = sub_26297CB50();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_262940000, v23, v24, "auth token renew failed.", v25, 2u);
        MEMORY[0x263E58CD0](v25, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v21, v9);
    }
    else
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v35 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v35, v9);
      os_log_type_t v36 = sub_26297BFE0();
      os_log_type_t v37 = sub_26297CB50();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_262940000, v36, v37, "auth token renew failed. @unknown result", v38, 2u);
        MEMORY[0x263E58CD0](v38, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    return v42(a5, v40, a2);
  }
  else
  {
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v9, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v26, v9);
    char v27 = sub_26297BFE0();
    os_log_type_t v28 = sub_26297CB50();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_262940000, v27, v28, "auth token renewed. Retrying request with server.", v29, 2u);
      MEMORY[0x263E58CD0](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    return sub_26295508C((uint64_t)v42, v41, 0, (uint64_t)&unk_270DE2D50, (uint64_t)&unk_270DE2D78, (uint64_t)sub_26295F4DC, (uint64_t)&block_descriptor_238, &qword_26A980410);
  }
}

void sub_262958DB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(void *, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(a2, a3, a4);
  swift_release();
}

uint64_t sub_262958E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_26295508C((uint64_t)sub_26295F2B8, v4, 1, (uint64_t)&unk_270DE2BE8, (uint64_t)&unk_270DE2C10, (uint64_t)sub_26295F324, (uint64_t)&block_descriptor_186, &qword_26A9803B0);
  return swift_release();
}

uint64_t sub_262958F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_26295508C((uint64_t)sub_26295F020, v4, 1, (uint64_t)&unk_270DE2AD0, (uint64_t)&unk_270DE2AF8, (uint64_t)sub_26295F0C4, (uint64_t)&block_descriptor_1, &qword_26A980358);
  return swift_release();
}

uint64_t sub_262958FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_26295508C((uint64_t)sub_26295F620, v4, 1, (uint64_t)&unk_270DE2EB8, (uint64_t)&unk_270DE2EE0, (uint64_t)sub_26295F714, (uint64_t)&block_descriptor_267, &qword_26A980440);
  return swift_release();
}

uint64_t sub_262959094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_26295508C((uint64_t)sub_26295F4D0, v4, 1, (uint64_t)&unk_270DE2D50, (uint64_t)&unk_270DE2D78, (uint64_t)sub_26295F4DC, (uint64_t)&block_descriptor_238, &qword_26A980410);
  return swift_release();
}

uint64_t sub_262959150(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5, uint64_t *a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a9)(uint64_t, void, void, void, void, void, void))
{
  if (a2 && (__swift_instantiateConcreteTypeFromMangledName(a6), (uint64_t v12 = (void *)swift_dynamicCastClass()) != 0))
  {
    id v13 = (char *)v12 + *(void *)((*MEMORY[0x263F8EED0] & *v12) + 0x60);
    uint64_t v15 = *(void *)v13;
    uint64_t v14 = *((void *)v13 + 1);
    uint64_t v17 = *((void *)v13 + 2);
    uint64_t v16 = *((void *)v13 + 3);
    uint64_t v18 = *((void *)v13 + 4);
    uint64_t v19 = v13[40];
    if (v13[41])
    {
      uint64_t v20 = v13[24] & 1;
      uint64_t v29 = v15;
      *(void *)&long long v30 = v14;
      *((void *)&v30 + 1) = v17;
      *(void *)&long long v31 = v20;
      *((void *)&v31 + 1) = v18;
      LOBYTE(v32) = v19 & 1;
      HIBYTE(v32) = 1;
      a7(v15, v14, v17, v16, v18, v19, 1);
      swift_bridgeObjectRetain();
      a4(&v29);
      swift_bridgeObjectRelease();
      uint64_t v21 = v15;
      uint64_t v22 = v14;
      uint64_t v23 = v17;
      uint64_t v24 = v16;
      uint64_t v25 = v18;
      uint64_t v26 = v19;
      uint64_t v27 = 1;
    }
    else
    {
      uint64_t v29 = *(void *)v13;
      long long v30 = 0u;
      long long v31 = 0u;
      __int16 v32 = 0;
      a7(v15, v14, v17, v16, v18, v19, 0);
      a7(v15, v14, v17, v16, v18, v19, 0);
      swift_bridgeObjectRetain();
      a4(&v29);
      swift_bridgeObjectRelease_n();
      uint64_t v21 = v15;
      uint64_t v22 = v14;
      uint64_t v23 = v17;
      uint64_t v24 = v16;
      uint64_t v25 = v18;
      uint64_t v26 = v19;
      uint64_t v27 = 0;
    }
    return a8(v21, v22, v23, v24, v25, v26, v27);
  }
  else
  {
    if (qword_26A97FAD8 != -1) {
      swift_once();
    }
    uint64_t v29 = qword_26A9836F0;
    long long v30 = xmmword_26A9836F8;
    LOBYTE(v31) = byte_26A983708;
    *((void *)&v31 + 1) = qword_26A983710;
    LOBYTE(v32) = byte_26A983718;
    HIBYTE(v32) = 1;
    swift_bridgeObjectRetain();
    a4(&v29);
    return a9(v29, v30, *((void *)&v30 + 1), v31, *((void *)&v31 + 1), v32, HIBYTE(v32));
  }
}

uint64_t sub_2629593C4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *))
{
  if (!a2
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_26A980448),
        (uint64_t v5 = (void *)swift_dynamicCastClass()) == 0))
  {
    if (qword_26A97FAD8 != -1) {
      swift_once();
    }
    uint64_t v26 = qword_26A9836F0;
    long long v27 = xmmword_26A9836F8;
    LOBYTE(v28) = byte_26A983708;
    *((void *)&v28 + 1) = qword_26A983710;
    LOBYTE(v29) = byte_26A983718;
    HIBYTE(v29) = 1;
    swift_bridgeObjectRetain();
    a4(&v26);
    uint64_t v18 = v26;
    uint64_t v20 = *((void *)&v27 + 1);
    uint64_t v19 = v27;
    uint64_t v22 = *((void *)&v28 + 1);
    uint64_t v21 = v28;
    char v24 = HIBYTE(v29);
    uint64_t v23 = v29;
    return sub_26295F8A0(v18, v19, v20, v21, v22, v23, v24);
  }
  uint64_t v6 = (char *)v5 + *(void *)((*MEMORY[0x263F8EED0] & *v5) + 0x60);
  char v7 = *v6;
  if (v6[41])
  {
    uint64_t v8 = v6[40];
    uint64_t v9 = v6[24] & 1;
    uint64_t v11 = *((void *)v6 + 3);
    uint64_t v10 = *((void *)v6 + 4);
    uint64_t v13 = *((void *)v6 + 1);
    uint64_t v12 = *((void *)v6 + 2);
    uint64_t v14 = *(void *)v6;
    int v17 = *(_DWORD *)(v6 + 1);
    uint64_t v15 = v6 + 1;
    int v16 = v17;
    LOWORD(v17) = *((_WORD *)v15 + 2);
    LOBYTE(v15) = v15[6];
    LOBYTE(v26) = v7;
    HIBYTE(v26) = (_BYTE)v15;
    *(_WORD *)((char *)&v26 + 5) = v17;
    *(_DWORD *)((char *)&v26 + 1) = v16;
    *(void *)&long long v27 = v13;
    *((void *)&v27 + 1) = v12;
    *(void *)&long long v28 = v9;
    *((void *)&v28 + 1) = v10;
    LOBYTE(v29) = v8 & 1;
    HIBYTE(v29) = 1;
    sub_26295F890(v14, v13, v12, v11, v10, v8, 1);
    swift_bridgeObjectRetain();
    a4(&v26);
    swift_bridgeObjectRelease();
    uint64_t v18 = v14;
    uint64_t v19 = v13;
    uint64_t v20 = v12;
    uint64_t v21 = v11;
    uint64_t v22 = v10;
    uint64_t v23 = v8;
    char v24 = 1;
    return sub_26295F8A0(v18, v19, v20, v21, v22, v23, v24);
  }
  uint64_t v26 = v7 & 1;
  long long v27 = 0u;
  long long v28 = 0u;
  __int16 v29 = 0;
  return ((uint64_t (*)(uint64_t *))a4)(&v26);
}

uint64_t sub_2629595C0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *))
{
  if (a2
    && (__swift_instantiateConcreteTypeFromMangledName(&qword_26A980418),
        (uint64_t v5 = (void *)swift_dynamicCastClass()) != 0))
  {
    uint64_t v6 = (char *)v5 + *(void *)((*MEMORY[0x263F8EED0] & *v5) + 0x60);
    uint64_t v8 = *(void *)v6;
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t v9 = *((void *)v6 + 2);
    uint64_t v10 = *((void *)v6 + 4);
    char v11 = v6[40];
    if (v6[41])
    {
      uint64_t v12 = v6[24] & 1;
      uint64_t v14 = v8;
      uint64_t v15 = v7;
      uint64_t v16 = v9;
      uint64_t v17 = v12;
      uint64_t v18 = v10;
      LOBYTE(v19) = v11 & 1;
      HIBYTE(v19) = 1;
      sub_26295F608();
      swift_bridgeObjectRetain();
      a4(&v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = *(void *)v6;
      uint64_t v15 = v7;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v16 = 0;
      __int16 v19 = 0;
      sub_26295F608();
      sub_26295F608();
      swift_bridgeObjectRetain();
      a4(&v14);
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_26A97FAD8 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_26A9836F0;
    uint64_t v15 = *(void *)algn_26A9836F8;
    uint64_t v16 = qword_26A983700;
    LOBYTE(v17) = byte_26A983708;
    uint64_t v18 = qword_26A983710;
    LOBYTE(v19) = byte_26A983718;
    HIBYTE(v19) = 1;
    swift_bridgeObjectRetain();
    a4(&v14);
  }
  return sub_26295F610();
}

uint64_t sub_262959808()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_26295987C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2629598F0()
{
  return sub_262959990();
}

uint64_t sub_262959904()
{
  return sub_262959990();
}

uint64_t sub_262959918()
{
  return sub_262959AC4();
}

uint64_t sub_26295992C()
{
  return sub_262959AC4();
}

uint64_t sub_262959940()
{
  return sub_262959AC4();
}

uint64_t sub_262959954()
{
  return sub_262959AC4();
}

uint64_t sub_262959968()
{
  return sub_262959AC4();
}

uint64_t sub_26295997C()
{
  return sub_262959990();
}

uint64_t sub_262959990()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2629599FC()
{
  return sub_262959AC4();
}

uint64_t sub_262959A10()
{
  return sub_262959AC4();
}

double sub_262959A24@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_262959AB0()
{
  return sub_262959AC4();
}

uint64_t sub_262959AC4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_262959B30()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_26297C090();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_26297C080();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if ((v1 & 1) == 0)
    {
      uint64_t result = sub_26297CAB0();
      if (result >= 3)
      {
        swift_beginAccess();
        uint64_t result = swift_weakLoadStrong();
        if (result)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          return sub_26297C090();
        }
      }
    }
  }
  return result;
}

uint64_t sub_262959CB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v22[0]) = 1;
  swift_retain();
  sub_26297C090();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v22[0]) = 0;
  swift_retain();
  sub_26297C090();
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_26297BFE0();
  os_log_type_t v8 = sub_26297CB60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_262940000, v7, v8, "[AccountCreation - Startup] Fetch suggestions started", v9, 2u);
    MEMORY[0x263E58CD0](v9, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(void *)(v1+ OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository+ 24));
  char v11 = *(void **)(*v10 + 16);
  uint64_t v12 = *(void **)(*v10 + 24);
  uint64_t v13 = (objc_class *)type metadata accessor for EmailSuggestionsAPIRequest();
  memset(v22, 0, sizeof(v22));
  uint64_t v23 = 0;
  id v14 = objc_allocWithZone(v13);
  sub_2629475F0((uint64_t)v22, (uint64_t)v21, &qword_26A980108);
  id v15 = v11;
  id v16 = v12;
  id v17 = sub_26295EAB8(v11, v16, (uint64_t)v21, &qword_26A9803B0);

  sub_262947654((uint64_t)v22, &qword_26A980108);
  uint64_t v18 = sub_262955848();

  *(void *)&v22[0] = v18;
  swift_allocObject();
  swift_weakInit();
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980370);
  sub_262947E80(&qword_26A980378, &qword_26A980370);
  sub_26297C0D0();
  swift_release();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_26297C020();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_26295A090(uint64_t a1)
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&v33 - v7;
  uint64_t v10 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v43 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(unsigned __int8 *)(a1 + 40);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v9)
    {
      uint64_t v37 = v10;
      uint64_t v38 = v11;
      int v39 = v13;
      uint64_t v40 = v12;
      uint64_t v15 = qword_26A97FAE0;
      swift_bridgeObjectRetain();
      if (v15 != -1) {
        swift_once();
      }
      uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
      uint64_t v35 = *(void (**)(char *))(v3 + 16);
      os_log_type_t v36 = (void (*)(char *, uint64_t))v16;
      v35(v8);
      swift_bridgeObjectRetain_n();
      id v17 = sub_26297BFE0();
      os_log_type_t v18 = sub_26297CB70();
      BOOL v19 = os_log_type_enabled(v17, v18);
      uint64_t v41 = v6;
      uint64_t v42 = v3;
      if (v19)
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v50 = v34;
        *(_DWORD *)uint64_t v20 = 136315138;
        os_log_type_t v33 = v20 + 4;
        uint64_t v44 = v37;
        unint64_t v45 = v9;
        uint64_t v46 = v43;
        char v47 = v38 & 1;
        uint64_t v48 = v40;
        char v49 = v39 & 1;
        sub_2629503D0();
        uint64_t v21 = sub_26297CE00();
        uint64_t v44 = sub_26296B1B8(v21, v22, &v50);
        uint64_t v6 = v41;
        sub_26297CC40();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_262940000, v17, v18, "[AccountCreation - Startup] Fetch suggestions failed: %s", v20, 0xCu);
        uint64_t v23 = v34;
        swift_arrayDestroy();
        MEMORY[0x263E58CD0](v23, -1, -1);
        char v24 = v20;
        uint64_t v3 = v42;
        MEMORY[0x263E58CD0](v24, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
      v25(v8, v2);
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v44) = 1;
      swift_retain();
      sub_26297C090();
      ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v35)(v6, v36, v2);
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_26297BFE0();
      os_log_type_t v27 = sub_26297CB70();
      if (os_log_type_enabled(v26, v27))
      {
        long long v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        os_log_type_t v36 = v25;
        uint64_t v30 = v29;
        uint64_t v50 = v29;
        *(_DWORD *)long long v28 = 136315138;
        uint64_t v44 = v37;
        unint64_t v45 = v9;
        uint64_t v46 = v43;
        char v47 = v38 & 1;
        uint64_t v48 = v40;
        char v49 = v39 & 1;
        sub_2629503D0();
        uint64_t v31 = sub_26297CE00();
        uint64_t v44 = sub_26296B1B8(v31, v32, &v50);
        sub_26297CC40();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_262940000, v26, v27, "%s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E58CD0](v30, -1, -1);
        MEMORY[0x263E58CD0](v28, -1, -1);

        v36(v41, v2);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v25(v6, v2);
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v44 = 0;
    unint64_t v45 = 0xE000000000000000;
    swift_retain();
    sub_26297C090();
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v44) = 0;
    return sub_26297C090();
  }
  return result;
}

uint64_t sub_26295A62C(uint64_t *a1)
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&v28 - v7;
  uint64_t v9 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v32 = result;
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v12(v8, v11, v2);
    swift_bridgeObjectRetain();
    int v13 = sub_26297BFE0();
    os_log_type_t v14 = sub_26297CB60();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v31 = v6;
    if (v15)
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 134217984;
      uint64_t v34 = *(void *)(v9 + 16);
      sub_26297CC40();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_262940000, v13, v14, "[AccountCreation - Startup] Fetch suggestions successful with count: %ld", v16, 0xCu);
      id v17 = v16;
      uint64_t v6 = v31;
      MEMORY[0x263E58CD0](v17, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    os_log_type_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v8, v2);
    v12(v6, v11, v2);
    swift_bridgeObjectRetain_n();
    BOOL v19 = sub_26297BFE0();
    os_log_type_t v20 = sub_26297CB60();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v30 = v18;
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v34 = v29;
      *(_DWORD *)uint64_t v21 = 136642819;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_26295AA90();
      swift_bridgeObjectRelease();
      if (v22)
      {
        uint64_t v23 = sub_26297CA40();
        unint64_t v25 = v24;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v23 = 0;
        unint64_t v25 = 0xE000000000000000;
      }
      uint64_t v33 = sub_26296B1B8(v23, v25, &v34);
      sub_26297CC40();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_262940000, v19, v20, "[AccountCreation - Startup] Fetch suggestions successful with suggestions: %{sensitive}s", v21, 0xCu);
      uint64_t v26 = v29;
      swift_arrayDestroy();
      MEMORY[0x263E58CD0](v26, -1, -1);
      MEMORY[0x263E58CD0](v21, -1, -1);

      v30(v31, v2);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v18(v6, v2);
    }
    *(void *)(v32 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_suggestions) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_26295EC80(v9);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v34 = v27;
    return sub_26297C090();
  }
  return result;
}

uint64_t sub_26295AA90()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_26297BE70();
  swift_allocObject();
  sub_26297BE60();
  sub_26295F25C();
  uint64_t v0 = sub_26297BE50();
  unint64_t v2 = v1;
  swift_release();
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_26297BF40();
  *(void *)&v16[0] = 0;
  id v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  id v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_26297CC70();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v7 = v6;
    os_log_type_t v8 = (void *)sub_26297BEE0();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_2629475F0((uint64_t)v16, (uint64_t)&v13, &qword_26A980110);
  if (v14)
  {
    sub_262952274(&v13, v12);
    sub_262952218((uint64_t)v12, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980310);
    if ((swift_dynamicCast() & 1) == 0) {
      uint64_t v15 = 0;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v9 = v15;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v15 = 0;
  }
  sub_26295205C(v0, v2);
  sub_262947654((uint64_t)v16, &qword_26A980110);
  return v9;
}

uint64_t sub_26295AC9C()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_26297BE70();
  swift_allocObject();
  sub_26297BE60();
  sub_262955008();
  uint64_t v0 = sub_26297BE50();
  unint64_t v2 = v1;
  swift_release();
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_26297BF40();
  *(void *)&v16[0] = 0;
  id v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  id v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_26297CC70();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v7 = v6;
    os_log_type_t v8 = (void *)sub_26297BEE0();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_2629475F0((uint64_t)v16, (uint64_t)&v13, &qword_26A980110);
  if (v14)
  {
    sub_262952274(&v13, v12);
    sub_262952218((uint64_t)v12, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980310);
    if ((swift_dynamicCast() & 1) == 0) {
      uint64_t v15 = 0;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v9 = v15;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v15 = 0;
  }
  sub_26295205C(v0, v2);
  sub_262947654((uint64_t)v16, &qword_26A980110);
  return v9;
}

uint64_t sub_26295AEA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_26297BFE0();
  os_log_type_t v8 = sub_26297CB60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_262940000, v7, v8, "[AccountCreation - Startup] Fetch email validation rules started", v9, 2u);
    MEMORY[0x263E58CD0](v9, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(void *)(v1+ OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository+ 24));
  uint64_t v11 = *(void **)(*v10 + 16);
  uint64_t v12 = *(void **)(*v10 + 24);
  long long v13 = (objc_class *)type metadata accessor for iCloudMailValidationRulesAPIRequest();
  memset(v22, 0, sizeof(v22));
  uint64_t v23 = 0;
  id v14 = objc_allocWithZone(v13);
  sub_2629475F0((uint64_t)v22, (uint64_t)v21, &qword_26A980108);
  id v15 = v11;
  id v16 = v12;
  id v17 = sub_26295EAB8(v11, v16, (uint64_t)v21, &qword_26A980358);

  sub_262947654((uint64_t)v22, &qword_26A980108);
  uint64_t v18 = sub_262955AE8();

  *(void *)&v22[0] = v18;
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980318);
  sub_262947E80(&qword_26A980320, &qword_26A980318);
  sub_26297C0D0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_26297C020();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_26295B1D0(uint64_t a1)
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint64_t v8 = *(void *)a1;
    char v9 = *(unsigned char *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 24);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 16);
    uint64_t v25 = v10;
    uint64_t v12 = qword_26A97FAE0;
    swift_bridgeObjectRetain();
    if (v12 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    swift_bridgeObjectRetain();
    id v14 = sub_26297BFE0();
    os_log_type_t v15 = sub_26297CB70();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = v11;
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      char v19 = v9;
      uint64_t v20 = v18;
      uint64_t v32 = v18;
      *(_DWORD *)id v17 = 136315138;
      uint64_t v23 = v17 + 4;
      uint64_t v26 = v8;
      uint64_t v27 = v7;
      uint64_t v28 = v24;
      char v29 = v25 & 1;
      uint64_t v30 = v16;
      char v31 = v19 & 1;
      sub_2629503D0();
      uint64_t v21 = sub_26297CE00();
      uint64_t v26 = sub_26296B1B8(v21, v22, &v32);
      sub_26297CC40();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_262940000, v14, v15, "[AccountCreation - Startup] Fetch email validation rules failed: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E58CD0](v20, -1, -1);
      MEMORY[0x263E58CD0](v17, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_26295B490(uint64_t *a1)
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = result;
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_26297BFE0();
    os_log_type_t v11 = sub_26297CB60();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 134217984;
      uint64_t v13 = *(void *)(v6 + 16);
      sub_26297CC40();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_262940000, v10, v11, "[AccountCreation - Startup] Fetch email validation rules successful, count: %ld", v12, 0xCu);
      MEMORY[0x263E58CD0](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(void *)(v8 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_validationRules) = v6;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_26295B6D8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_26297C000();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v41 - v12;
  MEMORY[0x270FA5388](v11);
  os_log_type_t v15 = (char *)v41 - v14;
  if (a2)
  {
    unint64_t v45 = v13;
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v6, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, v16, v6);
    id v17 = a2;
    id v18 = a2;
    char v19 = sub_26297BFE0();
    os_log_type_t v20 = sub_26297CB70();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v44 = a3;
      unint64_t v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v42 = v10;
      uint64_t v24 = v23;
      uint64_t v47 = v23;
      uint64_t v43 = a1;
      *(_DWORD *)unint64_t v22 = 136315138;
      v41[1] = v22 + 4;
      swift_getErrorValue();
      uint64_t v25 = sub_26297CE00();
      uint64_t v46 = sub_26296B1B8(v25, v26, &v47);
      a1 = v43;
      sub_26297CC40();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_262940000, v19, v20, "[AccountCreation - Startup] Fetch profile picture failed: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v27 = v24;
      uint64_t v10 = v42;
      MEMORY[0x263E58CD0](v27, -1, -1);
      MEMORY[0x263E58CD0](v22, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
    uint64_t v13 = v45;
  }
  if (a1)
  {
    uint64_t v28 = qword_26A97FAE0;
    id v29 = a1;
    if (v28 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v6, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v30, v6);
    char v31 = sub_26297BFE0();
    os_log_type_t v32 = sub_26297CB60();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = v10;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_262940000, v31, v32, "[AccountCreation - Startup] Fetch profile picture successful", v34, 2u);
      uint64_t v35 = v34;
      uint64_t v10 = v33;
      MEMORY[0x263E58CD0](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v47 = (uint64_t)a1;
    swift_retain();
    return sub_26297C090();
  }
  else
  {
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v37 = __swift_project_value_buffer(v6, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v37, v6);
    uint64_t v38 = sub_26297BFE0();
    os_log_type_t v39 = sub_26297CB70();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_262940000, v38, v39, "[AccountCreation - Startup] Fetch profile picture failed, user image is nil", v40, 2u);
      MEMORY[0x263E58CD0](v40, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
}

uint64_t sub_26295BBE4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_26297C000();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v21) = 1;
  swift_retain();
  sub_26297C090();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  swift_retain();
  sub_26297C090();
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = sub_26297BFE0();
  os_log_type_t v12 = sub_26297CB60();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_262940000, v11, v12, "[AccountCreation - Startup] Check email availability started", v13, 2u);
    MEMORY[0x263E58CD0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v21 = a1;
  unint64_t v22 = a2;
  swift_bridgeObjectRetain();
  sub_26297CAC0();
  uint64_t v14 = v21;
  uint64_t v15 = v22;
  __swift_project_boxed_opaque_existential_1((void *)(v3 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(void *)(v3 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
  uint64_t v21 = sub_26295395C(v14, v15);
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  id v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = v14;
  v17[4] = v15;
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980300);
  sub_262947E80(&qword_26A980308, &qword_26A980300);
  uint64_t v18 = sub_26297C0D0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v19 = *(void *)(v3
                  + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_availableApiCall);
  *(void *)(v3 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_availableApiCall) = v18;
  swift_retain();
  if (v19)
  {
    sub_26297C030();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_26295BF9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_26297C000();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v36 - v10;
  uint64_t v12 = *(void *)a1;
  unint64_t v13 = *(void *)(a1 + 8);
  uint64_t v46 = *(void *)(a1 + 16);
  uint64_t v47 = v12;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v48 = *(void *)(a1 + 24);
  int v15 = *(unsigned __int8 *)(a1 + 40);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v13)
    {
      uint64_t v40 = a3;
      int v41 = v15;
      uint64_t v42 = v14;
      uint64_t v17 = qword_26A97FAE0;
      swift_bridgeObjectRetain();
      if (v17 != -1) {
        swift_once();
      }
      uint64_t v18 = __swift_project_value_buffer(v5, (uint64_t)qword_26A983738);
      uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v43(v11, v18, v5);
      swift_bridgeObjectRetain_n();
      uint64_t v19 = sub_26297BFE0();
      int v39 = sub_26297CB70();
      BOOL v20 = os_log_type_enabled(v19, (os_log_type_t)v39);
      uint64_t v44 = v9;
      uint64_t v45 = v6;
      if (v20)
      {
        os_log_t v37 = v19;
        uint64_t v38 = v18;
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v49 = v36;
        *(_DWORD *)uint64_t v21 = 136642819;
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_26295AC9C();
        swift_bridgeObjectRelease();
        if (v22)
        {
          uint64_t v23 = sub_26297CA40();
          unint64_t v25 = v24;
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v23 = 0;
          unint64_t v25 = 0xE000000000000000;
        }
        uint64_t v55 = sub_26296B1B8(v23, v25, &v49);
        sub_26297CC40();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        os_log_t v27 = v37;
        _os_log_impl(&dword_262940000, v37, (os_log_type_t)v39, "[AccountCreation - Startup] params: %{sensitive}s", v21, 0xCu);
        uint64_t v28 = v36;
        swift_arrayDestroy();
        MEMORY[0x263E58CD0](v28, -1, -1);
        MEMORY[0x263E58CD0](v21, -1, -1);

        unint64_t v26 = *(void (**)(char *, uint64_t))(v45 + 8);
        v26(v11, v5);
        uint64_t v9 = v44;
        uint64_t v18 = v38;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        unint64_t v26 = *(void (**)(char *, uint64_t))(v6 + 8);
        v26(v11, v5);
      }
      v43(v9, v18, v5);
      swift_bridgeObjectRetain();
      id v29 = v9;
      uint64_t v30 = sub_26297BFE0();
      os_log_type_t v31 = sub_26297CB70();
      if (os_log_type_enabled(v30, v31))
      {
        os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v55 = v33;
        *(_DWORD *)os_log_type_t v32 = 136315138;
        uint64_t v43 = (void (*)(char *, uint64_t, uint64_t))v26;
        uint64_t v49 = v47;
        unint64_t v50 = v13;
        uint64_t v51 = v46;
        char v52 = v48 & 1;
        uint64_t v53 = v42;
        char v54 = v41 & 1;
        sub_2629503D0();
        uint64_t v34 = sub_26297CE00();
        uint64_t v49 = sub_26296B1B8(v34, v35, &v55);
        sub_26297CC40();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_262940000, v30, v31, "[AccountCreation - Startup] Check email availability failed: %s", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E58CD0](v33, -1, -1);
        MEMORY[0x263E58CD0](v32, -1, -1);

        ((void (*)(char *, uint64_t))v43)(v44, v5);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v26(v29, v5);
      }
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v49 = 0;
      unint64_t v50 = 0xE000000000000000;
      swift_retain();
      sub_26297C090();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v49) = 0;
      swift_retain();
      sub_26297C090();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v49) = 0;
    return sub_26297C090();
  }
  return result;
}

uint64_t sub_26295C598(unsigned __int8 *a1)
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = sub_26297BFE0();
    os_log_type_t v10 = sub_26297CB60();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 67109120;
      LODWORD(v18) = v6;
      sub_26297CC40();
      _os_log_impl(&dword_262940000, v9, v10, "[AccountCreation - Startup] Check email availability successful, available: %{BOOL}d", v11, 8u);
      MEMORY[0x263E58CD0](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v18) = v6 ^ 1;
    swift_retain();
    sub_26297C090();
    unint64_t v12 = 0xE000000000000000;
    if (v6)
    {
      uint64_t v13 = 0;
    }
    else
    {
      _s18CurrentBundleClassCMa();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      uint64_t v18 = 2777980912;
      unint64_t v19 = 0xA400000000000000;
      sub_26297CAC0();
      sub_26297CAC0();
      uint64_t v13 = sub_26297BEC0();
      unint64_t v12 = v16;

      swift_bridgeObjectRelease();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v18 = v13;
    unint64_t v19 = v12;
    return sub_26297C090();
  }
  return result;
}

unint64_t sub_26295C8DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v19) = 1;
  swift_retain();
  sub_26297C090();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v19) = 1;
  swift_retain();
  sub_26297C090();
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_26297BFE0();
  os_log_type_t v8 = sub_26297CB60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_262940000, v7, v8, "[AccountCreation - Startup] Create iCloud Mail Account started", v9, 2u);
    MEMORY[0x263E58CD0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  sub_26297CAC0();
  swift_bridgeObjectRelease();
  uint64_t v11 = v19;
  uint64_t v10 = v20;
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_suggestions);
  unint64_t result = sub_26295EDE0(v12, v19, v20);
  if (v14)
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0xE000000000000000;
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)(v12 + 16))
  {
    unint64_t v15 = v12 + 32 * result;
    uint64_t v17 = *(void *)(v15 + 32);
    uint64_t v16 = *(void *)(v15 + 40);
    swift_bridgeObjectRetain();
LABEL_10:
    __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(void *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
    uint64_t v18 = sub_262953A24(v17, v16, v11, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v19 = v18;
    swift_allocObject();
    swift_weakInit();
    swift_allocObject();
    swift_weakInit();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802F0);
    sub_262947E80(&qword_26A9802F8, &qword_26A9802F0);
    sub_26297C0D0();
    swift_release();
    swift_release();
    swift_release();
    swift_beginAccess();
    sub_26297C020();
    swift_endAccess();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_26295CD2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_26297C090();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_26297C090();
      swift_getKeyPath();
      swift_getKeyPath();
      return sub_26297C090();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_26295CE88(uint64_t *a1)
{
  uint64_t v2 = sub_26297C000();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v35 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v13 = *a1;
  unint64_t v12 = a1[1];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v15 = result;
  uint64_t v40 = v6;
  int v41 = v9;
  uint64_t v42 = v3;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  sub_26297CAC0();
  swift_bridgeObjectRelease();
  if (v13 == v44 && v12 == v45)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    uint64_t v17 = v42;
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v11, v18, v2);
    uint64_t v19 = sub_26297BFE0();
    os_log_type_t v20 = sub_26297CB60();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_262940000, v19, v20, "[AccountCreation - Startup] Create iCloud Mail Account successful", v21, 2u);
      MEMORY[0x263E58CD0](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v2);
    __swift_project_boxed_opaque_existential_1((void *)(v15 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(void *)(v15 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
    swift_retain();
    sub_262953DF8((uint64_t)sub_26295EEBC, v15);
    return swift_release_n();
  }
  char v16 = sub_26297CDE0();
  swift_bridgeObjectRelease();
  if (v16) {
    goto LABEL_6;
  }
  uint64_t v22 = v42;
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v2, (uint64_t)qword_26A983738);
  int v39 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v39(v41, v23, v2);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v24 = sub_26297BFE0();
  os_log_type_t v25 = sub_26297CB70();
  int v26 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v43 = v37;
    *(_DWORD *)uint64_t v27 = 136643075;
    int v36 = v26;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_26296B1B8(v13, v12, &v43);
    sub_26297CC40();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2085;
    uint64_t v35 = v27 + 14;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v38 = v23;
    sub_26297C080();
    swift_release();
    swift_release();
    swift_bridgeObjectRetain();
    sub_26297CAC0();
    uint64_t v23 = v38;
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_26296B1B8(v44, v45, &v43);
    sub_26297CC40();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_262940000, v24, (os_log_type_t)v36, "[AccountCreation - Startup] response email: %{sensitive}s, user choice: %{sensitive}s", (uint8_t *)v27, 0x16u);
    uint64_t v28 = v37;
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v28, -1, -1);
    uint64_t v29 = v27;
    uint64_t v22 = v42;
    MEMORY[0x263E58CD0](v29, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v30 = *(void (**)(char *, uint64_t))(v22 + 8);
  v30(v41, v2);
  os_log_type_t v31 = v40;
  v39(v40, v23, v2);
  os_log_type_t v32 = sub_26297BFE0();
  os_log_type_t v33 = sub_26297CB70();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_262940000, v32, v33, "[AccountCreation - Startup] Create iCloud Mail Account successful, but email doesn't match", v34, 2u);
    MEMORY[0x263E58CD0](v34, -1, -1);
  }

  v30(v31, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v44) = 0;
  swift_retain();
  sub_26297C090();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v44) = 0;
  return sub_26297C090();
}

uint64_t sub_26295D55C()
{
  return sub_26297C090();
}

uint64_t sub_26295D650()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__profileImage;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__suggestedEmails;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__inputEmail;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803D8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__debouncedInputEmail, v6);
  uint64_t v8 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isLoading;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803E0);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isCreating, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAlert, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingFinishView, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAvailableCheckSpinner, v9);
  v7(v0+ OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__emailValidAvailableErrorMessage, v6);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__disableContinueButton, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__getSuggestionsError, v9);
  uint64_t v11 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__errorAlert;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__passedInitialLengthThreshold, v9);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_26295D958()
{
  sub_26295D650();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_26295D9B0()
{
  return _s9ViewModelCMa();
}

uint64_t _s9ViewModelCMa()
{
  uint64_t result = qword_26A9802A0;
  if (!qword_26A9802A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_26295DA04()
{
  sub_26295DC5C(319, &qword_26A9802B0, &qword_26A9802B8);
  if (v0 <= 0x3F)
  {
    sub_26295DC5C(319, &qword_26A9802C0, &qword_26A9802C8);
    if (v1 <= 0x3F)
    {
      sub_26295DC14(319, &qword_26A9802D0);
      if (v2 <= 0x3F)
      {
        sub_26295DC14(319, &qword_26A9802D8);
        if (v3 <= 0x3F)
        {
          sub_26295DC5C(319, &qword_26A9802E0, &qword_26A9802E8);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_26295DC14(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_26297C0A0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_26295DC5C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_26297C0A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_26295DCAC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_26295DCB8@<X0>(uint64_t *a1@<X8>)
{
  _s9ViewModelCMa();
  uint64_t result = sub_26297C040();
  *a1 = result;
  return result;
}

uint64_t sub_26295DD10@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void sub_26295DD40(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_26297CC40();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_26295DDF8(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B20);
  char v38 = a2;
  uint64_t v6 = sub_26297CD50();
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
  uint64_t v35 = v2;
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
          unint64_t v3 = v35;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    os_log_type_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_26297CE50();
    sub_26297CAA0();
    uint64_t result = sub_26297CE70();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
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
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_26295E108(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B10);
  uint64_t v6 = sub_26297CD50();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_262952274(v24, v35);
      }
      else
      {
        sub_262952218((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_26297CE50();
      sub_26297CAA0();
      uint64_t result = sub_26297CE70();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_262952274(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

void sub_26295E408(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_26295FA90(a2, a3);
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
    sub_26295E578();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_26295DDF8(v15, a4 & 1);
  unint64_t v20 = sub_26295FA90(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_26297CDF0();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
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

id sub_26295E578()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B20);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26297CD40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
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

void *sub_26295E72C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26297CD40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  id result = (void *)(v3 + 64);
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
    uint64_t v20 = 32 * v15;
    sub_262952218(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = v19;
    v21[1] = v18;
    sub_262952274(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
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

uint64_t sub_26295E914(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_26295E934(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_26295E934(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980388);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_26297CD70();
  __break(1u);
  return result;
}

id sub_26295EAA0(void *a1, void *a2, uint64_t a3)
{
  return sub_26295EAB8(a1, a2, a3, &qword_26A980440);
}

id sub_26295EAAC(void *a1, void *a2, uint64_t a3)
{
  return sub_26295EAB8(a1, a2, a3, &qword_26A980410);
}

id sub_26295EAB8(void *a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v29 = a3;
  BOOL v30 = a4;
  uint64_t v5 = v4;
  unint64_t v27 = a1;
  char v28 = a2;
  uint64_t v6 = sub_26297BFB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = qword_26A97FED8;
  *(void *)&v5[qword_26A97FED8] = 0;
  uint64_t v11 = (uint64_t)&v5[qword_26A97FEE8];
  *(void *)(v11 + 32) = 0;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(void *)&v5[qword_26A97FEF0] = 0;
  uint64_t v12 = (uint64_t *)&v5[qword_26A97FEF8];
  int64_t v13 = v5;
  sub_26297BFA0();
  uint64_t v14 = sub_26297BF90();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t *v12 = v14;
  v12[1] = v16;
  uint64_t v17 = *(void **)&v5[v10];
  uint64_t v18 = v27;
  *(void *)&v5[v10] = v27;
  id v19 = v18;

  uint64_t v20 = v28;
  *(void *)&v13[qword_26A97FEE0] = v28;
  swift_beginAccess();
  id v21 = v20;
  uint64_t v22 = v29;
  sub_26295F1CC(v29, v11);
  swift_endAccess();

  unint64_t v23 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(v30);
  v31.receiver = v13;
  v31.super_class = v23;
  id v24 = objc_msgSendSuper2(&v31, sel_init);
  sub_262947654(v22, &qword_26A980108);
  return v24;
}

uint64_t sub_26295EC80(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_26295E914(0, v1, 0);
    uint64_t v2 = v12;
    sub_262947368();
    uint64_t v4 = a1 + 56;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v5 = (void *)sub_26297CC60();
      if (v5[2])
      {
        uint64_t v7 = v5[4];
        unint64_t v6 = v5[5];
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v7 = 0;
        unint64_t v6 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v9 = *(void *)(v12 + 16);
      unint64_t v8 = *(void *)(v12 + 24);
      if (v9 >= v8 >> 1) {
        sub_26295E914(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v12 + 16) = v9 + 1;
      uint64_t v10 = v12 + 16 * v9;
      *(void *)(v10 + 32) = v7;
      *(void *)(v10 + 40) = v6;
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_26295EDE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = 0;
  for (unint64_t i = (void *)(a1 + 56); ; i += 4)
  {
    BOOL v8 = *(i - 1) == a2 && *i == a3;
    if (v8 || (sub_26297CDE0() & 1) != 0) {
      break;
    }
    if (v3 == ++v6) {
      return 0;
    }
  }
  return v6;
}

uint64_t sub_26295EE74()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26295EEAC(uint64_t a1)
{
  return sub_26295CD2C(a1);
}

uint64_t sub_26295EEB4(uint64_t *a1)
{
  return sub_26295CE88(a1);
}

uint64_t sub_26295EEBC()
{
  return sub_26295D55C();
}

uint64_t sub_26295EEE4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_26295EF24(uint64_t a1)
{
  return sub_26295BF9C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_26295EF30(unsigned __int8 *a1)
{
  return sub_26295C598(a1);
}

uint64_t sub_26295EF38(uint64_t *a1)
{
  return sub_26295B490(a1);
}

uint64_t sub_26295EF40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26295EF78(uint64_t a1, uint64_t a2)
{
  return sub_262958F1C(a1, a2);
}

unint64_t sub_26295EF80()
{
  unint64_t result = qword_26A980348;
  if (!qword_26A980348)
  {
    sub_2629522E4(255, (unint64_t *)&qword_26A97FD58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980348);
  }
  return result;
}

uint64_t sub_26295EFE8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_26295F020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262959150(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16), *(void *)(v3 + 24), &qword_26A980368, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_26295F1B4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_26295F1C0, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_26295F930);
}

uint64_t sub_26295F088()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_26295F0C4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_26297BF80() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = v8 + *(void *)(v7 + 64);
  uint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFF8) + v3;
  uint64_t v11 = *(void *)(v3 + 16);
  int v12 = *(unsigned __int8 *)(v3 + v9);
  int64_t v13 = *(void (**)(void, void, void))(v10 + 8);
  uint64_t v14 = *(void *)(v10 + 16);
  sub_2629562C8(a1, a2, a3, v11, v3 + v8, v12, v13, v14);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_26295F19C(uint64_t a1, uint64_t a2)
{
  return sub_26295F450(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_262957E58);
}

uint64_t sub_26295F1B4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_26295F1C0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_26295F1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_26295F244(uint64_t a1)
{
  return sub_26295A090(a1);
}

uint64_t sub_26295F24C(uint64_t *a1)
{
  return sub_26295A62C(a1);
}

unint64_t sub_26295F25C()
{
  unint64_t result = qword_26A980380;
  if (!qword_26A980380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980380);
  }
  return result;
}

uint64_t sub_26295F2B0(uint64_t a1, uint64_t a2)
{
  return sub_262958E60(a1, a2);
}

uint64_t sub_26295F2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262959150(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16), *(void *)(v3 + 24), &qword_26A9803C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_26295F934, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_26295F930, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_26295F930);
}

void sub_26295F324(void *a1, void *a2, void *a3)
{
  uint64_t v7 = *(void *)(sub_26297BF80() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_262956BA8(a1, a2, a3, *(void *)(v3 + 16), v3 + v8, *(unsigned __int8 *)(v3 + v8 + *(void *)(v7 + 64)), *(void (**)(id, void *, void *))(((v8 + *(void *)(v7 + 64)) & 0xFFFFFFFFFFFFFFF8) + v3 + 8), *(void *)(((v8 + *(void *)(v7 + 64)) & 0xFFFFFFFFFFFFFFF8) + v3 + 16), (uint64_t)&unk_270DE2CB0, (uint64_t)sub_26295F4A0, (uint64_t)&block_descriptor_199, &unk_270DE1510, (uint64_t)&unk_270DE2C60, (uint64_t)sub_26295F438, (uint64_t)&block_descriptor_193);
}

uint64_t sub_26295F438(uint64_t a1, uint64_t a2)
{
  return sub_26295F450(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_262957938);
}

uint64_t sub_26295F450(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void))
{
  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_26295F468()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26295F4A0()
{
  return j__swift_bridgeObjectRetain(*(void *)(v0 + 16));
}

uint64_t sub_26295F4C8(uint64_t a1, uint64_t a2)
{
  return sub_262959094(a1, a2);
}

uint64_t sub_26295F4D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2629595C0(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16));
}

void sub_26295F4DC(void *a1, void *a2, void *a3)
{
  uint64_t v7 = *(void *)(sub_26297BF80() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_262956BA8(a1, a2, a3, *(void *)(v3 + 16), v3 + v8, *(unsigned __int8 *)(v3 + v8 + *(void *)(v7 + 64)), *(void (**)(id, void *, void *))(((v8 + *(void *)(v7 + 64)) & 0xFFFFFFFFFFFFFFF8) + v3 + 8), *(void *)(((v8 + *(void *)(v7 + 64)) & 0xFFFFFFFFFFFFFFF8) + v3 + 16), (uint64_t)&unk_270DE2E18, (uint64_t)sub_26295F910, (uint64_t)&block_descriptor_252, &unk_270DE15A0, (uint64_t)&unk_270DE2DC8, (uint64_t)sub_26295F5F0, (uint64_t)&block_descriptor_245);
}

uint64_t sub_26295F5F0(uint64_t a1, uint64_t a2)
{
  return sub_26295F450(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_262958898);
}

uint64_t sub_26295F608()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_26295F610()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_26295F618(uint64_t a1, uint64_t a2)
{
  return sub_262958FD8(a1, a2);
}

uint64_t sub_26295F620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2629593C4(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16));
}

uint64_t objectdestroy_144Tm()
{
  uint64_t v1 = sub_26297BF80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((v4 + *(void *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8) + 24;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_26295F714(void *a1, void *a2, void *a3)
{
  uint64_t v7 = *(void *)(sub_26297BF80() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_262956BA8(a1, a2, a3, *(void *)(v3 + 16), v3 + v8, *(unsigned __int8 *)(v3 + v8 + *(void *)(v7 + 64)), *(void (**)(id, void *, void *))(((v8 + *(void *)(v7 + 64)) & 0xFFFFFFFFFFFFFFF8) + v3 + 8), *(void *)(((v8 + *(void *)(v7 + 64)) & 0xFFFFFFFFFFFFFFF8) + v3 + 16), (uint64_t)&unk_270DE2F80, (uint64_t)sub_26295F910, (uint64_t)&block_descriptor_281, &unk_270DE1570, (uint64_t)&unk_270DE2F30, (uint64_t)sub_26295F878, (uint64_t)&block_descriptor_274);
}

uint64_t objectdestroy_147Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_26295F878(uint64_t a1, uint64_t a2)
{
  return sub_26295F450(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_262958378);
}

uint64_t sub_26295F890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_26295F8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

CGFloat sub_26295F938()
{
  uint64_t v0 = sub_26297BE80();
  if (!v0)
  {
    long long v6 = 0u;
    long long v7 = 0u;
LABEL_10:
    sub_26295FA30((uint64_t)&v6);
    return 0.0;
  }
  uint64_t v1 = v0;
  sub_26297CA60();
  sub_26297CCB0();
  if (*(void *)(v1 + 16) && (unint64_t v2 = sub_26295FB08((uint64_t)&v5), (v3 & 1) != 0))
  {
    sub_262952218(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_262952338((uint64_t)&v5);
  if (!*((void *)&v7 + 1)) {
    goto LABEL_10;
  }
  type metadata accessor for CGRect(0);
  if (swift_dynamicCast()) {
    return CGRectGetHeight(v5);
  }
  return 0.0;
}

uint64_t sub_26295FA30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980110);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_26295FA90(uint64_t a1, uint64_t a2)
{
  sub_26297CE50();
  sub_26297CAA0();
  uint64_t v4 = sub_26297CE70();
  return sub_26295FB4C(a1, a2, v4);
}

unint64_t sub_26295FB08(uint64_t a1)
{
  uint64_t v2 = sub_26297CC90();
  return sub_26295FC30(a1, v2);
}

unint64_t sub_26295FB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_26297CDE0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_26297CDE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_26295FC30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_262952284(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x263E58490](v9, a1);
      sub_262952338((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_26295FCF8(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_26297C1F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    BOOL v11 = (void *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_26297C230();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    BOOL v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *BOOL v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[8];
    uint64_t v18 = (char *)a1 + v17;
    id v19 = (char *)a2 + v17;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *((void *)v19 + 1);
    char v22 = v19[16];
    swift_retain();
    sub_26295FF60();
    *(void *)uint64_t v18 = v20;
    *((void *)v18 + 1) = v21;
    v18[16] = v22;
    uint64_t v23 = a3[9];
    uint64_t v24 = a3[10];
    uint64_t v25 = (char *)a1 + v23;
    uint64_t v26 = (char *)a2 + v23;
    *uint64_t v25 = *v26;
    *((void *)v25 + 1) = *((void *)v26 + 1);
    v25[16] = v26[16];
    unint64_t v27 = (char *)a1 + v24;
    char v28 = (char *)a2 + v24;
    *unint64_t v27 = *v28;
    *((void *)v27 + 1) = *((void *)v28 + 1);
    uint64_t v29 = a3[11];
    BOOL v30 = (void *)((char *)a1 + v29);
    objc_super v31 = (void *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    *BOOL v30 = *v31;
    v30[1] = v32;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_26295FF60()
{
  return swift_retain();
}

uint64_t sub_26295FF68(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_26297C1F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_26297C230();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_2629600C4();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2629600C4()
{
  return swift_release();
}

void *sub_2629600CC(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_26297C1F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_26297C230();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *((void *)v17 + 1);
  char v20 = v17[16];
  swift_retain();
  sub_26295FF60();
  *(void *)uint64_t v16 = v18;
  *((void *)v16 + 1) = v19;
  v16[16] = v20;
  uint64_t v21 = a3[9];
  uint64_t v22 = a3[10];
  uint64_t v23 = (char *)a1 + v21;
  uint64_t v24 = (char *)a2 + v21;
  char *v23 = *v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  v23[16] = v24[16];
  uint64_t v25 = (char *)a1 + v22;
  uint64_t v26 = (char *)a2 + v22;
  *uint64_t v25 = *v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  uint64_t v27 = a3[11];
  char v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  void *v28 = *v29;
  v28[1] = v30;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_2629602E4(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_262947654((uint64_t)a1, &qword_26A980450);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_26297C1F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_262947654((uint64_t)a1 + v7, &qword_26A980458);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_26297C230();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *((void *)v17 + 1);
  char v20 = v17[16];
  sub_26295FF60();
  *(void *)uint64_t v16 = v18;
  *((void *)v16 + 1) = v19;
  v16[16] = v20;
  sub_2629600C4();
  uint64_t v21 = a3[9];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  char *v22 = *((unsigned char *)a2 + v21);
  *((void *)v22 + 1) = *(void *)((char *)a2 + v21 + 8);
  swift_retain();
  swift_release();
  v22[16] = v23[16];
  uint64_t v24 = a3[10];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  *uint64_t v25 = *v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_retain();
  swift_release();
  uint64_t v27 = a3[11];
  char v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  void *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_262960568(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_26297C1F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_26297C230();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  long long v18 = *(_OWORD *)v17;
  v16[16] = v17[16];
  *(_OWORD *)uint64_t v16 = v18;
  uint64_t v19 = &a1[v15];
  char v20 = &a2[v15];
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  unsigned char v19[16] = v20[16];
  uint64_t v21 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  return a1;
}

char *sub_262960734(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_262947654((uint64_t)a1, &qword_26A980450);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_26297C1F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_262947654((uint64_t)&a1[v8], &qword_26A980458);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_26297C230();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  swift_release();
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  char v17 = v16[16];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  v15[16] = v17;
  sub_2629600C4();
  uint64_t v18 = a3[9];
  uint64_t v19 = &a1[v18];
  char v20 = &a2[v18];
  *uint64_t v19 = a2[v18];
  *((void *)v19 + 1) = *(void *)&a2[v18 + 8];
  swift_release();
  unsigned char v19[16] = v20[16];
  uint64_t v21 = a3[10];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  char *v22 = *v23;
  *((void *)v22 + 1) = *((void *)v23 + 1);
  swift_release();
  uint64_t v24 = a3[11];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v28 = *(void *)v26;
  uint64_t v27 = *((void *)v26 + 1);
  *(void *)uint64_t v25 = v28;
  *((void *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_262960980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_262960994);
}

uint64_t sub_262960994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980460);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980468);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_262960AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_262960AC4);
}

uint64_t sub_262960AC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980460);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980468);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for AccountCreationStartupPageView()
{
  uint64_t result = qword_26A980470;
  if (!qword_26A980470) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_262960C28()
{
  sub_262960D68(319, &qword_26A980480, MEMORY[0x263F188C0]);
  if (v0 <= 0x3F)
  {
    sub_262960D68(319, &qword_26A980488, MEMORY[0x263F18948]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_262960D68(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_26297C190();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_262960DBC()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_262960DD8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_262961028(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_26A97FC10, &qword_26A97FDA8).n128_u64[0];
  return result;
}

uint64_t sub_262960E34@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_26297CB80();
    objc_super v31 = (void *)sub_26297C510();
    sub_26297BFD0();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_26297C2B0();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_2629477E8(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

__n128 sub_262961028@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_26297CB80();
    uint64_t v28 = (void *)sub_26297C510();
    sub_26297BFD0();

    uint64_t v19 = a17;
  }
  sub_26297C2B0();
  sub_2629475F0(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *uint64_t v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_2629611F8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (int *)type metadata accessor for AccountCreationStartupPageView();
  uint64_t v11 = (uint64_t *)((char *)a5 + v10[5]);
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (char *)a5 + v10[9];
  char *v12 = sub_26297C160() & 1;
  *((void *)v12 + 1) = v13;
  v12[16] = v14 & 1;
  uint64_t v15 = (char *)a5 + v10[10];
  char v23 = 0;
  sub_26297C860();
  uint64_t v16 = *((void *)&v22[0] + 1);
  char *v15 = v22[0];
  *((void *)v15 + 1) = v16;
  uint64_t v17 = (uint64_t *)((char *)a5 + v10[11]);
  *uint64_t v17 = 0xD000000000000027;
  v17[1] = 0x8000000262980AF0;
  uint64_t v18 = (uint64_t *)((char *)a5 + v10[7]);
  void *v18 = a3;
  v18[1] = a4;
  *((unsigned char *)a5 + v10[6]) = a2;
  sub_26296E840(a1, (uint64_t)v22);
  uint64_t v19 = swift_allocObject();
  sub_262952320(v22, v19 + 16);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  char v21 = (char *)a5 + v10[8];
  *(void *)char v21 = sub_26296E8DC;
  *((void *)v21 + 1) = v19;
  v21[16] = 0;
  return result;
}

uint64_t sub_262961394(uint64_t a1)
{
  sub_26296E840(a1, (uint64_t)v15);
  uint64_t v1 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (void *)((char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v4 + 16))(v3);
  uint64_t v5 = *v3;
  uint64_t v6 = type metadata accessor for ACRepositoryDefault();
  v14[3] = v6;
  v14[4] = &off_270DE27B0;
  v14[0] = v5;
  _s9ViewModelCMa();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v6);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (void *)((char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  uint64_t v12 = sub_26296B9BC(*v10, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v12;
}

uint64_t sub_262961550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804B0);
  uint64_t v38 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804A8);
  uint64_t v40 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  __n128 v34 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804A0);
  uint64_t v45 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  long long v35 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v36 = v6;
  sub_26296AE74(a1, (uint64_t)v6);
  uint64_t v11 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v42 = ((v11 + 16) & ~v11) + v5;
  uint64_t v12 = (v11 + 16) & ~v11;
  uint64_t v43 = v12;
  uint64_t v41 = v11 | 7;
  uint64_t v13 = swift_allocObject();
  sub_26296AEDC((uint64_t)v6, v13 + v12);
  uint64_t v32 = a1;
  uint64_t v33 = _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1B0();
  swift_getKeyPath();
  sub_26297C250();
  swift_release();
  swift_release();
  long long v53 = v50;
  long long v54 = v51;
  *(_OWORD *)uint64_t v55 = v52[0];
  *(_OWORD *)&v55[9] = *(_OWORD *)((char *)v52 + 9);
  sub_262961DF8((uint64_t)&v53, 19279, 0xE200000000000000, (uint64_t)sub_26296AF40, v13);
  uint64_t v56 = v53;
  sub_26296AFC8((uint64_t)&v56);
  swift_release();
  sub_26294758C((uint64_t)&v54, (uint64_t)v57, &qword_26A9802E8);
  sub_26296AFF4((uint64_t)v57);
  swift_release();
  uint64_t v47 = a1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804B8);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804C0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804C8);
  uint64_t v17 = sub_262947E80(&qword_26A9804D0, &qword_26A9804C0);
  unint64_t v18 = sub_26296A54C();
  uint64_t v19 = sub_262947E80(&qword_26A9804E0, &qword_26A9804C8);
  *(void *)&long long v50 = v15;
  *((void *)&v50 + 1) = &type metadata for MSError;
  *(void *)&long long v51 = v16;
  *((void *)&v51 + 1) = v17;
  *(void *)&v52[0] = v18;
  *((void *)&v52[0] + 1) = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = sub_262947E80(&qword_26A9804E8, &qword_26A9804B8);
  uint64_t v22 = v34;
  uint64_t v23 = v37;
  sub_26297C770();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v23);
  *(void *)&long long v50 = v23;
  *((void *)&v50 + 1) = v14;
  *(void *)&long long v51 = OpaqueTypeConformance2;
  *((void *)&v51 + 1) = v21;
  uint64_t v24 = swift_getOpaqueTypeConformance2();
  uint64_t v25 = v35;
  uint64_t v26 = v39;
  sub_26297C720();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v26);
  sub_26297C1B0();
  swift_getKeyPath();
  sub_26297C250();
  swift_release();
  swift_release();
  uint64_t v27 = (uint64_t)v36;
  sub_26296AE74(v32, (uint64_t)v36);
  uint64_t v28 = swift_allocObject();
  sub_26296AEDC(v27, v28 + v43);
  uint64_t v48 = v26;
  uint64_t v49 = v24;
  swift_getOpaqueTypeConformance2();
  sub_26296A5A0();
  uint64_t v29 = v44;
  sub_26297C750();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v25, v29);
}

double sub_262961CBC@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_262961D4C()
{
  return sub_26297C090();
}

uint64_t sub_262961DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = a4;
  uint64_t v10 = a5;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980558);
  MEMORY[0x263E580B0](&v8);
  if (*((void *)&v8 + 1)) {
    swift_bridgeObjectRelease();
  }
  sub_26297C8F0();
  char v6 = MEMORY[0x263E580B0](&v8, v5);
  MEMORY[0x270FA5388](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804C8);
  sub_262947E80(&qword_26A9804D0, &qword_26A9804C0);
  sub_26296A54C();
  sub_262947E80(&qword_26A9804E0, &qword_26A9804C8);
  sub_26297C740();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_262962010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v16[1] = a2;
  v16[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980510);
  MEMORY[0x270FA5388](v16[0]);
  long long v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980518);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_26297C490();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980520);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26297C470();
  v16[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980528);
  sub_26296C8E0();
  sub_26297C2A0();
  sub_26297C480();
  v16[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980538);
  sub_262947E80(&qword_26A980540, &qword_26A980538);
  sub_26297C2A0();
  uint64_t v14 = &v4[*(int *)(v16[0] + 48)];
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v4, v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v14, v8, v5);
  sub_26297C440();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_262962330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v3 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v22 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804C8);
  uint64_t v5 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v25 = 2777980912;
  unint64_t v26 = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v10 = sub_26297BEC0();
  unint64_t v12 = v11;

  swift_bridgeObjectRelease();
  uint64_t v25 = v10;
  unint64_t v26 = v12;
  sub_26296AE74(a1, (uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v14 = swift_allocObject();
  sub_26296AEDC((uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  sub_262947368();
  sub_26297C8A0();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(a1) = v25;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = a1;
  uint64_t v18 = v23;
  uint64_t v17 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v24, v7, v23);
  uint64_t v19 = (uint64_t *)(v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980528) + 36));
  *uint64_t v19 = KeyPath;
  v19[1] = (uint64_t)sub_26296EA68;
  v19[2] = v16;
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v18);
}

uint64_t sub_2629626F0()
{
  uint64_t v0 = sub_26297C1F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26296A5F4(&qword_26A980450, MEMORY[0x263F188C0], 0x417373696D736944, (uint64_t)v3);
  sub_26297C1E0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2629627E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_26297C410();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980548);
  return sub_262963044(a1, (void *)(a2 + *(int *)(v4 + 44)));
}

uint64_t sub_262962838@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296284C()
{
  return sub_26296AD34();
}

__n128 sub_262962860@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v43 = a2;
  uint64_t v2 = sub_26297C000();
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x270FA5388](v2);
  long long v35 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  uint64_t v41 = v5;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v39 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v34 - v8;
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  long long v10 = v44[0];
  sub_26297C1A0();
  swift_bridgeObjectRetain();
  swift_release();
  v44[0] = v10;
  swift_bridgeObjectRetain();
  sub_26297CAC0();
  swift_bridgeObjectRelease();
  uint64_t v11 = (uint64_t)v39;
  swift_bridgeObjectRelease();
  uint64_t v12 = *((void *)&v44[0] + 1);
  uint64_t v42 = *(void *)&v44[0];
  uint64_t v13 = v38;
  sub_26296AE74(v38, (uint64_t)v9);
  unint64_t v14 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v41 = swift_allocObject();
  sub_26296AEDC((uint64_t)v9, v41 + v14);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  uint64_t v15 = v40;
  swift_release();
  swift_release();
  swift_release();
  uint64_t v16 = *(void *)&v44[0];
  int v17 = *(unsigned __int8 *)(v13 + *(int *)(v15 + 24));
  uint64_t v18 = v13;
  uint64_t v19 = v11;
  sub_26296AE74(v18, v11);
  if (v17 == 1)
  {
    uint64_t v38 = v12;
    uint64_t v20 = sub_26297C1A0();
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v21 = v37;
    uint64_t v22 = __swift_project_value_buffer(v37, (uint64_t)qword_26A983738);
    uint64_t v23 = v36;
    uint64_t v24 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v35, v22, v21);
    uint64_t v25 = sub_26297BFE0();
    os_log_type_t v26 = sub_26297CB60();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_262940000, v25, v26, "[AccountCreation - Startup] checking if mail enabled", v27, 2u);
      MEMORY[0x263E58CD0](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v21);
    __swift_project_boxed_opaque_existential_1((void *)(v20 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(void *)(v20 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
    char v28 = sub_262953B20();
    swift_release();
    uint64_t v29 = v42;
    uint64_t v12 = v38;
  }
  else
  {
    char v28 = 0;
    uint64_t v29 = v42;
  }
  sub_26296E708(v19, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
  sub_262946AC0(v29, v12, (uint64_t)sub_26296B140, v41, v16, v28 & 1, (uint64_t)v44);
  long long v30 = v44[5];
  uint64_t v31 = v43;
  *(_OWORD *)(v43 + 64) = v44[4];
  *(_OWORD *)(v31 + 80) = v30;
  *(void *)(v31 + 96) = v45;
  long long v32 = v44[1];
  *(_OWORD *)uint64_t v31 = v44[0];
  *(_OWORD *)(v31 + 16) = v32;
  __n128 result = (__n128)v44[3];
  *(_OWORD *)(v31 + 32) = v44[2];
  *(__n128 *)(v31 + 48) = result;
  return result;
}

uint64_t sub_262962D90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26297C1F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t))(a2 + *(int *)(v8 + 28)))(a1);
  sub_26296A5F4(&qword_26A980450, MEMORY[0x263F188C0], 0x417373696D736944, (uint64_t)v7);
  sub_26297C1E0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_262962EB8()
{
  uint64_t v0 = sub_26297C000();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_26297BFE0();
  os_log_type_t v6 = sub_26297CB60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_262940000, v5, v6, "[AccountCreation - Startup] page viewed", v7, 2u);
    MEMORY[0x263E58CD0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_262963044@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804C8);
  uint64_t v6 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980528);
  uint64_t v10 = v9 - 8;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v27 = (uint64_t)&v27 - v14;
  sub_26296AE74(a1, (uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v16 = swift_allocObject();
  sub_26296AEDC((uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  sub_26297C890();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v15) = v30;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = swift_allocObject();
  *(unsigned char *)(v18 + 16) = v15;
  uint64_t v19 = v28;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v13, v8, v28);
  uint64_t v20 = (uint64_t *)&v13[*(int *)(v10 + 44)];
  *uint64_t v20 = KeyPath;
  v20[1] = (uint64_t)sub_26296CA80;
  v20[2] = v18;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  uint64_t v21 = v27;
  sub_26294758C((uint64_t)v13, v27, &qword_26A980528);
  sub_2629475F0(v21, (uint64_t)v13, &qword_26A980528);
  uint64_t v22 = v29;
  *uint64_t v29 = 0;
  *((unsigned char *)v22 + 8) = 1;
  uint64_t v23 = v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980550);
  sub_2629475F0((uint64_t)v13, (uint64_t)v23 + *(int *)(v24 + 48), &qword_26A980528);
  uint64_t v25 = (uint64_t)v23 + *(int *)(v24 + 64);
  *(void *)uint64_t v25 = 0;
  *(unsigned char *)(v25 + 8) = 1;
  sub_262947654(v21, &qword_26A980528);
  return sub_262947654((uint64_t)v13, &qword_26A980528);
}

uint64_t sub_262963444()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_26297C230();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccountCreationStartupPageView();
  sub_26296A5F4(&qword_26A980458, MEMORY[0x263F18948], 0x414C52556E65704FLL, (uint64_t)v6);
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v12[0] = 2777980912;
  v12[1] = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  sub_26297BEC0();

  swift_bridgeObjectRelease();
  sub_26297BF20();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_26297BF30();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v2, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_26297C220();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v2, v9);
  }
  return result;
}

uint64_t sub_262963704@<X0>(uint64_t a1@<X8>)
{
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_26297CAC0();
  sub_26297CAC0();
  sub_26297BEC0();

  swift_bridgeObjectRelease();
  sub_262947368();
  uint64_t result = sub_26297C660();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_262963834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v24 = a3;
  uint64_t v4 = sub_26297C290();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980560);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = sub_26297C430();
  *((void *)v13 + 1) = 0;
  v13[16] = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980568);
  sub_262963AC8(a2, &v13[*(int *)(v14 + 44)]);
  uint64_t v15 = sub_262979114();
  sub_26296AE74(a2, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + *(unsigned __int8 *)(v5 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v18 = swift_allocObject();
  sub_26296AEDC((uint64_t)v10, v18 + v16);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v18 + v17, (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v19 = v24;
  sub_2629475F0((uint64_t)v13, v24, &qword_26A980560);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980570);
  *(void *)(v19 + *(int *)(v20 + 52)) = v15;
  uint64_t v21 = (uint64_t (**)())(v19 + *(int *)(v20 + 56));
  *uint64_t v21 = sub_26296CD40;
  v21[1] = (uint64_t (*)())v18;
  return sub_262947654((uint64_t)v13, &qword_26A980560);
}

uint64_t sub_262963AC8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v66 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980578);
  uint64_t v63 = *(void *)(v3 - 8);
  uint64_t v64 = v3;
  MEMORY[0x270FA5388](v3);
  id v58 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980580);
  uint64_t v5 = MEMORY[0x270FA5388](v61);
  uint64_t v65 = (uint64_t)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  int v60 = (char *)&v51 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (uint64_t)&v51 - v9;
  uint64_t v10 = sub_26297C4C0();
  uint64_t v56 = *(void *)(v10 - 8);
  uint64_t v57 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980588);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980590);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v54 = v17;
  uint64_t v55 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980598);
  uint64_t v52 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v59 = (char *)&v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  os_log_type_t v26 = (char *)&v51 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v51 - v27;
  uint64_t v67 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805A0);
  uint64_t v29 = (uint64_t)v58;
  sub_262947E80(&qword_26A9805A8, &qword_26A9805A0);
  sub_26297C5D0();
  sub_26297C4B0();
  uint64_t v30 = sub_262947E80(&qword_26A9805B0, &qword_26A980588);
  sub_26297C710();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v57);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v31 = v52;
  uint64_t v69 = v13;
  uint64_t v70 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = v54;
  sub_26297C700();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v20, v32);
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v28, v26, v21);
  uint64_t v33 = v53;
  sub_262965B10(v29);
  uint64_t v34 = (char *)(v33 + *(int *)(type metadata accessor for AccountCreationStartupPageView() + 40));
  char v35 = *v34;
  uint64_t v36 = *((void *)v34 + 1);
  LOBYTE(v69) = v35;
  uint64_t v70 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C870();
  if (v68 == 1) {
    char v37 = sub_26297C540();
  }
  else {
    char v37 = sub_26297C530();
  }
  char v38 = v37;
  uint64_t v40 = v63;
  uint64_t v39 = v64;
  uint64_t v41 = (uint64_t)v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v60, v29, v64);
  uint64_t v42 = v41 + *(int *)(v61 + 36);
  *(unsigned char *)uint64_t v42 = v38;
  *(_OWORD *)(v42 + 8) = 0u;
  *(_OWORD *)(v42 + 24) = 0u;
  *(unsigned char *)(v42 + 40) = 1;
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v29, v39);
  uint64_t v43 = v62;
  sub_26294758C(v41, v62, &qword_26A980580);
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  uint64_t v45 = v59;
  v44(v59, v28, v21);
  uint64_t v46 = v65;
  sub_2629475F0(v43, v65, &qword_26A980580);
  uint64_t v47 = v66;
  v44(v66, v45, v21);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805B8);
  sub_2629475F0(v46, (uint64_t)&v47[*(int *)(v48 + 48)], &qword_26A980580);
  sub_262947654(v43, &qword_26A980580);
  uint64_t v49 = *(void (**)(char *, uint64_t))(v31 + 8);
  v49(v28, v21);
  sub_262947654(v46, &qword_26A980580);
  return ((uint64_t (*)(char *, uint64_t))v49)(v45, v21);
}

uint64_t sub_262964158@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805E0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v44 = (uint64_t)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v41 = (char *)&v39 - v6;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805E8);
  MEMORY[0x270FA5388](v40);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805F0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v42 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v39 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v45 = a1;
  sub_262964754((uint64_t)v8);
  sub_262964D8C(v47);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980600);
  sub_26296D034();
  sub_26296D3AC();
  sub_26296D470();
  sub_26297C920();
  uint64_t v18 = v10;
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v20 = v17;
  uint64_t v21 = (uint64_t)v41;
  uint64_t v22 = v9;
  v19(v17, v15, v9);
  uint64_t v23 = v21;
  sub_26296500C(v21);
  uint64_t v24 = (char *)(a1 + *(int *)(type metadata accessor for AccountCreationStartupPageView() + 40));
  char v25 = *v24;
  uint64_t v26 = *((void *)v24 + 1);
  LOBYTE(v47[0]) = v25;
  v47[1] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C870();
  if (v46 == 1)
  {
    id v27 = objc_msgSend(self, sel_systemBackgroundColor);
    v47[0] = MEMORY[0x263E57F90](v27);
    uint64_t v28 = sub_26297C8B0();
    uint64_t v29 = 1;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v28 = 1;
  }
  uint64_t v30 = v18;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v32 = v42;
  uint64_t v39 = v20;
  v31(v42, v20, v22);
  uint64_t v33 = v44;
  sub_2629475F0(v23, v44, &qword_26A9805E0);
  uint64_t v34 = v43;
  v31(v43, v32, v22);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806D0);
  sub_2629475F0(v33, (uint64_t)&v34[*(int *)(v35 + 48)], &qword_26A9805E0);
  uint64_t v36 = &v34[*(int *)(v35 + 64)];
  *(void *)uint64_t v36 = 0;
  *((void *)v36 + 1) = v29;
  *((void *)v36 + 2) = v28;
  sub_26296D4DC(0, v29, v28);
  sub_262947654(v23, &qword_26A9805E0);
  char v37 = *(void (**)(char *, uint64_t))(v30 + 8);
  v37(v39, v22);
  sub_26296D4F0(0, v29, v28);
  sub_262947654(v33, &qword_26A9805E0);
  return ((uint64_t (*)(char *, uint64_t))v37)(v32, v22);
}

uint64_t sub_262964584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980840);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806B0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_26297C410();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980848);
  sub_262966E44(a1, (uint64_t *)&v6[*(int *)(v11 + 44)]);
  sub_2629475F0((uint64_t)v6, (uint64_t)v10, &qword_26A980840);
  uint64_t v12 = &v10[*(int *)(v8 + 60)];
  *(void *)uint64_t v12 = 0xD000000000000013;
  *((void *)v12 + 1) = 0x8000000262980970;
  sub_262947654((uint64_t)v6, &qword_26A980840);
  id v13 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  v16[1] = MEMORY[0x263E57F90](v13);
  swift_retain();
  uint64_t v14 = sub_26297C8B0();
  sub_2629475F0((uint64_t)v10, a2, &qword_26A9806B0);
  swift_release();
  *(void *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A9805F8) + 36)) = v14;
  return sub_262947654((uint64_t)v10, &qword_26A9806B0);
}

uint64_t sub_262964754@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980830);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v49 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980838);
  uint64_t v3 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980648);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980638);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980628);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980618) - 8;
  MEMORY[0x270FA5388](v47);
  uint64_t v46 = (uint64_t)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262964BC4();
  char v19 = sub_26297C530();
  sub_26297C130();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v28 = v48;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v48);
  uint64_t v29 = &v9[*(int *)(v7 + 44)];
  *uint64_t v29 = v19;
  *((void *)v29 + 1) = v21;
  *((void *)v29 + 2) = v23;
  *((void *)v29 + 3) = v25;
  *((void *)v29 + 4) = v27;
  v29[40] = 0;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v28);
  char v30 = sub_26297C560();
  sub_2629475F0((uint64_t)v9, (uint64_t)v13, &qword_26A980648);
  uint64_t v31 = &v13[*(int *)(v11 + 44)];
  *uint64_t v31 = v30;
  *(_OWORD *)(v31 + 8) = 0u;
  *(_OWORD *)(v31 + 24) = 0u;
  v31[40] = 1;
  sub_262947654((uint64_t)v9, &qword_26A980648);
  sub_2629475F0((uint64_t)v13, (uint64_t)v17, &qword_26A980638);
  uint64_t v32 = &v17[*(int *)(v15 + 44)];
  v32[32] = 0;
  *(_OWORD *)uint64_t v32 = 0u;
  *((_OWORD *)v32 + 1) = 0u;
  sub_262947654((uint64_t)v13, &qword_26A980638);
  uint64_t v33 = sub_26297C7F0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = v46;
  sub_2629475F0((uint64_t)v17, v46, &qword_26A980628);
  uint64_t v36 = (uint64_t *)(v35 + *(int *)(v47 + 44));
  *uint64_t v36 = KeyPath;
  v36[1] = v33;
  sub_262947654((uint64_t)v17, &qword_26A980628);
  uint64_t v37 = sub_26297C640();
  uint64_t v38 = (uint64_t)v49;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v49, 1, 1, v37);
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805E8);
  uint64_t v41 = v50;
  uint64_t v42 = (uint64_t *)(v50 + *(int *)(v40 + 36));
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980698);
  sub_2629475F0(v38, (uint64_t)v42 + *(int *)(v43 + 28), &qword_26A980830);
  *uint64_t v42 = v39;
  sub_2629475F0(v35, v41, &qword_26A980618);
  sub_262947654(v38, &qword_26A980830);
  return sub_262947654(v35, &qword_26A980618);
}

uint64_t sub_262964BC4()
{
  uint64_t v1 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = sub_26297C430();
  sub_262966254(v0, (uint64_t)v10);
  v11[288] = 0;
  memcpy(&v11[7], v10, 0x113uLL);
  uint64_t KeyPath = swift_getKeyPath();
  v9[0] = v4;
  v9[1] = 0x4030000000000000;
  LOBYTE(v9[2]) = 0;
  memcpy((char *)&v9[2] + 1, v11, 0x11AuLL);
  v9[38] = KeyPath;
  LOBYTE(v9[39]) = 1;
  sub_26296AE74(v0, (uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  sub_26296AEDC((uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980650);
  sub_26296D2E8();
  sub_26297C6C0();
  swift_release();
  memcpy(v12, v9, 0x139uLL);
  return sub_26296E06C((uint64_t)v12);
}

uint64_t sub_262964D8C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v3 = HIBYTE(v24) & 0xF;
  if ((v24 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v23 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    sub_26297C1A0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_26297C080();
    swift_release();
    swift_release();
    swift_release();
    sub_262947368();
    uint64_t v4 = sub_26297C660();
    uint64_t v6 = v5;
    char v8 = v7 & 1;
    sub_26297C5C0();
    uint64_t v9 = sub_26297C650();
    uint64_t v11 = v10;
    char v13 = v12;
    swift_release();
    char v14 = v13 & 1;
    sub_2629476B0(v4, v6, v8);
    swift_bridgeObjectRelease();
    sub_26297C7B0();
    uint64_t v15 = sub_26297C630();
    uint64_t v17 = v16;
    char v19 = v18;
    uint64_t v21 = v20;
    swift_release();
    uint64_t v22 = v19 & 1;
    sub_2629476B0(v9, v11, v14);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
    uint64_t v22 = 0;
    uint64_t v21 = 0;
  }
  *a1 = v15;
  a1[1] = v17;
  a1[2] = v22;
  a1[3] = v21;
  return result;
}

uint64_t sub_26296500C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806D8);
  uint64_t v52 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v51 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806E0);
  MEMORY[0x270FA5388](v53);
  uint64_t v55 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v57 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806E8);
  uint64_t v50 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v49 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v58 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v48 - v11;
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v48 - v13;
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  uint64_t v15 = v1;
  swift_release();
  char v16 = v60;
  sub_26296AE74(v1, (uint64_t)v14);
  if (v16)
  {
    sub_26296E708((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
    sub_26296AE74(v1, (uint64_t)v12);
LABEL_4:
    sub_26296E708((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
    goto LABEL_5;
  }
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  uint64_t v15 = v1;
  swift_release();
  char v17 = v60;
  sub_26296E708((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
  sub_26296AE74(v1, (uint64_t)v12);
  if (v17) {
    goto LABEL_4;
  }
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  unint64_t v35 = *(void *)(v60 + 16);
  swift_bridgeObjectRelease();
  sub_26296E708((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
  if (v35 > 1)
  {
    _s18CurrentBundleClassCMa();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v37 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v60 = 2777980912;
    unint64_t v61 = 0xA400000000000000;
    sub_26297CAC0();
    sub_26297CAC0();
    uint64_t v38 = sub_26297BEC0();
    unint64_t v40 = v39;

    swift_bridgeObjectRelease();
    uint64_t v60 = v38;
    unint64_t v61 = v40;
    sub_262947368();
    uint64_t v60 = sub_26297C660();
    unint64_t v61 = v41;
    char v62 = v42 & 1;
    uint64_t v63 = v43;
    MEMORY[0x270FA5388](v60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980758);
    sub_26296D7B8();
    uint64_t v44 = v49;
    sub_26297C910();
    uint64_t v45 = v50;
    uint64_t v46 = v54;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v55, v44, v54);
    swift_storeEnumTagMultiPayload();
    sub_26296D990(&qword_26A980748, &qword_26A9806E8, (void (*)(void))sub_26296D7B8);
    sub_26296D990(&qword_26A980790, &qword_26A9806D8, (void (*)(void))sub_26296D5AC);
    uint64_t v32 = (uint64_t)v57;
    sub_26297C460();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v46);
    goto LABEL_9;
  }
LABEL_5:
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  int v18 = v60;
  uint64_t v19 = v58;
  sub_26296AE74(v15, v58);
  if (v18 == 1)
  {
    sub_26296E708(v19, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
LABEL_8:
    _s18CurrentBundleClassCMa();
    uint64_t v21 = swift_getObjCClassFromMetadata();
    id v22 = objc_msgSend(self, sel_bundleForClass_, v21);
    uint64_t v60 = 2777980912;
    unint64_t v61 = 0xA400000000000000;
    sub_26297CAC0();
    sub_26297CAC0();
    uint64_t v23 = sub_26297BEC0();
    unint64_t v25 = v24;

    swift_bridgeObjectRelease();
    uint64_t v60 = v23;
    unint64_t v61 = v25;
    sub_262947368();
    uint64_t v60 = sub_26297C660();
    unint64_t v61 = v26;
    char v62 = v27 & 1;
    uint64_t v63 = v28;
    MEMORY[0x270FA5388](v60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806F8);
    sub_26296D5AC();
    uint64_t v29 = v51;
    sub_26297C910();
    uint64_t v30 = v52;
    uint64_t v31 = v56;
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v55, v29, v56);
    swift_storeEnumTagMultiPayload();
    sub_26296D990(&qword_26A980748, &qword_26A9806E8, (void (*)(void))sub_26296D7B8);
    sub_26296D990(&qword_26A980790, &qword_26A9806D8, (void (*)(void))sub_26296D5AC);
    uint64_t v32 = (uint64_t)v57;
    sub_26297C460();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
LABEL_9:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806F0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 0, 1, v33);
    return sub_26294758C(v32, v59, &qword_26A9805E0);
  }
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  int v20 = v60;
  sub_26296E708(v19, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
  if (v20 == 1) {
    goto LABEL_8;
  }
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9806F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v59, 1, 1, v47);
}

uint64_t sub_262965B10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v2 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v25 = v1;
  v20[1] = _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1B0();
  swift_getKeyPath();
  sub_26297C250();
  swift_release();
  swift_release();
  uint64_t v24 = v33;
  uint64_t v23 = v34;
  int v22 = v35;
  sub_26296AE74(v1, (uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v21 = swift_allocObject();
  sub_26296AEDC((uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v5);
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v29 = 2777980912;
  unint64_t v30 = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v9 = sub_26297BEC0();
  uint64_t v11 = v10;

  swift_bridgeObjectRelease();
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  char v12 = v33;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = v12;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  unsigned __int8 v35 = v22;
  uint64_t v36 = sub_26296CE44;
  uint64_t v37 = v21;
  uint64_t v38 = v9;
  uint64_t v39 = v11;
  uint64_t v40 = KeyPath;
  unint64_t v41 = sub_26296EA68;
  uint64_t v42 = v14;
  id v15 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v29 = 2777980912;
  unint64_t v30 = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v16 = sub_26297BEC0();
  uint64_t v18 = v17;

  swift_bridgeObjectRelease();
  uint64_t v31 = v16;
  uint64_t v32 = v18;
  sub_26297C1B0();
  swift_getKeyPath();
  sub_26297C250();
  swift_release();
  swift_release();
  uint64_t v28 = v25;
  uint64_t v27 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804C8);
  sub_26296CF1C();
  sub_262947368();
  sub_262947E80(&qword_26A9804E0, &qword_26A9804C8);
  sub_26297C6E0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2629660E0()
{
  return swift_release();
}

uint64_t sub_262966158(double a1)
{
  BOOL v1 = a1 > 0.0;
  type metadata accessor for AccountCreationStartupPageView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C880();
  uint64_t result = sub_26297C870();
  if (v1)
  {
    sub_26297C990();
    return sub_26297C280();
  }
  return result;
}

void sub_262966254(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = MEMORY[0x263E57F90](objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.784313725, 0.956862745, 1.0, 1.0));
  sub_26297B358(v37[0], v4, v30);
  uint64_t v5 = sub_26297C430();
  sub_262966694(a1, (uint64_t)v31);
  char v34 = 0;
  *(_OWORD *)&v33[71] = v31[4];
  *(_OWORD *)&v33[55] = v31[3];
  *(_OWORD *)&v33[119] = v31[7];
  *(_OWORD *)&v33[135] = v31[8];
  *(_OWORD *)&v33[151] = *(_OWORD *)v32;
  *(_OWORD *)&v33[162] = *(_OWORD *)&v32[11];
  *(_OWORD *)&v33[87] = v31[5];
  *(_OWORD *)&v33[103] = v31[6];
  *(_OWORD *)&v33[7] = v31[0];
  *(_OWORD *)&v33[23] = v31[1];
  *(_OWORD *)&v33[39] = v31[2];
  *(void *)&long long v35 = v5;
  *((void *)&v35 + 1) = 0x4010000000000000;
  v36[0] = 0;
  long long v6 = *(_OWORD *)&v33[48];
  *(_OWORD *)&v36[49] = *(_OWORD *)&v33[48];
  long long v7 = *(_OWORD *)&v33[32];
  *(_OWORD *)&v36[33] = *(_OWORD *)&v33[32];
  long long v8 = *(_OWORD *)&v33[16];
  *(_OWORD *)&v36[17] = *(_OWORD *)&v33[16];
  long long v9 = *(_OWORD *)v33;
  *(_OWORD *)&v36[1] = *(_OWORD *)v33;
  long long v10 = *(_OWORD *)&v33[112];
  *(_OWORD *)&v36[113] = *(_OWORD *)&v33[112];
  long long v11 = *(_OWORD *)&v33[96];
  *(_OWORD *)&v36[97] = *(_OWORD *)&v33[96];
  long long v12 = *(_OWORD *)&v33[80];
  *(_OWORD *)&v36[81] = *(_OWORD *)&v33[80];
  long long v13 = *(_OWORD *)&v33[64];
  *(_OWORD *)&v36[65] = *(_OWORD *)&v33[64];
  long long v14 = *(_OWORD *)&v33[160];
  *(_OWORD *)&v36[161] = *(_OWORD *)&v33[160];
  long long v15 = *(_OWORD *)&v33[144];
  *(_OWORD *)&v36[145] = *(_OWORD *)&v33[144];
  long long v16 = *(_OWORD *)&v33[128];
  *(_OWORD *)&v36[129] = *(_OWORD *)&v33[128];
  long long v17 = *(_OWORD *)&v36[160];
  *(_OWORD *)(a2 + 240) = *(_OWORD *)&v36[144];
  *(_OWORD *)(a2 + 256) = v17;
  long long v18 = *(_OWORD *)&v36[96];
  *(_OWORD *)(a2 + 176) = *(_OWORD *)&v36[80];
  *(_OWORD *)(a2 + 192) = v18;
  long long v19 = *(_OWORD *)&v36[128];
  *(_OWORD *)(a2 + 208) = *(_OWORD *)&v36[112];
  *(_OWORD *)(a2 + 224) = v19;
  long long v20 = *(_OWORD *)&v36[32];
  *(_OWORD *)(a2 + 112) = *(_OWORD *)&v36[16];
  *(_OWORD *)(a2 + 128) = v20;
  long long v21 = *(_OWORD *)&v36[64];
  *(_OWORD *)(a2 + 144) = *(_OWORD *)&v36[48];
  *(_OWORD *)(a2 + 160) = v21;
  long long v22 = *(_OWORD *)v36;
  *(_OWORD *)(a2 + 80) = v35;
  *(_OWORD *)(a2 + 96) = v22;
  *(double *)(a2 + 8) = v30[1];
  *(double *)(a2 + 24) = v30[3];
  *(double *)(a2 + 40) = v30[5];
  *(double *)(a2 + 56) = v30[7];
  long long v47 = v16;
  long long v48 = v15;
  long long v49 = v14;
  double v23 = v30[0];
  double v24 = v30[2];
  double v25 = v30[4];
  double v26 = v30[6];
  double v27 = v30[8];
  double v28 = v30[9];
  *(_WORD *)&v36[177] = *(_WORD *)&v33[176];
  *(_DWORD *)(a2 + 271) = *(_DWORD *)&v36[175];
  *(double *)a2 = v23;
  *(double *)(a2 + 16) = v24;
  *(double *)(a2 + 32) = v25;
  *(double *)(a2 + 48) = v26;
  *(double *)(a2 + 64) = v27;
  *(double *)(a2 + 72) = v28;
  v37[0] = v5;
  v37[1] = 0x4010000000000000;
  char v38 = 0;
  __int16 v50 = *(_WORD *)&v33[176];
  long long v43 = v13;
  long long v44 = v12;
  long long v45 = v11;
  long long v46 = v10;
  long long v39 = v9;
  long long v40 = v8;
  long long v41 = v7;
  long long v42 = v6;
  swift_retain();
  swift_retain();
  id v29 = *(id *)&v23;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_26296E1E8((uint64_t)&v35);
  sub_26296E2F0((uint64_t)v37);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_262966694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v61 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v3 = MEMORY[0x270FA5388](v61);
  uint64_t v59 = (uint64_t)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  char v62 = (char *)&v56 - v5;
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v57 = self;
  uint64_t v58 = ObjCClassFromMetadata;
  id v7 = objc_msgSend(v57, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v70 = 2777980912;
  unint64_t v71 = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v8 = sub_26297BEC0();
  unint64_t v10 = v9;

  swift_bridgeObjectRelease();
  uint64_t v70 = v8;
  unint64_t v71 = v10;
  unint64_t v56 = sub_262947368();
  uint64_t v11 = sub_26297C660();
  uint64_t v13 = v12;
  LOBYTE(v10) = v14 & 1;
  sub_26297C580();
  uint64_t v15 = sub_26297C650();
  uint64_t v17 = v16;
  char v19 = v18;
  swift_release();
  sub_2629476B0(v11, v13, v10);
  swift_bridgeObjectRelease();
  sub_26297C5A0();
  uint64_t v20 = sub_26297C5E0();
  uint64_t v67 = v21;
  uint64_t v68 = v20;
  int v65 = v22;
  uint64_t v63 = v23;
  sub_2629476B0(v15, v17, v19 & 1);
  uint64_t v24 = v60;
  swift_bridgeObjectRelease();
  int v25 = sub_26297C530();
  uint64_t KeyPath = swift_getKeyPath();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  uint64_t v26 = (uint64_t)v62;
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v8) = v70;
  sub_26296AE74(v24, v26);
  int v64 = v25;
  if (v8)
  {
    sub_26296E708(v26, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
    uint64_t v27 = v59;
    sub_26296AE74(v24, v59);
LABEL_4:
    sub_26296E708(v27, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
    goto LABEL_5;
  }
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  char v28 = v70;
  sub_26296E708(v26, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
  uint64_t v27 = v59;
  sub_26296AE74(v24, v59);
  if (v28) {
    goto LABEL_4;
  }
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v55 = *(void *)(v70 + 16);
  swift_bridgeObjectRelease();
  sub_26296E708(v27, (uint64_t (*)(void))type metadata accessor for AccountCreationStartupPageView);
  if (!v55)
  {
    uint64_t v61 = 0;
    char v62 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v43 = 0;
    int v44 = 0;
    goto LABEL_6;
  }
LABEL_5:
  id v29 = objc_msgSend(v57, sel_bundleForClass_, v58);
  uint64_t v70 = 2777980912;
  unint64_t v71 = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v30 = sub_26297BEC0();
  unint64_t v32 = v31;

  swift_bridgeObjectRelease();
  uint64_t v70 = v30;
  unint64_t v71 = v32;
  uint64_t v33 = sub_26297C660();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  sub_26297C590();
  uint64_t v38 = sub_26297C650();
  uint64_t v61 = v39;
  char v62 = (char *)v38;
  char v41 = v40;
  uint64_t v60 = v42;
  swift_release();
  uint64_t v59 = v41 & 1;
  sub_2629476B0(v33, v35, v37);
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_26297C530();
  int v44 = 65537;
LABEL_6:
  char v45 = v65 & 1;
  LOBYTE(v70) = v65 & 1;
  char v69 = 1;
  uint64_t v47 = v67;
  uint64_t v46 = v68;
  *(void *)a2 = v68;
  *(void *)(a2 + 8) = v47;
  uint64_t v48 = v46;
  *(unsigned char *)(a2 + 16) = v45;
  uint64_t v49 = (uint64_t)v62;
  *(void *)(a2 + 24) = v63;
  *(unsigned char *)(a2 + 32) = v64;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(unsigned char *)(a2 + 72) = 1;
  *(void *)(a2 + 80) = KeyPath;
  *(void *)(a2 + 88) = 0x3FE999999999999ALL;
  uint64_t v50 = v61;
  *(void *)(a2 + 96) = v49;
  *(void *)(a2 + 104) = v50;
  char v51 = v59;
  *(void *)(a2 + 112) = v59;
  uint64_t v52 = a2;
  uint64_t v53 = v60;
  *(void *)(v52 + 120) = v60;
  *(void *)(v52 + 128) = v43;
  *(_OWORD *)(v52 + 152) = 0u;
  *(_OWORD *)(v52 + 136) = 0u;
  *(unsigned char *)(v52 + 170) = BYTE2(v44);
  *(_WORD *)(v52 + 168) = v44;
  sub_2629477E8(v48, v47, v45);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_26296E2AC(v49, v50, v51, v53);
  sub_26296E1A4(v49, v50, v51, v53);
  sub_2629476B0(v68, v47, v45);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_262966DD4()
{
  return sub_26297C140();
}

uint64_t sub_262966E44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v3 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v4 = v3 - 8;
  uint64_t v71 = *(void *)(v3 - 8);
  uint64_t v70 = *(void *)(v71 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v69 = (uint64_t)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = type metadata accessor for iCloudMailTextField();
  MEMORY[0x270FA5388](v68);
  id v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980850);
  uint64_t v73 = *(void *)(v8 - 8);
  uint64_t v74 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  os_log_type_t v76 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v72 = (char *)&v53 - v11;
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v63 = ObjCClassFromMetadata;
  id v62 = self;
  id v13 = objc_msgSend(v62, sel_bundleForClass_, ObjCClassFromMetadata);
  *(void *)&long long v79 = 2777980912;
  *((void *)&v79 + 1) = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v14 = sub_26297BEC0();
  uint64_t v16 = v15;

  swift_bridgeObjectRelease();
  *(void *)&long long v79 = v14;
  *((void *)&v79 + 1) = v16;
  sub_262947368();
  uint64_t v17 = sub_26297C660();
  uint64_t v19 = v18;
  LOBYTE(v16) = v20 & 1;
  sub_26297C5A0();
  uint64_t v67 = sub_26297C5E0();
  uint64_t v65 = v21;
  uint64_t v66 = v22;
  int v64 = v23 & 1;
  sub_2629476B0(v17, v19, v16);
  swift_bridgeObjectRelease();
  uint64_t v61 = a1;
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1B0();
  swift_getKeyPath();
  sub_26297C250();
  swift_release();
  swift_release();
  long long v60 = v82;
  uint64_t v59 = v83;
  uint64_t v58 = v84;
  uint64_t v24 = (unsigned __int8 *)(a1 + *(int *)(v4 + 44));
  int v57 = *v24;
  uint64_t v55 = *((void *)v24 + 1);
  int v56 = v24[16];
  swift_retain();
  uint64_t v25 = sub_26297C1A0();
  uint64_t v26 = *(void *)(v25 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_domain + 8);
  uint64_t v54 = *(void *)(v25 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_domain);
  swift_bridgeObjectRetain();
  swift_release();
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v4) = v79;
  id v27 = objc_msgSend(v62, sel_bundleForClass_, v63);
  *(void *)&long long v79 = 2777980912;
  *((void *)&v79 + 1) = 0xA400000000000000;
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v28 = sub_26297BEC0();
  uint64_t v30 = v29;

  swift_bridgeObjectRelease();
  *(_OWORD *)id v7 = v60;
  uint64_t v31 = v58;
  *((void *)v7 + 2) = v59;
  *((void *)v7 + 3) = v31;
  v7[32] = v57;
  *((void *)v7 + 5) = v55;
  v7[48] = v56;
  *((void *)v7 + 7) = v54;
  *((void *)v7 + 8) = v26;
  v7[72] = v4;
  *((void *)v7 + 10) = v28;
  *((void *)v7 + 11) = v30;
  type metadata accessor for CGRect(0);
  long long v77 = 0u;
  long long v78 = 0u;
  sub_26297C860();
  uint64_t v32 = v81;
  long long v33 = v80;
  *((_OWORD *)v7 + 6) = v79;
  *((_OWORD *)v7 + 7) = v33;
  *((void *)v7 + 16) = v32;
  LOBYTE(v77) = 0;
  sub_26297C860();
  uint64_t v34 = *((void *)&v79 + 1);
  v7[136] = v79;
  *((void *)v7 + 18) = v34;
  sub_26297C610();
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v35 = v69;
  sub_26296AE74(v61, v69);
  unint64_t v36 = (*(unsigned __int8 *)(v71 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
  uint64_t v37 = swift_allocObject();
  sub_26296AEDC(v35, v37 + v36);
  sub_26296E934(&qword_26A980858, (void (*)(uint64_t))type metadata accessor for iCloudMailTextField);
  uint64_t v38 = v76;
  sub_26297C790();
  swift_release();
  swift_bridgeObjectRelease();
  sub_26296E708((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for iCloudMailTextField);
  char v40 = v72;
  uint64_t v39 = v73;
  uint64_t v41 = v74;
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v72, v38, v74);
  uint64_t v42 = v39;
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  int v44 = v38;
  uint64_t v45 = v41;
  v43(v44, v40, v41);
  uint64_t v46 = v75;
  uint64_t v47 = v67;
  uint64_t v48 = v65;
  *uint64_t v75 = v67;
  v46[1] = v48;
  LOBYTE(v39) = v64;
  *((unsigned char *)v46 + 16) = v64;
  v46[3] = v66;
  uint64_t v49 = (char *)v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980860) + 48);
  uint64_t v50 = v76;
  v43(v49, v76, v45);
  sub_2629477E8(v47, v48, v39);
  char v51 = *(void (**)(char *, uint64_t))(v42 + 8);
  swift_bridgeObjectRetain();
  v51(v40, v45);
  v51(v50, v45);
  sub_2629476B0(v47, v48, v39);
  return swift_bridgeObjectRelease();
}

uint64_t sub_26296770C@<X0>(void *a1@<X8>)
{
  return sub_26296AB30(a1);
}

uint64_t sub_262967720()
{
  return sub_26296ABC0();
}

uint64_t sub_262967734(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2[1];
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v14 == 1)
  {
    sub_26297C1A0();
    uint64_t v5 = *(void *)(sub_26297C1A0()
                   + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_validationRules);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v13 = v2;
    uint64_t v6 = sub_26296EB54(v5);
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    if (v8) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v8) {
      unint64_t v10 = v8;
    }
    else {
      unint64_t v10 = 0xE000000000000000;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_26297C090();
    sub_26297C1A0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_26297C080();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    if ((v10 & 0x2000000000000000) != 0) {
      uint64_t v11 = HIBYTE(v10) & 0xF;
    }
    else {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
    }
    sub_26297C1A0();
    if (v11)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      return sub_26297C090();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_26297C080();
      swift_release();
      swift_release();
      swift_release();
      char v12 = sub_262967B18(v13, v3, (void *)v9);
      swift_bridgeObjectRelease();
      sub_26297C1A0();
      if (v12)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        sub_26297C090();
        sub_26297C1A0();
        swift_getKeyPath();
        swift_getKeyPath();
        return sub_26297C090();
      }
      else
      {
        sub_26295BBE4(v13, v3);
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_262967B18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_26297CDE0();
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
    if (v12 || (sub_26297CDE0() & 1) != 0) {
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

uint64_t sub_262967BE0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_262967C44(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_26296AE74(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_26296AEDC((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980768);
  sub_262947E80(&qword_26A980798, &qword_26A9802C8);
  sub_26296D82C();
  return sub_26297C900();
}

uint64_t sub_262967EA0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v5 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980788);
  uint64_t v8 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  unint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980778);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v29 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  uint64_t v15 = a1[1];
  sub_26296AE74(a2, (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = swift_allocObject();
  sub_26296AEDC((uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  uint64_t v18 = (void *)(v17 + ((v7 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  void *v18 = v14;
  v18[1] = v15;
  uint64_t v32 = v14;
  uint64_t v33 = v15;
  uint64_t v34 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807A0);
  sub_262947E80(&qword_26A9807A8, &qword_26A9807A0);
  sub_26297C890();
  uint64_t v19 = sub_26297C7F0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = (uint64_t)v29;
  uint64_t v22 = v30;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v29, v10, v30);
  char v23 = (uint64_t *)(v21 + *(int *)(v12 + 44));
  uint64_t *v23 = KeyPath;
  v23[1] = v19;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v22);
  id v24 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  uint64_t v35 = MEMORY[0x263E57F90](v24);
  swift_retain();
  uint64_t v25 = sub_26297C8B0();
  uint64_t v26 = v31;
  sub_2629475F0(v21, v31, &qword_26A980778);
  swift_release();
  *(void *)(v26 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980768) + 36)) = v25;
  return sub_262947654(v21, &qword_26A980778);
}

uint64_t sub_2629681F8()
{
  return sub_26297C090();
}

uint64_t sub_2629682EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = sub_26297C410();
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807B0);
  return sub_262968350(a1, a2, a3, a4 + *(int *)(v8 + 44));
}

uint64_t sub_262968350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v58 = a3;
  uint64_t v59 = a2;
  uint64_t v60 = a1;
  uint64_t v63 = a4;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807B8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v64 = (uint64_t)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v62 = (char *)&v50 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807C0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v66 = (uint64_t *)((char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v65 = sub_26297C260();
  uint64_t v11 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807C8);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v61 = (uint64_t)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  char v20 = (char *)&v50 - v19;
  MEMORY[0x270FA5388](v18);
  int v57 = (char *)&v50 - v21;
  uint64_t v55 = sub_26297C410();
  sub_262968A0C((uint64_t)&v67);
  uint64_t v23 = v67;
  uint64_t v22 = v68;
  char v24 = v69;
  uint64_t v50 = v70;
  uint64_t v53 = v71;
  uint64_t v52 = v72;
  int v51 = v73;
  uint64_t v54 = v74;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = *MEMORY[0x263F18DC8];
  id v27 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
  uint64_t v28 = v13;
  int v56 = v13;
  uint64_t v29 = v13;
  uint64_t v30 = v65;
  v27(v29, v26, v65);
  uint64_t v31 = *(int *)(v9 + 36);
  uint64_t v32 = v66;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))((uint64_t)v66 + v31, v28, v30);
  *uint64_t v32 = KeyPath;
  sub_2629475F0((uint64_t)v32, (uint64_t)&v20[*(int *)(v15 + 44)], &qword_26A9807C0);
  uint64_t v33 = v54;
  *(void *)char v20 = v55;
  *((void *)v20 + 1) = 0;
  v20[16] = 0;
  *((void *)v20 + 3) = v23;
  *((void *)v20 + 4) = v22;
  v20[40] = v24;
  uint64_t v34 = v53;
  *((void *)v20 + 6) = v50;
  *((void *)v20 + 7) = v34;
  uint64_t v35 = v52;
  *((void *)v20 + 8) = v52;
  LOBYTE(v30) = v51;
  v20[72] = v51;
  *((void *)v20 + 10) = v33;
  sub_2629477E8(v23, v22, v24);
  swift_bridgeObjectRetain();
  sub_2629477E8(v34, v35, v30);
  swift_bridgeObjectRetain();
  sub_262947654((uint64_t)v66, &qword_26A9807C0);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v56, v65);
  uint64_t v36 = (uint64_t)v57;
  sub_2629476B0(v23, v22, v24);
  swift_bridgeObjectRelease();
  sub_2629476B0(v34, v35, v30);
  swift_bridgeObjectRelease();
  sub_26294758C((uint64_t)v20, v36, &qword_26A9807C8);
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  if (v67 == v60 && v68 == v59)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v37 = sub_26297CDE0();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807D0);
      uint64_t v41 = (uint64_t)v62;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v62, 1, 1, v43);
      goto LABEL_7;
    }
  }
  uint64_t v38 = sub_26297C820();
  uint64_t v39 = sub_26297C7C0();
  uint64_t v40 = swift_getKeyPath();
  uint64_t v67 = v38;
  uint64_t v68 = v40;
  uint64_t v69 = v39;
  sub_26297C5B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807E0);
  sub_26296DDFC();
  uint64_t v41 = (uint64_t)v62;
  sub_26297C690();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807D0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 0, 1, v42);
LABEL_7:
  uint64_t v44 = v61;
  sub_2629475F0(v36, v61, &qword_26A9807C8);
  uint64_t v45 = v64;
  sub_2629475F0(v41, v64, &qword_26A9807B8);
  uint64_t v46 = v63;
  sub_2629475F0(v44, v63, &qword_26A9807C8);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807D8);
  uint64_t v48 = v46 + *(int *)(v47 + 48);
  *(void *)uint64_t v48 = 0;
  *(unsigned char *)(v48 + 8) = 1;
  sub_2629475F0(v45, v46 + *(int *)(v47 + 64), &qword_26A9807B8);
  sub_262947654(v41, &qword_26A9807B8);
  sub_262947654(v36, &qword_26A9807C8);
  sub_262947654(v45, &qword_26A9807B8);
  return sub_262947654(v44, &qword_26A9807C8);
}

uint64_t sub_262968A0C@<X0>(uint64_t a1@<X8>)
{
  sub_262947368();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_26297C660();
  uint64_t v20 = v3;
  uint64_t v21 = v2;
  uint64_t v22 = v4;
  char v19 = v5 & 1;
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v6 = sub_26297C660();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_26297C800();
  uint64_t v11 = sub_26297C630();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  swift_release();
  v15 &= 1u;
  sub_2629476B0(v6, v8, v10);
  swift_bridgeObjectRelease();
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v20;
  *(unsigned char *)(a1 + 16) = v19;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = v11;
  *(void *)(a1 + 40) = v13;
  *(unsigned char *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v17;
  sub_2629477E8(v21, v20, v19);
  swift_bridgeObjectRetain();
  sub_2629477E8(v11, v13, v15);
  swift_bridgeObjectRetain();
  sub_2629476B0(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_2629476B0(v21, v20, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_262968C28()
{
  return sub_26297C300();
}

uint64_t sub_262968C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26296ADA4(a1, a2, a3, a4, MEMORY[0x263F18DD8], MEMORY[0x263F19340]);
}

uint64_t sub_262968C78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v26[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980740);
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980730);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980720);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980710);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v5 = sub_26297C430();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807F0);
  sub_262968F90(a1, (uint64_t)&v5[*(int *)(v17 + 44)]);
  uint64_t v18 = sub_26297C940();
  sub_262961028(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v8, 0.0, 1, 0.0, 1, v18, v19, &qword_26A980740, &qword_26A980730);
  sub_262947654((uint64_t)v5, &qword_26A980740);
  LOBYTE(a1) = sub_26297C570();
  sub_2629475F0((uint64_t)v8, (uint64_t)v12, &qword_26A980730);
  uint64_t v20 = &v12[*(int *)(v10 + 44)];
  *uint64_t v20 = a1;
  *(_OWORD *)(v20 + 8) = 0u;
  *(_OWORD *)(v20 + 24) = 0u;
  v20[40] = 1;
  sub_262947654((uint64_t)v8, &qword_26A980730);
  LOBYTE(a1) = sub_26297C570();
  sub_2629475F0((uint64_t)v12, (uint64_t)v16, &qword_26A980720);
  uint64_t v21 = &v16[*(int *)(v14 + 44)];
  *uint64_t v21 = a1;
  *(_OWORD *)(v21 + 8) = 0u;
  *(_OWORD *)(v21 + 24) = 0u;
  unsigned char v21[40] = 1;
  sub_262947654((uint64_t)v12, &qword_26A980720);
  id v22 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  v26[1] = MEMORY[0x263E57F90](v22);
  swift_retain();
  uint64_t v23 = sub_26297C8B0();
  uint64_t v24 = v26[0];
  sub_2629475F0((uint64_t)v16, v26[0], &qword_26A980710);
  swift_release();
  *(void *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A9806F8) + 36)) = v23;
  return sub_262947654((uint64_t)v16, &qword_26A980710);
}

uint64_t sub_262968F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a2;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC20);
  uint64_t v70 = *(void (***)(uint64_t, char *, uint64_t))(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v4 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807F8);
  MEMORY[0x270FA5388](v81);
  uint64_t v82 = (uint64_t)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980800);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (void (**)(uint64_t, char *, uint64_t))((char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980808);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v83 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v71 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v72 = v12;
  uint64_t v73 = (uint64_t)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9804C8);
  uint64_t v76 = *(void *)(v13 - 8);
  uint64_t v77 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v75 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980810);
  uint64_t v15 = MEMORY[0x270FA5388](v74);
  uint64_t v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v78 = a1;
  uint64_t v79 = (uint64_t)&v65 - v18;
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v80 = v6;
  if (v86 == 1)
  {
    _s18CurrentBundleClassCMa();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v66 = ObjCClassFromMetadata;
    id v65 = self;
    id v20 = objc_msgSend(v65, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v86 = 2777980912;
    unint64_t v87 = 0xA400000000000000;
    sub_26297CAC0();
    sub_26297CAC0();
    uint64_t v21 = sub_26297BEC0();
    unint64_t v23 = v22;

    swift_bridgeObjectRelease();
    uint64_t v86 = v21;
    unint64_t v87 = v23;
    unint64_t v69 = sub_262947368();
    uint64_t v24 = sub_26297C660();
    uint64_t v26 = v25;
    LOBYTE(v23) = v27 & 1;
    sub_26297C5C0();
    uint64_t v28 = sub_26297C650();
    uint64_t v70 = v8;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    char v33 = v32;
    swift_release();
    sub_2629476B0(v24, v26, v23);
    swift_bridgeObjectRelease();
    sub_26297C800();
    uint64_t v34 = sub_26297C630();
    uint64_t v67 = v35;
    LOBYTE(v23) = v36;
    uint64_t v68 = v37;
    swift_release();
    LOBYTE(v26) = v23 & 1;
    sub_2629476B0(v29, v31, v33 & 1);
    swift_bridgeObjectRelease();
    id v38 = objc_msgSend(v65, sel_bundleForClass_, v66);
    uint64_t v86 = 2777980912;
    unint64_t v87 = 0xA400000000000000;
    sub_26297CAC0();
    sub_26297CAC0();
    uint64_t v39 = sub_26297BEC0();
    unint64_t v41 = v40;

    swift_bridgeObjectRelease();
    uint64_t v86 = v39;
    unint64_t v87 = v41;
    uint64_t v42 = v73;
    sub_26296AE74(v78, v73);
    unint64_t v43 = (*(unsigned __int8 *)(v71 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
    uint64_t v44 = swift_allocObject();
    sub_26296AEDC(v42, v44 + v43);
    uint64_t v45 = v75;
    sub_26297C8A0();
    uint64_t v46 = sub_26297C5C0();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v49 = v76;
    uint64_t v48 = v77;
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v17, v45, v77);
    uint64_t v50 = (uint64_t *)&v17[*(int *)(v74 + 36)];
    *uint64_t v50 = KeyPath;
    v50[1] = v46;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v45, v48);
    uint64_t v51 = v79;
    sub_26294758C((uint64_t)v17, v79, &qword_26A980810);
    sub_2629475F0(v51, (uint64_t)v17, &qword_26A980810);
    uint64_t v52 = (uint64_t)v70;
    uint64_t v53 = v67;
    *uint64_t v70 = (void (*)(uint64_t, char *, uint64_t))v34;
    *(void *)(v52 + 8) = v53;
    *(unsigned char *)(v52 + 16) = v26;
    *(void *)(v52 + 24) = v68;
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980828);
    sub_2629475F0((uint64_t)v17, v52 + *(int *)(v54 + 48), &qword_26A980810);
    sub_2629477E8(v34, v53, v26);
    swift_bridgeObjectRetain();
    sub_2629477E8(v34, v53, v26);
    swift_bridgeObjectRetain();
    sub_262947654((uint64_t)v17, &qword_26A980810);
    sub_2629476B0(v34, v53, v26);
    swift_bridgeObjectRelease();
    sub_2629475F0(v52, v82, &qword_26A980800);
    swift_storeEnumTagMultiPayload();
    sub_262947E80(&qword_26A980820, &qword_26A980800);
    sub_262947E80(&qword_26A97FC18, &qword_26A97FC20);
    uint64_t v55 = v83;
    sub_26297C460();
    sub_262947654(v52, &qword_26A980800);
    sub_262947654(v51, &qword_26A980810);
    sub_2629476B0(v34, v53, v26);
    swift_bridgeObjectRelease();
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980818);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v55, 0, 1, v56);
    uint64_t v57 = (uint64_t)v55;
    return sub_26294758C(v57, v85, &qword_26A980808);
  }
  uint64_t v58 = v82;
  uint64_t v60 = v83;
  uint64_t v59 = v84;
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  if (v86 == 1)
  {
    sub_26297C1C0();
    uint64_t v61 = v70;
    v70[2](v58, v4, v59);
    swift_storeEnumTagMultiPayload();
    sub_262947E80(&qword_26A980820, &qword_26A980800);
    sub_262947E80(&qword_26A97FC18, &qword_26A97FC20);
    sub_26297C460();
    ((void (*)(char *, uint64_t))v61[1])(v4, v59);
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980818);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v60, 0, 1, v62);
    uint64_t v57 = (uint64_t)v60;
    return sub_26294758C(v57, v85, &qword_26A980808);
  }
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980818);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v85, 1, 1, v64);
}

uint64_t sub_262969A8C()
{
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  sub_262959CB8();
  return swift_release();
}

uint64_t sub_262969B40@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_262969B54()
{
  return sub_26296AD34();
}

uint64_t sub_262969B68()
{
  return sub_26297C090();
}

uint64_t sub_262969C88@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_262969C9C()
{
  return sub_26296AD34();
}

uint64_t sub_262969CB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_26297CAC0();
  sub_26297CAC0();
  uint64_t v7 = sub_26297BEC0();
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  v13[0] = v7;
  v13[1] = v9;
  sub_26296AE74(a1, (uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  sub_26296AEDC((uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  sub_262947368();
  return sub_26297C8A0();
}

uint64_t sub_262969EA4()
{
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  sub_26295C8DC();
  return swift_release();
}

uint64_t sub_262969F58@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800A8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_26297F1A0;
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_26296E934(&qword_26A980500, (void (*)(uint64_t))_s9ViewModelCMa);
  sub_26297C1A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  swift_release();
  swift_release();
  sub_26297C1A0();
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRetain();
  sub_26297CAC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 64) = sub_262952170();
  *(void *)(v2 + 32) = v9;
  *(void *)(v2 + 40) = v10;
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_26297CAC0();
  sub_26297CAC0();
  sub_26297BEC0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_26297CA70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_262947368();
  uint64_t result = sub_26297C660();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_26296A234@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980490);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v1;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980498);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804A0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804A8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804B0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804B8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804C0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804C8);
  uint64_t v10 = sub_262947E80(&qword_26A9804D0, &qword_26A9804C0);
  unint64_t v11 = sub_26296A54C();
  uint64_t v12 = sub_262947E80(&qword_26A9804E0, &qword_26A9804C8);
  uint64_t v26 = v8;
  char v27 = &type metadata for MSError;
  uint64_t v28 = v9;
  unint64_t v29 = v10;
  unint64_t v30 = v11;
  uint64_t v31 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_262947E80(&qword_26A9804E8, &qword_26A9804B8);
  uint64_t v26 = v6;
  char v27 = (ValueMetadata *)v7;
  uint64_t v28 = OpaqueTypeConformance2;
  unint64_t v29 = v14;
  uint64_t v15 = swift_getOpaqueTypeConformance2();
  uint64_t v26 = v21;
  char v27 = (ValueMetadata *)v15;
  uint64_t v16 = swift_getOpaqueTypeConformance2();
  unint64_t v17 = sub_26296A5A0();
  uint64_t v26 = v22;
  char v27 = &type metadata for AccountCreationFinishView;
  uint64_t v28 = v16;
  unint64_t v29 = v17;
  swift_getOpaqueTypeConformance2();
  sub_26297C270();
  uint64_t v18 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v24, v5, v2);
  uint64_t v19 = (uint64_t (**)())(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A9804F8) + 36));
  *uint64_t v19 = sub_262962EB8;
  v19[1] = 0;
  v19[2] = 0;
  v19[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_26296A544@<X0>(uint64_t a1@<X8>)
{
  return sub_262961550(*(void *)(v1 + 16), a1);
}

unint64_t sub_26296A54C()
{
  unint64_t result = qword_26A9804D8;
  if (!qword_26A9804D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9804D8);
  }
  return result;
}

unint64_t sub_26296A5A0()
{
  unint64_t result = qword_26A9804F0;
  if (!qword_26A9804F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9804F0);
  }
  return result;
}

uint64_t sub_26296A5F4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = v4;
  uint64_t v10 = sub_26297C400();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2629475F0(v8, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a4, v16, v17);
  }
  else
  {
    os_log_type_t v19 = sub_26297CB80();
    id v20 = sub_26297C510();
    os_log_type_t v21 = v19;
    if (os_log_type_enabled(v20, v19))
    {
      v24[1] = a4;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      v24[2] = sub_26296B1B8(a3, 0xED00006E6F697463, &v25);
      sub_26297CC40();
      _os_log_impl(&dword_262940000, v20, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E58CD0](v23, -1, -1);
      MEMORY[0x263E58CD0](v22, -1, -1);
    }

    sub_26297C3F0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_26296A8B0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_26296A930(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_26297C090();
}

uint64_t sub_26296A9A8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_26296AA28()
{
  return sub_26297C090();
}

uint64_t sub_26296AAA4@<X0>(void *a1@<X8>)
{
  return sub_26296AB30(a1);
}

uint64_t sub_26296AAB8()
{
  return sub_26296ABC0();
}

uint64_t sub_26296AACC@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296AAE0()
{
  return sub_26296AD34();
}

uint64_t sub_26296AAF4@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296AB08()
{
  return sub_26296AD34();
}

uint64_t sub_26296AB1C@<X0>(void *a1@<X8>)
{
  return sub_26296AB30(a1);
}

uint64_t sub_26296AB30@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_26296ABAC()
{
  return sub_26296ABC0();
}

uint64_t sub_26296ABC0()
{
  return sub_26297C090();
}

uint64_t sub_26296AC40@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296AC54()
{
  return sub_26296AD34();
}

uint64_t sub_26296AC68@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296AC7C()
{
  return sub_26296AD34();
}

uint64_t sub_26296AC90@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296ACA4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_26297C080();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_26296AD20()
{
  return sub_26296AD34();
}

uint64_t sub_26296AD34()
{
  return sub_26297C090();
}

uint64_t sub_26296ADA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_26296AE74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_26296AEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26296AF40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AccountCreationStartupPageView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_262963834(a1, v6, a2);
}

uint64_t sub_26296AFC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_26296AFF4(uint64_t a1)
{
  return a1;
}

uint64_t sub_26296B020@<X0>(uint64_t a1@<X8>)
{
  return sub_262962010(*(void *)(v1 + 16), a1);
}

uint64_t sub_26296B028@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296B050()
{
  return sub_26296AD34();
}

double sub_26296B07C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AccountCreationStartupPageView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  *(void *)&double result = sub_262962860(v4, a1).n128_u64[0];
  return result;
}

uint64_t sub_26296B0EC@<X0>(void *a1@<X8>)
{
  return sub_26296AB30(a1);
}

uint64_t sub_26296B114()
{
  return sub_26296ABC0();
}

uint64_t sub_26296B140(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AccountCreationStartupPageView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_262962D90(a1, v4);
}

uint64_t sub_26296B1B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_26296B28C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_262952218((uint64_t)v12, *a3);
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
      sub_262952218((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_26296B28C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_26297CC50();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_26296B448(a5, a6);
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
  uint64_t v8 = sub_26297CCF0();
  if (!v8)
  {
    sub_26297CD10();
    __break(1u);
LABEL_17:
    uint64_t result = sub_26297CD70();
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

uint64_t sub_26296B448(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_26296B4E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_26296B6C0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_26296B6C0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_26296B4E0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_26296B658(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_26297CCD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_26297CD10();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_26297CAE0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_26297CD70();
    __break(1u);
LABEL_14:
    uint64_t result = sub_26297CD10();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_26296B658(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980508);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_26296B6C0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980508);
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
  uint64_t result = sub_26297CD70();
  __break(1u);
  return result;
}

uint64_t sub_26296B810@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26297C330();
  *a1 = result;
  return result;
}

uint64_t sub_26296B83C()
{
  return sub_26297C340();
}

uint64_t sub_26296B864@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26297C2E0();
  *a1 = result;
  return result;
}

uint64_t sub_26296B890()
{
  return sub_26297C2F0();
}

uint64_t sub_26296B8BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26297C3B0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_26296B8EC()
{
  return sub_26297C3C0();
}

unsigned char *sub_26296B914(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_26296B928(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980830);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2629475F0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26A980830);
  return sub_26297C3A0();
}

uint64_t sub_26296B9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26297C000();
  uint64_t v92 = *(void *)(v4 - 8);
  uint64_t v93 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v91 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980328);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v86 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26297CBD0();
  uint64_t v89 = *(void *)(v8 - 8);
  uint64_t v90 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v83 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980868);
  uint64_t v79 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v76 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980870);
  uint64_t v81 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v75 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980878);
  uint64_t v85 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v77 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980880);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v87 = v13;
  uint64_t v88 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v82 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803E8);
  uint64_t v73 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v72 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803E0);
  uint64_t v17 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  os_log_type_t v19 = (char *)&v69 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803D8);
  uint64_t v70 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  os_log_type_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803D0);
  uint64_t v22 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v24 = (char *)&v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9803C8);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v69 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97[3] = type metadata accessor for ACRepositoryDefault();
  v97[4] = &off_270DE27B0;
  v97[0] = a1;
  uint64_t v29 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__profileImage;
  *(void *)&long long v95 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802B8);
  sub_26297C060();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v29, v28, v25);
  uint64_t v30 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__suggestedEmails;
  *(void *)&long long v95 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802C8);
  sub_26297C060();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v30, v24, v69);
  uint64_t v31 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__inputEmail;
  *(void *)&long long v95 = 0;
  *((void *)&v95 + 1) = 0xE000000000000000;
  sub_26297C060();
  char v32 = *(void (**)(uint64_t, char *, uint64_t))(v70 + 32);
  uint64_t v33 = v94;
  v32(v31, v21, v94);
  uint64_t v34 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__debouncedInputEmail;
  *(void *)&long long v95 = 0;
  *((void *)&v95 + 1) = 0xE000000000000000;
  sub_26297C060();
  v32(v34, v21, v33);
  uint64_t v35 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isLoading;
  LOBYTE(v95) = 1;
  sub_26297C060();
  char v36 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 32);
  uint64_t v37 = v71;
  v36(v35, v19, v71);
  uint64_t v38 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isCreating;
  LOBYTE(v95) = 0;
  sub_26297C060();
  v36(v38, v19, v37);
  uint64_t v39 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAlert;
  LOBYTE(v95) = 0;
  sub_26297C060();
  v36(v39, v19, v37);
  uint64_t v40 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingFinishView;
  LOBYTE(v95) = 0;
  sub_26297C060();
  v36(v40, v19, v37);
  uint64_t v41 = a2
      + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAvailableCheckSpinner;
  LOBYTE(v95) = 0;
  sub_26297C060();
  v36(v41, v19, v37);
  uint64_t v42 = a2
      + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__emailValidAvailableErrorMessage;
  *(void *)&long long v95 = 0;
  *((void *)&v95 + 1) = 0xE000000000000000;
  sub_26297C060();
  v32(v42, v21, v94);
  uint64_t v43 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__disableContinueButton;
  LOBYTE(v95) = 1;
  sub_26297C060();
  v36(v43, v19, v37);
  uint64_t v44 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__getSuggestionsError;
  LOBYTE(v95) = 0;
  sub_26297C060();
  v36(v44, v19, v37);
  uint64_t v45 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__errorAlert;
  long long v95 = 0u;
  memset(v96, 0, sizeof(v96));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802E8);
  uint64_t v46 = v72;
  sub_26297C060();
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 32))(v45, v46, v74);
  uint64_t v47 = MEMORY[0x263F8EE78];
  *(void *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_suggestions) = MEMORY[0x263F8EE78];
  *(void *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_validationRules) = v47;
  uint64_t v48 = a2
      + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__passedInitialLengthThreshold;
  LOBYTE(v95) = 0;
  sub_26297C060();
  v36(v48, v19, v37);
  uint64_t v49 = (void *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_domain);
  *uint64_t v49 = 0x2E64756F6C636940;
  v49[1] = 0xEB000000006D6F63;
  *(void *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_cancellables) = MEMORY[0x263F8EE88];
  *(void *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_availableApiCall) = 0;
  sub_26296E840((uint64_t)v97, a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository);
  swift_beginAccess();
  uint64_t v50 = v76;
  sub_26297C070();
  swift_endAccess();
  sub_262947E80(&qword_26A980888, &qword_26A980868);
  uint64_t v51 = v75;
  uint64_t v52 = v78;
  sub_26297C100();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v50, v52);
  sub_262947E80(&qword_26A980890, &qword_26A980870);
  uint64_t v53 = v77;
  uint64_t v54 = v80;
  sub_26297C110();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v51, v54);
  uint64_t v55 = v83;
  sub_26297CBC0();
  sub_262947CDC();
  *(void *)&long long v95 = sub_26297CBE0();
  uint64_t v56 = sub_26297CBB0();
  uint64_t v57 = (uint64_t)v86;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v86, 1, 1, v56);
  sub_262947E80(&qword_26A980898, &qword_26A980878);
  sub_26296E934((unint64_t *)&qword_26A980348, (void (*)(uint64_t))sub_262947CDC);
  uint64_t v58 = v82;
  uint64_t v59 = v84;
  sub_26297C0F0();
  sub_262947654(v57, &qword_26A980328);

  (*(void (**)(char *, uint64_t))(v89 + 8))(v55, v90);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v53, v59);
  swift_allocObject();
  swift_weakInit();
  sub_262947E80(&qword_26A9808A0, &qword_26A980880);
  uint64_t v60 = v87;
  sub_26297C120();
  swift_release();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v58, v60);
  swift_beginAccess();
  sub_26297C020();
  swift_endAccess();
  swift_release();
  sub_262959CB8();
  sub_26295AEA8();
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v61 = v93;
  uint64_t v62 = __swift_project_value_buffer(v93, (uint64_t)qword_26A983738);
  uint64_t v64 = v91;
  uint64_t v63 = v92;
  (*(void (**)(char *, uint64_t, uint64_t))(v92 + 16))(v91, v62, v61);
  id v65 = sub_26297BFE0();
  os_log_type_t v66 = sub_26297CB60();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v67 = 0;
    _os_log_impl(&dword_262940000, v65, v66, "[AccountCreation - Startup] Fetch profile picture started", v67, 2u);
    MEMORY[0x263E58CD0](v67, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v61);
  __swift_project_boxed_opaque_existential_1((void *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(void *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
  swift_retain();
  sub_262953C48((uint64_t)sub_26296E9BC, a2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v97);
  return a2;
}

uint64_t sub_26296C8D8@<X0>(uint64_t a1@<X8>)
{
  return sub_262962330(*(void *)(v1 + 16), a1);
}

unint64_t sub_26296C8E0()
{
  unint64_t result = qword_26A980530;
  if (!qword_26A980530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980528);
    sub_262947E80(&qword_26A9804E0, &qword_26A9804C8);
    sub_262947E80(&qword_26A97FCA0, &qword_26A97FCA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980530);
  }
  return result;
}

uint64_t sub_26296C9A4@<X0>(uint64_t a1@<X8>)
{
  return sub_2629627E8(*(void *)(v1 + 16), a1);
}

uint64_t sub_26296C9B0()
{
  return sub_26296DFF8((uint64_t (*)(uint64_t))sub_262963444);
}

uint64_t sub_26296C9C8@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296C9F0()
{
  return sub_26296AD34();
}

uint64_t sub_26296CA18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26297C3B0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_26296CA48()
{
  return sub_26297C3C0();
}

uint64_t sub_26296CA70()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_26296CA80(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_26296CA9C()
{
  return sub_26296DFF8((uint64_t (*)(uint64_t))sub_2629626F0);
}

uint64_t sub_26296CAB4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_26296CAC4()
{
  return sub_262972E14(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_26296CAD0()
{
  uint64_t v1 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v13 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = sub_26297C290();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_26297C1F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v0 + v3, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_26297C230();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = (v3 + v13 + v6) & ~v6;
  swift_release();
  sub_2629600C4();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v11, v4);
  return MEMORY[0x270FA0238](v0, v11 + v7, v2 | v6 | 7);
}

uint64_t sub_26296CD40()
{
  type metadata accessor for AccountCreationStartupPageView();
  sub_26297C290();
  return sub_2629660E0();
}

uint64_t sub_26296CE14()
{
  return sub_262966158(*(double *)(v0 + 24));
}

uint64_t sub_26296CE38@<X0>(char *a1@<X8>)
{
  return sub_262964158(*(void *)(v1 + 16), a1);
}

uint64_t sub_26296CE44()
{
  return sub_26296DFF8((uint64_t (*)(uint64_t))sub_262969B68);
}

uint64_t sub_26296CE5C@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296CE84()
{
  return sub_26296AD34();
}

uint64_t sub_26296CEAC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_26296CEBC@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296CEE4()
{
  return sub_26296AD34();
}

uint64_t sub_26296CF0C()
{
  return sub_262969CB0(*(void *)(v0 + 16));
}

uint64_t sub_26296CF14@<X0>(uint64_t a1@<X8>)
{
  return sub_262969F58(a1);
}

unint64_t sub_26296CF1C()
{
  unint64_t result = qword_26A9805C8;
  if (!qword_26A9805C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9805C0);
    sub_26296CFBC();
    sub_262947E80(&qword_26A97FCA0, &qword_26A97FCA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9805C8);
  }
  return result;
}

unint64_t sub_26296CFBC()
{
  unint64_t result = qword_26A9805D0;
  if (!qword_26A9805D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9805D0);
  }
  return result;
}

uint64_t sub_26296D014()
{
  return sub_26296DFF8((uint64_t (*)(uint64_t))sub_262969EA4);
}

uint64_t sub_26296D02C@<X0>(uint64_t a1@<X8>)
{
  return sub_262964584(*(void *)(v1 + 16), a1);
}

unint64_t sub_26296D034()
{
  unint64_t result = qword_26A980608;
  if (!qword_26A980608)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9805E8);
    sub_26296D0D4();
    sub_262947E80(&qword_26A980690, &qword_26A980698);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980608);
  }
  return result;
}

unint64_t sub_26296D0D4()
{
  unint64_t result = qword_26A980610;
  if (!qword_26A980610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980618);
    sub_26296D174();
    sub_262947E80(&qword_26A97FD20, &qword_26A97FD28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980610);
  }
  return result;
}

unint64_t sub_26296D174()
{
  unint64_t result = qword_26A980620;
  if (!qword_26A980620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980628);
    sub_26296D698(&qword_26A980630, &qword_26A980638, (void (*)(void))sub_26296D238);
    sub_262947E80(&qword_26A980680, &qword_26A980688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980620);
  }
  return result;
}

unint64_t sub_26296D238()
{
  unint64_t result = qword_26A980640;
  if (!qword_26A980640)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980648);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980650);
    sub_26296D2E8();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980640);
  }
  return result;
}

unint64_t sub_26296D2E8()
{
  unint64_t result = qword_26A980658;
  if (!qword_26A980658)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980650);
    sub_262947E80(&qword_26A980660, &qword_26A980668);
    sub_262947E80(&qword_26A980670, &qword_26A980678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980658);
  }
  return result;
}

unint64_t sub_26296D3AC()
{
  unint64_t result = qword_26A9806A0;
  if (!qword_26A9806A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9805F8);
    sub_262947E80(&qword_26A9806A8, &qword_26A9806B0);
    sub_262947E80(&qword_26A9806B8, &qword_26A9806C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9806A0);
  }
  return result;
}

unint64_t sub_26296D470()
{
  unint64_t result = qword_26A9806C8;
  if (!qword_26A9806C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980600);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9806C8);
  }
  return result;
}

uint64_t sub_26296D4DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_26296D4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_release();
  }
  return result;
}

uint64_t sub_26296D504@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296D52C()
{
  return sub_26296AD34();
}

uint64_t sub_26296D554@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296D57C()
{
  return sub_26296AD34();
}

uint64_t sub_26296D5A4@<X0>(uint64_t a1@<X8>)
{
  return sub_262968C78(*(void *)(v1 + 16), a1);
}

unint64_t sub_26296D5AC()
{
  unint64_t result = qword_26A980700;
  if (!qword_26A980700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9806F8);
    sub_26296D698(&qword_26A980708, &qword_26A980710, (void (*)(void))sub_26296D670);
    sub_262947E80(&qword_26A9806B8, &qword_26A9806C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980700);
  }
  return result;
}

uint64_t sub_26296D670()
{
  return sub_26296D698(&qword_26A980718, &qword_26A980720, (void (*)(void))sub_26296D718);
}

uint64_t sub_26296D698(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_26296D718()
{
  unint64_t result = qword_26A980728;
  if (!qword_26A980728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980730);
    sub_262947E80(&qword_26A980738, &qword_26A980740);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980728);
  }
  return result;
}

unint64_t sub_26296D7B8()
{
  unint64_t result = qword_26A980750;
  if (!qword_26A980750)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980758);
    sub_26296D82C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980750);
  }
  return result;
}

unint64_t sub_26296D82C()
{
  unint64_t result = qword_26A980760;
  if (!qword_26A980760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980768);
    sub_26296D8CC();
    sub_262947E80(&qword_26A9806B8, &qword_26A9806C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980760);
  }
  return result;
}

unint64_t sub_26296D8CC()
{
  unint64_t result = qword_26A980770;
  if (!qword_26A980770)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A980778);
    sub_262947E80(&qword_26A980780, &qword_26A980788);
    sub_262947E80(&qword_26A97FD20, &qword_26A97FD28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980770);
  }
  return result;
}

uint64_t sub_26296D990(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_26296DA24()
{
  return sub_262967C44(*(void *)(v0 + 16));
}

uint64_t sub_26296DA30@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AccountCreationStartupPageView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_262967EA0(a1, v6, a2);
}

uint64_t sub_26296DAB0()
{
  uint64_t v1 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_26297C1F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_26297C230();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_2629600C4();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_26296DCA4()
{
  type metadata accessor for AccountCreationStartupPageView();
  return sub_2629681F8();
}

uint64_t sub_26296DD34@<X0>(uint64_t a1@<X8>)
{
  return sub_2629682EC(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_26296DD40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26297C2E0();
  *a1 = result;
  return result;
}

uint64_t sub_26296DD6C()
{
  return sub_26297C2F0();
}

uint64_t sub_26296DD98()
{
  return sub_26297C300();
}

uint64_t sub_26296DDBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26296ADA4(a1, a2, a3, a4, MEMORY[0x263F18DD8], MEMORY[0x263F19340]);
}

unint64_t sub_26296DDFC()
{
  unint64_t result = qword_26A9807E8;
  if (!qword_26A9807E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9807E0);
    sub_262947E80(&qword_26A97FD20, &qword_26A97FD28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9807E8);
  }
  return result;
}

uint64_t sub_26296DEA0()
{
  return sub_26296DFF8((uint64_t (*)(uint64_t))sub_262969A8C);
}

uint64_t sub_26296DEB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26297C350();
  *a1 = result;
  return result;
}

uint64_t sub_26296DEE4()
{
  return sub_26297C360();
}

uint64_t sub_26296DF10@<X0>(void *a1@<X8>)
{
  return sub_26296AB30(a1);
}

uint64_t sub_26296DF38()
{
  return sub_26296ABC0();
}

uint64_t sub_26296DF60()
{
  return sub_26297C390();
}

uint64_t sub_26296DF88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26297C330();
  *a1 = result;
  return result;
}

uint64_t sub_26296DFB4()
{
  return sub_26297C340();
}

uint64_t sub_26296DFE0()
{
  return sub_26296DFF8((uint64_t (*)(uint64_t))sub_262966DD4);
}

uint64_t sub_26296DFF8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AccountCreationStartupPageView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_26296E06C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 128);
  uint64_t v4 = *(void *)(a1 + 136);
  char v5 = *(unsigned char *)(a1 + 144);
  uint64_t v10 = *(void *)(a1 + 224);
  uint64_t v8 = *(void *)(a1 + 240);
  uint64_t v9 = *(void *)(a1 + 232);
  uint64_t v7 = *(void *)(a1 + 248);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2629476B0(v3, v4, v5);
  swift_release();
  swift_bridgeObjectRelease();
  sub_26296E1A4(v10, v9, v8, v7);
  swift_release();
  return a1;
}

uint64_t sub_26296E1A4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2629476B0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_26296E1E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 144);
  sub_2629477E8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_26296E2AC(v6, v5, v2, v3);
  return a1;
}

uint64_t sub_26296E2AC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2629477E8(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_26296E2F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 144);
  sub_2629476B0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_26296E1A4(v6, v5, v2, v3);
  return a1;
}

uint64_t sub_26296E3B4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_26297C310();
  *a1 = v3;
  return result;
}

uint64_t sub_26296E3E0()
{
  return sub_26297C320();
}

uint64_t sub_26296E408@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296E430()
{
  return sub_26296AD34();
}

uint64_t sub_26296E458@<X0>(void *a1@<X8>)
{
  return sub_26296AB30(a1);
}

uint64_t sub_26296E480()
{
  return sub_26296ABC0();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_26297C1F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_26297C230();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_2629600C4();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_26296E688(uint64_t a1, uint64_t *a2)
{
  type metadata accessor for AccountCreationStartupPageView();
  return sub_262967734(a1, a2);
}

uint64_t sub_26296E708(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_26296E768@<X0>(unsigned char *a1@<X8>)
{
  return sub_26296ACA4(a1);
}

uint64_t sub_26296E790()
{
  return sub_26296AD34();
}

uint64_t sub_26296E7B8()
{
  return sub_26297C370();
}

uint64_t sub_26296E7DC()
{
  return sub_26297C380();
}

uint64_t sub_26296E800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_26296ADA4(a1, a2, a3, a4, MEMORY[0x263F18948], MEMORY[0x263F195C0]);
}

uint64_t sub_26296E840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_26296E8A4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_26296E8DC()
{
  return sub_262961394(v0 + 16);
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

uint64_t sub_26296E934(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_26296E97C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_26296E9B4()
{
  return sub_262959B30();
}

uint64_t sub_26296E9BC(void *a1, void *a2)
{
  return sub_26295B6D8(a1, a2, v2);
}

unint64_t sub_26296E9C8()
{
  unint64_t result = qword_26A9808A8;
  if (!qword_26A9808A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9804F8);
    sub_262947E80(&qword_26A9808B0, &qword_26A980490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9808A8);
  }
  return result;
}

uint64_t sub_26296EA6C()
{
  uint64_t v0 = sub_26297C000();
  __swift_allocate_value_buffer(v0, qword_26A983738);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A983738);
  return sub_26297BFF0();
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

uint64_t sub_26296EB54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = a1;
  sub_26296ED20();
  swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  uint64_t v13 = v2;
  while (1)
  {
    uint64_t v4 = v2 + v3;
    uint64_t v5 = *(void *)(v2 + v3 + 48);
    uint64_t v6 = *(void *)(v4 + 56);
    uint64_t v12 = *(void *)(v4 + 80);
    int v14 = *(unsigned __int8 *)(v4 + 96);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9800A8);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_26297F1A0;
    *(void *)(v7 + 56) = MEMORY[0x263F8D310];
    *(void *)(v7 + 64) = sub_262952170();
    *(void *)(v7 + 32) = v5;
    *(void *)(v7 + 40) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)sub_26297CB40();
    uint64_t v9 = (void *)sub_26297CA50();
    unsigned int v10 = objc_msgSend(v8, sel_evaluateWithObject_, v9);

    if (v14 != v10) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 += 72;
    --v1;
    uint64_t v2 = v13;
    if (!v1)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_26296ED20()
{
  unint64_t result = qword_26A9808B8;
  if (!qword_26A9808B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A9808B8);
  }
  return result;
}

uint64_t sub_26296ED60(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 40) = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v7 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v7;
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    uint64_t v8 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v8;
    long long v9 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(a1 + 96) = *((_OWORD *)a2 + 6);
    *(_OWORD *)(a1 + 112) = v9;
    *(void *)(a1 + 128) = a2[16];
    *(unsigned char *)(a1 + 136) = *((unsigned char *)a2 + 136);
    uint64_t v10 = *(int *)(a3 + 44);
    uint64_t v14 = (uint64_t)a2 + v10;
    uint64_t v15 = a1 + v10;
    *(void *)(a1 + 144) = a2[18];
    uint64_t v11 = sub_26297C620();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v13(v15, v14, v11);
  }
  return v5;
}

uint64_t sub_26296EEF0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_26297C620();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_26296EFA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  long long v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  uint64_t v9 = *(int *)(a3 + 44);
  uint64_t v13 = a2 + v9;
  uint64_t v14 = a1 + v9;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v10 = sub_26297C620();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v12(v14, v13, v10);
  return a1;
}

uint64_t sub_26296F0DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_26297C620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_26296F270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 80) = v6;
  uint64_t v7 = *(int *)(a3 + 44);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v10 = sub_26297C620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_26296F32C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_release();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  uint64_t v10 = *(int *)(a3 + 44);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_26297C620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_26296F450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_26296F464);
}

uint64_t sub_26296F464(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_26297C620();
    long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_26296F514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_26296F528);
}

uint64_t sub_26296F528(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_26297C620();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for iCloudMailTextField()
{
  uint64_t result = qword_26A9808C0;
  if (!qword_26A9808C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26296F61C()
{
  uint64_t result = sub_26297C620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_26296F6E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_26296F704@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v3 = type metadata accessor for iCloudMailTextField();
  uint64_t v4 = *(void *)(v3 - 8);
  v36[1] = v3;
  uint64_t v37 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v38 = v5;
  uint64_t v39 = (uint64_t)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808D0);
  MEMORY[0x270FA5388](v40);
  uint64_t v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808D8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v14 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v42 = *v1;
  uint64_t v43 = v12;
  uint64_t v44 = v14;
  uint64_t v45 = v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808E0);
  MEMORY[0x263E580B0](&v46);
  uint64_t v17 = v46;
  unint64_t v16 = v47;
  swift_bridgeObjectRelease();
  uint64_t v18 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0) {
    uint64_t v18 = v17 & 0xFFFFFFFFFFFFLL;
  }
  if (v18)
  {
    uint64_t v42 = v11;
    uint64_t v43 = v12;
    uint64_t v44 = v14;
    uint64_t v45 = v13;
    MEMORY[0x263E580B0](&v46, v15);
    uint64_t v20 = v46;
    uint64_t v19 = v47;
  }
  else
  {
    uint64_t v20 = v2[10];
    uint64_t v19 = swift_bridgeObjectRetain();
  }
  uint64_t v42 = v20;
  uint64_t v43 = v19;
  sub_262947368();
  uint64_t v21 = sub_26297C660();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  uint64_t v26 = sub_26297C5F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v10, 1, 1, v26);
  sub_26297C600();
  double v28 = v27;
  double v30 = v29;
  sub_262947654((uint64_t)v10, &qword_26A9808D8);
  *(void *)uint64_t v7 = sub_26297C410();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808E8);
  sub_26296FA8C(v2, (uint64_t)&v7[*(int *)(v31 + 44)], v28, v30);
  uint64_t v32 = v39;
  sub_262971210((uint64_t)v2, v39);
  unint64_t v33 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  uint64_t v34 = swift_allocObject();
  sub_2629713A0(v32, v34 + v33);
  sub_262947E80(&qword_26A9808F0, &qword_26A9808D0);
  sub_26297C6C0();
  swift_release();
  sub_2629476B0(v21, v23, v25);
  swift_bridgeObjectRelease();
  return sub_262947654((uint64_t)v7, &qword_26A9808D0);
}

uint64_t sub_26296FA8C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v80 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC20);
  uint64_t v69 = *(void *)(v7 - 8);
  uint64_t v70 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v68 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v67 = (char *)&v66 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808F8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v78 = (uint64_t *)((char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  uint64_t v79 = (uint64_t)&v66 - v14;
  uint64_t v76 = sub_26297C260();
  uint64_t v74 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v75 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980900);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980908);
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980910);
  uint64_t v24 = v23 - 8;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v77 = (uint64_t)&v66 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  double v29 = (char *)&v66 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v66 - v30;
  *(void *)uint64_t v18 = sub_26297C410();
  *((void *)v18 + 1) = 0;
  v18[16] = 0;
  uint64_t v32 = &v18[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980918) + 44)];
  uint64_t v73 = a1;
  sub_2629701B4(a1, v32);
  uint64_t v33 = sub_26297C950();
  uint64_t v71 = v34;
  uint64_t v72 = v33;
  uint64_t v35 = sub_26297C410();
  sub_262970978((uint64_t)a1, (uint64_t)v81, a3, a4);
  *(_OWORD *)&v82[87] = v81[5];
  *(_OWORD *)&v82[103] = v81[6];
  *(_OWORD *)&v82[119] = v81[7];
  *(_OWORD *)&v82[135] = v81[8];
  *(_OWORD *)&v82[23] = v81[1];
  *(_OWORD *)&v82[39] = v81[2];
  *(_OWORD *)&v82[55] = v81[3];
  *(_OWORD *)&v82[71] = v81[4];
  char v83 = 0;
  *(_OWORD *)&v82[7] = v81[0];
  sub_2629475F0((uint64_t)v18, (uint64_t)v22, &qword_26A980900);
  char v36 = &v22[*(int *)(v20 + 44)];
  long long v37 = *(_OWORD *)&v82[112];
  *(_OWORD *)(v36 + 113) = *(_OWORD *)&v82[96];
  *(_OWORD *)(v36 + 129) = v37;
  *(_OWORD *)(v36 + 145) = *(_OWORD *)&v82[128];
  long long v38 = *(_OWORD *)&v82[48];
  *(_OWORD *)(v36 + 49) = *(_OWORD *)&v82[32];
  *(_OWORD *)(v36 + 65) = v38;
  long long v39 = *(_OWORD *)&v82[80];
  *(_OWORD *)(v36 + 81) = *(_OWORD *)&v82[64];
  *(_OWORD *)(v36 + 97) = v39;
  long long v40 = *(_OWORD *)&v82[16];
  *(_OWORD *)(v36 + 17) = *(_OWORD *)v82;
  *(void *)char v36 = v35;
  *((void *)v36 + 1) = 0;
  v36[16] = 0;
  uint64_t v41 = *(void *)&v82[143];
  *(_OWORD *)(v36 + 33) = v40;
  uint64_t v42 = v72;
  *((void *)v36 + 20) = v41;
  *((void *)v36 + 21) = v42;
  *((void *)v36 + 22) = v71;
  uint64_t v43 = (uint64_t)v18;
  uint64_t v44 = (uint64_t)v31;
  sub_262947654(v43, &qword_26A980900);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v46 = v74;
  uint64_t v47 = v75;
  uint64_t v48 = v76;
  (*(void (**)(char *, void, uint64_t))(v74 + 104))(v75, *MEMORY[0x263F18DC8], v76);
  uint64_t v49 = (uint64_t *)&v29[*(int *)(v24 + 44)];
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9807C0);
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))((char *)v49 + *(int *)(v50 + 28), v47, v48);
  *uint64_t v49 = KeyPath;
  sub_2629475F0((uint64_t)v22, (uint64_t)v29, &qword_26A980908);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
  sub_262947654((uint64_t)v22, &qword_26A980908);
  sub_26294758C((uint64_t)v29, v44, &qword_26A980910);
  if (*((unsigned char *)v73 + 72) == 1)
  {
    uint64_t v51 = v67;
    sub_26297C1C0();
    uint64_t v53 = v68;
    uint64_t v52 = v69;
    uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
    uint64_t v55 = v70;
    v54(v68, v51, v70);
    uint64_t v56 = (uint64_t)v78;
    *uint64_t v78 = 0;
    *(unsigned char *)(v56 + 8) = 1;
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980930);
    v54((char *)(v56 + *(int *)(v57 + 48)), v53, v55);
    uint64_t v58 = *(void (**)(char *, uint64_t))(v52 + 8);
    v58(v51, v55);
    v58(v53, v55);
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980920);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v56, 0, 1, v59);
    uint64_t v60 = v79;
    sub_26294758C(v56, v79, &qword_26A9808F8);
  }
  else
  {
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980920);
    uint64_t v60 = v79;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v79, 1, 1, v61);
    uint64_t v56 = (uint64_t)v78;
  }
  uint64_t v62 = v77;
  sub_2629475F0(v44, v77, &qword_26A980910);
  sub_2629475F0(v60, v56, &qword_26A9808F8);
  uint64_t v63 = v80;
  sub_2629475F0(v62, v80, &qword_26A980910);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980928);
  sub_2629475F0(v56, v63 + *(int *)(v64 + 48), &qword_26A9808F8);
  sub_262947654(v60, &qword_26A9808F8);
  sub_262947654(v44, &qword_26A980910);
  sub_262947654(v56, &qword_26A9808F8);
  return sub_262947654(v62, &qword_26A980910);
}

uint64_t sub_2629701B4@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980948);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980950);
  uint64_t v59 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v7 = (char *)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980958);
  uint64_t v64 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v60 = (char *)v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980960);
  uint64_t v65 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v61 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980968);
  uint64_t v69 = *(void *)(v10 - 8);
  uint64_t v70 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v67 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980970);
  uint64_t v72 = *(void *)(v12 - 8);
  uint64_t v73 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v71 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v63 = (char *)v58 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v75 = (char *)v58 - v17;
  uint64_t v18 = *a1;
  uint64_t v19 = a1[1];
  uint64_t v20 = a1[2];
  uint64_t v21 = a1[3];
  uint64_t v82 = *a1;
  uint64_t v83 = v19;
  uint64_t v84 = v20;
  uint64_t v85 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808E0);
  MEMORY[0x263E580B0](&v76);
  uint64_t v23 = v76;
  unint64_t v22 = v77;
  swift_bridgeObjectRelease();
  uint64_t v24 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0) {
    uint64_t v24 = v23 & 0xFFFFFFFFFFFFLL;
  }
  if (v24)
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0xE000000000000000;
  }
  else
  {
    uint64_t v25 = a1[10];
    uint64_t v26 = swift_bridgeObjectRetain();
  }
  uint64_t v80 = v25;
  uint64_t v81 = v26;
  uint64_t v76 = v18;
  uint64_t v77 = v19;
  uint64_t v78 = v20;
  uint64_t v79 = v21;
  sub_26297C8E0();
  v58[1] = sub_262947368();
  sub_26297C980();
  uint64_t v27 = sub_262947E80(&qword_26A980978, &qword_26A980950);
  uint64_t v28 = v60;
  uint64_t v29 = v62;
  MEMORY[0x263E57EE0](1, v62, v27);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v29);
  sub_26297C4D0();
  uint64_t v30 = sub_26297C4E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v5, 0, 1, v30);
  uint64_t v82 = v29;
  uint64_t v83 = v27;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v32 = v61;
  uint64_t v33 = v66;
  sub_26297C730();
  sub_262947654((uint64_t)v5, &qword_26A980948);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v28, v33);
  uint64_t v82 = v33;
  uint64_t v83 = OpaqueTypeConformance2;
  uint64_t v34 = swift_getOpaqueTypeConformance2();
  char v36 = v67;
  uint64_t v35 = v68;
  sub_26297C6B0();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v32, v35);
  uint64_t v37 = a1[5];
  char v38 = *((unsigned char *)a1 + 48);
  LOBYTE(v76) = *((unsigned char *)a1 + 32);
  uint64_t v77 = v37;
  LOBYTE(v78) = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9805D8);
  sub_26297C150();
  uint64_t v82 = v35;
  uint64_t v83 = v34;
  swift_getOpaqueTypeConformance2();
  long long v39 = v63;
  uint64_t v40 = v70;
  sub_26297C760();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v36, v40);
  uint64_t v41 = v72;
  uint64_t v42 = v73;
  uint64_t v43 = v75;
  (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v75, v39, v73);
  uint64_t v44 = a1[8];
  uint64_t v82 = a1[7];
  uint64_t v83 = v44;
  swift_bridgeObjectRetain();
  uint64_t v69 = sub_26297C660();
  uint64_t v70 = v45;
  uint64_t v47 = v46;
  LOBYTE(v32) = v48 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  LODWORD(v33) = sub_26297C4A0();
  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  uint64_t v51 = v71;
  v50(v71, v43, v42);
  uint64_t v52 = v74;
  v50(v74, v51, v42);
  uint64_t v53 = &v52[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980980) + 48)];
  uint64_t v55 = v69;
  uint64_t v54 = v70;
  *(void *)uint64_t v53 = v69;
  *((void *)v53 + 1) = v47;
  v53[16] = (char)v32;
  *((void *)v53 + 3) = v54;
  *((void *)v53 + 4) = KeyPath;
  *((void *)v53 + 5) = 1;
  v53[48] = 0;
  *((_DWORD *)v53 + 13) = v33;
  *((void *)v53 + 7) = 0;
  sub_2629477E8(v55, v47, (char)v32);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v41 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v56(v75, v42);
  sub_2629476B0(v55, v47, (char)v32);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v56)(v51, v42);
}

uint64_t sub_262970978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = type metadata accessor for iCloudMailTextField();
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v53 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v54 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v58 = *(void *)a1;
  uint64_t v59 = v11;
  uint64_t v60 = v12;
  uint64_t v61 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808E0);
  MEMORY[0x263E580B0](&v62);
  uint64_t v16 = v62;
  unint64_t v15 = v63;
  swift_bridgeObjectRelease();
  uint64_t v17 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0) {
    uint64_t v17 = v16 & 0xFFFFFFFFFFFFLL;
  }
  if (v17)
  {
    uint64_t v58 = v10;
    uint64_t v59 = v11;
    uint64_t v60 = v12;
    uint64_t v61 = v13;
    MEMORY[0x263E580B0](&v62, v14);
    uint64_t v19 = v62;
    uint64_t v18 = v63;
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 80);
    uint64_t v18 = swift_bridgeObjectRetain();
  }
  uint64_t v58 = v19;
  uint64_t v59 = v18;
  sub_262947368();
  uint64_t v20 = sub_26297C660();
  uint64_t v49 = v21;
  uint64_t v50 = v20;
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  uint64_t v26 = sub_26297C940();
  uint64_t v51 = v27;
  uint64_t v52 = v26;
  uint64_t v28 = v54;
  sub_262971210(a1, v54);
  unint64_t v29 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
  unint64_t v30 = (v9 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = swift_allocObject();
  sub_2629713A0(v28, v31 + v29);
  uint64_t v32 = (double *)(v31 + v30);
  *uint64_t v32 = a3;
  v32[1] = a4;
  uint64_t v33 = *(void *)(a1 + 144);
  LOBYTE(v58) = *(unsigned char *)(a1 + 136);
  uint64_t v59 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FC38);
  sub_26297C870();
  LOBYTE(v28) = v62;
  uint64_t v34 = *(void *)(a1 + 64);
  uint64_t v58 = *(void *)(a1 + 56);
  uint64_t v59 = v34;
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_26297C660();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  char v41 = v40 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  int v43 = sub_26297C4A0();
  char v55 = v25;
  LOBYTE(v58) = v25;
  LOBYTE(v62) = v28 ^ 1;
  char v57 = v41;
  char v56 = 0;
  uint64_t v44 = v50;
  *(void *)a2 = v50;
  *(void *)(a2 + 8) = v23;
  uint64_t v48 = v23;
  *(unsigned char *)(a2 + 16) = v25;
  *(void *)(a2 + 24) = v49;
  *(void *)(a2 + 32) = sub_2629715A4;
  uint64_t v45 = v52;
  *(void *)(a2 + 40) = v31;
  *(void *)(a2 + 48) = v45;
  *(void *)(a2 + 56) = v51;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(unsigned char *)(a2 + 80) = v28;
  *(unsigned char *)(a2 + 81) = v28 ^ 1;
  *(void *)(a2 + 88) = v35;
  *(void *)(a2 + 96) = v37;
  *(unsigned char *)(a2 + 104) = v41;
  *(void *)(a2 + 112) = v39;
  *(void *)(a2 + 120) = KeyPath;
  *(void *)(a2 + 128) = 1;
  *(unsigned char *)(a2 + 136) = 0;
  *(_DWORD *)(a2 + 140) = v43;
  uint64_t v46 = v44;
  sub_2629477E8(v44, v23, v25);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2629477E8(v35, v37, v41);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2629476B0(v35, v37, v41);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2629476B0(v46, v48, v55);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_262970CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v43 = a1;
  uint64_t v48 = a3;
  uint64_t v49 = sub_26297C210();
  uint64_t v9 = *(void *)(v49 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v49);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for iCloudMailTextField();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980938);
  uint64_t v46 = *(void *)(v15 - 8);
  uint64_t v47 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v45 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_26297C7D0();
  long long v17 = *(_OWORD *)a2;
  uint64_t v18 = *(void *)(a2 + 16);
  uint64_t v19 = *(void *)(a2 + 24);
  uint64_t v44 = a2;
  long long v50 = v17;
  uint64_t v51 = v18;
  uint64_t v52 = v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9808E0);
  MEMORY[0x263E580B0](&v53, v20);
  long long v50 = v53;
  uint64_t v39 = (uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262971210(a2, v39);
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v38 = v11;
  uint64_t v21 = v49;
  v42(v11, a1, v49);
  unint64_t v22 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v23 = (v14 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + v23 + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v41 = v24 + v10;
  uint64_t v25 = swift_allocObject();
  sub_2629713A0((uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v22);
  uint64_t v26 = (double *)(v25 + v23);
  *uint64_t v26 = a4;
  v26[1] = a5;
  char v40 = *(void (**)(unint64_t, char *, uint64_t))(v9 + 32);
  v40(v25 + v24, v11, v21);
  uint64_t v27 = v45;
  sub_26297C790();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v28 = v39;
  sub_262971210(v44, v39);
  unint64_t v29 = v38;
  uint64_t v30 = v49;
  v42(v38, v43, v49);
  uint64_t v31 = swift_allocObject();
  sub_2629713A0(v28, v31 + v22);
  uint64_t v32 = (double *)(v31 + v23);
  *uint64_t v32 = a4;
  v32[1] = a5;
  v40(v31 + v24, v29, v30);
  uint64_t v34 = v46;
  uint64_t v33 = v47;
  uint64_t v35 = v48;
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(v48, v27, v47);
  uint64_t v36 = (uint64_t (**)())(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980940) + 36));
  *uint64_t v36 = sub_262971974;
  v36[1] = (uint64_t (*)())v31;
  void v36[2] = 0;
  v36[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v27, v33);
}

uint64_t sub_2629710C4()
{
  return sub_26297C880();
}

uint64_t sub_262971138()
{
  return sub_26297C880();
}

uint64_t sub_2629711AC()
{
  return sub_26297C140();
}

uint64_t sub_262971210(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for iCloudMailTextField();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_262971274()
{
  unint64_t v1 = (int *)(type metadata accessor for iCloudMailTextField() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[13];
  uint64_t v8 = sub_26297C620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2629713A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for iCloudMailTextField();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_262971404()
{
  type metadata accessor for iCloudMailTextField();
  return sub_2629711AC();
}

uint64_t sub_26297146C()
{
  unint64_t v1 = (int *)(type metadata accessor for iCloudMailTextField() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[13];
  uint64_t v8 = sub_26297C620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_2629715A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for iCloudMailTextField() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  double v8 = *(double *)(v2 + v7);
  double v9 = *(double *)(v2 + v7 + 8);
  return sub_262970CB4(a1, v2 + v6, a2, v8, v9);
}

uint64_t sub_262971654@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_26297C3D0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_262971688()
{
  return sub_26297C3E0();
}

uint64_t sub_2629716BC()
{
  type metadata accessor for iCloudMailTextField();
  sub_26297C210();
  return sub_2629710C4();
}

uint64_t objectdestroy_10Tm()
{
  unint64_t v1 = (int *)(type metadata accessor for iCloudMailTextField() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v4 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = sub_26297C210();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v7 + 16) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v11 = v0 + v3 + v1[13];
  uint64_t v12 = sub_26297C620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_262971974()
{
  type metadata accessor for iCloudMailTextField();
  sub_26297C210();
  return sub_262971138();
}

uint64_t sub_262971A54()
{
  return swift_getOpaqueTypeConformance2();
}

id iCloudMailAccountProviderSwift.__allocating_init(presenter:appleAccount:accountStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator] = 0;
  *(void *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift_presenter] = a1;
  *(void *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount] = a2;
  *(void *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore] = a3;
  v9.receiver = v7;
  v9.super_class = v3;
  return objc_msgSendSuper2(&v9, sel_init);
}

id iCloudMailAccountProviderSwift.init(presenter:appleAccount:accountStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator] = 0;
  *(void *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift_presenter] = a1;
  *(void *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount] = a2;
  *(void *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore] = a3;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for iCloudMailAccountProviderSwift();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for iCloudMailAccountProviderSwift()
{
  return self;
}

id sub_262971C74()
{
  uint64_t v1 = OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator);
  }
  else
  {
    unint64_t v4 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter);
    objc_super v5 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount);
    uint64_t v6 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore);
    uint64_t v7 = (objc_class *)type metadata accessor for LegacyMailAccountCreator();
    uint64_t v8 = (char *)objc_allocWithZone(v7);
    objc_super v9 = &v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler];
    *(void *)objc_super v9 = 0;
    *((void *)v9 + 1) = 0;
    *(void *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController] = 0;
    *(void *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels] = MEMORY[0x263F8EE78];
    *(void *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader] = 0;
    *(void *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter] = v4;
    *(void *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount] = v5;
    *(void *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore] = v6;
    v17.receiver = v8;
    v17.super_class = v7;
    id v10 = v4;
    id v11 = v5;
    id v12 = v6;
    id v13 = objc_msgSendSuper2(&v17, sel_init);
    uint64_t v14 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v13;
    id v3 = v13;

    uint64_t v2 = 0;
  }
  id v15 = v2;
  return v3;
}

void sub_262971D98(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = a3;
  uint64_t v47 = a2;
  int v46 = a1;
  uint64_t v3 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v44 = (uint64_t)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v45 = (uint64_t *)((char *)&v43 - v6);
  uint64_t v7 = sub_26297C000();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v43 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v43 - v14;
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v7, (uint64_t)qword_26A983738);
  objc_super v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v17(v15, v16, v7);
  uint64_t v18 = sub_26297BFE0();
  os_log_type_t v19 = sub_26297CB60();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 67109120;
    LODWORD(v50[0]) = v46 & 1;
    sub_26297CC40();
    _os_log_impl(&dword_262940000, v18, v19, "[iCloudMailAccountProviderSwift] present account creation with alert: %{BOOL}d", v20, 8u);
    MEMORY[0x263E58CD0](v20, -1, -1);
  }

  uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v15, v7);
  uint64_t v51 = &type metadata for FeatureFlag;
  uint64_t v52 = (char **)sub_262972BDC();
  char v22 = sub_26297BFC0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  if (v22)
  {
    v17(v13, v16, v7);
    unint64_t v23 = sub_26297BFE0();
    os_log_type_t v24 = sub_26297CB60();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_262940000, v23, v24, "[iCloudMailAccountProviderSwift] present account creation: new flow", v25, 2u);
      MEMORY[0x263E58CD0](v25, -1, -1);
    }

    v21(v13, v7);
    uint64_t v26 = v49;
    uint64_t v27 = *(void **)(v49 + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore);
    uint64_t v28 = *(void **)(v49 + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount);
    uint64_t v29 = type metadata accessor for ACRepositoryDefault();
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = v27;
    *(void *)(v30 + 24) = v28;
    uint64_t v51 = (ValueMetadata *)v29;
    uint64_t v52 = &off_270DE27B0;
    v50[0] = v30;
    uint64_t v31 = swift_allocObject();
    uint64_t v32 = v48;
    *(void *)(v31 + 16) = v47;
    *(void *)(v31 + 24) = v32;
    id v33 = v27;
    id v34 = v28;
    swift_retain();
    uint64_t v35 = v45;
    sub_2629611F8((uint64_t)v50, 0, (uint64_t)sub_262972C68, v31, v45);
    sub_26296AE74((uint64_t)v35, v44);
    id v36 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A9809B0));
    uint64_t v37 = (void *)sub_26297C450();
    objc_msgSend(*(id *)(v26 + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter), sel_presentViewController_animated_completion_, v37, 1, 0);

    sub_262972C90((uint64_t)v35);
  }
  else
  {
    uint64_t v38 = v43;
    v17(v43, v16, v7);
    uint64_t v39 = sub_26297BFE0();
    os_log_type_t v40 = sub_26297CB60();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_262940000, v39, v40, "[iCloudMailAccountProviderSwift] present account creation: legacy flow", v41, 2u);
      MEMORY[0x263E58CD0](v41, -1, -1);
    }

    v21(v38, v7);
    id v42 = sub_262971C74();
    sub_262973E00(v46 & 1, v47, v48);
  }
}

uint64_t sub_26297234C(uint64_t a1, uint64_t a2)
{
  uint64_t v60 = a2;
  uint64_t v58 = a1;
  uint64_t v2 = type metadata accessor for AccountCreationStartupPageView();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v56 = (uint64_t)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  char v57 = (uint64_t *)((char *)&v54 - v5);
  uint64_t v6 = sub_26297C000();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  id v13 = (char *)&v54 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v54 - v14;
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v6, (uint64_t)qword_26A983738);
  objc_super v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v17(v15, v16, v6);
  uint64_t v18 = sub_26297BFE0();
  os_log_type_t v19 = sub_26297CB60();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = v16;
    uint64_t v21 = v6;
    char v22 = v17;
    uint64_t v23 = v7;
    os_log_type_t v24 = v13;
    uint64_t v25 = v10;
    uint64_t v26 = v20;
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_262940000, v18, v19, "[iCloudMailAccountProviderSwift] present account creation from Unified Settings", v20, 2u);
    uint64_t v27 = v26;
    uint64_t v10 = v25;
    id v13 = v24;
    uint64_t v7 = v23;
    objc_super v17 = v22;
    uint64_t v6 = v21;
    uint64_t v16 = v55;
    MEMORY[0x263E58CD0](v27, -1, -1);
  }

  uint64_t v28 = *(void (**)(char *, uint64_t))(v7 + 8);
  v28(v15, v6);
  uint64_t v62 = &type metadata for FeatureFlag;
  uint64_t v63 = (char **)sub_262972BDC();
  char v29 = sub_26297BFC0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  if (v29)
  {
    v17(v13, v16, v6);
    uint64_t v30 = sub_26297BFE0();
    os_log_type_t v31 = sub_26297CB60();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_262940000, v30, v31, "[iCloudMailAccountProviderSwift] present account creation: new flow", v32, 2u);
      MEMORY[0x263E58CD0](v32, -1, -1);
    }

    v28(v13, v6);
    uint64_t v33 = v59;
    id v34 = *(void **)(v59 + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore);
    uint64_t v35 = *(void **)(v59 + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount);
    uint64_t v36 = type metadata accessor for ACRepositoryDefault();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v34;
    *(void *)(v37 + 24) = v35;
    uint64_t v62 = (ValueMetadata *)v36;
    uint64_t v63 = &off_270DE27B0;
    v61[0] = v37;
    id v38 = v34;
    id v39 = v35;
    uint64_t v40 = v60;
    swift_retain();
    uint64_t v41 = v57;
    sub_2629611F8((uint64_t)v61, 1, v58, v40, v57);
    sub_26296AE74((uint64_t)v41, v56);
    id v42 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A9809B0));
    uint64_t v43 = (void *)sub_26297C450();
    objc_msgSend(*(id *)(v33 + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter), sel_presentViewController_animated_completion_, v43, 1, 0);

    return sub_262972C90((uint64_t)v41);
  }
  else
  {
    v17(v10, v16, v6);
    uint64_t v45 = sub_26297BFE0();
    os_log_type_t v46 = sub_26297CB60();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = v10;
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_262940000, v45, v46, "[iCloudMailAccountProviderSwift] present account creation: legacy flow", v48, 2u);
      uint64_t v49 = v48;
      uint64_t v10 = v47;
      MEMORY[0x263E58CD0](v49, -1, -1);
    }

    v28(v10, v6);
    long long v50 = (char *)sub_262971C74();
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = v58;
    *(void *)(v51 + 24) = v60;
    uint64_t v52 = (uint64_t (**)())&v50[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler];
    uint64_t v53 = *(void *)&v50[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler];
    *uint64_t v52 = sub_262972CEC;
    v52[1] = (uint64_t (*)())v51;
    swift_retain();
    swift_retain();
    sub_262947914(v53);
    sub_262974430();

    return swift_release();
  }
}

id iCloudMailAccountProviderSwift.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void iCloudMailAccountProviderSwift.init()()
{
}

id iCloudMailAccountProviderSwift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for iCloudMailAccountProviderSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_262972A58(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_262972A68(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_262972AA4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_262972AB4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_26297CD70();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_262972B58(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_262972B84(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_262972BAC@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_262972BDC()
{
  unint64_t result = qword_26A9809A8;
  if (!qword_26A9809A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9809A8);
  }
  return result;
}

uint64_t sub_262972C30()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_262972C68()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_262972C90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_262972CEC()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t method lookup function for iCloudMailAccountProviderSwift(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for iCloudMailAccountProviderSwift);
}

uint64_t dispatch thunk of iCloudMailAccountProviderSwift.__allocating_init(presenter:appleAccount:accountStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of iCloudMailAccountProviderSwift.present(with:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of iCloudMailAccountProviderSwift.present(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t sub_262972DAC(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_262972DC4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_262972DFC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_262972E14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v8 = *a3;
  sub_262972EF0((uint64_t)(a3 + 2), (uint64_t)v7);
  uint64_t v4 = (_OWORD *)swift_allocObject();
  long long v5 = *((_OWORD *)a3 + 1);
  v4[1] = *(_OWORD *)a3;
  v4[2] = v5;
  v4[3] = *((_OWORD *)a3 + 2);
  *(_OWORD *)((char *)v4 + 57) = *(_OWORD *)((char *)a3 + 41);
  swift_bridgeObjectRetain();
  sub_262973004((uint64_t)&v8);
  swift_retain();
  sub_262973030((uint64_t)v7);
  sub_262947368();
  return sub_26297C8A0();
}

uint64_t sub_262972EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_262972F58()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t sub_262972FA0()
{
  return sub_26297C8D0();
}

uint64_t sub_262973004(uint64_t a1)
{
  return a1;
}

uint64_t sub_262973030(uint64_t a1)
{
  return a1;
}

unint64_t sub_26297305C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B20);
  uint64_t v2 = (void *)sub_26297CD60();
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
    unint64_t result = sub_26295FA90(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
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

unint64_t sub_262973178(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A980B10);
  uint64_t v2 = sub_26297CD60();
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
    sub_2629475F0(v6, (uint64_t)&v15, &qword_26A9800D8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_26295FA90(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_262952274(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_2629732B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980B08);
  uint64_t v2 = (void *)sub_26297CD60();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_26295FA90(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
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

uint64_t sub_2629733C8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980B00);
    uint64_t v2 = sub_26297CD60();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_262952218(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    uint64_t v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_262952274(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_262952274(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_262952274(v36, v37);
    sub_262952274(v37, &v33);
    uint64_t result = sub_26297CC90();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_262952274(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_262978A5C();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_262973790(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980B00);
    uint64_t v2 = sub_26297CD60();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_262952274(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_262952274(v35, v36);
    sub_262952274(v36, &v32);
    uint64_t result = sub_26297CC90();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_262952274(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_262978A5C();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_262973B3C(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_262973BB4(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_262973C2C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_262973C70()
{
  uint64_t v1 = OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController);
  }
  else
  {
    id v4 = sub_262973CD0();
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_262973CD0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_init);
  id v1 = objc_msgSend(self, sel_currentDevice);
  id v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  if (sub_262967BE0((uint64_t)v2, (uint64_t)&unk_270DE1730)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  objc_msgSend(v0, sel_setModalPresentationStyle_, v3);
  return v0;
}

id sub_262973D78()
{
  uint64_t v1 = OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F63790]), sel_init);
    objc_msgSend(v4, sel_setDelegate_, v0);
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_262973E00(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v6 = (void *)(v4 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler);
  uint64_t v7 = *(void *)(v4 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler);
  *id v6 = a2;
  v6[1] = a3;
  swift_retain();
  sub_262947914(v7);
  if (a1)
  {
    _s18CurrentBundleClassCMa();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    unint64_t v9 = self;
    id v10 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_26297CAC0();
    sub_26297CAC0();
    sub_26297BEC0();

    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v9, (SEL)0x2655B3F25, ObjCClassFromMetadata, 0xE000000000000000);
    sub_26297CAC0();
    sub_26297CAC0();
    sub_26297BEC0();

    swift_bridgeObjectRelease();
    unint64_t v12 = (void *)sub_26297CA50();
    swift_bridgeObjectRelease();
    int64_t v13 = (void *)sub_26297CA50();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v12, v13, 1, 0xE000000000000000);

    id v15 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_26297CAC0();
    sub_26297CAC0();
    sub_26297BEC0();

    swift_bridgeObjectRelease();
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    long long v17 = (void *)sub_26297CA50();
    swift_bridgeObjectRelease();
    long long v28 = sub_262978F10;
    uint64_t v29 = v16;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v25 = 1107296256;
    int64_t v26 = sub_2629743C8;
    uint64_t v27 = &block_descriptor_93;
    uint64_t v18 = _Block_copy(&aBlock);
    swift_release();
    uint64_t v19 = self;
    id v20 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v17, 0, v18, 0xE000000000000000);
    _Block_release(v18);
    swift_release();

    id v21 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t aBlock = 2777980912;
    unint64_t v25 = 0xA400000000000000;
    sub_26297CAC0();
    sub_26297CAC0();
    sub_26297BEC0();

    swift_bridgeObjectRelease();
    char v22 = (void *)sub_26297CA50();
    swift_bridgeObjectRelease();
    id v23 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v22, 1, 0, 0xE000000000000000);

    objc_msgSend(v14, sel_addAction_, v23);
    objc_msgSend(v14, sel_addAction_, v20);
    objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter), sel_presentViewController_animated_completion_, v14, 1, 0);
  }
  else
  {
    sub_262974430();
  }
}

void sub_262974374(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x263E58D60](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    sub_262974430();
  }
}

void sub_2629743C8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_262974430()
{
  uint64_t v1 = sub_26297C9A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26297C9D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  unint64_t v9 = (void *)sub_26297CBE0();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_262978E6C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = &block_descriptor_65;
  id v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  sub_26297C9C0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_262954D2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262954D84();
  sub_26297CC80();
  MEMORY[0x263E583E0](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_2629746BC(char *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = *(void **)&a1[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
  id v4 = a1;
  id v5 = objc_msgSend(v3, sel_identifier);

  if (!v5) {
    goto LABEL_4;
  }
  id v6 = objc_msgSend(v3, sel_aa_authToken);
  if (v6)
  {

LABEL_4:
    id v7 = objc_msgSend(self, sel_sharedServer);
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v16 = sub_262978E7C;
    uint64_t v17 = v8;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 1107296256;
    id v14 = sub_262953D6C;
    id v15 = &block_descriptor_72;
    unint64_t v9 = _Block_copy(&v12);
    swift_release();
    objc_msgSend(v7, sel_configurationWithCompletion_, v9);
LABEL_7:
    _Block_release(v9);

    swift_release();
    return;
  }
  id v10 = objc_msgSend(v3, sel_accountStore);
  if (v10)
  {
    id v7 = v10;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_262978E74;
    *(void *)(v11 + 24) = v2;
    uint64_t v16 = sub_262978EBC;
    uint64_t v17 = v11;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 1107296256;
    id v14 = sub_262973B3C;
    id v15 = &block_descriptor_78;
    unint64_t v9 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_renewCredentialsForAccount_completion_, v3, v9);
    goto LABEL_7;
  }

  __break(1u);
}

void sub_262974930()
{
  id v0 = objc_msgSend(self, sel_sharedServer);
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3[4] = sub_262978E7C;
  v3[5] = v1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1107296256;
  v3[2] = sub_262953D6C;
  v3[3] = &block_descriptor_89;
  uint64_t v2 = _Block_copy(v3);
  swift_release();
  objc_msgSend(v0, sel_configurationWithCompletion_, v2);
  _Block_release(v2);
}

void sub_262974A34(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v35 - v9;
  uint64_t v11 = sub_26297C000();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v15 = MEMORY[0x263E58D60](a3 + 16);
  if (v15)
  {
    uint64_t v16 = (char *)v15;
    if (a1 && (id v17 = objc_msgSend(a1, sel_addEmailURL)) != 0)
    {
      uint64_t v18 = v17;
      sub_26297CA60();

      uint64_t v19 = *(void **)&v16[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
      id v20 = objc_allocWithZone(MEMORY[0x263F25778]);
      id v21 = v19;
      char v22 = (void *)sub_26297CA50();
      swift_bridgeObjectRelease();
      id v23 = objc_msgSend(v20, sel_initWithURLString_account_, v22, v21);

      id v24 = sub_262973D78();
      if (v23)
      {
        id v25 = objc_msgSend(v23, sel_urlRequest);
        if (v25)
        {
          int64_t v26 = v25;
          sub_26297BDE0();

          uint64_t v27 = sub_26297BE10();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 0, 1, v27);
        }
        else
        {
          uint64_t v27 = sub_26297BE10();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 1, 1, v27);
        }
        sub_26294758C((uint64_t)v8, (uint64_t)v10, &qword_26A980AC8);
        sub_26297BE10();
        uint64_t v34 = *(void *)(v27 - 8);
        long long v33 = 0;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v10, 1, v27) != 1)
        {
          long long v33 = (void *)sub_26297BDD0();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v27);
        }
      }
      else
      {
        uint64_t v32 = sub_26297BE10();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v10, 1, 1, v32);
        long long v33 = 0;
      }
      objc_msgSend(v24, sel_loadXMLUIWithRequest_, v33);
    }
    else
    {
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v28 = __swift_project_value_buffer(v11, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v28, v11);
      uint64_t v29 = sub_26297BFE0();
      os_log_type_t v30 = sub_26297CB70();
      if (os_log_type_enabled(v29, v30))
      {
        long long v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v31 = 0;
        _os_log_impl(&dword_262940000, v29, v30, "Add email url is missing from bag", v31, 2u);
        MEMORY[0x263E58CD0](v31, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
}

uint64_t sub_262974EB0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a3;
  uint64_t v7 = sub_26297C9A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_26297C9D0();
  uint64_t v11 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  id v14 = (void *)sub_26297CBE0();
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = v20;
  v15[2] = a1;
  v15[3] = v16;
  v15[4] = a4;
  v15[5] = a2;
  aBlock[4] = sub_262978F04;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = &block_descriptor_84;
  id v17 = _Block_copy(aBlock);
  swift_retain();
  id v18 = a2;
  swift_release();
  sub_26297C9C0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_262954D2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262954D84();
  sub_26297CC80();
  MEMORY[0x263E583E0](0, v13, v10, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v21);
}

uint64_t sub_26297515C(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_26297C000();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return a2(v9);
  }
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v7, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v12, v7);
  id v13 = a4;
  id v14 = a4;
  uint64_t v15 = sub_26297BFE0();
  os_log_type_t v16 = sub_26297CB70();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    id v23 = (void *)swift_slowAlloc();
    uint64_t v24 = a1;
    *(_DWORD *)uint64_t v17 = 134218242;
    sub_26297CC40();
    *(_WORD *)(v17 + 12) = 2112;
    if (a4)
    {
      id v18 = a4;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v24 = v19;
      sub_26297CC40();
    }
    else
    {
      uint64_t v24 = 0;
      sub_26297CC40();
      uint64_t v19 = 0;
    }
    uint64_t v21 = v23;
    void *v23 = v19;

    _os_log_impl(&dword_262940000, v15, v16, "Renew credentials for legacy iCloud mail creation failed. Result: %ld error: %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A980360);
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v21, -1, -1);
    MEMORY[0x263E58CD0](v17, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

id sub_262975474()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LegacyMailAccountCreator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LegacyMailAccountCreator()
{
  return self;
}

uint64_t sub_26297556C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v23 = a1;
  uint64_t v24 = a5;
  uint64_t v22 = a4;
  uint64_t v6 = sub_26297C9A0();
  uint64_t v27 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_26297C9D0();
  uint64_t v25 = *(void *)(v9 - 8);
  uint64_t v26 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12 - 8);
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  uint64_t v15 = (void *)sub_26297CBE0();
  sub_2629475F0(v22, (uint64_t)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26A980AC8);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v23;
  *(void *)(v17 + 24) = a3;
  sub_26294758C((uint64_t)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, &qword_26A980AC8);
  id v18 = v24;
  *(void *)(v17 + ((v14 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v24;
  aBlock[4] = sub_262978DA0;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = &block_descriptor_59;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v18;
  swift_retain();
  swift_release();
  sub_26297C9C0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_262954D2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262954D84();
  sub_26297CC80();
  MEMORY[0x263E583E0](0, v11, v8, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v11, v26);
}

unint64_t sub_2629758C8(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v106 = a4;
  uint64_t v103 = a2;
  uint64_t v104 = a3;
  id v108 = a1;
  uint64_t v109 = sub_26297C000();
  uint64_t v107 = *(void *)(v109 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v109);
  uint64_t v105 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v98 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v98 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v98 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  id v20 = (char *)&v98 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v98 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v98 - v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC0);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v29 = (char *)&v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v98 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v98 - v33;
  if (v108)
  {
    unint64_t result = (unint64_t)v106;
    if (v106)
    {
      id v36 = objc_msgSend(v106, sel_URL);
      uint64_t v37 = v109;
      id v38 = v105;
      if (v36)
      {
        long long v39 = v36;
        sub_26297BF00();

        uint64_t v40 = sub_26297BF30();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v29, 0, 1, v40);
      }
      else
      {
        uint64_t v40 = sub_26297BF30();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v29, 1, 1, v40);
      }
      sub_26294758C((uint64_t)v29, (uint64_t)v32, &qword_26A980AC0);
      sub_26297BF30();
      uint64_t v56 = *(void *)(v40 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v32, 1, v40) == 1)
      {
        sub_262947654((uint64_t)v32, &qword_26A980AC0);
        unint64_t v57 = 0xE300000000000000;
        uint64_t v58 = 7104878;
      }
      else
      {
        uint64_t v58 = sub_26297BEF0();
        unint64_t v57 = v59;
        (*(void (**)(char *, uint64_t))(v56 + 8))(v32, v40);
      }
      uint64_t v60 = v107;
      if (qword_26A97FAE0 != -1) {
        swift_once();
      }
      uint64_t v61 = __swift_project_value_buffer(v37, (uint64_t)qword_26A983738);
      (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v38, v61, v37);
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_26297BFE0();
      os_log_type_t v63 = sub_26297CB70();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = (uint8_t *)swift_slowAlloc();
        uint64_t v65 = swift_slowAlloc();
        v111[0] = v65;
        *(_DWORD *)uint64_t v64 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v110 = sub_26296B1B8(v58, v57, v111);
        sub_26297CC40();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_262940000, v62, v63, "Token renew failed for iCloud mail create url %s", v64, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E58CD0](v65, -1, -1);
        MEMORY[0x263E58CD0](v64, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v38, v109);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v38, v37);
      }
    }
    goto LABEL_60;
  }
  id v99 = v20;
  uint64_t v101 = v7;
  uint64_t v102 = v11;
  uint64_t v105 = v17;
  id v106 = v14;
  id v108 = v23;
  uint64_t v41 = v103 + 16;
  swift_beginAccess();
  unint64_t result = MEMORY[0x263E58D60](v41);
  if (!result) {
    return result;
  }
  id v42 = (char *)result;
  sub_2629475F0(v104, (uint64_t)v25, &qword_26A980AC8);
  uint64_t v43 = sub_26297BE10();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v98 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  unint64_t result = v98(v25, 1, v43);
  if (result == 1) {
    goto LABEL_61;
  }
  sub_26297BDF0();
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  uint64_t v103 = v44 + 8;
  id v100 = v45;
  v45((uint64_t)v25, v43);
  uint64_t v46 = sub_26297BF30();
  uint64_t v47 = *(void *)(v46 - 8);
  int v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48))(v34, 1, v46);
  uint64_t v49 = v109;
  if (v48 != 1)
  {
    sub_26297BEF0();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v46);
    uint64_t v66 = v42;
    uint64_t v67 = *(void **)&v42[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
    id v68 = objc_allocWithZone(MEMORY[0x263F25778]);
    id v69 = v67;
    uint64_t v70 = (void *)sub_26297CA50();
    swift_bridgeObjectRelease();
    id v71 = objc_msgSend(v68, sel_initWithURLString_account_, v70, v69);

    if (v71)
    {
      id v72 = objc_msgSend(v71, sel_urlRequest);
      uint64_t v73 = (uint64_t)v108;
      uint64_t v74 = (uint64_t)v106;
      if (v72)
      {
        uint64_t v75 = v72;
        uint64_t v76 = (uint64_t)v99;
        sub_26297BDE0();

        uint64_t v77 = 0;
        uint64_t v78 = v66;
        uint64_t v79 = (uint64_t)v105;
      }
      else
      {
        uint64_t v77 = 1;
        uint64_t v78 = v66;
        uint64_t v79 = (uint64_t)v105;
        uint64_t v76 = (uint64_t)v99;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v76, v77, 1, v43);
      sub_26294758C(v76, v73, &qword_26A980AC8);
      uint64_t v80 = (uint64_t)v102;
      uint64_t v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v98;
      int v82 = v98((char *)v73, 1, v43);
    }
    else
    {
      uint64_t v73 = (uint64_t)v108;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v108, 1, 1, v43);
      uint64_t v78 = v66;
      uint64_t v80 = (uint64_t)v102;
      uint64_t v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v98;
      uint64_t v79 = (uint64_t)v105;
      uint64_t v74 = (uint64_t)v106;
      int v82 = v98((char *)v73, 1, v43);
    }
    if (!v82)
    {
      sub_2629475F0(v104, v79, &qword_26A980AC8);
      unint64_t result = v81(v79, 1, v43);
      if (result == 1)
      {
LABEL_63:
        __break(1u);
        return result;
      }
      sub_26297BDB0();
      v100(v79, v43);
      sub_26297BDC0();
      uint64_t v80 = (uint64_t)v102;
    }
    sub_2629475F0(v104, v74, &qword_26A980AC8);
    unint64_t result = v81(v74, 1, v43);
    if (result == 1)
    {
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    sub_26297BDB0();
    uint64_t v84 = v83;
    v100(v74, v43);
    if (!v84) {
      goto LABEL_52;
    }
    uint64_t v85 = sub_26297CA90();
    uint64_t v87 = v86;
    swift_bridgeObjectRelease();
    if (v85 == 1414745936 && v87 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      uint64_t v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v98;
      int v88 = v98((char *)v73, 1, v43);
    }
    else
    {
      char v89 = sub_26297CDE0();
      swift_bridgeObjectRelease();
      uint64_t v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v98;
      if ((v89 & 1) == 0) {
        goto LABEL_52;
      }
      int v88 = v98((char *)v73, 1, v43);
    }
    if (!v88)
    {
      uint64_t v90 = &v78[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels];
      swift_beginAccess();
      unint64_t v91 = *(void *)v90;
      if (v91 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v92 = sub_26297CD30();
        if (v92)
        {
LABEL_42:
          unint64_t result = v92 - 1;
          if (__OFSUB__(v92, 1))
          {
            __break(1u);
          }
          else if ((v91 & 0xC000000000000001) == 0)
          {
            if ((result & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (result < *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              id v93 = *(id *)(v91 + 8 * result + 32);
              goto LABEL_47;
            }
            __break(1u);
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
          id v93 = (id)MEMORY[0x263E584D0](result, v91);
LABEL_47:
          uint64_t v94 = v93;
          swift_bridgeObjectRelease();
          id v95 = objc_msgSend(v94, sel_postbackData);

          if (v95)
          {
            sub_26297BF50();
          }
          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v92 = *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v92) {
          goto LABEL_42;
        }
      }
      swift_bridgeObjectRelease();
LABEL_51:
      sub_26297BE00();
    }
LABEL_52:
    id v96 = sub_262973D78();
    sub_2629475F0(v73, v80, &qword_26A980AC8);
    if (v81(v80, 1, v43) == 1)
    {
      id v97 = 0;
    }
    else
    {
      id v97 = (void *)sub_26297BDD0();
      v100(v80, v43);
    }
    objc_msgSend(v96, sel_loadXMLUIWithRequest_, v97);

    return sub_262947654(v73, &qword_26A980AC8);
  }
  sub_262947654((uint64_t)v34, &qword_26A980AC0);
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v50 = __swift_project_value_buffer(v49, (uint64_t)qword_26A983738);
  uint64_t v51 = v107;
  uint64_t v52 = v101;
  (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v101, v50, v49);
  uint64_t v53 = sub_26297BFE0();
  os_log_type_t v54 = sub_26297CB70();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v55 = 0;
    _os_log_impl(&dword_262940000, v53, v54, "Renewing account token for AddEmail is nil", v55, 2u);
    MEMORY[0x263E58CD0](v55, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v52, v49);
}

void sub_262976748(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = v6;
  v7[3] = a2;
  v7[4] = a3;
  v11[4] = sub_2629789A0;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_262973BB4;
  v11[3] = &block_descriptor_25;
  uint64_t v8 = _Block_copy(v11);
  id v9 = a3;
  id v10 = a2;
  swift_release();
  objc_msgSend(v5, sel_aa_updatePropertiesForAppleAccount_completion_, v10, v8);
  _Block_release(v8);
}

void sub_262976870(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8 = a3 + 16;
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x263E58D60](v8);
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = *(id *)(v9 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore);

    uint64_t v12 = (void *)swift_allocObject();
    void v12[2] = a3;
    uint64_t v12[3] = a4;
    v12[4] = a5;
    aBlock[4] = sub_2629789F8;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_262973BB4;
    aBlock[3] = &block_descriptor_31;
    uint64_t v13 = _Block_copy(aBlock);
    id v14 = a5;
    swift_retain();
    id v15 = a4;
    swift_release();
    objc_msgSend(v11, sel_saveVerifiedAccount_withCompletionHandler_, v15, v13);
    _Block_release(v13);
  }
}

void sub_2629769B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = a3 + 16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9801F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
  *(void *)(inited + 32) = sub_26297CA60();
  *(void *)(inited + 40) = v10;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 56) = sub_26297CA60();
  *(void *)(inited + 64) = v11;
  *(unsigned char *)(inited + 72) = 0;
  unint64_t v12 = sub_2629732B0(inited);
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x263E58D60](v8);
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = *(id *)(v13 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore);

    sub_262973790(v12);
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_26297CA10();
    swift_bridgeObjectRelease();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = a3;
    aBlock[4] = sub_262978A08;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_262973B3C;
    aBlock[3] = &block_descriptor_37;
    uint64_t v18 = _Block_copy(aBlock);
    id v19 = a5;
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_renewCredentialsForAccount_options_completion_, a4, v16, v18);
    _Block_release(v18);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_262976BB0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = sub_26297C9A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_26297C9D0();
  uint64_t v10 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
  uint64_t v13 = (void *)sub_26297CBE0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  aBlock[4] = sub_262978A54;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = &block_descriptor_43;
  id v15 = _Block_copy(aBlock);
  id v16 = a3;
  swift_retain();
  swift_release();
  sub_26297C9C0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_262954D2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262954D84();
  sub_26297CC80();
  MEMORY[0x263E583E0](0, v12, v9, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

void sub_262976E48(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = a2 + 16;
    objc_msgSend(a1, sel_stopActivityIndicator);
    swift_beginAccess();
    uint64_t v4 = MEMORY[0x263E58D60](v3);
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = sub_262973C70();

      aBlock[4] = sub_262978914;
      aBlock[5] = a2;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2629733C4;
      aBlock[3] = &block_descriptor_46;
      uint64_t v7 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, v7);
      _Block_release(v7);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_262976FF8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  id v45 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v44 = (uint64_t)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v42 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v42 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2629475F0(a2, (uint64_t)v18, &qword_26A980AC0);
  uint64_t v19 = sub_26297BF30();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  sub_26297BEF0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v19);
  uint64_t v21 = *(void **)(v5 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount);
  id v22 = objc_allocWithZone(MEMORY[0x263F25778]);
  id v23 = v21;
  uint64_t v24 = (void *)sub_26297CA50();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_initWithURLString_account_, v24, v23);

  id v43 = v25;
  if (v25)
  {
    id v26 = objc_msgSend(v25, sel_urlRequest);
    if (v26)
    {
      uint64_t v27 = v26;
      sub_26297BDE0();

      uint64_t v28 = sub_26297BE10();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v13, 0, 1, v28);
    }
    else
    {
      uint64_t v30 = sub_26297BE10();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v13, 1, 1, v30);
    }
    sub_26294758C((uint64_t)v13, (uint64_t)v15, &qword_26A980AC8);
  }
  else
  {
    uint64_t v29 = sub_26297BE10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v15, 1, 1, v29);
  }
  uint64_t v31 = sub_26297BE10();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  if (!v33(v15, 1, v31))
  {
    swift_bridgeObjectRetain();
    sub_26297BDC0();
  }
  if (!a4) {
    goto LABEL_26;
  }
  if (sub_26297CA90() == 1414745936 && v34 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v35 = sub_26297CDE0();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0) {
      goto LABEL_20;
    }
  }
  if (v33(v15, 1, v31))
  {
LABEL_20:
    id v38 = sub_262973D78();
    uint64_t v39 = v44;
    sub_2629475F0((uint64_t)v15, v44, &qword_26A980AC8);
    if (v33((char *)v39, 1, v31) == 1)
    {
      uint64_t v40 = 0;
    }
    else
    {
      uint64_t v40 = (void *)sub_26297BDD0();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v39, v31);
    }
    id v41 = v45;
    objc_msgSend(v38, sel_loadXMLUIWithRequest_, v40);

    if (v41)
    {
      objc_msgSend(v41, sel_startActivityIndicator);

      sub_262947654((uint64_t)v15, &qword_26A980AC8);
      return;
    }
    goto LABEL_27;
  }
  if (v45)
  {
    id v36 = objc_msgSend(v45, sel_postbackData);
    if (v36)
    {
      uint64_t v37 = v36;
      sub_26297BF50();
    }
    sub_26297BE00();
    goto LABEL_20;
  }
LABEL_28:
  __break(1u);
}

void sub_2629776B4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x263E58D60](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(void (**)(void))(v2 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler);
    sub_2629477D8((uint64_t)v4);

    if (v4)
    {
      v4();
      sub_262947914((uint64_t)v4);
    }
  }
}

uint64_t sub_262977864(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_26297788C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_26296B1B8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_26297CC40();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

void sub_262977904(void *a1, uint64_t a2)
{
  uint64_t v52 = a2;
  uint64_t v4 = sub_26297C000();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v45 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  if (objc_msgSend(a1, sel_statusCode) != (id)401) {
    return;
  }
  uint64_t v50 = v9;
  uint64_t v51 = (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2629475F0(v52, (uint64_t)v13, &qword_26A980AC8);
  uint64_t v17 = sub_26297BE10();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v13, 1, v17) == 1) {
    goto LABEL_16;
  }
  uint64_t v49 = v2;
  sub_26297BDF0();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v17);
  uint64_t v19 = sub_26297BF30();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v16, 1, v19) == 1)
  {
    sub_262947654((uint64_t)v16, &qword_26A980AC0);
    uint64_t v47 = 0;
    unint64_t v21 = 0xE000000000000000;
  }
  else
  {
    uint64_t v47 = sub_26297BEF0();
    unint64_t v21 = v22;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v19);
  }
  if (qword_26A97FAE0 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v4, (uint64_t)qword_26A983738);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_26297BFE0();
  os_log_type_t v25 = sub_26297CB90();
  BOOL v26 = os_log_type_enabled(v24, v25);
  int v48 = a1;
  if (v26)
  {
    uint64_t v46 = v5;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_26296B1B8(v47, v21, aBlock);
    sub_26297CC40();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_262940000, v24, v25, "Received 401 for URL %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E58CD0](v28, -1, -1);
    MEMORY[0x263E58CD0](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v4);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9801F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26297D7C0;
  *(void *)(inited + 32) = sub_26297CA60();
  *(void *)(inited + 40) = v30;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 56) = sub_26297CA60();
  *(void *)(inited + 64) = v31;
  *(unsigned char *)(inited + 72) = 0;
  unint64_t v32 = sub_2629732B0(inited);
  uint64_t v33 = *(void **)(v49 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount);
  id v34 = objc_msgSend(v33, sel_accountStore);
  if (!v34) {
    goto LABEL_17;
  }
  char v35 = v34;
  sub_262973790(v32);
  swift_bridgeObjectRelease();
  id v36 = (void *)sub_26297CA10();
  swift_bridgeObjectRelease();
  uint64_t v37 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v38 = v51;
  sub_2629475F0(v52, v51, &qword_26A980AC8);
  unint64_t v39 = (*(unsigned __int8 *)(v50 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  unint64_t v40 = (v10 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v37;
  sub_26294758C(v38, v41 + v39, &qword_26A980AC8);
  uint64_t v42 = v48;
  *(void *)(v41 + v40) = v48;
  aBlock[4] = (uint64_t)sub_262978BA8;
  aBlock[5] = v41;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_262973B3C;
  aBlock[3] = (uint64_t)&block_descriptor_53;
  id v43 = _Block_copy(aBlock);
  id v44 = v42;
  swift_release();
  objc_msgSend(v35, sel_renewCredentialsForAccount_options_completion_, v33, v36, v43);
  _Block_release(v43);
}

id sub_262977FF0(void *a1, void *a2)
{
  uint64_t v53 = a1;
  uint64_t v3 = sub_26297C9A0();
  uint64_t v52 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v50 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_26297C9D0();
  uint64_t v49 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_26297C9B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_26297C000();
  uint64_t v12 = *(void *)(v11 - 8);
  id result = (id)MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    goto LABEL_29;
  }
  if (objc_msgSend(a2, sel_topSignal) == (id)1)
  {
    uint64_t v48 = v3;
    if (qword_26A97FAE0 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v11, (uint64_t)qword_26A983738);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v16, v11);
    uint64_t v17 = sub_26297BFE0();
    os_log_type_t v18 = sub_26297CB90();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_262940000, v17, v18, "Dismissing iCloud Mail Create flow", v19, 2u);
      MEMORY[0x263E58CD0](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t v20 = v54;
    unint64_t v21 = *(void **)&v54[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
    objc_msgSend(v21, sel_setEnabled_forDataclass_, 1, *MEMORY[0x263EFACB8]);
    sub_2629522E4(0, (unint64_t *)&qword_26A97FD58);
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F080], v7);
    unint64_t v22 = (void *)sub_26297CC00();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v23 = (void *)swift_allocObject();
    void v23[2] = v20;
    v23[3] = v21;
    uint64_t v24 = v53;
    v23[4] = v53;
    aBlock[4] = sub_262978990;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2629733C4;
    aBlock[3] = &block_descriptor_18;
    os_log_type_t v25 = _Block_copy(aBlock);
    id v26 = v24;
    id v27 = v20;
    id v28 = v21;
    sub_26297C9C0();
    uint64_t aBlock[6] = MEMORY[0x263F8EE78];
    sub_262954D2C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
    sub_262954D84();
    uint64_t v29 = v50;
    uint64_t v30 = v48;
    sub_26297CC80();
    MEMORY[0x263E583E0](0, v6, v29, v25);
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v6, v51);
    return (id)swift_release();
  }
  id result = objc_msgSend(a2, sel_topSignal);
  if (result != (id)2) {
    return result;
  }
  uint64_t v31 = v54;
  unint64_t v32 = &v54[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels];
  swift_beginAccess();
  uint64_t v33 = *(void *)v32;
  if (*(void *)v32 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = (id)sub_26297CD30();
    uint64_t v34 = (uint64_t)result;
    if (!result) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (!v34) {
      goto LABEL_18;
    }
  }
  if (v34 < 1)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  for (uint64_t i = 0; i != v34; ++i)
  {
    if ((v33 & 0xC000000000000001) != 0) {
      id v36 = (id)MEMORY[0x263E584D0](i, v33);
    }
    else {
      id v36 = *(id *)(v33 + 8 * i + 32);
    }
    uint64_t v37 = v36;
    objc_msgSend(v36, sel_stopActivityIndicator);
  }
LABEL_18:
  id result = (id)swift_bridgeObjectRelease();
  uint64_t v38 = v53;
  if (!v53)
  {
LABEL_30:
    __break(1u);
    return result;
  }
  id v39 = sub_262973C70();
  objc_msgSend(v38, sel_presentInParentViewController_animated_, v39, 1);

  objc_msgSend(v38, sel_setDelegate_, v31);
  unint64_t v40 = *(void **)&v31[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter];
  id v41 = objc_msgSend(v40, sel_presentedViewController);
  id v42 = sub_262973C70();
  id v43 = v42;
  if (v41)
  {
    sub_2629522E4(0, (unint64_t *)&unk_26A980AD0);
    id v44 = v41;
    char v45 = sub_26297CC30();

    if (v45) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  id v46 = sub_262973C70();
  objc_msgSend(v40, sel_presentViewController_animated_completion_, v46, 1, 0);

LABEL_24:
  swift_beginAccess();
  id v47 = v38;
  MEMORY[0x263E582E0]();
  if (*(void *)((*(void *)v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v32 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
    sub_26297CB10();
  sub_26297CB20();
  sub_26297CB00();
  return (id)swift_endAccess();
}

void sub_26297874C(uint64_t a1, uint64_t a2)
{
  if (a2 && (a1 == 0x6C65636E6163 && a2 == 0xE600000000000000 || (sub_26297CDE0() & 1) != 0))
  {
    uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels);
    swift_beginAccess();
    *uint64_t v3 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    id v4 = sub_262973D78();
    objc_msgSend(v4, sel_cancel);

    id v5 = sub_262973D78();
    objc_msgSend(v5, sel_setDelegate_, 0);

    uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter);
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_262978914;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2629733C4;
    aBlock[3] = &block_descriptor_2;
    uint64_t v8 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, v8);
    _Block_release(v8);
  }
}

uint64_t sub_2629788DC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_262978914()
{
  sub_2629776B4(v0);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_262978948()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_262978990()
{
  sub_262976748(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

void sub_2629789A0(uint64_t a1, uint64_t a2)
{
  sub_262976870(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t objectdestroy_21Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2629789F8(uint64_t a1, uint64_t a2)
{
  sub_2629769B4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_262978A08(uint64_t a1, uint64_t a2)
{
  return sub_262976BB0(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t objectdestroy_33Tm()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_262978A54()
{
  sub_262976E48(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_262978A5C()
{
  return swift_release();
}

uint64_t sub_262978A64()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = sub_26297BE10();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = v7 + 8;

  return MEMORY[0x270FA0238](v0, v8, v2 | 7);
}

uint64_t sub_262978BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  unint64_t v8 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_26297556C(a1, a2, v7, v2 + v6, v8);
}

uint64_t sub_262978C5C()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = sub_26297BE10();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = v7 + 8;

  return MEMORY[0x270FA0238](v0, v8, v2 | 7);
}

unint64_t sub_262978DA0()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(char **)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_2629758C8(v3, v4, v0 + v2, v5);
}

uint64_t sub_262978E34()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_262978E6C()
{
  sub_2629746BC(*(char **)(v0 + 16));
}

void sub_262978E74()
{
}

void sub_262978E7C(void *a1, uint64_t a2)
{
  sub_262974A34(a1, a2, v2);
}

uint64_t sub_262978E84()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_262978EBC(uint64_t a1, void *a2)
{
  return sub_262974EB0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_262978EC4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_262978F04()
{
  return sub_26297515C(*(void *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

void sub_262978F10(uint64_t a1)
{
  sub_262974374(a1, v1);
}

unsigned char *storeEnumTagSinglePayload for FeatureFlag(unsigned char *result, int a2, int a3)
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
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x262979028);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

unint64_t sub_262979064()
{
  unint64_t result = qword_26A980B90;
  if (!qword_26A980B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980B90);
  }
  return result;
}

const char *sub_2629790B8()
{
  return "iCloudMailAccountUI";
}

const char *sub_2629790CC()
{
  return "iCloudMailAccountUIMain";
}

void sub_2629790E0(CGFloat *a1@<X8>)
{
  *a1 = sub_26295F938();
}

void sub_26297910C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_262979114()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980B98);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v32 = v0;
  uint64_t v33 = v1;
  MEMORY[0x270FA5388](v0);
  uint64_t v31 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_26297CC10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980BA0);
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v8 = v30;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v29 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v28 = (char *)&v28 - v11;
  uint64_t v12 = self;
  id v13 = objc_msgSend(v12, sel_defaultCenter);
  sub_26297CC20();

  sub_262979564();
  sub_26297C0C0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v6, v3);
  id v15 = objc_msgSend(v12, sel_defaultCenter);
  sub_26297CC20();

  uint64_t v16 = v29;
  sub_26297C0C0();
  v14(v6, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980BB0);
  uint64_t v17 = *(void *)(v30 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_26297D7C0;
  unint64_t v20 = v19 + v18;
  unint64_t v21 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 16);
  unint64_t v22 = v28;
  v21(v20, v28, v7);
  v21(v20 + v17, v16, v7);
  sub_262947E80(&qword_26A980BB8, &qword_26A980BA0);
  uint64_t v23 = v31;
  sub_26297C010();
  sub_262947E80(&qword_26A980BC0, &qword_26A980B98);
  uint64_t v24 = v32;
  uint64_t v25 = sub_26297C0B0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v24);
  id v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v16, v7);
  v26(v22, v7);
  return v25;
}

unint64_t sub_262979564()
{
  unint64_t result = qword_26A980BA8;
  if (!qword_26A980BA8)
  {
    sub_26297CC10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A980BA8);
  }
  return result;
}

uint64_t sub_2629795BC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t _s18CurrentBundleClassCMa()
{
  return self;
}

uint64_t sub_2629795F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_26297C830();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v144 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A980BC8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_26297D7C0;
  *(void *)(v8 + 32) = *(void *)(a1 + 72);
  swift_retain();
  *(void *)(v8 + 40) = sub_26297C7D0();
  *(void *)&v288[0] = v8;
  sub_26297CB00();
  MEMORY[0x263E58120](*(void *)&v288[0]);
  MEMORY[0x263E57C10](v390, 0.5, 0.0, 0.0, 0.75);
  uint64_t v217 = v390[0];
  uint64_t v162 = v390[2];
  uint64_t v163 = v390[1];
  uint64_t v160 = v390[4];
  uint64_t v161 = v390[3];
  sub_26297C940();
  sub_26297C1D0();
  uint64_t v158 = v392;
  uint64_t v159 = v390[5];
  int v153 = v393;
  int v154 = v391;
  uint64_t v156 = v395;
  uint64_t v157 = v394;
  _s18CurrentBundleClassCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v216 = (uint64_t (*)())ObjCClassFromMetadata;
  id v215 = self;
  id v10 = objc_msgSend(v215, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_26297C850();
  LODWORD(v219) = *MEMORY[0x263F1B4B8];
  uint64_t v11 = (uint64_t (*)())(v5 + 104);
  *(void *)&long long v218 = *(void *)(v5 + 104);
  ((void (*)(char *))v218)(v7);
  uint64_t v207 = sub_26297C840();
  swift_release();
  v165 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v166 = v5 + 8;
  v165(v7, v4);
  sub_26297C940();
  sub_26297C1D0();
  LOBYTE(v5) = v397;
  uint64_t v203 = v396;
  uint64_t v204 = v398;
  unsigned __int8 v12 = v399;
  uint64_t v205 = v401;
  uint64_t v206 = v400;
  v288[0] = *(_OWORD *)(a1 + 8);
  *(void *)&long long v214 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD50);
  sub_26297C870();
  id v13 = (void *)v371;
  sub_26297C990();
  uint64_t v201 = v15;
  uint64_t v202 = v14;
  sub_26297C7F0();
  uint64_t v200 = sub_26297C7E0();
  swift_release();
  unsigned __int8 v434 = 1;
  unsigned __int8 v431 = v5;
  unsigned __int8 v429 = v12;
  uint64_t v16 = (_OWORD *)swift_allocObject();
  long long v17 = *(_OWORD *)(a1 + 48);
  v16[3] = *(_OWORD *)(a1 + 32);
  v16[4] = v17;
  v16[5] = *(_OWORD *)(a1 + 64);
  long long v18 = *(_OWORD *)(a1 + 16);
  v16[1] = *(_OWORD *)a1;
  void v16[2] = v18;
  v199 = v16;
  int v196 = v434;
  int v437 = v432;
  __int16 v438 = v433;
  int v197 = v431;
  *(_DWORD *)((char *)v436 + 3) = *(_DWORD *)&v430[3];
  v436[0] = *(_DWORD *)v430;
  int v198 = v429;
  v435[0] = *(_DWORD *)v428;
  *(_DWORD *)((char *)v435 + 3) = *(_DWORD *)&v428[3];
  sub_26297B7DC((void **)a1);
  id v19 = objc_msgSend(v215, sel_bundleForClass_, v216);
  sub_26297C850();
  ((void (*)(char *, void, uint64_t))v218)(v7, v219, v4);
  uint64_t v195 = sub_26297C840();
  swift_release();
  v165(v7, v4);
  sub_26297C940();
  sub_26297C1D0();
  LOBYTE(v5) = v403;
  uint64_t v191 = v402;
  uint64_t v192 = v404;
  unsigned __int8 v20 = v405;
  uint64_t v193 = v407;
  uint64_t v194 = v406;
  v288[0] = *(_OWORD *)(a1 + 24);
  sub_26297C870();
  uint64_t v21 = v371;
  sub_26297C990();
  uint64_t v190 = v22;
  uint64_t v155 = v23;
  sub_26297C7F0();
  uint64_t v189 = sub_26297C7E0();
  swift_release();
  unsigned __int8 v445 = 1;
  unsigned __int8 v442 = v5;
  unsigned __int8 v440 = v20;
  uint64_t v24 = (_OWORD *)swift_allocObject();
  long long v25 = *(_OWORD *)(a1 + 48);
  void v24[3] = *(_OWORD *)(a1 + 32);
  v24[4] = v25;
  v24[5] = *(_OWORD *)(a1 + 64);
  long long v26 = *(_OWORD *)(a1 + 16);
  v24[1] = *(_OWORD *)a1;
  v24[2] = v26;
  v188 = v24;
  int v185 = v445;
  int v448 = v443;
  __int16 v449 = v444;
  int v186 = v442;
  *(_DWORD *)((char *)v447 + 3) = *(_DWORD *)&v441[3];
  v447[0] = *(_DWORD *)v441;
  int v187 = v440;
  v446[0] = *(_DWORD *)v439;
  *(_DWORD *)((char *)v446 + 3) = *(_DWORD *)&v439[3];
  sub_26297B7DC((void **)a1);
  id v27 = objc_msgSend(v215, sel_bundleForClass_, v216);
  sub_26297C850();
  v172 = v11;
  ((void (*)(char *, void, uint64_t))v218)(v7, v219, v4);
  uint64_t v184 = sub_26297C840();
  swift_release();
  *(void *)&long long v173 = v7;
  id v28 = v7;
  v177 = (uint64_t (*)())v4;
  uint64_t v29 = (void (*)(uint64_t, uint64_t (*)()))v165;
  v165(v28, v4);
  sub_26297C940();
  sub_26297C1D0();
  LOBYTE(v5) = v409;
  uint64_t v180 = v408;
  uint64_t v181 = v410;
  unsigned __int8 v30 = v411;
  uint64_t v182 = v413;
  uint64_t v183 = v412;
  v288[0] = *(_OWORD *)(a1 + 40);
  sub_26297C870();
  uint64_t v152 = v371;
  sub_26297C990();
  uint64_t v150 = v32;
  uint64_t v151 = v31;
  sub_26297C7F0();
  uint64_t v179 = sub_26297C7E0();
  swift_release();
  unsigned __int8 v456 = 1;
  unsigned __int8 v453 = v5;
  unsigned __int8 v451 = v30;
  uint64_t v33 = (_OWORD *)swift_allocObject();
  long long v34 = *(_OWORD *)(a1 + 48);
  v33[3] = *(_OWORD *)(a1 + 32);
  v33[4] = v34;
  v33[5] = *(_OWORD *)(a1 + 64);
  long long v35 = *(_OWORD *)(a1 + 16);
  v33[1] = *(_OWORD *)a1;
  _OWORD v33[2] = v35;
  v178 = v33;
  int v459 = v454;
  __int16 v460 = v455;
  int v174 = v456;
  int v175 = v453;
  *(_DWORD *)((char *)v458 + 3) = *(_DWORD *)&v452[3];
  v458[0] = *(_DWORD *)v452;
  int v176 = v451;
  v457[0] = *(_DWORD *)v450;
  *(_DWORD *)((char *)v457 + 3) = *(_DWORD *)&v450[3];
  sub_26297B8EC(a1, (uint64_t)&v426);
  sub_26297B8EC((uint64_t)&v426, (uint64_t)&v427);
  v164 = (_OWORD *)a1;
  if (v427)
  {
    sub_26297BA28(&v426);
    sub_26297B7DC((void **)a1);
    sub_26297BA28(&v426);
    sub_26297C810();
    uint64_t v36 = v173;
    uint64_t v37 = v177;
    ((void (*)(void, void, uint64_t (*)()))v218)(v173, v219, v177);
    uint64_t v213 = sub_26297C840();
    swift_release();
    v29(v36, v37);
    sub_26297C940();
    sub_26297C1D0();
    uint64_t v212 = v414;
    uint64_t v211 = v415;
    uint64_t v38 = v416;
    id v39 = v29;
    uint64_t v40 = v417;
    uint64_t v41 = v418;
    uint64_t v42 = v419;
    sub_26297C7F0();
    uint64_t v43 = sub_26297C7E0();
    swift_release();
    uint64_t v371 = v213;
    uint64_t v372 = v212;
    uint64_t v373 = v211;
    uint64_t v374 = v38;
    uint64_t v375 = v40;
    uint64_t v29 = v39;
    uint64_t v376 = v41;
    uint64_t v377 = v42;
    uint64_t v378 = v43;
    long long v379 = xmmword_26297DB60;
    uint64_t v380 = 0x4010000000000000;
    long long v381 = 0uLL;
    *(void *)&long long v382 = 0;
    BYTE8(v382) = 0;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC8);
    sub_26297B95C(&qword_26A97FCD0, &qword_26A97FCC0, (void (*)(void))sub_2629479AC);
    sub_26297B95C(&qword_26A97FCE8, &qword_26A97FCC8, (void (*)(void))sub_262947A20);
    sub_26297C460();
    sub_26297BA54(&v426);
    swift_release();
    swift_release();
  }
  else
  {
    sub_26297B7DC((void **)a1);
    sub_26297C820();
    uint64_t v44 = v173;
    char v45 = v177;
    ((void (*)(void, void, uint64_t (*)()))v218)(v173, v219, v177);
    uint64_t v213 = sub_26297C840();
    swift_release();
    v29(v44, v45);
    sub_26297C940();
    sub_26297C1D0();
    uint64_t v212 = v414;
    uint64_t v211 = v415;
    uint64_t v209 = v417;
    uint64_t v210 = v416;
    uint64_t v46 = v418;
    uint64_t v208 = v419;
    uint64_t v47 = sub_26297C800();
    uint64_t KeyPath = swift_getKeyPath();
    unsigned __int8 v49 = sub_26297C540();
    sub_26297C7F0();
    uint64_t v50 = sub_26297C7E0();
    swift_release();
    uint64_t v371 = v213;
    uint64_t v372 = v212;
    uint64_t v373 = v211;
    uint64_t v374 = v210;
    uint64_t v375 = v209;
    uint64_t v376 = v46;
    uint64_t v377 = v208;
    uint64_t v378 = KeyPath;
    *(void *)&long long v379 = v47;
    *((void *)&v379 + 1) = v49 | 0x10000;
    long long v381 = xmmword_26297DB60;
    uint64_t v380 = v50;
    *(void *)&long long v382 = 0x4010000000000000;
    BYTE8(v382) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FCC8);
    sub_26297B95C(&qword_26A97FCD0, &qword_26A97FCC0, (void (*)(void))sub_2629479AC);
    sub_26297B95C(&qword_26A97FCE8, &qword_26A97FCC8, (void (*)(void))sub_262947A20);
    sub_26297C460();
  }
  uint64_t v170 = *(void *)&v288[1];
  uint64_t v168 = *((void *)&v288[0] + 1);
  uint64_t v171 = *(void *)&v288[0];
  uint64_t v169 = *((void *)&v288[1] + 1);
  uint64_t v167 = *((void *)&v288[2] + 1);
  uint64_t v148 = *((void *)&v288[3] + 1);
  uint64_t v149 = *(void *)&v288[2];
  uint64_t v212 = *((void *)&v288[4] + 1);
  uint64_t v213 = *(void *)&v288[4];
  uint64_t v211 = *(void *)&v288[5];
  uint64_t v209 = *(void *)&v288[6];
  uint64_t v210 = *((void *)&v288[5] + 1);
  uint64_t v146 = *(void *)&v288[3];
  uint64_t v147 = *((void *)&v288[6] + 1);
  LODWORD(v208) = LOBYTE(v288[7]);
  id v51 = objc_msgSend(v215, sel_bundleForClass_, v216);
  sub_26297C850();
  uint64_t v52 = v173;
  uint64_t v53 = v177;
  ((void (*)(void, void, uint64_t (*)()))v218)(v173, v219, v177);
  uint64_t v145 = sub_26297C840();
  swift_release();
  v29(v52, v53);
  sub_26297C940();
  sub_26297C1D0();
  uint64_t v54 = v420;
  char v55 = v421;
  uint64_t v56 = v422;
  char v57 = v423;
  uint64_t v166 = v424;
  uint64_t v58 = v425;
  unint64_t v59 = (void **)v164;
  v288[0] = *(_OWORD *)((char *)v164 + 56);
  sub_26297C870();
  uint64_t v60 = v371;
  sub_26297C990();
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  sub_26297C7F0();
  uint64_t v65 = sub_26297C7E0();
  swift_release();
  unsigned __int8 v243 = 1;
  char v240 = v55;
  char v238 = v57;
  uint64_t v66 = (_OWORD *)swift_allocObject();
  uint64_t v67 = v59;
  long long v68 = *((_OWORD *)v59 + 3);
  v66[3] = *((_OWORD *)v59 + 2);
  v66[4] = v68;
  v66[5] = *((_OWORD *)v59 + 4);
  long long v69 = *((_OWORD *)v59 + 1);
  v66[1] = *(_OWORD *)v59;
  v66[2] = v69;
  unsigned __int8 v70 = v243;
  int v222 = v241;
  __int16 v223 = v242;
  char v71 = v240;
  v221[0] = *(_DWORD *)v239;
  *(_DWORD *)((char *)v221 + 3) = *(_DWORD *)&v239[3];
  v220[0] = *(_DWORD *)v237;
  *(_DWORD *)((char *)v220 + 3) = *(_DWORD *)&v237[3];
  int v235 = v437;
  __int16 v236 = v438;
  v234[0] = v436[0];
  *(_DWORD *)((char *)v234 + 3) = *(_DWORD *)((char *)v436 + 3);
  v233[0] = v435[0];
  *(_DWORD *)((char *)v233 + 3) = *(_DWORD *)((char *)v435 + 3);
  int v231 = v448;
  __int16 v232 = v449;
  v230[0] = v447[0];
  *(_DWORD *)((char *)v230 + 3) = *(_DWORD *)((char *)v447 + 3);
  v229[0] = v446[0];
  *(_DWORD *)((char *)v229 + 3) = *(_DWORD *)((char *)v446 + 3);
  int v227 = v459;
  __int16 v228 = v460;
  v226[0] = v458[0];
  *(_DWORD *)((char *)v226 + 3) = *(_DWORD *)((char *)v458 + 3);
  v225[0] = v457[0];
  *(_DWORD *)((char *)v225 + 3) = *(_DWORD *)((char *)v457 + 3);
  WORD3(v245) = v438;
  char v72 = v238;
  char v224 = v208;
  char v73 = v208;
  v244[0] = v207;
  v244[1] = 0;
  LOWORD(v245) = v196;
  *(_DWORD *)((char *)&v245 + 2) = v437;
  *((void *)&v245 + 1) = v203;
  LOBYTE(v246) = v197;
  DWORD1(v246) = *(_DWORD *)((char *)v436 + 3);
  *(_DWORD *)((char *)&v246 + 1) = v436[0];
  *((void *)&v246 + 1) = v204;
  LOBYTE(v247) = v198;
  DWORD1(v247) = *(_DWORD *)((char *)v435 + 3);
  *(_DWORD *)((char *)&v247 + 1) = v435[0];
  *((void *)&v247 + 1) = v206;
  *(void *)&long long v248 = v205;
  *((void *)&v248 + 1) = v13;
  *(void *)&long long v249 = v13;
  *((void *)&v249 + 1) = v202;
  *(void *)&v250[0] = v201;
  long long v218 = xmmword_26297FB90;
  *(_OWORD *)((char *)v250 + 8) = xmmword_26297FB90;
  v250[2] = xmmword_26297DB60;
  *((void *)&v250[1] + 1) = v200;
  *(void *)&long long v251 = 0x4010000000000000;
  v216 = sub_26297B794;
  *((void *)&v251 + 1) = sub_26297B794;
  v252 = v199;
  uint64_t v254 = 0;
  uint64_t v253 = 0;
  long long v255 = (unint64_t)v195;
  LOWORD(v256) = v185;
  WORD3(v256) = v449;
  *(_DWORD *)((char *)&v256 + 2) = v448;
  *((void *)&v256 + 1) = v191;
  LOBYTE(v257) = v186;
  DWORD1(v257) = *(_DWORD *)((char *)v447 + 3);
  *(_DWORD *)((char *)&v257 + 1) = v447[0];
  *((void *)&v257 + 1) = v192;
  LOBYTE(v258) = v187;
  DWORD1(v258) = *(_DWORD *)((char *)v446 + 3);
  *(_DWORD *)((char *)&v258 + 1) = v446[0];
  *((void *)&v258 + 1) = v194;
  *(void *)&long long v259 = v193;
  *((void *)&v259 + 1) = v21;
  *(void *)&long long v260 = v21;
  id v215 = v13;
  *((void *)&v260 + 1) = v190;
  uint64_t v74 = v155;
  *(void *)&v261[0] = v155;
  long long v214 = xmmword_26297FBA0;
  *(_OWORD *)((char *)v261 + 8) = xmmword_26297FBA0;
  *((void *)&v261[1] + 1) = v189;
  long long v262 = xmmword_26297DB60;
  *(void *)&long long v263 = 0x4010000000000000;
  v177 = sub_26297B854;
  WORD3(v267) = v460;
  *(_DWORD *)((char *)&v267 + 2) = v459;
  DWORD1(v268) = *(_DWORD *)((char *)v458 + 3);
  *(_DWORD *)((char *)&v268 + 1) = v458[0];
  *((void *)&v263 + 1) = sub_26297B854;
  long long v264 = (unint64_t)v188;
  uint64_t v265 = 0;
  long long v266 = (unint64_t)v184;
  LOWORD(v267) = v174;
  *((void *)&v267 + 1) = v180;
  LOBYTE(v268) = v175;
  *((void *)&v268 + 1) = v181;
  LOBYTE(v269) = v176;
  DWORD1(v269) = *(_DWORD *)((char *)v457 + 3);
  *(_DWORD *)((char *)&v269 + 1) = v457[0];
  *((void *)&v269 + 1) = v183;
  *(void *)&long long v270 = v182;
  uint64_t v76 = v151;
  uint64_t v75 = v152;
  *((void *)&v270 + 1) = v152;
  *(void *)&long long v271 = v152;
  *((void *)&v271 + 1) = v151;
  uint64_t v77 = v150;
  *(void *)&v272[0] = v150;
  long long v173 = xmmword_26297FBB0;
  *(_OWORD *)((char *)v272 + 8) = xmmword_26297FBB0;
  long long v273 = xmmword_26297DB60;
  *((void *)&v272[1] + 1) = v179;
  *(void *)&long long v274 = 0x4010000000000000;
  v172 = sub_26297B8A0;
  *((void *)&v274 + 1) = sub_26297B8A0;
  long long v275 = (unint64_t)v178;
  uint64_t v276 = 0;
  uint64_t v78 = v145;
  long long v277 = (unint64_t)v145;
  LOWORD(v278) = v243;
  WORD3(v278) = v242;
  *(_DWORD *)((char *)&v278 + 2) = v241;
  uint64_t v79 = v54;
  *((void *)&v278 + 1) = v54;
  LOBYTE(v279) = v240;
  DWORD1(v279) = *(_DWORD *)&v239[3];
  *(_DWORD *)((char *)&v279 + 1) = v221[0];
  uint64_t v80 = v56;
  *((void *)&v279 + 1) = v56;
  LOBYTE(v280) = v238;
  DWORD1(v280) = *(_DWORD *)&v237[3];
  *(_DWORD *)((char *)&v280 + 1) = v220[0];
  uint64_t v81 = v166;
  *((void *)&v280 + 1) = v166;
  uint64_t v82 = v58;
  *(void *)&long long v281 = v58;
  *((void *)&v281 + 1) = v60;
  *(void *)&long long v282 = v60;
  *((void *)&v282 + 1) = v62;
  *(void *)&v283[0] = v64;
  *(_OWORD *)((char *)v283 + 8) = xmmword_26297FBC0;
  uint64_t v83 = v65;
  *((void *)&v283[1] + 1) = v65;
  long long v284 = xmmword_26297DB60;
  long long v219 = xmmword_26297DB60;
  *(void *)&long long v285 = 0x4010000000000000;
  char v293 = v154;
  char v291 = v153;
  long long v84 = (unint64_t)v207;
  long long v85 = v245;
  long long v86 = v246;
  long long v87 = v247;
  long long v88 = v248;
  long long v89 = v249;
  long long v90 = v250[0];
  long long v91 = v250[1];
  long long v92 = v251;
  long long v93 = (unint64_t)v199;
  *(void *)(a2 + 272) = 0;
  *(void *)(a2 + 456) = v265;
  long long v94 = v263;
  *(_OWORD *)(a2 + 408) = v262;
  *(_OWORD *)(a2 + 424) = v94;
  *(_OWORD *)(a2 + 440) = v264;
  long long v95 = v260;
  *(_OWORD *)(a2 + 344) = v259;
  *(_OWORD *)(a2 + 360) = v95;
  long long v96 = v261[1];
  *(_OWORD *)(a2 + 376) = v261[0];
  *(_OWORD *)(a2 + 392) = v96;
  long long v97 = v256;
  *(_OWORD *)(a2 + 280) = v255;
  *(_OWORD *)(a2 + 296) = v97;
  long long v98 = v258;
  *(_OWORD *)(a2 + 312) = v257;
  *(_OWORD *)(a2 + 328) = v98;
  *(void *)(a2 + 640) = v276;
  uint64_t v287 = 0;
  *(_OWORD *)(a2 + 128) = v86;
  *(_OWORD *)(a2 + 144) = v87;
  long long v99 = v273;
  long long v100 = v274;
  long long v101 = v275;
  long long v102 = v270;
  long long v103 = v271;
  long long v104 = v272[0];
  long long v105 = v272[1];
  long long v106 = v266;
  long long v107 = v267;
  long long v108 = v268;
  long long v109 = v269;
  *(void *)((char *)&v288[11] + 7) = 0;
  *(_DWORD *)(a2 + 42) = v294;
  *(_WORD *)(a2 + 46) = v295;
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v292;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v292[3];
  *(_DWORD *)(a2 + 73) = *(_DWORD *)v290;
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v290[3];
  *(_WORD *)(a2 + 40) = 256;
  *(void *)(a2 + 48) = v159;
  *(unsigned char *)(a2 + 56) = v293;
  *(void *)(a2 + 64) = v158;
  *(unsigned char *)(a2 + 72) = v291;
  *(void *)(a2 + 80) = v157;
  char v289 = v73;
  *(void *)(a2 + 88) = v156;
  *(unsigned char *)(a2 + 760) = v73;
  int v299 = v222;
  *((void *)&v285 + 1) = sub_26297B9E0;
  long long v286 = (unint64_t)v66;
  *(_OWORD *)(a2 + 96) = v84;
  *(_OWORD *)(a2 + 112) = v85;
  *(_OWORD *)(a2 + 192) = v90;
  *(_OWORD *)(a2 + 208) = v91;
  *(_OWORD *)(a2 + 160) = v88;
  *(_OWORD *)(a2 + 176) = v89;
  *(_OWORD *)(a2 + 240) = v92;
  *(_OWORD *)(a2 + 256) = v93;
  *(_OWORD *)(a2 + 224) = xmmword_26297DB60;
  *(_OWORD *)(a2 + 592) = v99;
  *(_OWORD *)(a2 + 608) = v100;
  *(_OWORD *)(a2 + 624) = v101;
  *(_OWORD *)((char *)&v288[8] + 7) = v284;
  *(_OWORD *)((char *)&v288[9] + 7) = v285;
  *(_OWORD *)((char *)&v288[10] + 7) = v286;
  *(_OWORD *)((char *)&v288[4] + 7) = v281;
  *(_OWORD *)((char *)&v288[5] + 7) = v282;
  *(_OWORD *)((char *)&v288[6] + 7) = v283[0];
  *(_OWORD *)((char *)&v288[7] + 7) = v283[1];
  *(_OWORD *)((char *)v288 + 7) = v277;
  *(_OWORD *)((char *)&v288[1] + 7) = v278;
  *(_OWORD *)((char *)&v288[2] + 7) = v279;
  *(_OWORD *)((char *)&v288[3] + 7) = v280;
  long long v110 = v288[8];
  long long v111 = v288[9];
  long long v112 = v288[10];
  long long v113 = *(_OWORD *)((char *)&v288[10] + 15);
  long long v114 = v288[4];
  long long v115 = v288[5];
  long long v116 = v288[6];
  long long v117 = v288[7];
  long long v118 = v288[0];
  long long v119 = v288[1];
  long long v120 = v288[2];
  long long v121 = v288[3];
  *(_OWORD *)(a2 + 528) = v102;
  *(_OWORD *)(a2 + 544) = v103;
  *(_OWORD *)(a2 + 560) = v104;
  *(_OWORD *)(a2 + 576) = v105;
  *(_OWORD *)(a2 + 464) = v106;
  *(_OWORD *)(a2 + 480) = v107;
  *(_OWORD *)(a2 + 496) = v108;
  *(_OWORD *)(a2 + 512) = v109;
  *(void *)&long long v102 = v162;
  *(void *)(a2 + 8) = v163;
  *(void *)(a2 + 16) = v102;
  *(void *)&long long v102 = v160;
  *(void *)(a2 + 24) = v161;
  *(void *)(a2 + 32) = v102;
  *(void *)a2 = v217;
  *(void *)(a2 + 648) = v171;
  *(void *)(a2 + 656) = v168;
  *(void *)(a2 + 664) = v170;
  *(void *)(a2 + 672) = v169;
  uint64_t v123 = v148;
  uint64_t v122 = v149;
  *(void *)(a2 + 680) = v149;
  *(void *)(a2 + 688) = v167;
  uint64_t v125 = v146;
  uint64_t v124 = v147;
  *(void *)(a2 + 696) = v146;
  *(void *)(a2 + 704) = v123;
  uint64_t v126 = a2;
  uint64_t v127 = v213;
  *(void *)(a2 + 712) = v213;
  uint64_t v128 = v127;
  uint64_t v213 = v127;
  uint64_t v129 = v212;
  *(void *)(v126 + 720) = v212;
  uint64_t v212 = v129;
  uint64_t v130 = v211;
  *(void *)(v126 + 728) = v211;
  uint64_t v211 = v130;
  uint64_t v132 = v209;
  uint64_t v131 = v210;
  *(void *)(v126 + 736) = v210;
  uint64_t v209 = v132;
  uint64_t v210 = v131;
  *(void *)(v126 + 744) = v132;
  *(void *)(v126 + 752) = v124;
  v126 += 761;
  *(_OWORD *)(v126 + 128) = v110;
  *(_OWORD *)(v126 + 144) = v111;
  *(_OWORD *)(v126 + 160) = v112;
  *(_OWORD *)(v126 + 175) = v113;
  *(_OWORD *)(v126 + 64) = v114;
  *(_OWORD *)(v126 + 80) = v115;
  *(_OWORD *)(v126 + 96) = v116;
  *(_OWORD *)(v126 + 112) = v117;
  *(_OWORD *)uint64_t v126 = v118;
  *(_OWORD *)(v126 + 16) = v119;
  *(_OWORD *)(v126 + 32) = v120;
  *(_OWORD *)(v126 + 48) = v121;
  unsigned __int8 v297 = v70;
  __int16 v300 = v223;
  uint64_t v301 = v79;
  char v302 = v71;
  *(_DWORD *)v303 = v221[0];
  *(_DWORD *)&v303[3] = *(_DWORD *)((char *)v221 + 3);
  uint64_t v304 = v80;
  char v305 = v72;
  *(_DWORD *)v306 = v220[0];
  *(_DWORD *)&v306[3] = *(_DWORD *)((char *)v220 + 3);
  uint64_t v307 = v81;
  uint64_t v308 = v82;
  uint64_t v314 = v83;
  v317 = sub_26297B9E0;
  v318 = v66;
  v296[0] = v78;
  v296[1] = 0;
  char v298 = 0;
  uint64_t v309 = v60;
  uint64_t v310 = v60;
  uint64_t v311 = v62;
  uint64_t v312 = v64;
  long long v313 = xmmword_26297FBC0;
  long long v315 = xmmword_26297DB60;
  uint64_t v316 = 0x4010000000000000;
  uint64_t v319 = 0;
  uint64_t v320 = 0;
  sub_26297B7DC(v67);
  swift_bridgeObjectRetain();
  sub_262947C0C((uint64_t)v244);
  sub_262947C0C((uint64_t)&v255);
  sub_262947C0C((uint64_t)&v266);
  uint64_t v143 = v132;
  uint64_t v141 = v130;
  uint64_t v142 = v131;
  uint64_t v139 = v128;
  uint64_t v140 = v129;
  uint64_t v133 = v170;
  uint64_t v134 = v171;
  uint64_t v136 = v168;
  uint64_t v135 = v169;
  uint64_t v137 = v167;
  sub_262947774(v171, v168, v170, v169, v122, v167, v125, v123, v139, v140, v141, v142, v143, v124, v208);
  sub_262947C0C((uint64_t)&v277);
  sub_262947C74((uint64_t)v296);
  sub_2629478A4(v134, v136, v133, v135, v122, v137, v125, v123, v213, v212, v211, v210, v209, v124, v224);
  v321[0] = v184;
  v321[1] = 0;
  char v322 = v174;
  char v323 = 0;
  int v324 = v227;
  __int16 v325 = v228;
  uint64_t v326 = v180;
  char v327 = v175;
  *(_DWORD *)v328 = v226[0];
  *(_DWORD *)&v328[3] = *(_DWORD *)((char *)v226 + 3);
  uint64_t v329 = v181;
  char v330 = v176;
  *(_DWORD *)v331 = v225[0];
  *(_DWORD *)&v331[3] = *(_DWORD *)((char *)v225 + 3);
  uint64_t v332 = v183;
  uint64_t v333 = v182;
  uint64_t v334 = v75;
  uint64_t v335 = v75;
  uint64_t v336 = v76;
  uint64_t v337 = v77;
  long long v338 = v173;
  uint64_t v339 = v179;
  long long v340 = v219;
  uint64_t v341 = 0x4010000000000000;
  v342 = v172;
  v343 = v178;
  uint64_t v344 = 0;
  uint64_t v345 = 0;
  sub_262947C74((uint64_t)v321);
  v346[0] = v195;
  v346[1] = 0;
  char v347 = v185;
  char v348 = 0;
  int v349 = v231;
  __int16 v350 = v232;
  uint64_t v351 = v191;
  char v352 = v186;
  *(_DWORD *)v353 = v230[0];
  *(_DWORD *)&v353[3] = *(_DWORD *)((char *)v230 + 3);
  uint64_t v354 = v192;
  char v355 = v187;
  *(_DWORD *)&v356[3] = *(_DWORD *)((char *)v229 + 3);
  *(_DWORD *)v356 = v229[0];
  uint64_t v357 = v194;
  uint64_t v358 = v193;
  uint64_t v359 = v21;
  uint64_t v360 = v21;
  uint64_t v361 = v190;
  uint64_t v362 = v74;
  long long v363 = v214;
  long long v365 = v219;
  uint64_t v364 = v189;
  uint64_t v366 = 0x4010000000000000;
  v367 = v177;
  v368 = v188;
  uint64_t v369 = 0;
  uint64_t v370 = 0;
  sub_262947C74((uint64_t)v346);
  uint64_t v371 = v207;
  uint64_t v372 = 0;
  LOWORD(v373) = v196;
  *(_DWORD *)((char *)&v373 + 2) = v235;
  HIWORD(v373) = v236;
  uint64_t v374 = v203;
  LOBYTE(v375) = v197;
  *(_DWORD *)((char *)&v375 + 1) = v234[0];
  HIDWORD(v375) = *(_DWORD *)((char *)v234 + 3);
  uint64_t v376 = v204;
  LOBYTE(v377) = v198;
  HIDWORD(v377) = *(_DWORD *)((char *)v233 + 3);
  *(_DWORD *)((char *)&v377 + 1) = v233[0];
  uint64_t v378 = v206;
  *(void *)&long long v379 = v205;
  *((void *)&v379 + 1) = v215;
  uint64_t v380 = (uint64_t)v215;
  *(void *)&long long v381 = v202;
  *((void *)&v381 + 1) = v201;
  long long v382 = v218;
  uint64_t v383 = v200;
  long long v384 = v219;
  uint64_t v385 = 0x4010000000000000;
  v386 = v216;
  v387 = v199;
  uint64_t v388 = 0;
  uint64_t v389 = 0;
  sub_262947C74((uint64_t)&v371);
  return swift_bridgeObjectRelease();
}

uint64_t sub_26297AECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v26 = a2;
  uint64_t v7 = sub_26297C9A0();
  uint64_t v33 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_26297C9D0();
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  MEMORY[0x270FA5388](v10);
  unsigned __int8 v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_26297C9F0();
  uint64_t v28 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  long long v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v26 - v18;
  sub_262947CDC();
  unsigned __int8 v20 = (void *)sub_26297CBE0();
  sub_26297C9E0();
  MEMORY[0x263E581F0](v17, a5);
  id v27 = *(void (**)(char *, uint64_t))(v14 + 8);
  v27(v17, v13);
  uint64_t v21 = (_OWORD *)swift_allocObject();
  long long v22 = *(_OWORD *)(a1 + 48);
  v21[3] = *(_OWORD *)(a1 + 32);
  v21[4] = v22;
  v21[5] = *(_OWORD *)(a1 + 64);
  long long v23 = *(_OWORD *)(a1 + 16);
  v21[1] = *(_OWORD *)a1;
  v21[2] = v23;
  aBlock[4] = v29;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2629733C4;
  aBlock[3] = v30;
  uint64_t v24 = _Block_copy(aBlock);
  sub_26297B7DC((void **)a1);
  swift_release();
  sub_26297C9C0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_262954D2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A97FD60);
  sub_262947E80((unint64_t *)&qword_26A980AF0, &qword_26A97FD60);
  sub_26297CC80();
  MEMORY[0x263E58390](v19, v12, v9, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v32);
  return ((uint64_t (*)(char *, uint64_t))v27)(v19, v28);
}

uint64_t sub_26297B268()
{
  return swift_release();
}

void *sub_26297B2E4@<X0>(uint64_t *a1@<X8>)
{
  long long v3 = v1[3];
  void v9[2] = v1[2];
  v9[3] = v3;
  v9[4] = v1[4];
  long long v4 = v1[1];
  v9[0] = *v1;
  v9[1] = v4;
  uint64_t v5 = sub_26297C940();
  uint64_t v7 = v6;
  sub_2629795F0((uint64_t)v9, (uint64_t)__src);
  *a1 = v5;
  a1[1] = v7;
  return memcpy(a1 + 2, __src, 0x3B8uLL);
}

double sub_26297B358@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  sub_26297C860();
  sub_26297C860();
  sub_26297C860();
  sub_26297C860();
  double result = v7;
  *(void *)a3 = a1;
  a3[1] = v7;
  *((void *)a3 + 2) = v8;
  a3[3] = v7;
  *((void *)a3 + 4) = v8;
  a3[5] = v7;
  *((void *)a3 + 6) = v8;
  a3[7] = v7;
  *((void *)a3 + 8) = v8;
  *((void *)a3 + 9) = a2;
  return result;
}

uint64_t destroy for AccountCreationHeaderMemojiView(id *a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for AccountCreationHeaderMemojiView(void *a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  a1[8] = *(void *)(a2 + 64);
  a1[9] = v8;
  id v9 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AccountCreationHeaderMemojiView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for AccountCreationHeaderMemojiView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountCreationHeaderMemojiView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountCreationHeaderMemojiView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountCreationHeaderMemojiView()
{
  return &type metadata for AccountCreationHeaderMemojiView;
}

uint64_t sub_26297B774()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_26297B794()
{
  return sub_26297AECC(v0 + 16, (uint64_t)&unk_270DE3AF0, (uint64_t)sub_26297BCAC, (uint64_t)&block_descriptor_30, 0.525);
}

void **sub_26297B7DC(void **a1)
{
  unint64_t v2 = *a1;
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_26297B854()
{
  return sub_26297AECC(v0 + 16, (uint64_t)&unk_270DE3AA0, (uint64_t)sub_26297BBBC, (uint64_t)&block_descriptor_24, 0.325);
}

uint64_t sub_26297B8A0()
{
  return sub_26297AECC(v0 + 16, (uint64_t)&unk_270DE3A50, (uint64_t)sub_26297BB2C, (uint64_t)&block_descriptor_18_0, 0.425);
}

uint64_t sub_26297B8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9802B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26297B95C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_26297B9E0()
{
  return sub_26297AECC(v0 + 16, (uint64_t)&unk_270DE3A00, (uint64_t)sub_26297BA84, (uint64_t)&block_descriptor_3, 0.16);
}

id *sub_26297BA28(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_26297BA54(id *a1)
{
  return a1;
}

uint64_t sub_26297BA84()
{
  return sub_26297B268();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_26297BACC()
{
  return sub_26297C880();
}

uint64_t sub_26297BB2C()
{
  return sub_26297B268();
}

uint64_t sub_26297BB5C()
{
  return sub_26297C880();
}

uint64_t sub_26297BBBC()
{
  return sub_26297B268();
}

uint64_t sub_26297BBEC()
{
  return sub_26297C880();
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_26297BCAC()
{
  return sub_26297B268();
}

uint64_t sub_26297BCDC()
{
  return sub_26297C880();
}

uint64_t sub_26297BD38()
{
  return sub_262947E80(&qword_26A980BD0, &qword_26A980BD8);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_26297BDB0()
{
  return MEMORY[0x270EEDBA0]();
}

uint64_t sub_26297BDC0()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_26297BDD0()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_26297BDE0()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_26297BDF0()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_26297BE00()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_26297BE10()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_26297BE20()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_26297BE30()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_26297BE40()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_26297BE50()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_26297BE60()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_26297BE70()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_26297BE80()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_26297BE90()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_26297BEA0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_26297BEB0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_26297BEC0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_26297BED0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_26297BEE0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_26297BEF0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_26297BF00()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_26297BF10()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_26297BF20()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_26297BF30()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_26297BF40()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_26297BF50()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_26297BF60()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_26297BF70()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_26297BF80()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_26297BF90()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_26297BFA0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_26297BFB0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_26297BFC0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_26297BFD0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_26297BFE0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_26297BFF0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_26297C000()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_26297C010()
{
  return MEMORY[0x270EE3AC8]();
}

uint64_t sub_26297C020()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_26297C030()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_26297C040()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_26297C050()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_26297C060()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_26297C070()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_26297C080()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_26297C090()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_26297C0A0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_26297C0B0()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_26297C0C0()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_26297C0D0()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_26297C0E0()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_26297C0F0()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_26297C100()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_26297C110()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_26297C120()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_26297C130()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_26297C140()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_26297C150()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_26297C160()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_26297C170()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_26297C180()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_26297C190()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_26297C1A0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_26297C1B0()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_26297C1C0()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_26297C1D0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_26297C1E0()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_26297C1F0()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_26297C200()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_26297C210()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_26297C220()
{
  return MEMORY[0x270EFF800]();
}

uint64_t sub_26297C230()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_26297C240()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_26297C250()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_26297C260()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_26297C270()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_26297C280()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_26297C290()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_26297C2A0()
{
  return MEMORY[0x270F00628]();
}

uint64_t sub_26297C2B0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_26297C2C0()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_26297C2D0()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_26297C2E0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_26297C2F0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_26297C300()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_26297C310()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_26297C320()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_26297C330()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_26297C340()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_26297C350()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_26297C360()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_26297C370()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_26297C380()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_26297C390()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_26297C3A0()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_26297C3B0()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_26297C3C0()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_26297C3D0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_26297C3E0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_26297C3F0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_26297C400()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_26297C410()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_26297C420()
{
  return MEMORY[0x270F01190]();
}

uint64_t sub_26297C430()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_26297C440()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_26297C450()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_26297C460()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_26297C470()
{
  return MEMORY[0x270F01A48]();
}

uint64_t sub_26297C480()
{
  return MEMORY[0x270F01A68]();
}

uint64_t sub_26297C490()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_26297C4A0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_26297C4B0()
{
  return MEMORY[0x270F02518]();
}

uint64_t sub_26297C4C0()
{
  return MEMORY[0x270F02528]();
}

uint64_t sub_26297C4D0()
{
  return MEMORY[0x270F02570]();
}

uint64_t sub_26297C4E0()
{
  return MEMORY[0x270F02588]();
}

uint64_t sub_26297C4F0()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_26297C500()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_26297C510()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_26297C520()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_26297C530()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_26297C540()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_26297C550()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_26297C560()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_26297C570()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_26297C580()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_26297C590()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_26297C5A0()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_26297C5B0()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_26297C5C0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_26297C5D0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_26297C5E0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_26297C5F0()
{
  return MEMORY[0x270F02F50]();
}

uint64_t sub_26297C600()
{
  return MEMORY[0x270F02F60]();
}

uint64_t sub_26297C610()
{
  return MEMORY[0x270F02F68]();
}

uint64_t sub_26297C620()
{
  return MEMORY[0x270F02F70]();
}

uint64_t sub_26297C630()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_26297C640()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_26297C650()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_26297C660()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_26297C670()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_26297C680()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_26297C690()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_26297C6A0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_26297C6B0()
{
  return MEMORY[0x270F035B8]();
}

uint64_t sub_26297C6C0()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_26297C6D0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_26297C6E0()
{
  return MEMORY[0x270F03A08]();
}

uint64_t sub_26297C6F0()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_26297C700()
{
  return MEMORY[0x270F03D40]();
}

uint64_t sub_26297C710()
{
  return MEMORY[0x270F03D58]();
}

uint64_t sub_26297C720()
{
  return MEMORY[0x270F03E00]();
}

uint64_t sub_26297C730()
{
  return MEMORY[0x270F03E20]();
}

uint64_t sub_26297C740()
{
  return MEMORY[0x270F03F58]();
}

uint64_t sub_26297C750()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_26297C760()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_26297C770()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_26297C780()
{
  return MEMORY[0x270F04148]();
}

uint64_t sub_26297C790()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_26297C7A0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_26297C7B0()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_26297C7C0()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_26297C7D0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_26297C7E0()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_26297C7F0()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_26297C800()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_26297C810()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_26297C820()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_26297C830()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_26297C840()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_26297C850()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_26297C860()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_26297C870()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_26297C880()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_26297C890()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_26297C8A0()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_26297C8B0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_26297C8C0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_26297C8D0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_26297C8E0()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_26297C8F0()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_26297C900()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_26297C910()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_26297C920()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_26297C930()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_26297C940()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_26297C950()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_26297C960()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_26297C970()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_26297C980()
{
  return MEMORY[0x270F052D8]();
}

uint64_t sub_26297C990()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_26297C9A0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_26297C9B0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_26297C9C0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_26297C9D0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_26297C9E0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_26297C9F0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_26297CA00()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_26297CA10()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_26297CA20()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_26297CA30()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_26297CA40()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_26297CA50()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26297CA60()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_26297CA70()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_26297CA80()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_26297CA90()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_26297CAA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26297CAB0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_26297CAC0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_26297CAD0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_26297CAE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_26297CAF0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_26297CB00()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_26297CB10()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_26297CB20()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_26297CB30()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_26297CB40()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_26297CB50()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_26297CB60()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_26297CB70()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_26297CB80()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_26297CB90()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_26297CBA0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_26297CBB0()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_26297CBC0()
{
  return MEMORY[0x270FA0D00]();
}

uint64_t sub_26297CBD0()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_26297CBE0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_26297CBF0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_26297CC00()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_26297CC10()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_26297CC20()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_26297CC30()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_26297CC40()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_26297CC50()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_26297CC60()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_26297CC70()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_26297CC80()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_26297CC90()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_26297CCA0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_26297CCB0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_26297CCC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_26297CCD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_26297CCE0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_26297CCF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_26297CD00()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_26297CD10()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_26297CD20()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_26297CD30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_26297CD40()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_26297CD50()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_26297CD60()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_26297CD70()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_26297CD80()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_26297CD90()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_26297CDA0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_26297CDB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_26297CDC0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_26297CDD0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_26297CDE0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26297CDF0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_26297CE00()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_26297CE10()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_26297CE20()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_26297CE30()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_26297CE40()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_26297CE50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26297CE60()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_26297CE70()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_26297CE80()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_26297CE90()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}