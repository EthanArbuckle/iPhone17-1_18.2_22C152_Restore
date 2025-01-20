uint64_t Condition.rawValue.getter()
{
  unsigned char *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      return 0x6C616369706F7274;
    case 2:
      return 0x6E61636972727568;
    case 3:
      return result;
    case 4:
      return 0x737265646E756874;
    case 5:
    case 0x25:
      return 0xD000000000000010;
    case 6:
      return 0xD000000000000011;
    case 7:
      return 0xD000000000000011;
    case 8:
    case 0xA:
      return 0x676E697A65657266;
    case 9:
      return 0x656C7A7A697264;
    case 0xB:
      return 0x737265776F6873;
    case 0xC:
      return 1852399986;
    case 0xD:
      return 0x7365697272756C66;
    case 0xE:
      return 0x776F6853776F6E73;
    case 0xF:
      return 0x53676E69776F6C62;
    case 0x10:
      return 2003791475;
    case 0x11:
      return 1818845544;
    case 0x12:
      return 0x7465656C73;
    case 0x13:
      return 1953723748;
    case 0x14:
      return 6778726;
    case 0x15:
      return 1702519144;
    case 0x16:
      return 0x656B6F6D73;
    case 0x17:
      return 0x797A65657262;
    case 0x18:
      v2 = 1684957559;
      return v2 & 0xFFFF0000FFFFFFFFLL | 0x7900000000;
    case 0x19:
      return 0x646967697266;
    case 0x1A:
      return 0x7964756F6C63;
    case 0x1B:
    case 0x1F:
      return 0x6C43796C74736F6DLL;
    case 0x1C:
      return 0x6C43796C74726170;
    case 0x1D:
      return 0x7261656C63;
    case 0x1E:
      v2 = 1852732787;
      return v2 & 0xFFFF0000FFFFFFFFLL | 0x7900000000;
    case 0x20:
      return 0x7553796C74736F6DLL;
    case 0x21:
      v3 = 0x52646578696DLL;
      goto LABEL_38;
    case 0x22:
      return 7630696;
    case 0x23:
      return 0xD000000000000015;
    case 0x24:
      return 0xD000000000000016;
    case 0x26:
      v3 = 0x527976616568;
LABEL_38:
      result = v3 & 0xFFFFFFFFFFFFLL | 0x6961000000000000;
      break;
    case 0x27:
      result = 0xD000000000000014;
      break;
    case 0x28:
      result = 0x6F6E537976616568;
      break;
    case 0x29:
      result = 0x6472617A7A696C62;
      break;
    case 0x2A:
      result = 0x6C69617641746F6ELL;
      break;
    default:
      result = 0x6F64616E726F74;
      break;
  }
  return result;
}

uint64_t sub_20A15925C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_20A10DFC0(*a1, *a2);
}

unint64_t sub_20A15926C()
{
  unint64_t result = qword_26760E4A8;
  if (!qword_26760E4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E4A8);
  }
  return result;
}

uint64_t sub_20A1592B8()
{
  return sub_20A185038(*v0);
}

uint64_t sub_20A1592C0(uint64_t a1)
{
  return sub_20A1851D4(a1, *v1);
}

uint64_t sub_20A1592C8(uint64_t a1)
{
  return sub_20A1869E8(a1, *v1);
}

WeatherAnalytics::Condition_optional sub_20A1592D0(Swift::String *a1)
{
  return Condition.init(rawValue:)(*a1);
}

uint64_t sub_20A1592DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Condition.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A159304()
{
  return sub_20A188210();
}

uint64_t sub_20A159364()
{
  return sub_20A188200();
}

uint64_t getEnumTagSinglePayload for Condition(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD6)
  {
    if (a2 + 42 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 42) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 43;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x2B;
  int v5 = v6 - 43;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Condition(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 42 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 42) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD5)
  {
    unsigned int v6 = ((a2 - 214) >> 8) + 1;
    *uint64_t result = a2 + 42;
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
        JUMPOUT(0x20A159508);
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
          *uint64_t result = a2 + 42;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Condition()
{
  return &type metadata for Condition;
}

unint64_t sub_20A159540()
{
  unint64_t result = qword_26760E4B0;
  if (!qword_26760E4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E4B0);
  }
  return result;
}

uint64_t static IncorrectPrecipitationNotificationData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

void IncorrectPrecipitationNotificationData.notificationType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *IncorrectPrecipitationNotificationData.notificationType.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*IncorrectPrecipitationNotificationData.notificationType.modify())()
{
  return nullsub_1;
}

void IncorrectPrecipitationNotificationData.correctNotificationType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *IncorrectPrecipitationNotificationData.correctNotificationType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*IncorrectPrecipitationNotificationData.correctNotificationType.modify())()
{
  return nullsub_1;
}

uint64_t IncorrectPrecipitationNotificationData.currentPrecipitationForecastData.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_1_4(*(void *)(v1 + 24), a1);
}

uint64_t IncorrectPrecipitationNotificationData.currentPrecipitationForecastData.setter(int *a1)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t v4 = *((void *)a1 + 2);
  uint64_t result = swift_bridgeObjectRelease();
  *(_DWORD *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = v4;
  return result;
}

uint64_t (*IncorrectPrecipitationNotificationData.currentPrecipitationForecastData.modify())()
{
  return nullsub_1;
}

uint64_t IncorrectPrecipitationNotificationData.previousPrecipitationForecastData.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_1_4(*(void *)(v1 + 48), a1);
}

uint64_t IncorrectPrecipitationNotificationData.previousPrecipitationForecastData.setter(int *a1)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t v4 = *((void *)a1 + 2);
  uint64_t result = swift_bridgeObjectRelease();
  *(_DWORD *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  *(void *)(v1 + 48) = v4;
  return result;
}

uint64_t (*IncorrectPrecipitationNotificationData.previousPrecipitationForecastData.modify())()
{
  return nullsub_1;
}

unsigned char *IncorrectPrecipitationNotificationData.init(notificationType:correctNotificationType:currentPrecipitationForecastData:previousPrecipitationForecastData:)@<X0>(unsigned char *result@<X0>, char *a2@<X1>, int *a3@<X2>, int *a4@<X3>, uint64_t a5@<X8>)
{
  char v5 = *a2;
  int v6 = *a3;
  uint64_t v7 = *((void *)a3 + 1);
  uint64_t v8 = *((void *)a3 + 2);
  int v9 = *a4;
  uint64_t v10 = *((void *)a4 + 1);
  uint64_t v11 = *((void *)a4 + 2);
  *(unsigned char *)a5 = *result;
  *(unsigned char *)(a5 + 1) = v5;
  *(_DWORD *)(a5 + 8) = v6;
  *(void *)(a5 + 16) = v7;
  *(void *)(a5 + 24) = v8;
  *(_DWORD *)(a5 + 32) = v9;
  *(void *)(a5 + 40) = v10;
  *(void *)(a5 + 48) = v11;
  return result;
}

uint64_t sub_20A159708(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000020A19CAF0 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000020A19D390 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x800000020A19CB10 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x800000020A19CB40)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_20A1598A4(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0xD000000000000020;
      break;
    case 3:
      unint64_t result = 0xD000000000000021;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_20A15992C()
{
  return sub_20A1598A4(*v0);
}

uint64_t sub_20A159934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A159708(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A15995C(uint64_t a1)
{
  unint64_t v2 = sub_20A159BA4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A159998(uint64_t a1)
{
  unint64_t v2 = sub_20A159BA4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IncorrectPrecipitationNotificationData.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E4B8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  int v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *v1;
  int v27 = v1[1];
  int v23 = *((_DWORD *)v1 + 2);
  uint64_t v11 = *((void *)v1 + 2);
  uint64_t v21 = *((void *)v1 + 3);
  uint64_t v22 = v11;
  int v18 = *((_DWORD *)v1 + 8);
  uint64_t v12 = *((void *)v1 + 6);
  uint64_t v19 = *((void *)v1 + 5);
  uint64_t v20 = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A159BA4();
  sub_20A1887B0();
  LOBYTE(v24) = v10;
  char v28 = 0;
  sub_20A129ED4();
  OUTLINED_FUNCTION_3_17();
  if (!v2)
  {
    uint64_t v13 = v21;
    uint64_t v14 = v22;
    int v15 = v23;
    LOBYTE(v24) = v27;
    char v28 = 1;
    OUTLINED_FUNCTION_3_17();
    int v24 = v15;
    uint64_t v25 = v14;
    uint64_t v26 = v13;
    char v28 = 2;
    sub_20A129F20();
    OUTLINED_FUNCTION_3_17();
    int v24 = v18;
    uint64_t v25 = v19;
    uint64_t v26 = v20;
    char v28 = 3;
    OUTLINED_FUNCTION_3_17();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_20A159BA4()
{
  unint64_t result = qword_26760E4C0;
  if (!qword_26760E4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E4C0);
  }
  return result;
}

uint64_t IncorrectPrecipitationNotificationData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E4C8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A159BA4();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A12A16C();
  OUTLINED_FUNCTION_3_25();
  OUTLINED_FUNCTION_3_25();
  sub_20A12A1B8();
  OUTLINED_FUNCTION_2_13();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_13();
  uint64_t v6 = OUTLINED_FUNCTION_2_12();
  v7(v6);
  *(unsigned char *)a2 = v9;
  *(unsigned char *)(a2 + 1) = v9;
  *(_DWORD *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v11;
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v10;
  *(void *)(a2 + 48) = v11;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A159E08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return IncorrectPrecipitationNotificationData.init(from:)(a1, a2);
}

uint64_t sub_20A159E20(void *a1)
{
  return IncorrectPrecipitationNotificationData.encode(to:)(a1);
}

uint64_t initializeWithCopy for IncorrectPrecipitationNotificationData(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IncorrectPrecipitationNotificationData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for IncorrectPrecipitationNotificationData(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for IncorrectPrecipitationNotificationData()
{
  return &type metadata for IncorrectPrecipitationNotificationData;
}

unsigned char *storeEnumTagSinglePayload for IncorrectPrecipitationNotificationData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A15A05CLL);
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

ValueMetadata *type metadata accessor for IncorrectPrecipitationNotificationData.CodingKeys()
{
  return &type metadata for IncorrectPrecipitationNotificationData.CodingKeys;
}

unint64_t sub_20A15A098()
{
  unint64_t result = qword_26760E4D0;
  if (!qword_26760E4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E4D0);
  }
  return result;
}

unint64_t sub_20A15A0E8()
{
  unint64_t result = qword_26760E4D8;
  if (!qword_26760E4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E4D8);
  }
  return result;
}

unint64_t sub_20A15A138()
{
  unint64_t result = qword_26760E4E0;
  if (!qword_26760E4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E4E0);
  }
  return result;
}

uint64_t sub_20A15A184@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DiagnosticSubmissionAuthority();
  uint64_t result = swift_allocObject();
  a1[3] = v2;
  a1[4] = (uint64_t)&off_26BE28B18;
  *a1 = result;
  return result;
}

void sub_20A15A1CC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_20A15A1D8(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A187970();
  uint64_t result = sub_20A187B50();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v3 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C88);
  uint64_t result = sub_20A187B50();
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A187800();
  uint64_t result = sub_20A187B50();
  if (result)
  {
    uint64_t v5 = result;
    sub_20A187840();
    return MEMORY[0x210513580](v3, v4, 0, v5);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20A15A2D4()
{
  sub_20A187970();
  id v0 = objc_msgSend(self, sel_mainBundle);
  return sub_20A187950();
}

uint64_t sub_20A15A320@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_20A187980();
  MEMORY[0x270FA5388](v4);
  unsigned int v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v7 + 104))(v6, *MEMORY[0x263F24E50]);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1876C0();
  uint64_t result = sub_20A187B50();
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v9 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A187970();
  uint64_t result = sub_20A187B50();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v10 = (void *)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44690);
  uint64_t result = sub_20A187B60();
  if (!v17[3])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC444B8);
  uint64_t result = sub_20A187B60();
  if (!v16)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC444B0);
  uint64_t result = sub_20A187B60();
  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C78);
  uint64_t result = sub_20A187B60();
  if (v12[3])
  {
    uint64_t v11 = type metadata accessor for WidgetSessionCoordinator();
    swift_allocObject();
    uint64_t result = sub_20A109B1C((uint64_t)v6, v9, v10, v17, (uint64_t)v15, (uint64_t)v13, v12);
    a2[3] = v11;
    a2[4] = (uint64_t)&protocol witness table for WidgetSessionCoordinator;
    *a2 = result;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_20A15A5B8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1873F0();
  uint64_t result = sub_20A187B50();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v5 = result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43720);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_20A18BFA0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44978);
  uint64_t result = sub_20A187B60();
  if (!v11)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_20A0D3304(&v10, v6 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_20A187B40();
  if (v9)
  {
    sub_20A0D3304(&v8, v6 + 72);
    uint64_t v7 = type metadata accessor for WidgetAnalyticsCoordinator();
    swift_allocObject();
    uint64_t result = (uint64_t)sub_20A17305C(v5, v6);
    a2[3] = v7;
    a2[4] = (uint64_t)&off_26BE28860;
    *a2 = result;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20A15A73C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_20A15A74C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_20A15A784(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26760E4E8, MEMORY[0x263F24D10]);
}

uint64_t static ReportWeatherDNUEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD48, MEMORY[0x263F24D18], (uint64_t)qword_26760E4E8, a1);
}

uint64_t static ReportWeatherDNUEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A15A7EC(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760E500, MEMORY[0x263F24DC8]);
}

uint64_t static ReportWeatherDNUEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD50, MEMORY[0x263F24DD8], (uint64_t)qword_26760E500, a1);
}

uint64_t sub_20A15A84C()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760E518);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760E518);
  return sub_20A187810();
}

uint64_t static ReportWeatherDNUEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD58, MEMORY[0x263F24DE8], (uint64_t)qword_26760E518, a1);
}

uint64_t ReportWeatherDNUEvent.eventData.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherDNUEvent.eventData.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*ReportWeatherDNUEvent.eventData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherDNUEvent.privateUserData.getter()
{
  type metadata accessor for ReportWeatherDNUEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for ReportWeatherDNUEvent(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E548);
}

uint64_t ReportWeatherDNUEvent.privateUserData.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ReportWeatherDNUEvent(0) + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  return v6(v3, a1, v4);
}

uint64_t (*ReportWeatherDNUEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherDNUEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t v4 = a1 + *(int *)(type metadata accessor for ReportWeatherDNUEvent(0) + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  return v7(v4, v2, v5);
}

uint64_t ReportWeatherDNUEvent.Model.eventData.getter()
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherDNUEvent.Model.privateUserData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for ReportWeatherDNUEvent.Model(0) + 20));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for ReportWeatherDNUEvent.Model(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E558);
}

uint64_t ReportWeatherDNUEvent.Model.init(eventData:privateUserData:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(a3, a1);
  uint64_t result = type metadata accessor for ReportWeatherDNUEvent.Model(0);
  uint64_t v9 = (void *)(a3 + *(int *)(result + 20));
  *uint64_t v9 = v5;
  v9[1] = v6;
  return result;
}

uint64_t sub_20A15ACE8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746144746E657665 && a2 == 0xE900000000000061;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5565746176697270 && a2 == 0xEF61746144726573)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A15ADF0(char a1)
{
  if (a1) {
    return 0x5565746176697270;
  }
  else {
    return 0x746144746E657665;
  }
}

uint64_t sub_20A15AE38()
{
  return sub_20A15ADF0(*v0);
}

uint64_t sub_20A15AE40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A15ACE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A15AE68(uint64_t a1)
{
  unint64_t v2 = sub_20A15B064();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A15AEA4(uint64_t a1)
{
  unint64_t v2 = sub_20A15B064();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ReportWeatherDNUEvent.Model.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E530);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A15B064();
  sub_20A1887B0();
  sub_20A1879F0();
  sub_20A0CFC74(&qword_26AC41AC8);
  sub_20A188660();
  if (!v1)
  {
    type metadata accessor for ReportWeatherDNUEvent.Model(0);
    sub_20A0DC128();
    sub_20A188660();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_20A15B064()
{
  unint64_t result = qword_26760E538;
  if (!qword_26760E538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E538);
  }
  return result;
}

uint64_t ReportWeatherDNUEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v28 = sub_20A1879F0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v26 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_8_1();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E540);
  OUTLINED_FUNCTION_2_0();
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = type metadata accessor for ReportWeatherDNUEvent.Model(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A15B064();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v13 = v12;
  uint64_t v14 = v26;
  LOBYTE(v30) = 0;
  sub_20A0CFC74(&qword_26AC41950);
  uint64_t v15 = v28;
  sub_20A1885A0();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 32);
  uint64_t v24 = (uint64_t)v13;
  v16(v13, v3, v15);
  char v32 = 1;
  sub_20A0DC0DC();
  sub_20A1885A0();
  uint64_t v17 = OUTLINED_FUNCTION_3_13();
  v18(v17);
  uint64_t v19 = v31;
  uint64_t v21 = v24;
  uint64_t v20 = v25;
  uint64_t v22 = (void *)(v24 + *(int *)(v9 + 20));
  *uint64_t v22 = v30;
  v22[1] = v19;
  sub_20A15B360(v21, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_20A15B3C4(v21);
}

uint64_t sub_20A15B360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReportWeatherDNUEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A15B3C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReportWeatherDNUEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A15B420@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ReportWeatherDNUEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A15B438(void *a1)
{
  return ReportWeatherDNUEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherDNUEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for ReportWeatherDNUEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for ReportWeatherDNUEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ReportWeatherDNUEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ReportWeatherDNUEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for ReportWeatherDNUEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherDNUEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A15B934);
}

uint64_t sub_20A15B934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ReportWeatherDNUEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A15B9CC);
}

uint64_t sub_20A15B9CC()
{
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_20A15BA4C()
{
  sub_20A0CFB60();
  if (v0 <= 0x3F)
  {
    sub_20A117A08();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherDNUEvent.Model(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_20A1879F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ReportWeatherDNUEvent.Model(uint64_t a1)
{
  uint64_t v2 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ReportWeatherDNUEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ReportWeatherDNUEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ReportWeatherDNUEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ReportWeatherDNUEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherDNUEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A15BEA4);
}

uint64_t sub_20A15BEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ReportWeatherDNUEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A15BF48);
}

void sub_20A15BF48()
{
  OUTLINED_FUNCTION_13();
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    __swift_storeEnumTagSinglePayload(v1, v0, v0, v4);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20) + 8) = (v0 - 1);
  }
}

uint64_t sub_20A15BFC8()
{
  uint64_t result = sub_20A1879F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ReportWeatherDNUEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A15C128);
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

ValueMetadata *type metadata accessor for ReportWeatherDNUEvent.Model.CodingKeys()
{
  return &type metadata for ReportWeatherDNUEvent.Model.CodingKeys;
}

unint64_t sub_20A15C164()
{
  unint64_t result = qword_26760E568;
  if (!qword_26760E568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E568);
  }
  return result;
}

unint64_t sub_20A15C1B4()
{
  unint64_t result = qword_26760E570;
  if (!qword_26760E570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E570);
  }
  return result;
}

unint64_t sub_20A15C204()
{
  unint64_t result = qword_26760E578;
  if (!qword_26760E578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E578);
  }
  return result;
}

uint64_t static OrientationData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

void OrientationData.deviceOrientation.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *OrientationData.deviceOrientation.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*OrientationData.deviceOrientation.modify())()
{
  return nullsub_1;
}

void OrientationData.interfaceOrientation.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *OrientationData.interfaceOrientation.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*OrientationData.interfaceOrientation.modify())()
{
  return nullsub_1;
}

uint64_t sub_20A15C2C8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000020A19D410 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000020A19D430)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A15C3B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A15C2C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A15C3DC(uint64_t a1)
{
  unint64_t v2 = sub_20A0D3810();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A15C418(uint64_t a1)
{
  unint64_t v2 = sub_20A0D3810();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OrientationData.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC42B40);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A0D3810();
  sub_20A188790();
  if (!v2)
  {
    sub_20A15C5BC();
    OUTLINED_FUNCTION_2_21();
    sub_20A15C608();
    OUTLINED_FUNCTION_2_21();
    uint64_t v6 = OUTLINED_FUNCTION_1_14();
    v7(v6);
    *a2 = v10;
    a2[1] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_20A15C5BC()
{
  unint64_t result = qword_26AC42868;
  if (!qword_26AC42868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC42868);
  }
  return result;
}

unint64_t sub_20A15C608()
{
  unint64_t result = qword_26AC42968;
  if (!qword_26AC42968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC42968);
  }
  return result;
}

uint64_t sub_20A15C654@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return OrientationData.init(from:)(a1, a2);
}

uint64_t getEnumTagSinglePayload for OrientationData(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 65284 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 65284 < 0xFF0000) {
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
    int v5 = (*a1 | (v4 << 16)) - 65285;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for OrientationData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65284 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65284 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 252) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 252;
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
        JUMPOUT(0x20A15C7C4);
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
          *(unsigned char *)(result + 1) = a2 + 4;
        break;
    }
  }
  return result;
}

unint64_t sub_20A15C818()
{
  unint64_t result = qword_26760E580;
  if (!qword_26760E580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E580);
  }
  return result;
}

uint64_t static SessionData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t SessionData.utcOffset.getter()
{
  return *v0;
}

uint64_t SessionData.utcOffset.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*SessionData.utcOffset.modify())()
{
  return nullsub_1;
}

uint64_t SessionData.languageCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SessionData.languageCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*SessionData.languageCode.modify())()
{
  return nullsub_1;
}

uint64_t SessionData.countryCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SessionData.countryCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*SessionData.countryCode.modify())()
{
  return nullsub_1;
}

void SessionData.startMethod.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SessionData.startMethod.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 40) = *result;
  return result;
}

uint64_t (*SessionData.startMethod.modify())()
{
  return nullsub_1;
}

uint64_t SessionData.productType.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SessionData.productType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*SessionData.productType.modify())()
{
  return nullsub_1;
}

void SessionData.locationAccess.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SessionData.locationAccess.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 64) = *result;
  return result;
}

uint64_t (*SessionData.locationAccess.modify())()
{
  return nullsub_1;
}

void SessionData.cellularRadioAccessTechnology.getter(unsigned char *a1@<X8>)
{
}

unsigned char *SessionData.cellularRadioAccessTechnology.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 65) = *result;
  return result;
}

uint64_t (*SessionData.cellularRadioAccessTechnology.modify())()
{
  return nullsub_1;
}

uint64_t SessionData.userSegmentationTreatmentIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SessionData.userSegmentationTreatmentIDs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*SessionData.userSegmentationTreatmentIDs.modify())()
{
  return nullsub_1;
}

uint64_t SessionData.userSegmentationSegmentSetIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SessionData.userSegmentationSegmentSetIDs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t (*SessionData.userSegmentationSegmentSetIDs.modify())()
{
  return nullsub_1;
}

uint64_t sub_20A15CB78(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x657366664F637475 && a2 == 0xE900000000000074;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43;
    if (v6 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
      if (v7 || (sub_20A1886B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x74654D7472617473 && a2 == 0xEB00000000646F68;
        if (v8 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x54746375646F7270 && a2 == 0xEB00000000657079;
          if (v9 || (sub_20A1886B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6E6F697461636F6CLL && a2 == 0xEE00737365636341;
            if (v10 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD00000000000001DLL && a2 == 0x800000020A19C130 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0xD00000000000001CLL && a2 == 0x800000020A19D450 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else if (a1 == 0xD00000000000001DLL && a2 == 0x800000020A19D470)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              char v11 = sub_20A1886B0();
              swift_bridgeObjectRelease();
              if (v11) {
                return 8;
              }
              else {
                return 9;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_20A15CF44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A15CB78(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A15CF6C(uint64_t a1)
{
  unint64_t v2 = sub_20A0D60B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A15CFA8(uint64_t a1)
{
  unint64_t v2 = sub_20A0D60B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SessionData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC42B38);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A0D60B4();
  sub_20A188790();
  if (v2)
  {
    unsigned int v8 = 384;
  }
  else
  {
    int v6 = sub_20A1885B0();
    uint64_t v7 = OUTLINED_FUNCTION_4_16();
    uint64_t v11 = v10;
    uint64_t v26 = v7;
    swift_bridgeObjectRetain();
    uint64_t v25 = OUTLINED_FUNCTION_4_16();
    int v29 = v6;
    uint64_t v13 = v12;
    unint64_t v14 = sub_20A15D4CC();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3_27();
    uint64_t v27 = v13;
    if (v14)
    {
      uint64_t v15 = OUTLINED_FUNCTION_0_14();
      v16(v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unsigned int v8 = 390;
    }
    else
    {
      LOBYTE(v28) = 4;
      uint64_t v24 = OUTLINED_FUNCTION_4_16();
      uint64_t v18 = v17;
      unint64_t v19 = sub_20A15D518();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_3_27();
      if (!v19)
      {
        sub_20A10683C();
        sub_20A188530();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44558);
        sub_20A0D5F70(&qword_26AC42B20, &qword_26AC44558);
        sub_20A188530();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44548);
        sub_20A0D5F70(&qword_26AC42B18, &qword_26AC44548);
        swift_bridgeObjectRetain();
        sub_20A188530();
        uint64_t v22 = OUTLINED_FUNCTION_0_14();
        v23(v22);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_DWORD *)a2 = v29;
        *(void *)(a2 + 8) = v26;
        *(void *)(a2 + 16) = v11;
        *(void *)(a2 + 24) = v25;
        *(void *)(a2 + 32) = v27;
        *(unsigned char *)(a2 + 40) = 2;
        *(void *)(a2 + 48) = v24;
        *(void *)(a2 + 56) = v18;
        *(unsigned char *)(a2 + 64) = 4;
        *(unsigned char *)(a2 + 65) = 4;
        *(void *)(a2 + 72) = v28;
        *(void *)(a2 + 80) = v28;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      uint64_t v20 = OUTLINED_FUNCTION_0_14();
      v21(v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unsigned int v8 = 406;
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  if ((v8 & 2) == 0)
  {
    if ((v8 & 4) == 0) {
      goto LABEL_6;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    if (((v8 >> 4) & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  if ((v8 >> 2)) {
    goto LABEL_11;
  }
LABEL_6:
  if ((v8 >> 4)) {
LABEL_7:
  }
    swift_bridgeObjectRelease();
LABEL_8:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_20A15D4CC()
{
  unint64_t result = qword_26AC42820;
  if (!qword_26AC42820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC42820);
  }
  return result;
}

unint64_t sub_20A15D518()
{
  unint64_t result = qword_26AC42948;
  if (!qword_26AC42948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC42948);
  }
  return result;
}

uint64_t sub_20A15D564@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SessionData.init(from:)(a1, a2);
}

uint64_t assignWithCopy for SessionData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SessionData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionData(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for SessionData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

unint64_t sub_20A15D7A4()
{
  unint64_t result = qword_26760E588;
  if (!qword_26760E588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E588);
  }
  return result;
}

uint64_t static DetailViewOriginationData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

void DetailViewOriginationData.origin.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *DetailViewOriginationData.origin.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*DetailViewOriginationData.origin.modify())()
{
  return nullsub_1;
}

void DetailViewOriginationData.componentData.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *DetailViewOriginationData.componentData.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*DetailViewOriginationData.componentData.modify())()
{
  return nullsub_1;
}

WeatherAnalytics::DetailViewOriginationData __swiftcall DetailViewOriginationData.init(origin:componentData:)(WeatherAnalytics::DetailViewOrigin origin, WeatherAnalytics::ComponentData_optional componentData)
{
  char v3 = *(unsigned char *)componentData.value.type;
  *unint64_t v2 = *(unsigned char *)origin;
  v2[1] = v3;
  result.origin = origin;
  return result;
}

uint64_t sub_20A15D87C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E696769726FLL && a2 == 0xE600000000000000;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656E6F706D6F63 && a2 == 0xED00006174614474)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A15D974(char a1)
{
  if (a1) {
    return 0x6E656E6F706D6F63;
  }
  else {
    return 0x6E696769726FLL;
  }
}

uint64_t sub_20A15D9B4()
{
  return sub_20A15D974(*v0);
}

uint64_t sub_20A15D9BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A15D87C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A15D9E4(uint64_t a1)
{
  unint64_t v2 = sub_20A15DBCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A15DA20(uint64_t a1)
{
  unint64_t v2 = sub_20A15DBCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DetailViewOriginationData.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E590);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  BOOL v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *v1;
  int v13 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A15DBCC();
  sub_20A1887B0();
  char v17 = v10;
  char v16 = 0;
  sub_20A15DC18();
  sub_20A188660();
  if (!v2)
  {
    char v15 = v13;
    char v14 = 1;
    sub_20A0EFA60();
    sub_20A1885F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_20A15DBCC()
{
  unint64_t result = qword_26760E598;
  if (!qword_26760E598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E598);
  }
  return result;
}

unint64_t sub_20A15DC18()
{
  unint64_t result = qword_26760E5A0;
  if (!qword_26760E5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E5A0);
  }
  return result;
}

uint64_t DetailViewOriginationData.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E5A8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A15DBCC();
  sub_20A188790();
  if (!v2)
  {
    sub_20A15DDD4();
    OUTLINED_FUNCTION_2_23();
    sub_20A1885A0();
    sub_20A0F00A4();
    OUTLINED_FUNCTION_2_23();
    sub_20A188530();
    uint64_t v6 = OUTLINED_FUNCTION_1_14();
    v7(v6);
    *a2 = v10;
    a2[1] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_20A15DDD4()
{
  unint64_t result = qword_26760E5B0;
  if (!qword_26760E5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E5B0);
  }
  return result;
}

uint64_t sub_20A15DE28@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DetailViewOriginationData.init(from:)(a1, a2);
}

uint64_t sub_20A15DE40(void *a1)
{
  return DetailViewOriginationData.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for DetailViewOriginationData(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 65282 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 65282 < 0xFF0000) {
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
    int v5 = (*a1 | (v4 << 16)) - 65283;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DetailViewOriginationData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65282 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65282 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 254) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 254;
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
        JUMPOUT(0x20A15DFB0);
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
          *(unsigned char *)unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DetailViewOriginationData()
{
  return &type metadata for DetailViewOriginationData;
}

unsigned char *storeEnumTagSinglePayload for DetailViewOriginationData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A15E0B4);
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

ValueMetadata *type metadata accessor for DetailViewOriginationData.CodingKeys()
{
  return &type metadata for DetailViewOriginationData.CodingKeys;
}

unint64_t sub_20A15E0F0()
{
  unint64_t result = qword_26760E5B8;
  if (!qword_26760E5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E5B8);
  }
  return result;
}

unint64_t sub_20A15E140()
{
  unint64_t result = qword_26760E5C0;
  if (!qword_26760E5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E5C0);
  }
  return result;
}

unint64_t sub_20A15E190()
{
  unint64_t result = qword_26760E5C8;
  if (!qword_26760E5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E5C8);
  }
  return result;
}

uint64_t sub_20A15E1DC(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26760E5D0, MEMORY[0x263F24D10]);
}

uint64_t static MapViewEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD60, MEMORY[0x263F24D18], (uint64_t)qword_26760E5D0, a1);
}

uint64_t static MapViewEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A15E244(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760E5E8, MEMORY[0x263F24DC8]);
}

uint64_t static MapViewEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD68, MEMORY[0x263F24DD8], (uint64_t)qword_26760E5E8, a1);
}

uint64_t sub_20A15E2A4()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760E600);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760E600);
  return sub_20A187810();
}

uint64_t static MapViewEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD70, MEMORY[0x263F24DE8], (uint64_t)qword_26760E600, a1);
}

uint64_t MapViewEvent.eventData.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.eventData.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.eventData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.timedData.getter()
{
  OUTLINED_FUNCTION_9_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for MapViewEvent(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E648);
}

