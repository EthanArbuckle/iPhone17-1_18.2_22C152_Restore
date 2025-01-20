uint64_t sub_25CA67160()
{
  sub_25CA78E90();
  sub_25CA78EA0();
  return sub_25CA78EB0();
}

uint64_t sub_25CA671B0()
{
  return sub_25CA78EA0();
}

uint64_t sub_25CA671E8()
{
  return sub_25CA78EB0();
}

void *sub_25CA67234@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 10002) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 10001) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_25CA6725C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 10001;
  if (*v1) {
    uint64_t v2 = 10002;
  }
  *a1 = v2;
}

uint64_t sub_25CA67278(uint64_t a1, uint64_t a2)
{
  return sub_25CA67750(a1, a2, (uint64_t (*)(void))sub_25CA67FFC);
}

uint64_t sub_25CA67298()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA672E4()
{
  return sub_25CA78EA0();
}

uint64_t sub_25CA67318()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA67360@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25CA681F4(*a1);
  *a2 = result;
  return result;
}

void sub_25CA6738C(void *a1@<X8>)
{
  *a1 = *v1 + 10101;
}

uint64_t sub_25CA673A0(uint64_t a1, uint64_t a2)
{
  return sub_25CA67750(a1, a2, (uint64_t (*)(void))sub_25CA680A4);
}

uint64_t sub_25CA673B8()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA67404()
{
  return sub_25CA78EA0();
}

uint64_t sub_25CA67438()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA67480@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25CA6820C(*a1);
  *a2 = result;
  return result;
}

void sub_25CA674AC(void *a1@<X8>)
{
  *a1 = *v1 + 10201;
}

uint64_t sub_25CA674C0(uint64_t a1, uint64_t a2)
{
  return sub_25CA67750(a1, a2, (uint64_t (*)(void))sub_25CA6814C);
}

BOOL sub_25CA674D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25CA674F0()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA67540()
{
  return sub_25CA78EA0();
}

uint64_t sub_25CA67578()
{
  return sub_25CA78EB0();
}

void *sub_25CA675C4@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 10302) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 10301) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_25CA675EC(uint64_t *a1@<X8>)
{
  uint64_t v2 = 10301;
  if (*v1) {
    uint64_t v2 = 10302;
  }
  *a1 = v2;
}

uint64_t sub_25CA67604(uint64_t a1, uint64_t a2)
{
  return sub_25CA67750(a1, a2, (uint64_t (*)(void))sub_25CA681A0);
}

BOOL sub_25CA6761C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25CA67630()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA6767C()
{
  return sub_25CA78EA0();
}

uint64_t sub_25CA676B0()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA676F8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25CA68224(*a1);
  *a2 = result;
  return result;
}

void sub_25CA67724(void *a1@<X8>)
{
  *a1 = *v1 + 10401;
}

uint64_t sub_25CA67738(uint64_t a1, uint64_t a2)
{
  return sub_25CA67750(a1, a2, (uint64_t (*)(void))sub_25CA680F8);
}

uint64_t sub_25CA67750(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  unint64_t v6 = sub_25CA68050();
  return MEMORY[0x270F9FB50](a1, a2, v5, v6);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_25CA677C4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25CA677D0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginArgsError()
{
  return &type metadata for SiriMASPFLPluginArgsError;
}

uint64_t getEnumTagSinglePayload for ModelTrainerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModelTrainerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CA67948);
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

ValueMetadata *type metadata accessor for ModelTrainerError()
{
  return &type metadata for ModelTrainerError;
}

uint64_t getEnumTagSinglePayload for SiriMASPFLPluginRunnerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriMASPFLPluginRunnerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x25CA67ADCLL);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_25CA67B04(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginRunnerError()
{
  return &type metadata for SiriMASPFLPluginRunnerError;
}

uint64_t getEnumTagSinglePayload for BiomeSQLRowAggregatorError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BiomeSQLRowAggregatorError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x25CA67C78);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeSQLRowAggregatorError()
{
  return &type metadata for BiomeSQLRowAggregatorError;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18SiriMASPFLTraining25SiriMASPFLPluginArgsErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CA67E0CLL);
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

ValueMetadata *type metadata accessor for BiomeSQLClientError()
{
  return &type metadata for BiomeSQLClientError;
}

unint64_t sub_25CA67E48()
{
  unint64_t result = qword_26A5E7CE8;
  if (!qword_26A5E7CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7CE8);
  }
  return result;
}

unint64_t sub_25CA67EA0()
{
  unint64_t result = qword_26A5E7CF0;
  if (!qword_26A5E7CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7CF0);
  }
  return result;
}

unint64_t sub_25CA67EF8()
{
  unint64_t result = qword_26A5E7CF8;
  if (!qword_26A5E7CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7CF8);
  }
  return result;
}

unint64_t sub_25CA67F50()
{
  unint64_t result = qword_26A5E7D00;
  if (!qword_26A5E7D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7D00);
  }
  return result;
}

unint64_t sub_25CA67FA8()
{
  unint64_t result = qword_26A5E7D08;
  if (!qword_26A5E7D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7D08);
  }
  return result;
}

unint64_t sub_25CA67FFC()
{
  unint64_t result = qword_26A5E7D10;
  if (!qword_26A5E7D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7D10);
  }
  return result;
}

unint64_t sub_25CA68050()
{
  unint64_t result = qword_26A5E7D18;
  if (!qword_26A5E7D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7D18);
  }
  return result;
}

unint64_t sub_25CA680A4()
{
  unint64_t result = qword_26A5E7D20;
  if (!qword_26A5E7D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7D20);
  }
  return result;
}

unint64_t sub_25CA680F8()
{
  unint64_t result = qword_26A5E7D28;
  if (!qword_26A5E7D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7D28);
  }
  return result;
}

unint64_t sub_25CA6814C()
{
  unint64_t result = qword_26A5E7D30;
  if (!qword_26A5E7D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7D30);
  }
  return result;
}

unint64_t sub_25CA681A0()
{
  unint64_t result = qword_26A5E7D38[0];
  if (!qword_26A5E7D38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5E7D38);
  }
  return result;
}

uint64_t sub_25CA681F4(uint64_t a1)
{
  if ((unint64_t)(a1 - 10101) >= 8) {
    return 8;
  }
  else {
    return a1 - 10101;
  }
}

uint64_t sub_25CA6820C(uint64_t a1)
{
  if ((unint64_t)(a1 - 10201) >= 5) {
    return 5;
  }
  else {
    return a1 - 10201;
  }
}

uint64_t sub_25CA68224(uint64_t a1)
{
  if ((unint64_t)(a1 - 10401) >= 6) {
    return 6;
  }
  else {
    return a1 - 10401;
  }
}

unint64_t sub_25CA68250(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E78);
  uint64_t v2 = sub_25CA78D20();
  int v3 = (void *)v2;
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
    sub_25CA6BC80(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25CA78748(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25CA6BCE8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_25CA6837C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EE8);
  uint64_t v2 = (void *)sub_25CA78D20();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25CA78748(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 6;
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

unint64_t sub_25CA68490(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v44 = 0u;
    long long v45 = 0u;
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = v4[7];
  uint64_t v7 = v4[8];
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_25CA78748(v6, v7);
  if ((v9 & 1) == 0)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_25CA6C4E0(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v44);
  swift_bridgeObjectRelease();
  if (!*((void *)&v45 + 1))
  {
LABEL_11:
    sub_25CA6C480((uint64_t)&v44);
    goto LABEL_12;
  }
  if (swift_dynamicCast())
  {
    unint64_t result = sub_25CA689C8(a1);
    if (!v3)
    {
      uint64_t v12 = result;
      int v13 = v11;
      uint64_t v14 = v4 + 2;
      swift_beginAccess();
      uint64_t v15 = v4[2];
      if (*(void *)(v15 + 16) && (unint64_t v16 = sub_25CA78704(v43), (v17 & 1) != 0))
      {
        uint64_t v18 = *(void *)(*(void *)(v15 + 56) + 8 * v16);
        swift_retain();
        swift_retain();
        sub_25CA69ED8(v12);
        swift_release();
        v32 = (char **)(v18 + 24);
        swift_beginAccess();
        v33 = *(char **)(v18 + 24);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v18 + 24) = v33;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v33 = sub_25CA6A228(0, *((void *)v33 + 2) + 1, 1, v33);
          *v32 = v33;
        }
        unint64_t v35 = *((void *)v33 + 2);
        unint64_t v36 = *((void *)v33 + 3);
        unint64_t v37 = v35 + 1;
        if (v35 >= v36 >> 1)
        {
          unint64_t v42 = v35 + 1;
          v39 = v33;
          unint64_t v40 = *((void *)v33 + 2);
          v41 = sub_25CA6A228((char *)(v36 > 1), v35 + 1, 1, v39);
          unint64_t v35 = v40;
          unint64_t v37 = v42;
          v33 = v41;
          *v32 = v41;
        }
        *((void *)v33 + 2) = v37;
        *(_DWORD *)&v33[4 * v35 + 32] = v13;
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        swift_retain();
        char v38 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = *v14;
        *uint64_t v14 = 0x8000000000000000;
        sub_25CA6A8F8(v18, v43, v38);
        *uint64_t v14 = v46;
        swift_bridgeObjectRelease();
        swift_endAccess();
        return swift_release();
      }
      else
      {
        if (qword_26A5E7C80 != -1) {
          swift_once();
        }
        uint64_t v24 = sub_25CA78AA0();
        __swift_project_value_buffer(v24, (uint64_t)qword_26A5E9A10);
        v25 = sub_25CA78A80();
        os_log_type_t v26 = sub_25CA78C30();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v27 = 134217984;
          sub_25CA78C60();
          _os_log_impl(&dword_25CA65000, v25, v26, "Initializing training data for aggregating value %ld", v27, 0xCu);
          MEMORY[0x26119CCC0](v27, -1, -1);
        }

        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7ED0);
        uint64_t v28 = swift_allocObject();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7ED8);
        v29 = (void *)swift_allocObject();
        v29[3] = 1;
        v29[4] = *(void *)(v12 + 16);
        v29[2] = v12;
        *(void *)(v28 + 16) = v29;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E88);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_25CA79940;
        *(_DWORD *)(v30 + 32) = v13;
        *(void *)(v28 + 24) = v30;
        swift_beginAccess();
        char v31 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = *v14;
        *uint64_t v14 = 0x8000000000000000;
        sub_25CA6A8F8(v28, v43, v31);
        *uint64_t v14 = v46;
        swift_bridgeObjectRelease();
        return swift_endAccess();
      }
    }
    return result;
  }
LABEL_12:
  if (qword_26A5E7C80 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25CA78AA0();
  __swift_project_value_buffer(v19, (uint64_t)qword_26A5E9A10);
  v20 = sub_25CA78A80();
  os_log_type_t v21 = sub_25CA78C40();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_25CA65000, v20, v21, "aggregatingValue not found.", v22, 2u);
    MEMORY[0x26119CCC0](v22, -1, -1);
  }

  sub_25CA6B07C();
  swift_allocError();
  unsigned char *v23 = 2;
  return swift_willThrow();
}

unint64_t sub_25CA689C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1[9] + 16);
  if (!v4)
  {
    unint64_t v8 = MEMORY[0x263F8EE78];
LABEL_22:
    uint64_t v19 = v2[10];
    unint64_t v18 = v2[11];
    if (*(void *)(a1 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_25CA78748(v19, v18);
      if (v21)
      {
        sub_25CA6C4E0(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v47);
      }
      else
      {
        long long v47 = 0u;
        long long v48 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v48 + 1))
      {
        sub_25CA6BCE8(&v47, v49);
        unint64_t v22 = sub_25CA6C010((uint64_t)v49);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
        if ((v22 & 0x100000000) == 0) {
          return v8;
        }
        swift_bridgeObjectRelease();
LABEL_32:
        if (qword_26A5E7C80 != -1) {
          swift_once();
        }
        uint64_t v23 = sub_25CA78AA0();
        __swift_project_value_buffer(v23, (uint64_t)qword_26A5E9A10);
        swift_bridgeObjectRetain_n();
        swift_retain();
        uint64_t v24 = sub_25CA78A80();
        os_log_type_t v25 = sub_25CA78C40();
        unint64_t v8 = v25;
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = swift_slowAlloc();
          uint64_t v45 = swift_slowAlloc();
          *(void *)&v49[0] = v45;
          *(_DWORD *)uint64_t v26 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)&long long v47 = sub_25CA77FF0(v19, v18, (uint64_t *)v49);
          sub_25CA78C60();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v27 = sub_25CA78AF0();
          unint64_t v29 = v28;
          swift_bridgeObjectRelease();
          *(void *)&long long v47 = sub_25CA77FF0(v27, v29, (uint64_t *)v49);
          sub_25CA78C60();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25CA65000, v24, (os_log_type_t)v8, "Couldn't find %s value in %s", (uint8_t *)v26, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x26119CCC0](v45, -1, -1);
          uint64_t v30 = v26;
LABEL_42:
          MEMORY[0x26119CCC0](v30, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release();
        }
        goto LABEL_43;
      }
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_25CA6C480((uint64_t)&v47);
    goto LABEL_32;
  }
  long long v44 = v1;
  uint64_t v6 = v1[10];
  uint64_t v5 = v1[11];
  uint64_t v7 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
  unint64_t v8 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v10 = *(v7 - 1);
    unint64_t v9 = *v7;
    BOOL v11 = v10 == v6 && v9 == v5;
    if (v11 || (sub_25CA78E10() & 1) != 0) {
      goto LABEL_4;
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    swift_bridgeObjectRetain_n();
    unint64_t v12 = sub_25CA78748(v10, v9);
    if (v13)
    {
      sub_25CA6C4E0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v47);
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((void *)&v48 + 1)) {
      goto LABEL_38;
    }
    sub_25CA6BCE8(&v47, v49);
    unint64_t v14 = sub_25CA6C010((uint64_t)v49);
    if ((v14 & 0x100000000) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26A5E7C80 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_25CA78AA0();
      __swift_project_value_buffer(v38, (uint64_t)qword_26A5E9A10);
      swift_bridgeObjectRetain();
      v39 = sub_25CA78A80();
      os_log_type_t v40 = sub_25CA78C40();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        *(void *)&long long v47 = v42;
        *(_DWORD *)v41 = 136315138;
        unint64_t v8 = (unint64_t)(v41 + 12);
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_25CA77FF0(v10, v9, (uint64_t *)&v47);
        sub_25CA78C60();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25CA65000, v39, v40, "Unable to convert value for %s to float", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26119CCC0](v42, -1, -1);
        MEMORY[0x26119CCC0](v41, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_25CA6B07C();
      swift_allocError();
      *uint64_t v43 = 4;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
      return v8;
    }
    int v15 = v14;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v8 = (unint64_t)sub_25CA6A228(0, *(void *)(v8 + 16) + 1, 1, (char *)v8);
    }
    unint64_t v17 = *(void *)(v8 + 16);
    unint64_t v16 = *(void *)(v8 + 24);
    if (v17 >= v16 >> 1) {
      unint64_t v8 = (unint64_t)sub_25CA6A228((char *)(v16 > 1), v17 + 1, 1, (char *)v8);
    }
    *(void *)(v8 + 16) = v17 + 1;
    *(_DWORD *)(v8 + 4 * v17 + 32) = v15;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