uint64_t MapViewEvent.timedData.setter()
{
  type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.timedData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.viewData.getter()
{
  OUTLINED_FUNCTION_9_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.viewData.setter()
{
  type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.viewData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.privateUserData.getter()
{
  OUTLINED_FUNCTION_9_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.privateUserData.setter()
{
  type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.mapEmbedStateData.getter()
{
  OUTLINED_FUNCTION_9_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.mapEmbedStateData.setter()
{
  type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.mapEmbedStateData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.originationData.getter()
{
  OUTLINED_FUNCTION_9_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.originationData.setter()
{
  type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.originationData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.overlayData.getter()
{
  OUTLINED_FUNCTION_9_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.overlayData.setter()
{
  type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.overlayData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.zoomData.getter()
{
  OUTLINED_FUNCTION_9_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.zoomData.setter()
{
  type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*MapViewEvent.zoomData.modify())()
{
  return nullsub_1;
}

uint64_t MapViewEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t v4 = type metadata accessor for MapViewEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = OUTLINED_FUNCTION_6();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = OUTLINED_FUNCTION_6();
  v8(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = OUTLINED_FUNCTION_6();
  v10(v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = OUTLINED_FUNCTION_18_3();
  v12(v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = OUTLINED_FUNCTION_18_3();
  v14(v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = OUTLINED_FUNCTION_6();
  v16(v15);
  uint64_t v17 = a1 + *(int *)(v4 + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  OUTLINED_FUNCTION_1_0();
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 104);
  return v20(v17, v2, v18);
}

uint64_t MapViewEvent.Model.eventData.getter()
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t MapViewEvent.Model.timedData.getter()
{
  OUTLINED_FUNCTION_8_18();
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for MapViewEvent.Model(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E670);
}

uint64_t MapViewEvent.Model.viewData.getter()
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_8_18() + 24));
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  LOWORD(v2) = *((_WORD *)v2 + 8);
  *(void *)uint64_t v0 = v4;
  *(void *)(v0 + 8) = v3;
  *(_WORD *)(v0 + 16) = (_WORD)v2;
  return swift_bridgeObjectRetain();
}

uint64_t MapViewEvent.Model.privateUserData.getter()
{
  uint64_t v2 = (void *)(v1 + *(int *)(OUTLINED_FUNCTION_8_18() + 28));
  uint64_t v3 = v2[1];
  void *v0 = *v2;
  v0[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t MapViewEvent.Model.mapEmbedStateData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_8_18();
  unsigned char *v0 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t MapViewEvent.Model.originationData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_8_18();
  unsigned char *v0 = *(unsigned char *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t MapViewEvent.Model.overlayData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_8_18();
  unsigned char *v0 = *(unsigned char *)(v1 + *(int *)(result + 40));
  return result;
}

float MapViewEvent.Model.zoomData.getter()
{
  float result = *(float *)(v1 + *(int *)(OUTLINED_FUNCTION_8_18() + 44));
  float *v0 = result;
  return result;
}

uint64_t MapViewEvent.Model.init(eventData:timedData:viewData:privateUserData:mapEmbedStateData:originationData:overlayData:zoomData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, char *a5@<X4>, char *a6@<X5>, char *a7@<X6>, int *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v12 = *a3;
  uint64_t v13 = a3[1];
  __int16 v14 = *((_WORD *)a3 + 8);
  uint64_t v15 = *a4;
  uint64_t v16 = a4[1];
  char v17 = *a5;
  char v26 = *a6;
  char v27 = *a7;
  int v18 = *a8;
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v19 + 32))(a9, a1);
  uint64_t v20 = (int *)type metadata accessor for MapViewEvent.Model(0);
  uint64_t v21 = a9 + v20[5];
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32))(v21, a2);
  uint64_t v24 = a9 + v20[6];
  *(void *)uint64_t v24 = v12;
  *(void *)(v24 + 8) = v13;
  *(_WORD *)(v24 + 16) = v14;
  uint64_t v25 = (void *)(a9 + v20[7]);
  *uint64_t v25 = v15;
  v25[1] = v16;
  *(unsigned char *)(a9 + v20[8]) = v17;
  *(unsigned char *)(a9 + v20[9]) = v26;
  *(unsigned char *)(a9 + v20[10]) = v27;
  *(_DWORD *)(a9 + v20[11]) = v18;
  return result;
}

uint64_t sub_20A15F120(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746144746E657665 && a2 == 0xE900000000000061;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x74614464656D6974 && a2 == 0xE900000000000061;
    if (v6 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6174614477656976 && a2 == 0xE800000000000000;
      if (v7 || (sub_20A1886B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x5565746176697270 && a2 == 0xEF61746144726573;
        if (v8 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000011 && a2 == 0x800000020A19D490 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x74616E696769726FLL && a2 == 0xEF617461446E6F69;
          if (v9 || (sub_20A1886B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x4479616C7265766FLL && a2 == 0xEB00000000617461;
            if (v10 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x617461446D6F6F7ALL && a2 == 0xE800000000000000)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              char v12 = sub_20A1886B0();
              swift_bridgeObjectRelease();
              if (v12) {
                return 7;
              }
              else {
                return 8;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_20A15F46C(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x4464656D6974;
      goto LABEL_4;
    case 2:
      uint64_t result = 0x6174614477656976;
      break;
    case 3:
      uint64_t result = 0x5565746176697270;
      break;
    case 4:
      return result;
    case 5:
      uint64_t result = 0x74616E696769726FLL;
      break;
    case 6:
      uint64_t result = 0x4479616C7265766FLL;
      break;
    case 7:
      uint64_t result = 0x617461446D6F6F7ALL;
      break;
    default:
      uint64_t v3 = 0x44746E657665;
LABEL_4:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7461000000000000;
      break;
  }
  return result;
}

uint64_t sub_20A15F590()
{
  return sub_20A15F46C(*v0);
}

uint64_t sub_20A15F598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A15F120(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A15F5C0(uint64_t a1)
{
  unint64_t v2 = sub_20A15F934();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A15F5FC(uint64_t a1)
{
  unint64_t v2 = sub_20A15F934();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MapViewEvent.Model.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E630);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A15F934();
  sub_20A1887B0();
  sub_20A1879F0();
  sub_20A0CFC2C(&qword_26AC41AC8, MEMORY[0x263F24E70]);
  sub_20A188660();
  if (!v1)
  {
    type metadata accessor for MapViewEvent.Model(0);
    sub_20A187A10();
    sub_20A0CFC2C(&qword_26AC41AD0, MEMORY[0x263F24E90]);
    sub_20A188660();
    sub_20A0EBA0C();
    OUTLINED_FUNCTION_4_2();
    sub_20A0DC128();
    OUTLINED_FUNCTION_4_2();
    sub_20A1437C8();
    OUTLINED_FUNCTION_13_8();
    sub_20A0E5AC0();
    OUTLINED_FUNCTION_13_8();
    sub_20A0F99D0();
    OUTLINED_FUNCTION_4_2();
    sub_20A1185DC();
    OUTLINED_FUNCTION_4_2();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_20A15F934()
{
  unint64_t result = qword_26760E638;
  if (!qword_26760E638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E638);
  }
  return result;
}

uint64_t MapViewEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_20A187A10();
  OUTLINED_FUNCTION_2_0();
  uint64_t v25 = v4;
  uint64_t v26 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_20A1879F0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v27 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_7();
  uint64_t v13 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E640);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_8_1();
  uint64_t v28 = (int *)type metadata accessor for MapViewEvent.Model(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_7();
  uint64_t v18 = v17 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A15F934();
  sub_20A188790();
  if (v29) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A0CFC2C(&qword_26AC41950, MEMORY[0x263F24E70]);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v18, v13, v8);
  LOBYTE(v30) = 1;
  sub_20A0CFC2C(&qword_26AC41AD8, MEMORY[0x263F24E90]);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v18 + v28[5], v7, v26);
  sub_20A0EC06C();
  OUTLINED_FUNCTION_16_2();
  sub_20A1885A0();
  uint64_t v19 = v18 + v28[6];
  *(void *)uint64_t v19 = v30;
  *(void *)(v19 + 8) = v31;
  *(_WORD *)(v19 + 16) = v32;
  sub_20A0DC0DC();
  OUTLINED_FUNCTION_16_2();
  sub_20A1885A0();
  uint64_t v20 = (void *)(v18 + v28[7]);
  *uint64_t v20 = v30;
  v20[1] = v31;
  sub_20A143778();
  OUTLINED_FUNCTION_14_3();
  *(unsigned char *)(v18 + v28[8]) = 1;
  sub_20A0E5A70();
  OUTLINED_FUNCTION_14_3();
  *(unsigned char *)(v18 + v28[9]) = 1;
  sub_20A0F9980();
  OUTLINED_FUNCTION_15_2();
  *(unsigned char *)(v18 + v28[10]) = 1;
  sub_20A11858C();
  OUTLINED_FUNCTION_15_2();
  uint64_t v21 = OUTLINED_FUNCTION_7_12();
  v22(v21);
  *(_DWORD *)(v18 + v28[11]) = v30;
  sub_20A15FEDC(v18, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_20A15FF40(v18);
}

uint64_t sub_20A15FEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MapViewEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A15FF40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MapViewEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A15FF9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MapViewEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A15FFB4(void *a1)
{
  return MapViewEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for MapViewEvent(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v36 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    uint64_t v20 = a3[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = a3[9];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    uint64_t v28 = a3[10];
    uint64_t v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    uint64_t v32 = a3[11];
    v33 = (char *)a1 + v32;
    v34 = (char *)a2 + v32;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
  }
  return a1;
}

uint64_t destroy for MapViewEvent(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + a2[9];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = a1 + a2[10];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  uint64_t v17 = a1 + a2[11];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
  return v19(v17, v18);
}

uint64_t initializeWithCopy for MapViewEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
  return a1;
}

uint64_t assignWithCopy for MapViewEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  return a1;
}

uint64_t initializeWithTake for MapViewEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
  return a1;
}

uint64_t assignWithTake for MapViewEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 40))(v32, v33, v34);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A160F60);
}

uint64_t sub_20A160F60(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v16 + 84) == a2)
        {
          uint64_t v8 = v15;
          uint64_t v12 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v18 + 84) == a2)
          {
            uint64_t v8 = v17;
            uint64_t v12 = a3[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
            OUTLINED_FUNCTION_0();
            if (*(_DWORD *)(v20 + 84) == a2)
            {
              uint64_t v8 = v19;
              uint64_t v12 = a3[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
              OUTLINED_FUNCTION_0();
              if (*(_DWORD *)(v22 + 84) == a2)
              {
                uint64_t v8 = v21;
                uint64_t v12 = a3[10];
              }
              else
              {
                uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
                uint64_t v12 = a3[11];
              }
            }
          }
        }
      }
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for MapViewEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A1610E8);
}

uint64_t sub_20A1610E8()
{
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) == v3)
    {
      uint64_t v6 = v8;
      uint64_t v10 = v2[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v12 + 84) == v3)
      {
        uint64_t v6 = v11;
        uint64_t v10 = v2[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v14 + 84) == v3)
        {
          uint64_t v6 = v13;
          uint64_t v10 = v2[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26760E618);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v16 + 84) == v3)
          {
            uint64_t v6 = v15;
            uint64_t v10 = v2[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26760E620);
            OUTLINED_FUNCTION_0();
            if (*(_DWORD *)(v18 + 84) == v3)
            {
              uint64_t v6 = v17;
              uint64_t v10 = v2[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26760DD90);
              OUTLINED_FUNCTION_0();
              if (*(_DWORD *)(v20 + 84) == v3)
              {
                uint64_t v6 = v19;
                uint64_t v10 = v2[10];
              }
              else
              {
                uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E628);
                uint64_t v10 = v2[11];
              }
            }
          }
        }
      }
    }
    uint64_t v7 = v1 + v10;
  }
  return __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_20A161258()
{
  sub_20A0CFB60();
  if (v0 <= 0x3F)
  {
    sub_20A0CFA94();
    if (v1 <= 0x3F)
    {
      sub_20A1615D8(319, &qword_26AC41AB0, (void (*)(void))sub_20A0EC06C, (void (*)(void))sub_20A0EBA0C);
      if (v2 <= 0x3F)
      {
        sub_20A1615D8(319, (unint64_t *)&qword_26AC41A30, (void (*)(void))sub_20A0DC0DC, (void (*)(void))sub_20A0DC128);
        if (v3 <= 0x3F)
        {
          sub_20A1615D8(319, &qword_26760E658, (void (*)(void))sub_20A143778, (void (*)(void))sub_20A1437C8);
          if (v4 <= 0x3F)
          {
            sub_20A1615D8(319, &qword_26760E660, (void (*)(void))sub_20A0E5A70, (void (*)(void))sub_20A0E5AC0);
            if (v5 <= 0x3F)
            {
              sub_20A1615D8(319, &qword_26760DDE0, (void (*)(void))sub_20A0F9980, (void (*)(void))sub_20A0F99D0);
              if (v6 <= 0x3F)
              {
                sub_20A1615D8(319, &qword_26760E668, (void (*)(void))sub_20A11858C, (void (*)(void))sub_20A1185DC);
                if (v7 <= 0x3F) {
                  swift_initStructMetadata();
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_20A1615D8(uint64_t a1, unint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  if (!*a2)
  {
    a3();
    a4();
    unint64_t v6 = sub_20A1875F0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for MapViewEvent.Model(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_20A1879F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_20A187A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v12;
    uint64_t v15 = (char *)a2 + v12;
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    *((_WORD *)v14 + 8) = *((_WORD *)v15 + 8);
    uint64_t v17 = (void *)((char *)a1 + v13);
    uint64_t v18 = (void *)((char *)a2 + v13);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
    uint64_t v21 = a3[11];
    *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    *(_DWORD *)((char *)a1 + v21) = *(_DWORD *)((char *)a2 + v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MapViewEvent.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MapViewEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  uint64_t v15 = *(void *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  *(void *)(v13 + 8) = v15;
  *(_WORD *)(v13 + 16) = *(_WORD *)(v14 + 16);
  uint64_t v16 = (void *)(a1 + v12);
  uint64_t v17 = (void *)(a2 + v12);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v19) = *(unsigned char *)(a2 + v19);
  uint64_t v20 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_DWORD *)(a1 + v20) = *(_DWORD *)(a2 + v20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MapViewEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)(a2 + v11);
  *(void *)(v12 + 8) = *(void *)(a2 + v11 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v12 + 16) = *(unsigned char *)(v13 + 16);
  *(unsigned char *)(v12 + 17) = *(unsigned char *)(v13 + 17);
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_DWORD *)(a1 + a3[11]) = *(_DWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t initializeWithTake for MapViewEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_WORD *)(v13 + 16) = *(_WORD *)(v14 + 16);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v15 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_DWORD *)(a1 + v16) = *(_DWORD *)(a2 + v16);
  return a1;
}

uint64_t assignWithTake for MapViewEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)(a2 + v11 + 8);
  *(void *)uint64_t v12 = *(void *)(a2 + v11);
  *(void *)(v12 + 8) = v14;
  swift_bridgeObjectRelease();
  *(_WORD *)(v12 + 16) = *(_WORD *)(v13 + 16);
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v20) = *(unsigned char *)(a2 + v20);
  uint64_t v21 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_DWORD *)(a1 + v21) = *(_DWORD *)(a2 + v21);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapViewEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A161D54);
}

uint64_t sub_20A161D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_20A187A10();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for MapViewEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A161E20);
}

void sub_20A161E20()
{
  OUTLINED_FUNCTION_13();
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    sub_20A187A10();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) != v3)
    {
      *(void *)(v1 + *(int *)(v2 + 24) + 8) = (v0 - 1);
      return;
    }
    uint64_t v6 = v8;
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }
  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

uint64_t sub_20A161EC8()
{
  uint64_t result = sub_20A1879F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_20A187A10();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MapViewEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A162094);
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

ValueMetadata *type metadata accessor for MapViewEvent.Model.CodingKeys()
{
  return &type metadata for MapViewEvent.Model.CodingKeys;
}

unint64_t sub_20A1620D0()
{
  unint64_t result = qword_26760E680;
  if (!qword_26760E680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E680);
  }
  return result;
}

unint64_t sub_20A162120()
{
  unint64_t result = qword_26760E688;
  if (!qword_26760E688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E688);
  }
  return result;
}

unint64_t sub_20A162170()
{
  unint64_t result = qword_26760E690;
  if (!qword_26760E690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E690);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return sub_20A188530();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_20A1885A0();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return v0;
}

uint64_t static LocationData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

double LocationData.latitudeDouble.getter()
{
  return *(double *)v0;
}

void LocationData.latitudeDouble.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*LocationData.latitudeDouble.modify())()
{
  return nullsub_1;
}

double LocationData.longitudeDouble.getter()
{
  return *(double *)(v0 + 8);
}

void LocationData.longitudeDouble.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*LocationData.longitudeDouble.modify())()
{
  return nullsub_1;
}

uint64_t sub_20A162280(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656475746974616CLL && a2 == 0xEE00656C62756F44;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64757469676E6F6CLL && a2 == 0xEF656C62756F4465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A162398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A162280(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A1623C0(uint64_t a1)
{
  unint64_t v2 = sub_20A0D0F7C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A1623FC(uint64_t a1)
{
  unint64_t v2 = sub_20A0D0F7C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LocationData.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E698);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A0D0F7C();
  sub_20A188790();
  if (!v2)
  {
    sub_20A188580();
    uint64_t v7 = v6;
    sub_20A188580();
    uint64_t v9 = v8;
    uint64_t v10 = OUTLINED_FUNCTION_1();
    v11(v10);
    *a2 = v7;
    a2[1] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_20A16259C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return LocationData.init(from:)(a1, a2);
}

unint64_t sub_20A1625E0()
{
  unint64_t result = qword_26760E6A0;
  if (!qword_26760E6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E6A0);
  }
  return result;
}

uint64_t sub_20A16262C()
{
  uint64_t v0 = sub_20A187850();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  BOOL v3 = (uint64_t *)((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_20A1877B0();
  *BOOL v3 = 11;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F24E00], v0);
  return sub_20A1877A0();
}

uint64_t sub_20A162710(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44690);
  uint64_t result = sub_20A187B60();
  if (!v18)
  {
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44498);
  uint64_t result = sub_20A187B60();
  if (!v16)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC444B8);
  uint64_t result = sub_20A187B60();
  if (!v14)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44970);
  uint64_t result = sub_20A187B60();
  if (!v12)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1876C0();
  uint64_t result = sub_20A187B30();
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = sub_20A1876B0();
  swift_release();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C90);
  uint64_t result = sub_20A187B60();
  if (v10[3])
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v11, v12);
    MEMORY[0x270FA5388](v4);
    uint64_t v6 = (void *)((char *)&v10[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = sub_20A163220((uint64_t)v17, (uint64_t)v15, (uint64_t)v13, *v6, v3, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    return v8;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_20A1629B0(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A187970();
  uint64_t result = sub_20A187B50();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v3 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C88);
  uint64_t result = sub_20A187B50();
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A187800();
  uint64_t result = sub_20A187B50();
  if (result)
  {
    uint64_t v5 = result;
    sub_20A187840();
    return MEMORY[0x210513580](v3, v4, 1, v5);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_20A162AAC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A162AEC(a1, (uint64_t (*)(void))type metadata accessor for CurrentLocationUpdateTelemetryBackend, (uint64_t)&off_26BE23758, a2);
}

uint64_t sub_20A162ACC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A162AEC(a1, (uint64_t (*)(void))type metadata accessor for WidgetRefreshTelemetryBackend, (uint64_t)&off_26BE24518, a2);
}

uint64_t sub_20A162AEC@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1879C0();
  OUTLINED_FUNCTION_3_28();
  uint64_t result = sub_20A187B30();
  if (result)
  {
    uint64_t v9 = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44498);
    uint64_t result = sub_20A187B60();
    if (v13)
    {
      uint64_t v10 = a2(0);
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v9;
      uint64_t result = sub_20A0D3304(&v12, v11 + 24);
      a4[3] = v10;
      a4[4] = a3;
      *a4 = v11;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A162BEC(uint64_t a1)
{
  sub_20A0D42A0(a1, (uint64_t)v3);
  uint64_t v1 = swift_allocObject();
  sub_20A0D3304(v3, v1 + 16);
  sub_20A187760();
  swift_allocObject();
  return sub_20A187750();
}

uint64_t sub_20A162C70(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC445B0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_20A18BFA0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1877B0();
  uint64_t result = sub_20A187B30();
  if (result)
  {
    uint64_t v4 = MEMORY[0x263F24DE0];
    *(void *)(v2 + 32) = result;
    *(void *)(v2 + 40) = v4;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_20A187840();
    uint64_t result = sub_20A187B30();
    if (result)
    {
      uint64_t v5 = MEMORY[0x263F24DF0];
      *(void *)(v2 + 48) = result;
      *(void *)(v2 + 56) = v5;
      return v2;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A162D74@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_20A187980();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v7 + 104))(v6, *MEMORY[0x263F24E58]);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1876C0();
  uint64_t result = sub_20A187B30();
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v9 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A187970();
  uint64_t result = sub_20A187B50();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v10 = (void *)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44690);
  uint64_t result = sub_20A187B60();
  if (!v17[3])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC444B8);
  uint64_t result = sub_20A187B60();
  if (!v16)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC444B0);
  uint64_t result = sub_20A187B60();
  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C78);
  uint64_t result = sub_20A187B60();
  if (v12[3])
  {
    uint64_t v11 = type metadata accessor for WidgetSessionCoordinator();
    swift_allocObject();
    uint64_t result = sub_20A109B1C((uint64_t)v6, v9, v10, v17, (uint64_t)v15, (uint64_t)v13, v12);
    a2[3] = v11;
    a2[4] = (uint64_t)&protocol witness table for WidgetSessionCoordinator;
    *a2 = result;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_20A163024()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_20A16305C()
{
  return sub_20A162C70((void *)(v0 + 16));
}

uint64_t sub_20A16306C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  v16[3] = type metadata accessor for NetworkTelemetryTracker();
  v16[4] = &off_26BE28AB8;
  v16[0] = a4;
  *(void *)(a7 + 184) = 0;
  sub_20A0D42A0(a1, a7 + 16);
  sub_20A0D42A0(a2, a7 + 56);
  sub_20A0D42A0(a3, a7 + 96);
  sub_20A0D42A0((uint64_t)v16, a7 + 136);
  *(void *)(a7 + 176) = a5;
  __swift_project_boxed_opaque_existential_1(a6, a6[3]);
  swift_retain();
  sub_20A187F20();
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44BB8);
  sub_20A0D4304(&qword_26AC44BB0, &qword_26AC44BB8);
  uint64_t v14 = sub_20A187FD0();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_release();
  *(void *)(a7 + 184) = v14;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a6);
  return a7;
}

uint64_t sub_20A163220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v21 = type metadata accessor for NetworkTelemetryTracker();
  uint64_t v22 = &off_26BE28AB8;
  v20[0] = a4;
  type metadata accessor for WidgetNetworkTelemetryManager();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void *)((char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = sub_20A16306C(a1, a2, a3, *v15, a5, a6, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v17;
}

uint64_t sub_20A16336C(void (*a1)(void))
{
  return sub_20A155978(a1);
}

uint64_t sub_20A163374()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

WeatherAnalytics::WidgetFamily_optional __swiftcall WidgetFamily.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t WidgetFamily.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x654D6D6574737973;
      break;
    case 2:
      unint64_t result = 0x614C6D6574737973;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
    case 7:
      unint64_t result = 0x726F737365636361;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 0x6D536D6574737973;
      break;
  }
  return result;
}

uint64_t sub_20A163544(unsigned __int8 *a1, char *a2)
{
  return sub_20A10F004(*a1, *a2);
}

unint64_t sub_20A163554()
{
  unint64_t result = qword_26760E6A8;
  if (!qword_26760E6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E6A8);
  }
  return result;
}

uint64_t sub_20A1635A0()
{
  return sub_20A18506C(*v0);
}

uint64_t sub_20A1635A8()
{
  return sub_20A185C40();
}

uint64_t sub_20A1635B0(uint64_t a1)
{
  return sub_20A1864F4(a1, *v1);
}

WeatherAnalytics::WidgetFamily_optional sub_20A1635B8(Swift::String *a1)
{
  return WidgetFamily.init(rawValue:)(*a1);
}

unint64_t sub_20A1635C4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = WidgetFamily.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A1635EC()
{
  return sub_20A188210();
}

uint64_t sub_20A16364C()
{
  return sub_20A188200();
}

unsigned char *storeEnumTagSinglePayload for WidgetFamily(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x20A163768);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetFamily()
{
  return &type metadata for WidgetFamily;
}

unint64_t sub_20A1637A0()
{
  unint64_t result = qword_26760E6B0;
  if (!qword_26760E6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E6B0);
  }
  return result;
}

WeatherAnalytics::StartMethod __swiftcall StartMethod.init(referringApplication:)(Swift::String referringApplication)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_15();
  if (OUTLINED_FUNCTION_1_26())
  {
    WeatherAnalytics::StartMethod result = swift_bridgeObjectRelease();
    char v4 = 2;
  }
  else if (sub_20A1881C0())
  {
    WeatherAnalytics::StartMethod result = swift_bridgeObjectRelease();
    char v4 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_0_15();
    if (OUTLINED_FUNCTION_1_26())
    {
      WeatherAnalytics::StartMethod result = swift_bridgeObjectRelease();
      char v4 = 3;
    }
    else
    {
      OUTLINED_FUNCTION_0_15();
      char v5 = OUTLINED_FUNCTION_1_26();
      WeatherAnalytics::StartMethod result = swift_bridgeObjectRelease();
      if (v5) {
        char v4 = 5;
      }
      else {
        char v4 = 0;
      }
    }
  }
  *uint64_t v2 = v4;
  return result;
}

WeatherAnalytics::ProviderDataOrigination_optional __swiftcall ProviderDataOrigination.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t ProviderDataOrigination.rawValue.getter()
{
  return *(void *)&aUnknown_51[8 * *v0];
}

uint64_t sub_20A163950(char *a1, char *a2)
{
  return sub_20A10E4E8(*a1, *a2);
}

unint64_t sub_20A163960()
{
  unint64_t result = qword_26760E6B8;
  if (!qword_26760E6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E6B8);
  }
  return result;
}

uint64_t sub_20A1639AC()
{
  return sub_20A185084();
}

uint64_t sub_20A1639B4()
{
  return sub_20A1854C4();
}

uint64_t sub_20A1639BC()
{
  return sub_20A18688C();
}

WeatherAnalytics::ProviderDataOrigination_optional sub_20A1639C4(Swift::String *a1)
{
  return ProviderDataOrigination.init(rawValue:)(*a1);
}

uint64_t sub_20A1639D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ProviderDataOrigination.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A1639F8()
{
  return sub_20A188210();
}

uint64_t sub_20A163A58()
{
  return sub_20A188200();
}

unsigned char *storeEnumTagSinglePayload for ProviderDataOrigination(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A163B74);
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

ValueMetadata *type metadata accessor for ProviderDataOrigination()
{
  return &type metadata for ProviderDataOrigination;
}

unint64_t sub_20A163BAC()
{
  unint64_t result = qword_26AC42530;
  if (!qword_26AC42530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC42530);
  }
  return result;
}

uint64_t sub_20A163BF8(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26760E6C0, MEMORY[0x263F24D10]);
}

uint64_t static WidgetRefreshEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD78, MEMORY[0x263F24D18], (uint64_t)qword_26760E6C0, a1);
}

uint64_t static WidgetRefreshEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A163C60(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760E6D8, MEMORY[0x263F24DC8]);
}

uint64_t static WidgetRefreshEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD80, MEMORY[0x263F24DD8], (uint64_t)qword_26760E6D8, a1);
}

uint64_t sub_20A163CC0()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760E6F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760E6F0);
  return sub_20A187810();
}

uint64_t static WidgetRefreshEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD88, MEMORY[0x263F24DE8], (uint64_t)qword_26760E6F0, a1);
}

uint64_t WidgetRefreshEvent.data.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t WidgetRefreshEvent.data.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*WidgetRefreshEvent.data.modify())()
{
  return nullsub_1;
}

uint64_t WidgetRefreshEvent.timedData.getter()
{
  type metadata accessor for WidgetRefreshEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for WidgetRefreshEvent(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E738);
}

uint64_t WidgetRefreshEvent.timedData.setter()
{
  type metadata accessor for WidgetRefreshEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*WidgetRefreshEvent.timedData.modify())()
{
  return nullsub_1;
}

uint64_t WidgetRefreshEvent.privateUserData.getter()
{
  type metadata accessor for WidgetRefreshEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t WidgetRefreshEvent.privateUserData.setter()
{
  type metadata accessor for WidgetRefreshEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*WidgetRefreshEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t WidgetRefreshEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t refreshed = type metadata accessor for WidgetRefreshEvent(0);
  uint64_t v5 = a1 + *(int *)(refreshed + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 104))(v5, v2);
  uint64_t v7 = a1 + *(int *)(refreshed + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 104);
  return v10(v7, v2, v8);
}

uint64_t WidgetRefreshEvent.Model.data.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t WidgetRefreshEvent.Model.timedData.getter()
{
  type metadata accessor for WidgetRefreshEvent.Model(0);
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for WidgetRefreshEvent.Model(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E750);
}

uint64_t WidgetRefreshEvent.Model.privateUserData.getter@<X0>(void *a1@<X8>)
{
  char v3 = (void *)(v1 + *(int *)(type metadata accessor for WidgetRefreshEvent.Model(0) + 24));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t WidgetRefreshEvent.Model.init(data:timedData:privateUserData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  *(void *)a4 = *(void *)a1;
  *(void *)(a4 + 8) = v6;
  *(unsigned char *)(a4 + 16) = v7;
  uint64_t refreshed = type metadata accessor for WidgetRefreshEvent.Model(0);
  uint64_t v11 = a4 + *(int *)(refreshed + 20);
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 32))(v11, a2);
  uint64_t v14 = (void *)(a4 + *(int *)(refreshed + 24));
  *uint64_t v14 = v8;
  v14[1] = v9;
  return result;
}

uint64_t sub_20A164300(char a1)
{
  return *(void *)&aData_12[8 * a1];
}

uint64_t sub_20A164320()
{
  return sub_20A164300(*v0);
}

uint64_t sub_20A164328(uint64_t a1)
{
  unint64_t v2 = sub_20A164558();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A164364(uint64_t a1)
{
  unint64_t v2 = sub_20A164558();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WidgetRefreshEvent.Model.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E710);
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A164558();
  sub_20A1887B0();
  sub_20A1645A4();
  OUTLINED_FUNCTION_6_3();
  if (!v1)
  {
    type metadata accessor for WidgetRefreshEvent.Model(0);
    sub_20A187A10();
    sub_20A1047E4(&qword_26AC41AD0);
    sub_20A188660();
    sub_20A0DC128();
    OUTLINED_FUNCTION_6_3();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_20A164558()
{
  unint64_t result = qword_26760E718;
  if (!qword_26760E718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E718);
  }
  return result;
}

unint64_t sub_20A1645A4()
{
  unint64_t result = qword_26760E720;
  if (!qword_26760E720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E720);
  }
  return result;
}

uint64_t WidgetRefreshEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_20A187A10();
  OUTLINED_FUNCTION_2_0();
  uint64_t v21 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E728);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_7();
  uint64_t refreshed = type metadata accessor for WidgetRefreshEvent.Model(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_7();
  uint64_t v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A164558();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A1648F8();
  OUTLINED_FUNCTION_8_5();
  sub_20A1885A0();
  *(void *)uint64_t v15 = v22;
  *(void *)(v15 + 8) = v23;
  *(unsigned char *)(v15 + 16) = v24;
  LOBYTE(v22) = 1;
  sub_20A1047E4(&qword_26AC41AD8);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v15 + *(int *)(refreshed + 20), v9, v4);
  sub_20A0DC0DC();
  OUTLINED_FUNCTION_8_5();
  sub_20A1885A0();
  uint64_t v16 = OUTLINED_FUNCTION_3_1();
  v17(v16);
  uint64_t v18 = (void *)(v15 + *(int *)(refreshed + 24));
  *uint64_t v18 = v22;
  v18[1] = v23;
  sub_20A164944(v15, a2);
  __swift_destroy_boxed_opaque_existential_1(0);
  return sub_20A1649A8(v15);
}

unint64_t sub_20A1648F8()
{
  unint64_t result = qword_26760E730;
  if (!qword_26760E730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E730);
  }
  return result;
}

uint64_t sub_20A164944(uint64_t a1, uint64_t a2)
{
  uint64_t refreshed = type metadata accessor for WidgetRefreshEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 16))(a2, a1, refreshed);
  return a2;
}

uint64_t sub_20A1649A8(uint64_t a1)
{
  uint64_t refreshed = type metadata accessor for WidgetRefreshEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(refreshed - 8) + 8))(a1, refreshed);
  return a1;
}

uint64_t sub_20A164A04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WidgetRefreshEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A164A1C(void *a1)
{
  return WidgetRefreshEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for WidgetRefreshEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for WidgetRefreshEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t initializeWithCopy for WidgetRefreshEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for WidgetRefreshEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for WidgetRefreshEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for WidgetRefreshEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetRefreshEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A165108);
}

uint64_t sub_20A165108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      uint64_t v12 = *(int *)(a3 + 24);
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for WidgetRefreshEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A1651C8);
}

uint64_t sub_20A1651C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E708);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      uint64_t v14 = *(int *)(a4 + 24);
    }
    uint64_t v11 = a1 + v14;
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_20A16527C()
{
  sub_20A1653F0(319, &qword_26760E748, (void (*)(void))sub_20A1648F8, (void (*)(void))sub_20A1645A4);
  if (v0 <= 0x3F)
  {
    sub_20A0CFA94();
    if (v1 <= 0x3F)
    {
      sub_20A1653F0(319, (unint64_t *)&qword_26AC41A30, (void (*)(void))sub_20A0DC0DC, (void (*)(void))sub_20A0DC128);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_20A1653F0(uint64_t a1, unint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  if (!*a2)
  {
    a3();
    a4();
    unint64_t v6 = sub_20A1875F0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for WidgetRefreshEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A165480);
}

uint64_t sub_20A165480(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_20A187A10();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for WidgetRefreshEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A16551C);
}

uint64_t sub_20A16551C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_20A187A10();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_20A16559C()
{
  uint64_t result = sub_20A187A10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WidgetRefreshEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A165708);
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

ValueMetadata *type metadata accessor for WidgetRefreshEvent.Model.CodingKeys()
{
  return &type metadata for WidgetRefreshEvent.Model.CodingKeys;
}

unint64_t sub_20A165744()
{
  unint64_t result = qword_26760E760;
  if (!qword_26760E760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E760);
  }
  return result;
}

unint64_t sub_20A165794()
{
  unint64_t result = qword_26760E768;
  if (!qword_26760E768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E768);
  }
  return result;
}

unint64_t sub_20A1657E4()
{
  unint64_t result = qword_26760E770;
  if (!qword_26760E770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E770);
  }
  return result;
}

WeatherAnalytics::WidgetData __swiftcall WidgetData.init(name:family:)(Swift::String name, WeatherAnalytics::WidgetFamily family)
{
  char v3 = *(unsigned char *)family;
  *(Swift::String *)uint64_t v2 = name;
  *(unsigned char *)(v2 + 16) = v3;
  result.name = name;
  result.family = family;
  return result;
}

uint64_t static WidgetData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t WidgetData.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WidgetData.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*WidgetData.name.modify())()
{
  return nullsub_1;
}

void WidgetData.family.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *WidgetData.family.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*WidgetData.family.modify())()
{
  return nullsub_1;
}

uint64_t sub_20A165908(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x796C696D6166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A1659D8(char a1)
{
  if (a1) {
    return 0x796C696D6166;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_20A165A04()
{
  return sub_20A1659D8(*v0);
}

uint64_t sub_20A165A0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A165908(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A165A34(uint64_t a1)
{
  unint64_t v2 = sub_20A165C14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A165A70(uint64_t a1)
{
  unint64_t v2 = sub_20A165C14();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WidgetData.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E778);
  OUTLINED_FUNCTION_2_0();
  uint64_t v11 = v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A165C14();
  sub_20A1887B0();
  char v15 = 0;
  sub_20A188620();
  if (!v2)
  {
    char v14 = v12;
    char v13 = 1;
    sub_20A165C60();
    sub_20A188660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v8, v4);
}

unint64_t sub_20A165C14()
{
  unint64_t result = qword_26760E780;
  if (!qword_26760E780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E780);
  }
  return result;
}

unint64_t sub_20A165C60()
{
  unint64_t result = qword_26760E788;
  if (!qword_26760E788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E788);
  }
  return result;
}

uint64_t WidgetData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E790);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A165C14();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_20A188560();
  uint64_t v8 = v7;
  sub_20A165E60();
  swift_bridgeObjectRetain();
  sub_20A1885A0();
  uint64_t v9 = OUTLINED_FUNCTION_1_14();
  v10(v9);
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_20A165E60()
{
  unint64_t result = qword_26760E798;
  if (!qword_26760E798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E798);
  }
  return result;
}

uint64_t sub_20A165EB4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WidgetData.init(from:)(a1, a2);
}

uint64_t sub_20A165ECC(void *a1)
{
  return WidgetData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for WidgetData()
{
  return &type metadata for WidgetData;
}

unsigned char *storeEnumTagSinglePayload for WidgetData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A165FC0);
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

ValueMetadata *type metadata accessor for WidgetData.CodingKeys()
{
  return &type metadata for WidgetData.CodingKeys;
}

unint64_t sub_20A165FFC()
{
  unint64_t result = qword_26760E7A0;
  if (!qword_26760E7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7A0);
  }
  return result;
}

unint64_t sub_20A16604C()
{
  unint64_t result = qword_26760E7A8;
  if (!qword_26760E7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7A8);
  }
  return result;
}

unint64_t sub_20A16609C()
{
  unint64_t result = qword_26760E7B0;
  if (!qword_26760E7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7B0);
  }
  return result;
}

uint64_t static DetailViewData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

void DetailViewData.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *DetailViewData.type.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*DetailViewData.type.modify())()
{
  return nullsub_1;
}

WeatherAnalytics::DetailViewData __swiftcall DetailViewData.init(type:)(WeatherAnalytics::DetailViewData type)
{
  unsigned char *v1 = *(unsigned char *)type.type;
  return type;
}

uint64_t sub_20A166134(uint64_t a1)
{
  unint64_t v2 = sub_20A1662BC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A166170(uint64_t a1)
{
  unint64_t v2 = sub_20A1662BC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DetailViewData.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E7B8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1662BC();
  sub_20A1887B0();
  sub_20A166308();
  sub_20A188660();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

unint64_t sub_20A1662BC()
{
  unint64_t result = qword_26760E7C0;
  if (!qword_26760E7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7C0);
  }
  return result;
}

unint64_t sub_20A166308()
{
  unint64_t result = qword_26760E7C8;
  if (!qword_26760E7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7C8);
  }
  return result;
}

uint64_t DetailViewData.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E7D0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1662BC();
  sub_20A188790();
  if (!v2)
  {
    sub_20A166484();
    sub_20A1885A0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v3, v6);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_20A166484()
{
  unint64_t result = qword_26760E7D8;
  if (!qword_26760E7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7D8);
  }
  return result;
}

uint64_t sub_20A1664D8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DetailViewData.init(from:)(a1, a2);
}

uint64_t sub_20A1664F0(void *a1)
{
  return DetailViewData.encode(to:)(a1);
}

unsigned char *storeEnumTagSinglePayload for DetailViewData(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A1665D4);
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

ValueMetadata *type metadata accessor for DetailViewData()
{
  return &type metadata for DetailViewData;
}

unsigned char *storeEnumTagSinglePayload for DetailViewData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x20A1666A8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DetailViewData.CodingKeys()
{
  return &type metadata for DetailViewData.CodingKeys;
}

unint64_t sub_20A1666E4()
{
  unint64_t result = qword_26760E7E0;
  if (!qword_26760E7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7E0);
  }
  return result;
}

unint64_t sub_20A166734()
{
  unint64_t result = qword_26760E7E8;
  if (!qword_26760E7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7E8);
  }
  return result;
}

unint64_t sub_20A166784()
{
  unint64_t result = qword_26760E7F0;
  if (!qword_26760E7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E7F0);
  }
  return result;
}

uint64_t sub_20A1667D0(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26AC440D8, MEMORY[0x263F24D10]);
}

uint64_t static NetworkOperationFailedEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26AC440F0, MEMORY[0x263F24D18], (uint64_t)qword_26AC440D8, a1);
}

uint64_t static NetworkOperationFailedEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A166838(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760E7F8, MEMORY[0x263F24DC8]);
}

uint64_t static NetworkOperationFailedEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26AC440F8, MEMORY[0x263F24DD8], (uint64_t)qword_26760E7F8, a1);
}

uint64_t sub_20A166898()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760E810);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760E810);
  return sub_20A187810();
}

uint64_t static NetworkOperationFailedEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD90, MEMORY[0x263F24DE8], (uint64_t)qword_26760E810, a1);
}

uint64_t NetworkOperationFailedEvent.networkOperationFailedEventData.getter@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t NetworkOperationFailedEvent.networkOperationFailedEventData.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*NetworkOperationFailedEvent.networkOperationFailedEventData.modify())()
{
  return nullsub_1;
}

uint64_t NetworkOperationFailedEvent.privateUserData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NetworkOperationFailedEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for NetworkOperationFailedEvent()
{
  uint64_t result = qword_26AC44108;
  if (!qword_26AC44108) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t NetworkOperationFailedEvent.privateUserData.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NetworkOperationFailedEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  return v6(v3, a1, v4);
}

uint64_t (*NetworkOperationFailedEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t NetworkOperationFailedEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t v4 = a1 + *(int *)(type metadata accessor for NetworkOperationFailedEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  return v7(v4, v2, v5);
}

uint64_t NetworkOperationFailedEvent.Model.networkOperationFailedEventData.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(unsigned char *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t NetworkOperationFailedEvent.Model.privateUserData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 48);
  *a1 = *(void *)(v1 + 40);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

__n128 NetworkOperationFailedEvent.Model.init(networkOperationFailedEventData:privateUserData:)@<Q0>(__n128 *a1@<X0>, unint64_t *a2@<X1>, __n128 *a3@<X8>)
{
  unsigned __int8 v3 = a1[1].n128_u8[0];
  unint64_t v4 = a1[1].n128_u64[1];
  unint64_t v5 = a1[2].n128_u64[0];
  unint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  __n128 result = *a1;
  *a3 = *a1;
  a3[1].n128_u8[0] = v3;
  a3[1].n128_u64[1] = v4;
  a3[2].n128_u64[0] = v5;
  a3[2].n128_u64[1] = v6;
  a3[3].n128_u64[0] = v7;
  return result;
}

uint64_t sub_20A166CB4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001FLL && a2 == 0x800000020A19D510 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5565746176697270 && a2 == 0xEF61746144726573)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A166DB8(char a1)
{
  if (a1) {
    return 0x5565746176697270;
  }
  else {
    return 0xD00000000000001FLL;
  }
}

uint64_t sub_20A166E00()
{
  return sub_20A166DB8(*v0);
}

uint64_t sub_20A166E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A166CB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A166E30(uint64_t a1)
{
  unint64_t v2 = sub_20A167030();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A166E6C(uint64_t a1)
{
  unint64_t v2 = sub_20A167030();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NetworkOperationFailedEvent.Model.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E828);
  OUTLINED_FUNCTION_2_0();
  uint64_t v21 = v4;
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  char v10 = *((unsigned char *)v1 + 16);
  uint64_t v11 = v1[3];
  uint64_t v18 = v1[4];
  uint64_t v19 = v11;
  uint64_t v12 = v1[5];
  uint64_t v16 = v1[6];
  uint64_t v17 = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A167030();
  sub_20A1887B0();
  uint64_t v22 = v9;
  uint64_t v23 = v8;
  char v24 = v10;
  uint64_t v25 = v19;
  uint64_t v26 = v18;
  char v27 = 0;
  sub_20A16707C();
  OUTLINED_FUNCTION_4_18();
  uint64_t v13 = v20;
  sub_20A188660();
  if (!v13)
  {
    uint64_t v22 = v17;
    uint64_t v23 = v16;
    char v27 = 1;
    sub_20A0DC128();
    OUTLINED_FUNCTION_4_18();
    sub_20A188660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v7, v3);
}

unint64_t sub_20A167030()
{
  unint64_t result = qword_26760E830;
  if (!qword_26760E830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E830);
  }
  return result;
}

unint64_t sub_20A16707C()
{
  unint64_t result = qword_26AC44170;
  if (!qword_26AC44170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44170);
  }
  return result;
}

uint64_t NetworkOperationFailedEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E838);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A167030();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A1672C0();
  OUTLINED_FUNCTION_5_17();
  sub_20A1885A0();
  sub_20A0DC0DC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5_17();
  sub_20A1885A0();
  uint64_t v6 = OUTLINED_FUNCTION_2_12();
  v7(v6);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(unsigned char *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v12;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v9;
  *(void *)(a2 + 48) = v10;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_20A1672C0()
{
  unint64_t result = qword_26AC44178;
  if (!qword_26AC44178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44178);
  }
  return result;
}

uint64_t sub_20A16730C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NetworkOperationFailedEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A167324(void *a1)
{
  return NetworkOperationFailedEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for NetworkOperationFailedEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for NetworkOperationFailedEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for NetworkOperationFailedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for NetworkOperationFailedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for NetworkOperationFailedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for NetworkOperationFailedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkOperationFailedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A167820);
}

uint64_t sub_20A167820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for NetworkOperationFailedEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A1678B8);
}

uint64_t sub_20A1678B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43ED8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_20A167944()
{
  sub_20A167A7C(319, &qword_26AC43EE0, (void (*)(void))sub_20A1672C0, (void (*)(void))sub_20A16707C);
  if (v0 <= 0x3F)
  {
    sub_20A167A7C(319, (unint64_t *)&qword_26AC41A30, (void (*)(void))sub_20A0DC0DC, (void (*)(void))sub_20A0DC128);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20A167A7C(uint64_t a1, unint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  if (!*a2)
  {
    a3();
    a4();
    unint64_t v6 = sub_20A1875F0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t destroy for NetworkOperationFailedEvent.Model()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NetworkOperationFailedEvent.Model(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NetworkOperationFailedEvent.Model(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NetworkOperationFailedEvent.Model(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkOperationFailedEvent.Model(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for NetworkOperationFailedEvent.Model(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkOperationFailedEvent.Model()
{
  return &type metadata for NetworkOperationFailedEvent.Model;
}

unsigned char *storeEnumTagSinglePayload for NetworkOperationFailedEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A167E04);
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

ValueMetadata *type metadata accessor for NetworkOperationFailedEvent.Model.CodingKeys()
{
  return &type metadata for NetworkOperationFailedEvent.Model.CodingKeys;
}

unint64_t sub_20A167E40()
{
  unint64_t result = qword_26760E840;
  if (!qword_26760E840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E840);
  }
  return result;
}

unint64_t sub_20A167E90()
{
  unint64_t result = qword_26760E848;
  if (!qword_26760E848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E848);
  }
  return result;
}

unint64_t sub_20A167EE0()
{
  unint64_t result = qword_26760E850;
  if (!qword_26760E850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E850);
  }
  return result;
}

uint64_t sub_20A167F2C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x270FA0228](v0, 97, 7);
}

uint64_t static LocationConditionData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

void LocationConditionData.locationCondition.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *LocationConditionData.locationCondition.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*LocationConditionData.locationCondition.modify())()
{
  return nullsub_1;
}

uint64_t LocationConditionData.temperature.getter()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t LocationConditionData.temperature.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 4) = result;
  return result;
}

uint64_t (*LocationConditionData.temperature.modify())()
{
  return nullsub_1;
}

uint64_t LocationConditionData.temperatureHigh.getter()
{
  return *(unsigned int *)(v0 + 8);
}

uint64_t LocationConditionData.temperatureHigh.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*LocationConditionData.temperatureHigh.modify())()
{
  return nullsub_1;
}

uint64_t LocationConditionData.temperatureLow.getter()
{
  return *(unsigned int *)(v0 + 12);
}

uint64_t LocationConditionData.temperatureLow.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 12) = result;
  return result;
}

uint64_t (*LocationConditionData.temperatureLow.modify())()
{
  return nullsub_1;
}

unsigned char *LocationConditionData.init(locationCondition:temperature:temperatureHigh:temperatureLow:)@<X0>(unsigned char *result@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = *result;
  *(_DWORD *)(a5 + 4) = a2;
  *(_DWORD *)(a5 + 8) = a3;
  *(_DWORD *)(a5 + 12) = a4;
  return result;
}

uint64_t sub_20A168050(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000020A19D5A0 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275;
    if (v5 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v6 = a1 == 0x74617265706D6574 && a2 == 0xEF68676948657275;
      if (v6 || (sub_20A1886B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x74617265706D6574 && a2 == 0xEE00776F4C657275)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v8 = sub_20A1886B0();
        swift_bridgeObjectRelease();
        if (v8) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

unint64_t sub_20A168214(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
      unint64_t result = 0x74617265706D6574;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_20A1682AC()
{
  return sub_20A168214(*v0);
}

uint64_t sub_20A1682B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A168050(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A1682DC(uint64_t a1)
{
  unint64_t v2 = sub_20A1684EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A168318(uint64_t a1)
{
  unint64_t v2 = sub_20A1684EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LocationConditionData.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E858);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *v1;
  int v11 = *((_DWORD *)v1 + 1);
  v13[2] = *((_DWORD *)v1 + 2);
  v13[3] = v11;
  v13[1] = *((_DWORD *)v1 + 3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1684EC();
  sub_20A1887B0();
  char v18 = v10;
  char v17 = 0;
  sub_20A168538();
  sub_20A188660();
  if (!v2)
  {
    char v16 = 1;
    OUTLINED_FUNCTION_1_27();
    char v15 = 2;
    OUTLINED_FUNCTION_1_27();
    char v14 = 3;
    OUTLINED_FUNCTION_1_27();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_20A1684EC()
{
  unint64_t result = qword_26760E860;
  if (!qword_26760E860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E860);
  }
  return result;
}

unint64_t sub_20A168538()
{
  unint64_t result = qword_26760E868;
  if (!qword_26760E868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E868);
  }
  return result;
}

uint64_t LocationConditionData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E870);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A1684EC();
  sub_20A188790();
  if (!v2)
  {
    sub_20A168734();
    sub_20A1885A0();
    int v6 = OUTLINED_FUNCTION_2_25();
    int v11 = OUTLINED_FUNCTION_2_25();
    int v8 = OUTLINED_FUNCTION_2_25();
    uint64_t v9 = OUTLINED_FUNCTION_3_2();
    v10(v9);
    *(unsigned char *)a2 = v12;
    *(_DWORD *)(a2 + 4) = v6;
    *(_DWORD *)(a2 + 8) = v11;
    *(_DWORD *)(a2 + 12) = v8;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_20A168734()
{
  unint64_t result = qword_26760E878;
  if (!qword_26760E878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E878);
  }
  return result;
}

uint64_t sub_20A168788@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LocationConditionData.init(from:)(a1, a2);
}

uint64_t sub_20A1687A0(void *a1)
{
  return LocationConditionData.encode(to:)(a1);
}

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocationConditionData(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD6 && a1[16])
    {
      int v2 = *(_DWORD *)a1 + 213;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 0x2B;
      int v2 = v3 - 43;
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

uint64_t storeEnumTagSinglePayload for LocationConditionData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xD5)
  {
    *(void *)__n128 result = a2 - 214;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD6) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD6) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 42;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationConditionData()
{
  return &type metadata for LocationConditionData;
}

unsigned char *storeEnumTagSinglePayload for LocationConditionData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x20A16891CLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationConditionData.CodingKeys()
{
  return &type metadata for LocationConditionData.CodingKeys;
}

unint64_t sub_20A168958()
{
  unint64_t result = qword_26760E880;
  if (!qword_26760E880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E880);
  }
  return result;
}

unint64_t sub_20A1689A8()
{
  unint64_t result = qword_26760E888;
  if (!qword_26760E888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E888);
  }
  return result;
}

unint64_t sub_20A1689F8()
{
  unint64_t result = qword_26760E890;
  if (!qword_26760E890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E890);
  }
  return result;
}

uint64_t sub_20A168A44(char a1)
{
  uint64_t v2 = sub_20A168AE0();
  sub_20A1795F0(a1);
  sub_20A188190();
  swift_bridgeObjectRelease();
  char v3 = sub_20A0D4850(v2, 0x20746567646957, 0xE700000000000000);
  swift_release();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_20A168AE0()
{
  return swift_getKeyPath();
}

uint64_t type metadata accessor for WidgetTelemetryPrivacySampler()
{
  return self;
}

uint64_t sub_20A168B18(char a1)
{
  return sub_20A168A44(a1) & 1;
}

uint64_t sub_20A168B40()
{
  return sub_20A187160();
}

uint64_t sub_20A168B64()
{
  return sub_20A187160();
}

uint64_t sub_20A168B88()
{
  OUTLINED_FUNCTION_0_16();
  uint64_t result = sub_20A187300();
  void *v0 = v2;
  return result;
}

uint64_t sub_20A168BB0()
{
  OUTLINED_FUNCTION_0_16();
  uint64_t result = sub_20A187330();
  void *v0 = v2;
  return result;
}

uint64_t sub_20A168BD8()
{
  OUTLINED_FUNCTION_0_16();
  uint64_t result = sub_20A187310();
  void *v0 = v2;
  return result;
}

uint64_t sub_20A168C00()
{
  OUTLINED_FUNCTION_0_16();
  uint64_t result = sub_20A187320();
  void *v0 = v2;
  return result;
}

uint64_t sub_20A168C28()
{
  OUTLINED_FUNCTION_0_16();
  uint64_t result = sub_20A1872F0();
  void *v0 = v2;
  return result;
}

WeatherAnalytics::CoarseLocationStatus_optional __swiftcall CoarseLocationStatus.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_20A168CAC()
{
  return sub_20A10E744();
}

unint64_t sub_20A168CBC()
{
  unint64_t result = qword_26760E898;
  if (!qword_26760E898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E898);
  }
  return result;
}

uint64_t sub_20A168D08()
{
  return sub_20A185090();
}

uint64_t sub_20A168D10()
{
  return sub_20A185690();
}

uint64_t sub_20A168D18()
{
  return sub_20A18679C();
}

WeatherAnalytics::CoarseLocationStatus_optional sub_20A168D20(Swift::String *a1)
{
  return CoarseLocationStatus.init(rawValue:)(*a1);
}

uint64_t sub_20A168D2C()
{
  return sub_20A188210();
}

unsigned char *storeEnumTagSinglePayload for CoarseLocationStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A168E58);
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

WeatherAnalytics::DeviceOrientation_optional __swiftcall DeviceOrientation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_20A168EF8()
{
  return sub_20A10E888();
}

unint64_t sub_20A168F08()
{
  unint64_t result = qword_26760E8A0;
  if (!qword_26760E8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E8A0);
  }
  return result;
}

uint64_t sub_20A168F54()
{
  return sub_20A18509C(*v0);
}

uint64_t sub_20A168F5C()
{
  return sub_20A18578C();
}

uint64_t sub_20A168F64(uint64_t a1)
{
  return sub_20A186700(a1, *v1);
}

WeatherAnalytics::DeviceOrientation_optional sub_20A168F6C(Swift::String *a1)
{
  return DeviceOrientation.init(rawValue:)(*a1);
}

uint64_t sub_20A168F78()
{
  return sub_20A188210();
}

unsigned char *storeEnumTagSinglePayload for DeviceOrientation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x20A1690A4);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_20A1690CC(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26AC43FF8, MEMORY[0x263F24D10]);
}

uint64_t static NetworkOperationEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26AC44010, MEMORY[0x263F24D18], (uint64_t)qword_26AC43FF8, a1);
}

uint64_t static NetworkOperationEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A169134(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760E8A8, MEMORY[0x263F24DC8]);
}

uint64_t static NetworkOperationEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26AC44018, MEMORY[0x263F24DD8], (uint64_t)qword_26760E8A8, a1);
}

uint64_t sub_20A169194()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760E8C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760E8C0);
  return sub_20A187810();
}

uint64_t static NetworkOperationEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CD98, MEMORY[0x263F24DE8], (uint64_t)qword_26760E8C0, a1);
}

uint64_t NetworkOperationEvent.networkEventData.getter@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t NetworkOperationEvent.networkEventData.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*NetworkOperationEvent.networkEventData.modify())()
{
  return nullsub_1;
}

uint64_t NetworkOperationEvent.privateUserData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NetworkOperationEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for NetworkOperationEvent()
{
  uint64_t result = qword_26AC44028;
  if (!qword_26AC44028) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t NetworkOperationEvent.privateUserData.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NetworkOperationEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  return v6(v3, a1, v4);
}

uint64_t (*NetworkOperationEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t NetworkOperationEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t v4 = a1 + *(int *)(type metadata accessor for NetworkOperationEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  return v7(v4, v2, v5);
}

uint64_t NetworkOperationEvent.Model.networkEventData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  char v3 = *(unsigned char *)(v1 + 24);
  char v4 = *(unsigned char *)(v1 + 25);
  uint64_t v5 = *(void *)(v1 + 32);
  char v6 = *(unsigned char *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(void *)(a1 + 16) = v2;
  *(unsigned char *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 25) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t NetworkOperationEvent.Model.privateUserData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 72);
  *a1 = *(void *)(v1 + 64);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

__n128 NetworkOperationEvent.Model.init(networkEventData:privateUserData:)@<Q0>(__n128 *a1@<X0>, unint64_t *a2@<X1>, __n128 *a3@<X8>)
{
  unint64_t v3 = a1[1].n128_u64[0];
  unsigned __int8 v4 = a1[1].n128_u8[8];
  unsigned __int8 v5 = a1[1].n128_u8[9];
  unint64_t v6 = a1[2].n128_u64[0];
  unsigned __int8 v7 = a1[2].n128_u8[8];
  unint64_t v8 = a1[3].n128_u64[0];
  unint64_t v9 = a1[3].n128_u64[1];
  unint64_t v10 = *a2;
  unint64_t v11 = a2[1];
  __n128 result = *a1;
  *a3 = *a1;
  a3[1].n128_u64[0] = v3;
  a3[1].n128_u8[8] = v4;
  a3[1].n128_u8[9] = v5;
  a3[2].n128_u64[0] = v6;
  a3[2].n128_u8[8] = v7;
  a3[3].n128_u64[0] = v8;
  a3[3].n128_u64[1] = v9;
  a3[4].n128_u64[0] = v10;
  a3[4].n128_u64[1] = v11;
  return result;
}

uint64_t sub_20A1695EC(uint64_t a1)
{
  unint64_t v2 = sub_20A169824();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A169628(uint64_t a1)
{
  unint64_t v2 = sub_20A169824();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NetworkOperationEvent.Model.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E8D8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v23 = v4;
  MEMORY[0x270FA5388](v5);
  unsigned __int8 v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v21 = *v1;
  uint64_t v8 = *((void *)v1 + 2);
  char v9 = *((unsigned char *)v1 + 24);
  char v10 = *((unsigned char *)v1 + 25);
  uint64_t v11 = *((void *)v1 + 4);
  int v32 = *((unsigned __int8 *)v1 + 40);
  uint64_t v19 = *((void *)v1 + 6);
  uint64_t v20 = v11;
  uint64_t v12 = *((void *)v1 + 7);
  uint64_t v17 = *((void *)v1 + 8);
  uint64_t v18 = v12;
  uint64_t v16 = *((void *)v1 + 9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A169824();
  sub_20A1887B0();
  long long v24 = v21;
  uint64_t v25 = v8;
  char v26 = v9;
  char v27 = v10;
  uint64_t v28 = v20;
  char v29 = v32;
  uint64_t v30 = v19;
  uint64_t v31 = v18;
  char v33 = 0;
  sub_20A1068DC();
  OUTLINED_FUNCTION_5_18();
  uint64_t v13 = v22;
  sub_20A188660();
  if (!v13)
  {
    *(void *)&long long v24 = v17;
    *((void *)&v24 + 1) = v16;
    char v33 = 1;
    sub_20A0DC128();
    OUTLINED_FUNCTION_5_18();
    sub_20A188660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v7, v3);
}

unint64_t sub_20A169824()
{
  unint64_t result = qword_26760E8E0;
  if (!qword_26760E8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E8E0);
  }
  return result;
}

uint64_t NetworkOperationEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E8E8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A169824();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A10688C();
  OUTLINED_FUNCTION_4_19();
  sub_20A1885A0();
  sub_20A0DC0DC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_19();
  sub_20A1885A0();
  uint64_t v6 = OUTLINED_FUNCTION_2_12();
  v7(v6);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 25) = v13;
  *(void *)(a2 + 32) = v14;
  *(unsigned char *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v17;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A169AA8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NetworkOperationEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A169AC0(void *a1)
{
  return NetworkOperationEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for NetworkOperationEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for NetworkOperationEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for NetworkOperationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for NetworkOperationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for NetworkOperationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for NetworkOperationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkOperationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A169FBC);
}

uint64_t sub_20A169FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for NetworkOperationEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A16A054);
}

uint64_t sub_20A16A054(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43EB8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_20A16A0E0()
{
  sub_20A16A218(319, &qword_26AC43EC0, (void (*)(void))sub_20A10688C, (void (*)(void))sub_20A1068DC);
  if (v0 <= 0x3F)
  {
    sub_20A16A218(319, (unint64_t *)&qword_26AC41A30, (void (*)(void))sub_20A0DC0DC, (void (*)(void))sub_20A0DC128);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20A16A218(uint64_t a1, unint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  if (!*a2)
  {
    a3();
    a4();
    unint64_t v6 = sub_20A1875F0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t destroy for NetworkOperationEvent.Model()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NetworkOperationEvent.Model(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v3 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v3;
  uint64_t v4 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NetworkOperationEvent.Model(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for NetworkOperationEvent.Model(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkOperationEvent.Model(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 56);
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

uint64_t storeEnumTagSinglePayload for NetworkOperationEvent.Model(uint64_t result, int a2, int a3)
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkOperationEvent.Model()
{
  return &type metadata for NetworkOperationEvent.Model;
}

unsigned char *storeEnumTagSinglePayload for NetworkOperationEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A16A5F8);
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

ValueMetadata *type metadata accessor for NetworkOperationEvent.Model.CodingKeys()
{
  return &type metadata for NetworkOperationEvent.Model.CodingKeys;
}

unint64_t sub_20A16A634()
{
  unint64_t result = qword_26760E8F0;
  if (!qword_26760E8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E8F0);
  }
  return result;
}

unint64_t sub_20A16A684()
{
  unint64_t result = qword_26760E8F8;
  if (!qword_26760E8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E8F8);
  }
  return result;
}

unint64_t sub_20A16A6D4()
{
  unint64_t result = qword_26760E900;
  if (!qword_26760E900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E900);
  }
  return result;
}

uint64_t sub_20A16A720(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26760E908, MEMORY[0x263F24D10]);
}

uint64_t static ReportWeatherExposureEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDA0, MEMORY[0x263F24D18], (uint64_t)qword_26760E908, a1);
}

uint64_t static ReportWeatherExposureEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A16A788(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760E920, MEMORY[0x263F24DC8]);
}

uint64_t static ReportWeatherExposureEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDA8, MEMORY[0x263F24DD8], (uint64_t)qword_26760E920, a1);
}

uint64_t sub_20A16A7E8()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760E938);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760E938);
  return sub_20A187810();
}

uint64_t static ReportWeatherExposureEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDB0, MEMORY[0x263F24DE8], (uint64_t)qword_26760E938, a1);
}

uint64_t ReportWeatherExposureEvent.eventData.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherExposureEvent.eventData.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherExposureEvent.eventData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherExposureEvent.timedData.getter()
{
  type metadata accessor for ReportWeatherExposureEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for ReportWeatherExposureEvent(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E968);
}

uint64_t ReportWeatherExposureEvent.timedData.setter()
{
  type metadata accessor for ReportWeatherExposureEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherExposureEvent.timedData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherExposureEvent.privateUserData.getter()
{
  type metadata accessor for ReportWeatherExposureEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherExposureEvent.privateUserData.setter()
{
  type metadata accessor for ReportWeatherExposureEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherExposureEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherExposureEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t v4 = type metadata accessor for ReportWeatherExposureEvent(0);
  uint64_t v5 = a1 + *(int *)(v4 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 104))(v5, v2);
  uint64_t v7 = a1 + *(int *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 104);
  return v10(v7, v2, v8);
}

uint64_t ReportWeatherExposureEvent.Model.eventData.getter()
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherExposureEvent.Model.timedData.getter()
{
  type metadata accessor for ReportWeatherExposureEvent.Model(0);
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for ReportWeatherExposureEvent.Model(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760E978);
}

uint64_t ReportWeatherExposureEvent.Model.privateUserData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for ReportWeatherExposureEvent.Model(0) + 24));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t ReportWeatherExposureEvent.Model.init(eventData:timedData:privateUserData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(a4, a1);
  uint64_t v10 = type metadata accessor for ReportWeatherExposureEvent.Model(0);
  uint64_t v11 = a4 + *(int *)(v10 + 20);
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 32))(v11, a2);
  uint64_t v14 = (void *)(a4 + *(int *)(v10 + 24));
  *uint64_t v14 = v7;
  v14[1] = v8;
  return result;
}

uint64_t sub_20A16AE94(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746144746E657665 && a2 == 0xE900000000000061;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x74614464656D6974 && a2 == 0xE900000000000061;
    if (v6 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x5565746176697270 && a2 == 0xEF61746144726573)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_20A1886B0();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_20A16AFFC(char a1)
{
  return *(void *)&aEventdattimedd_0[8 * a1];
}

uint64_t sub_20A16B01C()
{
  return sub_20A16AFFC(*v0);
}

uint64_t sub_20A16B024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A16AE94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A16B04C(uint64_t a1)
{
  unint64_t v2 = sub_20A16B2D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A16B088(uint64_t a1)
{
  unint64_t v2 = sub_20A16B2D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ReportWeatherExposureEvent.Model.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760E950);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A16B2D8();
  sub_20A1887B0();
  sub_20A1879F0();
  sub_20A0CFC2C(&qword_26AC41AC8, MEMORY[0x263F24E70]);
  sub_20A188660();
  if (!v1)
  {
    type metadata accessor for ReportWeatherExposureEvent.Model(0);
    sub_20A187A10();
    sub_20A0CFC2C(&qword_26AC41AD0, MEMORY[0x263F24E90]);
    sub_20A188660();
    sub_20A0DC128();
    sub_20A188660();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_20A16B2D8()
{
  unint64_t result = qword_26760E958;
  if (!qword_26760E958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E958);
  }
  return result;
}

uint64_t ReportWeatherExposureEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = sub_20A187A10();
  OUTLINED_FUNCTION_2_0();
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_7();
  uint64_t v7 = v6 - v5;
  sub_20A1879F0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v24 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7();
  uint64_t v26 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E960);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_8_1();
  uint64_t v13 = type metadata accessor for ReportWeatherExposureEvent.Model(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_7();
  uint64_t v17 = v16 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A16B2D8();
  sub_20A188790();
  if (v27) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A0CFC2C(&qword_26AC41950, MEMORY[0x263F24E70]);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t))(v24 + 32))(v17, v26);
  LOBYTE(v28) = 1;
  sub_20A0CFC2C(&qword_26AC41AD8, MEMORY[0x263F24E90]);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v17 + *(int *)(v13 + 20), v7, v25);
  sub_20A0DC0DC();
  sub_20A1885A0();
  uint64_t v18 = OUTLINED_FUNCTION_4_20();
  v19(v18);
  uint64_t v20 = (void *)(v17 + *(int *)(v13 + 24));
  *uint64_t v20 = v28;
  v20[1] = v29;
  sub_20A16B718(v17, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_20A16B77C(v17);
}

uint64_t sub_20A16B718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReportWeatherExposureEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A16B77C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReportWeatherExposureEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A16B7D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ReportWeatherExposureEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A16B7F0(void *a1)
{
  return ReportWeatherExposureEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherExposureEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for ReportWeatherExposureEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t initializeWithCopy for ReportWeatherExposureEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for ReportWeatherExposureEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for ReportWeatherExposureEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for ReportWeatherExposureEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherExposureEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A16BEDC);
}

uint64_t sub_20A16BEDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      uint64_t v12 = *(int *)(a3 + 24);
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ReportWeatherExposureEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A16BF9C);
}

uint64_t sub_20A16BF9C()
{
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) == v3)
    {
      uint64_t v6 = v8;
      uint64_t v10 = *(int *)(v2 + 20);
    }
    else
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      uint64_t v10 = *(int *)(v2 + 24);
    }
    uint64_t v7 = v1 + v10;
  }
  return __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_20A16C044()
{
  sub_20A0CFB60();
  if (v0 <= 0x3F)
  {
    sub_20A0CFA94();
    if (v1 <= 0x3F)
    {
      sub_20A117A08();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherExposureEvent.Model(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_20A1879F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_20A187A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ReportWeatherExposureEvent.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ReportWeatherExposureEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ReportWeatherExposureEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ReportWeatherExposureEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for ReportWeatherExposureEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_20A187A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherExposureEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A16C6B0);
}

uint64_t sub_20A16C6B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_20A187A10();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for ReportWeatherExposureEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A16C77C);
}

void sub_20A16C77C()
{
  OUTLINED_FUNCTION_13();
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    sub_20A187A10();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) != v3)
    {
      *(void *)(v1 + *(int *)(v2 + 24) + 8) = (v0 - 1);
      return;
    }
    uint64_t v6 = v8;
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }
  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

uint64_t sub_20A16C824()
{
  uint64_t result = sub_20A1879F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_20A187A10();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ReportWeatherExposureEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A16C9C0);
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

ValueMetadata *type metadata accessor for ReportWeatherExposureEvent.Model.CodingKeys()
{
  return &type metadata for ReportWeatherExposureEvent.Model.CodingKeys;
}

unint64_t sub_20A16C9FC()
{
  unint64_t result = qword_26760E988;
  if (!qword_26760E988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E988);
  }
  return result;
}

unint64_t sub_20A16CA4C()
{
  unint64_t result = qword_26760E990;
  if (!qword_26760E990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E990);
  }
  return result;
}

unint64_t sub_20A16CA9C()
{
  unint64_t result = qword_26760E998;
  if (!qword_26760E998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E998);
  }
  return result;
}

uint64_t static NetworkOperationFailedEventData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t NetworkOperationFailedEventData.errorDescriptions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NetworkOperationFailedEventData.errorDescriptions.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*NetworkOperationFailedEventData.errorDescriptions.modify())()
{
  return nullsub_1;
}

uint64_t NetworkOperationFailedEventData.duration.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t NetworkOperationFailedEventData.duration.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*NetworkOperationFailedEventData.duration.modify())()
{
  return nullsub_1;
}

void NetworkOperationFailedEventData.cellularRadioAccessTechnology.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *NetworkOperationFailedEventData.cellularRadioAccessTechnology.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*NetworkOperationFailedEventData.cellularRadioAccessTechnology.modify())()
{
  return nullsub_1;
}

uint64_t NetworkOperationFailedEventData.bundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NetworkOperationFailedEventData.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*NetworkOperationFailedEventData.bundleIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t NetworkOperationFailedEventData.init(errorDescriptions:duration:cellularRadioAccessTechnology:bundleIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6 = *a3;
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = v6;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_20A16CC48(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000020A19C110 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000;
    if (v5 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD00000000000001DLL && a2 == 0x800000020A19C130 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x800000020A19C150)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v6 = sub_20A1886B0();
      swift_bridgeObjectRelease();
      if (v6) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_20A16CDE4(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F697461727564;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_20A16CE84()
{
  return sub_20A16CDE4(*v0);
}

uint64_t sub_20A16CE8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A16CC48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A16CEB4(uint64_t a1)
{
  unint64_t v2 = sub_20A16D128();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A16CEF0(uint64_t a1)
{
  unint64_t v2 = sub_20A16D128();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NetworkOperationFailedEventData.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC441E0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v16 = v1[1];
  int v15 = *((unsigned __int8 *)v1 + 16);
  uint64_t v11 = v1[3];
  v14[1] = v1[4];
  v14[2] = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A16D128();
  sub_20A1887B0();
  uint64_t v22 = v10;
  char v21 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC441B0);
  sub_20A1067D8(&qword_26AC441B8);
  OUTLINED_FUNCTION_3_29();
  sub_20A1885F0();
  if (!v2)
  {
    char v12 = v15;
    char v20 = 1;
    OUTLINED_FUNCTION_3_29();
    sub_20A188680();
    char v19 = v12;
    char v18 = 2;
    sub_20A0D5FD0();
    OUTLINED_FUNCTION_3_29();
    sub_20A188660();
    char v17 = 3;
    OUTLINED_FUNCTION_3_29();
    sub_20A188620();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_20A16D128()
{
  unint64_t result = qword_26AC44150;
  if (!qword_26AC44150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44150);
  }
  return result;
}

uint64_t NetworkOperationFailedEventData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E9A0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A16D128();
  sub_20A188790();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC441B0);
    sub_20A1067D8(&qword_26760D5A8);
    OUTLINED_FUNCTION_2_26();
    sub_20A188530();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_26();
    uint64_t v7 = sub_20A1885C0();
    sub_20A10683C();
    OUTLINED_FUNCTION_2_26();
    sub_20A1885A0();
    OUTLINED_FUNCTION_2_26();
    uint64_t v8 = sub_20A188560();
    uint64_t v10 = v9;
    uint64_t v13 = v8;
    uint64_t v11 = OUTLINED_FUNCTION_1_5();
    v12(v11);
    *(void *)a2 = v15;
    *(void *)(a2 + 8) = v7;
    *(unsigned char *)(a2 + 16) = v14;
    *(void *)(a2 + 24) = v13;
    *(void *)(a2 + 32) = v10;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A16D3E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return NetworkOperationFailedEventData.init(from:)(a1, a2);
}

uint64_t sub_20A16D3FC(void *a1)
{
  return NetworkOperationFailedEventData.encode(to:)(a1);
}

uint64_t destroy for NetworkOperationFailedEventData()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NetworkOperationFailedEventData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NetworkOperationFailedEventData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NetworkOperationFailedEventData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkOperationFailedEventData(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for NetworkOperationFailedEventData(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkOperationFailedEventData()
{
  return &type metadata for NetworkOperationFailedEventData;
}

unsigned char *storeEnumTagSinglePayload for NetworkOperationFailedEventData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A16D6CCLL);
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

ValueMetadata *type metadata accessor for NetworkOperationFailedEventData.CodingKeys()
{
  return &type metadata for NetworkOperationFailedEventData.CodingKeys;
}

unint64_t sub_20A16D708()
{
  unint64_t result = qword_26760E9A8;
  if (!qword_26760E9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E9A8);
  }
  return result;
}

unint64_t sub_20A16D758()
{
  unint64_t result = qword_26AC44160;
  if (!qword_26AC44160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44160);
  }
  return result;
}

unint64_t sub_20A16D7A8()
{
  unint64_t result = qword_26AC44158;
  if (!qword_26AC44158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44158);
  }
  return result;
}

uint64_t static MapStallStatisticsData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t MapStallStatisticsData.activeTaskCount.getter()
{
  return *(void *)v0;
}

uint64_t MapStallStatisticsData.activeTaskCount.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*MapStallStatisticsData.activeTaskCount.modify())()
{
  return nullsub_1;
}

uint64_t MapStallStatisticsData.tasksStalled.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t MapStallStatisticsData.tasksStalled.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*MapStallStatisticsData.tasksStalled.modify())()
{
  return nullsub_1;
}

uint64_t MapStallStatisticsData.avgTimeTaskStalled.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t MapStallStatisticsData.avgTimeTaskStalled.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*MapStallStatisticsData.avgTimeTaskStalled.modify())()
{
  return nullsub_1;
}

uint64_t MapStallStatisticsData.init(activeTaskCount:tasksStalled:avgTimeTaskStalled:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(unsigned char *)(a5 + 8) = a2 & 1;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  return result;
}

uint64_t sub_20A16D8AC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6154657669746361 && a2 == 0xEF746E756F436B73;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x617453736B736174 && a2 == 0xEC00000064656C6CLL;
    if (v6 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000012 && a2 == 0x800000020A19D630)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_20A1886B0();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_20A16DA14(char a1)
{
  if (!a1) {
    return 0x6154657669746361;
  }
  if (a1 == 1) {
    return 0x617453736B736174;
  }
  return 0xD000000000000012;
}

uint64_t sub_20A16DA84()
{
  return sub_20A16DA14(*v0);
}

uint64_t sub_20A16DA8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A16D8AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A16DAB4(uint64_t a1)
{
  unint64_t v2 = sub_20A16DCA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A16DAF0(uint64_t a1)
{
  unint64_t v2 = sub_20A16DCA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MapStallStatisticsData.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E9B0);
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  v12[1] = *(void *)(v1 + 24);
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A16DCA8();
  sub_20A1887B0();
  char v15 = 0;
  uint64_t v10 = v12[3];
  sub_20A188610();
  if (!v10)
  {
    char v14 = 1;
    sub_20A188680();
    char v13 = 2;
    sub_20A188680();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v2);
}

unint64_t sub_20A16DCA8()
{
  unint64_t result = qword_26760E9B8;
  if (!qword_26760E9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E9B8);
  }
  return result;
}

uint64_t MapStallStatisticsData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760E9C0);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A16DCA8();
  sub_20A188790();
  if (!v2)
  {
    uint64_t v6 = sub_20A188550();
    char v8 = v7;
    uint64_t v13 = sub_20A1885C0();
    uint64_t v10 = sub_20A1885C0();
    uint64_t v11 = OUTLINED_FUNCTION_3_2();
    v12(v11);
    *(void *)a2 = v6;
    *(unsigned char *)(a2 + 8) = v8 & 1;
    *(void *)(a2 + 16) = v13;
    *(void *)(a2 + 24) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_20A16DE94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MapStallStatisticsData.init(from:)(a1, a2);
}

uint64_t sub_20A16DEAC(void *a1)
{
  return MapStallStatisticsData.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for MapStallStatisticsData(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MapStallStatisticsData(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MapStallStatisticsData()
{
  return &type metadata for MapStallStatisticsData;
}

unsigned char *storeEnumTagSinglePayload for MapStallStatisticsData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A16DFECLL);
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

ValueMetadata *type metadata accessor for MapStallStatisticsData.CodingKeys()
{
  return &type metadata for MapStallStatisticsData.CodingKeys;
}

unint64_t sub_20A16E028()
{
  unint64_t result = qword_26760E9C8;
  if (!qword_26760E9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E9C8);
  }
  return result;
}

unint64_t sub_20A16E078()
{
  unint64_t result = qword_26760E9D0;
  if (!qword_26760E9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760E9D0);
  }
  return result;
}

unint64_t sub_20A16E0C8()
{
  unint64_t result = qword_26760E9D8;
  if (!qword_26760E9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26760E9D8);
  }
  return result;
}

uint64_t sub_20A16E114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20A188260();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_20A1725FC(a1, &qword_26AC43718);
  }
  else
  {
    sub_20A188250();
    OUTLINED_FUNCTION_1_7();
    OUTLINED_FUNCTION_7_0();
    v7();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20A188230();
    swift_unknownObjectRelease();
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20A16E27C()
{
  type metadata accessor for WidgetTimelineTelemetryManager.SerialActor();
  swift_allocObject();
  uint64_t result = sub_20A16E364();
  qword_26AC43958 = result;
  return result;
}

uint64_t *sub_20A16E2BC()
{
  if (qword_26AC43960 != -1) {
    swift_once();
  }
  return &qword_26AC43958;
}

uint64_t sub_20A16E308()
{
  return sub_20A1883D0();
}

uint64_t sub_20A16E32C()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_20A16E364()
{
  uint64_t v0 = sub_20A188300();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_20A1883A0();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_20A1880D0();
  MEMORY[0x270FA5388](v5 - 8);
  sub_20A0D15A4(0, &qword_26AC43A58);
  sub_20A1880A0();
  v9[1] = MEMORY[0x263F8EE78];
  sub_20A172688(&qword_26AC43A50, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43A28);
  sub_20A0D4540(&qword_26AC43A30, &qword_26AC43A28);
  sub_20A188460();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F138], v0);
  uint64_t v6 = sub_20A1883B0();
  uint64_t v7 = v9[0];
  *(void *)(v9[0] + 16) = v6;
  return v7;
}

uint64_t sub_20A16E5C0()
{
  sub_20A16E2BC();
  return swift_retain();
}

uint64_t sub_20A16E5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for WidgetTimelineTelemetryManager.SerialActor();
  return MEMORY[0x270FA2150](v3, a2);
}

uint64_t WidgetTimelineTelemetryManager.__allocating_init(flushManager:coordinator:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  WidgetTimelineTelemetryManager.init(flushManager:coordinator:)(a1, a2);
  return v4;
}

uint64_t WidgetTimelineTelemetryManager.init(flushManager:coordinator:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_20A16E704(a1, (uint64_t)v9);
  sub_20A16E704(a2, (uint64_t)v8);
  type metadata accessor for WidgetTimelineTelemetryManager.Actor();
  uint64_t v6 = swift_allocObject();
  sub_20A16EF90(v9, v8, 10.0);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(void *)(v3 + 16) = v6;
  return v3;
}

uint64_t sub_20A16E704(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_7();
  (*v3)(a2);
  return a2;
}

uint64_t type metadata accessor for WidgetTimelineTelemetryManager.Actor()
{
  uint64_t result = qword_26AC43240;
  if (!qword_26AC43240) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::Void __swiftcall WidgetTimelineTelemetryManager.start()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43718);
  uint64_t v2 = OUTLINED_FUNCTION_16(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_20A188260();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  uint64_t v7 = qword_26AC43960;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26AC43958;
  uint64_t v9 = sub_20A172688(&qword_26AC43968, (void (*)(uint64_t))type metadata accessor for WidgetTimelineTelemetryManager.SerialActor);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v8;
  v10[3] = v9;
  v10[4] = v0;
  swift_retain();
  sub_20A16E114(v5, (uint64_t)&unk_26760E9E8, (uint64_t)v10);
  swift_release();
}

uint64_t sub_20A16E8F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  if (qword_26AC43960 != -1) {
    swift_once();
  }
  type metadata accessor for WidgetTimelineTelemetryManager.SerialActor();
  sub_20A172688(&qword_26AC43968, (void (*)(uint64_t))type metadata accessor for WidgetTimelineTelemetryManager.SerialActor);
  uint64_t v6 = sub_20A188230();
  return MEMORY[0x270FA2498](sub_20A16E9E8, v6, v5);
}

uint64_t sub_20A16E9E8()
{
  OUTLINED_FUNCTION_2_4();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_20A16EA78;
  return sub_20A16F5B8();
}

uint64_t sub_20A16EA78()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_4();
  return v3();
}