LABEL_4:
    v7 += 2;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v44;
      goto LABEL_22;
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  swift_bridgeObjectRetain();
LABEL_38:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25CA6C480((uint64_t)&v47);
  if (qword_26A5E7C80 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_25CA78AA0();
  __swift_project_value_buffer(v31, (uint64_t)qword_26A5E9A10);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_25CA78A80();
  os_log_type_t v32 = sub_25CA78C40();
  if (os_log_type_enabled(v24, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(void *)&v49[0] = v46;
    *(_DWORD *)uint64_t v33 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v47 = sub_25CA77FF0(v10, v9, (uint64_t *)v49);
    sub_25CA78C60();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_25CA78AF0();
    unint64_t v8 = v35;
    swift_bridgeObjectRelease();
    *(void *)&long long v47 = sub_25CA77FF0(v34, v8, (uint64_t *)v49);
    sub_25CA78C60();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25CA65000, v24, v32, "Couldn't find %s value in %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x26119CCC0](v46, -1, -1);
    uint64_t v30 = v33;
    goto LABEL_42;
  }

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
LABEL_43:
  sub_25CA6B07C();
  swift_allocError();
  *unint64_t v36 = 4;
  swift_willThrow();
  return v8;
}

uint64_t sub_25CA69210()
{
  v62[6] = *(void **)MEMORY[0x263EF8340];
  v60 = *(void **)(v0[9] + 16);
  uint64_t v61 = MEMORY[0x263F8EE78];
  swift_beginAccess();
  v56 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_25CA6AF5C(v2);
  swift_bridgeObjectRelease();
  v62[0] = v3;
  swift_bridgeObjectRetain();
  sub_25CA6AEF0(v62);
  if (v1)
  {
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    swift_release();
    uint64_t v4 = v62[0];
    uint64_t v5 = v62[0][2];
    if (v5)
    {
      uint64_t v6 = 40;
      v55 = v62[0];
      while (1)
      {
        uint64_t v7 = *(void *)((char *)v4 + v6);
        uint64_t v8 = *(void *)(v7 + 16);
        unint64_t v9 = *(void **)(v8 + 32);
        if (v9 != v60) {
          break;
        }
        uint64_t v57 = v6;
        uint64_t v58 = v5;
        swift_beginAccess();
        uint64_t v10 = *(char **)(v8 + 16);
        swift_retain();
        swift_retain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v8 + 16) = v10;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v10 = sub_25CA6BBEC((uint64_t)v10);
        }
        *(void *)(v8 + 16) = v10;
        swift_endAccess();
        swift_release();
        swift_beginAccess();
        unint64_t v12 = *(char **)(v7 + 24);
        char v13 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v7 + 24) = v12;
        if ((v13 & 1) == 0) {
          unint64_t v12 = sub_25CA6BBEC((uint64_t)v12);
        }
        v59 = v10 + 32;
        *(void *)(v7 + 24) = v12;
        swift_endAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E48);
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_25CA79950;
        *(void *)(v14 + 32) = sub_25CA78C00();
        *(void *)(v14 + 40) = sub_25CA78C00();
        v62[0] = (void *)v14;
        sub_25CA78B70();
        uint64_t v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_25CA79950;
        *(void *)(v15 + 32) = sub_25CA78C00();
        *(void *)(v15 + 40) = sub_25CA78C00();
        v62[0] = (void *)v15;
        sub_25CA78B70();
        id v16 = objc_allocWithZone(MEMORY[0x263F00DA8]);
        sub_25CA6BC44(0, &qword_26A5E7E50);
        unint64_t v17 = (void *)sub_25CA78B60();
        swift_bridgeObjectRelease();
        unint64_t v18 = (void *)sub_25CA78B60();
        swift_bridgeObjectRelease();
        v62[0] = 0;
        id v19 = objc_msgSend(v16, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, v59, v17, 65568, v18, 0, v62);

        unint64_t v20 = v62[0];
        if (!v19)
        {
          uint64_t v4 = v62[0];
          v41 = (void *)sub_25CA78970();

          swift_willThrow();
          swift_release();
LABEL_23:
          swift_bridgeObjectRelease();
          if (qword_26A5E7C80 != -1) {
            swift_once();
          }
          uint64_t v42 = sub_25CA78AA0();
          __swift_project_value_buffer(v42, (uint64_t)qword_26A5E9A10);
          id v43 = v41;
          id v44 = v41;
          uint64_t v45 = sub_25CA78A80();
          os_log_type_t v46 = sub_25CA78C40();
          if (os_log_type_enabled(v45, v46))
          {
            long long v47 = (uint8_t *)swift_slowAlloc();
            long long v48 = (void *)swift_slowAlloc();
            *(_DWORD *)long long v47 = 138412290;
            uint64_t v4 = v47 + 12;
            id v49 = v41;
            uint64_t v50 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v62[0] = v50;
            sub_25CA78C60();
            *long long v48 = v50;

            _os_log_impl(&dword_25CA65000, v45, v46, "Error forming MLBatchProvider: %@", v47, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E58);
            swift_arrayDestroy();
            MEMORY[0x26119CCC0](v48, -1, -1);
            MEMORY[0x26119CCC0](v47, -1, -1);
          }
          else
          {
          }
          sub_25CA6B07C();
          swift_allocError();
          unsigned char *v51 = 6;
          swift_willThrow();

          goto LABEL_29;
        }
        uint64_t v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = xmmword_25CA79960;
        unint64_t v22 = v20;
        *(void *)(v21 + 32) = sub_25CA78C00();
        v62[0] = (void *)v21;
        sub_25CA78B70();
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_25CA79960;
        *(void *)(v23 + 32) = sub_25CA78C50();
        v62[0] = (void *)v23;
        sub_25CA78B70();
        id v24 = objc_allocWithZone(MEMORY[0x263F00DA8]);
        os_log_type_t v25 = (void *)sub_25CA78B60();
        swift_bridgeObjectRelease();
        uint64_t v26 = (void *)sub_25CA78B60();
        swift_bridgeObjectRelease();
        v62[0] = 0;
        id v27 = objc_msgSend(v24, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, v12 + 32, v25, 65568, v26, 0, v62);

        unint64_t v28 = v62[0];
        if (!v27)
        {
          uint64_t v4 = v62[0];
          v41 = (void *)sub_25CA78970();

          swift_willThrow();
          swift_release();

          goto LABEL_23;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E60);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25CA79970;
        uint64_t v30 = v56[4];
        *(void *)(inited + 32) = v56[3];
        *(void *)(inited + 40) = v30;
        uint64_t v31 = sub_25CA6BC44(0, &qword_26A5E7E68);
        *(void *)(inited + 72) = v31;
        *(void *)(inited + 48) = v19;
        uint64_t v32 = v56[6];
        *(void *)(inited + 80) = v56[5];
        *(void *)(inited + 88) = v32;
        *(void *)(inited + 120) = v31;
        *(void *)(inited + 96) = v27;
        uint64_t v33 = v28;
        swift_bridgeObjectRetain();
        id v34 = v19;
        swift_bridgeObjectRetain();
        id v35 = v27;
        sub_25CA68250(inited);
        id v36 = objc_allocWithZone(MEMORY[0x263F00D38]);
        sub_25CA6A140();
        uint64_t v4 = v55;
        MEMORY[0x26119C4E0]();
        if (*(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25CA78B80();
        }
        sub_25CA78BA0();
        sub_25CA78B70();
        swift_release();

        uint64_t v6 = v57 + 16;
        uint64_t v5 = v58 - 1;
        if (v58 == 1) {
          goto LABEL_14;
        }
      }
      swift_retain();
      swift_release();
      swift_bridgeObjectRelease();
      if (qword_26A5E7C80 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_25CA78AA0();
      __swift_project_value_buffer(v37, (uint64_t)qword_26A5E9A10);
      uint64_t v38 = sub_25CA78A80();
      os_log_type_t v39 = sub_25CA78C40();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v4 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v4 = 134218240;
        v62[0] = v9;
        sub_25CA78C60();
        *((_WORD *)v4 + 6) = 2048;
        v62[0] = v60;
        sub_25CA78C60();
        _os_log_impl(&dword_25CA65000, v38, v39, "Mismatch in number of columns in trainingData %ld and number of features in arg %ld", (uint8_t *)v4, 0x16u);
        MEMORY[0x26119CCC0](v4, -1, -1);
      }

      sub_25CA6B07C();
      swift_allocError();
      *os_log_type_t v40 = 5;
      swift_willThrow();
LABEL_29:
      swift_release();
    }
    else
    {
LABEL_14:
      swift_release();
      id v52 = objc_allocWithZone(MEMORY[0x263F00D10]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E70);
      v53 = (void *)sub_25CA78B60();
      swift_bridgeObjectRelease();
      uint64_t v4 = objc_msgSend(v52, sel_initWithFeatureProviderArray_, v53);
    }
    return (uint64_t)v4;
  }
  return result;
}

uint64_t sub_25CA69B60()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for BiomeSQLRowAggregator()
{
  return self;
}

uint64_t sub_25CA69BE8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25CA69C3C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for InputMatrix();
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_retain();
  swift_retain();
  BOOL v6 = sub_25CA69D48(v4, v5);
  swift_release();
  swift_release();
  if (v6)
  {
    swift_beginAccess();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v7 = sub_25CA78BB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

BOOL sub_25CA69D48(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_25CA78BB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v4 & 1) != 0 && *(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32);
}

uint64_t sub_25CA69E1C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for TrainingData()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25CA69E74()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25CA69ECC(uint64_t *a1, uint64_t *a2)
{
  return sub_25CA69C3C(*a1, *a2);
}