uint64_t WidgetTimelineTelemetryManager.finish(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43718);
  uint64_t v6 = OUTLINED_FUNCTION_16(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_20A188260();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  swift_retain();
  sub_20A0DA7C4(a1);
  if (qword_26AC43960 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_26AC43958;
  uint64_t v12 = sub_20A172688(&qword_26AC43968, (void (*)(uint64_t))type metadata accessor for WidgetTimelineTelemetryManager.SerialActor);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v11;
  v13[3] = v12;
  _DWORD v13[4] = v2;
  v13[5] = a1;
  v13[6] = a2;
  swift_retain();
  sub_20A16E114(v9, (uint64_t)&unk_26760E9F8, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_20A16ECA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  if (qword_26AC43960 != -1) {
    swift_once();
  }
  type metadata accessor for WidgetTimelineTelemetryManager.SerialActor();
  sub_20A172688(&qword_26AC43968, (void (*)(uint64_t))type metadata accessor for WidgetTimelineTelemetryManager.SerialActor);
  uint64_t v8 = sub_20A188230();
  return MEMORY[0x270FA2498](sub_20A16ED98, v8, v7);
}

uint64_t sub_20A16ED98()
{
  OUTLINED_FUNCTION_2_4();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_20A16EE30;
  return sub_20A16FD54();
}

uint64_t sub_20A16EE30()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_4();
  return v3();
}

uint64_t WidgetTimelineTelemetryManager.deinit()
{
  swift_release();
  return v0;
}

uint64_t WidgetTimelineTelemetryManager.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void sub_20A16EF48()
{
}

uint64_t sub_20A16EF6C(uint64_t a1, uint64_t a2)
{
  return WidgetTimelineTelemetryManager.finish(_:)(a1, a2);
}

uint64_t sub_20A16EF90(long long *a1, long long *a2, double a3)
{
  uint64_t v4 = v3;
  sub_20A188300();
  OUTLINED_FUNCTION_2_0();
  uint64_t v27 = v7;
  uint64_t v28 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  uint64_t v10 = v9 - v8;
  sub_20A1882F0();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_7();
  uint64_t v12 = sub_20A1880D0();
  uint64_t v13 = OUTLINED_FUNCTION_16(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_7();
  uint64_t v14 = sub_20A186E60();
  OUTLINED_FUNCTION_2_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_7();
  uint64_t v20 = v19 - v18;
  swift_defaultActor_initialize();
  sub_20A186E50();
  uint64_t v21 = sub_20A186E40();
  uint64_t v23 = v22;
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
  *(void *)(v4 + 112) = v21;
  *(void *)(v4 + 120) = v23;
  sub_20A0D15A4(0, (unint64_t *)&qword_26AC44CF0);
  sub_20A1880B0();
  sub_20A172688((unint64_t *)&qword_26AC44568, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44538);
  sub_20A0D4540((unint64_t *)&qword_26AC44540, &qword_26AC44538);
  sub_20A188460();
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v10, *MEMORY[0x263F8F130], v28);
  *(void *)(v4 + 216) = sub_20A188330();
  uint64_t v24 = v4 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  uint64_t v25 = sub_20A186E30();
  __swift_storeEnumTagSinglePayload(v24, 1, 1, v25);
  *(void *)(v4 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task) = 0;
  sub_20A0D3304(a1, v4 + 128);
  sub_20A0D3304(a2, v4 + 168);
  *(double *)(v4 + 208) = a3;
  return v4;
}

uint64_t type metadata accessor for WidgetTimelineTelemetryManager.SerialActor()
{
  return self;
}

uint64_t sub_20A16F2A0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_20A16F2E0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3_7(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_20A16F380;
  uint64_t v5 = OUTLINED_FUNCTION_27();
  return sub_20A16E8F8(v5, v6, v7, v1);
}

uint64_t sub_20A16F380()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_4();
  return v3();
}

uint64_t sub_20A16F440()
{
  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_20A16F490()
{
  OUTLINED_FUNCTION_28();
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_3_7(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_20A1726D0;
  uint64_t v7 = OUTLINED_FUNCTION_27();
  return sub_20A16ECA4(v7, v8, v9, v1, v2, v3);
}

uint64_t dispatch thunk of WidgetTimelineTelemetryManagerType.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of WidgetTimelineTelemetryManagerType.finish(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for WidgetTimelineTelemetryManager()
{
  return self;
}

uint64_t method lookup function for WidgetTimelineTelemetryManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WidgetTimelineTelemetryManager);
}

uint64_t dispatch thunk of WidgetTimelineTelemetryManager.__allocating_init(flushManager:coordinator:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_20A16F5B8()
{
  OUTLINED_FUNCTION_2_4();
  v1[14] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44270);
  OUTLINED_FUNCTION_16(v2);
  v1[15] = OUTLINED_FUNCTION_24_0();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  OUTLINED_FUNCTION_16_3();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_20A16F650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_13_9();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_26();
  a20 = v22;
  if (qword_26AC44CB0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_20A187FC0();
  v22[18] = __swift_project_value_buffer(v25, (uint64_t)qword_26AC44C58);
  swift_retain();
  uint64_t v26 = sub_20A187FA0();
  os_log_type_t v27 = sub_20A1882D0();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = v22[14];
  if (v28)
  {
    uint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_3_30();
    OUTLINED_FUNCTION_29();
    *uint64_t v30 = 136446210;
    uint64_t v31 = *(void *)(v29 + 112);
    unint64_t v32 = *(void *)(v29 + 120);
    swift_bridgeObjectRetain();
    v22[13] = sub_20A0D4CA8(v31, v32, &a11);
    sub_20A188420();
    swift_bridgeObjectRelease();
    swift_release();
    OUTLINED_FUNCTION_32(&dword_20A0CA000, v26, v27, "Attempting proactive flush - %{public}s");
    OUTLINED_FUNCTION_10_13();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_4_0();
  }
  else
  {
    swift_release();
  }

  char v33 = (void *)v22[14];
  uint64_t v34 = v33[25];
  __swift_project_boxed_opaque_existential_1(v33 + 21, v33[24]);
  uint64_t v45 = *(void *)(v34 + 8) + **(int **)(v34 + 8);
  uint64_t v35 = (void *)swift_task_alloc();
  v22[19] = v35;
  *uint64_t v35 = v22;
  v35[1] = sub_20A16F894;
  OUTLINED_FUNCTION_12_12();
  return v39(v36, v37, v38, v39, v40, v41, v42, v43, v45, v34 + 8, a11, a12, a13, a14);
}

uint64_t sub_20A16F894()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_18();
  *uint64_t v2 = v1;
  *(unsigned char *)(v1 + 72) = v3;
  *(void *)(v1 + 64) = v0;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16_3();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_20A16F974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_13_9();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_26();
  a20 = v22;
  uint64_t v25 = *(void *)(v22 + 136);
  uint64_t v26 = *(void *)(v22 + 112) + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  swift_beginAccess();
  sub_20A1724DC(v26, v25);
  uint64_t v27 = sub_20A186E30();
  if (__swift_getEnumTagSinglePayload(v25, 1, v27) == 1)
  {
    a10 = v22 + 96;
    int v28 = *(unsigned __int8 *)(v22 + 72);
    uint64_t v30 = *(void *)(v22 + 120);
    uint64_t v29 = *(void *)(v22 + 128);
    sub_20A1725FC(*(void *)(v22 + 136), &qword_26AC44270);
    sub_20A186E10();
    __swift_storeEnumTagSinglePayload(v29, 0, 1, v27);
    sub_20A0FF1A8(v29, v30);
    swift_beginAccess();
    sub_20A172594(v30, v26);
    swift_endAccess();
    swift_retain();
    uint64_t v31 = sub_20A187FA0();
    os_log_type_t v32 = sub_20A1882D0();
    BOOL v33 = OUTLINED_FUNCTION_20_1(v32);
    uint64_t v34 = *(void *)(v22 + 112);
    if (v28 == 1)
    {
      if (v33)
      {
        uint64_t v35 = (uint8_t *)OUTLINED_FUNCTION_5_19();
        a11 = OUTLINED_FUNCTION_3_30();
        *(_DWORD *)uint64_t v35 = 136446210;
        a9 = v35 + 4;
        uint64_t v37 = *(void *)(v34 + 112);
        unint64_t v36 = *(void *)(v34 + 120);
        swift_bridgeObjectRetain();
        *(void *)(v22 + 88) = sub_20A0D4CA8(v37, v36, &a11);
        sub_20A188420();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_20A0CA000, v31, (os_log_type_t)v27, "Starting proactive flush - %{public}s", v35, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_4_0();
      }
      else
      {
        swift_release();
      }

      sub_20A170B38();
      goto LABEL_15;
    }
    if (v33)
    {
      a9 = (uint8_t *)(v22 + 80);
      a10 = v22 + 88;
      v44 = (uint8_t *)OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_3_30();
      OUTLINED_FUNCTION_29();
      uint64_t v45 = OUTLINED_FUNCTION_18_4(4.8751e-34);
      uint64_t v47 = OUTLINED_FUNCTION_23_0(v45, v46);
      OUTLINED_FUNCTION_11_15(v47, (void *)(v22 + 80));
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_20A0CA000, v31, (os_log_type_t)v27, "Skipping proactive flush - %{public}s", v44, 0xCu);
      OUTLINED_FUNCTION_10_13();
      OUTLINED_FUNCTION_4_0();
      goto LABEL_9;
    }
LABEL_13:
    swift_release();
    goto LABEL_14;
  }
  sub_20A1725FC(*(void *)(v22 + 136), &qword_26AC44270);
  swift_retain();
  uint64_t v31 = sub_20A187FA0();
  os_log_type_t v38 = sub_20A1882D0();
  BOOL v39 = os_log_type_enabled(v31, v38);
  uint64_t v40 = *(void *)(v22 + 112);
  if (!v39) {
    goto LABEL_13;
  }
  uint64_t v41 = (_DWORD *)OUTLINED_FUNCTION_5_19();
  a10 = v22 + 96;
  a11 = OUTLINED_FUNCTION_3_30();
  *uint64_t v41 = 136446210;
  uint64_t v42 = *(void *)(v40 + 112);
  unint64_t v43 = *(void *)(v40 + 120);
  swift_bridgeObjectRetain();
  *(void *)(v22 + 96) = sub_20A0D4CA8(v42, v43, &a11);
  sub_20A188420();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_32(&dword_20A0CA000, v31, v38, "Cannot start proactive flush, still performing a previous flush - %{public}s");
  swift_arrayDestroy();
  OUTLINED_FUNCTION_4_0();
LABEL_9:
  OUTLINED_FUNCTION_4_0();
LABEL_14:

LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_12_12();
  return v49(v48, v49, v50, v51, v52, v53, v54, v55, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_20A16FD54()
{
  OUTLINED_FUNCTION_2_4();
  v1[10] = v2;
  v1[11] = v0;
  v1[9] = v3;
  uint64_t v4 = sub_20A186E30();
  v1[12] = v4;
  OUTLINED_FUNCTION_1_3(v4);
  v1[13] = v5;
  v1[14] = OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_16_3();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_20A16FDE4()
{
  OUTLINED_FUNCTION_28();
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = v1[24];
  uint64_t v3 = v1[25];
  __swift_project_boxed_opaque_existential_1(v1 + 21, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_20A16FEE4;
  return v6(v2, v3);
}

uint64_t sub_20A16FEE4()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_18();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  *(unsigned char *)(v6 + 168) = v5;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16_3();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_20A16FFC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_13_9();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_26();
  a20 = v22;
  if (qword_26AC44CB0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_20A187FC0();
  v22[16] = __swift_project_value_buffer(v25, (uint64_t)qword_26AC44C58);
  swift_retain();
  uint64_t v26 = sub_20A187FA0();
  os_log_type_t v27 = sub_20A1882D0();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = v22[11];
  if (v28)
  {
    uint64_t v30 = (uint8_t *)OUTLINED_FUNCTION_5_19();
    a11 = OUTLINED_FUNCTION_3_30();
    *(_DWORD *)uint64_t v30 = 136446210;
    uint64_t v32 = *(void *)(v29 + 112);
    unint64_t v31 = *(void *)(v29 + 120);
    swift_bridgeObjectRetain();
    v22[8] = sub_20A0D4CA8(v32, v31, &a11);
    sub_20A188420();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_20A0CA000, v26, v27, "Attempting to wait for proactive flush - %{public}s", v30, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_4_0();
  }
  else
  {
    swift_release();
  }

  sub_20A186E10();
  BOOL v33 = (void *)swift_task_alloc();
  v22[17] = v33;
  void *v33 = v22;
  v33[1] = sub_20A1701B0;
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12_12();
  return sub_20A170C4C();
}

uint64_t sub_20A1701B0()
{
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_6_18();
  *uint64_t v3 = v2;
  uint64_t v5 = v4[14];
  uint64_t v6 = v4[13];
  uint64_t v7 = v4[12];
  uint64_t v8 = v4[11];
  uint64_t v9 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v10 = v9;
  *(unsigned char *)(v2 + 169) = v11;
  swift_task_dealloc();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v2 + 144) = v12;
  *(void *)(v2 + 152) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v5, v7);
  return MEMORY[0x270FA2498](sub_20A170304, v8, 0);
}

uint64_t sub_20A170304()
{
  uint64_t v29 = v0;
  int v2 = *(unsigned __int8 *)(v0 + 169);
  swift_retain();
  uint64_t v3 = sub_20A187FA0();
  os_log_type_t v4 = sub_20A1882D0();
  BOOL v5 = OUTLINED_FUNCTION_20_1(v4);
  uint64_t v6 = *(void *)(v0 + 88);
  if (v2 == 1)
  {
    if (v5)
    {
      uint64_t v7 = (uint8_t *)OUTLINED_FUNCTION_5_19();
      uint64_t v28 = OUTLINED_FUNCTION_3_30();
      *(_DWORD *)uint64_t v7 = 136446210;
      uint64_t v9 = *(void *)(v6 + 112);
      unint64_t v8 = *(void *)(v6 + 120);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 56) = sub_20A0D4CA8(v9, v8, &v28);
      sub_20A188420();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_20A0CA000, v3, v1, "Proactive flush finished - %{public}s", v7, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_4_0();
    }
    else
    {
      swift_release();
    }

    int v16 = *(unsigned __int8 *)(v0 + 168);
    swift_retain();
    uint64_t v3 = sub_20A187FA0();
    os_log_type_t v17 = sub_20A1882D0();
    BOOL v18 = OUTLINED_FUNCTION_20_1(v17);
    uint64_t v19 = *(void *)(v0 + 88);
    if (v16 == 1)
    {
      if (v18)
      {
        uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_5_19();
        uint64_t v28 = OUTLINED_FUNCTION_3_30();
        OUTLINED_FUNCTION_18_4(4.8751e-34);
        uint64_t v21 = sub_20A0D4CA8(v0 + 56, 0xCuLL, &v28);
        OUTLINED_FUNCTION_11_15(v21, (void *)(v0 + 48));
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_20A0CA000, v3, v1, "Starting reactive flush - %{public}s", v20, 0xCu);
        OUTLINED_FUNCTION_10_13();
        OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_4_0();
      }
      else
      {
        swift_release();
      }

      sub_20A170B38();
      sub_20A186E10();
      os_log_type_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 160) = v27;
      *os_log_type_t v27 = v0;
      v27[1] = sub_20A17073C;
      OUTLINED_FUNCTION_31();
      return sub_20A170C4C();
    }
    if (v18)
    {
      uint64_t v22 = (_DWORD *)OUTLINED_FUNCTION_5_19();
      uint64_t v28 = OUTLINED_FUNCTION_3_30();
      *uint64_t v22 = 136446210;
      uint64_t v23 = *(void *)(v19 + 112);
      unint64_t v24 = *(void *)(v19 + 120);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 24) = sub_20A0D4CA8(v23, v24, &v28);
      sub_20A188420();
      swift_bridgeObjectRelease();
      swift_release();
      os_log_type_t v14 = v1;
      uint64_t v15 = "Skipping reactive flush - %{public}s";
      goto LABEL_12;
    }
LABEL_13:
    swift_release();
    goto LABEL_14;
  }
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v10 = (_DWORD *)OUTLINED_FUNCTION_5_19();
  uint64_t v28 = OUTLINED_FUNCTION_3_30();
  *uint64_t v10 = 136446210;
  uint64_t v12 = *(void *)(v6 + 112);
  unint64_t v11 = *(void *)(v6 + 120);
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_20A0D4CA8(v12, v11, &v28);
  OUTLINED_FUNCTION_11_15(v13, (void *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_release();
  os_log_type_t v14 = v1;
  uint64_t v15 = "Ran out of time waiting for the preemtive flush - %{public}s";
LABEL_12:
  OUTLINED_FUNCTION_32(&dword_20A0CA000, v3, v14, v15);
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4_0();
LABEL_14:

  sub_20A170A40(*(void *)(v0 + 88), *(uint64_t (**)(uint64_t))(v0 + 72));
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_4();
  return v25();
}

uint64_t sub_20A17073C()
{
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_18();
  *int v2 = v1;
  os_log_type_t v4 = (void (*)(uint64_t, uint64_t))v3[18];
  uint64_t v5 = v3[14];
  uint64_t v6 = v3[12];
  uint64_t v7 = v3[11];
  uint64_t v8 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v9 = v8;
  *(unsigned char *)(v11 + 170) = v10;
  swift_task_dealloc();
  v4(v5, v6);
  return MEMORY[0x270FA2498](sub_20A17088C, v7, 0);
}

uint64_t sub_20A17088C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_26();
  int v15 = *(unsigned __int8 *)(v14 + 170);
  swift_retain();
  int v16 = sub_20A187FA0();
  os_log_type_t v17 = sub_20A1882D0();
  BOOL v18 = os_log_type_enabled(v16, v17);
  if (v15 == 1)
  {
    if (v18)
    {
      a10 = v14 + 40;
      uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_3_30();
      OUTLINED_FUNCTION_29();
      uint64_t v20 = OUTLINED_FUNCTION_19_2(4.8751e-34);
      *(void *)(v14 + 40) = OUTLINED_FUNCTION_23_0(v20, v21);
      sub_20A188420();
      swift_bridgeObjectRelease();
      swift_release();
      os_log_type_t v22 = v17;
      uint64_t v23 = "Reactive flush finished - %{public}s";
LABEL_6:
      _os_log_impl(&dword_20A0CA000, v16, v22, v23, v19, 0xCu);
      OUTLINED_FUNCTION_10_13();
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_4_0();
      goto LABEL_8;
    }
  }
  else if (v18)
  {
    a9 = v14 + 32;
    a10 = v14 + 40;
    uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_3_30();
    OUTLINED_FUNCTION_29();
    uint64_t v24 = OUTLINED_FUNCTION_19_2(4.8751e-34);
    uint64_t v26 = OUTLINED_FUNCTION_23_0(v24, v25);
    OUTLINED_FUNCTION_11_15(v26, (void *)(v14 + 32));
    swift_bridgeObjectRelease();
    swift_release();
    os_log_type_t v22 = v17;
    uint64_t v23 = "Ran out of time waiting for the reactive flush - %{public}s";
    goto LABEL_6;
  }
  swift_release();
LABEL_8:

  sub_20A170A40(*(void *)(v14 + 88), *(uint64_t (**)(uint64_t))(v14 + 72));
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_12_12();
  return v28(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_20A170A40(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44270);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_20A186E30();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = a1 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  swift_beginAccess();
  sub_20A172594((uint64_t)v6, v8);
  swift_endAccess();
  *(void *)(a1 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task) = 0;
  uint64_t result = swift_release();
  if (a2) {
    return a2(result);
  }
  return result;
}

uint64_t sub_20A170B38()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44270);
  uint64_t v2 = OUTLINED_FUNCTION_16(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_7();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = (uint64_t)v0 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  swift_beginAccess();
  sub_20A1724DC(v6, v5);
  uint64_t v7 = sub_20A186E30();
  LODWORD(v6) = __swift_getEnumTagSinglePayload(v5, 1, v7);
  uint64_t result = sub_20A1725FC(v5, &qword_26AC44270);
  if (v6 != 1)
  {
    uint64_t v9 = v0[19];
    uint64_t v10 = v0[20];
    __swift_project_boxed_opaque_existential_1(v0 + 16, v9);
    *(void *)((char *)v0 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task) = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_20A170C4C()
{
  OUTLINED_FUNCTION_2_4();
  v1[22] = v2;
  v1[23] = v0;
  uint64_t v3 = sub_20A188090();
  v1[24] = v3;
  OUTLINED_FUNCTION_1_3(v3);
  v1[25] = v4;
  v1[26] = OUTLINED_FUNCTION_15_3();
  uint64_t v5 = sub_20A1880D0();
  v1[27] = v5;
  OUTLINED_FUNCTION_1_3(v5);
  v1[28] = v6;
  v1[29] = OUTLINED_FUNCTION_15_3();
  uint64_t v7 = sub_20A188080();
  v1[30] = v7;
  OUTLINED_FUNCTION_1_3(v7);
  v1[31] = v8;
  v1[32] = OUTLINED_FUNCTION_24_0();
  v1[33] = swift_task_alloc();
  uint64_t v9 = sub_20A1880F0();
  v1[34] = v9;
  OUTLINED_FUNCTION_1_3(v9);
  v1[35] = v10;
  v1[36] = OUTLINED_FUNCTION_24_0();
  v1[37] = swift_task_alloc();
  uint64_t v11 = sub_20A188340();
  v1[38] = v11;
  OUTLINED_FUNCTION_1_3(v11);
  v1[39] = v12;
  v1[40] = OUTLINED_FUNCTION_15_3();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44270);
  OUTLINED_FUNCTION_16(v13);
  v1[41] = OUTLINED_FUNCTION_15_3();
  uint64_t v14 = sub_20A186E30();
  v1[42] = v14;
  OUTLINED_FUNCTION_1_3(v14);
  v1[43] = v15;
  v1[44] = OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_16_3();
  return MEMORY[0x270FA2498](v16, v17, v18);
}

uint64_t sub_20A170E04()
{
  uint64_t v72 = v0;
  if (qword_26AC44CB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_20A187FC0();
  *(void *)(v0 + 360) = __swift_project_value_buffer(v1, (uint64_t)qword_26AC44C58);
  swift_retain();
  uint64_t v2 = sub_20A187FA0();
  os_log_type_t v3 = sub_20A1882D0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void *)(v0 + 184);
  if (v4)
  {
    uint64_t v6 = (uint8_t *)OUTLINED_FUNCTION_5_19();
    uint64_t v71 = OUTLINED_FUNCTION_3_30();
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v8 = *(void *)(v5 + 112);
    unint64_t v7 = *(void *)(v5 + 120);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 168) = sub_20A0D4CA8(v8, v7, &v71);
    sub_20A188420();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_20A0CA000, v2, v3, "Attempting to finish flush - %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_4_0();
  }
  else
  {
    swift_release();
  }

  uint64_t v9 = *(void *)(v0 + 328);
  uint64_t v10 = *(void *)(v0 + 336);
  uint64_t v11 = *(void *)(v0 + 184) + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  swift_beginAccess();
  sub_20A1724DC(v11, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, v10) == 1)
  {
    sub_20A1725FC(*(void *)(v0 + 328), &qword_26AC44270);
    goto LABEL_13;
  }
  uint64_t v12 = *(void *)(v0 + 184);
  (*(void (**)(void, void, void))(*(void *)(v0 + 344) + 32))(*(void *)(v0 + 352), *(void *)(v0 + 328), *(void *)(v0 + 336));
  uint64_t v13 = *(void *)(v12 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task);
  *(void *)(v0 + 368) = v13;
  if (v13)
  {
    uint64_t v14 = *(void *)(v0 + 184);
    swift_retain();
    sub_20A186DD0();
    *(double *)(v0 + 376) = v15;
    double v16 = *(double *)(v14 + 208);
    *(double *)(v0 + 384) = v16;
    double v17 = v16 - v15;
    if (v16 - v15 <= 0.0)
    {
      swift_retain_n();
      uint64_t v34 = sub_20A187FA0();
      os_log_type_t v35 = sub_20A1882D0();
      BOOL v36 = os_log_type_enabled(v34, v35);
      uint64_t v38 = *(void *)(v0 + 344);
      uint64_t v37 = *(void *)(v0 + 352);
      uint64_t v39 = *(void *)(v0 + 336);
      uint64_t v40 = *(void *)(v0 + 184);
      if (v36)
      {
        uint64_t v69 = *(void *)(v0 + 352);
        uint64_t v41 = (uint8_t *)OUTLINED_FUNCTION_5_19();
        uint64_t v71 = OUTLINED_FUNCTION_3_30();
        *(_DWORD *)uint64_t v41 = 136446210;
        uint64_t v43 = *(void *)(v40 + 112);
        unint64_t v42 = *(void *)(v40 + 120);
        swift_bridgeObjectRetain();
        *(void *)(v0 + 88) = sub_20A0D4CA8(v43, v42, &v71);
        sub_20A188420();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_20A0CA000, v34, v35, "No time left to wait on the flush - %{public}s", v41, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_4_0();

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v69, v39);
      }
      else
      {

        swift_release();
        swift_release_n();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
      }
      uint64_t v33 = 0;
      goto LABEL_26;
    }
    uint64_t v68 = v13;
    uint64_t v19 = *(void *)(v0 + 312);
    uint64_t v18 = *(void *)(v0 + 320);
    uint64_t v20 = *(void *)(v0 + 304);
    uint64_t v21 = *(void *)(v0 + 184);
    uint64_t v67 = *(void *)(v21 + 112);
    *(void *)(v0 + 392) = v67;
    unint64_t v22 = *(void *)(v21 + 120);
    *(void *)(v0 + 400) = v22;
    sub_20A0D15A4(0, &qword_26AC43A48);
    *(void *)(v0 + 96) = MEMORY[0x263F8EE78];
    sub_20A172688(&qword_26AC43A40, MEMORY[0x263F8F148]);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43A18);
    sub_20A0D4540(&qword_26AC43A20, &qword_26AC43A18);
    sub_20A188460();
    *(void *)(v0 + 408) = sub_20A188350();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    swift_retain();
    uint64_t v23 = sub_20A187FA0();
    os_log_type_t v24 = sub_20A1882D0();
    unint64_t v66 = v22;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v71 = OUTLINED_FUNCTION_3_30();
      *(_DWORD *)uint64_t v25 = 134218242;
      *(double *)(v0 + 152) = v17;
      sub_20A188420();
      *(_WORD *)(v25 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 160) = sub_20A0D4CA8(v67, v22, &v71);
      sub_20A188420();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_20A0CA000, v23, v24, "Starting a timer for %fs - %{public}s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_4_0();
    }
    else
    {
      swift_release();
    }

    uint64_t ObjectType = swift_getObjectType();
    *(void *)(v0 + 416) = ObjectType;
    sub_20A1880E0();
    double v45 = v17 * 1000.0;
    if ((~COERCE__INT64(v17 * 1000.0) & 0x7FF0000000000000) != 0)
    {
      if (v45 > -9.22337204e18)
      {
        uint64_t v70 = ObjectType;
        if (v45 < 9.22337204e18)
        {
          uint64_t v46 = *(void *)(v0 + 288);
          uint64_t v47 = *(void *)(v0 + 296);
          uint64_t v49 = *(void *)(v0 + 272);
          uint64_t v48 = *(void *)(v0 + 280);
          uint64_t v50 = *(void **)(v0 + 264);
          v65 = *(void **)(v0 + 256);
          uint64_t v51 = *(void *)(v0 + 240);
          uint64_t v52 = *(void *)(v0 + 248);
          *uint64_t v50 = (uint64_t)v45;
          (*(void (**)(void *, void, uint64_t))(v52 + 104))(v50, *MEMORY[0x263F8F000], v51);
          MEMORY[0x210513E50](v46, v50);
          uint64_t v53 = *(void (**)(void))(v52 + 8);
          OUTLINED_FUNCTION_21_1();
          v53();
          v64 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
          v64(v46, v49);
          sub_20A171EF0((uint64_t)v50);
          sub_20A171F64(v65);
          MEMORY[0x210514110](v47, v50, v65, v70);
          OUTLINED_FUNCTION_21_1();
          v53();
          OUTLINED_FUNCTION_21_1();
          v53();
          v64(v47, v49);
          uint64_t v54 = swift_allocObject();
          *(double *)(v54 + 16) = v17;
          *(void *)(v54 + 24) = v67;
          *(void *)(v54 + 32) = v66;
          *(void *)(v54 + 40) = v68;
          *(void *)(v0 + 48) = sub_20A172584;
          *(void *)(v0 + 56) = v54;
          *(void *)(v0 + 16) = MEMORY[0x263EF8330];
          *(void *)(v0 + 24) = 1107296256;
          *(void *)(v0 + 32) = sub_20A0CEA74;
          *(void *)(v0 + 40) = &block_descriptor_3;
          uint64_t v55 = _Block_copy((const void *)(v0 + 16));
          swift_retain();
          swift_bridgeObjectRetain();
          sub_20A1880A0();
          sub_20A1721DC();
          sub_20A188360();
          _Block_release(v55);
          OUTLINED_FUNCTION_7_0();
          v56();
          OUTLINED_FUNCTION_7_0();
          v57();
          swift_release();
          sub_20A188380();
          swift_bridgeObjectRetain_n();
          v58 = sub_20A187FA0();
          os_log_type_t v59 = sub_20A1882D0();
          if (os_log_type_enabled(v58, v59))
          {
            uint64_t v60 = swift_slowAlloc();
            uint64_t v71 = OUTLINED_FUNCTION_3_30();
            *(_DWORD *)uint64_t v60 = 134218242;
            *(double *)(v0 + 136) = v17;
            sub_20A188420();
            *(_WORD *)(v60 + 12) = 2082;
            swift_bridgeObjectRetain();
            *(void *)(v0 + 144) = sub_20A0D4CA8(v67, v66, &v71);
            sub_20A188420();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_20A0CA000, v58, v59, "Waiting for the flush to finish for %fs - %{public}s", (uint8_t *)v60, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_4_0();
            OUTLINED_FUNCTION_4_0();
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          v63 = (void *)swift_task_alloc();
          *(void *)(v0 + 424) = v63;
          void *v63 = v0;
          v63[1] = sub_20A171A08;
          return MEMORY[0x270FA1FD0]();
        }
LABEL_35:
        __break(1u);
        return MEMORY[0x270FA1FD0]();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_35;
  }
  (*(void (**)(void, void))(*(void *)(v0 + 344) + 8))(*(void *)(v0 + 352), *(void *)(v0 + 336));
LABEL_13:
  swift_retain();
  uint64_t v26 = sub_20A187FA0();
  os_log_type_t v27 = sub_20A1882D0();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = *(void *)(v0 + 184);
  if (v28)
  {
    uint64_t v30 = (_DWORD *)OUTLINED_FUNCTION_5_19();
    uint64_t v71 = OUTLINED_FUNCTION_3_30();
    *uint64_t v30 = 136446210;
    uint64_t v32 = *(void *)(v29 + 112);
    unint64_t v31 = *(void *)(v29 + 120);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 104) = sub_20A0D4CA8(v32, v31, &v71);
    sub_20A188420();
    swift_bridgeObjectRelease();
    swift_release();
    OUTLINED_FUNCTION_32(&dword_20A0CA000, v26, v27, "Not flushing - no need to wait - %{public}s");
    uint64_t v33 = 1;
    swift_arrayDestroy();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_4_0();
  }
  else
  {
    swift_release();

    uint64_t v33 = 1;
  }
LABEL_26:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v61 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v61(v33);
}

uint64_t sub_20A171A08()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16_3();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_20A171AE4()
{
  uint64_t v28 = v0;
  char isCancelled = swift_task_isCancelled();
  if (isCancelled)
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_20A187FA0();
    os_log_type_t v2 = sub_20A1882D0();
    BOOL v3 = os_log_type_enabled(v1, v2);
    unint64_t v4 = *(void *)(v0 + 400);
    if (v3)
    {
      uint64_t v23 = *(void *)(v0 + 392);
      uint64_t v5 = *(void *)(v0 + 344);
      uint64_t v24 = *(void *)(v0 + 336);
      uint64_t v25 = *(void *)(v0 + 352);
      double v6 = *(double *)(v0 + 384) - *(double *)(v0 + 376);
      uint64_t v7 = swift_slowAlloc();
      uint64_t v27 = OUTLINED_FUNCTION_3_30();
      *(_DWORD *)uint64_t v7 = 134218242;
      *(double *)(v0 + 120) = v6;
      sub_20A188420();
      *(_WORD *)(v7 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 128) = sub_20A0D4CA8(v23, v4, &v27);
      sub_20A188420();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20A0CA000, v1, v2, "Timed out while waiting on the flush to finish after waiting %fs - %{public}s", (uint8_t *)v7, 0x16u);
      OUTLINED_FUNCTION_10_13();
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_4_0();

      swift_unknownObjectRelease();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v25, v24);
    }
    else
    {
      uint64_t v15 = *(void *)(v0 + 344);
      uint64_t v16 = *(void *)(v0 + 352);
      uint64_t v17 = *(void *)(v0 + 336);

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v17);
    }
  }
  else
  {
    sub_20A188370();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_20A187FA0();
    os_log_type_t v9 = sub_20A1882D0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    unint64_t v11 = *(void *)(v0 + 400);
    if (v10)
    {
      uint64_t v12 = *(void *)(v0 + 392);
      uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_5_19();
      uint64_t v27 = OUTLINED_FUNCTION_3_30();
      *(_DWORD *)uint64_t v13 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 112) = sub_20A0D4CA8(v12, v11, &v27);
      sub_20A188420();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20A0CA000, v8, v9, "Flush finished without timing out - %{public}s", v13, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_4_0();

      swift_unknownObjectRelease();
      swift_release();
      OUTLINED_FUNCTION_7_0();
      v14();
    }
    else
    {
      uint64_t v19 = *(void *)(v0 + 344);
      uint64_t v18 = *(void *)(v0 + 352);
      uint64_t v20 = *(void *)(v0 + 336);

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v21((isCancelled & 1) == 0);
}

uint64_t sub_20A171EF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F010];
  uint64_t v3 = sub_20A188080();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_20A171F64@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = *MEMORY[0x263F8EFE0];
  uint64_t v3 = sub_20A188080();
  unint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_20A171FDC(uint64_t a1, unint64_t a2)
{
  if (qword_26AC44CB0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_20A187FC0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AC44C58);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_20A187FA0();
  os_log_type_t v6 = sub_20A1882C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 134218242;
    sub_20A188420();
    *(_WORD *)(v7 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_20A0D4CA8(a1, a2, &v10);
    sub_20A188420();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20A0CA000, v5, v6, "Timer is cancelling the task after waiting %fs - %{public}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x210514A80](v8, -1, -1);
    MEMORY[0x210514A80](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return sub_20A188280();
}

uint64_t sub_20A1721DC()
{
  return sub_20A188460();
}

uint64_t sub_20A1722A4()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  __swift_destroy_boxed_opaque_existential_1(v0 + 168);

  sub_20A1725FC(v0 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime, &qword_26AC44270);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_20A17230C()
{
  sub_20A1722A4();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_20A172338()
{
  return type metadata accessor for WidgetTimelineTelemetryManager.Actor();
}

void sub_20A172340()
{
  sub_20A172414();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_20A172414()
{
  if (!qword_26AC42B90)
  {
    sub_20A186E30();
    unint64_t v0 = sub_20A188410();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AC42B90);
    }
  }
}

uint64_t sub_20A17246C()
{
  return v0;
}

uint64_t sub_20A172478()
{
  return sub_20A17246C();
}

uint64_t sub_20A172494()
{
  return sub_20A172688(&qword_26AC43968, (void (*)(uint64_t))type metadata accessor for WidgetTimelineTelemetryManager.SerialActor);
}

uint64_t sub_20A1724DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A172544()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_20A172584()
{
  return sub_20A171FDC(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_20A172594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A1725FC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_7_0();
  v3();
  return a1;
}

uint64_t sub_20A172650()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20A172688(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_14_4()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_18_4(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_2(float a1)
{
  float *v1 = a1;
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_20_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  return sub_20A0D4CA8(v3, v2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return *(void *)(v0 + 112);
}

void OUTLINED_FUNCTION_32(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

WeatherAnalytics::WidgetRefreshEventData __swiftcall WidgetRefreshEventData.init(widget:)(WeatherAnalytics::WidgetRefreshEventData widget)
{
  uint64_t v2 = *(void *)(widget.widget.name._countAndFlagsBits + 8);
  char v3 = *(unsigned char *)(widget.widget.name._countAndFlagsBits + 16);
  *(void *)uint64_t v1 = *(void *)widget.widget.name._countAndFlagsBits;
  *(void *)(v1 + 8) = v2;
  *(unsigned char *)(v1 + 16) = v3;
  return widget;
}

uint64_t static WidgetRefreshEventData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t WidgetRefreshEventData.widget.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t WidgetRefreshEventData.widget.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = v4;
  return result;
}

uint64_t (*WidgetRefreshEventData.widget.modify())()
{
  return nullsub_1;
}

uint64_t sub_20A172888(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x746567646977 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_20A172908()
{
  return 0x746567646977;
}

uint64_t sub_20A172920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A172888(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_20A17294C(uint64_t a1)
{
  unint64_t v2 = sub_20A172AF8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A172988(uint64_t a1)
{
  unint64_t v2 = sub_20A172AF8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WidgetRefreshEventData.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EA18);
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v9 = v1[1];
  HIDWORD(v12) = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A172AF8();
  sub_20A1887B0();
  uint64_t v13 = v10;
  uint64_t v14 = v9;
  char v15 = BYTE4(v12);
  sub_20A11B864();
  sub_20A188660();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_20A172AF8()
{
  unint64_t result = qword_26760EA20;
  if (!qword_26760EA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EA20);
  }
  return result;
}

uint64_t WidgetRefreshEventData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EA28);
  OUTLINED_FUNCTION_2_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A172AF8();
  sub_20A188790();
  if (!v2)
  {
    sub_20A11BAB0();
    sub_20A1885A0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    uint64_t v11 = v14[2];
    char v12 = v15;
    *(void *)a2 = v14[1];
    *(void *)(a2 + 8) = v11;
    *(unsigned char *)(a2 + 16) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_20A172C98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WidgetRefreshEventData.init(from:)(a1, a2);
}

uint64_t sub_20A172CB0(void *a1)
{
  return WidgetRefreshEventData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for WidgetRefreshEventData()
{
  return &type metadata for WidgetRefreshEventData;
}

unsigned char *storeEnumTagSinglePayload for WidgetRefreshEventData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x20A172D74);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetRefreshEventData.CodingKeys()
{
  return &type metadata for WidgetRefreshEventData.CodingKeys;
}

unint64_t sub_20A172DB0()
{
  unint64_t result = qword_26760EA30;
  if (!qword_26760EA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EA30);
  }
  return result;
}

unint64_t sub_20A172E00()
{
  unint64_t result = qword_26760EA38;
  if (!qword_26760EA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EA38);
  }
  return result;
}

unint64_t sub_20A172E50()
{
  unint64_t result = qword_26760EA40;
  if (!qword_26760EA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EA40);
  }
  return result;
}

uint64_t dispatch thunk of WidgetAnalyticsCoordinatorType.enter()()
{
  OUTLINED_FUNCTION_28();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_20A1739F8;
  uint64_t v2 = OUTLINED_FUNCTION_6_19();
  return v3(v2);
}

uint64_t dispatch thunk of WidgetAnalyticsCoordinatorType.leave()()
{
  OUTLINED_FUNCTION_28();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_20A1739F8;
  uint64_t v2 = OUTLINED_FUNCTION_6_19();
  return v3(v2);
}

void *sub_20A17305C(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  type metadata accessor for WidgetAnalyticsCoordinator.Actor();
  uint64_t v6 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v6 + 112) = 0;
  v3[3] = a2;
  v3[4] = v6;
  long long v3[2] = a1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7)
  {
    uint64_t v8 = a2 + 32;
    swift_retain();
    swift_bridgeObjectRetain();
    do
    {
      sub_20A0D42A0(v8, (uint64_t)v12);
      uint64_t v9 = v13;
      uint64_t v10 = v14;
      __swift_project_boxed_opaque_existential_1(v12, v13);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      v8 += 40;
      --v7;
    }
    while (v7);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_20A173158()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_1_28((uint64_t)sub_20A173174, 0);
}

uint64_t sub_20A173174()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 32);
  *(void *)(v0 + 24) = v1;
  return OUTLINED_FUNCTION_1_28((uint64_t)sub_20A173194, v1);
}

uint64_t sub_20A173194()
{
  OUTLINED_FUNCTION_2_4();
  BOOL v1 = sub_20A1735E4();
  uint64_t v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v3 = v1;
  return v2(v3);
}

uint64_t sub_20A1731F4()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_1_28((uint64_t)sub_20A173210, 0);
}

uint64_t sub_20A173210()
{
  OUTLINED_FUNCTION_2_4();
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_20A1732A4;
  return sub_20A173604(v1);
}

uint64_t sub_20A1732A4()
{
  OUTLINED_FUNCTION_2_4();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_20A173370()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_20A1733A0()
{
  sub_20A173370();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for WidgetAnalyticsCoordinator()
{
  return self;
}

uint64_t sub_20A1733F8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_20A173488;
  return sub_20A173158();
}

uint64_t sub_20A173488()
{
  OUTLINED_FUNCTION_2_4();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_20A173554()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_20A1739F8;
  return sub_20A1731F4();
}

BOOL sub_20A1735E4()
{
  uint64_t v1 = *(void *)(v0 + 112);
  if (__OFADD__(v1, 1))
  {
    __break(1u);
  }
  else
  {
    BOOL result = v1 == 0;
    *(void *)(v0 + 112) = v1 + 1;
  }
  return result;
}

uint64_t sub_20A173604(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_20A173624, v1, 0);
}

uint64_t sub_20A173624()
{
  OUTLINED_FUNCTION_28();
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v1 + 112);
  BOOL v3 = v2 == 1;
  BOOL v4 = v2 < 1;
  uint64_t v5 = v2 - 1;
  if (v4 || (*(void *)(v1 + 112) = v5, !v3))
  {
    uint64_t v6 = 0;
LABEL_4:
    uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
    return v7(v6);
  }
  uint64_t v9 = (void *)v0[2];
  uint64_t v10 = v9[2];
  v0[4] = v10;
  if (!v10)
  {
    uint64_t v6 = 1;
    goto LABEL_4;
  }
  v0[5] = 0;
  uint64_t v11 = v9 + 4;
  uint64_t v12 = v9[7];
  swift_bridgeObjectRetain();
  __swift_project_boxed_opaque_existential_1(v11, v12);
  OUTLINED_FUNCTION_4_21();
  uint64_t v13 = (void *)swift_task_alloc();
  v0[6] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_20A17377C;
  uint64_t v14 = OUTLINED_FUNCTION_5_20();
  return v15(v14);
}

uint64_t sub_20A17377C()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_2();
  *BOOL v4 = v3;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20A17385C, v2, 0);
}

uint64_t sub_20A17385C()
{
  OUTLINED_FUNCTION_28();
  uint64_t v1 = v0[5] + 1;
  if (v1 == v0[4])
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
    return v2(1);
  }
  else
  {
    v0[5] = v1;
    __swift_project_boxed_opaque_existential_1((void *)(v0[2] + 40 * v1 + 32), *(void *)(v0[2] + 40 * v1 + 56));
    OUTLINED_FUNCTION_4_21();
    BOOL v4 = (void *)swift_task_alloc();
    v0[6] = v4;
    *BOOL v4 = v0;
    v4[1] = sub_20A17377C;
    uint64_t v5 = OUTLINED_FUNCTION_5_20();
    return v6(v5);
  }
}

uint64_t sub_20A1739A0()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for WidgetAnalyticsCoordinator.Actor()
{
  return self;
}

uint64_t sub_20A1739FC()
{
  uint64_t v0 = sub_20A187530();
  __swift_allocate_value_buffer(v0, qword_26760EA80);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26760EA80);
  *(void *)uint64_t v1 = 0xD000000000000020;
  *(void *)(v1 + 8) = 0x800000020A19D9C0;
  *(void *)(v1 + 16) = 4;
  *(unsigned char *)(v1 + 24) = 0;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v2();
}

uint64_t static ReportWeatherEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDB8, MEMORY[0x263F24D18], (uint64_t)qword_26760EA80, a1);
}

uint64_t static ReportWeatherEvent.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t sub_20A173AEC()
{
  uint64_t v0 = sub_20A187780();
  __swift_allocate_value_buffer(v0, qword_26760EA98);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26760EA98);
  uint64_t v2 = *MEMORY[0x263F24DD0];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t static ReportWeatherEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDC0, MEMORY[0x263F24DD8], (uint64_t)qword_26760EA98, a1);
}

uint64_t sub_20A173BAC()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760EAB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760EAB0);
  return sub_20A187810();
}

uint64_t static ReportWeatherEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDC8, MEMORY[0x263F24DE8], (uint64_t)qword_26760EAB0, a1);
}

uint64_t ReportWeatherEvent.eventData.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.eventData.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.eventData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.locationData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for ReportWeatherEvent(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760EB30);
}

uint64_t ReportWeatherEvent.locationData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.locationData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.feedbackUserData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.feedbackUserData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.feedbackUserData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.conditionsFeedbackData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.conditionsFeedbackData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.conditionsFeedbackData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.temperatureFeedbackData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.temperatureFeedbackData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.temperatureFeedbackData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.locationConditionData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.locationConditionData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.locationConditionData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.forecastAgeData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.forecastAgeData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.forecastAgeData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.windFeedbackData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.windFeedbackData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.windFeedbackData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.aqiFeedbackData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.aqiFeedbackData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.aqiFeedbackData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.otherConditionsFeedbackData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.otherConditionsFeedbackData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.otherConditionsFeedbackData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.descriptionFeedbackData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.descriptionFeedbackData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.descriptionFeedbackData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.weatherJSONData.getter()
{
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ReportWeatherEvent.weatherJSONData.setter()
{
  type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ReportWeatherEvent.weatherJSONData.modify())()
{
  return nullsub_1;
}

uint64_t ReportWeatherEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10_0();
  v3();
  uint64_t v4 = type metadata accessor for ReportWeatherEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10_0();
  v5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10_0();
  v6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10_0();
  v7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10_0();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = OUTLINED_FUNCTION_9_18();
  v10(v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = OUTLINED_FUNCTION_9_18();
  v12(v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10_0();
  v13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v14 = OUTLINED_FUNCTION_9_18();
  v15(v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v16 = OUTLINED_FUNCTION_9_18();
  v17(v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v18 = OUTLINED_FUNCTION_9_18();
  v19(v18);
  uint64_t v20 = a1 + *(int *)(v4 + 60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  OUTLINED_FUNCTION_1_0();
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 104);
  return v23(v20, v2, v21);
}

uint64_t ReportWeatherEvent.Model.eventData.getter()
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

__n128 ReportWeatherEvent.Model.locationData.getter()
{
  __n128 result = *(__n128 *)(v1 + *(int *)(OUTLINED_FUNCTION_11_16() + 20));
  __n128 *v0 = result;
  return result;
}

uint64_t type metadata accessor for ReportWeatherEvent.Model(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760EB80);
}

uint64_t ReportWeatherEvent.Model.feedbackUserData.getter()
{
  uint64_t v2 = (void *)(v1 + *(int *)(OUTLINED_FUNCTION_11_16() + 24));
  uint64_t v3 = v2[1];
  void *v0 = *v2;
  v0[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t ReportWeatherEvent.Model.conditionsFeedbackData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_16();
  uint64_t v3 = v1 + *(int *)(result + 28);
  *(unsigned char *)uint64_t v0 = *(unsigned char *)v3;
  *(_DWORD *)(v0 + 1) = *(_DWORD *)(v3 + 1);
  return result;
}

uint64_t ReportWeatherEvent.Model.temperatureFeedbackData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_16();
  uint64_t v3 = (char *)(v1 + *(int *)(result + 32));
  char v4 = *v3;
  LODWORD(v3) = *((_DWORD *)v3 + 1);
  *(unsigned char *)uint64_t v0 = v4;
  *(_DWORD *)(v0 + 4) = v3;
  return result;
}

__n128 ReportWeatherEvent.Model.locationConditionData.getter()
{
  __n128 result = *(__n128 *)(v1 + *(int *)(OUTLINED_FUNCTION_11_16() + 36));
  __n128 *v0 = result;
  return result;
}

uint64_t ReportWeatherEvent.Model.forecastAgeData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_16();
  uint64_t v3 = (int *)(v1 + *(int *)(result + 40));
  int v4 = *v3;
  LOBYTE(v3) = *((unsigned char *)v3 + 4);
  *(_DWORD *)uint64_t v0 = v4;
  *(unsigned char *)(v0 + 4) = (_BYTE)v3;
  return result;
}

double ReportWeatherEvent.Model.windFeedbackData.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_11_16() + 44);
  char v3 = *(unsigned char *)(v2 + 12);
  *(unsigned char *)uint64_t v0 = *(unsigned char *)v2;
  double result = *(double *)(v2 + 4);
  *(double *)(v0 + 4) = result;
  *(unsigned char *)(v0 + 12) = v3;
  return result;
}

uint64_t ReportWeatherEvent.Model.aqiFeedbackData.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_11_16() + 48);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v3 = *(void *)(v2 + 24);
  char v5 = *(unsigned char *)(v2 + 32);
  *(_OWORD *)uint64_t v0 = *(_OWORD *)v2;
  *(void *)(v0 + 16) = v4;
  *(void *)(v0 + 24) = v3;
  *(unsigned char *)(v0 + 32) = v5;
  return swift_bridgeObjectRetain();
}

uint64_t ReportWeatherEvent.Model.otherConditionsFeedbackData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_16();
  uint64_t v3 = (int *)(v1 + *(int *)(result + 52));
  int v4 = *v3;
  *(_WORD *)(v0 + 4) = *((_WORD *)v3 + 2);
  *(_DWORD *)uint64_t v0 = v4;
  return result;
}

uint64_t ReportWeatherEvent.Model.descriptionFeedbackData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_16();
  void *v0 = *(void *)(v1 + *(int *)(result + 56));
  return result;
}

uint64_t ReportWeatherEvent.Model.weatherJSONData.getter()
{
  uint64_t v2 = (void *)(v1 + *(int *)(OUTLINED_FUNCTION_11_16() + 60));
  uint64_t v3 = v2[1];
  void *v0 = *v2;
  v0[1] = v3;
  return swift_bridgeObjectRetain();
}

__n128 ReportWeatherEvent.Model.init(eventData:locationData:feedbackUserData:conditionsFeedbackData:temperatureFeedbackData:locationConditionData:forecastAgeData:windFeedbackData:aqiFeedbackData:otherConditionsFeedbackData:descriptionFeedbackData:weatherJSONData:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, char *a4@<X3>, char *a5@<X4>, uint64_t *a6@<X5>, int *a7@<X6>, unsigned char *a8@<X7>, uint64_t a9@<X8>, __n128 *a10, int *a11, uint64_t *a12, uint64_t *a13)
{
  uint64_t v13 = a8;
  uint64_t v17 = *a2;
  uint64_t v18 = a2[1];
  uint64_t v19 = *a3;
  uint64_t v20 = a3[1];
  char v21 = *a4;
  char v22 = *a5;
  int v23 = *((_DWORD *)a5 + 1);
  uint64_t v24 = a6[1];
  uint64_t v39 = *a6;
  char v40 = *((unsigned char *)a7 + 4);
  int v41 = *a7;
  char v42 = *a8;
  char v43 = a8[12];
  __n128 v47 = *a10;
  unint64_t v45 = a10[1].n128_u64[1];
  unint64_t v46 = a10[1].n128_u64[0];
  unsigned __int8 v44 = a10[2].n128_u8[0];
  __int16 v48 = *((_WORD *)a11 + 2);
  uint64_t v49 = *a12;
  uint64_t v51 = *a13;
  int v52 = *a11;
  uint64_t v50 = a13[1];
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v26 = *(void *)(v13 + 4);
  LODWORD(v13) = *(_DWORD *)(a4 + 1);
  (*(void (**)(uint64_t, uint64_t))(v25 + 32))(a9, a1);
  uint64_t v27 = (int *)type metadata accessor for ReportWeatherEvent.Model(0);
  uint64_t v28 = (void *)(a9 + v27[5]);
  *uint64_t v28 = v17;
  v28[1] = v18;
  uint64_t v29 = (void *)(a9 + v27[6]);
  *uint64_t v29 = v19;
  v29[1] = v20;
  uint64_t v30 = a9 + v27[7];
  *(unsigned char *)uint64_t v30 = v21;
  *(_DWORD *)(v30 + 1) = v13;
  uint64_t v31 = a9 + v27[8];
  *(unsigned char *)uint64_t v31 = v22;
  *(_DWORD *)(v31 + 4) = v23;
  uint64_t v32 = (void *)(a9 + v27[9]);
  *uint64_t v32 = v39;
  v32[1] = v24;
  uint64_t v33 = a9 + v27[10];
  *(_DWORD *)uint64_t v33 = v41;
  *(unsigned char *)(v33 + 4) = v40;
  uint64_t v34 = a9 + v27[11];
  *(unsigned char *)uint64_t v34 = v42;
  *(void *)(v34 + 4) = v26;
  *(unsigned char *)(v34 + 12) = v43;
  os_log_type_t v35 = (__n128 *)(a9 + v27[12]);
  __n128 result = v47;
  *os_log_type_t v35 = v47;
  v35[1].n128_u64[0] = v46;
  v35[1].n128_u64[1] = v45;
  v35[2].n128_u8[0] = v44;
  uint64_t v37 = a9 + v27[13];
  *(_WORD *)(v37 + 4) = v48;
  *(_DWORD *)uint64_t v37 = v52;
  *(void *)(a9 + v27[14]) = v49;
  uint64_t v38 = (void *)(a9 + v27[15]);
  *uint64_t v38 = v51;
  v38[1] = v50;
  return result;
}

uint64_t sub_20A175114(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746144746E657665 && a2 == 0xE900000000000061;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E6F697461636F6CLL && a2 == 0xEC00000061746144;
    if (v6 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x800000020A19D900 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x800000020A19D920 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x800000020A19D940 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else if (a1 == 0xD000000000000015 && a2 == 0x800000020A19BD90 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else
    {
      BOOL v7 = a1 == 0x7473616365726F66 && a2 == 0xEF61746144656741;
      if (v7 || (sub_20A1886B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000020A19D960 || (sub_20A1886B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 7;
      }
      else
      {
        BOOL v8 = a1 == 0x6264656546697161 && a2 == 0xEF617461446B6361;
        if (v8 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 8;
        }
        else if (a1 == 0xD00000000000001BLL && a2 == 0x800000020A19D980 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 9;
        }
        else if (a1 == 0xD000000000000017 && a2 == 0x800000020A19D9A0 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 10;
        }
        else if (a1 == 0x4A72656874616577 && a2 == 0xEF617461444E4F53)
        {
          swift_bridgeObjectRelease();
          return 11;
        }
        else
        {
          char v10 = sub_20A1886B0();
          swift_bridgeObjectRelease();
          if (v10) {
            return 11;
          }
          else {
            return 12;
          }
        }
      }
    }
  }
}

uint64_t sub_20A1755C8()
{
  return 12;
}

unint64_t sub_20A1755D0(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 2:
    case 7:
      return result;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    case 6:
      unint64_t result = 0x7473616365726F66;
      break;
    case 8:
      unint64_t result = 0x6264656546697161;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000017;
      break;
    case 11:
      unint64_t result = 0x4A72656874616577;
      break;
    default:
      unint64_t result = 0x746144746E657665;
      break;
  }
  return result;
}

unint64_t sub_20A17574C()
{
  return sub_20A1755D0(*v0);
}

uint64_t sub_20A175754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A175114(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A17577C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A1755C8();
  *a1 = result;
  return result;
}

uint64_t sub_20A1757A4(uint64_t a1)
{
  unint64_t v2 = sub_20A175BCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A1757E0(uint64_t a1)
{
  unint64_t v2 = sub_20A175BCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ReportWeatherEvent.Model.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB08);
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A175BCC();
  sub_20A1887B0();
  sub_20A1879F0();
  sub_20A0CFC74(&qword_26AC41AC8);
  sub_20A188660();
  if (!v1)
  {
    type metadata accessor for ReportWeatherEvent.Model(0);
    sub_20A0DC6A8();
    OUTLINED_FUNCTION_3_3();
    sub_20A0DC128();
    OUTLINED_FUNCTION_3_3();
    sub_20A0E30A8();
    OUTLINED_FUNCTION_3_3();
    sub_20A13EB90();
    OUTLINED_FUNCTION_3_3();
    sub_20A0F3F00();
    OUTLINED_FUNCTION_7_13();
    sub_20A175C18();
    OUTLINED_FUNCTION_7_13();
    sub_20A142334();
    OUTLINED_FUNCTION_3_3();
    sub_20A13F580();
    OUTLINED_FUNCTION_7_13();
    sub_20A0FB9B0();
    OUTLINED_FUNCTION_7_13();
    sub_20A137ACC();
    OUTLINED_FUNCTION_7_13();
    sub_20A0DD26C();
    OUTLINED_FUNCTION_3_3();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_20A175BCC()
{
  unint64_t result = qword_26760EB10;
  if (!qword_26760EB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EB10);
  }
  return result;
}

unint64_t sub_20A175C18()
{
  unint64_t result = qword_26760EB18;
  if (!qword_26760EB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EB18);
  }
  return result;
}

uint64_t ReportWeatherEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_20A1879F0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v24 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7();
  uint64_t v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB20);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_7();
  uint64_t v25 = (int *)type metadata accessor for ReportWeatherEvent.Model(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_7();
  uint64_t v26 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A175BCC();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v27) = 0;
  sub_20A0CFC74(&qword_26AC41950);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v26, v10, v5);
  sub_20A0F0058();
  OUTLINED_FUNCTION_4_22();
  *(_OWORD *)(v26 + v25[5]) = v27;
  sub_20A0DC0DC();
  OUTLINED_FUNCTION_4_22();
  *(_OWORD *)(v26 + v25[6]) = v27;
  sub_20A0E3058();
  OUTLINED_FUNCTION_4_22();
  uint64_t v15 = v26 + v25[7];
  *(unsigned char *)uint64_t v15 = 0;
  *(_DWORD *)(v15 + 1) = *(_DWORD *)((char *)&v27 + 1);
  sub_20A13EB40();
  OUTLINED_FUNCTION_4_22();
  uint64_t v16 = v26 + v25[8];
  *(unsigned char *)uint64_t v16 = 0;
  *(_DWORD *)(v16 + 4) = DWORD1(v27);
  sub_20A0F4540();
  OUTLINED_FUNCTION_8_19();
  *(_OWORD *)(v26 + v25[9]) = v27;
  sub_20A17620C();
  OUTLINED_FUNCTION_8_19();
  uint64_t v17 = v26 + v25[10];
  *(_DWORD *)uint64_t v17 = v27;
  *(unsigned char *)(v17 + 4) = BYTE4(v27);
  sub_20A1422E4();
  OUTLINED_FUNCTION_4_22();
  uint64_t v18 = v26 + v25[11];
  *(unsigned char *)uint64_t v18 = 0;
  *(void *)(v18 + 4) = *(void *)((char *)&v27 + 4);
  *(unsigned char *)(v18 + 12) = BYTE12(v27);
  sub_20A13F530();
  OUTLINED_FUNCTION_8_19();
  uint64_t v19 = v26 + v25[12];
  *(_OWORD *)uint64_t v19 = v27;
  *(_OWORD *)(v19 + 16) = v28;
  *(unsigned char *)(v19 + 32) = v29;
  sub_20A0FB960();
  OUTLINED_FUNCTION_8_19();
  uint64_t v20 = v26 + v25[13];
  *(_WORD *)(v20 + 4) = WORD2(v27);
  *(_DWORD *)uint64_t v20 = v27;
  sub_20A137A7C();
  OUTLINED_FUNCTION_14_5();
  sub_20A188530();
  *(void *)(v26 + v25[14]) = v27;
  sub_20A0DD21C();
  OUTLINED_FUNCTION_14_5();
  sub_20A1885A0();
  uint64_t v21 = OUTLINED_FUNCTION_16_4();
  v22(v21);
  *(_OWORD *)(v26 + v25[15]) = v27;
  sub_20A176258(v26, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_20A1762BC(v26);
}

unint64_t sub_20A17620C()
{
  unint64_t result = qword_26760EB28;
  if (!qword_26760EB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EB28);
  }
  return result;
}

uint64_t sub_20A176258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReportWeatherEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A1762BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReportWeatherEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A176318@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ReportWeatherEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A176330(void *a1)
{
  return ReportWeatherEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherEvent(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v52 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v52 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    uint64_t v20 = a3[8];
    uint64_t v21 = (char *)a1 + v20;
    char v22 = (char *)a2 + v20;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = a3[9];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    uint64_t v28 = a3[10];
    char v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
    uint64_t v32 = a3[11];
    uint64_t v33 = (char *)a1 + v32;
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    uint64_t v36 = a3[12];
    uint64_t v37 = (char *)a1 + v36;
    uint64_t v38 = (char *)a2 + v36;
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
    uint64_t v40 = a3[13];
    int v41 = (char *)a1 + v40;
    char v42 = (char *)a2 + v40;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = a3[14];
    unint64_t v45 = (char *)a1 + v44;
    unint64_t v46 = (char *)a2 + v44;
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
    uint64_t v48 = a3[15];
    uint64_t v49 = (char *)a1 + v48;
    uint64_t v50 = (char *)a2 + v48;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
  }
  return a1;
}

uint64_t destroy for ReportWeatherEvent(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + a2[9];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = a1 + a2[10];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  uint64_t v17 = a1 + a2[11];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  uint64_t v19 = a1 + a2[12];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  uint64_t v21 = a1 + a2[13];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  uint64_t v23 = a1 + a2[14];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
  uint64_t v25 = a1 + a2[15];
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8);
  return v27(v25, v26);
}

uint64_t initializeWithCopy for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
  uint64_t v35 = a3[12];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  uint64_t v39 = a3[13];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
  uint64_t v43 = a3[14];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
  uint64_t v47 = a3[15];
  uint64_t v48 = a1 + v47;
  uint64_t v49 = a2 + v47;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
  return a1;
}

uint64_t assignWithCopy for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  uint64_t v35 = a3[12];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 24))(v36, v37, v38);
  uint64_t v39 = a3[13];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 24))(v40, v41, v42);
  uint64_t v43 = a3[14];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 24))(v44, v45, v46);
  uint64_t v47 = a3[15];
  uint64_t v48 = a1 + v47;
  uint64_t v49 = a2 + v47;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 24))(v48, v49, v50);
  return a1;
}

uint64_t initializeWithTake for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
  uint64_t v35 = a3[12];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
  uint64_t v39 = a3[13];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
  uint64_t v43 = a3[14];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
  uint64_t v47 = a3[15];
  uint64_t v48 = a1 + v47;
  uint64_t v49 = a2 + v47;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
  return a1;
}

uint64_t assignWithTake for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 40))(v32, v33, v34);
  uint64_t v35 = a3[12];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 40))(v36, v37, v38);
  uint64_t v39 = a3[13];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 40))(v40, v41, v42);
  uint64_t v43 = a3[14];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 40))(v44, v45, v46);
  uint64_t v47 = a3[15];
  uint64_t v48 = a1 + v47;
  uint64_t v49 = a2 + v47;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 40))(v48, v49, v50);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A1779DC);
}

uint64_t sub_20A1779DC(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v16 + 84) == a2)
        {
          uint64_t v8 = v15;
          uint64_t v12 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v18 + 84) == a2)
          {
            uint64_t v8 = v17;
            uint64_t v12 = a3[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
            OUTLINED_FUNCTION_0();
            if (*(_DWORD *)(v20 + 84) == a2)
            {
              uint64_t v8 = v19;
              uint64_t v12 = a3[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
              OUTLINED_FUNCTION_0();
              if (*(_DWORD *)(v22 + 84) == a2)
              {
                uint64_t v8 = v21;
                uint64_t v12 = a3[10];
              }
              else
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
                OUTLINED_FUNCTION_0();
                if (*(_DWORD *)(v24 + 84) == a2)
                {
                  uint64_t v8 = v23;
                  uint64_t v12 = a3[11];
                }
                else
                {
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
                  OUTLINED_FUNCTION_0();
                  if (*(_DWORD *)(v26 + 84) == a2)
                  {
                    uint64_t v8 = v25;
                    uint64_t v12 = a3[12];
                  }
                  else
                  {
                    __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
                    OUTLINED_FUNCTION_0();
                    if (*(_DWORD *)(v28 + 84) == a2)
                    {
                      uint64_t v8 = v27;
                      uint64_t v12 = a3[13];
                    }
                    else
                    {
                      __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
                      OUTLINED_FUNCTION_0();
                      if (*(_DWORD *)(v30 + 84) == a2)
                      {
                        uint64_t v8 = v29;
                        uint64_t v12 = a3[14];
                      }
                      else
                      {
                        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
                        uint64_t v12 = a3[15];
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
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ReportWeatherEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A177C04);
}

uint64_t sub_20A177C04()
{
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) == v3)
    {
      uint64_t v6 = v8;
      uint64_t v10 = v2[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v12 + 84) == v3)
      {
        uint64_t v6 = v11;
        uint64_t v10 = v2[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAC8);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v14 + 84) == v3)
        {
          uint64_t v6 = v13;
          uint64_t v10 = v2[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD0);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v16 + 84) == v3)
          {
            uint64_t v6 = v15;
            uint64_t v10 = v2[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A68);
            OUTLINED_FUNCTION_0();
            if (*(_DWORD *)(v18 + 84) == v3)
            {
              uint64_t v6 = v17;
              uint64_t v10 = v2[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAD8);
              OUTLINED_FUNCTION_0();
              if (*(_DWORD *)(v20 + 84) == v3)
              {
                uint64_t v6 = v19;
                uint64_t v10 = v2[10];
              }
              else
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE0);
                OUTLINED_FUNCTION_0();
                if (*(_DWORD *)(v22 + 84) == v3)
                {
                  uint64_t v6 = v21;
                  uint64_t v10 = v2[11];
                }
                else
                {
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAE8);
                  OUTLINED_FUNCTION_0();
                  if (*(_DWORD *)(v24 + 84) == v3)
                  {
                    uint64_t v6 = v23;
                    uint64_t v10 = v2[12];
                  }
                  else
                  {
                    __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF0);
                    OUTLINED_FUNCTION_0();
                    if (*(_DWORD *)(v26 + 84) == v3)
                    {
                      uint64_t v6 = v25;
                      uint64_t v10 = v2[13];
                    }
                    else
                    {
                      __swift_instantiateConcreteTypeFromMangledName(&qword_26760EAF8);
                      OUTLINED_FUNCTION_0();
                      if (*(_DWORD *)(v28 + 84) == v3)
                      {
                        uint64_t v6 = v27;
                        uint64_t v10 = v2[14];
                      }
                      else
                      {
                        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EB00);
                        uint64_t v10 = v2[15];
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
    uint64_t v7 = v1 + v10;
  }
  return __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_20A177E14()
{
  sub_20A0CFB60();
  if (v0 <= 0x3F)
  {
    sub_20A17839C(319, &qword_26AC41A00, (void (*)(void))sub_20A0F0058, (void (*)(void))sub_20A0DC6A8);
    if (v1 <= 0x3F)
    {
      sub_20A17839C(319, (unint64_t *)&qword_26AC41A30, (void (*)(void))sub_20A0DC0DC, (void (*)(void))sub_20A0DC128);
      if (v2 <= 0x3F)
      {
        sub_20A17839C(319, &qword_26760EB40, (void (*)(void))sub_20A0E3058, (void (*)(void))sub_20A0E30A8);
        if (v3 <= 0x3F)
        {
          sub_20A17839C(319, &qword_26760EB48, (void (*)(void))sub_20A13EB40, (void (*)(void))sub_20A13EB90);
          if (v4 <= 0x3F)
          {
            sub_20A17839C(319, &qword_26AC41A70, (void (*)(void))sub_20A0F4540, (void (*)(void))sub_20A0F3F00);
            if (v5 <= 0x3F)
            {
              sub_20A17839C(319, &qword_26760EB50, (void (*)(void))sub_20A17620C, (void (*)(void))sub_20A175C18);
              if (v6 <= 0x3F)
              {
                sub_20A17839C(319, &qword_26760EB58, (void (*)(void))sub_20A1422E4, (void (*)(void))sub_20A142334);
                if (v7 <= 0x3F)
                {
                  sub_20A17839C(319, &qword_26760EB60, (void (*)(void))sub_20A13F530, (void (*)(void))sub_20A13F580);
                  if (v8 <= 0x3F)
                  {
                    sub_20A17839C(319, &qword_26760EB68, (void (*)(void))sub_20A0FB960, (void (*)(void))sub_20A0FB9B0);
                    if (v9 <= 0x3F)
                    {
                      sub_20A17839C(319, &qword_26760EB70, (void (*)(void))sub_20A137A7C, (void (*)(void))sub_20A137ACC);
                      if (v10 <= 0x3F)
                      {
                        sub_20A17839C(319, &qword_26760EB78, (void (*)(void))sub_20A0DD21C, (void (*)(void))sub_20A0DD26C);
                        if (v11 <= 0x3F) {
                          swift_initStructMetadata();
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

void sub_20A17839C(uint64_t a1, unint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  if (!*a2)
  {
    a3();
    a4();
    unint64_t v6 = sub_20A1875F0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherEvent.Model(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v34 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_20A1879F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    unint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *unint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = (char *)a1 + v12;
    uint64_t v15 = (char *)a2 + v12;
    v14[4] = v15[4];
    *(_DWORD *)uint64_t v14 = *(_DWORD *)v15;
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    uint64_t v16 = a3[10];
    *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    *(_DWORD *)uint64_t v17 = *(_DWORD *)v18;
    v17[4] = v18[4];
    uint64_t v19 = a3[11];
    uint64_t v20 = a3[12];
    uint64_t v21 = (uint64_t *)((char *)a1 + v19);
    uint64_t v22 = (uint64_t *)((char *)a2 + v19);
    *uint64_t v21 = *v22;
    *(void *)((char *)v21 + 5) = *(void *)((char *)v22 + 5);
    uint64_t v23 = (char *)a1 + v20;
    uint64_t v24 = (char *)a2 + v20;
    *uint64_t v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    uint64_t v25 = *((void *)v24 + 3);
    *((void *)v23 + 2) = *((void *)v24 + 2);
    *((void *)v23 + 3) = v25;
    v23[32] = v24[32];
    uint64_t v26 = a3[13];
    uint64_t v27 = a3[14];
    uint64_t v28 = (char *)a1 + v26;
    uint64_t v29 = (char *)a2 + v26;
    *(_DWORD *)uint64_t v28 = *(_DWORD *)v29;
    *((_WORD *)v28 + 2) = *((_WORD *)v29 + 2);
    *(uint64_t *)((char *)a1 + v27) = *(uint64_t *)((char *)a2 + v27);
    uint64_t v30 = a3[15];
    uint64_t v31 = (uint64_t *)((char *)a1 + v30);
    uint64_t v32 = (uint64_t *)((char *)a2 + v30);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ReportWeatherEvent.Model(uint64_t a1)
{
  uint64_t v2 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(unsigned char *)(v13 + 4) = *(unsigned char *)(v14 + 4);
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v15 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(_DWORD *)uint64_t v16 = *(_DWORD *)v17;
  *(unsigned char *)(v16 + 4) = *(unsigned char *)(v17 + 4);
  uint64_t v18 = a3[11];
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)(a1 + v18);
  uint64_t v21 = (void *)(a2 + v18);
  *uint64_t v20 = *v21;
  *(void *)((char *)v20 + 5) = *(void *)((char *)v21 + 5);
  uint64_t v22 = a1 + v19;
  uint64_t v23 = a2 + v19;
  *(unsigned char *)uint64_t v22 = *(unsigned char *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  uint64_t v24 = *(void *)(v23 + 24);
  *(void *)(v22 + 16) = *(void *)(v23 + 16);
  *(void *)(v22 + 24) = v24;
  *(unsigned char *)(v22 + 32) = *(unsigned char *)(v23 + 32);
  uint64_t v25 = a3[13];
  uint64_t v26 = a3[14];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  *(_DWORD *)uint64_t v27 = *(_DWORD *)v28;
  *(_WORD *)(v27 + 4) = *(_WORD *)(v28 + 4);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v29 = a3[15];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (unsigned char *)(a1 + v13);
  uint64_t v15 = (unsigned char *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  v14[2] = v15[2];
  void v14[3] = v15[3];
  v14[4] = v15[4];
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  *(_DWORD *)(v17 + 4) = *(_DWORD *)(v18 + 4);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (int *)(a2 + v19);
  int v22 = *v21;
  *(unsigned char *)(v20 + 4) = *((unsigned char *)v21 + 4);
  *(_DWORD *)uint64_t v20 = v22;
  uint64_t v23 = a3[11];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(unsigned char *)uint64_t v24 = *(unsigned char *)v25;
  *(_DWORD *)(v24 + 4) = *(_DWORD *)(v25 + 4);
  int v26 = *(_DWORD *)(v25 + 8);
  *(unsigned char *)(v24 + 12) = *(unsigned char *)(v25 + 12);
  *(_DWORD *)(v24 + 8) = v26;
  uint64_t v27 = a3[12];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(unsigned char *)uint64_t v28 = *(unsigned char *)(a2 + v27);
  *(_DWORD *)(v28 + 8) = *(_DWORD *)(a2 + v27 + 8);
  *(_DWORD *)(v28 + 12) = *(_DWORD *)(a2 + v27 + 12);
  *(void *)(v28 + 16) = *(void *)(a2 + v27 + 16);
  *(void *)(v28 + 24) = *(void *)(a2 + v27 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v28 + 32) = *(unsigned char *)(v29 + 32);
  uint64_t v30 = a3[13];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  __int16 v33 = *(_WORD *)(v32 + 4);
  *(_DWORD *)uint64_t v31 = *(_DWORD *)v32;
  *(_WORD *)(v31 + 4) = v33;
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  uint64_t v34 = a3[15];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  *uint64_t v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v8;
  uint64_t v11 = a2 + v8;
  *(_DWORD *)uint64_t v10 = *(_DWORD *)v11;
  *(unsigned char *)(v10 + 4) = *(unsigned char *)(v11 + 4);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  *(unsigned char *)(v13 + 4) = *(unsigned char *)(v14 + 4);
  uint64_t v15 = a3[11];
  uint64_t v16 = a3[12];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  *uint64_t v17 = *v18;
  *(void *)((char *)v17 + 5) = *(void *)((char *)v18 + 5);
  uint64_t v19 = a1 + v16;
  uint64_t v20 = a2 + v16;
  long long v21 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v21;
  *(unsigned char *)(v19 + 32) = *(unsigned char *)(v20 + 32);
  uint64_t v22 = a3[13];
  uint64_t v23 = a3[14];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = a2 + v22;
  *(_WORD *)(v24 + 4) = *(_WORD *)(v25 + 4);
  *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20A1879F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(_DWORD *)(v14 + 1) = *(_DWORD *)(v15 + 1);
  uint64_t v16 = a1 + v13;
  uint64_t v17 = a2 + v13;
  *(unsigned char *)uint64_t v16 = *(unsigned char *)v17;
  *(_DWORD *)(v16 + 4) = *(_DWORD *)(v17 + 4);
  uint64_t v18 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)v20;
  *(unsigned char *)(v19 + 4) = *(unsigned char *)(v20 + 4);
  uint64_t v21 = a3[11];
  uint64_t v22 = a3[12];
  uint64_t v23 = a1 + v21;
  uint64_t v24 = a2 + v21;
  *(unsigned char *)uint64_t v23 = *(unsigned char *)v24;
  int v25 = *(_DWORD *)(v24 + 8);
  *(_DWORD *)(v23 + 4) = *(_DWORD *)(v24 + 4);
  *(_DWORD *)(v23 + 8) = v25;
  *(unsigned char *)(v23 + 12) = *(unsigned char *)(v24 + 12);
  uint64_t v26 = a1 + v22;
  uint64_t v27 = a2 + v22;
  *(unsigned char *)uint64_t v26 = *(unsigned char *)(a2 + v22);
  *(void *)(v26 + 8) = *(void *)(a2 + v22 + 8);
  uint64_t v28 = *(void *)(a2 + v22 + 16);
  uint64_t v29 = *(void *)(a2 + v22 + 24);
  *(void *)(v26 + 16) = v28;
  *(void *)(v26 + 24) = v29;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v26 + 32) = *(unsigned char *)(v27 + 32);
  uint64_t v30 = a3[13];
  uint64_t v31 = a3[14];
  uint64_t v32 = a1 + v30;
  uint64_t v33 = a2 + v30;
  *(_WORD *)(v32 + 4) = *(_WORD *)(v33 + 4);
  *(_DWORD *)uint64_t v32 = *(_DWORD *)v33;
  *(void *)(a1 + v31) = *(void *)(a2 + v31);
  uint64_t v34 = a3[15];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (uint64_t *)(a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A178C98);
}

uint64_t sub_20A178C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A178D3C);
}

void sub_20A178D3C()
{
  OUTLINED_FUNCTION_13();
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    __swift_storeEnumTagSinglePayload(v1, v0, v0, v4);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 24) + 8) = (v0 - 1);
  }
}

uint64_t sub_20A178DBC()
{
  uint64_t result = sub_20A1879F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReportWeatherEvent.Model.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ReportWeatherEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0x20A179000);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReportWeatherEvent.Model.CodingKeys()
{
  return &type metadata for ReportWeatherEvent.Model.CodingKeys;
}

unint64_t sub_20A17903C()
{
  unint64_t result = qword_26760EB90;
  if (!qword_26760EB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EB90);
  }
  return result;
}

unint64_t sub_20A17908C()
{
  unint64_t result = qword_26760EB98;
  if (!qword_26760EB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EB98);
  }
  return result;
}

unint64_t sub_20A1790DC()
{
  unint64_t result = qword_26760EBA0;
  if (!qword_26760EBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EBA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return v0;
}

WeatherAnalytics::TemperatureScaleData __swiftcall TemperatureScaleData.init(temperatureScale:)(WeatherAnalytics::TemperatureScaleData temperatureScale)
{
  unsigned char *v1 = *(unsigned char *)temperatureScale.temperatureScale;
  return temperatureScale;
}

uint64_t static TemperatureScaleData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

void TemperatureScaleData.temperatureScale.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *TemperatureScaleData.temperatureScale.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*TemperatureScaleData.temperatureScale.modify())()
{
  return nullsub_1;
}

uint64_t sub_20A1791C4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000020A19D9F0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_20A17924C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A1791C4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_20A179278(uint64_t a1)
{
  unint64_t v2 = sub_20A0D2FA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A1792B4(uint64_t a1)
{
  unint64_t v2 = sub_20A0D2FA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TemperatureScaleData.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC42B48);
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A0D2FA8();
  sub_20A188790();
  if (!v2)
  {
    sub_20A179420();
    sub_20A1885A0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v3, v6);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_20A179420()
{
  unint64_t result = qword_26AC42860;
  if (!qword_26AC42860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC42860);
  }
  return result;
}

uint64_t sub_20A17946C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TemperatureScaleData.init(from:)(a1, a2);
}

unsigned char *storeEnumTagSinglePayload for TemperatureScaleData(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A179550);
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

unint64_t sub_20A1795A4()
{
  unint64_t result = qword_26760EBA8;
  if (!qword_26760EBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EBA8);
  }
  return result;
}

uint64_t sub_20A1795F0(char a1)
{
  uint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_0_17();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_2_27();
      break;
    case 3:
      return result;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_3_31();
      break;
    default:
      uint64_t result = OUTLINED_FUNCTION_1_29();
      break;
  }
  return result;
}

uint64_t sub_20A179660()
{
  return sub_20A187180();
}

uint64_t sub_20A179684@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_20A187240();
  *a1 = v3;
  return result;
}

uint64_t WidgetAssembly.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t WidgetAssembly.init()()
{
  return v0;
}

uint64_t WidgetAssembly.load(in:)()
{
  uint64_t v0 = sub_20A187C40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  sub_20A187B90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C88);
  OUTLINED_FUNCTION_0_1();
  swift_release();
  swift_release();
  sub_20A187B90();
  sub_20A187620();
  OUTLINED_FUNCTION_0_1();
  swift_release();
  uint64_t v2 = *(void (**)(void))(v1 + 104);
  OUTLINED_FUNCTION_8_0();
  v2();
  sub_20A187A90();
  swift_release();
  swift_release();
  uint64_t v3 = *(void (**)(uint64_t))(v1 + 8);
  uint64_t v4 = OUTLINED_FUNCTION_0_18();
  v3(v4);
  sub_20A187B90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC446A8);
  OUTLINED_FUNCTION_1_25();
  swift_release();
  OUTLINED_FUNCTION_8_0();
  v2();
  sub_20A187A90();
  swift_release();
  swift_release();
  uint64_t v5 = OUTLINED_FUNCTION_0_18();
  v3(v5);
  sub_20A187B90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44498);
  OUTLINED_FUNCTION_1_25();
  swift_release();
  swift_release();
  sub_20A187B90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43950);
  OUTLINED_FUNCTION_1_25();
  swift_release();
  OUTLINED_FUNCTION_8_0();
  v2();
  sub_20A187A90();
  swift_release();
  swift_release();
  uint64_t v6 = OUTLINED_FUNCTION_0_18();
  v3(v6);
  sub_20A187BA0();
  sub_20A187BD0();
  return swift_release();
}

uint64_t sub_20A17998C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C78);
  uint64_t result = sub_20A187B60();
  if (v4)
  {
    type metadata accessor for WidgetDynamicEndpoint();
    uint64_t v2 = swift_allocObject();
    *(unsigned char *)(v2 + 16) = 7;
    sub_20A0D3304(&v3, v2 + 24);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A179A24()
{
  uint64_t v0 = sub_20A1874C0();
  MEMORY[0x270FA5388](v0);
  sub_20A17A52C(&qword_26AC44C80, MEMORY[0x263F24CF0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44CC0);
  sub_20A17A574();
  sub_20A188460();
  sub_20A187620();
  swift_allocObject();
  return sub_20A187610();
}

uint64_t sub_20A179B34@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44B98);
  uint64_t result = sub_20A187B60();
  if (v18)
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
    MEMORY[0x270FA5388](v4);
    uint64_t v6 = (void *)((char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = *v6;
    uint64_t v9 = type metadata accessor for DiagnosticSubmissionAuthority();
    v16[3] = v9;
    v16[4] = &off_26BE28B18;
    v16[0] = v8;
    type metadata accessor for WidgetPrivacyValidationProvider();
    uint64_t v10 = (void *)swift_allocObject();
    uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v9);
    MEMORY[0x270FA5388](v11);
    uint64_t v13 = (void *)((char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v14 + 16))(v13);
    uint64_t v15 = *v13;
    void v10[5] = v9;
    v10[6] = &off_26BE28B18;
    v10[2] = v15;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    uint64_t result = sub_20A17A52C(&qword_26AC43420, (void (*)(uint64_t))type metadata accessor for WidgetPrivacyValidationProvider);
    *a2 = v10;
    a2[1] = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A179D74@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44C78);
  uint64_t result = sub_20A187B60();
  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44D28);
    uint64_t result = sub_20A187B60();
    if (v8)
    {
      uint64_t v5 = type metadata accessor for WidgetTelemetryPrivacySampler();
      uint64_t v6 = swift_allocObject();
      type metadata accessor for AppConfigTelemetryPrivacySampler();
      swift_allocObject();
      uint64_t result = sub_20A0CDB78(&v9, &v7);
      *(void *)(v6 + 16) = result;
      a2[3] = v5;
      a2[4] = (uint64_t)&off_26BE28170;
      *a2 = v6;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A179E80@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43948);
  uint64_t result = sub_20A187B60();
  if (v20)
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
    MEMORY[0x270FA5388](v4);
    uint64_t v6 = (void *)((char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = *v6;
    uint64_t v9 = type metadata accessor for AppAnalyticsFlushManager();
    v18[3] = v9;
    v18[4] = &off_26BE24A70;
    v18[0] = v8;
    uint64_t v10 = type metadata accessor for WidgetFlushManager();
    uint64_t v11 = (void *)swift_allocObject();
    uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v9);
    MEMORY[0x270FA5388](v12);
    uint64_t v14 = (void *)((char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    uint64_t v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_26BE24A70;
    v11[2] = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43A60);
    uint64_t v17 = swift_allocObject();
    *(_DWORD *)(v17 + 24) = 0;
    *(void *)(v17 + 16) = 0;
    v11[7] = v17;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    a2[3] = v10;
    a2[4] = &off_26BE22A98;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A17A0C0()
{
  uint64_t v0 = sub_20A187C40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC42BB8);
  sub_20A187BF0();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43948);
  sub_20A187BF0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F7D010], v0);
  sub_20A187A90();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44D28);
  sub_20A187BF0();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC44D30);
  sub_20A187BF0();
  return swift_release();
}