uint64_t sub_25CA69ED8(uint64_t a1)
{
  if (*(void *)(a1 + 16) == *(void *)(v1 + 32))
  {
    swift_beginAccess();
    uint64_t v2 = swift_bridgeObjectRetain();
    sub_25CA69F9C(v2);
    uint64_t result = swift_endAccess();
    uint64_t v4 = *(void *)(v1 + 24);
    BOOL v5 = __OFADD__(v4, 1);
    uint64_t v6 = v4 + 1;
    if (v5) {
      __break(1u);
    }
    else {
      *(void *)(v1 + 24) = v6;
    }
  }
  else
  {
    sub_25CA6B07C();
    swift_allocError();
    *char v7 = 3;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_25CA69F9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_25CA6A228(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = &v3[4 * v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[4 * v2] && (unint64_t)v9 < a1 + 32 + 4 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 4 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    void *v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25CA78D30();
  __break(1u);
  return result;
}

uint64_t sub_25CA6A0E4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for InputMatrix()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_25CA6A134(uint64_t *a1, uint64_t *a2)
{
  return sub_25CA69D48(*a1, *a2);
}

id sub_25CA6A140()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_25CA78AD0();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_25CA78970();

    swift_willThrow();
  }
  return v2;
}

char *sub_25CA6A228(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E88);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_25CA6C388(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25CA6A338(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EE0);
  uint64_t result = sub_25CA78D10();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_25CA78E80();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

uint64_t sub_25CA6A5F0(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EE8);
  char v37 = a2;
  uint64_t v6 = sub_25CA78D10();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          id v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    int v33 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25CA78E90();
    sub_25CA78B10();
    uint64_t result = sub_25CA78EB0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v3 = v35;
  int64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

uint64_t sub_25CA6A8F8(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25CA78704(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25CA6AB9C();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_25CA6A338(result, a3 & 1);
  uint64_t result = sub_25CA78704(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25CA78E30();
  __break(1u);
  return result;
}

uint64_t sub_25CA6AA34(uint64_t a1, uint64_t a2, char a3, float a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25CA78748(a1, a2);
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
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25CA6AD40();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(float *)(v18[7] + 4 * v12) = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_25CA6A5F0(result, a3 & 1);
  uint64_t result = sub_25CA78748(a1, a2);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_25CA78E30();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a1;
  v20[1] = a2;
  *(float *)(v18[7] + 4 * v12) = a4;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;
  return swift_bridgeObjectRetain();
}

void *sub_25CA6AB9C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25CA78D00();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25CA6AD40()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25CA78D00();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v19 = 4 * v15;
    int v20 = *(_DWORD *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_25CA6AEF0(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_25CA6BCF8(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_25CA6B0D0(v5);
  *a1 = v2;
  return result;
}

void *sub_25CA6AF5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EA0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_25CA6BD0C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25CA6C478();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_25CA6B07C()
{
  unint64_t result = qword_26A5E7E40;
  if (!qword_26A5E7E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7E40);
  }
  return result;
}

uint64_t sub_25CA6B0D0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25CA78DF0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v85 = 0;
      uint64_t v86 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v88 = *(void *)(v86 + 16 * i);
        uint64_t v89 = v85;
        do
        {
          if (v88 >= *(void *)(v86 + v89)) {
            break;
          }
          if (!v86) {
            goto LABEL_140;
          }
          v90 = (void *)(v86 + v89);
          uint64_t v91 = *(void *)(v86 + v89 + 24);
          *(_OWORD *)(v86 + v89 + 16) = *(_OWORD *)(v86 + v89);
          void *v90 = v88;
          v90[1] = v91;
          v89 -= 16;
        }
        while (v89 != -16);
        v85 += 16;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  uint64_t v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      unint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      v92 = v12;
      uint64_t v103 = v9;
      if (v13 >= 2)
      {
        uint64_t v93 = *v101;
        do
        {
          unint64_t v94 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v93) {
            goto LABEL_144;
          }
          v95 = v92;
          uint64_t v96 = *(void *)&v92[16 * v94 + 32];
          uint64_t v97 = *(void *)&v92[16 * v13 + 24];
          sub_25CA6B7A4((char *)(v93 + 16 * v96), (char *)(v93 + 16 * *(void *)&v92[16 * v13 + 16]), v93 + 16 * v97, __dst);
          if (v1) {
            break;
          }
          if (v97 < v96) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v95 = sub_25CA6BBD8((uint64_t)v95);
          }
          if (v94 >= *((void *)v95 + 2)) {
            goto LABEL_133;
          }
          v98 = &v95[16 * v94 + 32];
          *(void *)v98 = v96;
          *((void *)v98 + 1) = v97;
          unint64_t v99 = *((void *)v95 + 2);
          if (v13 > v99) {
            goto LABEL_134;
          }
          memmove(&v95[16 * v13 + 16], &v95[16 * v13 + 32], 16 * (v99 - v13));
          v92 = v95;
          *((void *)v95 + 2) = v99 - 1;
          unint64_t v13 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v103 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E90);
    uint64_t v8 = sub_25CA78B90();
    *(void *)(v8 + 16) = v7;
    uint64_t v103 = v8;
    __dst = (char *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v102 = *a1 + 32;
  uint64_t v100 = *a1 - 16;
  unint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v104 = v6;
  uint64_t v105 = v3;
  uint64_t v106 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 16 * v10);
      uint64_t v16 = 16 * v14;
      uint64_t v17 = *(void *)(v11 + 16 * v14);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v18 = (uint64_t *)(v102 + 16 * v14);
        uint64_t v19 = v15;
        while (1)
        {
          uint64_t v21 = *v18;
          v18 += 2;
          uint64_t v20 = v21;
          if (v15 < v17 == v21 >= v19) {
            break;
          }
          ++v10;
          uint64_t v19 = v20;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v22 = 16 * v10;
          uint64_t v23 = v10;
          uint64_t v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              uint64_t v25 = v11 + v22;
              uint64_t v26 = *(void *)(v11 + v16);
              uint64_t v27 = *(void *)(v11 + v16 + 8);
              *(_OWORD *)(v11 + v16) = *(_OWORD *)(v11 + v22 - 16);
              *(void *)(v25 - 16) = v26;
              *(void *)(v25 - 8) = v27;
            }
            ++v24;
            v22 -= 16;
            v16 += 16;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v28 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v28 >= v3) {
      uint64_t v28 = v3;
    }
    if (v28 < v14) {
      break;
    }
    if (v10 != v28)
    {
      uint64_t v29 = v100 + 16 * v10;
      do
      {
        uint64_t v30 = *(void *)(v11 + 16 * v10);
        uint64_t v31 = v14;
        uint64_t v32 = v29;
        do
        {
          if (v30 >= *(void *)v32) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v33 = *(void *)(v32 + 24);
          *(_OWORD *)(v32 + 16) = *(_OWORD *)v32;
          *(void *)uint64_t v32 = v30;
          *(void *)(v32 + 8) = v33;
          v32 -= 16;
          ++v31;
        }
        while (v10 != v31);
        ++v10;
        v29 += 16;
      }
      while (v10 != v28);
      uint64_t v10 = v28;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_25CA6BA20(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v35 = *((void *)v12 + 2);
    unint64_t v34 = *((void *)v12 + 3);
    unint64_t v13 = v35 + 1;
    uint64_t v11 = v106;
    if (v35 >= v34 >> 1)
    {
      v84 = sub_25CA6BA20((char *)(v34 > 1), v35 + 1, 1, v12);
      uint64_t v11 = v106;
      unint64_t v12 = v84;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v36 = v12 + 32;
    char v37 = &v12[16 * v35 + 32];
    *(void *)char v37 = v14;
    *((void *)v37 + 1) = v10;
    if (v35)
    {
      while (1)
      {
        unint64_t v38 = v13 - 1;
        if (v13 >= 4)
        {
          id v43 = &v36[16 * v13];
          uint64_t v44 = *((void *)v43 - 8);
          uint64_t v45 = *((void *)v43 - 7);
          BOOL v49 = __OFSUB__(v45, v44);
          uint64_t v46 = v45 - v44;
          if (v49) {
            goto LABEL_119;
          }
          uint64_t v48 = *((void *)v43 - 6);
          uint64_t v47 = *((void *)v43 - 5);
          BOOL v49 = __OFSUB__(v47, v48);
          uint64_t v41 = v47 - v48;
          char v42 = v49;
          if (v49) {
            goto LABEL_120;
          }
          unint64_t v50 = v13 - 2;
          v51 = &v36[16 * v13 - 32];
          uint64_t v53 = *(void *)v51;
          uint64_t v52 = *((void *)v51 + 1);
          BOOL v49 = __OFSUB__(v52, v53);
          uint64_t v54 = v52 - v53;
          if (v49) {
            goto LABEL_122;
          }
          BOOL v49 = __OFADD__(v41, v54);
          uint64_t v55 = v41 + v54;
          if (v49) {
            goto LABEL_125;
          }
          if (v55 >= v46)
          {
            v73 = &v36[16 * v38];
            uint64_t v75 = *(void *)v73;
            uint64_t v74 = *((void *)v73 + 1);
            BOOL v49 = __OFSUB__(v74, v75);
            uint64_t v76 = v74 - v75;
            if (v49) {
              goto LABEL_129;
            }
            BOOL v66 = v41 < v76;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v67 = *((void *)v12 + 4);
            uint64_t v68 = *((void *)v12 + 5);
            BOOL v49 = __OFSUB__(v68, v67);
            uint64_t v60 = v68 - v67;
            char v61 = v49;
            goto LABEL_77;
          }
          uint64_t v40 = *((void *)v12 + 4);
          uint64_t v39 = *((void *)v12 + 5);
          BOOL v49 = __OFSUB__(v39, v40);
          uint64_t v41 = v39 - v40;
          char v42 = v49;
        }
        if (v42) {
          goto LABEL_121;
        }
        unint64_t v50 = v13 - 2;
        v56 = &v36[16 * v13 - 32];
        uint64_t v58 = *(void *)v56;
        uint64_t v57 = *((void *)v56 + 1);
        BOOL v59 = __OFSUB__(v57, v58);
        uint64_t v60 = v57 - v58;
        char v61 = v59;
        if (v59) {
          goto LABEL_124;
        }
        v62 = &v36[16 * v38];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v49 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v49) {
          goto LABEL_127;
        }
        if (__OFADD__(v60, v65)) {
          goto LABEL_128;
        }
        if (v60 + v65 >= v41)
        {
          BOOL v66 = v41 < v65;
LABEL_83:
          if (v66) {
            unint64_t v38 = v50;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v61) {
          goto LABEL_123;
        }
        v69 = &v36[16 * v38];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v49 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v49) {
          goto LABEL_126;
        }
        if (v72 < v60) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v77 = v38 - 1;
        if (v38 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
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
        if (!v11) {
          goto LABEL_142;
        }
        v78 = v12;
        v79 = &v36[16 * v77];
        uint64_t v80 = *(void *)v79;
        v81 = &v36[16 * v38];
        uint64_t v82 = *((void *)v81 + 1);
        sub_25CA6B7A4((char *)(v11 + 16 * *(void *)v79), (char *)(v11 + 16 * *(void *)v81), v11 + 16 * v82, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v82 < v80) {
          goto LABEL_116;
        }
        if (v38 > *((void *)v78 + 2)) {
          goto LABEL_117;
        }
        *(void *)v79 = v80;
        *(void *)&v36[16 * v77 + 8] = v82;
        unint64_t v83 = *((void *)v78 + 2);
        if (v38 >= v83) {
          goto LABEL_118;
        }
        unint64_t v12 = v78;
        unint64_t v13 = v83 - 1;
        memmove(&v36[16 * v38], v81 + 16, 16 * (v83 - 1 - v38));
        *((void *)v78 + 2) = v83 - 1;
        uint64_t v11 = v106;
        if (v83 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v104;
    uint64_t v3 = v105;
    if (v10 >= v105)
    {
      uint64_t v9 = v103;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
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
  uint64_t result = sub_25CA78CF0();
  __break(1u);
  return result;
}

uint64_t sub_25CA6B7A4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  int64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v16 = &v4[16 * v13];
      uint64_t v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v17 = (char *)(a3 - 16);
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = v17 + 16;
          uint64_t v20 = *((void *)v18 - 2);
          v18 -= 16;
          if (*((void *)v16 - 2) >= v20)
          {
            uint64_t v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(_OWORD *)uint64_t v17 = *((_OWORD *)v16 - 1);
            }
            uint64_t v18 = v6;
            v16 -= 16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v19 != v6 || v17 >= v6) {
              *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
            }
            uint64_t v24 = v18;
            if (v18 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 16;
          uint64_t v6 = v18;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v23 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }
LABEL_42:
    sub_25CA6BB1C((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_25CA78D30();
  __break(1u);
  return result;
}

char *sub_25CA6BA20(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E98);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25CA6BB1C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_25CA78D30();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_25CA6BBD8(uint64_t a1)
{
  return sub_25CA6BA20(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_25CA6BBEC(uint64_t a1)
{
  return sub_25CA6A228(0, *(void *)(a1 + 16), 0, (char *)a1);
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

uint64_t sub_25CA6BC44(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25CA6BC80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_25CA6BCE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25CA6BCF8(void *a1)
{
  return sub_25CA75488(0, a1[2], 0, a1);
}

uint64_t sub_25CA6BD0C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v5[2] = ~v7;
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
  int64_t v11 = a2;
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
    uint64_t v20 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    void *v11 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_retain();
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

unint64_t sub_25CA6BF10(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EE0);
  uint64_t v3 = (void *)sub_25CA78D20();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_25CA78704(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_retain();
    unint64_t result = sub_25CA78704(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_25CA6C010(uint64_t a1)
{
  sub_25CA6C4E0(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EB0);
  if (swift_dynamicCast())
  {
    sub_25CA6C53C(v21, (uint64_t)v19);
    uint64_t v1 = v20;
    long long v2 = __swift_project_boxed_opaque_existential_1(v19, v20);
    uint64_t v3 = *(void *)(v1 - 8);
    MEMORY[0x270FA5388](v2);
    uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v3 + 16))(v5);
    if (sub_25CA78C90() < 65)
    {
      char v11 = sub_25CA78CA0();
      uint64_t v12 = sub_25CA78C80();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v1);
      if (v11) {
        float v6 = (float)v12;
      }
      else {
        float v6 = (float)(unint64_t)v12;
      }
    }
    else
    {
      sub_25CA6C598();
      sub_25CA6C63C();
      sub_25CA78AC0();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v1);
      float v6 = v18;
    }
    float v10 = v6;
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EB8);
  if (swift_dynamicCast())
  {
    sub_25CA6C53C(v21, (uint64_t)v19);
    char v7 = __swift_project_boxed_opaque_existential_1(v19, v20);
    MEMORY[0x270FA5388](v7);
    (*(void (**)(unsigned char *))(v9 + 16))(&v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    sub_25CA6C598();
    sub_25CA78AB0();
    float v10 = v18;
LABEL_12:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
    unsigned __int8 v15 = 0;
    goto LABEL_13;
  }
  sub_25CA6BC44(0, &qword_26A5E7E50);
  if (swift_dynamicCast())
  {
    sub_25CA78BC0();
    float v14 = v13;

    unsigned __int8 v15 = 0;
    float v10 = v14;
  }
  else
  {
    float v10 = 0.0;
    unsigned __int8 v15 = 1;
  }
LABEL_13:
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
  LOBYTE(v21[0]) = v15;
  return LODWORD(v10) | ((unint64_t)v15 << 32);
}

char *sub_25CA6C388(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    char v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_25CA78D30();
  __break(1u);
  return result;
}

uint64_t sub_25CA6C478()
{
  return swift_release();
}

uint64_t sub_25CA6C480(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25CA6C4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25CA6C53C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
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

unint64_t sub_25CA6C598()
{
  unint64_t result = qword_26A5E7EC0;
  if (!qword_26A5E7EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7EC0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_25CA6C63C()
{
  unint64_t result = qword_26A5E7EC8;
  if (!qword_26A5E7EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7EC8);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

unint64_t sub_25CA6C6C0(char a1)
{
  unint64_t result = 0x676E696E7261654CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x706E496C65646F4DLL;
      break;
    case 3:
      unint64_t result = 0x62614C6C65646F4DLL;
      break;
    case 4:
      unint64_t result = 0x4E65727574616546;
      break;
    case 5:
      unint64_t result = 0x4365727574616546;
      break;
    case 6:
      unint64_t result = 0x6546746567726154;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x6D614E6C65646F4DLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25CA6C898(char a1)
{
  unint64_t result = 0x676E696E7261654CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x706E496C65646F4DLL;
      break;
    case 3:
      unint64_t result = 0x62614C6C65646F4DLL;
      break;
    case 4:
      unint64_t result = 0x4E65727574616546;
      break;
    case 5:
      unint64_t result = 0x4365727574616546;
      break;
    case 6:
      unint64_t result = 0x6546746567726154;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x6D614E6C65646F4DLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CA6CA70(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_25CA6C6C0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_25CA6C6C0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25CA78E10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25CA6CAFC()
{
  char v1 = *v0;
  sub_25CA78E90();
  sub_25CA6C6C0(v1);
  sub_25CA78B10();
  swift_bridgeObjectRelease();
  return sub_25CA78EB0();
}

uint64_t sub_25CA6CB60()
{
  sub_25CA6C6C0(*v0);
  sub_25CA78B10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CA6CBB4()
{
  char v1 = *v0;
  sub_25CA78E90();
  sub_25CA6C6C0(v1);
  sub_25CA78B10();
  swift_bridgeObjectRelease();
  return sub_25CA78EB0();
}

uint64_t sub_25CA6CC14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CA6D158();
  *a1 = result;
  return result;
}

unint64_t sub_25CA6CC44@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25CA6C6C0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25CA6CC70()
{
  return sub_25CA6C898(*v0);
}

uint64_t sub_25CA6CC78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CA6D158();
  *a1 = result;
  return result;
}

uint64_t sub_25CA6CCA0()
{
  return 0;
}

void sub_25CA6CCAC(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_25CA6CCB8(uint64_t a1)
{
  unint64_t v2 = sub_25CA6E578();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CA6CCF4(uint64_t a1)
{
  unint64_t v2 = sub_25CA6E578();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CA6CD30(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7F38);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  char v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CA6E578();
  sub_25CA78ED0();
  LOBYTE(v11) = 0;
  sub_25CA78DB0();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_25CA78DE0();
    LOBYTE(v11) = 2;
    sub_25CA78DA0();
    LOBYTE(v11) = 3;
    sub_25CA78DA0();
    uint64_t v11 = *(void *)(v3 + 40);
    HIBYTE(v10) = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7F10);
    sub_25CA6E788(&qword_26A5E7F40);
    sub_25CA78DD0();
    LOBYTE(v11) = 5;
    sub_25CA78DE0();
    LOBYTE(v11) = 6;
    sub_25CA78DA0();
    LOBYTE(v11) = 7;
    sub_25CA78DA0();
    LOBYTE(v11) = 8;
    sub_25CA78DC0();
    LOBYTE(v11) = 9;
    sub_25CA78DC0();
    LOBYTE(v11) = 10;
    sub_25CA78DA0();
    uint64_t v11 = *(void *)(v3 + 120);
    HIBYTE(v10) = 11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7F20);
    sub_25CA6E7EC(&qword_26A5E7F48, (void (*)(void))sub_25CA6E85C);
    sub_25CA78DD0();
    LOBYTE(v11) = 12;
    sub_25CA78DA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 sub_25CA6D0E4@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25CA6DCB0(a1, v8);
  if (!v2)
  {
    long long v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v8[8];
    long long v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    __n128 result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_25CA6D140(void *a1)
{
  return sub_25CA6CD30(a1);
}

uint64_t sub_25CA6D158()
{
  unint64_t v0 = sub_25CA78D40();
  swift_bridgeObjectRelease();
  if (v0 >= 0xD) {
    return 13;
  }
  else {
    return v0;
  }
}

void sub_25CA6D1A4(uint64_t a1@<X8>)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v3 = self;
  sub_25CA78A60();
  unint64_t v4 = (void *)sub_25CA78AD0();
  swift_bridgeObjectRelease();
  v44[0] = 0;
  id v5 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, v4, 0, v44);

  id v6 = v44[0];
  if (!v5)
  {
    uint64_t v11 = v6;
    uint64_t v10 = (void *)sub_25CA78970();

    swift_willThrow();
    goto LABEL_5;
  }
  uint64_t v7 = sub_25CA789D0();
  unint64_t v9 = v8;

  sub_25CA78960();
  swift_allocObject();
  sub_25CA78950();
  sub_25CA6D79C();
  sub_25CA78940();
  if (v1)
  {
    sub_25CA6D7F0(v7, v9);
    swift_release();
    uint64_t v10 = v1;
LABEL_5:
    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25CA78AA0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A5E9A10);
    id v13 = v10;
    id v14 = v10;
    unsigned __int8 v15 = sub_25CA78A80();
    os_log_type_t v16 = sub_25CA78C40();
    if (os_log_type_enabled(v15, v16))
    {
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      float v18 = (void *)swift_slowAlloc();
      *(_DWORD *)int64_t v17 = 138412290;
      id v19 = v10;
      uint64_t v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v44[0] = v20;
      sub_25CA78C60();
      *float v18 = v20;

      _os_log_impl(&dword_25CA65000, v15, v16, "Couldn't form SiriMASPFLPluginArgs: %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E58);
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v18, -1, -1);
      MEMORY[0x26119CCC0](v17, -1, -1);
    }
    else
    {
    }
    sub_25CA6D748();
    swift_allocError();
    *uint64_t v21 = 0;
    swift_willThrow();
    swift_release();

    return;
  }
  sub_25CA6D7F0(v7, v9);
  swift_release();
  id v22 = v44[0];
  uint64_t v23 = v47;
  long long v43 = v51;
  uint64_t v41 = v54;
  uint64_t v42 = v50;
  if (*(void *)(v45 + 16) == v46)
  {
    uint64_t v39 = v52;
    uint64_t v40 = v55;
    id v24 = v44[4];
    uint64_t v36 = v48;
    uint64_t v37 = v53;
    uint64_t v25 = v45;
    uint64_t v38 = v56;
    uint64_t v35 = v49;
    id v26 = v44[2];
    id v27 = v44[1];
    id v28 = v44[3];
    uint64_t v34 = v46;
    swift_release();
    *(void *)a1 = v22;
    *(void *)(a1 + 8) = v27;
    *(void *)(a1 + 16) = v26;
    *(void *)(a1 + 24) = v28;
    *(void *)(a1 + 32) = v24;
    *(void *)(a1 + 40) = v25;
    *(void *)(a1 + 48) = v34;
    *(void *)(a1 + 56) = v23;
    *(void *)(a1 + 64) = v36;
    *(void *)(a1 + 72) = v35;
    *(void *)(a1 + 80) = v42;
    *(_OWORD *)(a1 + 88) = v43;
    *(void *)(a1 + 104) = v39;
    *(void *)(a1 + 112) = v37;
    *(void *)(a1 + 120) = v41;
    *(void *)(a1 + 128) = v40;
    *(void *)(a1 + 136) = v38;
  }
  else
  {
    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_25CA78AA0();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A5E9A10);
    uint64_t v30 = sub_25CA78A80();
    os_log_type_t v31 = sub_25CA78C40();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 134218240;
      sub_25CA78C60();
      *(_WORD *)(v32 + 12) = 1024;
      sub_25CA78C60();
      _os_log_impl(&dword_25CA65000, v30, v31, "Size of featureNames (%ld is not equal to featureCount (%u", (uint8_t *)v32, 0x12u);
      MEMORY[0x26119CCC0](v32, -1, -1);
    }

    sub_25CA6D748();
    swift_allocError();
    unsigned char *v33 = 1;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
}

unint64_t sub_25CA6D748()
{
  unint64_t result = qword_26A5E7EF0;
  if (!qword_26A5E7EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7EF0);
  }
  return result;
}

unint64_t sub_25CA6D79C()
{
  unint64_t result = qword_26A5E7EF8;
  if (!qword_26A5E7EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7EF8);
  }
  return result;
}

uint64_t sub_25CA6D7F0(uint64_t a1, unint64_t a2)
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

uint64_t initializeBufferWithCopyOfBuffer for ModelEvaluationMetricSpecs(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriMASPFLPluginArgs()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriMASPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
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

uint64_t assignWithCopy for SiriMASPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
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
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for SiriMASPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriMASPFLPluginArgs(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriMASPFLPluginArgs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
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
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginArgs()
{
  return &type metadata for SiriMASPFLPluginArgs;
}

uint64_t sub_25CA6DCB0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7F00);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  BOOL v59 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_25CA6E578();
  sub_25CA78EC0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v59);
  }
  uint64_t v10 = v6;
  uint64_t v54 = a2;
  LOBYTE(v69[0]) = 0;
  sub_25CA78D60();
  unsigned int v12 = v11;
  LOBYTE(v69[0]) = 1;
  unsigned int v13 = sub_25CA78D90();
  LOBYTE(v69[0]) = 2;
  uint64_t v53 = sub_25CA78D50();
  LOBYTE(v69[0]) = 3;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_25CA78D50();
  uint64_t v58 = v15;
  uint64_t v52 = v16;
  uint64_t v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7F10);
  LOBYTE(v60) = 4;
  sub_25CA6E788(&qword_26A5E7F18);
  swift_bridgeObjectRetain();
  sub_25CA78D80();
  uint64_t v57 = v18;
  uint64_t v19 = v69[0];
  LOBYTE(v69[0]) = 5;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  int v50 = sub_25CA78D90();
  uint64_t v51 = v20;
  LOBYTE(v69[0]) = 6;
  uint64_t v49 = sub_25CA78D50();
  LOBYTE(v69[0]) = 7;
  uint64_t v22 = v21;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_25CA78D50();
  uint64_t v56 = v22;
  uint64_t v48 = v23;
  LOBYTE(v69[0]) = 8;
  uint64_t v55 = v24;
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_25CA78D70();
  LOBYTE(v69[0]) = 9;
  uint64_t v25 = sub_25CA78D70();
  LOBYTE(v69[0]) = 10;
  uint64_t v46 = sub_25CA78D50();
  uint64_t v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7F20);
  LOBYTE(v60) = 11;
  sub_25CA6E7EC(&qword_26A5E7F28, (void (*)(void))sub_25CA6E614);
  swift_bridgeObjectRetain();
  sub_25CA78D80();
  char v82 = 12;
  uint64_t v45 = v69[0];
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_25CA78D50();
  uint64_t v44 = v29;
  uint64_t v30 = v28;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
  *(void *)&long long v60 = __PAIR64__(v13, v12);
  *((void *)&v60 + 1) = v53;
  *(void *)&long long v61 = v58;
  *((void *)&v61 + 1) = v52;
  *(void *)&long long v62 = v57;
  *((void *)&v62 + 1) = v51;
  LODWORD(v63) = v50;
  uint64_t v31 = v55;
  *((void *)&v63 + 1) = v49;
  *(void *)&long long v64 = v56;
  *((void *)&v64 + 1) = v48;
  *(void *)&long long v65 = v55;
  *((void *)&v65 + 1) = v47;
  *(void *)&long long v66 = v25;
  uint64_t v43 = v25;
  *((void *)&v66 + 1) = v46;
  *(void *)&long long v67 = v27;
  *((void *)&v67 + 1) = v45;
  *(void *)&long long v68 = v30;
  *((void *)&v68 + 1) = v44;
  sub_25CA6E668((uint64_t)&v60);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v32 = v51;
  swift_bridgeObjectRelease();
  uint64_t v33 = v56;
  swift_bridgeObjectRelease();
  uint64_t v34 = v31;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v35 = v45;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v59);
  v69[0] = __PAIR64__(v13, v12);
  v69[1] = v53;
  v69[2] = v58;
  v69[3] = v52;
  v69[4] = v57;
  v69[5] = v32;
  int v70 = v50;
  uint64_t v71 = v49;
  uint64_t v72 = v33;
  uint64_t v73 = v48;
  uint64_t v74 = v34;
  uint64_t v75 = v47;
  uint64_t v76 = v43;
  uint64_t v77 = v46;
  uint64_t v78 = v27;
  uint64_t v79 = v35;
  uint64_t v80 = v30;
  uint64_t v81 = v44;
  uint64_t result = sub_25CA6E6F8((uint64_t)v69);
  long long v37 = v67;
  uint64_t v38 = v54;
  v54[6] = v66;
  v38[7] = v37;
  v38[8] = v68;
  long long v39 = v63;
  v38[2] = v62;
  v38[3] = v39;
  long long v40 = v65;
  v38[4] = v64;
  v38[5] = v40;
  long long v41 = v61;
  *uint64_t v38 = v60;
  v38[1] = v41;
  return result;
}

unint64_t sub_25CA6E578()
{
  unint64_t result = qword_26A5E7F08;
  if (!qword_26A5E7F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7F08);
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

unint64_t sub_25CA6E614()
{
  unint64_t result = qword_26A5E7F30;
  if (!qword_26A5E7F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7F30);
  }
  return result;
}

uint64_t sub_25CA6E668(uint64_t a1)
{
  return a1;
}

uint64_t sub_25CA6E6F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_25CA6E788(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5E7F10);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25CA6E7EC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5E7F20);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25CA6E85C()
{
  unint64_t result = qword_26A5E7F50;
  if (!qword_26A5E7F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7F50);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriMASPFLPluginArgs.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriMASPFLPluginArgs.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x25CA6EA0CLL);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginArgs.CodingKeys()
{
  return &type metadata for SiriMASPFLPluginArgs.CodingKeys;
}

unint64_t sub_25CA6EA48()
{
  unint64_t result = qword_26A5E7F58;
  if (!qword_26A5E7F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7F58);
  }
  return result;
}

unint64_t sub_25CA6EAA0()
{
  unint64_t result = qword_26A5E7F60;
  if (!qword_26A5E7F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7F60);
  }
  return result;
}

unint64_t sub_25CA6EAF8()
{
  unint64_t result = qword_26A5E7F68[0];
  if (!qword_26A5E7F68[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5E7F68);
  }
  return result;
}

uint64_t SiriMASPFLPluginRunner.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriMASPFLPluginRunner.init()()
{
  return v0;
}

uint64_t sub_25CA6EB64(uint64_t a1)
{
  *(void *)(v1 + 328) = a1;
  return MEMORY[0x270FA2498](sub_25CA70F20, 0, 0);
}

unint64_t sub_25CA6EB84(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E78);
    int v2 = (void *)sub_25CA78D20();
  }
  else
  {
    int v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  unsigned int v6 = &v37;
  BOOL v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x263F8EE58] + 8;
  uint64_t v11 = MEMORY[0x263F8D5C8];
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_25CA6C478();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_25CA6BCE8(v6, v7);
    sub_25CA6BCE8(v7, v40);
    sub_25CA6BCE8(v40, &v38);
    unint64_t result = sub_25CA78748(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      unsigned int v12 = v7;
      unsigned int v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      unsigned int v6 = v13;
      BOOL v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v18);
      unint64_t result = (unint64_t)sub_25CA6BCE8(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_25CA6BCE8(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_25CA6EEE0()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_26A5E7F80 + dword_26A5E7F80);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25CA6EF80;
  return v3();
}

uint64_t sub_25CA6EF80(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

id sub_25CA6F07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_25CA789F0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  unsigned int v12 = 0;
  if (v11(a1, 1, v9) != 1)
  {
    unsigned int v12 = (void *)sub_25CA789E0();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    unsigned int v13 = 0;
  }
  else
  {
    unsigned int v13 = (void *)sub_25CA789E0();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v12, v13, a3, a4, a5 & 1);

  return v14;
}

void sub_25CA6F200(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t SiriMASPFLPluginRunner.deinit()
{
  return v0;
}

uint64_t SiriMASPFLPluginRunner.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25CA6F280()
{
  return sub_25CA78A20();
}

uint64_t sub_25CA6F298()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_26A5E7F80 + dword_26A5E7F80);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25CA70F14;
  return v3();
}

uint64_t sub_25CA6F338(uint64_t a1)
{
  *(void *)(v1 + 328) = a1;
  return MEMORY[0x270FA2498](sub_25CA6F358, 0, 0);
}

uint64_t sub_25CA6F358()
{
  uint64_t v45 = v0;
  sub_25CA6F518(v27);
  float v1 = v27[1];
  uint64_t v2 = v28;
  uint64_t v3 = v29;
  uint64_t v4 = v30;
  long long v5 = v31;
  int v6 = v32;
  uint64_t v7 = v33;
  uint64_t v8 = v34;
  uint64_t v9 = v35;
  uint64_t v10 = v36;
  long long v11 = v37;
  uint64_t v12 = v38;
  long long v13 = v39;
  uint64_t v14 = v40;
  uint64_t v15 = v41;
  uint64_t v16 = v42;
  uint64_t v17 = v43;
  uint64_t v18 = v44;
  *(float *)(v0 + 16) = v27[0];
  *(float *)(v0 + 20) = v1;
  *(void *)(v0 + 24) = v2;
  *(void *)(v0 + 32) = v3;
  *(void *)(v0 + 40) = v4;
  *(_OWORD *)(v0 + 48) = v5;
  *(_DWORD *)(v0 + 64) = v6;
  *(void *)(v0 + 72) = v7;
  *(void *)(v0 + 80) = v8;
  *(void *)(v0 + 88) = v9;
  *(void *)(v0 + 96) = v10;
  *(_OWORD *)(v0 + 104) = v11;
  *(void *)(v0 + 120) = v12;
  *(_OWORD *)(v0 + 128) = v13;
  *(void *)(v0 + 144) = v14;
  *(void *)(v0 + 152) = v15;
  *(void *)(v0 + 160) = v16;
  *(void *)(v0 + 168) = v17;
  *(void *)(v0 + 176) = v18;
  long long v19 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 216) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 232) = v19;
  long long v20 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 184) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v0 + 200) = v20;
  long long v21 = *(_OWORD *)(v0 + 144);
  long long v22 = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 296) = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 312) = v21;
  long long v23 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 264) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 280) = v22;
  *(_OWORD *)(v0 + 248) = v23;
  uint64_t v24 = sub_25CA6FE2C(v0 + 184, v16, v17, v18);
  swift_release();
  swift_release();
  swift_release();
  sub_25CA6E6F8(v0 + 16);
  unint64_t v25 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v25(v24);
}

uint64_t sub_25CA6F4FC()
{
  return sub_25CA78A30();
}

void sub_25CA6F518(float *a1@<X8>)
{
  uint64_t v2 = v1;
  v69 = a1;
  uint64_t v3 = sub_25CA78980();
  uint64_t v73 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v72 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FC0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v71 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25CA789C0();
  uint64_t v76 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v74 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v11 = (char *)&v50 - v10;
  if (qword_26A5E7C80 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25CA78AA0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_26A5E9A10);
  swift_retain_n();
  uint64_t v70 = v13;
  uint64_t v14 = sub_25CA78A80();
  os_log_type_t v15 = sub_25CA78C20();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v75 = v11;
  if (v16)
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(void *)&long long v68 = v7;
    uint64_t v19 = v18;
    uint64_t v78 = v18;
    uint64_t v67 = v1;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v20 = sub_25CA78A70();
    uint64_t v77 = sub_25CA77FF0(v20, v21, &v78);
    uint64_t v2 = v67;
    sub_25CA78C60();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25CA65000, v14, v15, "Initialising SiriMASPFLPluginRunner for recipe %s.", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v19;
    uint64_t v7 = v68;
    MEMORY[0x26119CCC0](v22, -1, -1);
    MEMORY[0x26119CCC0](v17, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_retain();
  sub_25CA6D1A4((uint64_t)v79);
  if (!v2)
  {
    float v23 = v79[0];
    float v66 = v79[1];
    uint64_t v64 = *((void *)&v80 + 1);
    uint64_t v65 = v80;
    uint64_t v62 = *((void *)&v81 + 1);
    uint64_t v63 = v81;
    uint64_t v24 = v82;
    int v61 = v83;
    uint64_t v59 = *((void *)&v84 + 1);
    uint64_t v60 = v84;
    uint64_t v57 = *((void *)&v85 + 1);
    uint64_t v58 = v85;
    uint64_t v56 = v86;
    uint64_t v25 = v88;
    uint64_t v55 = v87;
    long long v68 = v89;
    uint64_t v54 = v90;
    uint64_t v53 = v91;
    type metadata accessor for BiomeSQLClient();
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = 0;
    *(void *)(v26 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A8E0]), sel_init);
    long long v94 = v81;
    long long v95 = v80;
    uint64_t v96 = v24;
    long long v92 = v84;
    long long v93 = v85;
    type metadata accessor for BiomeSQLRowAggregator();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = sub_25CA6BF10(MEMORY[0x263F8EE78]);
    *(_OWORD *)(v27 + 24) = v95;
    *(_OWORD *)(v27 + 40) = v94;
    *(_OWORD *)(v27 + 56) = v93;
    *(void *)(v27 + 72) = v24;
    *(_OWORD *)(v27 + 80) = v92;
    sub_25CA70EBC((uint64_t)&v95);
    sub_25CA70EBC((uint64_t)&v94);
    sub_25CA70EBC((uint64_t)&v93);
    sub_25CA70EE8((uint64_t)&v96);
    sub_25CA70EBC((uint64_t)&v92);
    sub_25CA78A50();
    if (v28)
    {
      uint64_t v51 = v25;
      uint64_t v52 = v24;
      uint64_t v67 = v26;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v71, 1, 1, v7);
      (*(void (**)(char *, void, uint64_t))(v73 + 104))(v72, *MEMORY[0x263F06E50], v3);
      sub_25CA789B0();
      id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
      objc_msgSend(v29, sel_setComputeUnits_, 0);
      uint64_t v30 = v74;
      sub_25CA789A0();
      double v31 = v79[0];
      type metadata accessor for ModelTrainer();
      swift_allocObject();
      id v32 = v29;
      uint64_t v37 = sub_25CA71DF0(v30, v32, v31);
      uint64_t v38 = sub_25CA78A80();
      os_log_type_t v39 = sub_25CA78C20();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = v7;
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v41 = 0;
        _os_log_impl(&dword_25CA65000, v38, v39, "Finished initialising SiriMASPFLPluginRunner.", v41, 2u);
        uint64_t v42 = v41;
        uint64_t v7 = v40;
        MEMORY[0x26119CCC0](v42, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v7);
      uint64_t v43 = v69;
      float *v69 = v23;
      v43[1] = v66;
      uint64_t v44 = v64;
      *((void *)v43 + 1) = v65;
      *((void *)v43 + 2) = v44;
      uint64_t v45 = v62;
      *((void *)v43 + 3) = v63;
      *((void *)v43 + 4) = v45;
      *((void *)v43 + 5) = v52;
      *((_DWORD *)v43 + 12) = v61;
      uint64_t v46 = v59;
      *((void *)v43 + 7) = v60;
      *((void *)v43 + 8) = v46;
      uint64_t v47 = v57;
      *((void *)v43 + 9) = v58;
      *((void *)v43 + 10) = v47;
      uint64_t v48 = v55;
      *((void *)v43 + 11) = v56;
      *((void *)v43 + 12) = v48;
      *((void *)v43 + 13) = v51;
      *((_OWORD *)v43 + 7) = v68;
      uint64_t v49 = v53;
      *((void *)v43 + 16) = v54;
      *((void *)v43 + 17) = v49;
      *((void *)v43 + 18) = v67;
      *((void *)v43 + 19) = v27;
      *((void *)v43 + 20) = v37;
    }
    else
    {
      sub_25CA6E6F8((uint64_t)v79);
      uint64_t v33 = sub_25CA78A80();
      os_log_type_t v34 = sub_25CA78C40();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_25CA65000, v33, v34, "Model attachment not found", v35, 2u);
        MEMORY[0x26119CCC0](v35, -1, -1);
      }

      sub_25CA70E68();
      swift_allocError();
      *uint64_t v36 = 0;
      swift_willThrow();
      swift_release();
      swift_release();
    }
  }
}