uint64_t sub_20A17A2A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_20A1870F0();
  uint64_t v3 = MEMORY[0x263F85C20];
  a1[3] = v2;
  a1[4] = v3;
  __swift_allocate_boxed_opaque_existential_1(a1);
  return sub_20A1870E0();
}

uint64_t sub_20A17A2EC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A187510();
  uint64_t result = sub_20A187B50();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = type metadata accessor for AppAnalyticsFlushManager();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    a2[3] = v5;
    a2[4] = (uint64_t)&off_26BE24A70;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A17A374@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A17A3EC(a1, &qword_26AC44D30, MEMORY[0x263F85C40], MEMORY[0x263F85C30], MEMORY[0x263F85C38], a2);
}

uint64_t sub_20A17A3B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_20A17A3EC(a1, &qword_26AC44690, MEMORY[0x263F85D48], MEMORY[0x263F85D38], MEMORY[0x263F85D40], a2);
}

uint64_t sub_20A17A3EC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(char *)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t result = sub_20A187B60();
  if (v14)
  {
    uint64_t v12 = a3(0);
    swift_allocObject();
    uint64_t result = a4(v13);
    a6[3] = v12;
    a6[4] = a5;
    *a6 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t WidgetAssembly.deinit()
{
  return v0;
}

uint64_t WidgetAssembly.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_20A17A4C4()
{
  return WidgetAssembly.load(in:)();
}

uint64_t type metadata accessor for WidgetAssembly()
{
  return self;
}

uint64_t method lookup function for WidgetAssembly(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WidgetAssembly);
}

uint64_t dispatch thunk of WidgetAssembly.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_20A17A52C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_20A17A574()
{
  unint64_t result = qword_26AC44CC8;
  if (!qword_26AC44CC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AC44CC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44CC8);
  }
  return result;
}

WeatherAnalytics::DisplayModeType_optional __swiftcall DisplayModeType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t DisplayModeType.rawValue.getter()
{
  return *(void *)&aUnknown_52[8 * *v0];
}

uint64_t sub_20A17A644()
{
  return sub_20A10ECAC();
}

unint64_t sub_20A17A654()
{
  unint64_t result = qword_26760EBB0;
  if (!qword_26760EBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EBB0);
  }
  return result;
}

uint64_t sub_20A17A6A0()
{
  return sub_20A1850B4(*v0);
}

uint64_t sub_20A17A6A8()
{
  return sub_20A185A1C();
}

uint64_t sub_20A17A6B0(uint64_t a1)
{
  return sub_20A1865FC(a1, *v1);
}

WeatherAnalytics::DisplayModeType_optional sub_20A17A6B8(Swift::String *a1)
{
  return DisplayModeType.init(rawValue:)(*a1);
}

uint64_t sub_20A17A6C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DisplayModeType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A17A6EC()
{
  return sub_20A188210();
}

uint64_t sub_20A17A74C()
{
  return sub_20A188200();
}

unsigned char *storeEnumTagSinglePayload for DisplayModeType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A17A868);
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

ValueMetadata *type metadata accessor for DisplayModeType()
{
  return &type metadata for DisplayModeType;
}

unint64_t sub_20A17A8A0()
{
  unint64_t result = qword_26760EBB8;
  if (!qword_26760EBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EBB8);
  }
  return result;
}

uint64_t sub_20A17A8EC(void (*a1)(void), uint64_t a2, uint64_t *a3, unsigned __int8 *a4)
{
  uint64_t v60 = a1;
  v61 = a4;
  uint64_t v63 = a2;
  uint64_t v5 = sub_20A187F60();
  uint64_t v6 = OUTLINED_FUNCTION_1_3(v5);
  uint64_t v56 = v7;
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v6);
  uint64_t v57 = (uint64_t)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v54 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EBC0);
  uint64_t v14 = OUTLINED_FUNCTION_1_3(v13);
  uint64_t v55 = v15;
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v14);
  uint64_t v58 = (uint64_t)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v54 - v19;
  uint64_t v21 = sub_20A187F10();
  uint64_t v22 = OUTLINED_FUNCTION_1_3(v21);
  uint64_t v54 = v23;
  uint64_t v25 = *(void *)(v24 + 64);
  uint64_t v26 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v54 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v54 - v28;
  sub_20A187E00();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)&v54 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = *a3;
  uint64_t v34 = a3[1];
  uint64_t v62 = v33;
  LODWORD(v61) = *v61;
  LODWORD(v59) = *(unsigned __int8 *)(v59 + 16);
  sub_20A17BBE8((uint64_t)v60, (uint64_t)v32, MEMORY[0x263F85E18]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v35 = (void (*)(void))MEMORY[0x263F85E48];
    sub_20A17BB20((uint64_t)v32, (uint64_t)v12, MEMORY[0x263F85E48]);
    uint64_t v36 = v57;
    sub_20A17BBE8((uint64_t)v12, v57, MEMORY[0x263F85E48]);
    unint64_t v37 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    uint64_t v38 = swift_allocObject();
    unint64_t v39 = ((v37 + v9) & 0xFFFFFFFFFFFFFFF8) + v38;
    sub_20A17BB20(v36, v38 + v37, v35);
    *(unsigned char *)(v38 + v37 + v9) = (_BYTE)v61;
    *(void *)(v39 + 8) = v62;
    *(void *)(v39 + 16) = v34;
    swift_bridgeObjectRetain();
    sub_20A187990();
    swift_release();
    uint64_t v40 = (uint64_t)v12;
    uint64_t v41 = v35;
  }
  else
  {
    uint64_t v42 = (uint64_t)&v32[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AC43778) + 48)];
    uint64_t v60 = (void (*)(void))MEMORY[0x263F85E20];
    sub_20A17BB20((uint64_t)v32, (uint64_t)v29, MEMORY[0x263F85E20]);
    sub_20A17BB80(v42, (uint64_t)v20);
    sub_20A17BBE8((uint64_t)v29, (uint64_t)v27, MEMORY[0x263F85E20]);
    uint64_t v43 = v34;
    uint64_t v44 = v58;
    sub_20A17BC48((uint64_t)v20, v58);
    unint64_t v45 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
    uint64_t v46 = v45 + v25;
    unint64_t v47 = (*(unsigned __int8 *)(v55 + 80) + v46 + 2) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
    uint64_t v48 = swift_allocObject();
    uint64_t v49 = v48 + v45;
    uint64_t v50 = v60;
    sub_20A17BB20((uint64_t)v27, v49, v60);
    uint64_t v51 = (unsigned char *)(v48 + v46);
    *uint64_t v51 = (_BYTE)v61;
    v51[1] = v59;
    sub_20A17BB80(v44, v48 + v47);
    uint64_t v52 = (void *)(v48 + ((v17 + v47 + 7) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v52 = v62;
    v52[1] = v43;
    swift_bridgeObjectRetain();
    sub_20A187990();
    swift_release();
    sub_20A17C0AC((uint64_t)v20, &qword_26760EBC0);
    uint64_t v40 = (uint64_t)v29;
    uint64_t v41 = v50;
  }
  return sub_20A17C010(v40, v41);
}

uint64_t sub_20A17AD50(uint64_t a1, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)&long long v63 = a6;
  *((void *)&v63 + 1) = a7;
  LODWORD(v62) = a3;
  uint64_t v64 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EBC0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v47 - v13;
  uint64_t v15 = sub_20A186E30();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A187F00();
  sub_20A186DF0();
  double v20 = v19;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v61 = sub_20A12BA40(v20);
  sub_20A187E30();
  *(void *)&long long v60 = sub_20A12BA40(v21);
  sub_20A187E70();
  uint64_t v59 = sub_20A12BA40(v22);
  sub_20A187E80();
  uint64_t v58 = sub_20A12BA40(v23);
  sub_20A187E90();
  uint64_t v57 = sub_20A12BA40(v24);
  sub_20A187E50();
  uint64_t v56 = sub_20A12BA40(v25);
  uint64_t v55 = sub_20A187E40();
  uint64_t v54 = sub_20A187E60();
  uint64_t v53 = sub_20A187EF0();
  sub_20A14BEC8(v68);
  int v52 = v68[0];
  int v51 = sub_20A187EA0();
  id v26 = objc_msgSend(self, sel_mainBundle);
  uint64_t v49 = sub_20A0D2DD8(v26);
  unint64_t v28 = v27;
  sub_20A14C078(&v67);
  uint64_t v50 = v67;
  if (a4)
  {
    uint64_t v48 = sub_20A187EE0();
    uint64_t v30 = v29;
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v30 = 0;
  }
  uint64_t v31 = a5;
  sub_20A17BC48(a5, (uint64_t)v14);
  uint64_t v32 = sub_20A187ED0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v32);
  if (EnumTagSinglePayload == 1)
  {
    sub_20A17C0AC((uint64_t)v14, &qword_26760EBC0);
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = sub_20A187EB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v32 - 8) + 8))(v14, v32);
  }
  sub_20A17BC48(v31, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v32) == 1)
  {
    sub_20A17C0AC((uint64_t)v12, &qword_26760EBC0);
    char v35 = 2;
  }
  else
  {
    char v36 = sub_20A187EC0();
    (*(void (**)(char *, uint64_t))(*(void *)(v32 - 8) + 8))(v12, v32);
    char v35 = v36 & 1;
  }
  v66[0] = v61;
  v66[1] = v60;
  unint64_t v37 = 0x800000020A19C980;
  v66[2] = v59;
  v66[3] = v58;
  unint64_t v38 = 0xD000000000000011;
  if (v28)
  {
    unint64_t v37 = v28;
    unint64_t v38 = v49;
  }
  v66[4] = v57;
  v66[5] = v56;
  LOBYTE(v66[6]) = 0;
  v66[7] = v55;
  v66[8] = v54;
  v66[9] = v53;
  LOBYTE(v66[10]) = v52;
  BYTE1(v66[10]) = v62;
  BYTE2(v66[10]) = v51 & 1;
  v66[11] = v38;
  v66[12] = v37;
  v66[13] = v50;
  v66[14] = v48;
  v66[15] = v30;
  v66[16] = v34;
  LOBYTE(v66[17]) = EnumTagSinglePayload == 1;
  BYTE1(v66[17]) = v35;
  memcpy(v65, v66, 0x8AuLL);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC445A8);
  uint64_t v39 = sub_20A187600();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(unsigned __int8 *)(v40 + 80);
  uint64_t v42 = (v41 + 32) & ~v41;
  uint64_t v61 = v41 | 7;
  uint64_t v43 = swift_allocObject();
  long long v60 = xmmword_20A18BFB0;
  *(_OWORD *)(v43 + 16) = xmmword_20A18BFB0;
  uint64_t v44 = *(void (**)(uint64_t, void, uint64_t))(v40 + 104);
  v44(v43 + v42, *MEMORY[0x263F24D48], v39);
  sub_20A17C060();
  sub_20A187580();
  swift_bridgeObjectRelease();
  sub_20A1151F4((uint64_t)v66);
  v65[0] = v63;
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = v60;
  v44(v45 + v42, *MEMORY[0x263F24D40], v39);
  sub_20A10CFAC();
  sub_20A187580();
  swift_bridgeObjectRelease();
  type metadata accessor for TelemetryEvent();
  sub_20A17C190(&qword_26AC41CE8, (void (*)(uint64_t))type metadata accessor for TelemetryEvent);
  memset(v65, 0, 32);
  sub_20A187590();
  return sub_20A17C0AC((uint64_t)v65, &qword_26AC43A80);
}

uint64_t sub_20A17B368(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)&long long v46 = a4;
  *((void *)&v46 + 1) = a5;
  uint64_t v7 = sub_20A186E60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_20A187F60();
  if (*(unsigned char *)(a2 + *(int *)(v11 + 24) + 9))
  {
    uint64_t v12 = sub_20A187F50();
    uint64_t v13 = sub_20A12BA40(*(double *)(a2 + *(int *)(v11 + 20)));
    id v14 = objc_msgSend(self, sel_mainBundle);
    uint64_t v15 = sub_20A0D2DD8(v14);
    unint64_t v17 = 0xD000000000000011;
    if (v16) {
      unint64_t v17 = v15;
    }
    *(void *)&long long v47 = v12;
    *((void *)&v47 + 1) = v13;
    LOBYTE(v48) = a3;
    if (v16) {
      unint64_t v18 = v16;
    }
    else {
      unint64_t v18 = 0x800000020A19C980;
    }
    *((void *)&v48 + 1) = v17;
    unint64_t v49 = v18;
    sub_20A17C0F8();
    sub_20A187580();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v47 = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC445A8);
    uint64_t v19 = sub_20A187600();
    uint64_t v20 = *(void *)(v19 - 8);
    unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_20A18BFB0;
    (*(void (**)(unint64_t, void, uint64_t))(v20 + 104))(v22 + v21, *MEMORY[0x263F24D40], v19);
    sub_20A10CFAC();
    sub_20A187580();
    swift_bridgeObjectRelease();
    sub_20A186E50();
    sub_20A186E40();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_20A187540();
    swift_bridgeObjectRelease();
    type metadata accessor for NetworkOperationFailedEvent();
    sub_20A17C190(&qword_26AC44100, (void (*)(uint64_t))type metadata accessor for NetworkOperationFailedEvent);
    long long v47 = 0u;
    long long v48 = 0u;
    sub_20A187590();
    sub_20A17C0AC((uint64_t)&v47, &qword_26AC43A80);
    return sub_20A187550();
  }
  else
  {
    sub_20A186DF0();
    uint64_t v25 = sub_20A12BA40(v24);
    uint64_t v26 = sub_20A12BA40(*(double *)(a2 + *(int *)(v11 + 20)));
    uint64_t v27 = sub_20A187F30();
    char v29 = v28;
    char v30 = sub_20A187F40();
    uint64_t v31 = sub_20A187F50();
    uint64_t v45 = v31;
    id v32 = objc_msgSend(self, sel_mainBundle);
    uint64_t v33 = sub_20A0D2DD8(v32);
    unint64_t v35 = 0xD000000000000011;
    *(void *)&long long v47 = v25;
    *((void *)&v47 + 1) = v26;
    *(void *)&long long v48 = v27;
    if (v34) {
      unint64_t v35 = v33;
    }
    BYTE8(v48) = v29 & 1;
    BYTE9(v48) = v30;
    if (v34) {
      unint64_t v36 = v34;
    }
    else {
      unint64_t v36 = 0x800000020A19C980;
    }
    unint64_t v49 = v31;
    char v50 = a3;
    unint64_t v51 = v35;
    unint64_t v52 = v36;
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC445A8);
    uint64_t v37 = sub_20A187600();
    uint64_t v38 = *(void *)(v37 - 8);
    unint64_t v39 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
    uint64_t v40 = swift_allocObject();
    long long v43 = xmmword_20A18BFB0;
    *(_OWORD *)(v40 + 16) = xmmword_20A18BFB0;
    uint64_t v41 = *(void (**)(unint64_t, void, uint64_t))(v38 + 104);
    v41(v40 + v39, *MEMORY[0x263F24D48], v37);
    sub_20A17C144();
    sub_20A187580();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v47 = v46;
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = v43;
    v41(v42 + v39, *MEMORY[0x263F24D40], v37);
    sub_20A10CFAC();
    sub_20A187580();
    swift_bridgeObjectRelease();
    type metadata accessor for NetworkOperationEvent();
    sub_20A17C190(&qword_26AC44020, (void (*)(uint64_t))type metadata accessor for NetworkOperationEvent);
    long long v47 = 0u;
    long long v48 = 0u;
    sub_20A187590();
    return sub_20A17C0AC((uint64_t)&v47, &qword_26AC43A80);
  }
}

uint64_t sub_20A17B98C()
{
  return MEMORY[0x270FA0228](v0, 17, 7);
}

uint64_t sub_20A17B99C()
{
  uint64_t v1 = (int *)(sub_20A187F60() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((v3 + *(void *)(*(void *)v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 24;
  uint64_t v6 = v0 + v3;
  sub_20A186E30();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  sub_20A0DA624(*(id *)(v6 + v1[8]), *(unsigned __int8 *)(v6 + v1[8] + 8), *(unsigned char *)(v6 + v1[8] + 9));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_20A17BAA4(uint64_t a1)
{
  uint64_t v3 = sub_20A187F60();
  OUTLINED_FUNCTION_1_3(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = v8 + *(void *)(v7 + 64);
  uint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFF8) + v1;
  char v11 = *(unsigned char *)(v1 + v9);
  uint64_t v12 = *(void *)(v10 + 8);
  uint64_t v13 = *(void *)(v10 + 16);
  return sub_20A17B368(a1, v1 + v8, v11, v12, v13);
}

uint64_t sub_20A17BB20(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_20A17BB80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A17BBE8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_20A17BC48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A17BCB0()
{
  uint64_t v1 = sub_20A187F10();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EBC0);
  OUTLINED_FUNCTION_1_3(v5);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v3 + v7 + 2) & ~v7;
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = v0 + v3;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
      sub_20A187BC0();
      OUTLINED_FUNCTION_1_0();
      (*(void (**)(uint64_t))(v12 + 8))(v11);
      break;
    case 0x12u:
      sub_20A187BC0();
      OUTLINED_FUNCTION_1_0();
      uint64_t v14 = OUTLINED_FUNCTION_2_28();
      v15(v14);
      uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AE8);
      swift_bridgeObjectRelease();
      uint64_t v16 = v11 + *(int *)(v1 + 64);
      uint64_t v17 = sub_20A187D30();
      if (!OUTLINED_FUNCTION_3_32(v17)) {
        (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v16);
      }
      break;
    default:
      break;
  }
  uint64_t v13 = sub_20A187ED0();
  if (!OUTLINED_FUNCTION_3_32(v13)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v8, v1);
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v10 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | v7 | 7);
}

uint64_t sub_20A17BF40(uint64_t a1)
{
  uint64_t v3 = sub_20A187F10();
  OUTLINED_FUNCTION_1_3(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v7 = v5 + *(void *)(v6 + 64);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EBC0);
  OUTLINED_FUNCTION_1_3(v8);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  unint64_t v13 = (v7 + *(unsigned __int8 *)(v10 + 80) + 2) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v14 = *(unsigned char *)(v1 + v7 + 1);
  uint64_t v15 = v1 + v13;
  uint64_t v16 = (uint64_t *)(v1 + ((*(void *)(v12 + 64) + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  int v19 = *(unsigned __int8 *)(v1 + v7);
  return sub_20A17AD50(a1, v1 + v5, v19, v14, v15, v17, v18);
}

uint64_t sub_20A17C010(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = OUTLINED_FUNCTION_2_28();
  v4(v3);
  return a1;
}

unint64_t sub_20A17C060()
{
  unint64_t result = qword_26AC41E88;
  if (!qword_26AC41E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC41E88);
  }
  return result;
}

uint64_t sub_20A17C0AC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = OUTLINED_FUNCTION_2_28();
  v4(v3);
  return a1;
}

unint64_t sub_20A17C0F8()
{
  unint64_t result = qword_26AC44168;
  if (!qword_26AC44168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44168);
  }
  return result;
}

unint64_t sub_20A17C144()
{
  unint64_t result = qword_26AC44090;
  if (!qword_26AC44090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC44090);
  }
  return result;
}

uint64_t sub_20A17C190(unint64_t *a1, void (*a2)(uint64_t))
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

WeatherAnalytics::CurrentLocationUpdateFailureReason_optional __swiftcall CurrentLocationUpdateFailureReason.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t CurrentLocationUpdateFailureReason.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x73696D7265506F6ELL;
      break;
    case 3:
      unint64_t result = 0x726568746FLL;
      break;
    default:
      unint64_t result = 0x74754F656D6974;
      break;
  }
  return result;
}

uint64_t sub_20A17C2CC()
{
  return sub_20A10E0B0();
}

unint64_t sub_20A17C2DC()
{
  unint64_t result = qword_26760EBC8;
  if (!qword_26760EBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EBC8);
  }
  return result;
}

uint64_t sub_20A17C328()
{
  return sub_20A1850CC(*v0);
}

uint64_t sub_20A17C330()
{
  return sub_20A185284();
}

uint64_t sub_20A17C338(uint64_t a1)
{
  return sub_20A186964(a1, *v1);
}

WeatherAnalytics::CurrentLocationUpdateFailureReason_optional sub_20A17C340(Swift::String *a1)
{
  return CurrentLocationUpdateFailureReason.init(rawValue:)(*a1);
}

unint64_t sub_20A17C34C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CurrentLocationUpdateFailureReason.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A17C374()
{
  return sub_20A188210();
}

uint64_t sub_20A17C3D4()
{
  return sub_20A188200();
}

unsigned char *storeEnumTagSinglePayload for CurrentLocationUpdateFailureReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A17C4F0);
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

ValueMetadata *type metadata accessor for CurrentLocationUpdateFailureReason()
{
  return &type metadata for CurrentLocationUpdateFailureReason;
}

unint64_t sub_20A17C528()
{
  unint64_t result = qword_26760EBD0;
  if (!qword_26760EBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EBD0);
  }
  return result;
}

uint64_t sub_20A17C574(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26AC43F18, MEMORY[0x263F24D10]);
}

uint64_t static WeatherDataLoadEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26AC43B98, MEMORY[0x263F24D18], (uint64_t)qword_26AC43F18, a1);
}

uint64_t static WeatherDataLoadEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A17C5DC(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760EBD8, MEMORY[0x263F24DC8]);
}

uint64_t static WeatherDataLoadEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26AC43BA0, MEMORY[0x263F24DD8], (uint64_t)qword_26760EBD8, a1);
}

uint64_t sub_20A17C63C()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760EBF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760EBF0);
  return sub_20A187810();
}

uint64_t static WeatherDataLoadEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDD0, MEMORY[0x263F24DE8], (uint64_t)qword_26760EBF0, a1);
}

uint64_t WeatherDataLoadEvent.data.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t WeatherDataLoadEvent.data.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*WeatherDataLoadEvent.data.modify())()
{
  return nullsub_1;
}

uint64_t WeatherDataLoadEvent.timedData.getter()
{
  type metadata accessor for WeatherDataLoadEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for WeatherDataLoadEvent(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26AC43F38);
}

uint64_t WeatherDataLoadEvent.timedData.setter()
{
  type metadata accessor for WeatherDataLoadEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*WeatherDataLoadEvent.timedData.modify())()
{
  return nullsub_1;
}

uint64_t WeatherDataLoadEvent.privateUserData.getter()
{
  type metadata accessor for WeatherDataLoadEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t WeatherDataLoadEvent.privateUserData.setter()
{
  type metadata accessor for WeatherDataLoadEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*WeatherDataLoadEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t WeatherDataLoadEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t Event = type metadata accessor for WeatherDataLoadEvent(0);
  uint64_t v5 = a1 + *(int *)(Event + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 104))(v5, v2);
  uint64_t v7 = a1 + *(int *)(Event + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 104);
  return v10(v7, v2, v8);
}

void WeatherDataLoadEvent.Model.data.getter(unsigned char *a1@<X8>)
{
  char v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
}

uint64_t WeatherDataLoadEvent.Model.timedData.getter()
{
  type metadata accessor for WeatherDataLoadEvent.Model(0);
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for WeatherDataLoadEvent.Model(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760EC20);
}

uint64_t WeatherDataLoadEvent.Model.privateUserData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for WeatherDataLoadEvent.Model(0) + 24));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t WeatherDataLoadEvent.Model.init(data:timedData:privateUserData:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, unsigned char *a4@<X8>)
{
  char v6 = a1[1];
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  *a4 = *a1;
  a4[1] = v6;
  uint64_t v9 = type metadata accessor for WeatherDataLoadEvent.Model(0);
  uint64_t v10 = &a4[*(int *)(v9 + 20)];
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v11 + 32))(v10, a2);
  unint64_t v13 = &a4[*(int *)(v9 + 24)];
  *unint64_t v13 = v7;
  v13[1] = v8;
  return result;
}

uint64_t sub_20A17CC7C(char a1)
{
  return *(void *)&aData_13[8 * a1];
}

uint64_t sub_20A17CC9C()
{
  return sub_20A17CC7C(*v0);
}

uint64_t sub_20A17CCA4(uint64_t a1)
{
  unint64_t v2 = sub_20A17CED4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A17CCE0(uint64_t a1)
{
  unint64_t v2 = sub_20A17CED4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WeatherDataLoadEvent.Model.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EC08);
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A17CED4();
  sub_20A1887B0();
  sub_20A13B550();
  OUTLINED_FUNCTION_5_0();
  if (!v1)
  {
    type metadata accessor for WeatherDataLoadEvent.Model(0);
    sub_20A187A10();
    sub_20A1047E4(&qword_26AC41AD0);
    sub_20A188660();
    sub_20A0DC128();
    OUTLINED_FUNCTION_5_0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_20A17CED4()
{
  unint64_t result = qword_26760EC10;
  if (!qword_26760EC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EC10);
  }
  return result;
}

uint64_t WeatherDataLoadEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = sub_20A187A10();
  OUTLINED_FUNCTION_2_0();
  uint64_t v19 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_7();
  uint64_t v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EC18);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7();
  uint64_t v9 = type metadata accessor for WeatherDataLoadEvent.Model(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_7();
  unint64_t v13 = (char *)(v12 - v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A17CED4();
  sub_20A188790();
  if (v21) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A13B500();
  sub_20A1885A0();
  *(_WORD *)unint64_t v13 = v22;
  LOBYTE(v22) = 1;
  sub_20A1047E4(&qword_26AC41AD8);
  sub_20A1885A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(&v13[*(int *)(v9 + 20)], v7, v20);
  sub_20A0DC0DC();
  sub_20A1885A0();
  uint64_t v14 = OUTLINED_FUNCTION_3_19();
  v15(v14);
  uint64_t v16 = &v13[*(int *)(v9 + 24)];
  *(void *)uint64_t v16 = v22;
  *((void *)v16 + 1) = v23;
  sub_20A17D228((uint64_t)v13, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_20A17D28C((uint64_t)v13);
}

uint64_t sub_20A17D228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WeatherDataLoadEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A17D28C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WeatherDataLoadEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A17D2E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WeatherDataLoadEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A17D300(void *a1)
{
  return WeatherDataLoadEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for WeatherDataLoadEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    unint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for WeatherDataLoadEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t initializeWithCopy for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A17D9EC);
}

uint64_t sub_20A17D9EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      uint64_t v12 = *(int *)(a3 + 24);
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A17DAAC);
}

uint64_t sub_20A17DAAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43F08);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
      uint64_t v14 = *(int *)(a4 + 24);
    }
    uint64_t v11 = a1 + v14;
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_20A17DB60()
{
  sub_20A17DCD4(319, &qword_26AC43F10, (void (*)(void))sub_20A13B500, (void (*)(void))sub_20A13B550);
  if (v0 <= 0x3F)
  {
    sub_20A0CFA94();
    if (v1 <= 0x3F)
    {
      sub_20A17DCD4(319, (unint64_t *)&qword_26AC41A30, (void (*)(void))sub_20A0DC0DC, (void (*)(void))sub_20A0DC128);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_20A17DCD4(uint64_t a1, unint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  if (!*a2)
  {
    a3();
    a4();
    unint64_t v6 = sub_20A1875F0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for WeatherDataLoadEvent.Model(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_20A187A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (uint64_t *)((char *)v4 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return v4;
}

_WORD *initializeWithCopy for WeatherDataLoadEvent.Model(_WORD *a1, _WORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_20A187A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *assignWithCopy for WeatherDataLoadEvent.Model(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_20A187A10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_WORD *initializeWithTake for WeatherDataLoadEvent.Model(_WORD *a1, _WORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_20A187A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

unsigned char *assignWithTake for WeatherDataLoadEvent.Model(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_20A187A10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (uint64_t *)&a2[v10];
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherDataLoadEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A17E104);
}

uint64_t sub_20A17E104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A187A10();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for WeatherDataLoadEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A17E1AC);
}

void sub_20A17E1AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_20A187A10();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t sub_20A17E23C()
{
  uint64_t result = sub_20A187A10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WeatherDataLoadEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A17E3A8);
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

ValueMetadata *type metadata accessor for WeatherDataLoadEvent.Model.CodingKeys()
{
  return &type metadata for WeatherDataLoadEvent.Model.CodingKeys;
}

unint64_t sub_20A17E3E4()
{
  unint64_t result = qword_26760EC30;
  if (!qword_26760EC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EC30);
  }
  return result;
}

unint64_t sub_20A17E434()
{
  unint64_t result = qword_26760EC38;
  if (!qword_26760EC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EC38);
  }
  return result;
}

unint64_t sub_20A17E484()
{
  unint64_t result = qword_26760EC40;
  if (!qword_26760EC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EC40);
  }
  return result;
}

WeatherAnalytics::StartMethod_optional __swiftcall StartMethod.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t sub_20A17E544()
{
  return sub_20A10F25C();
}

unint64_t sub_20A17E554()
{
  unint64_t result = qword_26760EC48;
  if (!qword_26760EC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EC48);
  }
  return result;
}

uint64_t sub_20A17E5A0()
{
  return sub_20A1850E4(*v0);
}

uint64_t sub_20A17E5A8()
{
  return sub_20A185D80();
}

uint64_t sub_20A17E5B0(uint64_t a1)
{
  return sub_20A1864DC(a1, *v1);
}

WeatherAnalytics::StartMethod_optional sub_20A17E5B8(Swift::String *a1)
{
  return StartMethod.init(rawValue:)(*a1);
}

uint64_t sub_20A17E5C4()
{
  return sub_20A188210();
}

uint64_t sub_20A17E64C(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26760EC50, MEMORY[0x263F24D10]);
}

uint64_t static ViewEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDD8, MEMORY[0x263F24D18], (uint64_t)qword_26760EC50, a1);
}

uint64_t static ViewEvent.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t sub_20A17E6B4(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760EC68, MEMORY[0x263F24DC8]);
}

uint64_t static ViewEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDE0, MEMORY[0x263F24DD8], (uint64_t)qword_26760EC68, a1);
}

uint64_t sub_20A17E714()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760EC80);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760EC80);
  return sub_20A187810();
}

uint64_t static ViewEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDE8, MEMORY[0x263F24DE8], (uint64_t)qword_26760EC80, a1);
}

uint64_t ViewEvent.viewData.getter@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t ViewEvent.viewData.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*ViewEvent.viewData.modify())()
{
  return nullsub_1;
}

uint64_t ViewEvent.privateUserData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ViewEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for ViewEvent()
{
  uint64_t result = qword_26760ECB0;
  if (!qword_26760ECB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ViewEvent.privateUserData.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ViewEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  return v6(v3, a1, v4);
}

uint64_t (*ViewEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t ViewEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t v4 = a1 + *(int *)(type metadata accessor for ViewEvent() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  return v7(v4, v2, v5);
}

uint64_t ViewEvent.Model.viewData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  __int16 v3 = *(_WORD *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t ViewEvent.Model.privateUserData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  *a1 = *(void *)(v1 + 24);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void __swiftcall ViewEvent.Model.init(viewData:privateUserData:)(WeatherAnalytics::ViewEvent::Model *__return_ptr retstr, WeatherAnalytics::ViewData viewData, WeatherAnalytics::PrivateUserData privateUserData)
{
  __int16 v3 = *(void **)(viewData.viewSessionID._countAndFlagsBits + 8);
  __int16 v4 = *(_WORD *)(viewData.viewSessionID._countAndFlagsBits + 16);
  uint64_t v5 = *(void *)viewData.viewSessionID._object;
  uint64_t v6 = (void *)*((void *)viewData.viewSessionID._object + 1);
  retstr->viewData.viewSessionID._countAndFlagsBits = *(void *)viewData.viewSessionID._countAndFlagsBits;
  retstr->viewData.viewSessionID._object = v3;
  *(_WORD *)&retstr->viewData.viewType = v4;
  retstr->privateUserData.privateUserID._countAndFlagsBits = v5;
  retstr->privateUserData.privateUserID._object = v6;
}

uint64_t sub_20A17EAEC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6174614477656976 && a2 == 0xE800000000000000;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5565746176697270 && a2 == 0xEF61746144726573)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A17EBEC(char a1)
{
  if (a1) {
    return 0x5565746176697270;
  }
  else {
    return 0x6174614477656976;
  }
}

uint64_t sub_20A17EC30()
{
  return sub_20A17EBEC(*v0);
}

uint64_t sub_20A17EC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A17EAEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A17EC60(uint64_t a1)
{
  unint64_t v2 = sub_20A17EE48();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A17EC9C(uint64_t a1)
{
  unint64_t v2 = sub_20A17EE48();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ViewEvent.Model.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EC98);
  OUTLINED_FUNCTION_2_0();
  uint64_t v18 = v4;
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  __int16 v10 = *((_WORD *)v1 + 8);
  uint64_t v11 = v1[3];
  uint64_t v15 = v1[4];
  uint64_t v16 = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A17EE48();
  sub_20A1887B0();
  uint64_t v19 = v9;
  uint64_t v20 = v8;
  __int16 v21 = v10;
  char v22 = 0;
  sub_20A0EBA0C();
  OUTLINED_FUNCTION_3_14();
  uint64_t v12 = v17;
  sub_20A188660();
  if (!v12)
  {
    uint64_t v19 = v16;
    uint64_t v20 = v15;
    char v22 = 1;
    sub_20A0DC128();
    OUTLINED_FUNCTION_3_14();
    sub_20A188660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v7, v3);
}

unint64_t sub_20A17EE48()
{
  unint64_t result = qword_26760ECA0;
  if (!qword_26760ECA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ECA0);
  }
  return result;
}

uint64_t ViewEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760ECA8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A17EE48();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A0EC06C();
  OUTLINED_FUNCTION_1_17();
  sub_20A1885A0();
  sub_20A0DC0DC();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_17();
  sub_20A1885A0();
  uint64_t v6 = OUTLINED_FUNCTION_2_12();
  v7(v6);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(unsigned char *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 17) = v12;
  *(void *)(a2 + 24) = v9;
  *(void *)(a2 + 32) = v10;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A17F070@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ViewEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A17F088(void *a1)
{
  return ViewEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ViewEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for ViewEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A17F584);
}