uint64_t sub_25CA6FE2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  if (qword_26A5E7C80 != -1) {
    swift_once();
  }
  uint64_t v70 = a4;
  uint64_t v9 = sub_25CA78AA0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A5E9A10);
  uint64_t v10 = sub_25CA78A80();
  os_log_type_t v11 = sub_25CA78C20();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_25CA65000, v10, v11, "Executing SQL query.", v12, 2u);
    MEMORY[0x26119CCC0](v12, -1, -1);
  }

  uint64_t v13 = a2;
  sub_25CA774F0(*(void *)(a1 + 128), *(void *)(a1 + 136));
  if (v4) {
    return (uint64_t)v13;
  }
  os_log_type_t v15 = sub_25CA78A80();
  os_log_type_t v16 = sub_25CA78C20();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_25CA65000, v15, v16, "Aggregating SQL rows.", v17, 2u);
    MEMORY[0x26119CCC0](v17, -1, -1);
  }

  for (Class i = a2[2].isa; i; Class i = a2[2].isa)
  {
    if (![(objc_class *)i next]) {
      break;
    }
    uint64_t v19 = sub_25CA77834();
    sub_25CA68490((uint64_t)v19);
    swift_bridgeObjectRelease();
  }
  uint64_t v20 = (uint64_t *)(a3 + 16);
  swift_beginAccess();
  uint64_t v21 = *(void *)(*(void *)(a3 + 16) + 16);
  uint64_t v13 = sub_25CA78A80();
  if (!v21)
  {
    os_log_type_t v31 = sub_25CA78C40();
    if (os_log_type_enabled(v13, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v32 = 0;
      _os_log_impl(&dword_25CA65000, v13, v31, "No Biome datapoints found, returning empty MLRTaskResult", v32, 2u);
      MEMORY[0x26119CCC0](v32, -1, -1);
    }

    sub_25CA70E68();
    swift_allocError();
    unsigned char *v33 = 5;
    swift_willThrow();
    return (uint64_t)v13;
  }
  os_log_type_t v22 = sub_25CA78C20();
  if (os_log_type_enabled(v13, v22))
  {
    float v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)float v23 = 0;
    _os_log_impl(&dword_25CA65000, v13, v22, "Producing MLBatchProvider for training.", v23, 2u);
    MEMORY[0x26119CCC0](v23, -1, -1);
  }

  int64_t v24 = sub_25CA69210();
  sub_25CA6E668(a1);
  uint64_t v25 = sub_25CA78A80();
  os_log_type_t v26 = sub_25CA78C20();
  v69 = v20;
  if (os_log_type_enabled(v25, v26))
  {
    int64_t v68 = v24;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v67 = swift_slowAlloc();
    v71[0] = v67;
    *(_DWORD *)uint64_t v27 = 136315650;
    uint64_t v28 = *(void *)(a1 + 104);
    unint64_t v29 = *(void *)(a1 + 112);
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_25CA77FF0(v28, v29, v71);
    sub_25CA78C60();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2048;
    uint64_t v72 = v21;
    sub_25CA78C60();
    *(_WORD *)(v27 + 22) = 1024;
    LODWORD(v72) = *(_DWORD *)(a1 + 4);
    sub_25CA78C60();
    sub_25CA6E6F8(a1);
    _os_log_impl(&dword_25CA65000, v25, v26, "Training model %s with %ld datapoints for %u epochs.", (uint8_t *)v27, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x26119CCC0](v67, -1, -1);
    uint64_t v30 = v27;
    int64_t v24 = v68;
    MEMORY[0x26119CCC0](v30, -1, -1);
  }
  else
  {
    sub_25CA6E6F8(a1);
  }
  int v34 = *(_DWORD *)(a1 + 4);
  uint64_t v35 = swift_bridgeObjectRetain();
  uint64_t v36 = sub_25CA75B8C(v35);
  swift_bridgeObjectRelease();
  sub_25CA72834(v34, v24, v36);
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  unsigned int v44 = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = sub_25CA71558(v38, v40, v42, v44);

  uint64_t result = swift_bridgeObjectRelease();
  int64_t v46 = 0;
  uint64_t v47 = *v69;
  uint64_t v48 = 1 << *(unsigned char *)(*v69 + 32);
  uint64_t v49 = -1;
  if (v48 < 64) {
    uint64_t v49 = ~(-1 << v48);
  }
  uint64_t v51 = *(void *)(v47 + 64);
  uint64_t v50 = v47 + 64;
  unint64_t v52 = v49 & v51;
  int64_t v53 = (unint64_t)(v48 + 63) >> 6;
  for (float j = 0.0; ; float j = j + (float)*(uint64_t *)(*(void *)(*(void *)(*(void *)(*v69 + 56) + 8 * v56) + 16) + 24))
  {
    if (v52)
    {
      unint64_t v55 = __clz(__rbit64(v52));
      v52 &= v52 - 1;
      unint64_t v56 = v55 | (v46 << 6);
      continue;
    }
    int64_t v57 = v46 + 1;
    if (__OFADD__(v46, 1))
    {
      __break(1u);
LABEL_52:
      __break(1u);
      return result;
    }
    if (v57 >= v53) {
      goto LABEL_45;
    }
    unint64_t v58 = *(void *)(v50 + 8 * v57);
    ++v46;
    if (!v58)
    {
      int64_t v46 = v57 + 1;
      if (v57 + 1 >= v53) {
        goto LABEL_45;
      }
      unint64_t v58 = *(void *)(v50 + 8 * v46);
      if (!v58)
      {
        int64_t v46 = v57 + 2;
        if (v57 + 2 >= v53) {
          goto LABEL_45;
        }
        unint64_t v58 = *(void *)(v50 + 8 * v46);
        if (!v58)
        {
          int64_t v46 = v57 + 3;
          if (v57 + 3 >= v53) {
            goto LABEL_45;
          }
          unint64_t v58 = *(void *)(v50 + 8 * v46);
          if (!v58)
          {
            int64_t v46 = v57 + 4;
            if (v57 + 4 >= v53) {
              goto LABEL_45;
            }
            unint64_t v58 = *(void *)(v50 + 8 * v46);
            if (!v58) {
              break;
            }
          }
        }
      }
    }
LABEL_44:
    unint64_t v52 = (v58 - 1) & v58;
    unint64_t v56 = __clz(__rbit64(v58)) + (v46 << 6);
  }
  int64_t v59 = v57 + 5;
  if (v59 < v53)
  {
    unint64_t v58 = *(void *)(v50 + 8 * v59);
    if (!v58)
    {
      while (1)
      {
        int64_t v46 = v59 + 1;
        if (__OFADD__(v59, 1)) {
          goto LABEL_52;
        }
        if (v46 >= v53) {
          goto LABEL_45;
        }
        unint64_t v58 = *(void *)(v50 + 8 * v46);
        ++v59;
        if (v58) {
          goto LABEL_44;
        }
      }
    }
    int64_t v46 = v59;
    goto LABEL_44;
  }
LABEL_45:
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v71[0] = v45;
  sub_25CA6AA34(0x43656C706D617845, 0xEC000000746E756FLL, isUniquelyReferenced_nonNull_native, j);
  uint64_t v61 = v71[0];
  uint64_t v72 = v71[0];
  swift_bridgeObjectRelease();
  id v62 = objc_msgSend(*(id *)(v70 + 16), sel_copyCurrentTrainingDelta);
  id v63 = objc_msgSend(v62, sel_flattenedModelUpdate);

  if (v63)
  {
    sub_25CA789D0();
  }
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_25CA78A80();
  os_log_type_t v65 = sub_25CA78C20();
  if (os_log_type_enabled(v64, v65))
  {
    float v66 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)float v66 = 134217984;
    v71[0] = *(void *)(v61 + 16);
    sub_25CA78C60();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25CA65000, v64, v65, "Finishing plugin by returning %ld metrics and weight delta.", v66, 0xCu);
    MEMORY[0x26119CCC0](v66, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_25CA6EB84(v72);
  swift_bridgeObjectRelease();
  sub_25CA78A10();
  swift_allocObject();
  uint64_t v13 = sub_25CA78A00();
  swift_unknownObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_25CA706A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FA8);
  *(void *)(v0 + 136) = swift_task_alloc();
  *(void *)(v0 + 144) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25CA70740, 0, 0);
}

uint64_t sub_25CA70740()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = 0;
  id v4 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  id v5 = objc_msgSend(v4, sel_AppSelection);
  swift_unknownObjectRelease();
  id v6 = objc_msgSend(v5, sel_Music);
  swift_unknownObjectRelease();
  sub_25CA70DD0();
  uint64_t v7 = sub_25CA789F0();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v2, 1, 1, v7);
  v8(v1, 1, 1, v7);
  id v9 = sub_25CA6F07C(v2, v1, 1, 1, 1);
  id v10 = objc_msgSend(v6, sel_publisherWithOptions_, v9);

  v0[6] = nullsub_1;
  v0[7] = 0;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_25CA6F1FC;
  v0[5] = &block_descriptor;
  os_log_type_t v11 = _Block_copy(v0 + 2);
  v0[12] = sub_25CA70E28;
  v0[13] = v3;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_25CA6F1FC;
  v0[11] = &block_descriptor_11;
  uint64_t v12 = _Block_copy(v0 + 8);
  swift_retain();
  swift_release();
  id v13 = objc_msgSend(v10, sel_sinkWithCompletion_receiveInput_, v11, v12);
  _Block_release(v12);
  _Block_release(v11);

  swift_beginAccess();
  uint64_t v14 = *(unsigned __int8 *)(v3 + 16);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v15 = (uint64_t (*)(uint64_t))v0[1];
  return v15(v14);
}

uint64_t type metadata accessor for SiriMASPFLPluginRunner()
{
  return self;
}

uint64_t method lookup function for SiriMASPFLPluginRunner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriMASPFLPluginRunner);
}

uint64_t dispatch thunk of SiriMASPFLPluginRunner.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SiriMASPFLPluginRunner.run(task:useCase:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 88)
                                                                   + **(int **)(*(void *)v4 + 88));
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *id v10 = v5;
  v10[1] = sub_25CA70BD0;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_25CA70BD0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of SiriMASPFLPluginRunner.isDataAvailable()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 104) + **(int **)(*(void *)v0 + 104));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25CA70F14;
  return v4();
}

uint64_t sub_25CA70DC0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_25CA70DD0()
{
  unint64_t result = qword_26A5E7FB0;
  if (!qword_26A5E7FB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5E7FB0);
  }
  return result;
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

uint64_t sub_25CA70E28()
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v0 + 16) = 1;
  return result;
}

unint64_t sub_25CA70E68()
{
  unint64_t result = qword_26A5E7FB8;
  if (!qword_26A5E7FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7FB8);
  }
  return result;
}

uint64_t sub_25CA70EBC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25CA70EE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_25CA70F24()
{
  uint64_t v0 = sub_25CA78AA0();
  __swift_allocate_value_buffer(v0, qword_26A5E9A10);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5E9A10);
  return sub_25CA78A90();
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

uint64_t sub_25CA7100C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64656E69617254;
  }
  else {
    uint64_t v3 = 0x656E696C65736142;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64656E69617254;
  }
  else {
    uint64_t v5 = 0x656E696C65736142;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25CA78E10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25CA710B4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000025CA7A280;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x74654D6C65646F4DLL;
      unint64_t v3 = 0xEF656D614E636972;
      break;
    case 2:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v3 = 0x800000025CA7A2B0;
      break;
    case 3:
      unint64_t v5 = 0x6E4563697274654DLL;
      unint64_t v3 = 0xEE00676E69646F63;
      break;
    default:
      break;
  }
  unint64_t v6 = 0x800000025CA7A280;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEF656D614E636972;
      if (v5 == 0x74654D6C65646F4DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xD000000000000014;
      unint64_t v6 = 0x800000025CA7A2B0;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEE00676E69646F63;
      if (v5 == 0x6E4563697274654DLL) {
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
        char v7 = sub_25CA78E10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25CA71270()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA71374()
{
  sub_25CA78B10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CA71458()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA71558(uint64_t a1, void *a2, void *a3, unsigned int a4)
{
  unint64_t v10 = sub_25CA6837C(MEMORY[0x263F8EE78]);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v77 = (void *)v10;
  sub_25CA6AA34(0x756F436863746142, 0xEA0000000000746ELL, isUniquelyReferenced_nonNull_native, (float)a4);
  uint64_t v12 = (void *)v10;
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(a2, sel_evaluationMetrics);
  if (!v13) {
    goto LABEL_6;
  }
  uint64_t v14 = v13;
  id v15 = objc_msgSend(a3, sel_evaluationMetrics);
  if (!v15)
  {
    swift_unknownObjectRelease();
LABEL_6:
    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25CA78AA0();
    __swift_project_value_buffer(v18, (uint64_t)qword_26A5E9A10);
    uint64_t v19 = sub_25CA78A80();
    os_log_type_t v20 = sub_25CA78C30();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_25CA65000, v19, v20, "Evaluation metrics are nil.", v21, 2u);
      MEMORY[0x26119CCC0](v21, -1, -1);
    }

    return (uint64_t)v12;
  }
  os_log_type_t v16 = v15;
  uint64_t v17 = sub_25CA76070(v14);
  if (v4)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v12;
  }
  uint64_t v73 = v17;
  uint64_t v72 = sub_25CA76070(v16);
  uint64_t v69 = a1 + 56;
  uint64_t v23 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v24 = -1;
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  unint64_t v25 = v24 & *(void *)(a1 + 56);
  int64_t v70 = (unint64_t)(v23 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v26 = 0;
  uint64_t v71 = a1;
  while (1)
  {
    if (v25)
    {
      uint64_t v74 = (v25 - 1) & v25;
      int64_t v75 = v26;
      unint64_t v27 = __clz(__rbit64(v25)) | (v26 << 6);
    }
    else
    {
      int64_t v28 = v26 + 1;
      if (__OFADD__(v26, 1)) {
        goto LABEL_72;
      }
      if (v28 >= v70)
      {
LABEL_69:
        swift_unknownObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return (uint64_t)v12;
      }
      unint64_t v29 = *(void *)(v69 + 8 * v28);
      int64_t v30 = v26 + 1;
      if (!v29)
      {
        int64_t v30 = v26 + 2;
        if (v26 + 2 >= v70) {
          goto LABEL_69;
        }
        unint64_t v29 = *(void *)(v69 + 8 * v30);
        if (!v29)
        {
          int64_t v30 = v26 + 3;
          if (v26 + 3 >= v70) {
            goto LABEL_69;
          }
          unint64_t v29 = *(void *)(v69 + 8 * v30);
          if (!v29)
          {
            uint64_t v31 = v26 + 4;
            if (v26 + 4 >= v70) {
              goto LABEL_69;
            }
            unint64_t v29 = *(void *)(v69 + 8 * v31);
            if (!v29)
            {
              while (1)
              {
                int64_t v30 = v31 + 1;
                if (__OFADD__(v31, 1)) {
                  break;
                }
                if (v30 >= v70) {
                  goto LABEL_69;
                }
                unint64_t v29 = *(void *)(v69 + 8 * v30);
                ++v31;
                if (v29) {
                  goto LABEL_33;
                }
              }
              __break(1u);
LABEL_77:
              uint64_t result = sub_25CA78E30();
              __break(1u);
              return result;
            }
            int64_t v30 = v26 + 4;
          }
        }
      }
LABEL_33:
      uint64_t v74 = (v29 - 1) & v29;
      int64_t v75 = v30;
      unint64_t v27 = __clz(__rbit64(v29)) + (v30 << 6);
    }
    uint64_t v32 = *(void *)(a1 + 48) + 40 * v27;
    uint64_t v33 = *(void *)(v32 + 8);
    uint64_t v76 = *(void *)v32;
    uint64_t v5 = *(void *)(v32 + 16);
    a3 = *(void **)(v32 + 24);
    char v34 = *(unsigned char *)(v32 + 32);
    uint64_t v35 = *(void *)(v73 + 16);
    swift_bridgeObjectRetain();
    if (!v35)
    {
      swift_bridgeObjectRetain();
      goto LABEL_64;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v36 = sub_25CA78748(v5, (uint64_t)a3);
    if ((v37 & 1) == 0) {
      break;
    }
    int v38 = *(_DWORD *)(*(void *)(v73 + 56) + 4 * v36);
    swift_bridgeObjectRelease();
    if (!*(void *)(v72 + 16)) {
      goto LABEL_64;
    }
    swift_bridgeObjectRetain();
    unint64_t v39 = sub_25CA78748(v5, (uint64_t)a3);
    if ((v40 & 1) == 0) {
      break;
    }
    int v41 = *(_DWORD *)(*(void *)(v72 + 56) + 4 * v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v5 = swift_isUniquelyReferenced_nonNull_native();
    if (v34)
    {
      uint64_t v77 = v12;
      unint64_t v43 = sub_25CA78748(v76, v33);
      uint64_t v44 = v12[2];
      BOOL v45 = (v42 & 1) == 0;
      uint64_t v46 = v44 + v45;
      if (__OFADD__(v44, v45))
      {
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      char v47 = v42;
      if (v12[3] >= v46)
      {
        if (v5)
        {
          uint64_t v12 = v77;
          if (v42) {
            goto LABEL_53;
          }
        }
        else
        {
          sub_25CA6AD40();
          uint64_t v12 = v77;
          if (v47) {
            goto LABEL_53;
          }
        }
      }
      else
      {
        sub_25CA6A5F0(v46, v5);
        unint64_t v48 = sub_25CA78748(v76, v33);
        if ((v47 & 1) != (v49 & 1)) {
          goto LABEL_77;
        }
        unint64_t v43 = v48;
        uint64_t v12 = v77;
        if (v47)
        {
LABEL_53:
          *(_DWORD *)(v12[7] + 4 * v43) = v41;
          goto LABEL_17;
        }
      }
      v12[(v43 >> 6) + 8] |= 1 << v43;
      uint64_t v50 = (uint64_t *)(v12[6] + 16 * v43);
      *uint64_t v50 = v76;
      v50[1] = v33;
      *(_DWORD *)(v12[7] + 4 * v43) = v41;
      uint64_t v51 = v12[2];
      BOOL v52 = __OFADD__(v51, 1);
      uint64_t v53 = v51 + 1;
      if (v52) {
        goto LABEL_74;
      }
    }
    else
    {
      uint64_t v77 = v12;
      unint64_t v55 = sub_25CA78748(v76, v33);
      uint64_t v56 = v12[2];
      BOOL v57 = (v54 & 1) == 0;
      uint64_t v58 = v56 + v57;
      if (__OFADD__(v56, v57)) {
        goto LABEL_71;
      }
      char v59 = v54;
      if (v12[3] >= v58)
      {
        if (v5)
        {
          uint64_t v12 = v77;
          if (v54) {
            goto LABEL_16;
          }
        }
        else
        {
          sub_25CA6AD40();
          uint64_t v12 = v77;
          if (v59) {
            goto LABEL_16;
          }
        }
      }
      else
      {
        sub_25CA6A5F0(v58, v5);
        unint64_t v60 = sub_25CA78748(v76, v33);
        if ((v59 & 1) != (v61 & 1)) {
          goto LABEL_77;
        }
        unint64_t v55 = v60;
        uint64_t v12 = v77;
        if (v59)
        {
LABEL_16:
          *(_DWORD *)(v12[7] + 4 * v55) = v38;
          goto LABEL_17;
        }
      }
      v12[(v55 >> 6) + 8] |= 1 << v55;
      id v62 = (uint64_t *)(v12[6] + 16 * v55);
      uint64_t *v62 = v76;
      v62[1] = v33;
      *(_DWORD *)(v12[7] + 4 * v55) = v38;
      uint64_t v63 = v12[2];
      BOOL v52 = __OFADD__(v63, 1);
      uint64_t v53 = v63 + 1;
      if (v52) {
        goto LABEL_73;
      }
    }
    v12[2] = v53;
    swift_bridgeObjectRetain();
LABEL_17:
    a1 = v71;
    int64_t v26 = v75;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    unint64_t v25 = v74;
  }
  swift_bridgeObjectRelease();
LABEL_64:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26A5E7C80 == -1) {
    goto LABEL_65;
  }
LABEL_75:
  swift_once();
LABEL_65:
  uint64_t v64 = sub_25CA78AA0();
  __swift_project_value_buffer(v64, (uint64_t)qword_26A5E9A10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_log_type_t v65 = sub_25CA78A80();
  os_log_type_t v66 = sub_25CA78C40();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v77 = v12;
    *(_DWORD *)uint64_t v67 = 136315138;
    swift_bridgeObjectRetain();
    sub_25CA77FF0(v5, (unint64_t)a3, (uint64_t *)&v77);
    sub_25CA78C60();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25CA65000, v65, v66, "Baseline/Trained metric value not found for %s", v67, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26119CCC0](v12, -1, -1);
    MEMORY[0x26119CCC0](v67, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  sub_25CA76668();
  swift_allocError();
  *int64_t v68 = 4;
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return (uint64_t)v12;
}

uint64_t sub_25CA71DF0(char *a1, void *a2, double a3)
{
  v88[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v7 = sub_25CA789C0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v11 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v76 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  long long v80 = (char *)&v76 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v76 - v17;
  sub_25CA76710();
  uint64_t v82 = v8;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v85 = v7;
  uint64_t v86 = a1;
  long long v81 = v19;
  v19(v18, (uint64_t)a1, v7);
  id v83 = a2;
  os_log_type_t v20 = (char *)sub_25CA75A2C((uint64_t)v18, (uint64_t)a2);
  if (v3)
  {
    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25CA78AA0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A5E9A10);
    os_log_type_t v22 = v80;
    uint64_t v23 = v85;
    v81(v80, (uint64_t)v86, v85);
    id v24 = v3;
    id v25 = v3;
    int64_t v26 = sub_25CA78A80();
    os_log_type_t v27 = sub_25CA78C40();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v79 = (void *)swift_slowAlloc();
      long long v81 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
      v88[0] = v81;
      *(_DWORD *)uint64_t v28 = 136315394;
      sub_25CA76750();
      uint64_t v29 = sub_25CA78E00();
      uint64_t v87 = sub_25CA77FF0(v29, v30, (uint64_t *)v88);
      sub_25CA78C60();
      swift_bridgeObjectRelease();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v82 + 8);
      v31(v22, v85);
      *(_WORD *)(v28 + 12) = 2112;
      id v32 = v3;
      uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v87 = v33;
      uint64_t v23 = v85;
      sub_25CA78C60();
      char v34 = v79;
      void *v79 = v33;

      _os_log_impl(&dword_25CA65000, v26, v27, "Model init failed for %s with error: %@", (uint8_t *)v28, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E58);
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v34, -1, -1);
      uint64_t v35 = v81;
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v35, -1, -1);
      MEMORY[0x26119CCC0](v28, -1, -1);
    }
    else
    {
      uint64_t v31 = *(void (**)(char *, uint64_t))(v82 + 8);
      v31(v22, v23);
    }
    uint64_t v43 = v84;
    sub_25CA76668();
    swift_allocError();
    *uint64_t v44 = 0;
    swift_willThrow();

    v31(v86, v23);
LABEL_18:
    type metadata accessor for ModelTrainer();
    swift_deallocPartialClassInstance();
    return v43;
  }
  unint64_t v36 = v20;
  if (!v20 || (char v37 = objc_msgSend(v20, sel_program)) == 0)
  {
    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_25CA78AA0();
    __swift_project_value_buffer(v45, (uint64_t)qword_26A5E9A10);
    uint64_t v46 = v85;
    v81(v14, (uint64_t)v86, v85);
    char v47 = sub_25CA78A80();
    os_log_type_t v48 = sub_25CA78C40();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v79 = v14;
      uint64_t v50 = (uint8_t *)v49;
      uint64_t v51 = (void *)swift_slowAlloc();
      v88[0] = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      sub_25CA76750();
      uint64_t v52 = sub_25CA78E00();
      uint64_t v87 = sub_25CA77FF0(v52, v53, (uint64_t *)v88);
      uint64_t v46 = v85;
      sub_25CA78C60();
      swift_bridgeObjectRelease();
      char v54 = *(void (**)(char *, uint64_t))(v82 + 8);
      v54((char *)v79, v46);
      _os_log_impl(&dword_25CA65000, v47, v48, "No ML program found for %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v51, -1, -1);
      MEMORY[0x26119CCC0](v50, -1, -1);
    }
    else
    {
      char v54 = *(void (**)(char *, uint64_t))(v82 + 8);
      v54(v14, v46);
    }

    sub_25CA76668();
    swift_allocError();
    unsigned char *v55 = 1;
    swift_willThrow();

    v54(v86, v46);
    uint64_t v43 = v84;
    goto LABEL_18;
  }
  int v38 = v37;
  id v39 = objc_allocWithZone(MEMORY[0x263F00DD8]);
  v88[0] = 0;
  swift_unknownObjectRetain();
  id v40 = objc_msgSend(v39, sel_initWithProgram_learningRate_error_, v38, v88, a3);
  if (!v40)
  {
    id v57 = v88[0];
    uint64_t v58 = (void *)sub_25CA78970();

    swift_willThrow();
    swift_unknownObjectRelease();
    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v79 = v38;
    long long v80 = v36;
    uint64_t v59 = sub_25CA78AA0();
    __swift_project_value_buffer(v59, (uint64_t)qword_26A5E9A10);
    uint64_t v60 = v85;
    v81(v11, (uint64_t)v86, v85);
    id v61 = v58;
    id v62 = v58;
    uint64_t v63 = sub_25CA78A80();
    os_log_type_t v64 = sub_25CA78C40();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = swift_slowAlloc();
      uint64_t v76 = v11;
      os_log_t v78 = v63;
      uint64_t v66 = v65;
      uint64_t v77 = (void *)swift_slowAlloc();
      long long v81 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
      v88[0] = v81;
      *(_DWORD *)uint64_t v66 = 136315394;
      sub_25CA76750();
      uint64_t v67 = sub_25CA78E00();
      uint64_t v87 = sub_25CA77FF0(v67, v68, (uint64_t *)v88);
      sub_25CA78C60();
      swift_bridgeObjectRelease();
      uint64_t v69 = *(void (**)(char *, uint64_t))(v82 + 8);
      v69(v76, v60);
      *(_WORD *)(v66 + 12) = 2112;
      id v70 = v58;
      uint64_t v71 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v87 = v71;
      sub_25CA78C60();
      uint64_t v72 = v77;
      *uint64_t v77 = v71;

      os_log_t v73 = v78;
      _os_log_impl(&dword_25CA65000, v78, v64, "ML program trainer init failed for %s: %@", (uint8_t *)v66, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E58);
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v72, -1, -1);
      uint64_t v74 = v81;
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v74, -1, -1);
      MEMORY[0x26119CCC0](v66, -1, -1);
    }
    else
    {
      uint64_t v69 = *(void (**)(char *, uint64_t))(v82 + 8);
      v69(v11, v60);
    }
    uint64_t v43 = v84;
    sub_25CA76668();
    swift_allocError();
    *int64_t v75 = 1;
    swift_willThrow();

    swift_unknownObjectRelease();
    v69(v86, v60);

    goto LABEL_18;
  }
  id v41 = v40;
  id v42 = v88[0];

  swift_unknownObjectRelease_n();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v86, v85);
  uint64_t v43 = v84;
  *(void *)(v84 + 16) = v41;

  return v43;
}

void sub_25CA72834(int a1, int64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v6 = a2;
  v43[1] = *(id *)MEMORY[0x263EF8340];
  int64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  if (v7)
  {
    uint64_t v39 = v4;
    v43[0] = (id)MEMORY[0x263F8EE78];
    sub_25CA75468(0, v7, 0);
    uint64_t v8 = v43[0];
    int64_t v6 = sub_25CA75780(a3);
    uint64_t v4 = v9;
    char v11 = v10 & 1;
    while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a3 + 32))
    {
      if (((*(void *)(a3 + 56 + (((unint64_t)v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_28;
      }
      if (*(_DWORD *)(a3 + 36) != v4) {
        goto LABEL_29;
      }
      char v42 = v11;
      uint64_t v12 = *(void *)(a3 + 48) + 40 * v6;
      uint64_t v13 = *(void *)(v12 + 16);
      uint64_t v14 = *(void *)(v12 + 24);
      v43[0] = v8;
      unint64_t v16 = v8[2];
      unint64_t v15 = v8[3];
      swift_bridgeObjectRetain();
      if (v16 >= v15 >> 1)
      {
        sub_25CA75468(v15 > 1, v16 + 1, 1);
        uint64_t v8 = v43[0];
      }
      v8[2] = v16 + 1;
      uint64_t v17 = &v8[2 * v16];
      v17[4] = v13;
      v17[5] = v14;
      int64_t v18 = sub_25CA75820(v6, v4, v42 & 1, a3);
      int64_t v6 = v18;
      uint64_t v4 = v19;
      char v11 = v20 & 1;
      if (!--v7)
      {
        sub_25CA75904(v18, v19, v11);
        uint64_t v4 = v39;
        int64_t v6 = a2;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
  else
  {
LABEL_11:
    sub_25CA75C34((uint64_t)v8);
    swift_bridgeObjectRelease();
    if (qword_26A5E7C80 == -1) {
      goto LABEL_12;
    }
  }
  swift_once();
LABEL_12:
  uint64_t v21 = sub_25CA78AA0();
  __swift_project_value_buffer(v21, (uint64_t)qword_26A5E9A10);
  swift_unknownObjectRetain();
  os_log_type_t v22 = sub_25CA78A80();
  os_log_type_t v23 = sub_25CA78C20();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 134218240;
    HIDWORD(v43[0]) = (unint64_t)objc_msgSend((id)v6, sel_count) >> 32;
    sub_25CA78C60();
    swift_unknownObjectRelease();
    *(_WORD *)(v24 + 12) = 1024;
    LODWORD(v43[0]) = a1;
    sub_25CA78C60();
    _os_log_impl(&dword_25CA65000, v22, v23, "Training %ld for %u epochs.", (uint8_t *)v24, 0x12u);
    MEMORY[0x26119CCC0](v24, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease();
  }
  id v25 = (void *)v6;
  int64_t v26 = *(void **)(v4 + 16);
  os_log_type_t v27 = (void *)sub_25CA78BD0();
  v43[0] = 0;
  id v28 = objc_msgSend(v26, sel_evaluateUsingTestData_evaluationMetricNames_error_, v25, v27, v43);

  if (v28)
  {
    id v29 = v43[0];
    unint64_t v30 = v25;
    unint64_t v31 = (unint64_t)objc_msgSend(v25, sel_count);
    if ((v31 & 0x8000000000000000) != 0 || HIDWORD(v31))
    {
      sub_25CA78CF0();
      __break(1u);
    }
    else
    {
      if (a1)
      {
        while (1)
        {
          v43[0] = 0;
          id v32 = objc_msgSend(v26, sel_trainUsingTrainingData_error_, v30, v43);
          id v33 = v43[0];
          if (!v32) {
            break;
          }

          if (!--a1) {
            goto LABEL_21;
          }
        }
        id v38 = v33;
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_21:
        char v34 = (void *)sub_25CA78BD0();
        swift_bridgeObjectRelease();
        v43[0] = 0;
        id v35 = objc_msgSend(v26, sel_evaluateUsingTestData_evaluationMetricNames_error_, v30, v34, v43);

        if (v35)
        {
          id v36 = v43[0];
          swift_bridgeObjectRetain();
          return;
        }
        id v38 = v43[0];
      }
      sub_25CA78970();

      swift_willThrow();
    }
  }
  else
  {
    id v37 = v43[0];
    swift_bridgeObjectRelease();
    sub_25CA78970();

    swift_willThrow();
  }
}

uint64_t sub_25CA72D74()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ModelTrainer()
{
  return self;
}

uint64_t sub_25CA72DD0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E8028);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CA76D24();
  sub_25CA78ED0();
  v10[15] = 0;
  sub_25CA78DA0();
  if (!v2)
  {
    v10[14] = 1;
    sub_25CA78DA0();
    v10[13] = *(unsigned char *)(v3 + 32);
    v10[12] = 2;
    sub_25CA76E20();
    sub_25CA78DD0();
    v10[11] = 3;
    sub_25CA76E74();
    sub_25CA78DD0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25CA72FA4()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA73090(unsigned __int8 *a1, char *a2)
{
  return sub_25CA710B4(*a1, *a2);
}

uint64_t sub_25CA7309C()
{
  return sub_25CA71270();
}

uint64_t sub_25CA730A4()
{
  return sub_25CA71374();
}

uint64_t sub_25CA730AC()
{
  return sub_25CA71458();
}

uint64_t sub_25CA730B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CA769FC();
  *a1 = result;
  return result;
}

void sub_25CA730E4(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000025CA7A280;
  switch(*v1)
  {
    case 1:
      unint64_t v3 = 0xEF656D614E636972;
      unint64_t v2 = 0x74654D6C65646F4DLL;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0xD000000000000014;
      *(void *)(a1 + 8) = 0x800000025CA7A2B0;
      break;
    case 3:
      strcpy((char *)a1, "MetricEncoding");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v2;
      *(void *)(a1 + 8) = v3;
      break;
  }
}

unint64_t sub_25CA7319C()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x74654D6C65646F4DLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0x6E4563697274654DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CA73248@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25CA769FC();
  *a1 = result;
  return result;
}

void sub_25CA73270(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_25CA7327C(uint64_t a1)
{
  unint64_t v2 = sub_25CA76D24();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25CA732B8(uint64_t a1)
{
  unint64_t v2 = sub_25CA76D24();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25CA732F4(uint64_t a1, uint64_t a2)
{
  return sub_25CA75910(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24), *(unsigned char *)(a2 + 32)) & 1;
}

uint64_t sub_25CA73344()
{
  swift_bridgeObjectRetain();
  sub_25CA78B10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25CA78B10();
  swift_bridgeObjectRelease();
  sub_25CA78B10();
  swift_bridgeObjectRelease();
  return sub_25CA78B10();
}

uint64_t sub_25CA7342C()
{
  return sub_25CA78EB0();
}

double sub_25CA7351C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25CA76A48(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_25CA73564(void *a1)
{
  return sub_25CA72DD0(a1);
}

uint64_t sub_25CA7357C(char *a1, char *a2)
{
  return sub_25CA7100C(*a1, *a2);
}

uint64_t sub_25CA73588()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA7360C()
{
  sub_25CA78B10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25CA7367C()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA736FC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25CA78D40();
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

void sub_25CA7375C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x656E696C65736142;
  if (*v1) {
    uint64_t v2 = 0x64656E69617254;
  }
  unint64_t v3 = 0xE800000000000000;
  if (*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_25CA7379C()
{
  return sub_25CA78B40();
}

uint64_t sub_25CA737FC()
{
  return sub_25CA78B30();
}

uint64_t sub_25CA7384C()
{
  return 1;
}

uint64_t sub_25CA73854()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA738A4()
{
  return sub_25CA78B10();
}

uint64_t sub_25CA738B8()
{
  return sub_25CA78EB0();
}

uint64_t sub_25CA73904@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25CA78D40();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_25CA73958(void *a1@<X8>)
{
  *a1 = 0x72616C616353;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_25CA73970()
{
  return sub_25CA78B40();
}

uint64_t sub_25CA739D0()
{
  return sub_25CA78B30();
}

uint64_t sub_25CA73A20(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25CA78E90();
  swift_bridgeObjectRetain();
  sub_25CA78B10();
  uint64_t v8 = sub_25CA78EB0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25CA78E10() & 1) != 0)
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
      int64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25CA78E10() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25CA745DC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25CA73BD0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v7 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v10 = *v3;
  sub_25CA78E90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25CA78B10();
  uint64_t v42 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v40 = v9;
  sub_25CA78B10();
  uint64_t v41 = v8;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(a2 + 32)) {
    uint64_t v11 = 0x64656E69617254;
  }
  else {
    uint64_t v11 = 0x656E696C65736142;
  }
  if (*(unsigned char *)(a2 + 32)) {
    unint64_t v12 = 0xE700000000000000;
  }
  else {
    unint64_t v12 = 0xE800000000000000;
  }
  uint64_t v38 = v11;
  sub_25CA78B10();
  swift_bridgeObjectRelease();
  sub_25CA78B10();
  uint64_t v13 = sub_25CA78EB0();
  uint64_t v14 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v15 = v13 & ~v14;
  uint64_t v39 = v10;
  uint64_t v16 = v10 + 56;
  uint64_t v37 = a1;
  uint64_t v36 = a2;
  if (((*(void *)(v10 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25CA74778(v36, v15, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v43;
    swift_bridgeObjectRelease();
    long long v29 = *(_OWORD *)(v36 + 16);
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v36;
    *(_OWORD *)(v37 + 16) = v29;
    *(unsigned char *)(v37 + 32) = *(unsigned char *)(v36 + 32);
    return 1;
  }
  uint64_t v17 = ~v14;
  while (1)
  {
    uint64_t v18 = *(void *)(v39 + 48) + 40 * v15;
    uint64_t v20 = *(void *)(v18 + 16);
    uint64_t v19 = *(void *)(v18 + 24);
    int v21 = *(unsigned __int8 *)(v18 + 32);
    BOOL v22 = *(void *)v18 == v7 && *(void *)(v18 + 8) == v42;
    if (!v22 && (sub_25CA78E10() & 1) == 0) {
      goto LABEL_9;
    }
    BOOL v23 = v20 == v40 && v19 == v41;
    if (!v23 && (sub_25CA78E10() & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v24 = v21 ? 0x64656E69617254 : 0x656E696C65736142;
    unint64_t v25 = v21 ? 0xE700000000000000 : 0xE800000000000000;
    if (v24 == v38 && v25 == v12) {
      break;
    }
    char v27 = sub_25CA78E10();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
LABEL_9:
    unint64_t v15 = (v15 + 1) & v17;
    if (((*(void *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_34:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = *(void *)(*v3 + 48) + 40 * v15;
  uint64_t v33 = *(void *)v31;
  uint64_t v32 = *(void *)(v31 + 8);
  uint64_t v34 = *(void *)(v31 + 16);
  uint64_t v35 = *(void *)(v31 + 24);
  LOBYTE(v31) = *(unsigned char *)(v31 + 32);
  *(void *)a1 = v33;
  *(void *)(a1 + 8) = v32;
  *(void *)(a1 + 16) = v34;
  *(void *)(a1 + 24) = v35;
  *(unsigned char *)(a1 + 32) = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return 0;
}

uint64_t sub_25CA73F50()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FC8);
  uint64_t v3 = sub_25CA78CC0();
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_25CA78E90();
      sub_25CA78B10();
      uint64_t result = sub_25CA78EB0();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25CA74230()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FE8);
  uint64_t v3 = sub_25CA78CC0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v33 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v32 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    for (i = v2; ; uint64_t v2 = i)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v16 = v33[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v16 = v33[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v33[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = *(void *)(v2 + 48) + 40 * v14;
      uint64_t v19 = *(void *)v18;
      uint64_t v20 = *(void *)(v18 + 8);
      uint64_t v21 = *(void *)(v18 + 16);
      uint64_t v22 = *(void *)(v18 + 24);
      char v23 = *(unsigned char *)(v18 + 32);
      sub_25CA78E90();
      swift_bridgeObjectRetain();
      sub_25CA78B10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_25CA78B10();
      swift_bridgeObjectRelease();
      sub_25CA78B10();
      swift_bridgeObjectRelease();
      sub_25CA78B10();
      uint64_t result = sub_25CA78EB0();
      uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = *(void *)(v4 + 48) + 40 * v11;
      *(void *)uint64_t v12 = v19;
      *(void *)(v12 + 8) = v20;
      *(void *)(v12 + 16) = v21;
      *(void *)(v12 + 24) = v22;
      *(unsigned char *)(v12 + 32) = v23;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25CA745DC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25CA73F50();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25CA74AB4();
      goto LABEL_22;
    }
    sub_25CA74E38();
  }
  uint64_t v11 = *v4;
  sub_25CA78E90();
  sub_25CA78B10();
  uint64_t result = sub_25CA78EB0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25CA78E10(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25CA78E20();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25CA78E10();
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

uint64_t sub_25CA74778(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  uint64_t v36 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_25CA74230();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_25CA74C68();
        goto LABEL_39;
      }
      sub_25CA750E8();
    }
    uint64_t v8 = *v3;
    sub_25CA78E90();
    uint64_t v9 = *(void *)v5;
    uint64_t v10 = *(void *)(v5 + 8);
    swift_bridgeObjectRetain();
    sub_25CA78B10();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(v5 + 16);
    uint64_t v12 = *(void *)(v5 + 24);
    swift_bridgeObjectRetain();
    uint64_t v40 = v11;
    sub_25CA78B10();
    uint64_t v39 = v12;
    swift_bridgeObjectRelease();
    BOOL v13 = *(unsigned char *)(v5 + 32) == 0;
    if (*(unsigned char *)(v5 + 32)) {
      uint64_t v14 = 0x64656E69617254;
    }
    else {
      uint64_t v14 = 0x656E696C65736142;
    }
    if (v13) {
      unint64_t v15 = 0xE800000000000000;
    }
    else {
      unint64_t v15 = 0xE700000000000000;
    }
    sub_25CA78B10();
    swift_bridgeObjectRelease();
    sub_25CA78B10();
    uint64_t result = sub_25CA78EB0();
    uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v16;
    uint64_t v38 = v8;
    uint64_t v17 = v8 + 56;
    if ((*(void *)(v17 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v37 = v14;
      uint64_t v18 = ~v16;
      do
      {
        uint64_t v19 = *(void *)(v38 + 48) + 40 * a2;
        uint64_t v20 = *(void *)(v19 + 16);
        uint64_t v21 = *(void *)(v19 + 24);
        int v22 = *(unsigned __int8 *)(v19 + 32);
        BOOL v23 = *(void *)v19 == v9 && *(void *)(v19 + 8) == v10;
        if (v23 || (uint64_t result = sub_25CA78E10(), (result & 1) != 0))
        {
          BOOL v24 = v20 == v40 && v21 == v39;
          if (v24 || (uint64_t result = sub_25CA78E10(), (result & 1) != 0))
          {
            if (v22) {
              uint64_t v25 = 0x64656E69617254;
            }
            else {
              uint64_t v25 = 0x656E696C65736142;
            }
            if (v22) {
              unint64_t v26 = 0xE700000000000000;
            }
            else {
              unint64_t v26 = 0xE800000000000000;
            }
            if (v25 == v37 && v26 == v15) {
              goto LABEL_42;
            }
            char v28 = sub_25CA78E10();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v28) {
              goto LABEL_43;
            }
            uint64_t result = swift_bridgeObjectRelease();
          }
        }
        a2 = (a2 + 1) & v18;
      }
      while (((*(void *)(v17 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_39:
  uint64_t v29 = *v35;
  *(void *)(*v35 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v30 = *(void *)(v29 + 48) + 40 * a2;
  long long v31 = *(_OWORD *)(v36 + 16);
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v36;
  *(_OWORD *)(v30 + 16) = v31;
  *(unsigned char *)(v30 + 32) = *(unsigned char *)(v36 + 32);
  uint64_t v32 = *(void *)(v29 + 16);
  BOOL v33 = __OFADD__(v32, 1);
  uint64_t v34 = v32 + 1;
  if (v33)
  {
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_43:
    swift_bridgeObjectRelease();
    uint64_t result = sub_25CA78E20();
    __break(1u);
  }
  else
  {
    *(void *)(v29 + 16) = v34;
  }
  return result;
}

void *sub_25CA74AB4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25CA78CB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

void *sub_25CA74C68()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25CA78CB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v13) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24)
      {
        int64_t v9 = v23 + 2;
        if (v23 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v6 + 8 * v9);
        if (!v24) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    uint64_t v21 = *(void *)(v17 + 24);
    LOBYTE(v17) = *(unsigned char *)(v17 + 32);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v22 = v19;
    *(void *)(v22 + 8) = v18;
    *(void *)(v22 + 16) = v20;
    *(void *)(v22 + 24) = v21;
    *(unsigned char *)(v22 + 32) = v17;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v13) {
    goto LABEL_28;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25CA74E38()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FC8);
  uint64_t v3 = sub_25CA78CC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25CA78E90();
    swift_bridgeObjectRetain();
    sub_25CA78B10();
    uint64_t result = sub_25CA78EB0();
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

uint64_t sub_25CA750E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FE8);
  uint64_t v3 = sub_25CA78CC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v31 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v32 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  for (i = v2; ; uint64_t v2 = i)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v32) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v31 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v31 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(v2 + 48) + 40 * v14;
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *(void *)(v18 + 8);
    uint64_t v21 = *(void *)(v18 + 16);
    uint64_t v22 = *(void *)(v18 + 24);
    char v23 = *(unsigned char *)(v18 + 32);
    sub_25CA78E90();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25CA78B10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25CA78B10();
    swift_bridgeObjectRelease();
    sub_25CA78B10();
    swift_bridgeObjectRelease();
    sub_25CA78B10();
    uint64_t result = sub_25CA78EB0();
    uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v8 + 8 * v26);
      }
      while (v30 == -1);
      unint64_t v11 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v4 + 48) + 40 * v11;
    *(void *)uint64_t v12 = v19;
    *(void *)(v12 + 8) = v20;
    *(void *)(v12 + 16) = v21;
    *(void *)(v12 + 24) = v22;
    *(unsigned char *)(v12 + 32) = v23;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v32)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v31 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25CA75468(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25CA75614(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25CA75488(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7EA0);
    int64_t v10 = (void *)swift_allocObject();
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
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E90);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25CA78D30();
  __break(1u);
  return result;
}

uint64_t sub_25CA75614(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7FD0);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
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
  uint64_t result = sub_25CA78D30();
  __break(1u);
  return result;
}

uint64_t sub_25CA75780(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_25CA75820(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_25CA75904(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25CA75910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a1 == a6 && a2 == a7 || (char v14 = 0, (sub_25CA78E10() & 1) != 0))
  {
    if (a3 == a8 && a4 == a9 || (char v14 = 0, (sub_25CA78E10() & 1) != 0))
    {
      if (a5) {
        uint64_t v15 = 0x64656E69617254;
      }
      else {
        uint64_t v15 = 0x656E696C65736142;
      }
      if (a5) {
        unint64_t v16 = 0xE700000000000000;
      }
      else {
        unint64_t v16 = 0xE800000000000000;
      }
      if (a10) {
        uint64_t v17 = 0x64656E69617254;
      }
      else {
        uint64_t v17 = 0x656E696C65736142;
      }
      if (a10) {
        unint64_t v18 = 0xE700000000000000;
      }
      else {
        unint64_t v18 = 0xE800000000000000;
      }
      if (v15 == v17 && v16 == v18) {
        char v14 = 1;
      }
      else {
        char v14 = sub_25CA78E10();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v14 & 1;
}

id sub_25CA75A2C(uint64_t a1, uint64_t a2)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v4 = (void *)sub_25CA78990();
  v13[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_25CA789C0();
    unint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_25CA78970();

    swift_willThrow();
    uint64_t v11 = sub_25CA789C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_25CA75B8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25CA766BC();
  uint64_t result = sub_25CA78BF0();
  uint64_t v11 = result;
  if (v2)
  {
    unint64_t v4 = (unsigned char *)(a1 + 64);
    do
    {
      uint64_t v6 = *((void *)v4 - 4);
      uint64_t v5 = *((void *)v4 - 3);
      uint64_t v7 = *((void *)v4 - 2);
      uint64_t v8 = *((void *)v4 - 1);
      char v9 = *v4;
      v4 += 40;
      v12[0] = v6;
      v12[1] = v5;
      v12[2] = v7;
      v12[3] = v8;
      char v13 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25CA73BD0((uint64_t)v10, (uint64_t)v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v2;
    }
    while (v2);
    return v11;
  }
  return result;
}

uint64_t sub_25CA75C34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_25CA78BF0();
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25CA73A20(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_25CA75CCC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_type);
  if (v2 == (id)1)
  {
    objc_msgSend(a1, sel_int64Value);
    return;
  }
  if (v2 == (id)5)
  {
    id v3 = objc_msgSend(a1, sel_multiArrayValue);
    if (v3)
    {
      unint64_t v4 = v3;
      if (objc_msgSend(v3, sel_count) == (id)1)
      {
        id v5 = objc_msgSend(v4, sel_objectAtIndexedSubscript_, 0);
        objc_msgSend(v5, sel_floatValue);

        return;
      }
    }
    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25CA78AA0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A5E9A10);
    id v7 = a1;
    uint64_t v8 = sub_25CA78A80();
    os_log_type_t v9 = sub_25CA78C40();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)id v10 = 138412290;
      id v15 = v7;
      sub_25CA78C60();
      void *v11 = v7;

      char v13 = "Feature value not scalar: %@";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v2 == (id)2)
  {
    objc_msgSend(a1, sel_doubleValue);
    return;
  }
  if (qword_26A5E7C80 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25CA78AA0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A5E9A10);
  id v7 = a1;
  uint64_t v8 = sub_25CA78A80();
  os_log_type_t v9 = sub_25CA78C40();
  if (!os_log_type_enabled(v8, v9)) {
    goto LABEL_19;
  }
  id v10 = (uint8_t *)swift_slowAlloc();
  uint64_t v11 = (void *)swift_slowAlloc();
  *(_DWORD *)id v10 = 138412290;
  id v12 = v7;
  sub_25CA78C60();
  void *v11 = v7;

  char v13 = "Invalid feature value %@";
LABEL_18:
  _os_log_impl(&dword_25CA65000, v8, v9, v13, v10, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E58);
  swift_arrayDestroy();
  MEMORY[0x26119CCC0](v11, -1, -1);
  MEMORY[0x26119CCC0](v10, -1, -1);

LABEL_20:
  sub_25CA76668();
  swift_allocError();
  *unint64_t v16 = 3;
  swift_willThrow();
}

uint64_t sub_25CA76070(void *a1)
{
  uint64_t v4 = v1;
  uint64_t isUniquelyReferenced_nonNull_native = sub_25CA6837C(MEMORY[0x263F8EE78]);
  id v56 = a1;
  unint64_t v7 = (unint64_t)objc_msgSend(a1, sel_count);
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0x2654E7000uLL;
    char v54 = (char *)v7;
LABEL_4:
    if (v8 != (char *)v7)
    {
      unint64_t v55 = v8 + 1;
      id v59 = [v56 *(SEL *)(v9 + 1808)];
      id v10 = objc_msgSend(v59, sel_featureNames);
      uint64_t v11 = isUniquelyReferenced_nonNull_native;
      uint64_t v12 = sub_25CA78BE0();

      int64_t v13 = 0;
      uint64_t v14 = *(void *)(v12 + 56);
      uint64_t v57 = v12 + 56;
      uint64_t v60 = v12;
      char v15 = *(unsigned char *)(v12 + 32);
      uint64_t isUniquelyReferenced_nonNull_native = v11;
      uint64_t v16 = 1 << v15;
      if (v16 < 64) {
        uint64_t v17 = ~(-1 << v16);
      }
      else {
        uint64_t v17 = -1;
      }
      unint64_t v18 = v17 & v14;
      int64_t v58 = (unint64_t)(v16 + 63) >> 6;
      while (1)
      {
        if (v18)
        {
          unint64_t v19 = __clz(__rbit64(v18));
          v18 &= v18 - 1;
          unint64_t v20 = v19 | (v13 << 6);
        }
        else
        {
          BOOL v21 = __OFADD__(v13++, 1);
          if (v21) {
            goto LABEL_55;
          }
          if (v13 >= v58)
          {
LABEL_44:
            swift_unknownObjectRelease();
            swift_release();
            unint64_t v7 = (unint64_t)v54;
            uint64_t v8 = v55;
            unint64_t v9 = 0x2654E7000;
            if (v55 != v54) {
              goto LABEL_4;
            }
            return isUniquelyReferenced_nonNull_native;
          }
          unint64_t v22 = *(void *)(v57 + 8 * v13);
          if (!v22)
          {
            int64_t v23 = v13 + 1;
            if (v13 + 1 >= v58) {
              goto LABEL_44;
            }
            unint64_t v22 = *(void *)(v57 + 8 * v23);
            if (!v22)
            {
              int64_t v23 = v13 + 2;
              if (v13 + 2 >= v58) {
                goto LABEL_44;
              }
              unint64_t v22 = *(void *)(v57 + 8 * v23);
              if (!v22)
              {
                int64_t v23 = v13 + 3;
                if (v13 + 3 >= v58) {
                  goto LABEL_44;
                }
                unint64_t v22 = *(void *)(v57 + 8 * v23);
                if (!v22)
                {
                  while (1)
                  {
                    int64_t v13 = v23 + 1;
                    if (__OFADD__(v23, 1)) {
                      goto LABEL_56;
                    }
                    if (v13 >= v58) {
                      goto LABEL_44;
                    }
                    unint64_t v22 = *(void *)(v57 + 8 * v13);
                    ++v23;
                    if (v22) {
                      goto LABEL_23;
                    }
                  }
                }
              }
            }
            int64_t v13 = v23;
          }
LABEL_23:
          unint64_t v18 = (v22 - 1) & v22;
          unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
        }
        uint64_t v24 = (unint64_t *)(*(void *)(v60 + 48) + 16 * v20);
        unint64_t v2 = *v24;
        unint64_t v3 = v24[1];
        swift_bridgeObjectRetain();
        unint64_t v25 = (void *)sub_25CA78B00();
        id v26 = objc_msgSend(v59, sel_featureValueForName_, v25);

        if (!v26) {
          break;
        }
        if (*(void *)(isUniquelyReferenced_nonNull_native + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v27 = sub_25CA78748(v2, v3);
          float v28 = 0.0;
          if (v29) {
            float v28 = *(float *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v27);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          float v28 = 0.0;
        }
        sub_25CA75CCC(v26);
        if (v4)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          swift_release();
          return isUniquelyReferenced_nonNull_native;
        }
        float v31 = v30;
        uint64_t v32 = isUniquelyReferenced_nonNull_native;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v61 = v32;
        uint64_t v33 = v2;
        unint64_t v2 = sub_25CA78748(v2, v3);
        uint64_t v35 = *(void *)(v32 + 16);
        BOOL v36 = (v34 & 1) == 0;
        uint64_t v37 = v35 + v36;
        if (__OFADD__(v35, v36))
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        char v38 = v34;
        if (*(void *)(v32 + 24) >= v37)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_25CA6AD40();
          }
        }
        else
        {
          sub_25CA6A5F0(v37, isUniquelyReferenced_nonNull_native);
          unint64_t v39 = sub_25CA78748(v33, v3);
          if ((v38 & 1) != (v40 & 1))
          {
            uint64_t result = sub_25CA78E30();
            __break(1u);
            return result;
          }
          unint64_t v2 = v39;
        }
        float v41 = v28 + v31;
        uint64_t isUniquelyReferenced_nonNull_native = v61;
        if (v38)
        {
          *(float *)(*(void *)(v61 + 56) + 4 * v2) = v41;
        }
        else
        {
          *(void *)(v61 + 8 * (v2 >> 6) + 64) |= 1 << v2;
          uint64_t v42 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v2);
          *uint64_t v42 = v33;
          v42[1] = v3;
          *(float *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v2) = v41;
          uint64_t v43 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
          BOOL v21 = __OFADD__(v43, 1);
          uint64_t v44 = v43 + 1;
          if (v21) {
            goto LABEL_54;
          }
          *(void *)(isUniquelyReferenced_nonNull_native + 16) = v44;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v4 = 0;
      }
      if (qword_26A5E7C80 != -1) {
        goto LABEL_59;
      }
      goto LABEL_47;
    }
LABEL_58:
    __break(1u);
LABEL_59:
    swift_once();
LABEL_47:
    uint64_t v45 = sub_25CA78AA0();
    __swift_project_value_buffer(v45, (uint64_t)qword_26A5E9A10);
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_25CA78A80();
    os_log_type_t v47 = sub_25CA78C40();
    if (os_log_type_enabled(v46, v47))
    {
      os_log_type_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = isUniquelyReferenced_nonNull_native;
      uint64_t v50 = swift_slowAlloc();
      uint64_t v61 = v50;
      *(_DWORD *)os_log_type_t v48 = 136315138;
      swift_bridgeObjectRetain();
      sub_25CA77FF0(v2, v3, &v61);
      sub_25CA78C60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25CA65000, v46, v47, "Couldn't find feature value for %s", v48, 0xCu);
      swift_arrayDestroy();
      uint64_t v51 = v50;
      uint64_t isUniquelyReferenced_nonNull_native = v49;
      MEMORY[0x26119CCC0](v51, -1, -1);
      MEMORY[0x26119CCC0](v48, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_25CA76668();
    swift_allocError();
    *uint64_t v52 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
  return isUniquelyReferenced_nonNull_native;
}

unint64_t sub_25CA76668()
{
  unint64_t result = qword_26A5E7FD8;
  if (!qword_26A5E7FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7FD8);
  }
  return result;
}

unint64_t sub_25CA766BC()
{
  unint64_t result = qword_26A5E7FE0;
  if (!qword_26A5E7FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7FE0);
  }
  return result;
}

unint64_t sub_25CA76710()
{
  unint64_t result = qword_26A5E7FF0;
  if (!qword_26A5E7FF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5E7FF0);
  }
  return result;
}

unint64_t sub_25CA76750()
{
  unint64_t result = qword_26A5E7FF8;
  if (!qword_26A5E7FF8)
  {
    sub_25CA789C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E7FF8);
  }
  return result;
}

uint64_t destroy for ModelEvaluationMetricSpecs()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs()
{
  return &type metadata for ModelEvaluationMetricSpecs;
}

unint64_t sub_25CA769A8()
{
  unint64_t result = qword_26A5E8000;
  if (!qword_26A5E8000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8000);
  }
  return result;
}

uint64_t sub_25CA769FC()
{
  unint64_t v0 = sub_25CA78D40();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25CA76A48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E8008);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25CA76D24();
  sub_25CA78EC0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  char v25 = 0;
  uint64_t v9 = sub_25CA78D50();
  uint64_t v11 = v10;
  char v24 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25CA78D50();
  uint64_t v14 = v13;
  uint64_t v19 = v12;
  char v22 = 2;
  sub_25CA76D78();
  swift_bridgeObjectRetain();
  uint64_t v20 = v14;
  sub_25CA78D80();
  int v18 = v23;
  char v21 = 3;
  sub_25CA76DCC();
  sub_25CA78D80();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  uint64_t v15 = v20;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v15;
  *(unsigned char *)(a2 + 32) = v18;
  return result;
}

unint64_t sub_25CA76D24()
{
  unint64_t result = qword_26A5E8010;
  if (!qword_26A5E8010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8010);
  }
  return result;
}

unint64_t sub_25CA76D78()
{
  unint64_t result = qword_26A5E8018;
  if (!qword_26A5E8018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8018);
  }
  return result;
}

unint64_t sub_25CA76DCC()
{
  unint64_t result = qword_26A5E8020;
  if (!qword_26A5E8020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8020);
  }
  return result;
}

unint64_t sub_25CA76E20()
{
  unint64_t result = qword_26A5E8030;
  if (!qword_26A5E8030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8030);
  }
  return result;
}

unint64_t sub_25CA76E74()
{
  unint64_t result = qword_26A5E8038;
  if (!qword_26A5E8038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8038);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CA77024);
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

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs.CodingKeys()
{
  return &type metadata for ModelEvaluationMetricSpecs.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MetricEncoding(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MetricEncoding(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25CA7714CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25CA77174()
{
  return 0;
}

ValueMetadata *type metadata accessor for MetricEncoding()
{
  return &type metadata for MetricEncoding;
}

unsigned char *storeEnumTagSinglePayload for ModelEvaluationMetricType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25CA77258);
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

ValueMetadata *type metadata accessor for ModelEvaluationMetricType()
{
  return &type metadata for ModelEvaluationMetricType;
}

unint64_t sub_25CA77294()
{
  unint64_t result = qword_26A5E8040;
  if (!qword_26A5E8040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8040);
  }
  return result;
}

unint64_t sub_25CA772EC()
{
  unint64_t result = qword_26A5E8048;
  if (!qword_26A5E8048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8048);
  }
  return result;
}

unint64_t sub_25CA77344()
{
  unint64_t result = qword_26A5E8050;
  if (!qword_26A5E8050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8050);
  }
  return result;
}

unint64_t sub_25CA7739C()
{
  unint64_t result = qword_26A5E8058;
  if (!qword_26A5E8058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8058);
  }
  return result;
}

unint64_t sub_25CA773F4()
{
  unint64_t result = qword_26A5E8060;
  if (!qword_26A5E8060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8060);
  }
  return result;
}

unint64_t sub_25CA77448()
{
  unint64_t result = qword_26A5E8068;
  if (!qword_26A5E8068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8068);
  }
  return result;
}

unint64_t sub_25CA7749C()
{
  unint64_t result = qword_26A5E8070;
  if (!qword_26A5E8070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8070);
  }
  return result;
}

void sub_25CA774F0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  v20[1] = *MEMORY[0x263EF8340];
  unsigned int v6 = (void *)sub_25CA78C10();
  id v7 = objc_msgSend(v6, sel_error);
  if (v7)
  {

    if (qword_26A5E7C80 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25CA78AA0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A5E9A10);
    id v9 = v6;
    swift_bridgeObjectRetain_n();
    id v10 = v9;
    uint64_t v11 = sub_25CA78A80();
    os_log_type_t v12 = sub_25CA78C40();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v20[0] = v19;
      *(_DWORD *)uint64_t v13 = 136315394;
      swift_bridgeObjectRetain();
      sub_25CA77FF0(a1, a2, v20);
      sub_25CA78C60();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2112;
      if (objc_msgSend(v10, sel_error))
      {
        uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
        sub_25CA78C60();
      }
      else
      {
        sub_25CA78C60();
        uint64_t v15 = 0;
      }
      *uint64_t v14 = v15;

      _os_log_impl(&dword_25CA65000, v11, v12, "Error executing %s in Biome: %@", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E58);
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x26119CCC0](v19, -1, -1);
      MEMORY[0x26119CCC0](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v17 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    sub_25CA77F9C();
    swift_allocError();
    *int v18 = 0;
    swift_willThrow();
  }
  else
  {
    uint64_t v16 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v6;
  }
}