uint64_t sub_20A17F584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A17F61C);
}

uint64_t sub_20A17F61C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_20A17F6A8()
{
  sub_20A17F7E0(319, &qword_26AC41AB0, (void (*)(void))sub_20A0EC06C, (void (*)(void))sub_20A0EBA0C);
  if (v0 <= 0x3F)
  {
    sub_20A17F7E0(319, (unint64_t *)&qword_26AC41A30, (void (*)(void))sub_20A0DC0DC, (void (*)(void))sub_20A0DC128);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20A17F7E0(uint64_t a1, unint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  if (!*a2)
  {
    a3();
    a4();
    unint64_t v6 = sub_20A1875F0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t destroy for ViewEvent.Model()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ViewEvent.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ViewEvent.Model(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ViewEvent.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewEvent.Model(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for ViewEvent.Model(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewEvent.Model()
{
  return &type metadata for ViewEvent.Model;
}

unsigned char *storeEnumTagSinglePayload for ViewEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A17FB14);
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

ValueMetadata *type metadata accessor for ViewEvent.Model.CodingKeys()
{
  return &type metadata for ViewEvent.Model.CodingKeys;
}

unint64_t sub_20A17FB50()
{
  unint64_t result = qword_26760ECC0;
  if (!qword_26760ECC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ECC0);
  }
  return result;
}

unint64_t sub_20A17FBA0()
{
  unint64_t result = qword_26760ECC8;
  if (!qword_26760ECC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ECC8);
  }
  return result;
}

unint64_t sub_20A17FBF0()
{
  unint64_t result = qword_26760ECD0;
  if (!qword_26760ECD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ECD0);
  }
  return result;
}

uint64_t static ForecastAgeData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t ForecastAgeData.fetchDate.getter()
{
  return *v0;
}

uint64_t ForecastAgeData.fetchDate.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*ForecastAgeData.fetchDate.modify())()
{
  return nullsub_1;
}

uint64_t ForecastAgeData.init(fetchDate:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_20A17FC7C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7461446863746566 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_20A17FD0C()
{
  return 0x7461446863746566;
}

uint64_t sub_20A17FD2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A17FC7C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_20A17FD58(uint64_t a1)
{
  unint64_t v2 = sub_20A17FEB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A17FD94(uint64_t a1)
{
  unint64_t v2 = sub_20A17FEB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ForecastAgeData.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760ECD8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A17FEB8();
  sub_20A1887B0();
  sub_20A188670();
  uint64_t v3 = OUTLINED_FUNCTION_1();
  return v4(v3);
}

unint64_t sub_20A17FEB8()
{
  unint64_t result = qword_26760ECE0;
  if (!qword_26760ECE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ECE0);
  }
  return result;
}

uint64_t ForecastAgeData.init(from:)@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760ECE8);
  OUTLINED_FUNCTION_0_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A17FEB8();
  sub_20A188790();
  if (!v2)
  {
    int v6 = sub_20A1885B0();
    uint64_t v7 = OUTLINED_FUNCTION_1();
    v8(v7);
    *a2 = v6;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_20A180010@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return ForecastAgeData.init(from:)(a1, a2);
}

uint64_t sub_20A180028(void *a1)
{
  return ForecastAgeData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ForecastAgeData()
{
  return &type metadata for ForecastAgeData;
}

unsigned char *storeEnumTagSinglePayload for ForecastAgeData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x20A1800ECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForecastAgeData.CodingKeys()
{
  return &type metadata for ForecastAgeData.CodingKeys;
}

unint64_t sub_20A180128()
{
  unint64_t result = qword_26760ECF0;
  if (!qword_26760ECF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ECF0);
  }
  return result;
}

unint64_t sub_20A180178()
{
  unint64_t result = qword_26760ECF8;
  if (!qword_26760ECF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ECF8);
  }
  return result;
}

unint64_t sub_20A1801C8()
{
  unint64_t result = qword_26760ED00;
  if (!qword_26760ED00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ED00);
  }
  return result;
}

uint64_t sub_20A180214(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24D18], qword_26760ED08, MEMORY[0x263F24D10]);
}

uint64_t static ComponentEngagementEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDF0, MEMORY[0x263F24D18], (uint64_t)qword_26760ED08, a1);
}

uint64_t static ComponentEngagementEvent.requiresDiagnosticsConsent.getter()
{
  return 1;
}

uint64_t sub_20A18027C(uint64_t a1)
{
  return sub_20A0CF4A0(a1, MEMORY[0x263F24DD8], qword_26760ED20, MEMORY[0x263F24DC8]);
}

uint64_t static ComponentEngagementEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CDF8, MEMORY[0x263F24DD8], (uint64_t)qword_26760ED20, a1);
}

uint64_t sub_20A1802DC()
{
  uint64_t v0 = sub_20A187820();
  __swift_allocate_value_buffer(v0, qword_26760ED38);
  __swift_project_value_buffer(v0, (uint64_t)qword_26760ED38);
  return sub_20A187810();
}

uint64_t static ComponentEngagementEvent.timeDurationGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20A0D0C14(&qword_26760CE00, MEMORY[0x263F24DE8], (uint64_t)qword_26760ED38, a1);
}

uint64_t ComponentEngagementEvent.eventData.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.eventData.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.eventData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.timedData.getter()
{
  OUTLINED_FUNCTION_12_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for ComponentEngagementEvent(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760ED68);
}

uint64_t ComponentEngagementEvent.timedData.setter()
{
  type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.timedData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.orientationData.getter()
{
  OUTLINED_FUNCTION_12_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A18);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.orientationData.setter()
{
  type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A18);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.orientationData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.locationData.getter()
{
  OUTLINED_FUNCTION_12_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.locationData.setter()
{
  type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.locationData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.hostViewData.getter()
{
  OUTLINED_FUNCTION_12_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.hostViewData.setter()
{
  type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.hostViewData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.privateUserData.getter()
{
  OUTLINED_FUNCTION_12_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.privateUserData.setter()
{
  type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.privateUserData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.componentData.getter()
{
  OUTLINED_FUNCTION_12_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43758);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.componentData.setter()
{
  type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43758);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.componentData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.componentPositionData.getter()
{
  OUTLINED_FUNCTION_12_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43768);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.componentPositionData.setter()
{
  type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43768);
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t (*ComponentEngagementEvent.componentPositionData.modify())()
{
  return nullsub_1;
}

uint64_t ComponentEngagementEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(a1, v2);
  uint64_t v4 = type metadata accessor for ComponentEngagementEvent(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = OUTLINED_FUNCTION_6();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A18);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = OUTLINED_FUNCTION_6();
  v8(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = OUTLINED_FUNCTION_6();
  v10(v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = OUTLINED_FUNCTION_6();
  v12(v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
  OUTLINED_FUNCTION_1_0();
  uint64_t v13 = OUTLINED_FUNCTION_6();
  v14(v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43758);
  OUTLINED_FUNCTION_1_0();
  uint64_t v15 = OUTLINED_FUNCTION_6();
  v16(v15);
  uint64_t v17 = a1 + *(int *)(v4 + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43768);
  OUTLINED_FUNCTION_1_0();
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 104);
  return v20(v17, v2, v18);
}

uint64_t ComponentEngagementEvent.Model.eventData.getter()
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t ComponentEngagementEvent.Model.timedData.getter()
{
  OUTLINED_FUNCTION_11_17();
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_3();
  return v1(v0);
}

uint64_t type metadata accessor for ComponentEngagementEvent.Model(uint64_t a1)
{
  return sub_20A0CDAD8(a1, (uint64_t *)&unk_26760ED78);
}

uint64_t ComponentEngagementEvent.Model.orientationData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_17();
  _WORD *v0 = *(_WORD *)(v1 + *(int *)(result + 24));
  return result;
}

__n128 ComponentEngagementEvent.Model.locationData.getter()
{
  __n128 result = *(__n128 *)(v1 + *(int *)(OUTLINED_FUNCTION_11_17() + 28));
  __n128 *v0 = result;
  return result;
}

uint64_t ComponentEngagementEvent.Model.hostViewData.getter()
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_11_17() + 32));
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  LOWORD(v2) = *((_WORD *)v2 + 8);
  *(void *)uint64_t v0 = v4;
  *(void *)(v0 + 8) = v3;
  *(_WORD *)(v0 + 16) = (_WORD)v2;
  return swift_bridgeObjectRetain();
}

uint64_t ComponentEngagementEvent.Model.privateUserData.getter()
{
  uint64_t v2 = (void *)(v1 + *(int *)(OUTLINED_FUNCTION_11_17() + 36));
  uint64_t v3 = v2[1];
  void *v0 = *v2;
  v0[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t ComponentEngagementEvent.Model.componentData.getter()
{
  uint64_t result = OUTLINED_FUNCTION_11_17();
  unsigned char *v0 = *(unsigned char *)(v1 + *(int *)(result + 40));
  return result;
}

double ComponentEngagementEvent.Model.componentPositionData.getter()
{
  double result = *(double *)(v1 + *(int *)(OUTLINED_FUNCTION_11_17() + 44));
  double *v0 = result;
  return result;
}

uint64_t ComponentEngagementEvent.Model.init(eventData:timedData:orientationData:locationData:hostViewData:privateUserData:componentData:componentPositionData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, char *a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>)
{
  __int16 v13 = *a3;
  uint64_t v14 = *a4;
  uint64_t v15 = a4[1];
  uint64_t v16 = *a5;
  uint64_t v17 = a5[1];
  __int16 v18 = *((_WORD *)a5 + 8);
  uint64_t v19 = *a6;
  uint64_t v20 = a6[1];
  char v30 = *a7;
  sub_20A1879F0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v22 = *a8;
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(a9, a1);
  uint64_t v23 = (int *)type metadata accessor for ComponentEngagementEvent.Model(0);
  uint64_t v24 = a9 + v23[5];
  sub_20A187A10();
  OUTLINED_FUNCTION_1_0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 32))(v24, a2);
  *(_WORD *)(a9 + v23[6]) = v13;
  uint64_t v27 = (void *)(a9 + v23[7]);
  *uint64_t v27 = v14;
  v27[1] = v15;
  uint64_t v28 = a9 + v23[8];
  *(void *)uint64_t v28 = v16;
  *(void *)(v28 + 8) = v17;
  *(_WORD *)(v28 + 16) = v18;
  char v29 = (void *)(a9 + v23[9]);
  *char v29 = v19;
  v29[1] = v20;
  *(unsigned char *)(a9 + v23[10]) = v30;
  *(void *)(a9 + v23[11]) = v22;
  return result;
}

uint64_t sub_20A181150(char a1)
{
  uint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x4464656D6974;
      goto LABEL_4;
    case 2:
      uint64_t result = 0x7461746E6569726FLL;
      break;
    case 3:
      uint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 4:
      uint64_t result = 0x7765695674736F68;
      break;
    case 5:
      uint64_t result = 0x5565746176697270;
      break;
    case 6:
      uint64_t result = 0x6E656E6F706D6F63;
      break;
    case 7:
      return result;
    default:
      uint64_t v3 = 0x44746E657665;
LABEL_4:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7461000000000000;
      break;
  }
  return result;
}

uint64_t sub_20A18127C()
{
  return sub_20A181150(*v0);
}

uint64_t sub_20A181284(uint64_t a1)
{
  unint64_t v2 = sub_20A181600();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A1812C0(uint64_t a1)
{
  unint64_t v2 = sub_20A181600();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ComponentEngagementEvent.Model.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760ED50);
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A181600();
  sub_20A1887B0();
  sub_20A1879F0();
  sub_20A0CFC2C(&qword_26AC41AC8, MEMORY[0x263F24E70]);
  sub_20A188660();
  if (!v1)
  {
    type metadata accessor for ComponentEngagementEvent.Model(0);
    sub_20A187A10();
    sub_20A0CFC2C(&qword_26AC41AD0, MEMORY[0x263F24E90]);
    sub_20A188660();
    sub_20A0DC2EC();
    OUTLINED_FUNCTION_3_5();
    sub_20A0DC6A8();
    OUTLINED_FUNCTION_3_5();
    sub_20A0EBA0C();
    OUTLINED_FUNCTION_3_5();
    sub_20A0DC128();
    OUTLINED_FUNCTION_3_5();
    sub_20A0EFA60();
    OUTLINED_FUNCTION_3_5();
    sub_20A0EFAAC();
    OUTLINED_FUNCTION_3_5();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_20A181600()
{
  unint64_t result = qword_26760ED58;
  if (!qword_26760ED58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ED58);
  }
  return result;
}

uint64_t ComponentEngagementEvent.Model.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_20A187A10();
  OUTLINED_FUNCTION_2_0();
  uint64_t v23 = v4;
  uint64_t v24 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7();
  uint64_t v7 = v6 - v5;
  sub_20A1879F0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v25 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7();
  uint64_t v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760ED60);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_7();
  uint64_t v26 = (int *)type metadata accessor for ComponentEngagementEvent.Model(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_7();
  uint64_t v17 = v16 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A181600();
  sub_20A188790();
  if (v27) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_20A0CFC2C(&qword_26AC41950, MEMORY[0x263F24E70]);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t))(v25 + 32))(v17, v12);
  LOBYTE(v28) = 1;
  sub_20A0CFC2C(&qword_26AC41AD8, MEMORY[0x263F24E90]);
  sub_20A1885A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v17 + v26[5], v7, v24);
  sub_20A0DC2A0();
  OUTLINED_FUNCTION_10();
  *(_WORD *)(v17 + v26[6]) = v28;
  sub_20A0F0058();
  OUTLINED_FUNCTION_10();
  *(_OWORD *)(v17 + v26[7]) = v28;
  sub_20A0EC06C();
  OUTLINED_FUNCTION_10();
  uint64_t v18 = v17 + v26[8];
  *(_OWORD *)uint64_t v18 = v28;
  *(_WORD *)(v18 + 16) = v29;
  sub_20A0DC0DC();
  OUTLINED_FUNCTION_7_3();
  *(_OWORD *)(v17 + v26[9]) = v28;
  sub_20A0F00A4();
  OUTLINED_FUNCTION_7_3();
  *(unsigned char *)(v17 + v26[10]) = 1;
  sub_20A0F00F0();
  OUTLINED_FUNCTION_7_3();
  uint64_t v19 = OUTLINED_FUNCTION_9_2();
  v20(v19);
  *(void *)(v17 + v26[11]) = v28;
  sub_20A181BAC(v17, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_20A181C10(v17);
}

uint64_t sub_20A181BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComponentEngagementEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A181C10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ComponentEngagementEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A181C6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ComponentEngagementEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_20A181C84(void *a1)
{
  return ComponentEngagementEvent.Model.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for ComponentEngagementEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A181CC0);
}

uint64_t sub_20A181CC0(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A18);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v16 + 84) == a2)
        {
          uint64_t v8 = v15;
          uint64_t v12 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v18 + 84) == a2)
          {
            uint64_t v8 = v17;
            uint64_t v12 = a3[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
            OUTLINED_FUNCTION_0();
            if (*(_DWORD *)(v20 + 84) == a2)
            {
              uint64_t v8 = v19;
              uint64_t v12 = a3[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43758);
              OUTLINED_FUNCTION_0();
              if (*(_DWORD *)(v22 + 84) == a2)
              {
                uint64_t v8 = v21;
                uint64_t v12 = a3[10];
              }
              else
              {
                uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43768);
                uint64_t v12 = a3[11];
              }
            }
          }
        }
      }
    }
    uint64_t v9 = a1 + v12;
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ComponentEngagementEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A181E48);
}

uint64_t sub_20A181E48()
{
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419B0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) == v3)
    {
      uint64_t v6 = v8;
      uint64_t v10 = v2[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A18);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v12 + 84) == v3)
      {
        uint64_t v6 = v11;
        uint64_t v10 = v2[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AC419F8);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v14 + 84) == v3)
        {
          uint64_t v6 = v13;
          uint64_t v10 = v2[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41AA8);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v16 + 84) == v3)
          {
            uint64_t v6 = v15;
            uint64_t v10 = v2[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AC41A28);
            OUTLINED_FUNCTION_0();
            if (*(_DWORD *)(v18 + 84) == v3)
            {
              uint64_t v6 = v17;
              uint64_t v10 = v2[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43758);
              OUTLINED_FUNCTION_0();
              if (*(_DWORD *)(v20 + 84) == v3)
              {
                uint64_t v6 = v19;
                uint64_t v10 = v2[10];
              }
              else
              {
                uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC43768);
                uint64_t v10 = v2[11];
              }
            }
          }
        }
      }
    }
    uint64_t v7 = v1 + v10;
  }
  return __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

uint64_t getEnumTagSinglePayload for ComponentEngagementEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20A181FCC);
}

uint64_t sub_20A181FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_20A187A10();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentEngagementEvent.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20A182098);
}

void sub_20A182098()
{
  OUTLINED_FUNCTION_13();
  sub_20A1879F0();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    sub_20A187A10();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) != v3)
    {
      *(void *)(v1 + *(int *)(v2 + 32) + 8) = (v0 - 1);
      return;
    }
    uint64_t v6 = v8;
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }
  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

uint64_t sub_20A182140()
{
  uint64_t result = sub_20A1879F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_20A187A10();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ComponentEngagementEvent.Model.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A182310);
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

ValueMetadata *type metadata accessor for ComponentEngagementEvent.Model.CodingKeys()
{
  return &type metadata for ComponentEngagementEvent.Model.CodingKeys;
}

unint64_t sub_20A18234C()
{
  unint64_t result = qword_26760ED88;
  if (!qword_26760ED88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ED88);
  }
  return result;
}

unint64_t sub_20A18239C()
{
  unint64_t result = qword_26760ED90;
  if (!qword_26760ED90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ED90);
  }
  return result;
}

unint64_t sub_20A1823EC()
{
  unint64_t result = qword_26760ED98;
  if (!qword_26760ED98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760ED98);
  }
  return result;
}

uint64_t static URLData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t URLData.url.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t URLData.url.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*URLData.url.modify())()
{
  return nullsub_1;
}

void URLData.linkType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *URLData.linkType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*URLData.linkType.modify())()
{
  return nullsub_1;
}

WeatherAnalytics::URLData __swiftcall URLData.init(url:linkType:)(Swift::String url, WeatherAnalytics::LinkType linkType)
{
  char v3 = *(unsigned char *)linkType;
  *(Swift::String *)uint64_t v2 = url;
  *(unsigned char *)(v2 + 16) = v3;
  result.url = url;
  result.linkType = linkType;
  return result;
}

uint64_t sub_20A182510(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7107189 && a2 == 0xE300000000000000;
  if (v3 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657079546B6E696CLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_20A1886B0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_20A1825E8(char a1)
{
  if (a1) {
    return 0x657079546B6E696CLL;
  }
  else {
    return 7107189;
  }
}

uint64_t sub_20A182618()
{
  return sub_20A1825E8(*v0);
}

uint64_t sub_20A182620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A182510(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A182648(uint64_t a1)
{
  unint64_t v2 = sub_20A182828();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A182684(uint64_t a1)
{
  unint64_t v2 = sub_20A182828();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t URLData.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EDA0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v11 = v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A182828();
  sub_20A1887B0();
  char v15 = 0;
  sub_20A188620();
  if (!v2)
  {
    char v14 = v12;
    char v13 = 1;
    sub_20A182874();
    sub_20A188660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v8, v4);
}

unint64_t sub_20A182828()
{
  unint64_t result = qword_26760EDA8;
  if (!qword_26760EDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDA8);
  }
  return result;
}

unint64_t sub_20A182874()
{
  unint64_t result = qword_26760EDB0;
  if (!qword_26760EDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDB0);
  }
  return result;
}

uint64_t URLData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EDB8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A182828();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_20A188560();
  uint64_t v8 = v7;
  sub_20A182A74();
  swift_bridgeObjectRetain();
  sub_20A1885A0();
  uint64_t v9 = OUTLINED_FUNCTION_1_14();
  v10(v9);
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_20A182A74()
{
  unint64_t result = qword_26760EDC0;
  if (!qword_26760EDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDC0);
  }
  return result;
}

uint64_t sub_20A182AC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return URLData.init(from:)(a1, a2);
}

uint64_t sub_20A182AE0(void *a1)
{
  return URLData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for URLData()
{
  return &type metadata for URLData;
}

unsigned char *storeEnumTagSinglePayload for URLData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A182BD4);
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

ValueMetadata *type metadata accessor for URLData.CodingKeys()
{
  return &type metadata for URLData.CodingKeys;
}

unint64_t sub_20A182C10()
{
  unint64_t result = qword_26760EDC8;
  if (!qword_26760EDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDC8);
  }
  return result;
}

unint64_t sub_20A182C60()
{
  unint64_t result = qword_26760EDD0;
  if (!qword_26760EDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDD0);
  }
  return result;
}

unint64_t sub_20A182CB0()
{
  unint64_t result = qword_26760EDD8;
  if (!qword_26760EDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDD8);
  }
  return result;
}

WeatherAnalytics::EndReason_optional __swiftcall EndReason.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t EndReason.rawValue.getter()
{
  return *(void *)&aUnknown_53[8 * *v0];
}

uint64_t sub_20A182D78()
{
  return sub_20A10DF54();
}

unint64_t sub_20A182D88()
{
  unint64_t result = qword_26760EDE0;
  if (!qword_26760EDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDE0);
  }
  return result;
}

uint64_t sub_20A182DD4()
{
  return sub_20A1850FC(*v0);
}

uint64_t sub_20A182DDC()
{
  return sub_20A185188();
}

uint64_t sub_20A182DE4(uint64_t a1)
{
  return sub_20A186A6C(a1, *v1);
}

WeatherAnalytics::EndReason_optional sub_20A182DEC(Swift::String *a1)
{
  return EndReason.init(rawValue:)(*a1);
}

uint64_t sub_20A182DF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EndReason.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A182E20()
{
  return sub_20A188210();
}

uint64_t sub_20A182E80()
{
  return sub_20A188200();
}

unsigned char *storeEnumTagSinglePayload for EndReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A182F9CLL);
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

unint64_t sub_20A182FC4()
{
  unint64_t result = qword_26AC42460;
  if (!qword_26AC42460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC42460);
  }
  return result;
}

WeatherAnalytics::MapOverlay_optional __swiftcall MapOverlay.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t MapOverlay.rawValue.getter()
{
  return *(void *)&aPrecipittemper_0[8 * *v0];
}

uint64_t sub_20A18308C()
{
  return sub_20A10F7E0();
}

unint64_t sub_20A18309C()
{
  unint64_t result = qword_26760EDE8;
  if (!qword_26760EDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDE8);
  }
  return result;
}

uint64_t sub_20A1830E8()
{
  return sub_20A185114(*v0);
}

uint64_t sub_20A1830F0()
{
  return sub_20A1860B8();
}

uint64_t sub_20A1830F8(uint64_t a1)
{
  return sub_20A1863EC(a1, *v1);
}

WeatherAnalytics::MapOverlay_optional sub_20A183100(Swift::String *a1)
{
  return MapOverlay.init(rawValue:)(*a1);
}

uint64_t sub_20A18310C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MapOverlay.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A183134()
{
  return sub_20A188210();
}

uint64_t sub_20A183194()
{
  return sub_20A188200();
}

unsigned char *storeEnumTagSinglePayload for MapOverlay(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A1832B0);
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

ValueMetadata *type metadata accessor for MapOverlay()
{
  return &type metadata for MapOverlay;
}

unint64_t sub_20A1832E8()
{
  unint64_t result = qword_26760EDF0;
  if (!qword_26760EDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EDF0);
  }
  return result;
}

uint64_t static LocationViewLoadErrorData.requiresDiagnosticsConsent.getter()
{
  return 0;
}

uint64_t LocationViewLoadErrorData.errorDescriptions.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LocationViewLoadErrorData.errorDescriptions.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LocationViewLoadErrorData.errorDescriptions.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.missingCurrent.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t LocationViewLoadErrorData.missingCurrent.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.missingCurrent.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.missingDaily.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t LocationViewLoadErrorData.missingDaily.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 17) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.missingDaily.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.missingHourly.getter()
{
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t LocationViewLoadErrorData.missingHourly.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 18) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.missingHourly.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.insufficientDays.getter()
{
  return *(unsigned __int8 *)(v0 + 19);
}

uint64_t LocationViewLoadErrorData.insufficientDays.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 19) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.insufficientDays.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.insufficientHours.getter()
{
  return *(unsigned __int8 *)(v0 + 20);
}

uint64_t LocationViewLoadErrorData.insufficientHours.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 20) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.insufficientHours.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.unexpectedDateFormat.getter()
{
  return *(unsigned __int8 *)(v0 + 21);
}

uint64_t LocationViewLoadErrorData.unexpectedDateFormat.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 21) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.unexpectedDateFormat.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.missingResponse.getter()
{
  return *(unsigned __int8 *)(v0 + 22);
}

uint64_t LocationViewLoadErrorData.missingResponse.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 22) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.missingResponse.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.failedToCreateResponseModel.getter()
{
  return *(unsigned __int8 *)(v0 + 23);
}

uint64_t LocationViewLoadErrorData.failedToCreateResponseModel.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 23) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.failedToCreateResponseModel.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.invalidAuthorization.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t LocationViewLoadErrorData.invalidAuthorization.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.invalidAuthorization.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.responseFailed.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t LocationViewLoadErrorData.responseFailed.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.responseFailed.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.invalidJWTResponse.getter()
{
  return *(unsigned __int8 *)(v0 + 26);
}

uint64_t LocationViewLoadErrorData.invalidJWTResponse.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 26) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.invalidJWTResponse.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.invalidBundleIdentifier.getter()
{
  return *(unsigned __int8 *)(v0 + 27);
}

uint64_t LocationViewLoadErrorData.invalidBundleIdentifier.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 27) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.invalidBundleIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.failedToGenerateSigningRequestData.getter()
{
  return *(unsigned __int8 *)(v0 + 28);
}

uint64_t LocationViewLoadErrorData.failedToGenerateSigningRequestData.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 28) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.failedToGenerateSigningRequestData.modify())()
{
  return nullsub_1;
}

uint64_t LocationViewLoadErrorData.invalidServerResponseForJWTToken.getter()
{
  return *(unsigned __int8 *)(v0 + 29);
}

uint64_t LocationViewLoadErrorData.invalidServerResponseForJWTToken.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 29) = result;
  return result;
}

uint64_t (*LocationViewLoadErrorData.invalidServerResponseForJWTToken.modify())()
{
  return nullsub_1;
}

WeatherAnalytics::LocationViewLoadErrorData __swiftcall LocationViewLoadErrorData.init(errorDescriptions:missingCurrent:missingDaily:missingHourly:insufficientDays:insufficientHours:unexpectedDateFormat:missingResponse:failedToCreateResponseModel:invalidAuthorization:responseFailed:invalidJWTResponse:invalidBundleIdentifier:failedToGenerateSigningRequestData:invalidServerResponseForJWTToken:)(Swift::String errorDescriptions, Swift::Bool missingCurrent, Swift::Bool missingDaily, Swift::Bool missingHourly, Swift::Bool insufficientDays, Swift::Bool insufficientHours, Swift::Bool unexpectedDateFormat, Swift::Bool missingResponse, Swift::Bool failedToCreateResponseModel, Swift::Bool invalidAuthorization, Swift::Bool responseFailed, Swift::Bool invalidJWTResponse, Swift::Bool invalidBundleIdentifier, Swift::Bool failedToGenerateSigningRequestData, Swift::Bool invalidServerResponseForJWTToken)
{
  *(Swift::String *)uint64_t v15 = errorDescriptions;
  *(unsigned char *)(v15 + 16) = missingCurrent;
  *(unsigned char *)(v15 + 17) = missingDaily;
  *(unsigned char *)(v15 + 18) = missingHourly;
  *(unsigned char *)(v15 + 19) = insufficientDays;
  *(unsigned char *)(v15 + 20) = insufficientHours;
  *(unsigned char *)(v15 + 21) = unexpectedDateFormat;
  *(unsigned char *)(v15 + 22) = missingResponse;
  *(unsigned char *)(v15 + 23) = failedToCreateResponseModel;
  *(unsigned char *)(v15 + 24) = invalidAuthorization;
  *(unsigned char *)(v15 + 25) = responseFailed;
  *(unsigned char *)(v15 + 26) = invalidJWTResponse;
  *(unsigned char *)(v15 + 27) = invalidBundleIdentifier;
  *(unsigned char *)(v15 + 28) = failedToGenerateSigningRequestData;
  *(unsigned char *)(v15 + 29) = invalidServerResponseForJWTToken;
  result.errorDescriptions = errorDescriptions;
  result.invalidAuthorization = missingDaily;
  result.missingCurrent = missingCurrent;
  return result;
}

uint64_t sub_20A1836C4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000020A19C110 || (sub_20A1886B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x43676E697373696DLL && a2 == 0xEE00746E65727275;
    if (v5 || (sub_20A1886B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v6 = a1 == 0x44676E697373696DLL && a2 == 0xEC000000796C6961;
      if (v6 || (sub_20A1886B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v7 = a1 == 0x48676E697373696DLL && a2 == 0xED0000796C72756FLL;
        if (v7 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000010 && a2 == 0x800000020A19DBA0 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0xD000000000000011 && a2 == 0x800000020A19DBC0 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else if (a1 == 0xD000000000000014 && a2 == 0x800000020A19DBE0 || (sub_20A1886B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 6;
        }
        else
        {
          BOOL v8 = a1 == 0x52676E697373696DLL && a2 == 0xEF65736E6F707365;
          if (v8 || (sub_20A1886B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else if (a1 == 0xD00000000000001BLL && a2 == 0x800000020A19DC00 || (sub_20A1886B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 8;
          }
          else if (a1 == 0xD000000000000014 && a2 == 0x800000020A19DC20 || (sub_20A1886B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 9;
          }
          else
          {
            BOOL v9 = a1 == 0x65736E6F70736572 && a2 == 0xEE0064656C696146;
            if (v9 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 10;
            }
            else if (a1 == 0xD000000000000012 && a2 == 0x800000020A19DC40 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 11;
            }
            else if (a1 == 0xD000000000000017 && a2 == 0x800000020A19DC60 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 12;
            }
            else if (a1 == 0xD000000000000022 && a2 == 0x800000020A19DC80 || (sub_20A1886B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 13;
            }
            else if (a1 == 0xD000000000000020 && a2 == 0x800000020A19DCB0)
            {
              swift_bridgeObjectRelease();
              return 14;
            }
            else
            {
              char v10 = sub_20A1886B0();
              swift_bridgeObjectRelease();
              if (v10) {
                return 14;
              }
              else {
                return 15;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_20A183C98()
{
  return 15;
}

unint64_t sub_20A183CA0(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x43676E697373696DLL;
      break;
    case 2:
      unint64_t result = 0x44676E697373696DLL;
      break;
    case 3:
      unint64_t result = 0x48676E697373696DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
      unint64_t result = 0x52676E697373696DLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 10:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 11:
      unint64_t result = 0xD000000000000012;
      break;
    case 12:
      unint64_t result = 0xD000000000000017;
      break;
    case 13:
      unint64_t result = 0xD000000000000022;
      break;
    case 14:
      unint64_t result = 0xD000000000000020;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_20A183E60()
{
  return sub_20A183CA0(*v0);
}

uint64_t sub_20A183E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20A1836C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_20A183E90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20A183C98();
  *a1 = result;
  return result;
}

uint64_t sub_20A183EB8(uint64_t a1)
{
  unint64_t v2 = sub_20A184280();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_20A183EF4(uint64_t a1)
{
  unint64_t v2 = sub_20A184280();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LocationViewLoadErrorData.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26760EDF8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  BOOL v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v9 = v1[16];
  v18[14] = v1[17];
  v18[15] = v9;
  int v10 = v1[18];
  v18[12] = v1[19];
  v18[13] = v10;
  int v11 = v1[20];
  v18[10] = v1[21];
  v18[11] = v11;
  int v12 = v1[22];
  v18[8] = v1[23];
  v18[9] = v12;
  int v13 = v1[24];
  v18[6] = v1[25];
  v18[7] = v13;
  int v14 = v1[26];
  v18[4] = v1[27];
  void v18[5] = v14;
  int v15 = v1[28];
  v18[2] = v1[29];
  v18[3] = v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A184280();
  sub_20A1887B0();
  char v34 = 0;
  uint64_t v16 = v19;
  sub_20A188620();
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  }
  uint64_t v19 = v5;
  char v33 = 1;
  OUTLINED_FUNCTION_1_30();
  char v32 = 2;
  OUTLINED_FUNCTION_1_30();
  char v31 = 3;
  OUTLINED_FUNCTION_1_30();
  char v30 = 4;
  OUTLINED_FUNCTION_1_30();
  char v29 = 5;
  OUTLINED_FUNCTION_1_30();
  char v28 = 6;
  OUTLINED_FUNCTION_1_30();
  char v27 = 7;
  OUTLINED_FUNCTION_1_30();
  char v26 = 8;
  OUTLINED_FUNCTION_1_30();
  char v25 = 9;
  OUTLINED_FUNCTION_1_30();
  char v24 = 10;
  sub_20A188630();
  char v23 = 11;
  OUTLINED_FUNCTION_3_33();
  char v22 = 12;
  OUTLINED_FUNCTION_3_33();
  char v21 = 13;
  OUTLINED_FUNCTION_3_33();
  char v20 = 14;
  OUTLINED_FUNCTION_3_33();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v8, v3);
}

unint64_t sub_20A184280()
{
  unint64_t result = qword_26760EE00;
  if (!qword_26760EE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EE00);
  }
  return result;
}

uint64_t LocationViewLoadErrorData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26760EE08);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_20A184280();
  sub_20A188790();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v7 = sub_20A188560();
  uint64_t v9 = v8;
  swift_bridgeObjectRetain();
  char v25 = OUTLINED_FUNCTION_0_19();
  char v24 = OUTLINED_FUNCTION_0_19();
  char v23 = OUTLINED_FUNCTION_0_19();
  char v22 = OUTLINED_FUNCTION_0_19();
  char v21 = OUTLINED_FUNCTION_0_19();
  char v20 = OUTLINED_FUNCTION_0_19();
  char v19 = OUTLINED_FUNCTION_0_19();
  char v18 = OUTLINED_FUNCTION_0_19();
  char v17 = OUTLINED_FUNCTION_0_19();
  char v16 = OUTLINED_FUNCTION_0_19();
  char v15 = OUTLINED_FUNCTION_0_19();
  char v14 = OUTLINED_FUNCTION_0_19();
  char v13 = OUTLINED_FUNCTION_0_19();
  char v10 = OUTLINED_FUNCTION_0_19();
  uint64_t v11 = OUTLINED_FUNCTION_5_21();
  v12(v11);
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 16) = v25 & 1;
  *(unsigned char *)(a2 + 17) = v24 & 1;
  *(unsigned char *)(a2 + 18) = v23 & 1;
  *(unsigned char *)(a2 + 19) = v22 & 1;
  *(unsigned char *)(a2 + 20) = v21 & 1;
  *(unsigned char *)(a2 + 21) = v20 & 1;
  *(unsigned char *)(a2 + 22) = v19 & 1;
  *(unsigned char *)(a2 + 23) = v18 & 1;
  *(unsigned char *)(a2 + 24) = v17 & 1;
  *(unsigned char *)(a2 + 25) = v16 & 1;
  *(unsigned char *)(a2 + 26) = v15 & 1;
  *(unsigned char *)(a2 + 27) = v14 & 1;
  *(unsigned char *)(a2 + 28) = v13 & 1;
  *(unsigned char *)(a2 + 29) = v10 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1846EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LocationViewLoadErrorData.init(from:)(a1, a2);
}

uint64_t sub_20A184704(void *a1)
{
  return LocationViewLoadErrorData.encode(to:)(a1);
}

uint64_t initializeWithCopy for LocationViewLoadErrorData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_WORD *)(a1 + 28) = *(_WORD *)(a2 + 28);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LocationViewLoadErrorData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  *(unsigned char *)(a1 + 22) = *(unsigned char *)(a2 + 22);
  *(unsigned char *)(a1 + 23) = *(unsigned char *)(a2 + 23);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 27);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(unsigned char *)(a1 + 29) = *(unsigned char *)(a2 + 29);
  return a1;
}

__n128 __swift_memcpy30_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 14) = *(_OWORD *)(a2 + 14);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LocationViewLoadErrorData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  *(unsigned char *)(a1 + 22) = *(unsigned char *)(a2 + 22);
  *(unsigned char *)(a1 + 23) = *(unsigned char *)(a2 + 23);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 27);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(unsigned char *)(a1 + 29) = *(unsigned char *)(a2 + 29);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationViewLoadErrorData(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 30))
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

uint64_t storeEnumTagSinglePayload for LocationViewLoadErrorData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 28) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 30) = 1;
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
    *(unsigned char *)(result + 30) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationViewLoadErrorData()
{
  return &type metadata for LocationViewLoadErrorData;
}

unsigned char *storeEnumTagSinglePayload for LocationViewLoadErrorData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 14;
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
        JUMPOUT(0x20A184A44);
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
          *__n128 result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationViewLoadErrorData.CodingKeys()
{
  return &type metadata for LocationViewLoadErrorData.CodingKeys;
}

unint64_t sub_20A184A80()
{
  unint64_t result = qword_26760EE10;
  if (!qword_26760EE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EE10);
  }
  return result;
}

unint64_t sub_20A184AD0()
{
  unint64_t result = qword_26760EE18;
  if (!qword_26760EE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EE18);
  }
  return result;
}

unint64_t sub_20A184B20()
{
  unint64_t result = qword_26760EE20;
  if (!qword_26760EE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EE20);
  }
  return result;
}