NSObject *sub_25CA77834()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_error);
    if (v2)
    {
      uint64_t v3 = v2;
      if (qword_26A5E7C80 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_25CA78AA0();
      __swift_project_value_buffer(v4, (uint64_t)qword_26A5E9A10);
      uint64_t v5 = v3;
      unsigned int v6 = sub_25CA78A80();
      os_log_type_t v7 = sub_25CA78C40();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        id v9 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 138412290;
        id v10 = v5;
        uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
        sub_25CA78C60();
        *id v9 = v21;

        _os_log_impl(&dword_25CA65000, v6, v7, "Error in fetching row: %@", v8, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E58);
        swift_arrayDestroy();
        MEMORY[0x26119CCC0](v9, -1, -1);
        MEMORY[0x26119CCC0](v8, -1, -1);
      }
      else
      {
      }
      sub_25CA77F9C();
      swift_allocError();
      *uint64_t v19 = 0;
      swift_willThrow();

      return v5;
    }
    uint64_t v11 = *(void **)(v0 + 16);
    if (v11)
    {
      id v12 = objc_msgSend(v11, sel_row);
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = sub_25CA78AE0();

        uint64_t v5 = sub_25CA77B74(v14);
        swift_bridgeObjectRelease();
        if (v5) {
          return v5;
        }
      }
    }
  }
  if (qword_26A5E7C80 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_25CA78AA0();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A5E9A10);
  uint64_t v5 = sub_25CA78A80();
  os_log_type_t v16 = sub_25CA78C30();
  if (os_log_type_enabled(v5, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_25CA65000, v5, v16, "Row cannot be converted into SiriPrivateLearningPFLBiomeSQLRow", v17, 2u);
    MEMORY[0x26119CCC0](v17, -1, -1);
  }

  sub_25CA77F9C();
  swift_allocError();
  *int v18 = 1;
  swift_willThrow();
  return v5;
}