unsigned char *Configuration.init(enablement:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t getEnumTagSinglePayload for Configuration.Enablement(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x20A184C5CLL);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = (v7 + 2147483646) & 0x7FFFFFFF;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for Configuration.Enablement(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x20A184D44);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_20A184D6C(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_20A184D88(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for Configuration.Enablement()
{
  return &type metadata for Configuration.Enablement;
}

uint64_t sub_20A184DB0(uint64_t a1)
{
  return sub_20A186A00(0, a1, (void (*)(uint64_t))LocationCondition.rawValue.getter);
}

uint64_t sub_20A184DE4(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A18542C);
}

uint64_t sub_20A184DFC()
{
  return sub_20A18650C();
}

uint64_t sub_20A184E08(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A1855E8);
}

uint64_t sub_20A184E20(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A18606C);
}

uint64_t sub_20A184E38(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A1861EC);
}

uint64_t sub_20A184E50(uint64_t a1)
{
  return sub_20A186A00(0, a1, (void (*)(uint64_t))DetailType.rawValue.getter);
}

uint64_t sub_20A184E84(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A1851EC);
}

uint64_t sub_20A184E9C(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185550);
}

uint64_t sub_20A184EB4(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185B44);
}

uint64_t sub_20A184ECC()
{
  return sub_20A186578();
}

uint64_t sub_20A184ED8()
{
  return sub_20A1862E8();
}

uint64_t sub_20A184EE4()
{
  return sub_20A18636C();
}

uint64_t sub_20A184EF0(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185728);
}

uint64_t sub_20A184F08()
{
  return sub_20A1868E0();
}

uint64_t sub_20A184F14()
{
  return sub_20A186748();
}

uint64_t sub_20A184F20()
{
  return sub_20A186614();
}

uint64_t sub_20A184F2C(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185868);
}

uint64_t sub_20A184F44(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185908);
}

uint64_t sub_20A184F5C()
{
  return sub_20A186470();
}

uint64_t sub_20A184F68(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185A68);
}

uint64_t sub_20A184F80()
{
  return sub_20A186808();
}

uint64_t sub_20A184F8C(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A186284);
}

uint64_t sub_20A184FA4(uint64_t a1)
{
  return sub_20A186A00(0, a1, (void (*)(uint64_t))ComponentType.rawValue.getter);
}

uint64_t sub_20A184FD8()
{
  return sub_20A18641C();
}

uint64_t sub_20A184FE4()
{
  return sub_20A18697C();
}

uint64_t sub_20A184FF0(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185E60);
}

uint64_t sub_20A185008(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185504);
}

uint64_t sub_20A185020(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185350);
}

uint64_t sub_20A185038(uint64_t a1)
{
  return sub_20A186A00(0, a1, (void (*)(uint64_t))Condition.rawValue.getter);
}

uint64_t sub_20A18506C(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185C40);
}

uint64_t sub_20A185084()
{
  return sub_20A18688C();
}

uint64_t sub_20A185090()
{
  return sub_20A18679C();
}

uint64_t sub_20A18509C(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A18578C);
}

uint64_t sub_20A1850B4(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185A1C);
}

uint64_t sub_20A1850CC(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185284);
}

uint64_t sub_20A1850E4(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185D80);
}

uint64_t sub_20A1850FC(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A185188);
}

uint64_t sub_20A185114(uint64_t a1)
{
  return sub_20A18512C(a1, (void (*)(unsigned char *, uint64_t))sub_20A1860B8);
}

uint64_t sub_20A18512C(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_20A188750();
  a2(v5, a1);
  return sub_20A188770();
}

uint64_t sub_20A18517C()
{
  return sub_20A186680();
}

uint64_t sub_20A185188()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1851D4(uint64_t a1, uint64_t a2)
{
  return sub_20A186188(a1, a2, (void (*)(void))Condition.rawValue.getter);
}

uint64_t sub_20A1851EC()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185238()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185284()
{
  OUTLINED_FUNCTION_4_23();
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185350()
{
  OUTLINED_FUNCTION_7_14();
  switch(v0)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      break;
    default:
      OUTLINED_FUNCTION_0_20();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A18542C()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185478()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1854C4()
{
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185504()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185550()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A18559C()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1855E8()
{
  OUTLINED_FUNCTION_4_23();
  switch(v0)
  {
    case 1:
      OUTLINED_FUNCTION_6_20();
      break;
    case 2:
      break;
    case 3:
      OUTLINED_FUNCTION_19();
      goto LABEL_6;
    case 4:
      OUTLINED_FUNCTION_17();
LABEL_6:
      OUTLINED_FUNCTION_8_20();
      break;
    default:
      OUTLINED_FUNCTION_0_20();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185690()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1856DC()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185728()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185774(uint64_t a1, uint64_t a2)
{
  return sub_20A186188(a1, a2, (void (*)(void))LocationCondition.rawValue.getter);
}

uint64_t sub_20A18578C()
{
  OUTLINED_FUNCTION_4_23();
  switch(v0)
  {
    case 1:
      OUTLINED_FUNCTION_6_20();
      break;
    case 2:
    case 5:
    case 6:
      break;
    case 3:
      OUTLINED_FUNCTION_19();
      goto LABEL_6;
    case 4:
      OUTLINED_FUNCTION_17();
LABEL_6:
      OUTLINED_FUNCTION_8_20();
      break;
    default:
      OUTLINED_FUNCTION_0_20();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185868()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1858B4()
{
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185908()
{
  OUTLINED_FUNCTION_4_23();
  switch(v0)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      break;
    default:
      OUTLINED_FUNCTION_0_20();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1859D0()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185A1C()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185A68()
{
  OUTLINED_FUNCTION_7_14();
  switch(v0)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      break;
    default:
      OUTLINED_FUNCTION_0_20();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185B44()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185B90()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185BDC(uint64_t a1, uint64_t a2)
{
  return sub_20A186188(a1, a2, (void (*)(void))ComponentType.rawValue.getter);
}

uint64_t sub_20A185BF4()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185C40()
{
  OUTLINED_FUNCTION_7_14();
  switch(v0)
  {
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      break;
    case 8:
      OUTLINED_FUNCTION_0_20();
      break;
    default:
      OUTLINED_FUNCTION_5_22();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185D80()
{
  OUTLINED_FUNCTION_4_23();
  switch(v0)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      break;
    default:
      OUTLINED_FUNCTION_0_20();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185E60()
{
  OUTLINED_FUNCTION_4_23();
  switch(v0)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      break;
    default:
      OUTLINED_FUNCTION_0_20();
      break;
  }
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A185FD4()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A186020()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A18606C()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1860B8()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A186104()
{
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A186170(uint64_t a1, uint64_t a2)
{
  return sub_20A186188(a1, a2, (void (*)(void))DetailType.rawValue.getter);
}

uint64_t sub_20A186188(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_20A188180();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1861EC()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A186238()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A186284()
{
  OUTLINED_FUNCTION_1_31();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A1862D0(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A186284);
}

uint64_t sub_20A1862E8()
{
  return sub_20A188770();
}

uint64_t sub_20A18633C(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A1861EC);
}

uint64_t sub_20A186354(uint64_t a1, uint64_t a2)
{
  return sub_20A186A00(a1, a2, (void (*)(uint64_t))DetailType.rawValue.getter);
}

uint64_t sub_20A18636C()
{
  return sub_20A188770();
}

uint64_t sub_20A1863EC(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A1860B8);
}

uint64_t sub_20A186404(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A18606C);
}

uint64_t sub_20A18641C()
{
  return sub_20A188770();
}

uint64_t sub_20A186470()
{
  return sub_20A188770();
}

uint64_t sub_20A1864C4(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185E60);
}

uint64_t sub_20A1864DC(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185D80);
}

uint64_t sub_20A1864F4(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185C40);
}

uint64_t sub_20A18650C()
{
  return sub_20A188770();
}

uint64_t sub_20A186560(uint64_t a1, uint64_t a2)
{
  return sub_20A186A00(a1, a2, (void (*)(uint64_t))ComponentType.rawValue.getter);
}

uint64_t sub_20A186578()
{
  return sub_20A188770();
}

uint64_t sub_20A1865CC(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185B44);
}

uint64_t sub_20A1865E4(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185A68);
}

uint64_t sub_20A1865FC(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185A1C);
}

uint64_t sub_20A186614()
{
  return sub_20A188770();
}

uint64_t sub_20A186668(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185908);
}

uint64_t sub_20A186680()
{
  return sub_20A188770();
}

uint64_t sub_20A1866E8(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185868);
}

uint64_t sub_20A186700(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A18578C);
}

uint64_t sub_20A186718(uint64_t a1, uint64_t a2)
{
  return sub_20A186A00(a1, a2, (void (*)(uint64_t))LocationCondition.rawValue.getter);
}

uint64_t sub_20A186730(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185728);
}

uint64_t sub_20A186748()
{
  return sub_20A188770();
}

uint64_t sub_20A18679C()
{
  return sub_20A188770();
}

uint64_t sub_20A1867F0(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A1855E8);
}

uint64_t sub_20A186808()
{
  return sub_20A188770();
}

uint64_t sub_20A18685C(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185550);
}

uint64_t sub_20A186874(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185504);
}

uint64_t sub_20A18688C()
{
  return sub_20A188770();
}

uint64_t sub_20A1868E0()
{
  return sub_20A188770();
}

uint64_t sub_20A186934(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A18542C);
}

uint64_t sub_20A18694C(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185350);
}

uint64_t sub_20A186964(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185284);
}

uint64_t sub_20A18697C()
{
  return sub_20A188770();
}

uint64_t sub_20A1869D0(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A1851EC);
}

uint64_t sub_20A1869E8(uint64_t a1, uint64_t a2)
{
  return sub_20A186A00(a1, a2, (void (*)(uint64_t))Condition.rawValue.getter);
}

uint64_t sub_20A186A00(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_20A188750();
  a3(v4);
  sub_20A188180();
  swift_bridgeObjectRelease();
  return sub_20A188770();
}

uint64_t sub_20A186A6C(uint64_t a1, uint64_t a2)
{
  return sub_20A186A84(a1, a2, (void (*)(unsigned char *, uint64_t))sub_20A185188);
}

uint64_t sub_20A186A84(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_20A188750();
  a3(v6, a2);
  return sub_20A188770();
}

WeatherAnalytics::OsInstallVariant_optional __swiftcall OsInstallVariant.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  unint64_t v3 = sub_20A188500();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *BOOL v2 = v5;
  return result;
}

uint64_t sub_20A186B2C()
{
  return sub_20A10EA78();
}

unint64_t sub_20A186B3C()
{
  unint64_t result = qword_26760EE28;
  if (!qword_26760EE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26760EE28);
  }
  return result;
}

uint64_t sub_20A186B88()
{
  return sub_20A18517C();
}

uint64_t sub_20A186B90()
{
  return sub_20A1858B4();
}

uint64_t sub_20A186B98()
{
  return sub_20A186680();
}

WeatherAnalytics::OsInstallVariant_optional sub_20A186BA0(Swift::String *a1)
{
  return OsInstallVariant.init(rawValue:)(*a1);
}

uint64_t sub_20A186BAC()
{
  return sub_20A188210();
}

unsigned char *storeEnumTagSinglePayload for OsInstallVariant(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20A186CD8);
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

uint64_t sub_20A186D00()
{
  return MEMORY[0x270EEDEA0]();
}

uint64_t sub_20A186D10()
{
  return MEMORY[0x270EEDEB8]();
}

uint64_t sub_20A186D20()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_20A186D30()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_20A186D40()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_20A186D50()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_20A186D60()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_20A186D70()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_20A186D80()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_20A186D90()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_20A186DA0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_20A186DB0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_20A186DC0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_20A186DD0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_20A186DE0()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_20A186DF0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_20A186E00()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_20A186E10()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_20A186E20()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_20A186E30()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_20A186E40()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_20A186E50()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_20A186E60()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_20A186E70()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_20A186E80()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_20A186E90()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_20A186EA0()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_20A186EB0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_20A186EC0()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_20A186ED0()
{
  return MEMORY[0x270EF1050]();
}

uint64_t sub_20A186EE0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_20A186EF0()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_20A186F00()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_20A186F10()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_20A186F20()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_20A186F30()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_20A186F40()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_20A186F50()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_20A186F60()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_20A186F70()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_20A186F80()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_20A186F90()
{
  return MEMORY[0x270EF15A0]();
}

uint64_t sub_20A186FA0()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_20A186FB0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_20A186FC0()
{
  return MEMORY[0x270F84B10]();
}

uint64_t sub_20A186FF0()
{
  return MEMORY[0x270F7A890]();
}

uint64_t sub_20A187010()
{
  return MEMORY[0x270F7A8D8]();
}

uint64_t sub_20A187020()
{
  return MEMORY[0x270F7A8E0]();
}

uint64_t sub_20A187030()
{
  return MEMORY[0x270F7A8F0]();
}

uint64_t sub_20A187040()
{
  return MEMORY[0x270F7A920]();
}

uint64_t sub_20A187050()
{
  return MEMORY[0x270F84B28]();
}

uint64_t sub_20A187060()
{
  return MEMORY[0x270F7A928]();
}

uint64_t sub_20A187080()
{
  return MEMORY[0x270F7A950]();
}

uint64_t sub_20A187090()
{
  return MEMORY[0x270F7A960]();
}

uint64_t sub_20A1870A0()
{
  return MEMORY[0x270F7A970]();
}

uint64_t sub_20A1870B0()
{
  return MEMORY[0x270F7A980]();
}

uint64_t sub_20A1870C0()
{
  return MEMORY[0x270F84FE0]();
}

uint64_t sub_20A1870D0()
{
  return MEMORY[0x270F7A9A0]();
}

uint64_t sub_20A1870E0()
{
  return MEMORY[0x270F84B70]();
}

uint64_t sub_20A1870F0()
{
  return MEMORY[0x270F84B78]();
}

uint64_t sub_20A187100()
{
  return MEMORY[0x270F84BE0]();
}

uint64_t sub_20A187110()
{
  return MEMORY[0x270F84BE8]();
}

uint64_t sub_20A187120()
{
  return MEMORY[0x270F84BF0]();
}

uint64_t sub_20A187130()
{
  return MEMORY[0x270F84BF8]();
}

uint64_t sub_20A187140()
{
  return MEMORY[0x270F84C08]();
}

uint64_t sub_20A187150()
{
  return MEMORY[0x270F84C10]();
}

uint64_t sub_20A187160()
{
  return MEMORY[0x270F84C18]();
}

uint64_t sub_20A187170()
{
  return MEMORY[0x270F84C20]();
}

uint64_t sub_20A187180()
{
  return MEMORY[0x270F84C30]();
}

uint64_t sub_20A187190()
{
  return MEMORY[0x270F84C38]();
}

uint64_t sub_20A1871B0()
{
  return MEMORY[0x270F84D50]();
}

uint64_t sub_20A1871C0()
{
  return MEMORY[0x270F84D58]();
}

uint64_t sub_20A1871D0()
{
  return MEMORY[0x270F84D60]();
}

uint64_t sub_20A1871E0()
{
  return MEMORY[0x270F84D68]();
}

uint64_t sub_20A1871F0()
{
  return MEMORY[0x270F84D70]();
}

uint64_t sub_20A187200()
{
  return MEMORY[0x270F84D78]();
}

uint64_t sub_20A187210()
{
  return MEMORY[0x270F84D88]();
}

uint64_t sub_20A187220()
{
  return MEMORY[0x270F84DA0]();
}

uint64_t sub_20A187230()
{
  return MEMORY[0x270F84DA8]();
}

uint64_t sub_20A187240()
{
  return MEMORY[0x270F84DB0]();
}

uint64_t sub_20A187250()
{
  return MEMORY[0x270F84DB8]();
}

uint64_t sub_20A187260()
{
  return MEMORY[0x270F84DC0]();
}

uint64_t sub_20A187270()
{
  return MEMORY[0x270F84DC8]();
}

uint64_t sub_20A187280()
{
  return MEMORY[0x270F84DD0]();
}

uint64_t sub_20A187290()
{
  return MEMORY[0x270F84DD8]();
}

uint64_t sub_20A1872A0()
{
  return MEMORY[0x270F84DE0]();
}

uint64_t sub_20A1872B0()
{
  return MEMORY[0x270F84DE8]();
}

uint64_t sub_20A1872C0()
{
  return MEMORY[0x270F84E18]();
}

uint64_t sub_20A1872D0()
{
  return MEMORY[0x270F84E20]();
}

uint64_t sub_20A1872E0()
{
  return MEMORY[0x270F84E28]();
}

uint64_t sub_20A1872F0()
{
  return MEMORY[0x270F84E30]();
}

uint64_t sub_20A187300()
{
  return MEMORY[0x270F84E38]();
}

uint64_t sub_20A187310()
{
  return MEMORY[0x270F84E40]();
}

uint64_t sub_20A187320()
{
  return MEMORY[0x270F84E48]();
}

uint64_t sub_20A187330()
{
  return MEMORY[0x270F84E50]();
}

uint64_t sub_20A187340()
{
  return MEMORY[0x270F84E58]();
}

uint64_t sub_20A187350()
{
  return MEMORY[0x270F84E60]();
}

uint64_t sub_20A187360()
{
  return MEMORY[0x270F84E68]();
}

uint64_t sub_20A187370()
{
  return MEMORY[0x270F84E90]();
}

uint64_t sub_20A187380()
{
  return MEMORY[0x270F84EA0]();
}

uint64_t sub_20A187390()
{
  return MEMORY[0x270F84EB8]();
}

uint64_t sub_20A1873A0()
{
  return MEMORY[0x270F84ED0]();
}

uint64_t sub_20A1873B0()
{
  return MEMORY[0x270F84EE0]();
}

uint64_t sub_20A1873C0()
{
  return MEMORY[0x270F84EF0]();
}

uint64_t sub_20A1873D0()
{
  return MEMORY[0x270F0C240]();
}

uint64_t sub_20A1873E0()
{
  return MEMORY[0x270F0C248]();
}

uint64_t sub_20A1873F0()
{
  return MEMORY[0x270F0C250]();
}

uint64_t sub_20A187400()
{
  return MEMORY[0x270F0C258]();
}

uint64_t sub_20A187410()
{
  return MEMORY[0x270F0C260]();
}

uint64_t sub_20A187420()
{
  return MEMORY[0x270F0C280]();
}

uint64_t sub_20A187430()
{
  return MEMORY[0x270F0C288]();
}

uint64_t sub_20A187440()
{
  return MEMORY[0x270F0C290]();
}

uint64_t sub_20A187450()
{
  return MEMORY[0x270F0C298]();
}

uint64_t sub_20A187460()
{
  return MEMORY[0x270F0C2A0]();
}

uint64_t sub_20A187470()
{
  return MEMORY[0x270F0C2A8]();
}

uint64_t sub_20A187480()
{
  return MEMORY[0x270F0C2B0]();
}

uint64_t sub_20A187490()
{
  return MEMORY[0x270F0C2B8]();
}

uint64_t sub_20A1874A0()
{
  return MEMORY[0x270F0C2C0]();
}

uint64_t sub_20A1874B0()
{
  return MEMORY[0x270F0C2C8]();
}

uint64_t sub_20A1874C0()
{
  return MEMORY[0x270F0C2D0]();
}

uint64_t sub_20A1874D0()
{
  return MEMORY[0x270F0C2D8]();
}

uint64_t sub_20A1874E0()
{
  return MEMORY[0x270F0C2E8]();
}

uint64_t sub_20A1874F0()
{
  return MEMORY[0x270F0C2F0]();
}

uint64_t sub_20A187500()
{
  return MEMORY[0x270F0C2F8]();
}

uint64_t sub_20A187510()
{
  return MEMORY[0x270F0C300]();
}

uint64_t sub_20A187520()
{
  return MEMORY[0x270F0C310]();
}

uint64_t sub_20A187530()
{
  return MEMORY[0x270F0C328]();
}

uint64_t sub_20A187540()
{
  return MEMORY[0x270F0C338]();
}

uint64_t sub_20A187550()
{
  return MEMORY[0x270F0C348]();
}

uint64_t sub_20A187560()
{
  return MEMORY[0x270F0C350]();
}

uint64_t sub_20A187570()
{
  return MEMORY[0x270F0C358]();
}

uint64_t sub_20A187580()
{
  return MEMORY[0x270F0C370]();
}

uint64_t sub_20A187590()
{
  return MEMORY[0x270F0C380]();
}

uint64_t sub_20A1875A0()
{
  return MEMORY[0x270F0C388]();
}

uint64_t sub_20A1875B0()
{
  return MEMORY[0x270F0C390]();
}

uint64_t sub_20A1875C0()
{
  return MEMORY[0x270F0C3A0]();
}

uint64_t sub_20A1875D0()
{
  return MEMORY[0x270F0C3A8]();
}

uint64_t sub_20A1875E0()
{
  return MEMORY[0x270F0C3B0]();
}

uint64_t sub_20A1875F0()
{
  return MEMORY[0x270F0C3B8]();
}

uint64_t sub_20A187600()
{
  return MEMORY[0x270F0C3D0]();
}

uint64_t sub_20A187610()
{
  return MEMORY[0x270F0C3E0]();
}

uint64_t sub_20A187620()
{
  return MEMORY[0x270F0C3E8]();
}

uint64_t sub_20A187630()
{
  return MEMORY[0x270F0C3F0]();
}

uint64_t sub_20A187640()
{
  return MEMORY[0x270F0C400]();
}

uint64_t sub_20A187650()
{
  return MEMORY[0x270F0C408]();
}

uint64_t sub_20A187660()
{
  return MEMORY[0x270F0C410]();
}

uint64_t sub_20A187670()
{
  return MEMORY[0x270F0C418]();
}

uint64_t sub_20A187680()
{
  return MEMORY[0x270F0C420]();
}

uint64_t sub_20A187690()
{
  return MEMORY[0x270F0C428]();
}

uint64_t sub_20A1876A0()
{
  return MEMORY[0x270F0C430]();
}

uint64_t sub_20A1876B0()
{
  return MEMORY[0x270F0C438]();
}

uint64_t sub_20A1876C0()
{
  return MEMORY[0x270F0C440]();
}

uint64_t sub_20A1876D0()
{
  return MEMORY[0x270F0C458]();
}

uint64_t sub_20A1876E0()
{
  return MEMORY[0x270F0C460]();
}

uint64_t sub_20A1876F0()
{
  return MEMORY[0x270F0C468]();
}

uint64_t sub_20A187700()
{
  return MEMORY[0x270F0C470]();
}

uint64_t sub_20A187710()
{
  return MEMORY[0x270F0C478]();
}

uint64_t sub_20A187720()
{
  return MEMORY[0x270F0C480]();
}

uint64_t sub_20A187730()
{
  return MEMORY[0x270F0C490]();
}

uint64_t sub_20A187740()
{
  return MEMORY[0x270F0C498]();
}

uint64_t sub_20A187750()
{
  return MEMORY[0x270F0C4D8]();
}

uint64_t sub_20A187760()
{
  return MEMORY[0x270F0C4E0]();
}

uint64_t sub_20A187770()
{
  return MEMORY[0x270F0C4F8]();
}

uint64_t sub_20A187780()
{
  return MEMORY[0x270F0C508]();
}

uint64_t sub_20A187790()
{
  return MEMORY[0x270F0C528]();
}

uint64_t sub_20A1877A0()
{
  return MEMORY[0x270F0C538]();
}

uint64_t sub_20A1877B0()
{
  return MEMORY[0x270F0C540]();
}

uint64_t sub_20A1877C0()
{
  return MEMORY[0x270F0C548]();
}

uint64_t sub_20A1877D0()
{
  return MEMORY[0x270F0C550]();
}

uint64_t sub_20A1877E0()
{
  return MEMORY[0x270F0C558]();
}

uint64_t sub_20A1877F0()
{
  return MEMORY[0x270F0C568]();
}

uint64_t sub_20A187800()
{
  return MEMORY[0x270F0C570]();
}

uint64_t sub_20A187810()
{
  return MEMORY[0x270F0C578]();
}

uint64_t sub_20A187820()
{
  return MEMORY[0x270F0C580]();
}

uint64_t sub_20A187830()
{
  return MEMORY[0x270F0C588]();
}

uint64_t sub_20A187840()
{
  return MEMORY[0x270F0C590]();
}

uint64_t sub_20A187850()
{
  return MEMORY[0x270F0C5D0]();
}

uint64_t sub_20A187860()
{
  return MEMORY[0x270F0C5E0]();
}

uint64_t sub_20A187870()
{
  return MEMORY[0x270F0C5E8]();
}

uint64_t sub_20A187880()
{
  return MEMORY[0x270F0C5F0]();
}

uint64_t sub_20A187890()
{
  return MEMORY[0x270F0C5F8]();
}

uint64_t sub_20A1878A0()
{
  return MEMORY[0x270F0C600]();
}

uint64_t sub_20A1878B0()
{
  return MEMORY[0x270F0C608]();
}

uint64_t sub_20A1878C0()
{
  return MEMORY[0x270F0C618]();
}

uint64_t sub_20A1878D0()
{
  return MEMORY[0x270F0C620]();
}

uint64_t sub_20A1878E0()
{
  return MEMORY[0x270F0C628]();
}

uint64_t sub_20A1878F0()
{
  return MEMORY[0x270F0C630]();
}

uint64_t sub_20A187900()
{
  return MEMORY[0x270F0C638]();
}

uint64_t sub_20A187910()
{
  return MEMORY[0x270F0C640]();
}

uint64_t sub_20A187920()
{
  return MEMORY[0x270F0C648]();
}

uint64_t sub_20A187930()
{
  return MEMORY[0x270F0C650]();
}

uint64_t sub_20A187940()
{
  return MEMORY[0x270F0C660]();
}

uint64_t sub_20A187950()
{
  return MEMORY[0x270F0C668]();
}

uint64_t sub_20A187960()
{
  return MEMORY[0x270F0C670]();
}

uint64_t sub_20A187970()
{
  return MEMORY[0x270F0C678]();
}

uint64_t sub_20A187980()
{
  return MEMORY[0x270F0C688]();
}

uint64_t sub_20A187990()
{
  return MEMORY[0x270F0C6B0]();
}

uint64_t sub_20A1879A0()
{
  return MEMORY[0x270F0C6E8]();
}

uint64_t sub_20A1879C0()
{
  return MEMORY[0x270F0C710]();
}

uint64_t sub_20A1879D0()
{
  return MEMORY[0x270F0C718]();
}

uint64_t sub_20A1879E0()
{
  return MEMORY[0x270F0C720]();
}

uint64_t sub_20A1879F0()
{
  return MEMORY[0x270F0C730]();
}

uint64_t sub_20A187A00()
{
  return MEMORY[0x270F0C748]();
}

uint64_t sub_20A187A10()
{
  return MEMORY[0x270F0C750]();
}

uint64_t sub_20A187A20()
{
  return MEMORY[0x270F79E98]();
}

uint64_t sub_20A187A30()
{
  return MEMORY[0x270F79EA0]();
}

uint64_t sub_20A187A40()
{
  return MEMORY[0x270F79EA8]();
}

uint64_t sub_20A187A50()
{
  return MEMORY[0x270F79EB0]();
}

uint64_t sub_20A187A60()
{
  return MEMORY[0x270F79EB8]();
}

uint64_t sub_20A187A70()
{
  return MEMORY[0x270F79EC0]();
}

uint64_t sub_20A187A80()
{
  return MEMORY[0x270F79ED0]();
}

uint64_t sub_20A187A90()
{
  return MEMORY[0x270F79ED8]();
}

uint64_t sub_20A187AA0()
{
  return MEMORY[0x270F79EF0]();
}

uint64_t sub_20A187AB0()
{
  return MEMORY[0x270F79EF8]();
}

uint64_t sub_20A187AC0()
{
  return MEMORY[0x270F79F00]();
}

uint64_t sub_20A187AD0()
{
  return MEMORY[0x270F79F08]();
}

uint64_t sub_20A187AE0()
{
  return MEMORY[0x270F79F10]();
}

uint64_t sub_20A187AF0()
{
  return MEMORY[0x270F79F18]();
}

uint64_t sub_20A187B00()
{
  return MEMORY[0x270F79F20]();
}

uint64_t sub_20A187B10()
{
  return MEMORY[0x270F79F98]();
}

uint64_t sub_20A187B20()
{
  return MEMORY[0x270F79FA0]();
}

uint64_t sub_20A187B30()
{
  return MEMORY[0x270F79FE0]();
}

uint64_t sub_20A187B40()
{
  return MEMORY[0x270F79FE8]();
}

uint64_t sub_20A187B50()
{
  return MEMORY[0x270F7A000]();
}

uint64_t sub_20A187B60()
{
  return MEMORY[0x270F7A008]();
}

uint64_t sub_20A187B70()
{
  return MEMORY[0x270F7A040]();
}

uint64_t sub_20A187B80()
{
  return MEMORY[0x270F7A098]();
}

uint64_t sub_20A187B90()
{
  return MEMORY[0x270F7A0C0]();
}

uint64_t sub_20A187BA0()
{
  return MEMORY[0x270F7A0C8]();
}

uint64_t sub_20A187BB0()
{
  return MEMORY[0x270F7A0D0]();
}

uint64_t sub_20A187BC0()
{
  return MEMORY[0x270F7A410]();
}

uint64_t sub_20A187BD0()
{
  return MEMORY[0x270F7A418]();
}

uint64_t sub_20A187BE0()
{
  return MEMORY[0x270F7A420]();
}

uint64_t sub_20A187BF0()
{
  return MEMORY[0x270F7A428]();
}

uint64_t sub_20A187C00()
{
  return MEMORY[0x270F7A430]();
}

uint64_t sub_20A187C10()
{
  return MEMORY[0x270F7A480]();
}

uint64_t sub_20A187C20()
{
  return MEMORY[0x270F7A488]();
}

uint64_t sub_20A187C30()
{
  return MEMORY[0x270F7A490]();
}

uint64_t sub_20A187C40()
{
  return MEMORY[0x270F7A560]();
}

uint64_t sub_20A187C50()
{
  return MEMORY[0x270F7A588]();
}

uint64_t sub_20A187C60()
{
  return MEMORY[0x270F7A598]();
}

uint64_t sub_20A187C70()
{
  return MEMORY[0x270F7A5A0]();
}

uint64_t sub_20A187C80()
{
  return MEMORY[0x270F7A760]();
}

uint64_t sub_20A187C90()
{
  return MEMORY[0x270F7A778]();
}

uint64_t sub_20A187CA0()
{
  return MEMORY[0x270F84FE8]();
}

uint64_t sub_20A187CB0()
{
  return MEMORY[0x270F84FF0]();
}

uint64_t sub_20A187CC0()
{
  return MEMORY[0x270F84FF8]();
}

uint64_t sub_20A187CD0()
{
  return MEMORY[0x270F85000]();
}

uint64_t sub_20A187CE0()
{
  return MEMORY[0x270F85008]();
}

uint64_t sub_20A187CF0()
{
  return MEMORY[0x270F85010]();
}

uint64_t sub_20A187D00()
{
  return MEMORY[0x270F85018]();
}

uint64_t sub_20A187D10()
{
  return MEMORY[0x270F85020]();
}

uint64_t sub_20A187D20()
{
  return MEMORY[0x270F85028]();
}

uint64_t sub_20A187D30()
{
  return MEMORY[0x270F85030]();
}

uint64_t sub_20A187D40()
{
  return MEMORY[0x270F85040]();
}

uint64_t sub_20A187D50()
{
  return MEMORY[0x270F85048]();
}

uint64_t sub_20A187D60()
{
  return MEMORY[0x270F85050]();
}

uint64_t sub_20A187D70()
{
  return MEMORY[0x270F85058]();
}

uint64_t sub_20A187D80()
{
  return MEMORY[0x270F85060]();
}

uint64_t sub_20A187D90()
{
  return MEMORY[0x270F85068]();
}

uint64_t sub_20A187DA0()
{
  return MEMORY[0x270F85070]();
}

uint64_t sub_20A187DB0()
{
  return MEMORY[0x270F85078]();
}

uint64_t sub_20A187DC0()
{
  return MEMORY[0x270F85090]();
}

uint64_t sub_20A187DD0()
{
  return MEMORY[0x270F85098]();
}

uint64_t sub_20A187DE0()
{
  return MEMORY[0x270F850D8]();
}

uint64_t sub_20A187DF0()
{
  return MEMORY[0x270F850E0]();
}

uint64_t sub_20A187E00()
{
  return MEMORY[0x270F850E8]();
}

uint64_t sub_20A187E10()
{
  return MEMORY[0x270F850F0]();
}

uint64_t sub_20A187E20()
{
  return MEMORY[0x270F850F8]();
}

uint64_t sub_20A187E30()
{
  return MEMORY[0x270F85120]();
}

uint64_t sub_20A187E40()
{
  return MEMORY[0x270F85128]();
}

uint64_t sub_20A187E50()
{
  return MEMORY[0x270F85130]();
}

uint64_t sub_20A187E60()
{
  return MEMORY[0x270F85138]();
}

uint64_t sub_20A187E70()
{
  return MEMORY[0x270F85140]();
}

uint64_t sub_20A187E80()
{
  return MEMORY[0x270F85148]();
}

uint64_t sub_20A187E90()
{
  return MEMORY[0x270F85150]();
}

uint64_t sub_20A187EA0()
{
  return MEMORY[0x270F85158]();
}

uint64_t sub_20A187EB0()
{
  return MEMORY[0x270F85168]();
}

uint64_t sub_20A187EC0()
{
  return MEMORY[0x270F85170]();
}

uint64_t sub_20A187ED0()
{
  return MEMORY[0x270F85178]();
}

uint64_t sub_20A187EE0()
{
  return MEMORY[0x270F85180]();
}

uint64_t sub_20A187EF0()
{
  return MEMORY[0x270F85188]();
}

uint64_t sub_20A187F00()
{
  return MEMORY[0x270F85190]();
}

uint64_t sub_20A187F10()
{
  return MEMORY[0x270F85198]();
}

uint64_t sub_20A187F20()
{
  return MEMORY[0x270F851A0]();
}

uint64_t sub_20A187F30()
{
  return MEMORY[0x270F851F0]();
}

uint64_t sub_20A187F40()
{
  return MEMORY[0x270F851F8]();
}

uint64_t sub_20A187F50()
{
  return MEMORY[0x270F85200]();
}

uint64_t sub_20A187F60()
{
  return MEMORY[0x270F85208]();
}

uint64_t sub_20A187F70()
{
  return MEMORY[0x270F85210]();
}

uint64_t sub_20A187F80()
{
  return MEMORY[0x270F85218]();
}

uint64_t sub_20A187F90()
{
  return MEMORY[0x270F84F58]();
}

uint64_t sub_20A187FA0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_20A187FB0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_20A187FC0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_20A187FD0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_20A187FE0()
{
  return MEMORY[0x270EF7260]();
}

uint64_t sub_20A187FF0()
{
  return MEMORY[0x270EF7278]();
}

uint64_t sub_20A188000()
{
  return MEMORY[0x270EF7288]();
}

uint64_t sub_20A188010()
{
  return MEMORY[0x270EF7570]();
}

uint64_t sub_20A188020()
{
  return MEMORY[0x270EF7590]();
}

uint64_t sub_20A188030()
{
  return MEMORY[0x270EF7598]();
}

uint64_t sub_20A188040()
{
  return MEMORY[0x270EF75A0]();
}

uint64_t sub_20A188050()
{
  return MEMORY[0x270EF75A8]();
}

uint64_t sub_20A188060()
{
  return MEMORY[0x270EF77A0]();
}

uint64_t sub_20A188070()
{
  return MEMORY[0x270EF77D0]();
}

uint64_t sub_20A188080()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_20A188090()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_20A1880A0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_20A1880B0()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_20A1880C0()
{
  return MEMORY[0x270FA0A28]();
}

uint64_t sub_20A1880D0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_20A1880E0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_20A1880F0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_20A188100()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_20A188110()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_20A188120()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_20A188130()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_20A188140()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_20A188150()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_20A188160()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_20A188170()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_20A188180()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_20A188190()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_20A1881A0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_20A1881B0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_20A1881C0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_20A188200()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_20A188210()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_20A188220()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_20A188230()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_20A188240()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_20A188250()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_20A188260()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_20A188270()
{
  return MEMORY[0x270FA1F98]();
}

uint64_t sub_20A188280()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_20A1882A0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_20A1882B0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_20A1882C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_20A1882D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_20A1882E0()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_20A1882F0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_20A188300()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_20A188310()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_20A188320()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_20A188330()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_20A188340()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_20A188350()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_20A188360()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_20A188370()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_20A188380()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_20A188390()
{
  return MEMORY[0x270F84F98]();
}

uint64_t sub_20A1883A0()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_20A1883B0()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_20A1883C0()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_20A1883D0()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_20A1883E0()
{
  return MEMORY[0x270F85240]();
}

uint64_t sub_20A1883F0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_20A188400()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_20A188410()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_20A188420()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_20A188430()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_20A188440()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_20A188460()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_20A188480()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_20A188490()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_20A1884A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_20A1884B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_20A1884C0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_20A1884D0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_20A1884E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_20A1884F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_20A188500()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_20A188510()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_20A188520()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_20A188530()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_20A188540()
{
  return MEMORY[0x270F9F2B8]();
}

uint64_t sub_20A188550()
{
  return MEMORY[0x270F9F2C0]();
}

uint64_t sub_20A188560()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_20A188570()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_20A188580()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_20A188590()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_20A1885A0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_20A1885B0()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_20A1885C0()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_20A1885D0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_20A1885E0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_20A1885F0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_20A188600()
{
  return MEMORY[0x270F9F3F0]();
}

uint64_t sub_20A188610()
{
  return MEMORY[0x270F9F3F8]();
}

uint64_t sub_20A188620()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_20A188630()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_20A188640()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_20A188650()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_20A188660()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_20A188670()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_20A188680()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_20A188690()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_20A1886B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_20A1886D0()
{
  return MEMORY[0x270F9F838]();
}

uint64_t sub_20A1886E0()
{
  return MEMORY[0x270F9F8C8]();
}

uint64_t sub_20A1886F0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_20A188700()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_20A188710()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_20A188720()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_20A188730()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_20A188740()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_20A188750()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20A188760()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_20A188770()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_20A188780()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_20A188790()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_20A1887A0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_20A1887B0()
{
  return MEMORY[0x270F9FD98]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
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