unint64_t sub_25CA77B74(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E7E78);
    id v2 = (void *)sub_25CA78D20();
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_25CA6C478();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_25CA78648(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_25CA6C4E0(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_25CA78648((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_25CA786A4((uint64_t)v30);
      swift_bridgeObjectRelease();
      sub_25CA6C478();
      swift_release();
      return 0;
    }
    sub_25CA6C4E0((uint64_t)v31 + 8, (uint64_t)v25);
    sub_25CA786A4((uint64_t)v30);
    sub_25CA6BCE8(v25, v26);
    long long v27 = v24;
    sub_25CA6BCE8(v26, v28);
    long long v16 = v27;
    sub_25CA6BCE8(v28, v29);
    sub_25CA6BCE8(v29, &v27);
    unint64_t result = sub_25CA78748(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v16;
      id v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v9);
      unint64_t result = (unint64_t)sub_25CA6BCE8(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_25CA6BCE8(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_25CA77F38()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for BiomeSQLClient()
{
  return self;
}

unint64_t sub_25CA77F9C()
{
  unint64_t result = qword_26A5E8078;
  if (!qword_26A5E8078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5E8078);
  }
  return result;
}

uint64_t sub_25CA77FF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25CA780C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25CA6C4E0((uint64_t)v12, *a3);
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
      sub_25CA6C4E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_25CA780C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25CA78C70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25CA78280(a5, a6);
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
  uint64_t v8 = sub_25CA78CE0();
  if (!v8)
  {
    sub_25CA78CF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25CA78D30();
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

uint64_t sub_25CA78280(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25CA78318(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25CA784F8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25CA784F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25CA78318(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25CA78490(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25CA78CD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25CA78CF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25CA78B20();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25CA78D30();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25CA78CF0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25CA78490(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E8088);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25CA784F8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E8088);
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
  int64_t v13 = a4 + 32;
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
  uint64_t result = sub_25CA78D30();
  __break(1u);
  return result;
}

uint64_t sub_25CA78648(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25CA786A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E8080);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25CA78704(uint64_t a1)
{
  uint64_t v2 = sub_25CA78E80();
  return sub_25CA787C0(a1, v2);
}

unint64_t sub_25CA78748(uint64_t a1, uint64_t a2)
{
  sub_25CA78E90();
  sub_25CA78B10();
  uint64_t v4 = sub_25CA78EB0();
  return sub_25CA7885C(a1, a2, v4);
}

unint64_t sub_25CA787C0(uint64_t a1, uint64_t a2)
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

unint64_t sub_25CA7885C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25CA78E10() & 1) == 0)
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
      while (!v14 && (sub_25CA78E10() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25CA78940()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25CA78950()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25CA78960()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25CA78970()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25CA78980()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25CA78990()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25CA789A0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25CA789B0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25CA789C0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25CA789D0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25CA789E0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25CA789F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25CA78A00()
{
  return MEMORY[0x270F56FE0]();
}

uint64_t sub_25CA78A10()
{
  return MEMORY[0x270F56FE8]();
}

uint64_t sub_25CA78A20()
{
  return MEMORY[0x270F56FF8]();
}

uint64_t sub_25CA78A30()
{
  return MEMORY[0x270F57000]();
}

uint64_t sub_25CA78A40()
{
  return MEMORY[0x270F57008]();
}

uint64_t sub_25CA78A50()
{
  return MEMORY[0x270F570B8]();
}

uint64_t sub_25CA78A60()
{
  return MEMORY[0x270F570C0]();
}

uint64_t sub_25CA78A70()
{
  return MEMORY[0x270F570C8]();
}

uint64_t sub_25CA78A80()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25CA78A90()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25CA78AA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25CA78AB0()
{
  return MEMORY[0x270F9D010]();
}

uint64_t sub_25CA78AC0()
{
  return MEMORY[0x270F9D030]();
}

uint64_t sub_25CA78AD0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25CA78AE0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25CA78AF0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25CA78B00()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25CA78B10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25CA78B20()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25CA78B30()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25CA78B40()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25CA78B50()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25CA78B60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25CA78B70()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25CA78B80()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25CA78B90()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25CA78BA0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25CA78BB0()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_25CA78BC0()
{
  return MEMORY[0x270EF1C40]();
}

uint64_t sub_25CA78BD0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25CA78BE0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25CA78BF0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25CA78C00()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25CA78C10()
{
  return MEMORY[0x270F10C08]();
}

uint64_t sub_25CA78C20()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25CA78C30()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25CA78C40()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25CA78C50()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25CA78C60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25CA78C70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25CA78C80()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_25CA78C90()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_25CA78CA0()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_25CA78CB0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25CA78CC0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25CA78CD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25CA78CE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25CA78CF0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25CA78D00()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25CA78D10()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25CA78D20()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25CA78D30()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25CA78D40()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25CA78D50()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25CA78D60()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_25CA78D70()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25CA78D80()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25CA78D90()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_25CA78DA0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25CA78DB0()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_25CA78DC0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25CA78DD0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25CA78DE0()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_25CA78DF0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25CA78E00()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25CA78E10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25CA78E20()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25CA78E30()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25CA78E40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25CA78E50()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25CA78E60()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25CA78E80()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25CA78E90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25CA78EA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25CA78EB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25CA78EC0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25CA78ED0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}