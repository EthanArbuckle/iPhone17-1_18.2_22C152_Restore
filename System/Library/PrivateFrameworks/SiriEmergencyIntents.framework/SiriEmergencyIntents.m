unint64_t NLConstants.asNamespace.getter()
{
  sub_2287A8540();
  swift_bridgeObjectRelease();
  sub_2287A8450();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  return 0xD000000000000012;
}

unint64_t NLConstants.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 2:
    case 5:
      return result;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x636E656772656D65;
      break;
  }
  return result;
}

uint64_t sub_22878C6E8(unsigned __int8 *a1, char *a2)
{
  return sub_228799B40(*a1, *a2);
}

uint64_t sub_22878C6F4()
{
  return sub_22879D6C4();
}

uint64_t sub_22878C6FC()
{
  return sub_22879DFD0();
}

uint64_t sub_22878C704()
{
  return sub_22879E4C8();
}

uint64_t sub_22878C70C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents11NLConstantsO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22878C73C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = NLConstants.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_22878C76C()
{
  return NLConstants.asNamespace.getter();
}

unint64_t NLv4IdentifierNamespace.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
    case 2:
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 6:
      unint64_t result = 0x54746361746E6F63;
      break;
    case 7:
      unint64_t result = 0x707954656E6F6870;
      break;
    case 8:
      unint64_t result = 0x614E746E65746E69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22878C894(char *a1, char *a2)
{
  return sub_2287991C0(*a1, *a2);
}

uint64_t sub_22878C8A0()
{
  return sub_2287A8670();
}

uint64_t sub_22878C8E8()
{
  return sub_22879DC48();
}

uint64_t sub_22878C8F0()
{
  return sub_2287A8670();
}

uint64_t sub_22878C934@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents23NLv4IdentifierNamespaceO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22878C964@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = NLv4IdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t NLv4EntityAttributeName.rawValue.getter(char a1)
{
  return *(void *)&aLabel_1[8 * a1];
}

uint64_t sub_22878C9B4(char *a1, char *a2)
{
  return sub_228799458(*a1, *a2);
}

uint64_t sub_22878C9C0()
{
  return sub_22879D7D4();
}

uint64_t sub_22878C9C8()
{
  return sub_22879DD98();
}

uint64_t sub_22878C9D0()
{
  return sub_22879E7FC();
}

uint64_t sub_22878C9D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents23NLv4EntityAttributeNameO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22878CA08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NLv4EntityAttributeName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t variable initialization expression of EmergencyOrganizationInfoProvider.resourceDecoder()
{
  return 0;
}

uint64_t _s20SiriEmergencyIntents11NLConstantsO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t _s20SiriEmergencyIntents23NLv4IdentifierNamespaceO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

uint64_t _s20SiriEmergencyIntents23NLv4EntityAttributeNameO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_22878CB28()
{
  unint64_t result = qword_268262FD0;
  if (!qword_268262FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268262FD0);
  }
  return result;
}

unint64_t sub_22878CB80()
{
  unint64_t result = qword_268262FD8;
  if (!qword_268262FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268262FD8);
  }
  return result;
}

unint64_t sub_22878CBD8()
{
  unint64_t result = qword_268262FE0;
  if (!qword_268262FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268262FE0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NLConstants(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NLConstants(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22878CD98);
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

uint64_t sub_22878CDC0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22878CDCC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NLConstants()
{
  return &type metadata for NLConstants;
}

uint64_t getEnumTagSinglePayload for NLv4IdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NLv4IdentifierNamespace(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22878CF40);
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

ValueMetadata *type metadata accessor for NLv4IdentifierNamespace()
{
  return &type metadata for NLv4IdentifierNamespace;
}

uint64_t getEnumTagSinglePayload for NLv4EntityAttributeName(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NLv4EntityAttributeName(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22878D0D4);
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

ValueMetadata *type metadata accessor for NLv4EntityAttributeName()
{
  return &type metadata for NLv4EntityAttributeName;
}

uint64_t EmergencyCallIntent.emergencySituation.getter(unsigned int a1)
{
  return a1 >> 8;
}

uint64_t EmergencyCallIntent.isDirectCall.getter(unsigned int a1)
{
  return HIWORD(a1) & 1;
}

SiriEmergencyIntents::EmergencyCallIntent __swiftcall EmergencyCallIntent.init(emergencyOrganization:emergencySituation:isDirectCall:)(SiriEmergencyIntents::EmergencyOrganization_optional emergencyOrganization, SiriEmergencyIntents::EmergencySituation_optional emergencySituation, Swift::Bool isDirectCall)
{
  if (isDirectCall) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  return (SiriEmergencyIntents::EmergencyCallIntent)(v3 & 0xFFFF0000 | (emergencySituation.value << 8) | emergencyOrganization.value);
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyCallIntent(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
  }
  unsigned int v4 = *((unsigned __int8 *)a1 + 2);
  BOOL v5 = v4 >= 2;
  int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyCallIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)unint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)(result + 2) = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyCallIntent()
{
  return &type metadata for EmergencyCallIntent;
}

Swift::String __swiftcall EmergencyConfirmation.toPromptResponseOption()()
{
  sub_2287A8540();
  swift_bridgeObjectRelease();
  sub_2287A8450();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  uint64_t v0 = 0xD000000000000012;
  v1 = (void *)0x80000002287AAB80;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t EmergencyConfirmation.rawValue.getter(char a1)
{
  if (a1) {
    return 28526;
  }
  else {
    return 7562617;
  }
}

SiriEmergencyIntents::EmergencyConfirmation_optional __swiftcall EmergencyConfirmation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = SiriEmergencyIntents_EmergencyConfirmation_no;
  }
  else {
    v2.value = SiriEmergencyIntents_EmergencyConfirmation_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t sub_22878D3DC(char *a1, char *a2)
{
  return sub_228799AB0(*a1, *a2);
}

unint64_t sub_22878D3EC()
{
  unint64_t result = qword_268262FE8;
  if (!qword_268262FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268262FE8);
  }
  return result;
}

uint64_t sub_22878D440()
{
  return sub_22879D840();
}

uint64_t sub_22878D448()
{
  return sub_22879E240();
}

uint64_t sub_22878D450()
{
  return sub_22879E298();
}

uint64_t sub_22878D458@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2287A85B0();
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

uint64_t sub_22878D4B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EmergencyConfirmation.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyConfirmation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EmergencyConfirmation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22878D640);
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

unsigned char *sub_22878D668(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyConfirmation()
{
  return &type metadata for EmergencyConfirmation;
}

Swift::String __swiftcall InstrumentationTask.taskType()()
{
  BOOL v1 = (v0 & 1) == 0;
  if (v0) {
    uint64_t v2 = 0x65726953706F7453;
  }
  else {
    uint64_t v2 = 0x7269537472617453;
  }
  if (v1) {
    int v3 = (void *)0xEA00000000006E65;
  }
  else {
    int v3 = (void *)0xE90000000000006ELL;
  }
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t InstrumentationTask.rawValue.getter(char a1)
{
  if (a1) {
    return 0x65726953706F7453;
  }
  else {
    return 0x7269537472617453;
  }
}

SiriEmergencyIntents::InstrumentationTask_optional __swiftcall InstrumentationTask.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = SiriEmergencyIntents_InstrumentationTask_StopSiren;
  }
  else {
    v2.value = SiriEmergencyIntents_InstrumentationTask_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t sub_22878D758(char *a1, char *a2)
{
  return sub_2287994E0(*a1, *a2);
}

unint64_t sub_22878D768()
{
  unint64_t result = qword_268262FF0;
  if (!qword_268262FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268262FF0);
  }
  return result;
}

uint64_t sub_22878D7BC()
{
  return sub_22879D8B0();
}

uint64_t sub_22878D7C4()
{
  return sub_22879DDEC();
}

uint64_t sub_22878D7CC()
{
  return sub_22879E774();
}

uint64_t sub_22878D7D4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2287A85B0();
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

uint64_t sub_22878D834@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = InstrumentationTask.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unsigned char *storeEnumTagSinglePayload for InstrumentationTask(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22878D92CLL);
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

ValueMetadata *type metadata accessor for InstrumentationTask()
{
  return &type metadata for InstrumentationTask;
}

unint64_t DirectInvocationURI.payloadKey.getter(char a1)
{
  uint64_t v2 = 0xD000000000000034;
  uint64_t v3 = sub_2287A83C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = 0xD00000000000001FLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x614E746E65746E69;
      break;
    case 2:
      unint64_t result = 0x72506E6F74747562;
      break;
    case 3:
      return result;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      uint64_t v8 = sub_2287A83A0();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
      v9 = sub_2287A83B0();
      os_log_type_t v10 = sub_2287A84D0();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        uint64_t v15 = v12;
        *(_DWORD *)v11 = 136315138;
        if (a1)
        {
          if (a1 == 4)
          {
            unint64_t v13 = 0x80000002287AA1C0;
          }
          else
          {
            uint64_t v2 = 0xD000000000000035;
            unint64_t v13 = 0x80000002287AA200;
          }
        }
        else
        {
          unint64_t v13 = 0x80000002287AA0C0;
        }
        v14[1] = sub_22878DE80(v2, v13, &v15);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22878A000, v9, v10, "Undefined payloadKey for this DirectInvocationURI: %s", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A69C820](v12, -1, -1);
        MEMORY[0x22A69C820](v11, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      unint64_t result = 0;
      break;
  }
  return result;
}

unint64_t DirectInvocationURI.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000034;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000032;
      break;
    case 2:
      unint64_t result = 0xD000000000000035;
      break;
    case 3:
      unint64_t result = 0xD00000000000003FLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000035;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22878DD14(unsigned __int8 *a1, char *a2)
{
  return sub_22879958C(*a1, *a2);
}

uint64_t sub_22878DD20()
{
  return sub_22879D93C();
}

uint64_t sub_22878DD28()
{
  return sub_22879DE60();
}

uint64_t sub_22878DD30()
{
  return sub_22879E678();
}

uint64_t sub_22878DD38@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents19DirectInvocationURIO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22878DD68@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DirectInvocationURI.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22878DD94(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_22878DDA4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_22878DDE0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22878DE08(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_22878DE80(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2287A84F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_22878DE80(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22878DF54(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22878E6E0((uint64_t)v12, *a3);
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
      sub_22878E6E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22878DF54(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2287A8500();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22878E110(a5, a6);
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
  uint64_t v8 = sub_2287A8570();
  if (!v8)
  {
    sub_2287A8580();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2287A85A0();
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

uint64_t sub_22878E110(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22878E1A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22878E388(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22878E388(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22878E1A8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22878E320(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2287A8550();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2287A8580();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2287A8490();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2287A85A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2287A8580();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22878E320(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263000);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22878E388(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268263000);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_2287A85A0();
  __break(1u);
  return result;
}

unsigned char **sub_22878E4D8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t _s20SiriEmergencyIntents19DirectInvocationURIO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

unint64_t sub_22878E538()
{
  unint64_t result = qword_268262FF8;
  if (!qword_268262FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268262FF8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DirectInvocationURI(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22878E658);
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

ValueMetadata *type metadata accessor for DirectInvocationURI()
{
  return &type metadata for DirectInvocationURI;
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

uint64_t sub_22878E6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t EmergencyVerb.rawValue.getter(char a1)
{
  return *(void *)&aCall_1[8 * a1];
}

uint64_t sub_22878E7A8(char *a1, char *a2)
{
  return sub_2287998D4(*a1, *a2);
}

uint64_t sub_22878E7B4()
{
  return sub_22879E3D8();
}

uint64_t sub_22878E7C0()
{
  return sub_22879E134();
}

uint64_t sub_22878E7C8()
{
  return sub_22879E3D8();
}

uint64_t sub_22878E7D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents0B4VerbO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22878E800@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EmergencyVerb.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B4VerbO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t _s20SiriEmergencyIntents0B4VerbO4from07usoTaskD0ACSgSSSg_tFZ_0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 8;
  }
  if (a1 == 1819042147 && a2 == 0xE400000000000000) {
    return 0;
  }
  char v5 = sub_2287A85F0();
  uint64_t result = 0;
  if ((v5 & 1) == 0)
  {
    if (a1 == 0x74736575716572 && a2 == 0xE700000000000000 || (sub_2287A85F0() & 1) != 0) {
      return 1;
    }
    if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000 || (sub_2287A85F0() & 1) != 0) {
      return 2;
    }
    if (a1 == 0x627265566F6ELL && a2 == 0xE600000000000000 || (sub_2287A85F0() & 1) != 0) {
      return 3;
    }
    if (a1 == 0x656C62616E65 && a2 == 0xE600000000000000 || (sub_2287A85F0() & 1) != 0) {
      return 4;
    }
    if (a1 == 0x656C6261736964 && a2 == 0xE700000000000000 || (sub_2287A85F0() & 1) != 0) {
      return 5;
    }
    if (a1 == 0x736972616D6D7573 && a2 == 0xE900000000000065 || (sub_2287A85F0() & 1) != 0) {
      return 6;
    }
    if (a1 == 0x6978456B63656863 && a2 == 0xEE0065636E657473 || (sub_2287A85F0() & 1) != 0) {
      return 7;
    }
    return 8;
  }
  return result;
}

unint64_t sub_22878EB4C()
{
  unint64_t result = qword_268263008;
  if (!qword_268263008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263008);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyVerb(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EmergencyVerb(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x22878ECFCLL);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyVerb()
{
  return &type metadata for EmergencyVerb;
}

uint64_t EmergencyDialogAct.userParse.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2287A8070();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t EmergencyDialogAct.verb.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 20));
}

uint64_t type metadata accessor for EmergencyDialogAct()
{
  uint64_t result = qword_268263070;
  if (!qword_268263070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EmergencyDialogAct.situation.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 24));
}

uint64_t EmergencyDialogAct.organization.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 28));
}

uint64_t EmergencyDialogAct.attribute.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 32));
}

uint64_t EmergencyDialogAct.confirmation.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 36));
}

uint64_t EmergencyDialogAct.severity.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EmergencyDialogAct() + 40));
}

uint64_t EmergencyDialogAct.init(userParse:nlv4MigrationFeatureFlagIsEnabled:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  void (*v25)(uint64_t *__return_ptr, uint64_t);
  char v26;
  int *v27;
  uint64_t v28;
  void (*v29)(void *__return_ptr, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(void *__return_ptr, uint64_t);
  char *v34;
  uint64_t v35;
  void (*v36)(void *__return_ptr, uint64_t);
  char *v37;
  uint64_t v38;
  void (*v39)(void *__return_ptr, uint64_t);
  char *v40;
  uint64_t v41;
  void (*v42)(void *__return_ptr, uint64_t);
  uint64_t result;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void v60[2];
  uint64_t v61;

  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263010);
  v56 = *(void *)(v6 - 8);
  v57 = v6;
  MEMORY[0x270FA5388](v6);
  v55 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263018);
  v52 = *(void *)(v8 - 8);
  v53 = v8;
  MEMORY[0x270FA5388](v8);
  v51 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263020);
  v48 = *(void *)(v10 - 8);
  v49 = v10;
  MEMORY[0x270FA5388](v10);
  v47 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263028);
  v45 = *(void *)(v12 - 8);
  v46 = v12;
  MEMORY[0x270FA5388](v12);
  v44 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263030);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263038);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_2287A8070();
  v54 = *(void *)(v22 - 8);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16);
  v58 = a3;
  v23(a3, a1, v22);
  uint64_t v24 = swift_allocObject();
  v59 = a2 & 1;
  *(unsigned char *)(v24 + 16) = a2;
  sub_2287A8350();
  v25 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_2287A8360();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  v50 = a1;
  v25(&v61, a1);
  swift_release();
  v26 = v61;
  v27 = (int *)type metadata accessor for EmergencyDialogAct();
  v28 = v58;
  *(unsigned char *)(v58 + v27[6]) = v26;
  *(unsigned char *)(swift_allocObject() + 16) = v59;
  sub_2287A8350();
  v29 = (void (*)(void *__return_ptr, uint64_t))sub_2287A8360();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v30 = v50;
  v29((void *)((char *)v60 + 4), v50);
  swift_release();
  *(unsigned char *)(v28 + v27[7]) = BYTE4(v60[0]);
  *(unsigned char *)(swift_allocObject() + 16) = v59;
  v31 = v44;
  sub_2287A8350();
  v32 = v46;
  v33 = (void (*)(void *__return_ptr, uint64_t))sub_2287A8360();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v32);
  v33((void *)((char *)v60 + 3), v30);
  swift_release();
  *(unsigned char *)(v28 + v27[8]) = BYTE3(v60[0]);
  v34 = v47;
  sub_2287A8350();
  v35 = v49;
  v36 = (void (*)(void *__return_ptr, uint64_t))sub_2287A8360();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v35);
  v36((void *)((char *)v60 + 2), v30);
  swift_release();
  *(unsigned char *)(v28 + v27[9]) = BYTE2(v60[0]);
  v37 = v51;
  sub_2287A8350();
  v38 = v53;
  v39 = (void (*)(void *__return_ptr, uint64_t))sub_2287A8360();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v38);
  v39((void *)((char *)v60 + 1), v30);
  swift_release();
  *(unsigned char *)(v28 + v27[5]) = BYTE1(v60[0]);
  *(unsigned char *)(swift_allocObject() + 16) = v59;
  v40 = v55;
  sub_2287A8350();
  v41 = v57;
  v42 = (void (*)(void *__return_ptr, uint64_t))sub_2287A8360();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v40, v41);
  v42(v60, v30);
  swift_release();
  LOBYTE(v42) = v60[0];
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v54 + 8))(v30, v22);
  *(unsigned char *)(v28 + v27[10]) = (_BYTE)v42;
  return result;
}

uint64_t sub_22878F6D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2287A8070();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_22878F73C(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_22878F748(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 24));
}

uint64_t sub_22878F754(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_22878F760(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 32));
}

uint64_t sub_22878F76C(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 36));
}

uint64_t sub_22878F778(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 40));
}

uint64_t EmergencyDialogAct.description.getter()
{
  BYTE8(v3) = 0;
  sub_2287A8540();
  sub_2287A8480();
  uint64_t v1 = type metadata accessor for EmergencyDialogAct();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263040);
  sub_2287A84E0();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263048);
  sub_2287A84E0();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263050);
  sub_2287A84E0();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263058);
  sub_2287A84E0();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263060);
  sub_2287A84E0();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  *(void *)&long long v3 = *(unsigned __int8 *)(v0 + *(int *)(v1 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263068);
  sub_2287A84E0();
  sub_2287A8480();
  swift_bridgeObjectRelease();
  sub_2287A8480();
  return *(void *)((char *)&v3 + 1);
}

uint64_t sub_22878FA00()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22878FA10@<X0>(const char *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2287941F0(a1, *(unsigned char *)(v2 + 16), a2);
}

uint64_t sub_22878FA2C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22878FA3C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_228791DC0(a1, *(unsigned char *)(v2 + 16), a2);
}

uint64_t sub_22878FA58()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22878FA68@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_22879013C(a1, *(unsigned char *)(v2 + 16), a2);
}

uint64_t sub_22878FA84()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22878FA94@<X0>(char *a1@<X8>)
{
  return sub_228796AFC(*(unsigned char *)(v1 + 16), a1);
}

void *initializeBufferWithCopyOfBuffer for EmergencyDialogAct(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2287A8070();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    uint64_t v9 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v10 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  }
  return a1;
}

uint64_t destroy for EmergencyDialogAct(uint64_t a1)
{
  uint64_t v2 = sub_2287A8070();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2287A8070();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t assignWithCopy for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2287A8070();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t initializeWithTake for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2287A8070();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for EmergencyDialogAct(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2287A8070();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyDialogAct(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22878FEE0);
}

uint64_t sub_22878FEE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287A8070();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 32)) <= 2u) {
      int v10 = 2;
    }
    else {
      int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32));
    }
    unsigned int v11 = v10 - 2;
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 32)) >= 2u) {
      return v11;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for EmergencyDialogAct(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22878FFBC);
}

uint64_t sub_22878FFBC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2287A8070();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 32)) = a2 + 2;
  }
  return result;
}

uint64_t sub_228790078()
{
  uint64_t result = sub_2287A8070();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22879013C@<X0>(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  void (*v115)(uint64_t *__return_ptr, uint64_t);
  unsigned int v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  os_log_type_t v121;
  uint8_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void (**v126)(char *, uint64_t);
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  void v138[6];
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  const char *v142;
  const char *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  void (*v150)(char *, const char *, uint64_t);
  const char *v151;
  const char *v152;
  unint64_t v153;
  uint64_t v154;
  void (**v155)(char *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  unsigned char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  char v165;
  char v166;
  char v167;
  char v168;
  char v169;
  char v170;
  char v171;
  char v172;
  char v173;
  char v174;
  uint64_t v175;
  char v176;
  uint64_t v177;
  char v178;

  uint64_t v4 = v3;
  v161 = a3;
  uint64_t v7 = sub_2287A83C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  int v10 = (char *)v138 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263018);
  v164 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v163 = (char *)v138 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = sub_2287A8190();
  uint64_t v13 = MEMORY[0x270FA5388](v162);
  v159 = (char *)v138 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v160 = (char *)v138 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v21 = (char *)v138 - v20;
  MEMORY[0x270FA5388](v19);
  v26 = (char *)v138 - v25;
  if ((a2 & 1) == 0) {
    goto LABEL_139;
  }
  v155 = v24;
  v154 = v23;
  v157 = v22;
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v177)
  {
    sub_228797E88((uint64_t)&v175, &qword_268263090);
    goto LABEL_10;
  }
  sub_2287A8260();
  if ((swift_dynamicCast() & 1) == 0
    || (sub_2287A8290(), swift_release(), !v175)
    || (uint64_t v27 = sub_2287A81B0(), swift_release(), !v27))
  {
LABEL_10:
    Siri_Nlu_External_UserParse.usoTask.getter();
    sub_2287A81D0();
    swift_release();
    if (!v177)
    {
      sub_228797E88((uint64_t)&v175, &qword_268263090);
      goto LABEL_100;
    }
    sub_2287A8280();
    if (swift_dynamicCast())
    {
      sub_2287A81F0();
      swift_release();
      if (v175)
      {
        uint64_t v32 = sub_2287A81B0();
        swift_release();
        if (v32)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_2287A9340;
          *(_WORD *)(inited + 32) = 1798;
          uint64_t v34 = sub_2287A81A0();
          if (v34)
          {
            v158 = inited;
            uint64_t v35 = *(void *)(v34 + 16);
            if (v35)
            {
              v140 = v32;
              v149 = v11;
              v148 = v10;
              v146 = v8;
              v147 = v7;
              v152 = *(const char **)(v157 + 16);
              unint64_t v36 = v34
                  + ((*(unsigned __int8 *)(v157 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80));
              v151 = (const char *)(v157 + 8);
              v153 = v157 + 16;
              v150 = *(void (**)(char *, const char *, uint64_t))(v157 + 72);
              v139 = v34;
              swift_bridgeObjectRetain();
              v145 = "emergency";
              v144 = "emergencyAttribute";
              v143 = "emergencySirenNoun";
              v142 = "crisisSituationHigh";
              v141 = "crisisSituationMedium";
              uint64_t v37 = v162;
              v38 = v160;
              while (1)
              {
                ((void (*)(char *, unint64_t, uint64_t))v152)(v38, v36, v37);
                v175 = MEMORY[0x263F8EE78];
                uint64_t v39 = 0xD000000000000015;
                unint64_t v40 = 0x80000002287A9FB0;
                uint64_t v41 = a1;
                switch(*(unsigned char *)(v158 + 32))
                {
                  case 1:
                    v42 = &v174;
                    goto LABEL_24;
                  case 2:
                    v42 = &v173;
                    goto LABEL_24;
                  case 3:
                    uint64_t v39 = 0xD000000000000013;
                    v43 = &v172;
                    goto LABEL_22;
                  case 4:
                    uint64_t v39 = 0xD000000000000015;
                    v43 = &v171;
LABEL_22:
                    unint64_t v40 = *((void *)v43 - 32) | 0x8000000000000000;
                    break;
                  case 5:
                    v42 = &v170;
LABEL_24:
                    unint64_t v40 = *((void *)v42 - 32) | 0x8000000000000000;
                    uint64_t v39 = 0xD000000000000012;
                    break;
                  case 6:
                    uint64_t v39 = 0x54746361746E6F63;
                    unint64_t v40 = 0xEB00000000657079;
                    break;
                  case 7:
                    uint64_t v39 = 0x707954656E6F6870;
                    unint64_t v40 = 0xE900000000000065;
                    break;
                  case 8:
                    uint64_t v39 = 0x614E746E65746E69;
                    unint64_t v40 = 0xEA0000000000656DLL;
                    break;
                  default:
                    break;
                }
                sub_2287A78F0();
                v44 = *(void **)(v175 + 16);
                sub_2287A793C(v44);
                uint64_t v45 = sub_2287A7980((uint64_t)v44, v39, v40);
                nullsub_1(v45);
                uint64_t v46 = 0xD000000000000015;
                unint64_t v47 = 0x80000002287A9FB0;
                switch(*(unsigned char *)(v158 + 33))
                {
                  case 1:
                    v48 = &v174;
                    goto LABEL_35;
                  case 2:
                    v48 = &v173;
                    goto LABEL_35;
                  case 3:
                    uint64_t v46 = 0xD000000000000013;
                    v49 = &v172;
                    goto LABEL_33;
                  case 4:
                    uint64_t v46 = 0xD000000000000015;
                    v49 = &v171;
LABEL_33:
                    unint64_t v47 = *((void *)v49 - 32) | 0x8000000000000000;
                    break;
                  case 5:
                    v48 = &v170;
LABEL_35:
                    unint64_t v47 = *((void *)v48 - 32) | 0x8000000000000000;
                    uint64_t v46 = 0xD000000000000012;
                    break;
                  case 6:
                    uint64_t v46 = 0x54746361746E6F63;
                    unint64_t v47 = 0xEB00000000657079;
                    break;
                  case 7:
                    uint64_t v46 = 0x707954656E6F6870;
                    unint64_t v47 = 0xE900000000000065;
                    break;
                  case 8:
                    uint64_t v46 = 0x614E746E65746E69;
                    unint64_t v47 = 0xEA0000000000656DLL;
                    break;
                  default:
                    break;
                }
                sub_2287A78F0();
                v50 = *(void **)(v175 + 16);
                sub_2287A793C(v50);
                uint64_t v51 = sub_2287A7980((uint64_t)v50, v46, v47);
                nullsub_1(v51);
                v52 = (void *)v175;
                v53 = v160;
                uint64_t v54 = sub_2287A8180();
                if (v55)
                {
                  uint64_t v56 = v55;
                }
                else
                {
                  uint64_t v54 = 0;
                  uint64_t v56 = 0xE000000000000000;
                }
                char v57 = sub_2287A7500(v54, v56, v52);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v57) {
                  break;
                }
                uint64_t v37 = v162;
                (*(void (**)(char *, uint64_t))v151)(v53, v162);
                v36 += (unint64_t)v150;
                --v35;
                v38 = v53;
                a1 = v41;
                if (!v35)
                {
                  swift_release();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v7 = v147;
                  uint64_t v8 = v146;
                  int v10 = v148;
                  uint64_t v11 = v149;
                  goto LABEL_99;
                }
              }
              swift_bridgeObjectRelease();
              v125 = v157 + 32;
              v126 = v155;
              v127 = v162;
              (*(void (**)(void (**)(char *, uint64_t), char *, uint64_t))(v157 + 32))(v155, v53, v162);
              v128 = sub_2287A8170();
              v130 = v129;
              (*(void (**)(void, uint64_t))(v125 - 24))(v126, v127);
              swift_bridgeObjectRelease();
              swift_setDeallocating();
              swift_deallocClassInstance();
              char v87 = _s20SiriEmergencyIntents0B9AttributeO4from15identifierValueACSgSS_tFZ_0(v128, v130);
              swift_release();
              uint64_t result = swift_bridgeObjectRelease();
              uint64_t v7 = v147;
              uint64_t v8 = v146;
              int v10 = v148;
              a1 = v41;
              uint64_t v11 = v149;
              if (v87 != 2) {
                goto LABEL_152;
              }
              goto LABEL_100;
            }
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_release();
          }
LABEL_99:
          swift_bridgeObjectRelease();
        }
      }
    }
LABEL_100:
    Siri_Nlu_External_UserParse.usoTask.getter();
    sub_2287A81D0();
    swift_release();
    if (v177)
    {
      sub_2287A8230();
      if (swift_dynamicCast())
      {
        sub_2287A8140();
        swift_release();
        if (v175)
        {
          uint64_t v89 = sub_2287A81B0();
          swift_release();
          if (v89)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
            uint64_t v90 = swift_initStackObject();
            *(_OWORD *)(v90 + 16) = xmmword_2287A9340;
            *(_WORD *)(v90 + 32) = 1798;
            uint64_t v91 = sub_2287A81A0();
            if (v91)
            {
              v160 = (char *)v90;
              uint64_t v92 = *(void *)(v91 + 16);
              if (v92)
              {
                v143 = (const char *)v89;
                v149 = v11;
                v148 = v10;
                v146 = v8;
                v147 = v7;
                v158 = *(void *)(v157 + 16);
                unint64_t v93 = v91
                    + ((*(unsigned __int8 *)(v157 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80));
                v155 = (void (**)(char *, uint64_t))(v157 + 8);
                v153 = *(void *)(v157 + 72);
                v142 = (const char *)v91;
                swift_bridgeObjectRetain();
                v152 = "emergency";
                v151 = "emergencyAttribute";
                v150 = (void (*)(char *, const char *, uint64_t))"emergencySirenNoun";
                v145 = "crisisSituationHigh";
                v144 = "crisisSituationMedium";
                uint64_t v94 = v162;
                v95 = v159;
                v156 = a1;
                while (1)
                {
                  ((void (*)(char *, unint64_t, uint64_t))v158)(v95, v93, v94);
                  v175 = sub_2287A784C(0);
                  uint64_t v96 = 0xD000000000000015;
                  unint64_t v97 = 0x80000002287A9FB0;
                  switch(v160[32])
                  {
                    case 1:
                      v98 = &v178;
                      goto LABEL_114;
                    case 2:
                      v98 = (char *)&v177;
                      goto LABEL_114;
                    case 3:
                      uint64_t v96 = 0xD000000000000013;
                      v99 = &v176;
                      goto LABEL_112;
                    case 4:
                      uint64_t v96 = 0xD000000000000015;
                      v99 = &v174;
LABEL_112:
                      unint64_t v97 = *((void *)v99 - 32) | 0x8000000000000000;
                      break;
                    case 5:
                      v98 = &v173;
LABEL_114:
                      unint64_t v97 = *((void *)v98 - 32) | 0x8000000000000000;
                      uint64_t v96 = 0xD000000000000012;
                      break;
                    case 6:
                      uint64_t v96 = 0x54746361746E6F63;
                      unint64_t v97 = 0xEB00000000657079;
                      break;
                    case 7:
                      uint64_t v96 = 0x707954656E6F6870;
                      unint64_t v97 = 0xE900000000000065;
                      break;
                    case 8:
                      uint64_t v96 = 0x614E746E65746E69;
                      unint64_t v97 = 0xEA0000000000656DLL;
                      break;
                    default:
                      break;
                  }
                  sub_2287A78F0();
                  v100 = *(void **)(v175 + 16);
                  sub_2287A793C(v100);
                  uint64_t v101 = sub_2287A7980((uint64_t)v100, v96, v97);
                  nullsub_1(v101);
                  uint64_t v102 = 0xD000000000000015;
                  unint64_t v103 = 0x80000002287A9FB0;
                  switch(v160[33])
                  {
                    case 1:
                      v104 = &v178;
                      goto LABEL_125;
                    case 2:
                      v104 = (char *)&v177;
                      goto LABEL_125;
                    case 3:
                      uint64_t v102 = 0xD000000000000013;
                      v105 = &v176;
                      goto LABEL_123;
                    case 4:
                      uint64_t v102 = 0xD000000000000015;
                      v105 = &v174;
LABEL_123:
                      unint64_t v103 = *((void *)v105 - 32) | 0x8000000000000000;
                      break;
                    case 5:
                      v104 = &v173;
LABEL_125:
                      unint64_t v103 = *((void *)v104 - 32) | 0x8000000000000000;
                      uint64_t v102 = 0xD000000000000012;
                      break;
                    case 6:
                      uint64_t v102 = 0x54746361746E6F63;
                      unint64_t v103 = 0xEB00000000657079;
                      break;
                    case 7:
                      uint64_t v102 = 0x707954656E6F6870;
                      unint64_t v103 = 0xE900000000000065;
                      break;
                    case 8:
                      uint64_t v102 = 0x614E746E65746E69;
                      unint64_t v103 = 0xEA0000000000656DLL;
                      break;
                    default:
                      break;
                  }
                  sub_2287A78F0();
                  v106 = *(void **)(v175 + 16);
                  sub_2287A793C(v106);
                  uint64_t v107 = sub_2287A7980((uint64_t)v106, v102, v103);
                  nullsub_1(v107);
                  v108 = (void *)v175;
                  v109 = v159;
                  uint64_t v110 = sub_2287A8180();
                  if (v111)
                  {
                    uint64_t v112 = v111;
                  }
                  else
                  {
                    uint64_t v110 = 0;
                    uint64_t v112 = 0xE000000000000000;
                  }
                  char v113 = sub_2287A7500(v110, v112, v108);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v113) {
                    break;
                  }
                  uint64_t v94 = v162;
                  (*v155)(v109, v162);
                  v93 += v153;
                  --v92;
                  v95 = v109;
                  a1 = v156;
                  if (!v92)
                  {
                    swift_release();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    uint64_t v7 = v147;
                    uint64_t v8 = v146;
                    int v10 = v148;
                    uint64_t v11 = v149;
                    goto LABEL_138;
                  }
                }
                swift_bridgeObjectRelease();
                v131 = v157 + 32;
                v132 = v154;
                v133 = v162;
                (*(void (**)(uint64_t, char *, uint64_t))(v157 + 32))(v154, v109, v162);
                v134 = sub_2287A8170();
                v136 = v135;
                (*(void (**)(uint64_t, uint64_t))(v131 - 24))(v132, v133);
                swift_bridgeObjectRelease();
                swift_setDeallocating();
                swift_deallocClassInstance();
                v137 = _s20SiriEmergencyIntents0B9AttributeO4from15identifierValueACSgSS_tFZ_0(v134, v136);
                swift_release();
                uint64_t result = swift_bridgeObjectRelease();
                uint64_t v7 = v147;
                uint64_t v8 = v146;
                int v10 = v148;
                a1 = v156;
                uint64_t v11 = v149;
                if (v137 != 2)
                {
                  LOBYTE(v116) = v137 & 1;
                  goto LABEL_147;
                }
                goto LABEL_139;
              }
              swift_release();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_release();
            }
LABEL_138:
            swift_bridgeObjectRelease();
          }
        }
      }
    }
    else
    {
      sub_228797E88((uint64_t)&v175, &qword_268263090);
    }
LABEL_139:
    sub_2287A8070();
    v114 = v163;
    sub_2287A8350();
    v115 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_2287A8360();
    (*(void (**)(char *, uint64_t))(v164 + 8))(v114, v11);
    v115(&v175, a1);
    if (!v4)
    {
      swift_release();
      switch((char)v175)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
          v117 = sub_2287A85F0();
          uint64_t result = swift_bridgeObjectRelease();
          LOBYTE(v116) = 0;
          if ((v117 & 1) == 0) {
            goto LABEL_144;
          }
          goto LABEL_147;
        default:
          uint64_t result = swift_bridgeObjectRelease();
          LOBYTE(v116) = 0;
          goto LABEL_147;
      }
    }
    MEMORY[0x22A69C720](v4);
    swift_release();
LABEL_144:
    Siri_Nlu_External_UserParse.catiIntentName.getter();
    if (v118)
    {
      uint64_t result = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0();
      if ((result - 10) <= 7u)
      {
        v116 = (0xF0u >> (result - 10)) & 1;
        goto LABEL_147;
      }
    }
    v119 = sub_2287A83A0();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v119, v7);
    v120 = sub_2287A83B0();
    v121 = sub_2287A84C0();
    if (os_log_type_enabled(v120, v121))
    {
      v122 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v122 = 0;
      _os_log_impl(&dword_22878A000, v120, v121, "No EmergencyAttribute found in user parse", v122, 2u);
      MEMORY[0x22A69C820](v122, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v123 = sub_2287A8370();
    sub_228797E30();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v123 - 8) + 104))(v124, *MEMORY[0x263F75860], v123);
    return swift_willThrow();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
  uint64_t v28 = swift_initStackObject();
  *(_OWORD *)(v28 + 16) = xmmword_2287A9340;
  v158 = v28;
  *(_WORD *)(v28 + 32) = 1798;
  uint64_t v29 = sub_2287A81A0();
  if (!v29)
  {
    swift_release();
LABEL_97:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v141 = (const char *)v27;
  v142 = *(const char **)(v29 + 16);
  if (!v142)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_97;
  }
  v146 = v8;
  v147 = v7;
  v150 = *(void (**)(char *, const char *, uint64_t))(v157 + 16);
  v145 = (const char *)(v29
                      + ((*(unsigned __int8 *)(v157 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80)));
  v143 = (const char *)(v157 + 8);
  v151 = (const char *)(v157 + 16);
  v144 = *(const char **)(v157 + 72);
  v139 = v29;
  swift_bridgeObjectRetain();
  v30 = 0;
  v153 = (unint64_t)"emergencyConfirmation";
  v138[5] = "emergency";
  v138[4] = "emergencyAttribute";
  v138[3] = "emergencySirenNoun";
  v138[2] = "crisisSituationHigh";
  v138[1] = "crisisSituationMedium";
  uint64_t v31 = v162;
  v148 = v10;
  v156 = a1;
  v149 = v11;
  while (1)
  {
    v152 = v30 + 1;
    v150(v21, &v145[(void)v144 * (void)v30], v31);
    v175 = MEMORY[0x263F8EE78];
    uint64_t v58 = 0xD000000000000015;
    unint64_t v59 = v153 | 0x8000000000000000;
    switch(*(unsigned char *)(v158 + 32))
    {
      case 1:
        v60 = &v169;
        goto LABEL_55;
      case 2:
        v60 = &v168;
        goto LABEL_55;
      case 3:
        uint64_t v58 = 0xD000000000000013;
        v61 = &v167;
        goto LABEL_53;
      case 4:
        uint64_t v58 = 0xD000000000000015;
        v61 = &v166;
LABEL_53:
        unint64_t v59 = *((void *)v61 - 32) | 0x8000000000000000;
        break;
      case 5:
        v60 = &v165;
LABEL_55:
        unint64_t v59 = *((void *)v60 - 32) | 0x8000000000000000;
        uint64_t v58 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v59 = 0xEB00000000657079;
        uint64_t v58 = 0x54746361746E6F63;
        break;
      case 7:
        unint64_t v59 = 0xE900000000000065;
        uint64_t v58 = 0x707954656E6F6870;
        break;
      case 8:
        unint64_t v59 = 0xEA0000000000656DLL;
        uint64_t v58 = 0x614E746E65746E69;
        break;
      default:
        break;
    }
    sub_2287A78F0();
    v62 = *(void **)(v175 + 16);
    sub_2287A793C(v62);
    uint64_t v63 = sub_2287A7980((uint64_t)v62, v58, v59);
    nullsub_1(v63);
    uint64_t v64 = 0xD000000000000015;
    unint64_t v65 = v153 | 0x8000000000000000;
    switch(*(unsigned char *)(v158 + 33))
    {
      case 1:
        v66 = &v169;
        goto LABEL_66;
      case 2:
        v66 = &v168;
        goto LABEL_66;
      case 3:
        uint64_t v64 = 0xD000000000000013;
        v67 = &v167;
        goto LABEL_64;
      case 4:
        uint64_t v64 = 0xD000000000000015;
        v67 = &v166;
LABEL_64:
        unint64_t v65 = *((void *)v67 - 32) | 0x8000000000000000;
        break;
      case 5:
        v66 = &v165;
LABEL_66:
        unint64_t v65 = *((void *)v66 - 32) | 0x8000000000000000;
        uint64_t v64 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v65 = 0xEB00000000657079;
        uint64_t v64 = 0x54746361746E6F63;
        break;
      case 7:
        unint64_t v65 = 0xE900000000000065;
        uint64_t v64 = 0x707954656E6F6870;
        break;
      case 8:
        unint64_t v65 = 0xEA0000000000656DLL;
        uint64_t v64 = 0x614E746E65746E69;
        break;
      default:
        break;
    }
    sub_2287A78F0();
    v68 = *(void **)(v175 + 16);
    sub_2287A793C(v68);
    uint64_t v69 = sub_2287A7980((uint64_t)v68, v64, v65);
    nullsub_1(v69);
    uint64_t v70 = v175;
    uint64_t v71 = sub_2287A8180();
    uint64_t v73 = v72 ? v71 : 0;
    unint64_t v74 = v72 ? v72 : 0xE000000000000000;
    uint64_t v75 = sub_2287A7F5C(v70);
    if (v75) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_47:
    swift_bridgeObjectRelease();
    uint64_t v31 = v162;
    (*(void (**)(char *, uint64_t))v143)(v21, v162);
    v30 = v152;
    a1 = v156;
    if (v152 == v142)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = v147;
      uint64_t v8 = v146;
      goto LABEL_97;
    }
  }
  uint64_t v76 = v75;
  if (*(void *)(v70 + 32) == v73 && *(void *)(v70 + 40) == v74)
  {
    swift_bridgeObjectRelease();
    goto LABEL_94;
  }
  char v77 = sub_2287A85F0();
  swift_bridgeObjectRetain();
  if (v77)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_94;
  }
  if (v76 == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }
  v140 = v70;
  v78 = (void *)(v70 + 56);
  uint64_t v79 = 1;
  while (1)
  {
    uint64_t v80 = v79 + 1;
    if (__OFADD__(v79, 1))
    {
      __break(1u);
      JUMPOUT(0x228791A8CLL);
    }
    BOOL v81 = *(v78 - 1) == v73 && *v78 == v74;
    if (v81 || (sub_2287A85F0() & 1) != 0) {
      break;
    }
    v78 += 2;
    ++v79;
    if (v80 == v76)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v10 = v148;
      uint64_t v11 = v149;
      goto LABEL_47;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v10 = v148;
LABEL_94:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v82 = v157 + 32;
  uint64_t v83 = v162;
  (*(void (**)(char *, char *, uint64_t))(v157 + 32))(v26, v21, v162);
  uint64_t v84 = sub_2287A8170();
  uint64_t v86 = v85;
  (*(void (**)(char *, uint64_t))(v82 - 24))(v26, v83);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_deallocClassInstance();
  char v87 = _s20SiriEmergencyIntents0B9AttributeO4from15identifierValueACSgSS_tFZ_0(v84, v86);
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v7 = v147;
  uint64_t v8 = v146;
  a1 = v156;
  uint64_t v11 = v149;
  if (v87 == 2) {
    goto LABEL_10;
  }
LABEL_152:
  LOBYTE(v116) = v87 & 1;
LABEL_147:
  *v161 = v116;
  return result;
}

uint64_t sub_228791B84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = sub_2287A83C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (Siri_Nlu_External_UserParse.usoTask.getter()
    && (uint64_t v6 = sub_2287A8340(),
        uint64_t v8 = v7,
        swift_release(),
        char v9 = _s20SiriEmergencyIntents0B4VerbO4from07usoTaskD0ACSgSSSg_tFZ_0(v6, v8),
        uint64_t result = swift_bridgeObjectRelease(),
        v9 != 8))
  {
    *a1 = v9;
  }
  else
  {
    uint64_t v11 = sub_2287A83A0();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
    uint64_t v12 = sub_2287A83B0();
    os_log_type_t v13 = sub_2287A84C0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_22878A000, v12, v13, "No EmergencyVerb found in user parse", v14, 2u);
      MEMORY[0x22A69C820](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v15 = sub_2287A8370();
    sub_228797E30();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v15 - 8) + 104))(v16, *MEMORY[0x263F75860], v15);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_228791DC0@<X0>(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v4 = v3;
  v222 = a3;
  uint64_t v220 = sub_2287A83C0();
  uint64_t v219 = *(void *)(v220 - 8);
  MEMORY[0x270FA5388](v220);
  uint64_t v8 = (char *)v199 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v236 = sub_2287A8390();
  uint64_t v229 = *(void *)(v236 - 8);
  MEMORY[0x270FA5388](v236);
  v235 = (char *)v199 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2287A8110();
  uint64_t v226 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v237 = (char *)v199 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v199 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v233 = sub_2287A8190();
  v214 = *(const char **)(v233 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v233);
  v230 = (void (**)(char *, uint64_t))((char *)v199 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v231 = (char *)v199 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v232 = (char *)v199 - v20;
  MEMORY[0x270FA5388](v19);
  v228 = (char *)v199 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263080);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)v199 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  v212 = (char *)v199 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v213 = (uint64_t)v199 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = &unk_2287A9000;
  uint64_t v234 = v10;
  v223 = v14;
  if ((a2 & 1) == 0) {
    goto LABEL_154;
  }
  unint64_t v211 = (unint64_t)v199 - v30;
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (v248)
  {
    sub_2287A8260();
    if (swift_dynamicCast())
    {
      sub_2287A8290();
      swift_release();
      uint64_t v32 = v245;
      uint64_t v33 = v211;
      if (v245)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2287A9350;
        uint64_t v201 = inited;
        *(unsigned char *)(inited + 32) = 0;
        v203 = (unsigned __int8 *)(inited + 32);
        uint64_t v35 = sub_2287A81A0();
        if (v35)
        {
          v199[1] = v32;
          v202 = v25;
          uint64_t v210 = *(void *)(v35 + 16);
          if (v210)
          {
            uint64_t v224 = a1;
            uint64_t v221 = v3;
            v218 = v8;
            unint64_t v36 = v214;
            uint64_t v209 = v35 + ((*((unsigned __int8 *)v36 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v36 + 80));
            uint64_t v37 = v35;
            uint64_t v38 = sub_2287A78E8(v201);
            uint64_t v39 = *((void *)v36 + 2);
            v36 += 16;
            uint64_t v207 = v39;
            v204 = (void (**)(const char *, uint64_t))(v36 - 8);
            v208 = v36;
            uint64_t v206 = *((void *)v36 + 7);
            uint64_t v200 = v37;
            swift_bridgeObjectRetain_n();
            uint64_t v40 = 0;
            v227 = "emergency";
            v225 = "emergencyAttribute";
            v217 = "emergencySirenNoun";
            v216 = "crisisSituationHigh";
            uint64_t v215 = (uint64_t)"crisisSituationMedium";
            uint64_t v41 = v233;
            v42 = v228;
            v205 = (unsigned __int8 *)v38;
            while (1)
            {
              ((void (*)(const char *, uint64_t, uint64_t))v207)(v42, v209 + v206 * v40, v41);
              uint64_t v43 = sub_2287A784C(0);
              v245 = (void *)v43;
              if (v38)
              {
                v44 = v203;
                uint64_t v45 = v38;
                if (v38 < 1) {
                  goto LABEL_210;
                }
                do
                {
                  int v51 = *v44++;
                  uint64_t v48 = 0xD000000000000015;
                  unint64_t v47 = 0x80000002287A9FB0;
                  switch(v51)
                  {
                    case 1:
                      uint64_t v46 = &v246;
                      goto LABEL_12;
                    case 2:
                      uint64_t v46 = &v244;
                      goto LABEL_12;
                    case 3:
                      uint64_t v48 = 0xD000000000000013;
                      v52 = &v243;
                      goto LABEL_18;
                    case 4:
                      uint64_t v48 = 0xD000000000000015;
                      v52 = &v242;
LABEL_18:
                      unint64_t v47 = *((void *)v52 - 32) | 0x8000000000000000;
                      break;
                    case 5:
                      uint64_t v46 = &v241;
LABEL_12:
                      unint64_t v47 = *((void *)v46 - 32) | 0x8000000000000000;
                      uint64_t v48 = 0xD000000000000012;
                      break;
                    case 6:
                      uint64_t v48 = 0x54746361746E6F63;
                      unint64_t v47 = 0xEB00000000657079;
                      break;
                    case 7:
                      uint64_t v48 = 0x707954656E6F6870;
                      unint64_t v47 = 0xE900000000000065;
                      break;
                    case 8:
                      uint64_t v48 = 0x614E746E65746E69;
                      unint64_t v47 = 0xEA0000000000656DLL;
                      break;
                    default:
                      break;
                  }
                  sub_2287A78F0();
                  v49 = (void *)v245[2];
                  sub_2287A793C(v49);
                  uint64_t v50 = sub_2287A7980((uint64_t)v49, v48, v47);
                  nullsub_1(v50);
                  --v45;
                }
                while (v45);
                v53 = v245;
                uint64_t v31 = (_OWORD *)&unk_2287A9000;
                uint64_t v41 = v233;
                v42 = v228;
              }
              else
              {
                v53 = (void *)v43;
              }
              uint64_t v54 = sub_2287A8180();
              if (v55)
              {
                uint64_t v56 = v55;
              }
              else
              {
                uint64_t v54 = 0;
                uint64_t v56 = 0xE000000000000000;
              }
              char v57 = sub_2287A7500(v54, v56, v53);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v57) {
                break;
              }
              ++v40;
              (*v204)(v42, v41);
              uint64_t v38 = (uint64_t)v205;
              if (v40 == v210)
              {
                swift_bridgeObjectRelease();
                uint64_t v58 = 1;
                uint64_t v8 = v218;
                uint64_t v4 = v221;
                a1 = v224;
                uint64_t v10 = v234;
                unint64_t v59 = v214;
                uint64_t v33 = v211;
                goto LABEL_68;
              }
            }
            swift_bridgeObjectRelease();
            unint64_t v59 = v214;
            uint64_t v33 = v211;
            (*((void (**)(void))v214 + 4))();
            uint64_t v58 = 0;
            uint64_t v8 = v218;
            uint64_t v4 = v221;
            a1 = v224;
            uint64_t v10 = v234;
          }
          else
          {
            uint64_t v200 = v35;
            swift_bridgeObjectRetain();
            uint64_t v58 = 1;
            unint64_t v59 = v214;
          }
LABEL_68:
          uint64_t v88 = v33;
          uint64_t v89 = v33;
          uint64_t v90 = v233;
          (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v59 + 7))(v88, v58, 1, v233);
          swift_bridgeObjectRelease();
          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v59 + 6))(v89, 1, v90) == 1)
          {
            sub_228797E88(v89, &qword_268263080);
            swift_release();
            swift_bridgeObjectRelease();
            uint64_t v25 = v202;
            swift_bridgeObjectRelease();
          }
          else
          {
            v228 = (const char *)sub_2287A8170();
            v227 = v91;
            (*((void (**)(uint64_t, uint64_t))v59 + 1))(v89, v90);
            swift_bridgeObjectRelease();
            swift_setDeallocating();
            swift_deallocClassInstance();
            char v92 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
            uint64_t result = swift_release();
            uint64_t v25 = v202;
            if (v92 != 4) {
              goto LABEL_200;
            }
          }
        }
        else
        {
          swift_release();
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  else
  {
    sub_228797E88((uint64_t)&v245, &qword_268263090);
  }
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v248)
  {
    sub_228797E88((uint64_t)&v245, &qword_268263090);
    goto LABEL_76;
  }
  sub_2287A8280();
  if (swift_dynamicCast())
  {
    sub_2287A81F0();
    swift_release();
    v60 = (unsigned __int8 *)v245;
    if (v245)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
      v61 = (_OWORD *)swift_initStackObject();
      v61[1] = v31[53];
      *((unsigned char *)v61 + 32) = 0;
      v205 = (unsigned __int8 *)(v61 + 2);
      uint64_t v62 = sub_2287A81A0();
      if (!v62)
      {
        swift_release();
LABEL_75:
        swift_bridgeObjectRelease();
        goto LABEL_76;
      }
      v204 = (void (**)(const char *, uint64_t))v61;
      v203 = v60;
      v202 = v25;
      uint64_t v215 = *(void *)(v62 + 16);
      uint64_t v221 = v4;
      if (v215)
      {
        uint64_t v224 = a1;
        v218 = v8;
        uint64_t v63 = v214;
        unint64_t v211 = v62 + ((*((unsigned __int8 *)v63 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v63 + 80));
        uint64_t v64 = v62;
        uint64_t v210 = sub_2287A78E8((uint64_t)v204);
        unint64_t v65 = (const char *)*((void *)v63 + 2);
        v63 += 16;
        v208 = v65;
        uint64_t v206 = (uint64_t)(v63 - 8);
        uint64_t v209 = (uint64_t)v63;
        uint64_t v207 = *((void *)v63 + 7);
        uint64_t v201 = v64;
        swift_bridgeObjectRetain_n();
        uint64_t v66 = 0;
        v228 = "emergency";
        v227 = "emergencyAttribute";
        v225 = "emergencySirenNoun";
        v217 = "crisisSituationHigh";
        v216 = "crisisSituationMedium";
        uint64_t v67 = v233;
        v68 = v232;
        while (1)
        {
          ((void (*)(const char *, unint64_t, uint64_t))v208)(v68, v211 + v207 * v66, v67);
          uint64_t v69 = sub_2287A784C(0);
          v245 = (void *)v69;
          if (v210)
          {
            uint64_t v70 = v205;
            uint64_t v71 = v210;
            if (v210 < 1) {
              goto LABEL_211;
            }
            do
            {
              int v77 = *v70++;
              uint64_t v74 = 0xD000000000000015;
              unint64_t v73 = 0x80000002287A9FB0;
              switch(v77)
              {
                case 1:
                  unint64_t v72 = &v247;
                  goto LABEL_42;
                case 2:
                  unint64_t v72 = &v246;
                  goto LABEL_42;
                case 3:
                  uint64_t v74 = 0xD000000000000013;
                  v78 = &v244;
                  goto LABEL_48;
                case 4:
                  uint64_t v74 = 0xD000000000000015;
                  v78 = &v243;
LABEL_48:
                  unint64_t v73 = *((void *)v78 - 32) | 0x8000000000000000;
                  break;
                case 5:
                  unint64_t v72 = &v242;
LABEL_42:
                  unint64_t v73 = *((void *)v72 - 32) | 0x8000000000000000;
                  uint64_t v74 = 0xD000000000000012;
                  break;
                case 6:
                  uint64_t v74 = 0x54746361746E6F63;
                  unint64_t v73 = 0xEB00000000657079;
                  break;
                case 7:
                  uint64_t v74 = 0x707954656E6F6870;
                  unint64_t v73 = 0xE900000000000065;
                  break;
                case 8:
                  uint64_t v74 = 0x614E746E65746E69;
                  unint64_t v73 = 0xEA0000000000656DLL;
                  break;
                default:
                  break;
              }
              sub_2287A78F0();
              uint64_t v75 = (void *)v245[2];
              sub_2287A793C(v75);
              uint64_t v76 = sub_2287A7980((uint64_t)v75, v74, v73);
              nullsub_1(v76);
              --v71;
            }
            while (v71);
            uint64_t v79 = v245;
            uint64_t v10 = v234;
            uint64_t v67 = v233;
          }
          else
          {
            uint64_t v79 = (void *)v69;
          }
          uint64_t v80 = v232;
          uint64_t v81 = sub_2287A8180();
          if (v82)
          {
            uint64_t v83 = v82;
          }
          else
          {
            uint64_t v81 = 0;
            uint64_t v83 = 0xE000000000000000;
          }
          char v84 = sub_2287A7500(v81, v83, v79);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v84) {
            break;
          }
          ++v66;
          (*(void (**)(const char *, uint64_t))v206)(v80, v67);
          v68 = v80;
          if (v66 == v215)
          {
            swift_bridgeObjectRelease();
            uint64_t v85 = 1;
            uint64_t v8 = v218;
            a1 = v224;
            uint64_t v31 = (_OWORD *)&unk_2287A9000;
            goto LABEL_66;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v86 = v214;
        uint64_t v87 = v213;
        (*((void (**)(uint64_t, const char *, uint64_t))v214 + 4))(v213, v80, v67);
        uint64_t v85 = 0;
        uint64_t v8 = v218;
        a1 = v224;
        uint64_t v31 = &unk_2287A9000;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v85 = 1;
LABEL_66:
        uint64_t v86 = v214;
        uint64_t v87 = v213;
      }
      uint64_t v94 = v233;
      (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v86 + 7))(v87, v85, 1, v233);
      swift_bridgeObjectRelease();
      if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v86 + 6))(v87, 1, v94) == 1)
      {
        sub_228797E88(v87, &qword_268263080);
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v25 = v202;
        uint64_t v4 = v221;
        goto LABEL_75;
      }
      sub_2287A8170();
      v232 = v123;
      (*((void (**)(uint64_t, uint64_t))v86 + 1))(v87, v94);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_deallocClassInstance();
      char v92 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
      uint64_t result = swift_release();
      uint64_t v25 = v202;
      uint64_t v4 = v221;
      if (v92 != 4) {
        goto LABEL_200;
      }
    }
  }
LABEL_76:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v248)
  {
    sub_228797E88((uint64_t)&v245, &qword_268263090);
    goto LABEL_115;
  }
  sub_2287A8300();
  if (swift_dynamicCast())
  {
    sub_2287A81F0();
    swift_release();
    v95 = (void (**)(const char *, uint64_t))v245;
    if (v245)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
      uint64_t v96 = swift_initStackObject();
      *(_OWORD *)(v96 + 16) = v31[53];
      *(unsigned char *)(v96 + 32) = 0;
      uint64_t v207 = v96 + 32;
      uint64_t v97 = sub_2287A81A0();
      if (!v97)
      {
        swift_release();
LABEL_114:
        swift_bridgeObjectRelease();
        goto LABEL_115;
      }
      uint64_t v206 = v96;
      v204 = v95;
      v202 = v25;
      v216 = *(const char **)(v97 + 16);
      if (v216)
      {
        uint64_t v221 = v4;
        v218 = v8;
        v98 = v214;
        uint64_t v215 = v97 + ((*((unsigned __int8 *)v98 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v98 + 80));
        uint64_t v99 = v97;
        uint64_t v213 = sub_2287A78E8(v206);
        uint64_t v100 = *((void *)v98 + 2);
        v98 += 16;
        uint64_t v210 = v100;
        v208 = v98 - 8;
        unint64_t v211 = (unint64_t)v98;
        uint64_t v209 = *((void *)v98 + 7);
        v205 = (unsigned __int8 *)v99;
        swift_bridgeObjectRetain_n();
        uint64_t v101 = 0;
        v232 = "emergency";
        v228 = "emergencyAttribute";
        v227 = "emergencySirenNoun";
        v225 = "crisisSituationHigh";
        v217 = "crisisSituationMedium";
        uint64_t v102 = v233;
        unint64_t v103 = v231;
        uint64_t v224 = a1;
        while (1)
        {
          ((void (*)(const char *, uint64_t, uint64_t))v210)(v103, v215 + v209 * (void)v101, v102);
          uint64_t v104 = sub_2287A784C(0);
          v245 = (void *)v104;
          if (v213)
          {
            v105 = (unsigned __int8 *)v207;
            uint64_t v106 = v213;
            if (v213 < 1) {
              goto LABEL_212;
            }
            do
            {
              int v112 = *v105++;
              uint64_t v109 = 0xD000000000000015;
              unint64_t v108 = 0x80000002287A9FB0;
              switch(v112)
              {
                case 1:
                  uint64_t v107 = &v250;
                  goto LABEL_86;
                case 2:
                  uint64_t v107 = &v247;
                  goto LABEL_86;
                case 3:
                  uint64_t v109 = 0xD000000000000013;
                  char v113 = &v246;
                  goto LABEL_92;
                case 4:
                  uint64_t v109 = 0xD000000000000015;
                  char v113 = &v244;
LABEL_92:
                  unint64_t v108 = *((void *)v113 - 32) | 0x8000000000000000;
                  break;
                case 5:
                  uint64_t v107 = &v243;
LABEL_86:
                  unint64_t v108 = *((void *)v107 - 32) | 0x8000000000000000;
                  uint64_t v109 = 0xD000000000000012;
                  break;
                case 6:
                  uint64_t v109 = 0x54746361746E6F63;
                  unint64_t v108 = 0xEB00000000657079;
                  break;
                case 7:
                  uint64_t v109 = 0x707954656E6F6870;
                  unint64_t v108 = 0xE900000000000065;
                  break;
                case 8:
                  uint64_t v109 = 0x614E746E65746E69;
                  unint64_t v108 = 0xEA0000000000656DLL;
                  break;
                default:
                  break;
              }
              sub_2287A78F0();
              uint64_t v110 = (void *)v245[2];
              sub_2287A793C(v110);
              uint64_t v111 = sub_2287A7980((uint64_t)v110, v109, v108);
              nullsub_1(v111);
              --v106;
            }
            while (v106);
            v114 = v245;
            uint64_t v115 = v224;
            uint64_t v102 = v233;
          }
          else
          {
            v114 = (void *)v104;
            uint64_t v115 = a1;
          }
          v116 = v231;
          uint64_t v117 = sub_2287A8180();
          if (v118)
          {
            uint64_t v119 = v118;
          }
          else
          {
            uint64_t v117 = 0;
            uint64_t v119 = 0xE000000000000000;
          }
          char v120 = sub_2287A7500(v117, v119, v114);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v120) {
            break;
          }
          ++v101;
          (*(void (**)(const char *, uint64_t))v208)(v116, v102);
          unint64_t v103 = v116;
          a1 = v115;
          uint64_t v10 = v234;
          if (v101 == v216)
          {
            uint64_t v121 = (uint64_t)v205;
            swift_bridgeObjectRelease();
            uint64_t v122 = 1;
            uint64_t v8 = v218;
            uint64_t v4 = v221;
            uint64_t v31 = (_OWORD *)&unk_2287A9000;
            goto LABEL_110;
          }
        }
        v126 = v205;
        swift_bridgeObjectRelease();
        v124 = v214;
        uint64_t v125 = (uint64_t)v212;
        v127 = v116;
        uint64_t v121 = (uint64_t)v126;
        (*((void (**)(const char *, const char *, uint64_t))v214 + 4))(v212, v127, v102);
        uint64_t v122 = 0;
        uint64_t v8 = v218;
        uint64_t v4 = v221;
        uint64_t v31 = &unk_2287A9000;
        a1 = v115;
        uint64_t v10 = v234;
      }
      else
      {
        uint64_t v121 = v97;
        swift_bridgeObjectRetain();
        uint64_t v122 = 1;
LABEL_110:
        v124 = v214;
        uint64_t v125 = (uint64_t)v212;
      }
      uint64_t v128 = v233;
      (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v124 + 7))(v125, v122, 1, v233);
      swift_bridgeObjectRelease();
      if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v124 + 6))(v125, 1, v128) == 1)
      {
        sub_228797E88(v125, &qword_268263080);
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v25 = v202;
        goto LABEL_114;
      }
      v205 = (unsigned __int8 *)v121;
      sub_2287A8170();
      v232 = v156;
      (*((void (**)(uint64_t, uint64_t))v124 + 1))(v125, v128);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_deallocClassInstance();
      char v92 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
      uint64_t result = swift_release();
      uint64_t v25 = v202;
      if (v92 != 4) {
        goto LABEL_200;
      }
    }
  }
LABEL_115:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (v248)
  {
    sub_2287A8230();
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_154;
    }
    sub_2287A8140();
    swift_release();
    uint64_t v129 = (uint64_t)v245;
    if (!v245) {
      goto LABEL_154;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
    uint64_t v130 = swift_initStackObject();
    *(_OWORD *)(v130 + 16) = v31[53];
    *(unsigned char *)(v130 + 32) = 0;
    uint64_t v209 = v130 + 32;
    uint64_t v131 = sub_2287A81A0();
    if (!v131)
    {
      swift_release();
LABEL_153:
      swift_bridgeObjectRelease();
      goto LABEL_154;
    }
    uint64_t v207 = v130;
    uint64_t v206 = v129;
    v202 = v25;
    v217 = *(const char **)(v131 + 16);
    if (v217)
    {
      uint64_t v221 = v4;
      v218 = v8;
      v132 = v214;
      v216 = (const char *)(v131
                          + ((*((unsigned __int8 *)v132 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v132 + 80)));
      v133 = (const char *)v131;
      uint64_t v215 = sub_2287A78E8(v207);
      v134 = (const char *)*((void *)v132 + 2);
      v132 += 16;
      v212 = v134;
      uint64_t v210 = (uint64_t)(v132 - 8);
      uint64_t v213 = (uint64_t)v132;
      unint64_t v211 = *((void *)v132 + 7);
      v208 = v133;
      swift_bridgeObjectRetain_n();
      v135 = 0;
      v232 = "emergency";
      v231 = "emergencyAttribute";
      v228 = "emergencySirenNoun";
      v227 = "crisisSituationHigh";
      v225 = "crisisSituationMedium";
      uint64_t v136 = v233;
      v137 = (char *)v230;
      uint64_t v224 = a1;
      while (1)
      {
        ((void (*)(char *, const char *, uint64_t))v212)(v137, &v216[v211 * (void)v135], v136);
        uint64_t v138 = sub_2287A784C(0);
        v245 = (void *)v138;
        if (v215)
        {
          v139 = (unsigned __int8 *)v209;
          uint64_t v140 = v215;
          if (v215 < 1) {
            goto LABEL_213;
          }
          do
          {
            int v146 = *v139++;
            uint64_t v143 = 0xD000000000000015;
            unint64_t v142 = 0x80000002287A9FB0;
            switch(v146)
            {
              case 1:
                v141 = &v250;
                goto LABEL_125;
              case 2:
                v141 = &v249;
                goto LABEL_125;
              case 3:
                uint64_t v143 = 0xD000000000000013;
                v147 = &v247;
                goto LABEL_131;
              case 4:
                uint64_t v143 = 0xD000000000000015;
                v147 = &v246;
LABEL_131:
                unint64_t v142 = *((void *)v147 - 32) | 0x8000000000000000;
                break;
              case 5:
                v141 = &v244;
LABEL_125:
                unint64_t v142 = *((void *)v141 - 32) | 0x8000000000000000;
                uint64_t v143 = 0xD000000000000012;
                break;
              case 6:
                uint64_t v143 = 0x54746361746E6F63;
                unint64_t v142 = 0xEB00000000657079;
                break;
              case 7:
                uint64_t v143 = 0x707954656E6F6870;
                unint64_t v142 = 0xE900000000000065;
                break;
              case 8:
                uint64_t v143 = 0x614E746E65746E69;
                unint64_t v142 = 0xEA0000000000656DLL;
                break;
              default:
                break;
            }
            sub_2287A78F0();
            v144 = (void *)v245[2];
            sub_2287A793C(v144);
            uint64_t v145 = sub_2287A7980((uint64_t)v144, v143, v142);
            nullsub_1(v145);
            --v140;
          }
          while (v140);
          v148 = v245;
          uint64_t v149 = v224;
          uint64_t v136 = v233;
        }
        else
        {
          v148 = (void *)v138;
          uint64_t v149 = a1;
        }
        v150 = (char *)v230;
        uint64_t v151 = sub_2287A8180();
        if (v152)
        {
          uint64_t v153 = v152;
        }
        else
        {
          uint64_t v151 = 0;
          uint64_t v153 = 0xE000000000000000;
        }
        char v154 = sub_2287A7500(v151, v153, v148);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v154) {
          break;
        }
        ++v135;
        (*(void (**)(char *, uint64_t))v210)(v150, v136);
        v137 = v150;
        a1 = v149;
        uint64_t v10 = v234;
        if (v135 == v217)
        {
          swift_bridgeObjectRelease();
          uint64_t v155 = 1;
          uint64_t v8 = v218;
          uint64_t v4 = v221;
          uint64_t v31 = (_OWORD *)&unk_2287A9000;
          goto LABEL_149;
        }
      }
      swift_bridgeObjectRelease();
      v157 = v214;
      (*((void (**)(char *, char *, uint64_t))v214 + 4))(v202, v150, v136);
      uint64_t v155 = 0;
      uint64_t v8 = v218;
      uint64_t v4 = v221;
      uint64_t v31 = &unk_2287A9000;
      a1 = v149;
      uint64_t v10 = v234;
    }
    else
    {
      v208 = (const char *)v131;
      swift_bridgeObjectRetain();
      uint64_t v155 = 1;
LABEL_149:
      v157 = v214;
    }
    uint64_t v158 = (uint64_t)v202;
    uint64_t v159 = v233;
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v157 + 7))(v202, v155, 1, v233);
    swift_bridgeObjectRelease();
    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v157 + 6))(v158, 1, v159) == 1)
    {
      sub_228797E88(v158, &qword_268263080);
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_153;
    }
    v232 = (const char *)sub_2287A8170();
    v231 = v198;
    (*((void (**)(uint64_t, uint64_t))v157 + 1))(v158, v159);
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_deallocClassInstance();
    char v92 = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
    uint64_t result = swift_release();
    if (v92 == 4) {
      goto LABEL_154;
    }
LABEL_200:
    unsigned char *v222 = v92;
    return result;
  }
  sub_228797E88((uint64_t)&v245, &qword_268263090);
LABEL_154:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
  uint64_t v160 = swift_initStackObject();
  *(_OWORD *)(v160 + 16) = v31[53];
  *(unsigned char *)(v160 + 32) = 0;
  uint64_t v161 = Siri_Nlu_External_UserParse.identifiers.getter();
  v227 = *(const char **)(v161 + 16);
  if (!v227)
  {
    uint64_t v188 = 1;
    uint64_t v162 = v226;
    goto LABEL_193;
  }
  uint64_t v224 = a1;
  uint64_t v221 = v4;
  v218 = v8;
  uint64_t v162 = v226;
  v232 = *(const char **)(v226 + 16);
  v231 = (const char *)(v161
                      + ((*(unsigned __int8 *)(v226 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v226 + 80)));
  v230 = (void (**)(char *, uint64_t))(v229 + 8);
  v225 = (const char *)(v226 + 8);
  uint64_t v233 = v226 + 16;
  uint64_t v229 = *(void *)(v226 + 72);
  v217 = (const char *)v161;
  swift_bridgeObjectRetain();
  v163 = 0;
  v228 = "emergencyConfirmation";
  v216 = "emergency";
  uint64_t v215 = (uint64_t)"emergencyAttribute";
  v214 = "emergencySirenNoun";
  uint64_t v213 = (uint64_t)"crisisSituationHigh";
  v212 = "crisisSituationMedium";
  v164 = v237;
  while (2)
  {
    v165 = &v231[v229 * (void)v163++];
    ((void (*)(char *, const char *, uint64_t))v232)(v164, v165, v10);
    uint64_t v166 = *(unsigned __int8 *)(v160 + 32);
    swift_bridgeObjectRetain();
    unint64_t v167 = 0xD000000000000015;
    unint64_t v168 = (unint64_t)v228 | 0x8000000000000000;
    switch(v166)
    {
      case 1:
        v169 = &v242;
        goto LABEL_165;
      case 2:
        v169 = &v241;
        goto LABEL_165;
      case 3:
        unint64_t v167 = 0xD000000000000013;
        v170 = &v240;
        goto LABEL_163;
      case 4:
        unint64_t v167 = 0xD000000000000015;
        v170 = &v239;
LABEL_163:
        unint64_t v168 = *((void *)v170 - 32) | 0x8000000000000000;
        break;
      case 5:
        v169 = &v238;
LABEL_165:
        unint64_t v168 = *((void *)v169 - 32) | 0x8000000000000000;
        unint64_t v167 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v168 = 0xEB00000000657079;
        unint64_t v167 = 0x54746361746E6F63;
        break;
      case 7:
        unint64_t v168 = 0xE900000000000065;
        unint64_t v167 = 0x707954656E6F6870;
        break;
      case 8:
        unint64_t v168 = 0xEA0000000000656DLL;
        unint64_t v167 = 0x614E746E65746E69;
        break;
      default:
        break;
    }
    v171 = (void *)MEMORY[0x263F8EE78];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v171 = sub_2287A7C00(0, *(void *)(MEMORY[0x263F8EE78] + 16) + 1, 1, MEMORY[0x263F8EE78]);
    }
    unint64_t v173 = v171[2];
    unint64_t v172 = v171[3];
    if (v173 >= v172 >> 1) {
      v171 = sub_2287A7C00((void *)(v172 > 1), v173 + 1, 1, v171);
    }
    v171[2] = v173 + 1;
    v174 = &v171[2 * v173];
    v174[4] = v167;
    v174[5] = v168;
    swift_bridgeObjectRelease();
    v175 = v235;
    sub_2287A8100();
    uint64_t v176 = sub_2287A8380();
    uint64_t v178 = v177;
    (*v230)(v175, v236);
    uint64_t v179 = sub_2287A7F5C((uint64_t)v171);
    if (!v179)
    {
      swift_bridgeObjectRelease();
      goto LABEL_157;
    }
    uint64_t v180 = v179;
    if (v171[4] == v176 && v171[5] == v178)
    {
      swift_bridgeObjectRelease();
LABEL_191:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v187 = (uint64_t)v223;
      (*(void (**)(char *, char *, uint64_t))(v162 + 32))(v223, v237, v10);
      uint64_t v188 = 0;
      uint64_t v8 = v218;
      goto LABEL_194;
    }
    char v182 = sub_2287A85F0();
    swift_bridgeObjectRetain();
    if (v182)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_191;
    }
    if (v180 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_157;
    }
    v183 = v171 + 7;
    uint64_t v184 = 1;
    do
    {
      uint64_t v185 = v184 + 1;
      if (__OFADD__(v184, 1))
      {
        __break(1u);
LABEL_210:
        __break(1u);
LABEL_211:
        __break(1u);
LABEL_212:
        __break(1u);
LABEL_213:
        __break(1u);
        JUMPOUT(0x22879413CLL);
      }
      BOOL v186 = *(v183 - 1) == v176 && *v183 == v178;
      if (v186 || (sub_2287A85F0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v10 = v234;
        uint64_t v162 = v226;
        goto LABEL_191;
      }
      v183 += 2;
      ++v184;
    }
    while (v185 != v180);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = v234;
    uint64_t v162 = v226;
LABEL_157:
    swift_bridgeObjectRelease();
    v164 = v237;
    (*(void (**)(char *, uint64_t))v225)(v237, v10);
    if (v163 != v227) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  uint64_t v188 = 1;
  uint64_t v8 = v218;
LABEL_193:
  uint64_t v187 = (uint64_t)v223;
LABEL_194:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v162 + 56))(v187, v188, 1, v10);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v162 + 48))(v187, 1, v10) != 1)
  {
    sub_2287A80F0();
    (*(void (**)(uint64_t, uint64_t))(v162 + 8))(v187, v10);
    swift_setDeallocating();
    swift_deallocClassInstance();
    uint64_t result = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
    char v92 = result;
    if (result == 4) {
      goto LABEL_197;
    }
    goto LABEL_200;
  }
  sub_228797E88(v187, &qword_2682630A8);
  swift_setDeallocating();
  swift_deallocClassInstance();
LABEL_197:
  Siri_Nlu_External_UserParse.catiIntentName.getter();
  if (v189)
  {
    uint64_t result = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0();
    if ((result - 10) < 0xCu)
    {
      char v92 = byte_2287A9370[(char)(result - 10)];
      goto LABEL_200;
    }
  }
  uint64_t v190 = sub_2287A83A0();
  swift_beginAccess();
  uint64_t v191 = v219;
  uint64_t v192 = v220;
  (*(void (**)(char *, uint64_t, uint64_t))(v219 + 16))(v8, v190, v220);
  v193 = sub_2287A83B0();
  os_log_type_t v194 = sub_2287A84C0();
  if (os_log_type_enabled(v193, v194))
  {
    v195 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v195 = 0;
    _os_log_impl(&dword_22878A000, v193, v194, "No EmergencyOrganization found in user parse", v195, 2u);
    MEMORY[0x22A69C820](v195, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v191 + 8))(v8, v192);
  uint64_t v196 = sub_2287A8370();
  sub_228797E30();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v196 - 8) + 104))(v197, *MEMORY[0x263F75860], v196);
  return swift_willThrow();
}

uint64_t sub_2287941F0@<X0>(const char *a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  v216 = a3;
  uint64_t v224 = sub_2287A83C0();
  uint64_t v5 = *(void *)(v224 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v223 = (char *)v202 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v236 = sub_2287A8390();
  uint64_t v230 = *(void *)(v236 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v235 = (char *)v202 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2287A8110();
  uint64_t v227 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)v202 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v237 = (char *)v202 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2287A8190();
  unint64_t v228 = *(void *)(v12 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v214 = (uint64_t)v202 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v213 = (char *)v202 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v231 = (void (**)(char *, uint64_t))((char *)v202 - v18);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v232 = (uint64_t)v202 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v233 = (char *)v202 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v234 = (char *)v202 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263080);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)v202 - v31;
  uint64_t v229 = a1;
  char v238 = v10;
  if ((a2 & 1) == 0) {
    goto LABEL_166;
  }
  uint64_t v205 = v29;
  uint64_t v206 = v30;
  uint64_t v204 = v28;
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  char v239 = (const char *)v12;
  if (!v241)
  {
    sub_228797E88((uint64_t)v240, &qword_268263090);
    goto LABEL_37;
  }
  sub_2287A82B0();
  if (swift_dynamicCast())
  {
    sub_2287A81C0();
    swift_release();
    uint64_t v33 = v240[0];
    if (v240[0])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2287A9360;
      *(_WORD *)(inited + 32) = 1027;
      *(unsigned char *)(inited + 34) = 5;
      uint64_t v35 = sub_2287A81A0();
      if (!v35)
      {
        swift_release();
LABEL_36:
        swift_bridgeObjectRelease();
        uint64_t v10 = v238;
        goto LABEL_37;
      }
      v202[1] = v33;
      v212 = *(char **)(v35 + 16);
      uint64_t v222 = v8;
      if (v212)
      {
        v202[0] = v32;
        uint64_t v221 = v5;
        unint64_t v36 = v228;
        unint64_t v211 = v35 + ((*(unsigned __int8 *)(v228 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v228 + 80));
        uint64_t v37 = v35;
        uint64_t v38 = sub_2287A78E8(inited);
        uint64_t v209 = *(void *)(v36 + 16);
        unint64_t v210 = v36 + 16;
        uint64_t v39 = *(void *)(v36 + 72);
        uint64_t v207 = (void (**)(const char *, const char *))(v36 + 8);
        uint64_t v208 = v39;
        uint64_t v203 = v37;
        swift_bridgeObjectRetain_n();
        unint64_t v40 = 0;
        v225 = "emergency";
        uint64_t v219 = "emergencySirenNoun";
        uint64_t v220 = "emergencyAttribute";
        v217 = "crisisSituationMedium";
        v218 = "crisisSituationHigh";
        uint64_t v41 = v234;
        while (1)
        {
          unint64_t v215 = v40;
          ((void (*)(const char *, unint64_t, uint64_t))v209)(v41, v211 + v208 * v40, v12);
          uint64_t v42 = sub_2287A784C(0);
          v240[0] = v42;
          if (v38)
          {
            if (v38 < 1) {
              goto LABEL_223;
            }
            swift_bridgeObjectRetain();
            uint64_t v43 = 0;
            do
            {
              uint64_t v46 = 0xD000000000000015;
              unint64_t v45 = 0x80000002287A9FB0;
              switch(*(unsigned char *)(inited + v43 + 32))
              {
                case 1:
                  v44 = v225;
                  goto LABEL_12;
                case 2:
                  v44 = v220;
                  goto LABEL_12;
                case 3:
                  uint64_t v46 = 0xD000000000000013;
                  unint64_t v45 = (unint64_t)v219 | 0x8000000000000000;
                  break;
                case 4:
                  uint64_t v46 = 0xD000000000000015;
                  unint64_t v45 = (unint64_t)v218 | 0x8000000000000000;
                  break;
                case 5:
                  v44 = v217;
LABEL_12:
                  unint64_t v45 = (unint64_t)v44 | 0x8000000000000000;
                  uint64_t v46 = 0xD000000000000012;
                  break;
                case 6:
                  uint64_t v46 = 0x54746361746E6F63;
                  unint64_t v45 = 0xEB00000000657079;
                  break;
                case 7:
                  uint64_t v46 = 0x707954656E6F6870;
                  unint64_t v45 = 0xE900000000000065;
                  break;
                case 8:
                  uint64_t v46 = 0x614E746E65746E69;
                  unint64_t v45 = 0xEA0000000000656DLL;
                  break;
                default:
                  break;
              }
              ++v43;
              sub_2287A78F0();
              unint64_t v47 = *(void **)(v240[0] + 16);
              sub_2287A793C(v47);
              uint64_t v48 = sub_2287A7980((uint64_t)v47, v46, v45);
              nullsub_1(v48);
            }
            while (v38 != v43);
            swift_bridgeObjectRelease();
            v49 = (void *)v240[0];
            a1 = v229;
          }
          else
          {
            v49 = (void *)v42;
          }
          uint64_t v50 = v234;
          uint64_t v51 = sub_2287A8180();
          if (v52)
          {
            uint64_t v53 = v52;
          }
          else
          {
            uint64_t v51 = 0;
            uint64_t v53 = 0xE000000000000000;
          }
          char v54 = sub_2287A7500(v51, v53, v49);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v54) {
            break;
          }
          unint64_t v40 = v215 + 1;
          uint64_t v12 = (uint64_t)v239;
          (*v207)(v50, v239);
          uint64_t v41 = v50;
          if ((char *)v40 == v212)
          {
            uint64_t v55 = v203;
            swift_bridgeObjectRelease();
            uint64_t v56 = 1;
            uint64_t v5 = v221;
            uint64_t v8 = v222;
            unint64_t v57 = v228;
            uint64_t v32 = (char *)v202[0];
            goto LABEL_34;
          }
        }
        uint64_t v58 = v203;
        swift_bridgeObjectRelease();
        unint64_t v57 = v228;
        uint64_t v32 = (char *)v202[0];
        unint64_t v59 = v50;
        uint64_t v55 = v58;
        uint64_t v12 = (uint64_t)v239;
        (*(void (**)(void, const char *, const char *))(v228 + 32))(v202[0], v59, v239);
        uint64_t v56 = 0;
        uint64_t v5 = v221;
        uint64_t v8 = v222;
      }
      else
      {
        uint64_t v55 = v35;
        swift_bridgeObjectRetain();
        uint64_t v56 = 1;
        unint64_t v57 = v228;
      }
LABEL_34:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v32, v56, 1, v12);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v32, 1, v12) == 1)
      {
        sub_228797E88((uint64_t)v32, &qword_268263080);
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
      uint64_t v203 = v55;
      uint64_t v83 = sub_2287A8170();
      uint64_t v85 = v84;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v32, v12);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_deallocClassInstance();
      char v86 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v83, v85);
      swift_release();
      uint64_t v8 = v222;
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = v238;
      uint64_t v12 = (uint64_t)v239;
      if (v86 != 35) {
        goto LABEL_221;
      }
    }
  }
LABEL_37:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v241)
  {
    sub_228797E88((uint64_t)v240, &qword_268263090);
    goto LABEL_75;
  }
  sub_2287A82B0();
  if (swift_dynamicCast())
  {
    sub_2287A81C0();
    swift_release();
    uint64_t v60 = v240[0];
    if (v240[0])
    {
      uint64_t v221 = v5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
      uint64_t v61 = swift_initStackObject();
      *(_OWORD *)(v61 + 16) = xmmword_2287A9350;
      *(unsigned char *)(v61 + 32) = 1;
      uint64_t v62 = sub_2287A81A0();
      if (!v62)
      {
        swift_release();
LABEL_74:
        swift_bridgeObjectRelease();
        uint64_t v5 = v221;
        goto LABEL_75;
      }
      unint64_t v215 = *(void *)(v62 + 16);
      uint64_t v222 = v8;
      if (v215)
      {
        uint64_t v203 = v60;
        unint64_t v63 = v228;
        v212 = (char *)(v62
                      + ((*(unsigned __int8 *)(v228 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v228 + 80)));
        uint64_t v64 = (void (**)(const char *, const char *))v62;
        uint64_t v38 = sub_2287A78E8(v61);
        unint64_t v210 = *(void *)(v63 + 16);
        unint64_t v211 = v63 + 16;
        uint64_t v65 = *(void *)(v63 + 72);
        uint64_t v208 = v63 + 8;
        uint64_t v209 = v65;
        uint64_t v207 = v64;
        swift_bridgeObjectRetain_n();
        uint64_t v66 = 0;
        a1 = "emergencyConfirmation";
        uint64_t v234 = "emergency";
        v225 = "emergencyAttribute";
        uint64_t v219 = "crisisSituationHigh";
        uint64_t v220 = "emergencySirenNoun";
        v218 = "crisisSituationMedium";
        uint64_t v67 = v233;
        while (1)
        {
          v217 = v66;
          ((void (*)(const char *, char *, uint64_t))v210)(v67, &v212[v209 * (void)v66], v12);
          uint64_t v68 = sub_2287A784C(0);
          v240[0] = v68;
          if (v38)
          {
            if (v38 < 1) {
              goto LABEL_224;
            }
            swift_bridgeObjectRetain();
            uint64_t v69 = 0;
            do
            {
              uint64_t v72 = 0xD000000000000015;
              unint64_t v71 = 0x80000002287A9FB0;
              switch(*(unsigned char *)(v61 + v69 + 32))
              {
                case 1:
                  uint64_t v70 = v234;
                  goto LABEL_47;
                case 2:
                  uint64_t v70 = v225;
                  goto LABEL_47;
                case 3:
                  uint64_t v72 = 0xD000000000000013;
                  unint64_t v71 = (unint64_t)v220 | 0x8000000000000000;
                  break;
                case 4:
                  uint64_t v72 = 0xD000000000000015;
                  unint64_t v71 = (unint64_t)v219 | 0x8000000000000000;
                  break;
                case 5:
                  uint64_t v70 = v218;
LABEL_47:
                  unint64_t v71 = (unint64_t)v70 | 0x8000000000000000;
                  uint64_t v72 = 0xD000000000000012;
                  break;
                case 6:
                  uint64_t v72 = 0x54746361746E6F63;
                  unint64_t v71 = 0xEB00000000657079;
                  break;
                case 7:
                  uint64_t v72 = 0x707954656E6F6870;
                  unint64_t v71 = 0xE900000000000065;
                  break;
                case 8:
                  uint64_t v72 = 0x614E746E65746E69;
                  unint64_t v71 = 0xEA0000000000656DLL;
                  break;
                default:
                  break;
              }
              ++v69;
              sub_2287A78F0();
              unint64_t v73 = *(void **)(v240[0] + 16);
              sub_2287A793C(v73);
              uint64_t v74 = sub_2287A7980((uint64_t)v73, v72, v71);
              nullsub_1(v74);
            }
            while (v38 != v69);
            swift_bridgeObjectRelease();
            uint64_t v75 = (void *)v240[0];
            uint64_t v10 = v238;
          }
          else
          {
            uint64_t v75 = (void *)v68;
          }
          uint64_t v76 = v233;
          uint64_t v77 = sub_2287A8180();
          if (v78)
          {
            uint64_t v79 = v78;
          }
          else
          {
            uint64_t v77 = 0;
            uint64_t v79 = 0xE000000000000000;
          }
          char v80 = sub_2287A7500(v77, v79, v75);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v80) {
            break;
          }
          uint64_t v66 = v217 + 1;
          uint64_t v12 = (uint64_t)v239;
          (*(void (**)(const char *, const char *))v208)(v76, v239);
          uint64_t v67 = v76;
          if (v66 == (const char *)v215)
          {
            swift_bridgeObjectRelease();
            uint64_t v81 = 1;
            unint64_t v82 = v228;
            goto LABEL_71;
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v82 = v228;
        uint64_t v12 = (uint64_t)v239;
        (*(void (**)(uint64_t, const char *, const char *))(v228 + 32))(v206, v76, v239);
        uint64_t v81 = 0;
LABEL_71:
        uint64_t v8 = v222;
      }
      else
      {
        uint64_t v207 = (void (**)(const char *, const char *))v62;
        swift_bridgeObjectRetain();
        uint64_t v81 = 1;
        unint64_t v82 = v228;
      }
      uint64_t v88 = v206;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56))(v206, v81, 1, v12);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v88, 1, v12) == 1)
      {
        sub_228797E88(v88, &qword_268263080);
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_74;
      }
      uint64_t v112 = sub_2287A8170();
      uint64_t v114 = v113;
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v88, v12);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_deallocClassInstance();
      char v86 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v112, v114);
      swift_release();
      uint64_t v8 = v222;
      uint64_t v10 = v238;
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v12 = (uint64_t)v239;
      uint64_t v5 = v221;
      if (v86 != 35) {
        goto LABEL_221;
      }
    }
  }
LABEL_75:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v241)
  {
    sub_228797E88((uint64_t)v240, &qword_268263090);
    goto LABEL_113;
  }
  sub_2287A8240();
  if (swift_dynamicCast())
  {
    sub_2287A82A0();
    swift_release();
    uint64_t v89 = (void (**)(const char *, const char *))v240[0];
    if (v240[0])
    {
      uint64_t v221 = v5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
      uint64_t v90 = swift_initStackObject();
      *(_OWORD *)(v90 + 16) = xmmword_2287A9350;
      *(unsigned char *)(v90 + 32) = 2;
      uint64_t v91 = sub_2287A81A0();
      if (!v91)
      {
        swift_release();
LABEL_112:
        swift_bridgeObjectRelease();
        uint64_t v5 = v221;
        goto LABEL_113;
      }
      v217 = *(const char **)(v91 + 16);
      uint64_t v222 = v8;
      if (v217)
      {
        uint64_t v207 = v89;
        unint64_t v92 = v228;
        unint64_t v215 = v91 + ((*(unsigned __int8 *)(v228 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v228 + 80));
        uint64_t v93 = v91;
        uint64_t v38 = sub_2287A78E8(v90);
        unint64_t v211 = *(void *)(v92 + 16);
        v212 = (char *)(v92 + 16);
        unint64_t v94 = *(void *)(v92 + 72);
        uint64_t v209 = v92 + 8;
        unint64_t v210 = v94;
        uint64_t v208 = v93;
        swift_bridgeObjectRetain_n();
        v95 = 0;
        a1 = "emergencyConfirmation";
        uint64_t v233 = "emergencyAttribute";
        uint64_t v234 = "emergency";
        v225 = "emergencySirenNoun";
        uint64_t v219 = "crisisSituationMedium";
        uint64_t v220 = "crisisSituationHigh";
        uint64_t v96 = v232;
        while (1)
        {
          v218 = v95;
          ((void (*)(uint64_t, unint64_t, uint64_t))v211)(v96, v215 + v210 * (void)v95, v12);
          uint64_t v97 = sub_2287A784C(0);
          v240[0] = v97;
          if (v38)
          {
            if (v38 < 1) {
              goto LABEL_225;
            }
            swift_bridgeObjectRetain();
            uint64_t v98 = 0;
            do
            {
              uint64_t v101 = 0xD000000000000015;
              unint64_t v100 = 0x80000002287A9FB0;
              switch(*(unsigned char *)(v90 + v98 + 32))
              {
                case 1:
                  uint64_t v99 = v234;
                  goto LABEL_85;
                case 2:
                  uint64_t v99 = v233;
                  goto LABEL_85;
                case 3:
                  uint64_t v101 = 0xD000000000000013;
                  unint64_t v100 = (unint64_t)v225 | 0x8000000000000000;
                  break;
                case 4:
                  uint64_t v101 = 0xD000000000000015;
                  unint64_t v100 = (unint64_t)v220 | 0x8000000000000000;
                  break;
                case 5:
                  uint64_t v99 = v219;
LABEL_85:
                  unint64_t v100 = (unint64_t)v99 | 0x8000000000000000;
                  uint64_t v101 = 0xD000000000000012;
                  break;
                case 6:
                  uint64_t v101 = 0x54746361746E6F63;
                  unint64_t v100 = 0xEB00000000657079;
                  break;
                case 7:
                  uint64_t v101 = 0x707954656E6F6870;
                  unint64_t v100 = 0xE900000000000065;
                  break;
                case 8:
                  uint64_t v101 = 0x614E746E65746E69;
                  unint64_t v100 = 0xEA0000000000656DLL;
                  break;
                default:
                  break;
              }
              ++v98;
              sub_2287A78F0();
              uint64_t v102 = *(void **)(v240[0] + 16);
              sub_2287A793C(v102);
              uint64_t v103 = sub_2287A7980((uint64_t)v102, v101, v100);
              nullsub_1(v103);
            }
            while (v38 != v98);
            swift_bridgeObjectRelease();
            uint64_t v104 = (void *)v240[0];
            uint64_t v10 = v238;
          }
          else
          {
            uint64_t v104 = (void *)v97;
          }
          uint64_t v105 = v232;
          uint64_t v106 = sub_2287A8180();
          if (v107)
          {
            uint64_t v108 = v107;
          }
          else
          {
            uint64_t v106 = 0;
            uint64_t v108 = 0xE000000000000000;
          }
          char v109 = sub_2287A7500(v106, v108, v104);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v109) {
            break;
          }
          v95 = v218 + 1;
          uint64_t v12 = (uint64_t)v239;
          (*(void (**)(uint64_t, const char *))v209)(v105, v239);
          uint64_t v96 = v105;
          if (v95 == v217)
          {
            swift_bridgeObjectRelease();
            uint64_t v110 = 1;
            unint64_t v111 = v228;
            goto LABEL_109;
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v111 = v228;
        uint64_t v12 = (uint64_t)v239;
        (*(void (**)(uint64_t, uint64_t, const char *))(v228 + 32))(v205, v105, v239);
        uint64_t v110 = 0;
LABEL_109:
        uint64_t v8 = v222;
      }
      else
      {
        uint64_t v208 = v91;
        swift_bridgeObjectRetain();
        uint64_t v110 = 1;
        unint64_t v111 = v228;
      }
      uint64_t v115 = v205;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v111 + 56))(v205, v110, 1, v12);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v111 + 48))(v115, 1, v12) == 1)
      {
        sub_228797E88(v115, &qword_268263080);
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_112;
      }
      uint64_t v138 = sub_2287A8170();
      uint64_t v140 = v139;
      (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v115, v12);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_deallocClassInstance();
      char v86 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v138, v140);
      swift_release();
      uint64_t v8 = v222;
      uint64_t v10 = v238;
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v12 = (uint64_t)v239;
      uint64_t v5 = v221;
      if (v86 != 35) {
        goto LABEL_221;
      }
    }
  }
LABEL_113:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v241)
  {
    sub_228797E88((uint64_t)v240, &qword_268263090);
    goto LABEL_150;
  }
  sub_2287A8270();
  if (swift_dynamicCast())
  {
    sub_2287A82A0();
    swift_release();
    uint64_t v116 = v240[0];
    if (v240[0])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
      a1 = (const char *)swift_initStackObject();
      *((_OWORD *)a1 + 1) = xmmword_2287A9350;
      *((unsigned char *)a1 + 32) = 2;
      uint64_t v117 = sub_2287A81A0();
      if (!v117)
      {
        swift_release();
LABEL_149:
        swift_bridgeObjectRelease();
        goto LABEL_150;
      }
      v218 = *(const char **)(v117 + 16);
      uint64_t v222 = v8;
      if (v218)
      {
        uint64_t v208 = v116;
        uint64_t v221 = v5;
        unint64_t v118 = v228;
        v217 = (const char *)(v117
                            + ((*(unsigned __int8 *)(v228 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v228 + 80)));
        uint64_t v119 = v117;
        uint64_t v38 = sub_2287A78E8((uint64_t)a1);
        char v120 = *(char **)(v118 + 16);
        v118 += 16;
        uint64_t v209 = v119;
        unint64_t v210 = v118 - 8;
        unint64_t v215 = v118;
        unint64_t v211 = *(void *)(v118 + 56);
        v212 = v120;
        swift_bridgeObjectRetain_n();
        uint64_t v121 = 0;
        uint64_t v233 = "emergencyAttribute";
        uint64_t v234 = "emergency";
        uint64_t v232 = (uint64_t)"emergencySirenNoun";
        v225 = "crisisSituationHigh";
        uint64_t v220 = "crisisSituationMedium";
        uint64_t v122 = (char *)v231;
        while (1)
        {
          uint64_t v219 = v121;
          ((void (*)(char *, const char *, uint64_t))v212)(v122, &v217[v211 * (void)v121], v12);
          uint64_t v123 = sub_2287A784C(0);
          v240[0] = v123;
          if (v38)
          {
            if (v38 < 1) {
              goto LABEL_226;
            }
            swift_bridgeObjectRetain();
            uint64_t v124 = 0;
            do
            {
              uint64_t v127 = 0xD000000000000015;
              unint64_t v126 = 0x80000002287A9FB0;
              switch(a1[v124 + 32])
              {
                case 1:
                  uint64_t v125 = v234;
                  goto LABEL_123;
                case 2:
                  uint64_t v125 = v233;
                  goto LABEL_123;
                case 3:
                  uint64_t v127 = 0xD000000000000013;
                  unint64_t v126 = v232 | 0x8000000000000000;
                  break;
                case 4:
                  uint64_t v127 = 0xD000000000000015;
                  unint64_t v126 = (unint64_t)v225 | 0x8000000000000000;
                  break;
                case 5:
                  uint64_t v125 = v220;
LABEL_123:
                  unint64_t v126 = (unint64_t)v125 | 0x8000000000000000;
                  uint64_t v127 = 0xD000000000000012;
                  break;
                case 6:
                  uint64_t v127 = 0x54746361746E6F63;
                  unint64_t v126 = 0xEB00000000657079;
                  break;
                case 7:
                  uint64_t v127 = 0x707954656E6F6870;
                  unint64_t v126 = 0xE900000000000065;
                  break;
                case 8:
                  uint64_t v127 = 0x614E746E65746E69;
                  unint64_t v126 = 0xEA0000000000656DLL;
                  break;
                default:
                  break;
              }
              ++v124;
              sub_2287A78F0();
              uint64_t v128 = *(void **)(v240[0] + 16);
              sub_2287A793C(v128);
              uint64_t v129 = sub_2287A7980((uint64_t)v128, v127, v126);
              nullsub_1(v129);
            }
            while (v38 != v124);
            swift_bridgeObjectRelease();
            uint64_t v130 = (void *)v240[0];
            uint64_t v10 = v238;
          }
          else
          {
            uint64_t v130 = (void *)v123;
          }
          uint64_t v131 = (char *)v231;
          uint64_t v132 = sub_2287A8180();
          if (v133)
          {
            uint64_t v134 = v133;
          }
          else
          {
            uint64_t v132 = 0;
            uint64_t v134 = 0xE000000000000000;
          }
          char v135 = sub_2287A7500(v132, v134, v130);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v135) {
            break;
          }
          uint64_t v121 = v219 + 1;
          uint64_t v12 = (uint64_t)v239;
          (*(void (**)(char *, const char *))v210)(v131, v239);
          uint64_t v122 = v131;
          if (v121 == v218)
          {
            swift_bridgeObjectRelease();
            uint64_t v136 = 1;
            uint64_t v5 = v221;
            uint64_t v8 = v222;
            unint64_t v137 = v228;
            goto LABEL_147;
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v137 = v228;
        uint64_t v12 = (uint64_t)v239;
        (*(void (**)(uint64_t, char *, const char *))(v228 + 32))(v204, v131, v239);
        uint64_t v136 = 0;
        uint64_t v5 = v221;
        uint64_t v8 = v222;
      }
      else
      {
        uint64_t v209 = v117;
        swift_bridgeObjectRetain();
        uint64_t v136 = 1;
        unint64_t v137 = v228;
      }
LABEL_147:
      uint64_t v141 = v204;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v137 + 56))(v204, v136, 1, v12);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v137 + 48))(v141, 1, v12) == 1)
      {
        sub_228797E88(v141, &qword_268263080);
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_149;
      }
      uint64_t v151 = sub_2287A8170();
      uint64_t v153 = v152;
      (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v141, v12);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_deallocClassInstance();
      char v86 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v151, v153);
      swift_release();
      uint64_t v8 = v222;
      uint64_t v10 = v238;
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v12 = (uint64_t)v239;
      if (v86 != 35) {
        goto LABEL_221;
      }
    }
  }
LABEL_150:
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v241)
  {
    sub_228797E88((uint64_t)v240, &qword_268263090);
    goto LABEL_166;
  }
  sub_2287A8250();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_166;
  }
  sub_2287A8140();
  swift_release();
  unint64_t v142 = (const char *)v240[0];
  if (!v240[0]) {
    goto LABEL_166;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
  uint64_t v143 = (const char *)swift_initStackObject();
  *((_OWORD *)v143 + 1) = xmmword_2287A9350;
  *((unsigned char *)v143 + 32) = 2;
  uint64_t v144 = sub_2287A81A0();
  if (!v144)
  {
    swift_release();
LABEL_165:
    swift_bridgeObjectRelease();
    goto LABEL_166;
  }
  uint64_t v222 = v8;
  uint64_t v145 = *(void *)(v144 + 16);
  if (!v145)
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v8 = v222;
    goto LABEL_165;
  }
  uint64_t v233 = v142;
  uint64_t v234 = v143;
  uint64_t v221 = v5;
  int v146 = *(void (**)(uint64_t, unint64_t, uint64_t))(v228 + 16);
  unint64_t v147 = v144 + ((*(unsigned __int8 *)(v228 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v228 + 80));
  a1 = (const char *)(v228 + 8);
  uint64_t v148 = *(void *)(v228 + 72);
  uint64_t v232 = v144;
  swift_bridgeObjectRetain();
  uint64_t v38 = v214;
  while (1)
  {
    v146(v38, v147, v12);
    uint64_t v149 = v226;
    char v150 = sub_2287A75C8(v38, (uint64_t)v234);
    uint64_t v226 = v149;
    if (v149) {
      goto LABEL_227;
    }
    if (v150) {
      break;
    }
    uint64_t v12 = (uint64_t)v239;
    (*(void (**)(uint64_t, const char *))a1)(v38, v239);
    v147 += v148;
    if (!--v145)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = v221;
      uint64_t v8 = v222;
      uint64_t v10 = v238;
      goto LABEL_165;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v196 = v228 + 32;
  uint64_t v197 = v213;
  v198 = v239;
  (*(void (**)(const char *, uint64_t, const char *))(v228 + 32))(v213, v38, v239);
  uint64_t v199 = sub_2287A8170();
  uint64_t v201 = v200;
  (*(void (**)(const char *, const char *))(v196 - 24))(v197, v198);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_deallocClassInstance();
  char v86 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v199, v201);
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v5 = v221;
  uint64_t v8 = v222;
  uint64_t v10 = v238;
  if (v86 != 35)
  {
LABEL_221:
    unsigned char *v216 = v86;
    return result;
  }
LABEL_166:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A0);
  uint64_t v154 = swift_initStackObject();
  *(_OWORD *)(v154 + 16) = xmmword_2287A9340;
  *(_WORD *)(v154 + 32) = 513;
  uint64_t v155 = Siri_Nlu_External_UserParse.identifiers.getter();
  unint64_t v228 = *(void *)(v155 + 16);
  if (!v228)
  {
    uint64_t v183 = 1;
    uint64_t v182 = v227;
    uint64_t v159 = (uint64_t)v237;
    goto LABEL_208;
  }
  uint64_t v221 = v5;
  v156 = *(const char **)(v227 + 16);
  uint64_t v232 = v155 + ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80));
  uint64_t v233 = v156;
  v157 = (void (**)(char *, uint64_t))(v230 + 8);
  v225 = (const char *)(v227 + 8);
  uint64_t v234 = (const char *)(v227 + 16);
  uint64_t v230 = *(void *)(v227 + 72);
  v231 = v157;
  uint64_t v219 = (const char *)v155;
  swift_bridgeObjectRetain();
  uint64_t v158 = 0;
  char v239 = "emergencyConfirmation";
  v217 = "emergencyAttribute";
  v218 = "emergency";
  uint64_t v214 = (uint64_t)"crisisSituationHigh";
  unint64_t v215 = (unint64_t)"emergencySirenNoun";
  uint64_t v213 = "crisisSituationMedium";
  uint64_t v222 = v8;
  uint64_t v220 = (const char *)v154;
  while (2)
  {
    uint64_t v160 = (const char *)(v232 + v230 * v158++);
    ((void (*)(char *, const char *, uint64_t))v233)(v10, v160, v8);
    v240[0] = MEMORY[0x263F8EE78];
    uint64_t v161 = 0xD000000000000015;
    unint64_t v162 = (unint64_t)v239 | 0x8000000000000000;
    switch(*(unsigned char *)(v154 + 32))
    {
      case 1:
        v163 = v218;
        goto LABEL_177;
      case 2:
        v163 = v217;
        goto LABEL_177;
      case 3:
        uint64_t v161 = 0xD000000000000013;
        unint64_t v162 = v215 | 0x8000000000000000;
        break;
      case 4:
        uint64_t v161 = 0xD000000000000015;
        unint64_t v162 = v214 | 0x8000000000000000;
        break;
      case 5:
        v163 = v213;
LABEL_177:
        unint64_t v162 = (unint64_t)v163 | 0x8000000000000000;
        uint64_t v161 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v162 = 0xEB00000000657079;
        uint64_t v161 = 0x54746361746E6F63;
        break;
      case 7:
        unint64_t v162 = 0xE900000000000065;
        uint64_t v161 = 0x707954656E6F6870;
        break;
      case 8:
        unint64_t v162 = 0xEA0000000000656DLL;
        uint64_t v161 = 0x614E746E65746E69;
        break;
      default:
        break;
    }
    sub_2287A78F0();
    v164 = *(void **)(v240[0] + 16);
    sub_2287A793C(v164);
    uint64_t v165 = sub_2287A7980((uint64_t)v164, v161, v162);
    nullsub_1(v165);
    uint64_t v166 = 0xD000000000000015;
    unint64_t v167 = (unint64_t)v239 | 0x8000000000000000;
    switch(*(unsigned char *)(v154 + 33))
    {
      case 1:
        unint64_t v168 = v218;
        goto LABEL_187;
      case 2:
        unint64_t v168 = v217;
        goto LABEL_187;
      case 3:
        uint64_t v166 = 0xD000000000000013;
        unint64_t v167 = v215 | 0x8000000000000000;
        break;
      case 4:
        uint64_t v166 = 0xD000000000000015;
        unint64_t v167 = v214 | 0x8000000000000000;
        break;
      case 5:
        unint64_t v168 = v213;
LABEL_187:
        unint64_t v167 = (unint64_t)v168 | 0x8000000000000000;
        uint64_t v166 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v167 = 0xEB00000000657079;
        uint64_t v166 = 0x54746361746E6F63;
        break;
      case 7:
        unint64_t v167 = 0xE900000000000065;
        uint64_t v166 = 0x707954656E6F6870;
        break;
      case 8:
        unint64_t v167 = 0xEA0000000000656DLL;
        uint64_t v166 = 0x614E746E65746E69;
        break;
      default:
        break;
    }
    sub_2287A78F0();
    v169 = *(void **)(v240[0] + 16);
    sub_2287A793C(v169);
    uint64_t v170 = sub_2287A7980((uint64_t)v169, v166, v167);
    nullsub_1(v170);
    uint64_t v38 = v240[0];
    v171 = v235;
    sub_2287A8100();
    a1 = (const char *)sub_2287A8380();
    uint64_t v173 = v172;
    (*v231)(v171, v236);
    uint64_t v174 = sub_2287A7F5C(v38);
    if (!v174)
    {
      swift_bridgeObjectRelease();
      goto LABEL_169;
    }
    uint64_t v175 = v174;
    if (*(const char **)(v38 + 32) == a1 && *(void *)(v38 + 40) == v173)
    {
      swift_bridgeObjectRelease();
LABEL_206:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v181 = v227;
      uint64_t v159 = (uint64_t)v237;
      (*(void (**)(char *, char *, uint64_t))(v227 + 32))(v237, v238, v8);
      uint64_t v182 = v181;
      uint64_t v183 = 0;
      uint64_t v5 = v221;
      goto LABEL_208;
    }
    char v176 = sub_2287A85F0();
    swift_bridgeObjectRetain();
    if (v176)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_206;
    }
    if (v175 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_169;
    }
    uint64_t v177 = (void *)(v38 + 56);
    uint64_t v178 = 1;
    do
    {
      uint64_t v179 = v178 + 1;
      if (__OFADD__(v178, 1))
      {
        __break(1u);
LABEL_223:
        __break(1u);
LABEL_224:
        __break(1u);
LABEL_225:
        __break(1u);
LABEL_226:
        __break(1u);
LABEL_227:
        (*(void (**)(uint64_t, const char *))a1)(v38, v239);
        swift_bridgeObjectRelease();
        __break(1u);
        JUMPOUT(0x228796434);
      }
      BOOL v180 = (const char *)*(v177 - 1) == a1 && *v177 == v173;
      if (v180 || (sub_2287A85F0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v8 = v222;
        goto LABEL_206;
      }
      v177 += 2;
      ++v178;
    }
    while (v179 != v175);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v222;
    uint64_t v154 = (uint64_t)v220;
LABEL_169:
    swift_bridgeObjectRelease();
    uint64_t v10 = v238;
    (*(void (**)(char *, uint64_t))v225)(v238, v8);
    uint64_t v159 = (uint64_t)v237;
    if (v158 != v228) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  uint64_t v183 = 1;
  uint64_t v5 = v221;
  uint64_t v182 = v227;
LABEL_208:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v182 + 56))(v159, v183, 1, v8);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v182 + 48))(v159, 1, v8) != 1)
  {
    uint64_t v184 = v159;
    uint64_t v185 = sub_2287A80F0();
    uint64_t v187 = v186;
    (*(void (**)(uint64_t, uint64_t))(v182 + 8))(v184, v8);
    swift_setDeallocating();
    swift_deallocClassInstance();
    char v86 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v185, v187);
    uint64_t result = swift_bridgeObjectRelease();
    if (v86 == 35) {
      goto LABEL_211;
    }
    goto LABEL_221;
  }
  sub_228797E88(v159, &qword_2682630A8);
  swift_setDeallocating();
  swift_deallocClassInstance();
LABEL_211:
  Siri_Nlu_External_UserParse.catiIntentName.getter();
  if (v188)
  {
    uint64_t v189 = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0();
    if (v189 != 23)
    {
      uint64_t result = _s20SiriEmergencyIntents0B9SituationO14catiIntentNameACSgAA010CATIIntentG0O_tcfC_0(v189);
      char v86 = result;
      if (result != 35) {
        goto LABEL_221;
      }
    }
  }
  uint64_t v190 = sub_2287A83A0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v223, v190, v224);
  uint64_t v191 = sub_2287A83B0();
  os_log_type_t v192 = sub_2287A84C0();
  if (os_log_type_enabled(v191, v192))
  {
    v193 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v193 = 0;
    _os_log_impl(&dword_22878A000, v191, v192, "No EmergencySituation found in parse", v193, 2u);
    MEMORY[0x22A69C820](v193, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v223, v224);
  uint64_t v194 = sub_2287A8370();
  sub_228797E30();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v194 - 8) + 104))(v195, *MEMORY[0x263F75860], v194);
  return swift_willThrow();
}

uint64_t sub_22879650C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v38 = sub_2287A83C0();
  uint64_t v1 = *(void *)(v38 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v38);
  unint64_t v36 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v35 - v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263098);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2287A80C0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t v16 = sub_2287A8040();
  if (*(void *)(v16 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, v16 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_228797E88((uint64_t)v8, &qword_268263098);
    uint64_t v17 = sub_2287A83A0();
    swift_beginAccess();
    uint64_t v18 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v5, v17, v38);
    uint64_t v19 = sub_2287A83B0();
    os_log_type_t v20 = sub_2287A84C0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_22878A000, v19, v20, "No EmergencyConfirmation found in parse (no userDialogAct)", v21, 2u);
      MEMORY[0x22A69C820](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v18);
    uint64_t v22 = sub_2287A8370();
    sub_228797E30();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v22 - 8) + 104))(v23, *MEMORY[0x263F75860], v22);
    return swift_willThrow();
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  if (sub_2287A8080())
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    *uint64_t v37 = 0;
    return result;
  }
  char v25 = sub_2287A8090();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  if (v25)
  {
    uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v13, v9);
LABEL_13:
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v15, v9);
    *uint64_t v37 = 1;
    return result;
  }
  char v27 = sub_2287A80A0();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
  v26(v13, v9);
  if (v27) {
    goto LABEL_13;
  }
  uint64_t v28 = sub_2287A83A0();
  swift_beginAccess();
  uint64_t v29 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v36, v28, v38);
  uint64_t v30 = sub_2287A83B0();
  os_log_type_t v31 = sub_2287A84C0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_22878A000, v30, v31, "No EmergencyConfirmation found in parse", v32, 2u);
    MEMORY[0x22A69C820](v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v36, v29);
  uint64_t v33 = sub_2287A8370();
  sub_228797E30();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v33 - 8) + 104))(v34, *MEMORY[0x263F75860], v33);
  swift_willThrow();
  return ((uint64_t (*)(char *, uint64_t))v26)(v15, v9);
}

uint64_t sub_228796AFC@<X0>(char a1@<W1>, char *a2@<X8>)
{
  uint64_t v5 = sub_2287A83C0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v142 = (char *)v117 - v10;
  uint64_t v11 = sub_2287A8190();
  uint64_t v140 = *(void *)(v11 - 8);
  uint64_t v141 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v138 = (char *)v117 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v139 = (char *)v117 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v117 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263080);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)v117 - v23;
  if ((a1 & 1) == 0)
  {
    uint64_t v29 = sub_2287A83A0();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v29, v5);
    uint64_t v30 = sub_2287A83B0();
    os_log_type_t v31 = sub_2287A84C0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_22878A000, v30, v31, "nlv4MigrationFeatureFlagIsEnabled == false. No crisisSeverity found in parse.", v32, 2u);
      MEMORY[0x22A69C820](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    goto LABEL_15;
  }
  uint64_t v136 = v21;
  unint64_t v137 = v22;
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();
  swift_release();
  if (!v143[3])
  {
    sub_228797E88((uint64_t)v143, &qword_268263090);
    goto LABEL_12;
  }
  sub_2287A82B0();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  sub_2287A81C0();
  swift_release();
  if (!v143[0]) {
    goto LABEL_12;
  }
  uint64_t v123 = (const char *)0xE90000000000006ELL;
  uint64_t v133 = v143[0];
  uint64_t v25 = sub_2287A81A0();
  uint64_t v135 = v6;
  uint64_t v130 = a2;
  uint64_t v131 = v2;
  uint64_t v26 = v141;
  if (v25)
  {
    uint64_t v124 = *(const char **)(v25 + 16);
    if (v124)
    {
      char v27 = *(const char **)(v140 + 16);
      unint64_t v127 = v25 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80));
      unint64_t v128 = (unint64_t)v27;
      uint64_t v121 = (const char *)(v140 + 8);
      uint64_t v129 = (void (*)(char *, const char *, uint64_t))(v140 + 16);
      unint64_t v126 = *(void *)(v140 + 72);
      uint64_t v122 = v25;
      swift_bridgeObjectRetain_n();
      uint64_t v28 = 0;
      uint64_t v125 = "emergencyConfirmation";
      char v120 = "emergency";
      uint64_t v119 = "emergencyAttribute";
      unint64_t v118 = "emergencySirenNoun";
      v117[1] = "crisisSituationHigh";
      v117[0] = "crisisSituationMedium";
      uint64_t v134 = v5;
      do
      {
        uint64_t v132 = v28 + 1;
        ((void (*)(char *, unint64_t, uint64_t))v128)(v17, v127 + v126 * (void)v28, v26);
        unint64_t v41 = 0xD000000000000015;
        unint64_t v42 = (unint64_t)v125 | 0x8000000000000000;
        switch(byte_26DCF38A8)
        {
          case 1:
            uint64_t v43 = &v148;
            goto LABEL_25;
          case 2:
            uint64_t v43 = &v147;
            goto LABEL_25;
          case 3:
            unint64_t v41 = 0xD000000000000013;
            v44 = &v146;
            goto LABEL_23;
          case 4:
            unint64_t v41 = 0xD000000000000015;
            v44 = &v145;
LABEL_23:
            unint64_t v42 = *(v44 - 32) | 0x8000000000000000;
            break;
          case 5:
            uint64_t v43 = &v144;
LABEL_25:
            unint64_t v42 = *(v43 - 32) | 0x8000000000000000;
            unint64_t v41 = 0xD000000000000012;
            break;
          case 6:
            unint64_t v42 = 0xEB00000000657079;
            unint64_t v41 = 0x54746361746E6F63;
            break;
          case 7:
            unint64_t v41 = 0x707954656E6F6870;
            unint64_t v42 = 0xE900000000000065;
            break;
          case 8:
            unint64_t v42 = 0xEA0000000000656DLL;
            unint64_t v41 = 0x614E746E65746E69;
            break;
          default:
            break;
        }
        unint64_t v45 = (void *)MEMORY[0x263F8EE78];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v45 = sub_2287A7C00(0, *(void *)(MEMORY[0x263F8EE78] + 16) + 1, 1, MEMORY[0x263F8EE78]);
        }
        unint64_t v47 = v45[2];
        unint64_t v46 = v45[3];
        if (v47 >= v46 >> 1) {
          unint64_t v45 = sub_2287A7C00((void *)(v46 > 1), v47 + 1, 1, v45);
        }
        v45[2] = v47 + 1;
        uint64_t v48 = &v45[2 * v47];
        v48[4] = v41;
        v48[5] = v42;
        uint64_t v49 = sub_2287A8180();
        if (v50) {
          uint64_t v51 = v49;
        }
        else {
          uint64_t v51 = 0;
        }
        if (v50) {
          unint64_t v52 = v50;
        }
        else {
          unint64_t v52 = 0xE000000000000000;
        }
        uint64_t v53 = v45[2];
        if (v53)
        {
          BOOL v54 = v45[4] == v51 && v45[5] == v52;
          if (v54 || (sub_2287A85F0() & 1) != 0) {
            goto LABEL_56;
          }
          if (v53 != 1)
          {
            uint64_t v55 = v45 + 7;
            uint64_t v56 = 1;
            while (1)
            {
              uint64_t v57 = v56 + 1;
              if (__OFADD__(v56, 1))
              {
                __break(1u);
LABEL_167:
                __break(1u);
                goto LABEL_168;
              }
              BOOL v58 = *(v55 - 1) == v51 && *v55 == v52;
              if (v58 || (sub_2287A85F0() & 1) != 0) {
                break;
              }
              v55 += 2;
              ++v56;
              if (v57 == v53) {
                goto LABEL_16;
              }
            }
LABEL_56:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v59 = v140;
            uint64_t v26 = v141;
            (*(void (**)(char *, char *, uint64_t))(v140 + 32))(v24, v17, v141);
            uint64_t v60 = 0;
            uint64_t v5 = v134;
            uint64_t v6 = v135;
            a2 = v130;
            goto LABEL_59;
          }
LABEL_16:
          swift_bridgeObjectRelease();
          uint64_t v5 = v134;
          uint64_t v6 = v135;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v6 = v135;
        }
        swift_bridgeObjectRelease();
        uint64_t v26 = v141;
        (*(void (**)(char *, uint64_t))v121)(v17, v141);
        uint64_t v28 = v132;
      }
      while (v132 != v124);
      swift_bridgeObjectRelease();
      uint64_t v60 = 1;
      a2 = v130;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v60 = 1;
    }
    uint64_t v59 = v140;
LABEL_59:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v24, v60, 1, v26);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v24, 1, v26) != 1)
    {
      sub_2287A8170();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v24, v26);
      swift_release();
      swift_bridgeObjectRelease();
      char v86 = 2;
LABEL_161:
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = v86;
      return result;
    }
    sub_228797E88((uint64_t)v24, &qword_268263080);
    swift_bridgeObjectRelease();
  }
  uint64_t v61 = sub_2287A81A0();
  uint64_t v62 = v140;
  if (!v61) {
    goto LABEL_113;
  }
  uint64_t v125 = *(const char **)(v61 + 16);
  if (!v125)
  {
    swift_bridgeObjectRetain();
LABEL_110:
    uint64_t v88 = 1;
    uint64_t v87 = (uint64_t)v137;
    goto LABEL_111;
  }
  unint64_t v63 = *(void (**)(char *, const char *, uint64_t))(v140 + 16);
  unint64_t v128 = v61 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80));
  uint64_t v129 = v63;
  uint64_t v124 = (const char *)(v140 + 8);
  uint64_t v132 = (const char *)(v140 + 16);
  unint64_t v127 = *(void *)(v140 + 72);
  uint64_t v122 = v61;
  swift_bridgeObjectRetain_n();
  uint64_t v64 = 0;
  unint64_t v126 = (unint64_t)"emergencyConfirmation";
  uint64_t v123 = "emergency";
  uint64_t v121 = "emergencyAttribute";
  char v120 = "emergencySirenNoun";
  uint64_t v119 = "crisisSituationHigh";
  unint64_t v118 = "crisisSituationMedium";
  uint64_t v65 = v139;
  uint64_t v134 = v5;
  while (1)
  {
    uint64_t v66 = (const char *)(v128 + v127 * (void)v64++);
    v129(v65, v66, v26);
    unint64_t v67 = 0xD000000000000015;
    unint64_t v68 = v126 | 0x8000000000000000;
    switch(byte_26DCF38D0)
    {
      case 1:
        uint64_t v69 = &v150;
        goto LABEL_71;
      case 2:
        uint64_t v69 = &v149;
        goto LABEL_71;
      case 3:
        unint64_t v67 = 0xD000000000000013;
        uint64_t v70 = &v148;
        goto LABEL_69;
      case 4:
        unint64_t v67 = 0xD000000000000015;
        uint64_t v70 = &v147;
LABEL_69:
        unint64_t v68 = *(v70 - 32) | 0x8000000000000000;
        break;
      case 5:
        uint64_t v69 = &v146;
LABEL_71:
        unint64_t v68 = *(v69 - 32) | 0x8000000000000000;
        unint64_t v67 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v68 = 0xEB00000000657079;
        unint64_t v67 = 0x54746361746E6F63;
        break;
      case 7:
        unint64_t v67 = 0x707954656E6F6870;
        unint64_t v68 = 0xE900000000000065;
        break;
      case 8:
        unint64_t v68 = 0xEA0000000000656DLL;
        unint64_t v67 = 0x614E746E65746E69;
        break;
      default:
        break;
    }
    unint64_t v71 = (void *)MEMORY[0x263F8EE78];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v71 = sub_2287A7C00(0, *(void *)(MEMORY[0x263F8EE78] + 16) + 1, 1, MEMORY[0x263F8EE78]);
    }
    unint64_t v73 = v71[2];
    unint64_t v72 = v71[3];
    if (v73 >= v72 >> 1) {
      unint64_t v71 = sub_2287A7C00((void *)(v72 > 1), v73 + 1, 1, v71);
    }
    v71[2] = v73 + 1;
    uint64_t v74 = &v71[2 * v73];
    v74[4] = v67;
    v74[5] = v68;
    uint64_t v75 = sub_2287A8180();
    uint64_t v77 = v76 ? v75 : 0;
    unint64_t v78 = v76 ? v76 : 0xE000000000000000;
    uint64_t v79 = v71[2];
    if (v79) {
      break;
    }
    swift_bridgeObjectRelease();
    uint64_t v6 = v135;
LABEL_94:
    a2 = v130;
LABEL_95:
    swift_bridgeObjectRelease();
    uint64_t v65 = v139;
    uint64_t v26 = v141;
    (*(void (**)(char *, uint64_t))v124)(v139, v141);
    uint64_t v5 = v134;
    if (v64 == v125)
    {
      swift_bridgeObjectRelease();
      goto LABEL_110;
    }
  }
  BOOL v80 = v71[4] == v77 && v71[5] == v78;
  uint64_t v6 = v135;
  if (v80)
  {
    swift_bridgeObjectRelease();
    goto LABEL_108;
  }
  char v81 = sub_2287A85F0();
  swift_bridgeObjectRetain();
  if (v81)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_108;
  }
  if (v79 == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_94;
  }
  unint64_t v82 = v71 + 7;
  uint64_t v83 = 1;
  while (1)
  {
    uint64_t v84 = v83 + 1;
    if (__OFADD__(v83, 1)) {
      goto LABEL_167;
    }
    BOOL v85 = *(v82 - 1) == v77 && *v82 == v78;
    if (v85 || (sub_2287A85F0() & 1) != 0) {
      break;
    }
    v82 += 2;
    ++v83;
    if (v84 == v79)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v135;
      a2 = v130;
      uint64_t v62 = v140;
      goto LABEL_95;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v135;
  uint64_t v65 = v139;
  uint64_t v62 = v140;
LABEL_108:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v87 = (uint64_t)v137;
  uint64_t v26 = v141;
  (*(void (**)(void, char *, uint64_t))(v62 + 32))(v137, v65, v141);
  uint64_t v88 = 0;
  a2 = v130;
  uint64_t v5 = v134;
LABEL_111:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 56))(v87, v88, 1, v26);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v87, 1, v26) != 1)
  {
    sub_2287A8170();
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v87, v26);
    swift_release();
    swift_bridgeObjectRelease();
    char v86 = 1;
    goto LABEL_161;
  }
  sub_228797E88(v87, &qword_268263080);
  swift_bridgeObjectRelease();
LABEL_113:
  uint64_t v89 = sub_2287A81A0();
  if (!v89)
  {
    swift_release();
    goto LABEL_12;
  }
  uint64_t v90 = *(void *)(v89 + 16);
  if (v90)
  {
    uint64_t v134 = v5;
    unint64_t v92 = *(void (**)(char *, const char *, uint64_t))(v62 + 16);
    uint64_t v91 = (char *)(v62 + 16);
    unint64_t v137 = v92;
    uint64_t v132 = (const char *)(v89 + ((v91[64] + 32) & ~(unint64_t)v91[64]));
    unint64_t v127 = (unint64_t)(v91 - 8);
    uint64_t v139 = v91;
    uint64_t v129 = (void (*)(char *, const char *, uint64_t))*((void *)v91 + 7);
    uint64_t v122 = v89;
    swift_bridgeObjectRetain_n();
    uint64_t v93 = 0;
    unint64_t v128 = (unint64_t)"emergencyConfirmation";
    unint64_t v126 = (unint64_t)"emergency";
    uint64_t v125 = "emergencyAttribute";
    uint64_t v124 = "emergencySirenNoun";
    uint64_t v123 = "crisisSituationHigh";
    uint64_t v121 = "crisisSituationMedium";
    unint64_t v94 = v138;
    do
    {
      v95 = &v132[(void)v129 * v93++];
      v137(v94, v95, v26);
      v143[0] = MEMORY[0x263F8EE78];
      uint64_t v96 = 0xD000000000000015;
      unint64_t v97 = v128 | 0x8000000000000000;
      switch(byte_26DCF38F8)
      {
        case 1:
          unint64_t v98 = v126;
          goto LABEL_126;
        case 2:
          uint64_t v99 = &v152;
          goto LABEL_125;
        case 3:
          uint64_t v96 = 0xD000000000000013;
          unint64_t v100 = &v151;
          goto LABEL_123;
        case 4:
          uint64_t v96 = 0xD000000000000015;
          unint64_t v100 = &v150;
LABEL_123:
          unint64_t v97 = *(v100 - 32) | 0x8000000000000000;
          break;
        case 5:
          uint64_t v99 = &v149;
LABEL_125:
          unint64_t v98 = *(v99 - 32);
LABEL_126:
          unint64_t v97 = v98 | 0x8000000000000000;
          uint64_t v96 = 0xD000000000000012;
          break;
        case 6:
          unint64_t v97 = 0xEB00000000657079;
          uint64_t v96 = 0x54746361746E6F63;
          break;
        case 7:
          uint64_t v96 = 0x707954656E6F6870;
          unint64_t v97 = 0xE900000000000065;
          break;
        case 8:
          unint64_t v97 = 0xEA0000000000656DLL;
          uint64_t v96 = 0x614E746E65746E69;
          break;
        default:
          break;
      }
      sub_2287A78F0();
      uint64_t v101 = *(void **)(v143[0] + 16);
      sub_2287A793C(v101);
      uint64_t v102 = sub_2287A7980((uint64_t)v101, v96, v97);
      nullsub_1(v102);
      uint64_t v103 = (void *)v143[0];
      uint64_t v104 = sub_2287A8180();
      if (v105) {
        uint64_t v106 = v104;
      }
      else {
        uint64_t v106 = 0;
      }
      if (v105) {
        unint64_t v107 = v105;
      }
      else {
        unint64_t v107 = 0xE000000000000000;
      }
      uint64_t v108 = v103[2];
      if (v108)
      {
        BOOL v109 = v103[4] == v106 && v103[5] == v107;
        if (v109 || (uint64_t v110 = v90, (sub_2287A85F0() & 1) != 0))
        {
LABEL_155:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v62 = v140;
          uint64_t v26 = v141;
          uint64_t v115 = v136;
          (*(void (**)(uint64_t, char *, uint64_t))(v140 + 32))(v136, v138, v141);
          uint64_t v116 = 0;
          uint64_t v5 = v134;
          uint64_t v6 = v135;
          a2 = v130;
          goto LABEL_158;
        }
        if (v108 != 1)
        {
          unint64_t v111 = v103 + 7;
          uint64_t v112 = 1;
          while (1)
          {
            uint64_t v113 = v112 + 1;
            if (__OFADD__(v112, 1)) {
              break;
            }
            BOOL v114 = *(v111 - 1) == v106 && *v111 == v107;
            if (v114 || (sub_2287A85F0() & 1) != 0) {
              goto LABEL_155;
            }
            v111 += 2;
            ++v112;
            if (v113 == v108) {
              goto LABEL_116;
            }
          }
LABEL_168:
          __break(1u);
          JUMPOUT(0x228797DC4);
        }
LABEL_116:
        swift_bridgeObjectRelease();
        uint64_t v6 = v135;
        unint64_t v94 = v138;
        uint64_t v90 = v110;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v26 = v141;
      (*(void (**)(char *, uint64_t))v127)(v94, v141);
    }
    while (v93 != v90);
    swift_bridgeObjectRelease();
    uint64_t v116 = 1;
    uint64_t v5 = v134;
    a2 = v130;
    uint64_t v62 = v140;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v116 = 1;
  }
  uint64_t v115 = v136;
LABEL_158:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 56))(v115, v116, 1, v26);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v115, 1, v26) != 1)
  {
    sub_2287A8170();
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v115, v26);
    swift_bridgeObjectRelease();
    swift_release();
    char v86 = 0;
    goto LABEL_161;
  }
  sub_228797E88(v115, &qword_268263080);
  swift_release();
  swift_bridgeObjectRelease();
LABEL_12:
  uint64_t v33 = sub_2287A83A0();
  swift_beginAccess();
  uint64_t v34 = v142;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v142, v33, v5);
  uint64_t v35 = sub_2287A83B0();
  os_log_type_t v36 = sub_2287A84C0();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl(&dword_22878A000, v35, v36, "No crisisSeverity found in parse", v37, 2u);
    MEMORY[0x22A69C820](v37, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v34, v5);
LABEL_15:
  uint64_t v38 = sub_2287A8370();
  sub_228797E30();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v38 - 8) + 104))(v39, *MEMORY[0x263F75860], v38);
  return swift_willThrow();
}

unint64_t sub_228797E30()
{
  unint64_t result = qword_268263088;
  if (!qword_268263088)
  {
    sub_2287A8370();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263088);
  }
  return result;
}

uint64_t sub_228797E88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t CATIIntentName.rawValue.getter(char a1)
{
  unint64_t result = 0xD00000000000002FLL;
  switch(a1)
  {
    case 1:
    case 2:
    case 7:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 4:
      unint64_t result = 0xD000000000000038;
      break;
    case 5:
      unint64_t result = 0xD000000000000037;
      break;
    case 6:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 8:
      unint64_t result = 0xD000000000000028;
      break;
    case 9:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 10:
      unint64_t result = 0xD00000000000006CLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000006FLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000068;
      break;
    case 13:
      unint64_t result = 0xD00000000000006CLL;
      break;
    case 14:
      unint64_t result = 0xD00000000000004ALL;
      break;
    case 15:
      unint64_t result = 0xD000000000000046;
      break;
    case 16:
      unint64_t result = 0xD000000000000046;
      break;
    case 17:
      unint64_t result = 0xD000000000000049;
      break;
    case 18:
      unint64_t result = 0xD000000000000039;
      break;
    case 19:
      unint64_t result = 0xD00000000000003CLL;
      break;
    case 20:
      unint64_t result = 0xD000000000000035;
      break;
    case 21:
      unint64_t result = 0xD000000000000039;
      break;
    case 22:
      unint64_t result = 0xD000000000000029;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2287980F4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = CATIIntentName.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == CATIIntentName.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_228798180()
{
  char v1 = *v0;
  sub_2287A8650();
  CATIIntentName.rawValue.getter(v1);
  sub_2287A8470();
  swift_bridgeObjectRelease();
  return sub_2287A8670();
}

uint64_t sub_2287981E4()
{
  CATIIntentName.rawValue.getter(*v0);
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_228798238()
{
  char v1 = *v0;
  sub_2287A8650();
  CATIIntentName.rawValue.getter(v1);
  sub_2287A8470();
  swift_bridgeObjectRelease();
  return sub_2287A8670();
}

uint64_t sub_228798298@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_2287982C8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CATIIntentName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents14CATIIntentNameO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A8600();
  swift_bridgeObjectRelease();
  if (v0 >= 0x17) {
    return 23;
  }
  else {
    return v0;
  }
}

unint64_t sub_22879834C()
{
  unint64_t result = qword_2682630B0;
  if (!qword_2682630B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682630B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CATIIntentName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEA) {
    goto LABEL_17;
  }
  if (a2 + 22 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 22) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 22;
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
      return (*a1 | (v4 << 8)) - 22;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 22;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x17;
  int v8 = v6 - 23;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CATIIntentName(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 22 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 22) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE9)
  {
    unsigned int v6 = ((a2 - 234) >> 8) + 1;
    *unint64_t result = a2 + 22;
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
        JUMPOUT(0x2287984FCLL);
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
          *unint64_t result = a2 + 22;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CATIIntentName()
{
  return &type metadata for CATIIntentName;
}

unint64_t CrisisSeverity.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000012;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000015;
    }
    else {
      return 0xD000000000000013;
    }
  }
  return result;
}

uint64_t sub_228798594(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_228799730(*a1, *a2);
}

uint64_t sub_2287985A0()
{
  return sub_22879DA3C();
}

uint64_t sub_2287985A8()
{
  return sub_22879DF40();
}

uint64_t sub_2287985B0()
{
  return sub_22879E5D4();
}

uint64_t sub_2287985B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents14CrisisSeverityO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_2287985E8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CrisisSeverity.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents14CrisisSeverityO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_228798664()
{
  unint64_t result = qword_2682630B8;
  if (!qword_2682630B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682630B8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CrisisSeverity(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x228798784);
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

ValueMetadata *type metadata accessor for CrisisSeverity()
{
  return &type metadata for CrisisSeverity;
}

uint64_t GeneralEmergencyIntent.isLowRisk.getter(char a1)
{
  if (EmergencySituation.rawValue.getter(a1) == 0xD00000000000001ALL && v1 == 0x80000002287AA9B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v3 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t GeneralEmergencyIntent.isHighRisk.getter(char a1)
{
  if (EmergencySituation.rawValue.getter(a1) == 0xD00000000000001BLL && v1 == 0x80000002287AA990)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v3 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

SiriEmergencyIntents::GeneralEmergencyIntent_optional __swiftcall GeneralEmergencyIntent.init(emergencySituation:)(SiriEmergencyIntents::EmergencySituation_optional emergencySituation)
{
  SiriEmergencyIntents::EmergencySituation value = emergencySituation.value;
  int v2 = emergencySituation.value;
  uint64_t v3 = sub_2287A83C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 != 35)
  {
    if (EmergencySituation.rawValue.getter(value) == 0xD00000000000001ALL && v14 == 0x80000002287AA9B0) {
      goto LABEL_7;
    }
    char v15 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    if (v15) {
      return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)value;
    }
    if (EmergencySituation.rawValue.getter(value) == 0xD00000000000001BLL && v16 == 0x80000002287AA990)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)value;
    }
    char v17 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    if (v17) {
      return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)value;
    }
  }
  uint64_t v7 = sub_2287A83A0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  int v8 = sub_2287A83B0();
  os_log_type_t v9 = sub_2287A84D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v21 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v19 = v10 + 4;
    LOBYTE(v20) = value;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268263040);
    uint64_t v12 = sub_2287A84E0();
    uint64_t v20 = sub_22878DE80(v12, v13, &v21);
    sub_2287A84F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22878A000, v8, v9, "Failed to initialize GeneralEmergencyIntent. Unsupported emergencySituation: [%s]", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69C820](v11, -1, -1);
    MEMORY[0x22A69C820](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (SiriEmergencyIntents::GeneralEmergencyIntent_optional)35;
}

uint64_t getEnumTagSinglePayload for EmergencySituation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDE) {
    goto LABEL_17;
  }
  if (a2 + 34 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 34) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 34;
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
      return (*a1 | (v4 << 8)) - 34;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 34;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x23;
  int v8 = v6 - 35;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GeneralEmergencyIntent(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 34 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 34) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDD)
  {
    unsigned int v6 = ((a2 - 222) >> 8) + 1;
    *unint64_t result = a2 + 34;
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
        JUMPOUT(0x228798D20);
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
          *unint64_t result = a2 + 34;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeneralEmergencyIntent()
{
  return &type metadata for GeneralEmergencyIntent;
}

SiriEmergencyIntents::EmergencyAttribute_optional __swiftcall EmergencyAttribute.init(catiIntentName:)(SiriEmergencyIntents::CATIIntentName catiIntentName)
{
  if (((catiIntentName - 10) & 0xF8) != 0) {
    return (SiriEmergencyIntents::EmergencyAttribute_optional)2;
  }
  else {
    return (SiriEmergencyIntents::EmergencyAttribute_optional)(0x101010100000000uLL >> (8 * (catiIntentName - 10)));
  }
}

SiriEmergencyIntents::EmergencyAttribute_optional __swiftcall EmergencyAttribute.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.SiriEmergencyIntents::EmergencySituation value = SiriEmergencyIntents_EmergencyAttribute_website;
  }
  else {
    v2.SiriEmergencyIntents::EmergencySituation value = SiriEmergencyIntents_EmergencyAttribute_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t EmergencyAttribute.rawValue.getter(char a1)
{
  if (a1) {
    return 0x65746973626577;
  }
  else {
    return 0x756E20656E6F6870;
  }
}

uint64_t sub_228798E18(char *a1, char *a2)
{
  return sub_228799828(*a1, *a2);
}

uint64_t sub_228798E24()
{
  return sub_22879DAE4();
}

uint64_t sub_228798E2C()
{
  return sub_22879E0C0();
}

uint64_t sub_228798E34()
{
  return sub_22879E440();
}

uint64_t sub_228798E3C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2287A85B0();
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

uint64_t sub_228798E9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EmergencyAttribute.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B9AttributeO4from15identifierValueACSgSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x756E20656E6F6870 && a2 == 0xEC0000007265626DLL) {
    return 0;
  }
  char v5 = sub_2287A85F0();
  uint64_t result = 0;
  if ((v5 & 1) == 0)
  {
    if (a1 == 0x656E6F6870 && a2 == 0xE500000000000000)
    {
      return 0;
    }
    else
    {
      char v7 = sub_2287A85F0();
      uint64_t result = 0;
      if ((v7 & 1) == 0)
      {
        if (a1 == 0x65746973626577 && a2 == 0xE700000000000000)
        {
          return 1;
        }
        else
        {
          char v8 = sub_2287A85F0();
          BOOL v10 = a1 == 0x65676170626577 && a2 == 0xE700000000000000;
          uint64_t result = 1;
          if ((v8 & 1) == 0 && !v10)
          {
            if (sub_2287A85F0()) {
              return 1;
            }
            else {
              return 2;
            }
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_228799068()
{
  unint64_t result = qword_2682630C0;
  if (!qword_2682630C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682630C0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EmergencyAttribute(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x228799188);
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

ValueMetadata *type metadata accessor for EmergencyAttribute()
{
  return &type metadata for EmergencyAttribute;
}

uint64_t sub_2287991C0(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000015;
  unint64_t v4 = 0x80000002287A9FB0;
  switch(a1)
  {
    case 1:
      uint64_t v5 = "emergencySituation";
      goto LABEL_8;
    case 2:
      uint64_t v5 = "emergencySirenNoun";
      goto LABEL_8;
    case 3:
      unint64_t v3 = 0xD000000000000013;
      unsigned int v6 = "crisisSituationHigh";
      goto LABEL_6;
    case 4:
      unint64_t v3 = 0xD000000000000015;
      unsigned int v6 = "crisisSituationMedium";
LABEL_6:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 5:
      uint64_t v5 = "crisisSituationLow";
LABEL_8:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000012;
      break;
    case 6:
      unint64_t v4 = 0xEB00000000657079;
      unint64_t v3 = 0x54746361746E6F63;
      break;
    case 7:
      unint64_t v4 = 0xE900000000000065;
      unint64_t v3 = 0x707954656E6F6870;
      break;
    case 8:
      unint64_t v4 = 0xEA0000000000656DLL;
      unint64_t v3 = 0x614E746E65746E69;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD000000000000015;
  unint64_t v8 = 0x80000002287A9FB0;
  switch(a2)
  {
    case 1:
      os_log_type_t v9 = "emergencySituation";
      goto LABEL_20;
    case 2:
      os_log_type_t v9 = "emergencySirenNoun";
      goto LABEL_20;
    case 3:
      unint64_t v10 = 0xD000000000000013;
      uint64_t v11 = "crisisSituationHigh";
      goto LABEL_17;
    case 4:
      unint64_t v10 = 0xD000000000000015;
      uint64_t v11 = "crisisSituationMedium";
LABEL_17:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      if (v3 != v10) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 5:
      os_log_type_t v9 = "crisisSituationLow";
LABEL_20:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      if (v3 != 0xD000000000000012) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 6:
      unint64_t v8 = 0xEB00000000657079;
      if (v3 != 0x54746361746E6F63) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 7:
      unint64_t v8 = 0xE900000000000065;
      unint64_t v7 = 0x707954656E6F6870;
      goto LABEL_25;
    case 8:
      unint64_t v8 = 0xEA0000000000656DLL;
      if (v3 != 0x614E746E65746E69) {
        goto LABEL_29;
      }
      goto LABEL_26;
    default:
LABEL_25:
      if (v3 != v7) {
        goto LABEL_29;
      }
LABEL_26:
      if (v4 == v8) {
        char v12 = 1;
      }
      else {
LABEL_29:
      }
        char v12 = sub_2287A85F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12 & 1;
  }
}

uint64_t sub_228799458(char a1, char a2)
{
  if (*(void *)&aLabel_2[8 * a1] == *(void *)&aLabel_2[8 * a2]
    && *(void *)&aSituatio_0[8 * a1 + 8] == *(void *)&aSituatio_0[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2287994E0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x65726953706F7453;
  }
  else {
    uint64_t v3 = 0x7269537472617453;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006E65;
  }
  else {
    unint64_t v4 = 0xE90000000000006ELL;
  }
  if (a2) {
    uint64_t v5 = 0x65726953706F7453;
  }
  else {
    uint64_t v5 = 0x7269537472617453;
  }
  if (a2) {
    unint64_t v6 = 0xE90000000000006ELL;
  }
  else {
    unint64_t v6 = 0xEA00000000006E65;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22879958C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000034;
  unint64_t v3 = 0x80000002287AA0C0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000034;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000032;
      unint64_t v6 = "com.apple.siri.directInvocation.socialConversation";
      goto LABEL_7;
    case 2:
      unint64_t v5 = 0xD000000000000035;
      unint64_t v6 = "com.apple.siri.directInvocation.emergency.buttonPress";
      goto LABEL_7;
    case 3:
      unint64_t v5 = 0xD00000000000003FLL;
      unint64_t v6 = "com.apple.siri.directInvocation.emergency.callEmergencyResource";
      goto LABEL_7;
    case 4:
      unint64_t v6 = "com.apple.siri.directInvocation.emergency.startSiren";
      goto LABEL_7;
    case 5:
      unint64_t v5 = 0xD000000000000035;
      unint64_t v6 = "com.apple.siri.directInvocation.emergency.gatFallback";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000002287AA0C0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000032;
      unint64_t v8 = "com.apple.siri.directInvocation.socialConversation";
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xD000000000000035;
      unint64_t v8 = "com.apple.siri.directInvocation.emergency.buttonPress";
      goto LABEL_14;
    case 3:
      unint64_t v2 = 0xD00000000000003FLL;
      unint64_t v8 = "com.apple.siri.directInvocation.emergency.callEmergencyResource";
      goto LABEL_14;
    case 4:
      unint64_t v8 = "com.apple.siri.directInvocation.emergency.startSiren";
      goto LABEL_14;
    case 5:
      unint64_t v2 = 0xD000000000000035;
      unint64_t v8 = "com.apple.siri.directInvocation.emergency.gatFallback";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_228799730(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000002287AA050;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000015;
    }
    else {
      unint64_t v5 = 0xD000000000000013;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x80000002287AA030;
    }
    else {
      unint64_t v6 = 0x80000002287AA010;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000012;
  unint64_t v6 = 0x80000002287AA050;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0xD000000000000015;
    }
    else {
      unint64_t v2 = 0xD000000000000013;
    }
    if (v7 == 1) {
      unint64_t v3 = 0x80000002287AA030;
    }
    else {
      unint64_t v3 = 0x80000002287AA010;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_228799828(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x65746973626577;
  }
  else {
    uint64_t v3 = 0x756E20656E6F6870;
  }
  if (v2) {
    unint64_t v4 = 0xEC0000007265626DLL;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x65746973626577;
  }
  else {
    uint64_t v5 = 0x756E20656E6F6870;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xEC0000007265626DLL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2287998D4(char a1, char a2)
{
  if (*(void *)&aCall_2[8 * a1] == *(void *)&aCall_2[8 * a2]
    && *(void *)&aSummarischecke_0[8 * a1 + 16] == *(void *)&aSummarischecke_0[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22879995C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000019;
  unint64_t v3 = 0x80000002287AA8B0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000019;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001CLL;
      unint64_t v6 = "sexual assault crisis center";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000015;
      unint64_t v6 = "poison control center";
      goto LABEL_5;
    case 3:
      unint64_t v6 = "domestic violence hotline";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000002287AA8B0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD00000000000001CLL;
      char v8 = "sexual assault crisis center";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000015;
      char v8 = "poison control center";
      goto LABEL_10;
    case 3:
      char v8 = "domestic violence hotline";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_228799AB0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 28526;
  }
  else {
    uint64_t v3 = 7562617;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE200000000000000;
  }
  if (a2) {
    uint64_t v5 = 28526;
  }
  else {
    uint64_t v5 = 7562617;
  }
  if (a2) {
    unint64_t v6 = 0xE200000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_228799B40(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000002287A9F70;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x636E656772656D65;
      unint64_t v3 = 0xED00006272655679;
      break;
    case 2:
      break;
    case 3:
      unint64_t v5 = 0xD000000000000015;
      unint64_t v6 = "emergencyConfirmation";
      goto LABEL_7;
    case 4:
      unint64_t v5 = 0xD000000000000015;
      unint64_t v6 = "emergencyOrganization";
      goto LABEL_7;
    case 5:
      unint64_t v6 = "emergencyAttribute";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v5 = 0x636E656772656D65;
      unint64_t v3 = 0xE900000000000079;
      break;
  }
  unint64_t v7 = 0x80000002287A9F70;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x636E656772656D65;
      unint64_t v7 = 0xED00006272655679;
      break;
    case 2:
      break;
    case 3:
      unint64_t v2 = 0xD000000000000015;
      char v8 = "emergencyConfirmation";
      goto LABEL_14;
    case 4:
      unint64_t v2 = 0xD000000000000015;
      char v8 = "emergencyOrganization";
      goto LABEL_14;
    case 5:
      char v8 = "emergencyAttribute";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v2 = 0x636E656772656D65;
      unint64_t v7 = 0xE900000000000079;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t EmergencyCSAMIntent.emergencyVerb.getter(__int16 a1)
{
  return HIBYTE(a1);
}

uint64_t EmergencyCSAMIntent.originalInput.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

SiriEmergencyIntents::EmergencyCSAMIntent_optional __swiftcall EmergencyCSAMIntent.init(emergencySituation:emergencyVerb:originalInput:)(SiriEmergencyIntents::EmergencySituation_optional emergencySituation, SiriEmergencyIntents::EmergencyVerb_optional emergencyVerb, Swift::String_optional originalInput)
{
  uint64_t object = (uint64_t)originalInput.value._object;
  uint64_t countAndFlagsBits = originalInput.value._countAndFlagsBits;
  int value = emergencySituation.value;
  uint64_t v7 = sub_2287A83C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((value - 6) > 3)
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_2287A83A0();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
    unint64_t v13 = sub_2287A83B0();
    os_log_type_t v14 = sub_2287A84D0();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v24 = v16;
      *(_DWORD *)char v15 = 136315138;
      uint64_t v22 = v15 + 4;
      LOBYTE(v23) = value;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268263040);
      uint64_t v17 = sub_2287A84E0();
      uint64_t v23 = sub_22878DE80(v17, v18, &v24);
      sub_2287A84F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22878A000, v13, v14, "Failed to initialize EmergencyCSAMIntent. Unsupported emergencySituation: [%s]", v15, 0xCu);
      uint64_t object = 1;
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v16, -1, -1);
      MEMORY[0x22A69C820](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      __int16 v11 = 0;
      uint64_t countAndFlagsBits = 0;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      __int16 v11 = 0;
      uint64_t countAndFlagsBits = 0;
      uint64_t object = 1;
    }
  }
  else
  {
    __int16 v11 = value | (emergencyVerb.value << 8);
  }
  __int16 v19 = v11;
  uint64_t v20 = countAndFlagsBits;
  uint64_t v21 = (void *)object;
  result.value.originalInput.value._uint64_t object = v21;
  result.value.originalInput.value._uint64_t countAndFlagsBits = v20;
  *(_WORD *)&result.value.emergencySituation = v19;
  return result;
}

uint64_t EmergencyCSAMIntent.isCSAMContentReporting.getter(__int16 a1)
{
  if (EmergencySituation.rawValue.getter(a1) == 0xD000000000000011 && v2 == 0x80000002287AAA20)
  {
    char v3 = 1;
LABEL_13:
    swift_bridgeObjectRelease();
    char v5 = v3;
    return v5 & 1;
  }
  char v4 = sub_2287A85F0();
  swift_bridgeObjectRelease();
  if (v4)
  {
    char v5 = 1;
  }
  else if (EmergencySituation.rawValue.getter(a1) == 0x7078655F6D617363 && v6 == 0xED0000746963696CLL)
  {
    swift_bridgeObjectRelease();
    char v3 = 1;
    char v5 = 0;
    switch(HIBYTE(a1))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        goto LABEL_12;
      case 8:
        return v5 & 1;
      default:
        goto LABEL_13;
    }
  }
  else
  {
    char v7 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    char v5 = 0;
    if ((v7 & 1) != 0 && HIBYTE(a1) != 8)
    {
      char v3 = 1;
      switch(HIBYTE(a1))
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
LABEL_12:
          char v3 = sub_2287A85F0();
          break;
        default:
          goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  return v5 & 1;
}

uint64_t EmergencyCSAMIntent.isCSAMHelpBadActor.getter(char a1)
{
  if (EmergencySituation.rawValue.getter(a1) == 0xD000000000000013 && v1 == 0x80000002287AA9E0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v3 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t EmergencyCSAMIntent.isCSAMHelpVictim.getter(char a1)
{
  if (EmergencySituation.rawValue.getter(a1) == 0xD000000000000010 && v1 == 0x80000002287AAA00)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v3 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t EmergencyCSAMIntent.isCSAMExplicit.getter(char a1)
{
  if (EmergencySituation.rawValue.getter(a1) == 0x7078655F6D617363 && v1 == 0xED0000746963696CLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v3 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
}

uint64_t destroy for EmergencyCSAMIntent()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s20SiriEmergencyIntents19EmergencyCSAMIntentVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EmergencyCSAMIntent(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for EmergencyCSAMIntent(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyCSAMIntent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyCSAMIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyCSAMIntent()
{
  return &type metadata for EmergencyCSAMIntent;
}

uint64_t EmergencyBasicIntent.emergencySituation.getter(__int16 a1)
{
  return HIBYTE(a1);
}

SiriEmergencyIntents::EmergencyBasicIntent __swiftcall EmergencyBasicIntent.init(emergencyOrganization:emergencySituation:)(SiriEmergencyIntents::EmergencyOrganization_optional emergencyOrganization, SiriEmergencyIntents::EmergencySituation_optional emergencySituation)
{
  return (SiriEmergencyIntents::EmergencyBasicIntent)(emergencyOrganization.value | (*(_WORD *)&emergencySituation << 8));
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyBasicIntent(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 16)) - 65284;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65284;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65284;
    }
  }
LABEL_17:
  if (*(unsigned __int8 *)a1 <= 4u) {
    int v6 = 4;
  }
  else {
    int v6 = *(unsigned __int8 *)a1;
  }
  int v7 = v6 - 5;
  if (*(unsigned __int8 *)a1 < 4u) {
    int v8 = -1;
  }
  else {
    int v8 = v7;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyBasicIntent(uint64_t result, unsigned int a2, unsigned int a3)
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
    *(_WORD *)__n128 result = a2 - 252;
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
        JUMPOUT(0x22879A774);
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
          *(unsigned char *)__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyBasicIntent()
{
  return &type metadata for EmergencyBasicIntent;
}

uint64_t EmergencyOrganizationInfo.countryCode.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.languageCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.city.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.phoneNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.website.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.websearchQuery.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EmergencyOrganizationInfo.emergencyOrganization.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall EmergencyOrganizationInfo.init(countryCode:languageCode:city:name:phoneNumber:website:websearchQuery:emergencyOrganization:)(SiriEmergencyIntents::EmergencyOrganizationInfo *__return_ptr retstr, Swift::String countryCode, Swift::String languageCode, Swift::String city, Swift::String name, Swift::String phoneNumber, Swift::String website, Swift::String websearchQuery, Swift::String emergencyOrganization)
{
  retstr->countryCode = countryCode;
  retstr->languageCode = languageCode;
  retstr->city = city;
  retstr->name = name;
  retstr->phoneNumber = phoneNumber;
  retstr->website = website;
  retstr->websearchQuery = websearchQuery;
  retstr->emergencyOrganization = emergencyOrganization;
}

double EmergencyOrganizationInfo.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_22879B938(a1, v9);
  if (!v2)
  {
    long long v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    long long v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    long long v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    double result = *(double *)&v10;
    long long v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

unint64_t sub_22879A9AC(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65676175676E616CLL;
      break;
    case 2:
      unint64_t result = 2037672291;
      break;
    case 3:
      unint64_t result = 1701667182;
      break;
    case 4:
      unint64_t result = 0x6D754E656E6F6870;
      break;
    case 5:
      unint64_t result = 0x65746973626577;
      break;
    case 6:
      unint64_t result = 0x6372616573626577;
      break;
    case 7:
      return result;
    default:
      unint64_t result = 0x437972746E756F63;
      break;
  }
  return result;
}

BOOL sub_22879AAC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22879AADC()
{
  return sub_2287A8670();
}

uint64_t sub_22879AB24()
{
  return sub_2287A8660();
}

uint64_t sub_22879AB50()
{
  return sub_2287A8670();
}

unint64_t sub_22879AB94()
{
  return sub_22879A9AC(*v0);
}

uint64_t sub_22879AB9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22879C784(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22879ABC4()
{
  return 0;
}

void sub_22879ABD0(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_22879ABDC(uint64_t a1)
{
  unint64_t v2 = sub_22879C0B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22879AC18(uint64_t a1)
{
  unint64_t v2 = sub_22879C0B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t static EmergencyOrganizationInfo.siren()@<X0>(void *a1@<X8>)
{
  return sub_22879AC94(0x636E656772656D45, 0xEF6E657269532079, a1);
}

uint64_t static EmergencyOrganizationInfo.emergencyServices()@<X0>(void *a1@<X8>)
{
  return sub_22879AC94(0xD000000000000012, 0x80000002287AAE70, a1);
}

uint64_t sub_22879AC94@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0xE000000000000000;
  a3[2] = 0;
  a3[3] = 0xE000000000000000;
  a3[4] = 0;
  a3[5] = 0xE000000000000000;
  a3[6] = result;
  a3[7] = a2;
  a3[8] = 0;
  a3[9] = 0xE000000000000000;
  a3[10] = 0;
  a3[11] = 0xE000000000000000;
  a3[12] = 0;
  a3[13] = 0xE000000000000000;
  a3[14] = 0;
  a3[15] = 0xE000000000000000;
  return result;
}

uint64_t EmergencyOrganizationInfo.websiteURL.getter()
{
  return sub_2287A7FC0();
}

uint64_t EmergencyOrganizationInfo.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682630C8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22879C0B8();
  sub_2287A8690();
  v8[15] = 0;
  sub_2287A85D0();
  if (!v1)
  {
    v8[14] = 1;
    sub_2287A85D0();
    v8[13] = 2;
    sub_2287A85D0();
    v8[12] = 3;
    sub_2287A85D0();
    v8[11] = 4;
    sub_2287A85D0();
    v8[10] = 5;
    sub_2287A85D0();
    v8[9] = 6;
    sub_2287A85D0();
    v8[8] = 7;
    sub_2287A85D0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

double sub_22879AF14@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_22879B938(a1, v9);
  if (!v2)
  {
    long long v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    long long v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    long long v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    double result = *(double *)&v10;
    long long v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

uint64_t sub_22879AF68(void *a1)
{
  return EmergencyOrganizationInfo.encode(to:)(a1);
}

BOOL EmergencyOrganizationInfo.hasNameAndNumber.getter()
{
  uint64_t v1 = v0[7];
  if ((v1 & 0x2000000000000000) != 0)
  {
    if ((v1 & 0xF00000000000000) != 0) {
      goto LABEL_3;
    }
    return 0;
  }
  if ((v0[6] & 0xFFFFFFFFFFFFLL) == 0) {
    return 0;
  }
LABEL_3:
  unint64_t v2 = v0[9];
  if ((v2 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(v2) & 0xF;
  }
  else {
    uint64_t v3 = v0[8] & 0xFFFFFFFFFFFFLL;
  }
  return v3 != 0;
}

BOOL EmergencyOrganizationInfo.hasNameAndWebsite.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682630D8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + 56);
  if ((v4 & 0x2000000000000000) != 0)
  {
    if ((v4 & 0xF00000000000000) != 0) {
      goto LABEL_3;
    }
    return 0;
  }
  if ((*(void *)(v0 + 48) & 0xFFFFFFFFFFFFLL) == 0) {
    return 0;
  }
LABEL_3:
  sub_2287A7FC0();
  uint64_t v5 = sub_2287A7FD0();
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_22879C10C((uint64_t)v3);
  return v6;
}

BOOL EmergencyOrganizationInfo.hasWebsearchQuery.getter()
{
  unint64_t v1 = *(void *)(v0 + 104);
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  else {
    uint64_t v2 = *(void *)(v0 + 96) & 0xFFFFFFFFFFFFLL;
  }
  return v2 != 0;
}

void __swiftcall EmergencyOrganizationInfo.asWebsearchQueryOnly()(SiriEmergencyIntents::EmergencyOrganizationInfo *__return_ptr retstr)
{
  uint64_t v3 = *v1;
  uint64_t v2 = (void *)v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = (void *)v1[3];
  uint64_t v6 = v1[12];
  long long v7 = (void *)v1[13];
  uint64_t v8 = v1[14];
  uint64_t v9 = (void *)v1[15];
  retstr->countryCode._uint64_t countAndFlagsBits = v3;
  retstr->countryCode._uint64_t object = v2;
  retstr->languageCode._uint64_t countAndFlagsBits = v4;
  retstr->languageCode._uint64_t object = v5;
  retstr->city._uint64_t countAndFlagsBits = 0;
  retstr->city._uint64_t object = (void *)0xE000000000000000;
  retstr->name._uint64_t countAndFlagsBits = 0;
  retstr->name._uint64_t object = (void *)0xE000000000000000;
  retstr->phoneNumber._uint64_t countAndFlagsBits = 0;
  retstr->phoneNumber._uint64_t object = (void *)0xE000000000000000;
  retstr->website._uint64_t countAndFlagsBits = 0;
  retstr->website._uint64_t object = (void *)0xE000000000000000;
  retstr->websearchQuery._uint64_t countAndFlagsBits = v6;
  retstr->websearchQuery._uint64_t object = v7;
  retstr->emergencyOrganization._uint64_t countAndFlagsBits = v8;
  retstr->emergencyOrganization._uint64_t object = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  swift_bridgeObjectRetain();
}

unint64_t EmergencyOrganizationInfo.asRREntities()()
{
  unint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682630D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682630E0);
  MEMORY[0x270FA5388](v5 - 8);
  long long v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2287A83F0();
  uint64_t v54 = *(void *)(v8 - 8);
  uint64_t v55 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  long long v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  long long v14 = (char *)&v48 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v48 - v16;
  MEMORY[0x270FA5388](v15);
  __int16 v19 = (char *)&v48 - v18;
  uint64_t v20 = sub_2287A8190();
  uint64_t v56 = *(void *)(v20 - 8);
  uint64_t v57 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v48 - v23;
  unint64_t v25 = v1[7];
  uint64_t v26 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0) {
    uint64_t v26 = v1[6] & 0xFFFFFFFFFFFFLL;
  }
  if (!v26) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v52 = v7;
  uint64_t v53 = v17;
  uint64_t v49 = v22;
  unint64_t v50 = v11;
  uint64_t v51 = v14;
  unint64_t v27 = v1[9];
  uint64_t v28 = HIBYTE(v27) & 0xF;
  if ((v27 & 0x2000000000000000) == 0) {
    uint64_t v28 = v1[8] & 0xFFFFFFFFFFFFLL;
  }
  if (v28)
  {
    uint64_t v48 = v19;
    sub_2287A82F0();
    swift_allocObject();
    uint64_t v29 = sub_2287A82E0();
    sub_2287A82D0();
    sub_2287A8330();
    swift_allocObject();
    sub_2287A8320();
    sub_2287A8310();
    swift_retain();
    sub_2287A82C0();
    swift_release();
    sub_2287A8460();
    if (!v30) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    sub_2287A8160();
    sub_2287A8150();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v57);
    if (MEMORY[0x22A69C010](v29))
    {
      uint64_t v32 = sub_2287A83D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v52, 1, 1, v32);
      swift_retain();
      uint64_t v33 = v48;
      sub_2287A83E0();
      uint64_t v34 = v54;
      uint64_t v35 = v55;
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v53, v33, v55);
      unint64_t v31 = sub_2287A7998(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v37 = *(void *)(v31 + 16);
      unint64_t v36 = *(void *)(v31 + 24);
      if (v37 >= v36 >> 1) {
        unint64_t v31 = sub_2287A7998(v36 > 1, v37 + 1, 1, v31);
      }
      *(void *)(v31 + 16) = v37 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v31+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(void *)(v34 + 72) * v37, v53, v35);
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v48, v35);
      goto LABEL_17;
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  unint64_t v31 = MEMORY[0x263F8EE78];
  uint64_t v34 = v54;
  uint64_t v35 = v55;
LABEL_17:
  sub_2287A7FC0();
  uint64_t v38 = sub_2287A7FD0();
  int v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 48))(v4, 1, v38);
  sub_22879C10C((uint64_t)v4);
  if (v39 != 1)
  {
    sub_2287A8220();
    swift_allocObject();
    uint64_t v40 = sub_2287A8210();
    sub_2287A8200();
    sub_2287A8460();
    if (!v41) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    uint64_t v42 = v49;
    sub_2287A8160();
    sub_2287A8150();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v42, v57);
    if (MEMORY[0x22A69C010](v40))
    {
      uint64_t v43 = sub_2287A83D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v52, 1, 1, v43);
      swift_retain();
      v44 = v51;
      sub_2287A83E0();
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v50, v44, v35);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v31 = sub_2287A7998(0, *(void *)(v31 + 16) + 1, 1, v31);
      }
      unint64_t v46 = *(void *)(v31 + 16);
      unint64_t v45 = *(void *)(v31 + 24);
      if (v46 >= v45 >> 1) {
        unint64_t v31 = sub_2287A7998(v45 > 1, v46 + 1, 1, v31);
      }
      *(void *)(v31 + 16) = v46 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v31+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(void *)(v34 + 72) * v46, v50, v35);
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v51, v35);
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  return v31;
}

uint64_t sub_22879B938@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263100);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  unint64_t v82 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_22879C0B8();
  sub_2287A8680();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v82);
  }
  uint64_t v10 = v6;
  unint64_t v72 = a2;
  LOBYTE(v81[0]) = 0;
  uint64_t v11 = sub_2287A85C0();
  if (v12) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = 0xE000000000000000;
  if (v12) {
    unint64_t v16 = v12;
  }
  else {
    unint64_t v16 = 0xE000000000000000;
  }
  LOBYTE(v81[0]) = 1;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_2287A85C0();
  *(void *)&long long v71 = v14;
  *((void *)&v71 + 1) = v16;
  if (v18) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v18) {
    unint64_t v15 = v18;
  }
  LOBYTE(v81[0]) = 2;
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_2287A85C0();
  *(void *)&long long v70 = v19;
  *((void *)&v70 + 1) = v15;
  if (v21) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v23 = 0xE000000000000000;
  if (v21) {
    unint64_t v24 = v21;
  }
  else {
    unint64_t v24 = 0xE000000000000000;
  }
  LOBYTE(v81[0]) = 3;
  unint64_t v25 = v24;
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_2287A85C0();
  unint64_t v69 = v25;
  if (v27) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = 0;
  }
  if (v27) {
    unint64_t v23 = v27;
  }
  LOBYTE(v81[0]) = 4;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_2287A85C0();
  uint64_t v63 = v28;
  uint64_t v64 = v22;
  unint64_t v68 = v23;
  if (v30) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = 0;
  }
  if (v30) {
    unint64_t v32 = v30;
  }
  else {
    unint64_t v32 = 0xE000000000000000;
  }
  LOBYTE(v81[0]) = 5;
  swift_bridgeObjectRetain();
  unint64_t v66 = 0;
  uint64_t v33 = sub_2287A85C0();
  uint64_t v35 = v10;
  unint64_t v67 = v32;
  uint64_t v62 = v31;
  if (v34) {
    uint64_t v36 = v33;
  }
  else {
    uint64_t v36 = 0;
  }
  if (v34) {
    unint64_t v37 = v34;
  }
  else {
    unint64_t v37 = 0xE000000000000000;
  }
  LOBYTE(v81[0]) = 6;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_2287A85C0();
  unint64_t v65 = v37;
  unint64_t v60 = v39;
  uint64_t v61 = v38;
  if (v39) {
    unint64_t v40 = v39;
  }
  else {
    unint64_t v40 = 0xE000000000000000;
  }
  LOBYTE(v81[0]) = 7;
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_2287A85C0();
  if (v60) {
    uint64_t v43 = v61;
  }
  else {
    uint64_t v43 = 0;
  }
  if (v42) {
    uint64_t v44 = v41;
  }
  else {
    uint64_t v44 = 0;
  }
  unint64_t v60 = v43;
  uint64_t v61 = v44;
  unint64_t v45 = 0xE000000000000000;
  if (v42) {
    unint64_t v45 = v42;
  }
  unint64_t v66 = v45;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v5);
  uint64_t v46 = *((void *)&v71 + 1);
  long long v73 = v71;
  uint64_t v47 = v36;
  uint64_t v59 = v36;
  unint64_t v48 = v69;
  unint64_t v49 = v32;
  uint64_t v50 = *((void *)&v70 + 1);
  long long v74 = v70;
  *(void *)&long long v75 = v64;
  *((void *)&v75 + 1) = v69;
  unint64_t v51 = v68;
  *(void *)&long long v76 = v63;
  *((void *)&v76 + 1) = v68;
  *(void *)&long long v77 = v62;
  *((void *)&v77 + 1) = v49;
  *(void *)&long long v78 = v47;
  *((void *)&v78 + 1) = v65;
  *(void *)&long long v79 = v43;
  *((void *)&v79 + 1) = v40;
  *(void *)&long long v80 = v61;
  *((void *)&v80 + 1) = v66;
  sub_22879CABC((uint64_t)&v73);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v52 = v65;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v82);
  v81[0] = v71;
  v81[1] = v46;
  v81[2] = v70;
  v81[3] = v50;
  v81[4] = v64;
  v81[5] = v48;
  v81[6] = v63;
  v81[7] = v51;
  v81[8] = v62;
  v81[9] = v49;
  v81[10] = v59;
  v81[11] = v52;
  v81[12] = v60;
  v81[13] = v40;
  v81[14] = v61;
  v81[15] = v66;
  uint64_t result = sub_22879CB54((uint64_t)v81);
  long long v53 = v78;
  uint64_t v54 = v72;
  v72[4] = v77;
  v54[5] = v53;
  long long v55 = v80;
  v54[6] = v79;
  v54[7] = v55;
  long long v56 = v74;
  *uint64_t v54 = v73;
  v54[1] = v56;
  long long v57 = v76;
  v54[2] = v75;
  v54[3] = v57;
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

unint64_t sub_22879C0B8()
{
  unint64_t result = qword_2682630D0;
  if (!qword_2682630D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682630D0);
  }
  return result;
}

uint64_t sub_22879C10C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682630D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for EmergencyOrganizationInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EmergencyOrganizationInfo()
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

void *initializeWithCopy for EmergencyOrganizationInfo(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  uint64_t v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  uint64_t v10 = a2[15];
  a1[14] = a2[14];
  a1[15] = v10;
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

void *assignWithCopy for EmergencyOrganizationInfo(void *a1, void *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

void *assignWithTake for EmergencyOrganizationInfo(void *a1, void *a2)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyOrganizationInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyOrganizationInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyOrganizationInfo()
{
  return &type metadata for EmergencyOrganizationInfo;
}

unsigned char *storeEnumTagSinglePayload for EmergencyOrganizationInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x22879C644);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyOrganizationInfo.CodingKeys()
{
  return &type metadata for EmergencyOrganizationInfo.CodingKeys;
}

unint64_t sub_22879C680()
{
  unint64_t result = qword_2682630E8;
  if (!qword_2682630E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682630E8);
  }
  return result;
}

unint64_t sub_22879C6D8()
{
  unint64_t result = qword_2682630F0;
  if (!qword_2682630F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682630F0);
  }
  return result;
}

unint64_t sub_22879C730()
{
  unint64_t result = qword_2682630F8;
  if (!qword_2682630F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682630F8);
  }
  return result;
}

uint64_t sub_22879C784(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
  if (v3 || (sub_2287A85F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43 || (sub_2287A85F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2037672291 && a2 == 0xE400000000000000 || (sub_2287A85F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_2287A85F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562 || (sub_2287A85F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65746973626577 && a2 == 0xE700000000000000 || (sub_2287A85F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6372616573626577 && a2 == 0xEE00797265755168 || (sub_2287A85F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002287A9FB0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_2287A85F0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_22879CABC(uint64_t a1)
{
  return a1;
}

uint64_t sub_22879CB54(uint64_t a1)
{
  return a1;
}

uint64_t EmergencyInformationIntent.emergencyAttribute.getter(char a1)
{
  return a1 & 1;
}

uint64_t EmergencyInformationIntent.emergencyOrganization.getter(unsigned int a1)
{
  return a1 >> 8;
}

uint64_t EmergencyInformationIntent.emergencySituation.getter(unsigned int a1)
{
  return HIWORD(a1);
}

SiriEmergencyIntents::EmergencyInformationIntent __swiftcall EmergencyInformationIntent.init(emergencyAttribute:emergencyOrganization:emergencySituation:)(SiriEmergencyIntents::EmergencyAttribute emergencyAttribute, SiriEmergencyIntents::EmergencyOrganization_optional emergencyOrganization, SiriEmergencyIntents::EmergencySituation_optional emergencySituation)
{
  return (SiriEmergencyIntents::EmergencyInformationIntent)((unsigned __int16)(emergencyOrganization.value << 8) | (emergencySituation.value << 16) | emergencyAttribute & 1);
}

BOOL static EmergencyInformationIntentResponseCode.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t EmergencyInformationIntentResponseCode.hash(into:)()
{
  return sub_2287A8660();
}

uint64_t EmergencyInformationIntentResponseCode.hashValue.getter()
{
  return sub_2287A8670();
}

uint64_t EmergencyInformationIntentResponse.code.getter()
{
  return *v0;
}

uint64_t EmergencyInformationIntentResponse.emergencyOrganizationInfo.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22879CCB0(v1 + 8, a1);
}

uint64_t sub_22879CCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void __swiftcall EmergencyInformationIntentResponse.init(code:emergencyOrganizationInfo:)(SiriEmergencyIntents::EmergencyInformationIntentResponse *__return_ptr retstr, SiriEmergencyIntents::EmergencyInformationIntentResponseCode code, SiriEmergencyIntents::EmergencyOrganizationInfo_optional *emergencyOrganizationInfo)
{
  sub_22879CDB4((uint64_t)emergencyOrganizationInfo, (uint64_t)v9);
  sub_22879CDB4((uint64_t)v9, (uint64_t)v10);
  LOBYTE(v11[0]) = code;
  sub_22879CDB4((uint64_t)v10, (uint64_t)v11 + 8);
  long long v5 = v11[7];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.website._uint64_t object = v11[6];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.websearchQuery._uint64_t object = v5;
  retstr->emergencyOrganizationInfo.value.emergencyOrganization._uint64_t object = v12;
  long long v6 = v11[3];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.languageCode._uint64_t object = v11[2];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.city._uint64_t object = v6;
  long long v7 = v11[5];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.name._uint64_t object = v11[4];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.phoneNumber._uint64_t object = v7;
  long long v8 = v11[1];
  *(_OWORD *)&retstr->code = v11[0];
  *(_OWORD *)&retstr->emergencyOrganizationInfo.value.countryCode._uint64_t object = v8;
}

uint64_t sub_22879CDB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22879CE20()
{
  unint64_t result = qword_268263110;
  if (!qword_268263110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263110);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyInformationIntent(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
  }
  unsigned int v4 = *(unsigned __int8 *)a1;
  BOOL v5 = v4 >= 2;
  int v6 = v4 - 2;
  if (!v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyInformationIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)unint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)unint64_t result = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyInformationIntent()
{
  return &type metadata for EmergencyInformationIntent;
}

unsigned char *storeEnumTagSinglePayload for EmergencyInformationIntentResponseCode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22879D04CLL);
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

ValueMetadata *type metadata accessor for EmergencyInformationIntentResponseCode()
{
  return &type metadata for EmergencyInformationIntentResponseCode;
}

uint64_t destroy for EmergencyInformationIntentResponse(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result)
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
  return result;
}

uint64_t initializeWithCopy for EmergencyInformationIntentResponse(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v3 = (_OWORD *)(a1 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v5;
    uint64_t v6 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v7;
    uint64_t v8 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v8;
    uint64_t v9 = *(void *)(a2 + 96);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = v9;
    uint64_t v10 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = v10;
    uint64_t v11 = *(void *)(a2 + 128);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *(_OWORD *)(a2 + 88);
    v3[4] = *(_OWORD *)(a2 + 72);
    v3[5] = v12;
    long long v13 = *(_OWORD *)(a2 + 120);
    v3[6] = *(_OWORD *)(a2 + 104);
    v3[7] = v13;
    long long v14 = *(_OWORD *)(a2 + 24);
    *int v3 = *(_OWORD *)(a2 + 8);
    v3[1] = v14;
    long long v15 = *(_OWORD *)(a2 + 56);
    v3[2] = *(_OWORD *)(a2 + 40);
    v3[3] = v15;
  }
  return a1;
}

uint64_t assignWithCopy for EmergencyInformationIntentResponse(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = (long long *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v6)
    {
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
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
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22879D464(a1 + 8);
      long long v7 = v5[3];
      long long v9 = *v5;
      long long v8 = v5[1];
      v4[2] = v5[2];
      v4[3] = v7;
      *uint64_t v4 = v9;
      v4[1] = v8;
      long long v10 = v5[7];
      long long v12 = v5[4];
      long long v11 = v5[5];
      v4[6] = v5[6];
      v4[7] = v10;
      v4[4] = v12;
      v4[5] = v11;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *v5;
    long long v14 = *(_OWORD *)(a2 + 24);
    long long v15 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v15;
    *uint64_t v4 = v13;
    *(_OWORD *)(a1 + 24) = v14;
    long long v16 = *(_OWORD *)(a2 + 72);
    long long v17 = *(_OWORD *)(a2 + 88);
    long long v18 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v18;
    *(_OWORD *)(a1 + 72) = v16;
    *(_OWORD *)(a1 + 88) = v17;
  }
  return a1;
}

uint64_t sub_22879D464(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
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
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for EmergencyInformationIntentResponse(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v3 = (_OWORD *)(a1 + 8);
  long long v4 = (_OWORD *)(a2 + 8);
  if (!*(void *)(a1 + 16)) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a2 + 16);
  if (!v6)
  {
    sub_22879D464((uint64_t)v3);
LABEL_5:
    long long v14 = v4[5];
    v3[4] = v4[4];
    v3[5] = v14;
    long long v15 = v4[7];
    v3[6] = v4[6];
    v3[7] = v15;
    long long v16 = v4[1];
    *long long v3 = *v4;
    v3[1] = v16;
    long long v17 = v4[3];
    v3[2] = v4[2];
    v3[3] = v17;
    return a1;
  }
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyInformationIntentResponse(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyInformationIntentResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyInformationIntentResponse()
{
  return &type metadata for EmergencyInformationIntentResponse;
}

uint64_t sub_22879D6C4()
{
  return sub_2287A8670();
}

uint64_t sub_22879D7D4()
{
  return sub_2287A8670();
}

uint64_t sub_22879D840()
{
  return sub_2287A8670();
}

uint64_t sub_22879D8B0()
{
  return sub_2287A8670();
}

uint64_t sub_22879D93C()
{
  return sub_2287A8670();
}

uint64_t sub_22879DA3C()
{
  return sub_2287A8670();
}

uint64_t sub_22879DAE4()
{
  return sub_2287A8670();
}

uint64_t sub_22879DB70()
{
  return sub_2287A8670();
}

uint64_t sub_22879DC48()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879DD98()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879DDEC()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879DE60()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879DF40()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879DFD0()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879E0C0()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879E134()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879E188()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879E240()
{
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22879E298()
{
  return sub_2287A8670();
}

uint64_t sub_22879E304()
{
  return sub_2287A8670();
}

uint64_t sub_22879E3D8()
{
  return sub_2287A8670();
}

uint64_t sub_22879E440()
{
  return sub_2287A8670();
}

uint64_t sub_22879E4C8()
{
  return sub_2287A8670();
}

uint64_t sub_22879E5D4()
{
  return sub_2287A8670();
}

uint64_t sub_22879E678()
{
  return sub_2287A8670();
}

uint64_t sub_22879E774()
{
  return sub_2287A8670();
}

uint64_t sub_22879E7FC()
{
  return sub_2287A8670();
}

SiriEmergencyIntents::EmergencyOrganization_optional __swiftcall EmergencyOrganization.init(catiIntentName:)(SiriEmergencyIntents::CATIIntentName catiIntentName)
{
  if ((catiIntentName - 10) > 0xBu) {
    return (SiriEmergencyIntents::EmergencyOrganization_optional)4;
  }
  else {
    return (SiriEmergencyIntents::EmergencyOrganization_optional)byte_2287A9C98[(char)(catiIntentName - 10)];
  }
}

unint64_t EmergencyOrganization.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22879E918(unsigned __int8 *a1, char *a2)
{
  return sub_22879995C(*a1, *a2);
}

uint64_t sub_22879E924()
{
  return sub_22879DB70();
}

uint64_t sub_22879E92C()
{
  return sub_22879E188();
}

uint64_t sub_22879E934()
{
  return sub_22879E304();
}

uint64_t sub_22879E93C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22879E96C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = EmergencyOrganization.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B12OrganizationO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A85B0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_22879E9E8()
{
  unint64_t result = qword_268263118;
  if (!qword_268263118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263118);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyOrganization(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EmergencyOrganization(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22879EB98);
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

ValueMetadata *type metadata accessor for EmergencyOrganization()
{
  return &type metadata for EmergencyOrganization;
}

uint64_t sub_22879EBD0()
{
  return swift_deallocClassInstance();
}

uint64_t EmergencyOrganizationInfoProvider.siriLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2287A8010();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t EmergencyOrganizationInfoProvider.locationProvider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EmergencyOrganizationInfoProvider() + 20);

  return sub_22879ECD8(v3, a1);
}

uint64_t type metadata accessor for EmergencyOrganizationInfoProvider()
{
  uint64_t result = qword_268263150;
  if (!qword_268263150) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22879ECD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t EmergencyOrganizationInfoProvider.resourceDecoder.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for EmergencyOrganizationInfoProvider() + 24));
  sub_22879ED80(v1);
  return v1;
}

uint64_t sub_22879ED80(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t EmergencyOrganizationInfoProvider.resourceDecoder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for EmergencyOrganizationInfoProvider() + 24));
  uint64_t result = sub_22879EDD8(*v5);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t sub_22879EDD8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*EmergencyOrganizationInfoProvider.resourceDecoder.modify())(void)
{
  return nullsub_1;
}

uint64_t EmergencyOrganizationInfoProvider.init(siriLocale:locationProvider:resourceDecoder:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for EmergencyOrganizationInfoProvider();
  uint64_t v11 = (void *)(a5 + *(int *)(v10 + 24));
  uint64_t v12 = sub_2287A8010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a5, a1, v12);
  uint64_t result = sub_22879EEDC(a2, a5 + *(int *)(v10 + 20));
  void *v11 = a3;
  v11[1] = a4;
  return result;
}

uint64_t sub_22879EEDC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_22879EEF4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_2287A83C0();
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v54 = (uint64_t *)((char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v47 - v8;
  MEMORY[0x270FA5388](v7);
  unint64_t v51 = (char *)&v47 - v10;
  uint64_t v55 = sub_2287A7FD0();
  uint64_t v11 = *(void *)(v55 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v55);
  MEMORY[0x270FA5388](v12);
  long long v14 = (char *)&v47 - v13;
  type metadata accessor for BundleHelper();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v52 = a1;
  long long v17 = (void *)sub_2287A8400();
  long long v18 = (void *)sub_2287A8400();
  id v19 = objc_msgSend(v16, sel_pathForResource_ofType_inDirectory_, v17, v18, 0);

  if (v19)
  {
    id v53 = v16;
    sub_2287A8410();

    sub_2287A7FB0();
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_2287A7FE0();
    unint64_t v32 = v31;
    unint64_t v49 = v14;
    sub_2287A7FA0();
    swift_allocObject();
    sub_2287A7F90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268263180);
    sub_2287A42C4();
    sub_2287A7F80();
    uint64_t v33 = v30;
    uint64_t v34 = v55;
    uint64_t v35 = v11;
    uint64_t v48 = v33;
    uint64_t v54 = v32;
    swift_release();
    uint64_t v38 = v58[1];
    uint64_t v39 = sub_2287A83A0();
    swift_beginAccess();
    unint64_t v40 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v51, v39, v4);
    unint64_t v41 = a2;
    swift_bridgeObjectRetain_n();
    unint64_t v42 = sub_2287A83B0();
    os_log_type_t v43 = sub_2287A84C0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v50 = v4;
      unint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      v58[0] = v46;
      *(_DWORD *)unint64_t v45 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_22878DE80(v52, v41, v58);
      uint64_t v34 = v55;
      sub_2287A84F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22878A000, v42, v43, "Successfully decoded plist for resourceName: %s", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v46, -1, -1);
      MEMORY[0x22A69C820](v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v56 + 8))(v40, v50);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v40, v4);
    }
    swift_bridgeObjectRetain();

    sub_2287A43D4(v48, (unint64_t)v54);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v49, v34);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = sub_2287A83A0();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v9, v20, v4);
    swift_bridgeObjectRetain_n();
    id v21 = v16;
    uint64_t v22 = sub_2287A83B0();
    os_log_type_t v23 = sub_2287A84D0();
    unint64_t v24 = a2;
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v50 = v4;
      uint64_t v26 = v25;
      uint64_t v54 = (void *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v57 = (uint64_t)v21;
      v58[0] = v55;
      *(_DWORD *)uint64_t v26 = 138412546;
      id v27 = v21;
      sub_2287A84F0();
      uint64_t v28 = v54;
      *uint64_t v54 = v21;

      *(_WORD *)(v26 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_22878DE80(v52, v24, v58);
      sub_2287A84F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22878A000, v22, v23, "Error getting path from bundle [%@] for resource file: %s.plist", (uint8_t *)v26, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268263168);
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v28, -1, -1);
      uint64_t v29 = v55;
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v29, -1, -1);
      MEMORY[0x22A69C820](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v56 + 8))(v9, v50);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v9, v4);
    }
    sub_2287A2DC8();
    uint64_t v38 = swift_allocError();
    *uint64_t v36 = 0;
  }
  return v38;
}

uint64_t EmergencyOrganizationInfoProvider.getOrganizationInfo(situation:organization:)(uint64_t a1, char a2, char a3)
{
  *(void *)(v4 + 1664) = v3;
  *(unsigned char *)(v4 + 146) = a3;
  *(unsigned char *)(v4 + 145) = a2;
  *(void *)(v4 + 1656) = a1;
  uint64_t v5 = type metadata accessor for EmergencyOrganizationInfoProvider();
  *(void *)(v4 + 1672) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v4 + 1680) = v6;
  *(void *)(v4 + 1688) = *(void *)(v6 + 64);
  *(void *)(v4 + 1696) = swift_task_alloc();
  *(void *)(v4 + 1704) = swift_task_alloc();
  uint64_t v7 = sub_2287A83C0();
  *(void *)(v4 + 1712) = v7;
  *(void *)(v4 + 1720) = *(void *)(v7 - 8);
  *(void *)(v4 + 1728) = swift_task_alloc();
  *(void *)(v4 + 1736) = swift_task_alloc();
  *(void *)(v4 + 1744) = swift_task_alloc();
  *(void *)(v4 + 1752) = swift_task_alloc();
  *(void *)(v4 + 1760) = swift_task_alloc();
  *(void *)(v4 + 1768) = swift_task_alloc();
  *(void *)(v4 + 1776) = swift_task_alloc();
  *(void *)(v4 + 1784) = swift_task_alloc();
  *(void *)(v4 + 1792) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22879FAA0, 0, 0);
}

uint64_t sub_22879FAA0()
{
  uint64_t v72 = v0;
  uint64_t v1 = *(void *)(v0 + 1792);
  uint64_t v2 = *(void *)(v0 + 1720);
  uint64_t v3 = *(void *)(v0 + 1712);
  uint64_t v4 = sub_2287A83A0();
  *(void *)(v0 + 1800) = v4;
  swift_beginAccess();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(void *)(v0 + 1808) = v5;
  *(void *)(v0 + 1816) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v3);
  uint64_t v6 = sub_2287A83B0();
  os_log_type_t v7 = sub_2287A84C0();
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = *(unsigned __int8 *)(v0 + 145);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    unint64_t v68 = v66;
    *(_DWORD *)uint64_t v9 = 136315394;
    if (v8 == 35)
    {
      unint64_t v10 = 0xE300000000000000;
      unint64_t v11 = 7104878;
    }
    else
    {
      unint64_t v11 = EmergencySituation.rawValue.getter(*(unsigned char *)(v0 + 145));
      unint64_t v10 = v16;
    }
    uint64_t v17 = 0xD000000000000019;
    uint64_t v18 = *(unsigned __int8 *)(v0 + 146);
    *(void *)(v0 + 1640) = sub_22878DE80(v11, v10, (uint64_t *)&v68);
    sub_2287A84F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    unint64_t v19 = 0x80000002287AA8B0;
    switch(v18)
    {
      case 1:
        uint64_t v17 = 0xD00000000000001CLL;
        uint64_t v20 = "sexual assault crisis center";
        goto LABEL_10;
      case 2:
        uint64_t v17 = 0xD000000000000015;
        uint64_t v20 = "poison control center";
        goto LABEL_10;
      case 3:
        uint64_t v20 = "domestic violence hotline";
LABEL_10:
        unint64_t v19 = (unint64_t)(v20 - 32) | 0x8000000000000000;
        break;
      case 4:
        unint64_t v19 = 0xE300000000000000;
        uint64_t v17 = 7104878;
        break;
      default:
        break;
    }
    uint64_t v21 = *(void *)(v0 + 1720);
    uint64_t v64 = *(void *)(v0 + 1712);
    uint64_t v65 = *(void *)(v0 + 1792);
    *(void *)(v0 + 1648) = sub_22878DE80(v17, v19, (uint64_t *)&v68);
    sub_2287A84F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22878A000, v6, v7, "Fetching org info for situation: %s, organization: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A69C820](v66, -1, -1);
    MEMORY[0x22A69C820](v9, -1, -1);

    long long v15 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v15(v65, v64);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 1792);
    uint64_t v13 = *(void *)(v0 + 1720);
    uint64_t v14 = *(void *)(v0 + 1712);

    long long v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v15(v12, v14);
  }
  *(void *)(v0 + 1824) = v15;
  v22.SiriEmergencyIntents::EmergencySituation value = inferUsableSituation(situation:organization:)(*(SiriEmergencyIntents::EmergencySituation_optional *)(v0 + 145), *(SiriEmergencyIntents::EmergencyOrganization_optional *)(v0 + 146)).value;
  if (v22.value == SiriEmergencyIntents_EmergencySituation_unknownDefault)
  {
    uint64_t v23 = v0 + 424;
    uint64_t v24 = *(void *)(v0 + 1728);
    uint64_t v25 = *(void *)(v0 + 1712);
    swift_beginAccess();
    v5(v24, v4, v25);
    uint64_t v26 = sub_2287A83B0();
    os_log_type_t v27 = sub_2287A84D0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_22878A000, v26, v27, "Both EmergencySituation and EmergencyOrganization were nil while fetching Resource", v28, 2u);
      MEMORY[0x22A69C820](v28, -1, -1);
    }
    uint64_t v29 = *(void *)(v0 + 1728);
    uint64_t v30 = *(void *)(v0 + 1712);

    v15(v29, v30);
    sub_2287A2DC8();
    uint64_t v31 = swift_allocError();
    *unint64_t v32 = 1;
    *(void *)(v0 + 424) = v31;
    goto LABEL_25;
  }
  SiriEmergencyIntents::EmergencySituation value = v22.value;
  uint64_t v34 = *(void *)(v0 + 1664);
  uint64_t v35 = (uint64_t *)(v34 + *(int *)(*(void *)(v0 + 1672) + 24));
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  uint64_t v38 = *(void *)(v0 + 1704);
  if (*v35)
  {
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v37;
    *(void *)(v39 + 24) = v36;
    sub_2287A2E28(v34, v38);
    sub_22879ED80(v37);
    sub_2287A3068(v38);
  }
  else
  {
    uint64_t v40 = *(void *)(v0 + 1696);
    uint64_t v41 = *(void *)(v0 + 1680);
    sub_2287A2E28(*(void *)(v0 + 1664), *(void *)(v0 + 1704));
    sub_2287A2E28(v38, v40);
    unint64_t v42 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
    uint64_t v43 = swift_allocObject();
    sub_2287A2F8C(v40, v43 + v42);
    sub_22879ED80(0);
    sub_2287A3068(v38);
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = sub_2287A2FF0;
    *(void *)(v44 + 24) = v43;
  }
  if ((value & 0xFE) == 4)
  {
    unint64_t v45 = 0xD00000000000001DLL;
    unint64_t v46 = 0x80000002287AAED0;
  }
  else
  {
    *(void *)(v0 + 1496) = EmergencySituation.rawValue.getter(value);
    *(void *)(v0 + 1504) = v47;
    sub_2287A3100();
    uint64_t v48 = sub_2287A8510();
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1512) = v48;
    *(void *)(v0 + 1520) = v50;
    *(void *)(v0 + 1528) = 32;
    *(void *)(v0 + 1536) = 0xE100000000000000;
    *(void *)(v0 + 1544) = 0;
    *(void *)(v0 + 1552) = 0xE000000000000000;
    uint64_t v51 = sub_2287A8530();
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    unint64_t v68 = v51;
    unint64_t v69 = v53;
    swift_bridgeObjectRetain();
    sub_2287A8480();
    swift_bridgeObjectRelease();
    unint64_t v45 = v68;
    unint64_t v46 = v69;
  }
  unint64_t v68 = v45;
  unint64_t v69 = v46;
  ((void (*)(uint64_t *__return_ptr, unint64_t *))sub_2287A30FC)(&v70, &v68);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v54 = v70;
  *(void *)(v0 + 1832) = v70;
  if (v71)
  {
    uint64_t v23 = v0 + 560;
    *(void *)(v0 + 560) = v54;
LABEL_25:
    sub_2287A2E1C(v23);
    sub_2287A32F8(v23, v0 + 152, &qword_268263130);
    sub_2287A32F8(v0 + 152, *(void *)(v0 + 1656), &qword_268263130);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v55 = *(uint64_t (**)(void))(v0 + 8);
    return v55();
  }
  uint64_t v57 = *(void *)(v0 + 1672);
  uint64_t v58 = *(void *)(v0 + 1664);
  swift_bridgeObjectRetain();
  *(void *)(v0 + 1840) = sub_2287A8000();
  *(void *)(v0 + 1848) = v59;
  uint64_t v60 = *(int *)(v57 + 20);
  *(_DWORD *)(v0 + 148) = v60;
  uint64_t v61 = *(void *)(v58 + v60 + 24);
  uint64_t v62 = *(void *)(v58 + v60 + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v58 + v60), v61);
  unint64_t v67 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v62 + 16) + **(int **)(v62 + 16));
  uint64_t v63 = (void *)swift_task_alloc();
  *(void *)(v0 + 1856) = v63;
  *uint64_t v63 = v0;
  v63[1] = sub_2287A0308;
  return v67(v61, v62);
}

uint64_t sub_2287A0308(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1864) = a1;
  *(void *)(v3 + 1872) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2287A040C, 0, 0);
}

uint64_t sub_2287A040C()
{
  uint64_t v167 = v0;
  unint64_t v1 = *(void *)(v0 + 1872);
  unint64_t v2 = *(void *)(v0 + 1848);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
  uint64_t v4 = *(void *)(v0 + 1800);
  uint64_t v5 = *(void *)(v0 + 1784);
  uint64_t v6 = *(void *)(v0 + 1712);
  swift_beginAccess();
  v3(v5, v4, v6);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v7 = sub_2287A83B0();
  os_log_type_t v8 = sub_2287A84C0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v141 = *(void *)(v0 + 1872);
    uint64_t v140 = *(void *)(v0 + 1864);
    uint64_t v9 = *(void *)(v0 + 1848);
    uint64_t v10 = *(void *)(v0 + 1840);
    v163 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
    uint64_t v154 = *(void *)(v0 + 1712);
    uint64_t v159 = *(void *)(v0 + 1784);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v145 = swift_slowAlloc();
    v166[0] = v145;
    *(_DWORD *)uint64_t v11 = 136315394;
    if (v9)
    {
      unint64_t v12 = v2;
    }
    else
    {
      uint64_t v10 = 0x3E7974706D653CLL;
      unint64_t v12 = 0xE700000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)(v0 + 1624) = sub_22878DE80(v10, v12, v166);
    sub_2287A84F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2080;
    if (v141) {
      uint64_t v13 = v140;
    }
    else {
      uint64_t v13 = 0x3E7974706D653CLL;
    }
    if (v141) {
      unint64_t v14 = v1;
    }
    else {
      unint64_t v14 = 0xE700000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)(v0 + 1632) = sub_22878DE80(v13, v14, v166);
    sub_2287A84F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22878A000, v7, v8, "Looking for an organization matching siriLanguageCode: %s, physicalLocationCountryCode: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A69C820](v145, -1, -1);
    MEMORY[0x22A69C820](v11, -1, -1);

    v163(v159, v154);
  }
  else
  {
    long long v15 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
    uint64_t v16 = *(void *)(v0 + 1784);
    uint64_t v17 = *(void *)(v0 + 1712);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    v15(v16, v17);
  }
  unint64_t v18 = *(void *)(v0 + 1872);
  unint64_t v19 = *(void *)(v0 + 1864);
  unint64_t v20 = *(void *)(v0 + 1848);
  unint64_t v21 = *(void *)(v0 + 1840);
  SiriEmergencyIntents::EmergencySituation_optional v22 = *(void **)(v0 + 1832);
  sub_2287A32E0(v22, 0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_2287A3518((uint64_t)v22, v21, v20, v19, v18);
  *(void *)(v0 + 1880) = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2287A32EC((uint64_t)v22, 0);
  *(void *)(v0 + 1608) = v23;
  unint64_t v24 = *(void *)(v23 + 16);
  if (v24 < 2)
  {
    if (v24)
    {
      sub_2287A32EC(*(void *)(v0 + 1832), 0);
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
      uint64_t v47 = *(void *)(v0 + 1800);
      uint64_t v48 = *(void *)(v0 + 1760);
      uint64_t v49 = *(void *)(v0 + 1712);
      swift_beginAccess();
      v46(v48, v47, v49);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_2287A83B0();
      os_log_type_t v51 = sub_2287A84C0();
      BOOL v52 = os_log_type_enabled(v50, v51);
      unint64_t v53 = *(void *)(v0 + 1872);
      if (v52)
      {
        uint64_t v135 = *(void *)(v0 + 1864);
        unint64_t v54 = *(void *)(v0 + 1848);
        os_log_type_t type = v51;
        uint64_t v55 = *(void *)(v0 + 1840);
        uint64_t v146 = *(void *)(v0 + 1760);
        uint64_t v150 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
        uint64_t v142 = *(void *)(v0 + 1712);
        uint64_t v56 = swift_slowAlloc();
        uint64_t v138 = swift_slowAlloc();
        v166[0] = v138;
        *(_DWORD *)uint64_t v56 = 136315394;
        if (v54) {
          uint64_t v57 = v55;
        }
        else {
          uint64_t v57 = 0x3E7974706D653CLL;
        }
        if (v54) {
          unint64_t v58 = v54;
        }
        else {
          unint64_t v58 = 0xE700000000000000;
        }
        swift_bridgeObjectRetain();
        *(void *)(v0 + 1560) = sub_22878DE80(v57, v58, v166);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v56 + 12) = 2080;
        if (v53) {
          uint64_t v59 = v135;
        }
        else {
          uint64_t v59 = 0x3E7974706D653CLL;
        }
        if (v53) {
          unint64_t v60 = v53;
        }
        else {
          unint64_t v60 = 0xE700000000000000;
        }
        swift_bridgeObjectRetain();
        *(void *)(v0 + 1568) = sub_22878DE80(v59, v60, v166);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22878A000, v50, type, "No orgs found matching siriLanguageCode: %s, physicalLocationCountryCode: %s.", (uint8_t *)v56, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A69C820](v138, -1, -1);
        MEMORY[0x22A69C820](v56, -1, -1);

        v150(v146, v142);
      }
      else
      {
        uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
        uint64_t v62 = *(void *)(v0 + 1760);
        uint64_t v63 = *(void *)(v0 + 1712);

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        v61(v62, v63);
      }
      uint64_t v64 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
      uint64_t v65 = *(void *)(v0 + 1800);
      uint64_t v66 = *(void *)(v0 + 1752);
      uint64_t v67 = *(void *)(v0 + 1712);
      uint64_t v151 = sub_2287A7FF0();
      unint64_t v69 = v68;
      swift_beginAccess();
      v64(v66, v65, v67);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v70 = sub_2287A83B0();
      os_log_type_t v71 = sub_2287A84C0();
      BOOL v72 = os_log_type_enabled(v70, v71);
      unint64_t v73 = *(void *)(v0 + 1848);
      if (v72)
      {
        os_log_type_t typea = v71;
        uint64_t v74 = *(void *)(v0 + 1840);
        v156 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
        uint64_t v143 = *(void *)(v0 + 1712);
        uint64_t v147 = *(void *)(v0 + 1752);
        uint64_t v75 = swift_slowAlloc();
        uint64_t v139 = swift_slowAlloc();
        v166[0] = v139;
        *(_DWORD *)uint64_t v75 = 136315394;
        if (v73) {
          uint64_t v76 = v74;
        }
        else {
          uint64_t v76 = 0x3E7974706D653CLL;
        }
        if (v73) {
          unint64_t v77 = v73;
        }
        else {
          unint64_t v77 = 0xE700000000000000;
        }
        swift_bridgeObjectRetain();
        *(void *)(v0 + 1584) = sub_22878DE80(v76, v77, v166);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v75 + 12) = 2080;
        if (v69) {
          uint64_t v78 = v151;
        }
        else {
          uint64_t v78 = 0x3E7974706D653CLL;
        }
        if (v69) {
          unint64_t v79 = v69;
        }
        else {
          unint64_t v79 = 0xE700000000000000;
        }
        swift_bridgeObjectRetain();
        *(void *)(v0 + 1576) = sub_22878DE80(v78, v79, v166);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22878A000, v70, typea, "Falling back to locale search. Looking for an organization matching siriLanguageCode: %s, siriRegionCode: %s.", (uint8_t *)v75, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A69C820](v139, -1, -1);
        MEMORY[0x22A69C820](v75, -1, -1);

        v156(v147, v143);
        unint64_t v80 = v151;
      }
      else
      {
        char v81 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
        uint64_t v82 = *(void *)(v0 + 1752);
        uint64_t v83 = *(void *)(v0 + 1712);
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
        v81(v82, v83);
        unint64_t v80 = v151;
      }
      uint64_t v84 = *(void *)(v0 + 1832);
      uint64_t v85 = sub_2287A3518(v84, *(void *)(v0 + 1840), *(void *)(v0 + 1848), v80, v69);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2287A32EC(v84, 0);
      char v86 = (uint64_t *)(v0 + 1608);
      swift_beginAccess();
      *(void *)(v0 + 1608) = v85;
      swift_bridgeObjectRelease();
      int64_t v87 = *(void *)(v85 + 16);
      uint64_t v23 = MEMORY[0x263F8EE78];
      if (v87)
      {
        v166[0] = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        sub_2287A3154(0, v87, 0);
        uint64_t v88 = 0;
        uint64_t v23 = v166[0];
        unint64_t v89 = *(void *)(v166[0] + 16);
        unint64_t v144 = v89 << 7;
        uint64_t v148 = v85;
        do
        {
          uint64_t v90 = *(void *)(v85 + v88 + 40);
          uint64_t v91 = *(void *)(v85 + v88 + 56);
          uint64_t v152 = *(void *)(v85 + v88 + 48);
          uint64_t v157 = *(void *)(v85 + v88 + 32);
          uint64_t v92 = *(void *)(v85 + v88 + 136);
          uint64_t v162 = *(void *)(v85 + v88 + 128);
          uint64_t v93 = *(void *)(v85 + v88 + 152);
          uint64_t v165 = *(void *)(v85 + v88 + 144);
          v166[0] = v23;
          unint64_t v94 = *(void *)(v23 + 24);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v89 >= v94 >> 1)
          {
            sub_2287A3154(v94 > 1, v89 + 1, 1);
            uint64_t v23 = v166[0];
          }
          *(void *)(v23 + 16) = v89 + 1;
          v95 = (void *)(v23 + v144 + v88);
          v95[4] = v157;
          v95[5] = v90;
          v95[6] = v152;
          v95[7] = v91;
          v95[8] = 0;
          v95[9] = 0xE000000000000000;
          v95[10] = 0;
          v95[11] = 0xE000000000000000;
          v95[12] = 0;
          v95[13] = 0xE000000000000000;
          v95[14] = 0;
          v95[15] = 0xE000000000000000;
          v95[16] = v162;
          v95[17] = v92;
          v88 += 128;
          ++v89;
          v95[18] = v165;
          v95[19] = v93;
          --v87;
          uint64_t v85 = v148;
        }
        while (v87);
        swift_bridgeObjectRelease();
        char v86 = (uint64_t *)(v0 + 1608);
      }
      *char v86 = v23;
    }
    swift_bridgeObjectRelease();
    uint64_t v96 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    uint64_t v97 = *(void *)(v0 + 1800);
    uint64_t v98 = *(void *)(v0 + 1712);
    if (*(void *)(v23 + 16))
    {
      uint64_t v99 = v0 + 288;
      unint64_t v100 = (_OWORD *)(v0 + 952);
      uint64_t v101 = *(void *)(v0 + 1744);
      long long v102 = *(_OWORD *)(v23 + 80);
      long long v104 = *(_OWORD *)(v23 + 32);
      long long v103 = *(_OWORD *)(v23 + 48);
      *(_OWORD *)(v0 + 984) = *(_OWORD *)(v23 + 64);
      *(_OWORD *)(v0 + 1000) = v102;
      *(_OWORD *)(v0 + 952) = v104;
      *(_OWORD *)(v0 + 968) = v103;
      long long v105 = *(_OWORD *)(v23 + 144);
      long long v107 = *(_OWORD *)(v23 + 96);
      long long v106 = *(_OWORD *)(v23 + 112);
      *(_OWORD *)(v0 + 1048) = *(_OWORD *)(v23 + 128);
      *(_OWORD *)(v0 + 1064) = v105;
      *(_OWORD *)(v0 + 1016) = v107;
      *(_OWORD *)(v0 + 1032) = v106;
      swift_beginAccess();
      v96(v101, v97, v98);
      sub_22879CABC(v0 + 952);
      sub_22879CABC(v0 + 952);
      sub_22879CABC(v0 + 952);
      uint64_t v108 = sub_2287A83B0();
      os_log_type_t v109 = sub_2287A84C0();
      BOOL v110 = os_log_type_enabled(v108, v109);
      unint64_t v111 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
      uint64_t v112 = *(void *)(v0 + 1744);
      uint64_t v113 = *(void *)(v0 + 1712);
      if (v110)
      {
        uint64_t v153 = *(void *)(v0 + 1832);
        uint64_t v158 = *(void *)(v0 + 1744);
        BOOL v114 = (uint8_t *)swift_slowAlloc();
        uint64_t v149 = v113;
        uint64_t v115 = swift_slowAlloc();
        *(_DWORD *)BOOL v114 = 136315138;
        v166[0] = v115;
        long long v116 = *(_OWORD *)(v0 + 1032);
        *(_OWORD *)(v0 + 1144) = *(_OWORD *)(v0 + 1016);
        *(_OWORD *)(v0 + 1160) = v116;
        long long v117 = *(_OWORD *)(v0 + 1064);
        *(_OWORD *)(v0 + 1176) = *(_OWORD *)(v0 + 1048);
        *(_OWORD *)(v0 + 1192) = v117;
        long long v118 = *(_OWORD *)(v0 + 968);
        *(_OWORD *)(v0 + 1080) = *v100;
        *(_OWORD *)(v0 + 1096) = v118;
        long long v119 = *(_OWORD *)(v0 + 1000);
        *(_OWORD *)(v0 + 1112) = *(_OWORD *)(v0 + 984);
        *(_OWORD *)(v0 + 1128) = v119;
        sub_22879CABC(v0 + 952);
        uint64_t v120 = sub_2287A8420();
        *(void *)(v0 + 1592) = sub_22878DE80(v120, v121, v166);
        uint64_t v99 = v0 + 288;
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        sub_22879CB54(v0 + 952);
        sub_22879CB54(v0 + 952);
        _os_log_impl(&dword_22878A000, v108, v109, "Found matching organization: %s", v114, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A69C820](v115, -1, -1);
        MEMORY[0x22A69C820](v114, -1, -1);

        sub_2287A32EC(v153, 0);
        v111(v158, v149);
      }
      else
      {
        sub_2287A32EC(*(void *)(v0 + 1832), 0);
        sub_22879CB54(v0 + 952);
        sub_22879CB54(v0 + 952);

        v111(v112, v113);
      }
      swift_bridgeObjectRelease();
      uint64_t v128 = v0 + 152;
      long long v129 = *(_OWORD *)(v0 + 1032);
      *(_OWORD *)(v0 + 760) = *(_OWORD *)(v0 + 1016);
      *(_OWORD *)(v0 + 776) = v129;
      long long v130 = *(_OWORD *)(v0 + 1064);
      *(_OWORD *)(v0 + 792) = *(_OWORD *)(v0 + 1048);
      *(_OWORD *)(v0 + 808) = v130;
      long long v131 = *(_OWORD *)(v0 + 968);
      *(_OWORD *)(v0 + 696) = *v100;
      *(_OWORD *)(v0 + 712) = v131;
      long long v132 = *(_OWORD *)(v0 + 1000);
      *(_OWORD *)(v0 + 728) = *(_OWORD *)(v0 + 984);
      *(_OWORD *)(v0 + 744) = v132;
      nullsub_1(v0 + 696);
      sub_2287A32F8(v0 + 696, v99, &qword_268263108);
      sub_2287A335C(v99);
      uint64_t v133 = v99;
    }
    else
    {
      uint64_t v122 = *(void *)(v0 + 1736);
      swift_beginAccess();
      v96(v122, v97, v98);
      uint64_t v123 = sub_2287A83B0();
      os_log_type_t v124 = sub_2287A84C0();
      BOOL v125 = os_log_type_enabled(v123, v124);
      uint64_t v126 = *(void *)(v0 + 1832);
      if (v125)
      {
        unint64_t v127 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v127 = 0;
        _os_log_impl(&dword_22878A000, v123, v124, "No matching organization found", v127, 2u);
        MEMORY[0x22A69C820](v127, -1, -1);

        sub_2287A32EC(v126, 0);
      }
      else
      {
        sub_2287A32EC(*(void *)(v0 + 1832), 0);
      }
      (*(void (**)(void, void))(v0 + 1824))(*(void *)(v0 + 1736), *(void *)(v0 + 1712));
      swift_bridgeObjectRelease();
      sub_2287A3364((_OWORD *)(v0 + 824));
      sub_2287A32F8(v0 + 824, v0 + 16, &qword_268263108);
      sub_2287A335C(v0 + 16);
      uint64_t v133 = v0 + 16;
      uint64_t v128 = v0 + 152;
    }
    sub_2287A32F8(v133, v128, &qword_268263130);
    sub_2287A32F8(v128, *(void *)(v0 + 1656), &qword_268263130);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v134 = *(uint64_t (**)(void))(v0 + 8);
    return v134();
  }
  else
  {
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    uint64_t v26 = *(void *)(v0 + 1800);
    uint64_t v27 = *(void *)(v0 + 1776);
    uint64_t v28 = *(void *)(v0 + 1712);
    swift_beginAccess();
    v25(v27, v26, v28);
    uint64_t v29 = sub_2287A83B0();
    os_log_type_t v30 = sub_2287A84C0();
    BOOL v31 = os_log_type_enabled(v29, v30);
    unint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
    uint64_t v33 = *(void *)(v0 + 1776);
    uint64_t v34 = *(void *)(v0 + 1712);
    if (v31)
    {
      uint64_t v164 = *(void *)(v0 + 1776);
      uint64_t v160 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
      uint64_t v155 = *(void *)(v0 + 1712);
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v166[0] = v36;
      *(_DWORD *)uint64_t v35 = 136315138;
      swift_beginAccess();
      uint64_t v37 = swift_bridgeObjectRetain();
      uint64_t v38 = MEMORY[0x22A69C2D0](v37, &type metadata for EmergencyOrganizationInfo);
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 1616) = sub_22878DE80(v38, v40, v166);
      sub_2287A84F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22878A000, v29, v30, "Multiple orgs found: [%s]. Refining search by current city.", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v36, -1, -1);
      MEMORY[0x22A69C820](v35, -1, -1);

      v160(v164, v155);
    }
    else
    {

      v32(v33, v34);
    }
    uint64_t v41 = (void *)(*(void *)(v0 + 1664) + *(int *)(v0 + 148));
    uint64_t v42 = v41[3];
    uint64_t v43 = v41[4];
    __swift_project_boxed_opaque_existential_1(v41, v42);
    uint64_t v161 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v43 + 24) + **(int **)(v43 + 24));
    uint64_t v44 = (void *)swift_task_alloc();
    *(void *)(v0 + 1888) = v44;
    void *v44 = v0;
    v44[1] = sub_2287A15C0;
    return v161(v42, v43);
  }
}

uint64_t sub_2287A15C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1896) = a1;
  *(void *)(v3 + 1904) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2287A16C4, 0, 0);
}

uint64_t sub_2287A16C4()
{
  uint64_t v140 = v0;
  unint64_t v1 = *(void *)(v0 + 1904);
  unint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
  uint64_t v3 = *(void *)(v0 + 1800);
  uint64_t v4 = *(void *)(v0 + 1768);
  uint64_t v5 = *(void *)(v0 + 1712);
  swift_beginAccess();
  v2(v4, v3, v5);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_2287A83B0();
  os_log_type_t v7 = sub_2287A84C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(v0 + 1904);
    uint64_t v9 = *(void *)(v0 + 1896);
    uint64_t v136 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
    uint64_t v130 = *(void *)(v0 + 1712);
    uint64_t v133 = *(void *)(v0 + 1768);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v139[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    BOOL v12 = v8 == 0;
    if (v8) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = 0x3E7974706D653CLL;
    }
    if (v12) {
      unint64_t v14 = 0xE700000000000000;
    }
    else {
      unint64_t v14 = v1;
    }
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_22878DE80(v13, v14, v139);
    uint64_t v16 = (uint64_t *)(v0 + 1608);
    *(void *)(v0 + 1600) = v15;
    sub_2287A84F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22878A000, v6, v7, "Fetched current city: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A69C820](v11, -1, -1);
    MEMORY[0x22A69C820](v10, -1, -1);

    v136(v133, v130);
  }
  else
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
    uint64_t v18 = *(void *)(v0 + 1768);
    uint64_t v19 = *(void *)(v0 + 1712);
    swift_bridgeObjectRelease_n();

    v17(v18, v19);
    uint64_t v16 = (uint64_t *)(v0 + 1608);
  }
  unint64_t v20 = *(void *)(v0 + 1904);
  unint64_t v21 = *(void *)(v0 + 1896);
  swift_beginAccess();
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v23 = sub_2287A337C(v22, v21, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 1608) = v23;
  swift_bridgeObjectRelease();
  if (*(void *)(v23 + 16))
  {
    sub_2287A32EC(*(void *)(v0 + 1832), 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v120 = v16;
    unint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    uint64_t v25 = *(void *)(v0 + 1800);
    uint64_t v26 = *(void *)(v0 + 1760);
    uint64_t v27 = *(void *)(v0 + 1712);
    swift_beginAccess();
    v24(v26, v25, v27);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_2287A83B0();
    os_log_type_t v29 = sub_2287A84C0();
    BOOL v30 = os_log_type_enabled(v28, v29);
    unint64_t v31 = *(void *)(v0 + 1872);
    if (v30)
    {
      uint64_t v114 = *(void *)(v0 + 1864);
      os_log_type_t type = v29;
      unint64_t v32 = *(void *)(v0 + 1848);
      uint64_t v33 = *(void *)(v0 + 1840);
      uint64_t v121 = *(void *)(v0 + 1760);
      os_log_type_t v124 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
      uint64_t v119 = *(void *)(v0 + 1712);
      uint64_t v34 = swift_slowAlloc();
      uint64_t v116 = swift_slowAlloc();
      v139[0] = v116;
      *(_DWORD *)uint64_t v34 = 136315394;
      if (v32) {
        uint64_t v35 = v33;
      }
      else {
        uint64_t v35 = 0x3E7974706D653CLL;
      }
      if (v32) {
        unint64_t v36 = v32;
      }
      else {
        unint64_t v36 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1560) = sub_22878DE80(v35, v36, v139);
      sub_2287A84F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 12) = 2080;
      if (v31) {
        uint64_t v37 = v114;
      }
      else {
        uint64_t v37 = 0x3E7974706D653CLL;
      }
      if (v31) {
        unint64_t v38 = v31;
      }
      else {
        unint64_t v38 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1568) = sub_22878DE80(v37, v38, v139);
      sub_2287A84F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22878A000, v28, type, "No orgs found matching siriLanguageCode: %s, physicalLocationCountryCode: %s.", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v116, -1, -1);
      MEMORY[0x22A69C820](v34, -1, -1);

      v124(v121, v119);
    }
    else
    {
      unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
      uint64_t v40 = *(void *)(v0 + 1760);
      uint64_t v41 = *(void *)(v0 + 1712);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v39(v40, v41);
    }
    uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
    uint64_t v43 = *(void *)(v0 + 1800);
    uint64_t v44 = *(void *)(v0 + 1752);
    uint64_t v45 = *(void *)(v0 + 1712);
    uint64_t v46 = sub_2287A7FF0();
    unint64_t v48 = v47;
    swift_beginAccess();
    v42(v44, v43, v45);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v49 = sub_2287A83B0();
    os_log_type_t v50 = sub_2287A84C0();
    BOOL v51 = os_log_type_enabled(v49, v50);
    unint64_t v52 = *(void *)(v0 + 1848);
    if (v51)
    {
      uint64_t v53 = *(void *)(v0 + 1840);
      long long v131 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
      uint64_t v122 = *(void *)(v0 + 1712);
      uint64_t v125 = *(void *)(v0 + 1752);
      uint64_t v117 = v46;
      uint64_t v54 = swift_slowAlloc();
      uint64_t v118 = swift_slowAlloc();
      v139[0] = v118;
      *(_DWORD *)uint64_t v54 = 136315394;
      if (v52) {
        uint64_t v55 = v53;
      }
      else {
        uint64_t v55 = 0x3E7974706D653CLL;
      }
      if (v52) {
        unint64_t v56 = v52;
      }
      else {
        unint64_t v56 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1584) = sub_22878DE80(v55, v56, v139);
      sub_2287A84F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v54 + 12) = 2080;
      if (v48) {
        uint64_t v57 = v117;
      }
      else {
        uint64_t v57 = 0x3E7974706D653CLL;
      }
      if (v48) {
        unint64_t v58 = v48;
      }
      else {
        unint64_t v58 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1576) = sub_22878DE80(v57, v58, v139);
      sub_2287A84F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22878A000, v49, v50, "Falling back to locale search. Looking for an organization matching siriLanguageCode: %s, siriRegionCode: %s.", (uint8_t *)v54, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v118, -1, -1);
      MEMORY[0x22A69C820](v54, -1, -1);

      v131(v125, v122);
      unint64_t v59 = v117;
    }
    else
    {
      unint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
      uint64_t v61 = *(void *)(v0 + 1752);
      uint64_t v62 = *(void *)(v0 + 1712);
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease_n();
      v60(v61, v62);
      unint64_t v59 = v46;
    }
    uint64_t v63 = *(void *)(v0 + 1832);
    uint64_t v64 = sub_2287A3518(v63, *(void *)(v0 + 1840), *(void *)(v0 + 1848), v59, v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2287A32EC(v63, 0);
    uint64_t v65 = v120;
    swift_beginAccess();
    *(void *)(v0 + 1608) = v64;
    swift_bridgeObjectRelease();
    int64_t v66 = *(void *)(v64 + 16);
    uint64_t v23 = MEMORY[0x263F8EE78];
    if (v66)
    {
      v139[0] = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_2287A3154(0, v66, 0);
      uint64_t v67 = 0;
      uint64_t v23 = v139[0];
      unint64_t v68 = *(void *)(v139[0] + 16);
      unint64_t v123 = v68 << 7;
      uint64_t v126 = v64;
      do
      {
        uint64_t v69 = *(void *)(v64 + v67 + 40);
        uint64_t v70 = *(void *)(v64 + v67 + 56);
        uint64_t v128 = *(void *)(v64 + v67 + 48);
        uint64_t v132 = *(void *)(v64 + v67 + 32);
        uint64_t v71 = *(void *)(v64 + v67 + 136);
        uint64_t v134 = *(void *)(v64 + v67 + 128);
        uint64_t v72 = *(void *)(v64 + v67 + 152);
        uint64_t v137 = *(void *)(v64 + v67 + 144);
        v139[0] = v23;
        unint64_t v73 = *(void *)(v23 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v68 >= v73 >> 1)
        {
          sub_2287A3154(v73 > 1, v68 + 1, 1);
          uint64_t v23 = v139[0];
        }
        *(void *)(v23 + 16) = v68 + 1;
        uint64_t v74 = (void *)(v23 + v123 + v67);
        v74[4] = v132;
        v74[5] = v69;
        v74[6] = v128;
        v74[7] = v70;
        v74[8] = 0;
        v74[9] = 0xE000000000000000;
        v74[10] = 0;
        v74[11] = 0xE000000000000000;
        v74[12] = 0;
        v74[13] = 0xE000000000000000;
        v74[14] = 0;
        v74[15] = 0xE000000000000000;
        v74[16] = v134;
        v74[17] = v71;
        v67 += 128;
        ++v68;
        v74[18] = v137;
        v74[19] = v72;
        --v66;
        uint64_t v64 = v126;
      }
      while (v66);
      swift_bridgeObjectRelease();
      uint64_t v65 = v120;
    }
    *uint64_t v65 = v23;
  }
  swift_bridgeObjectRelease();
  uint64_t v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1808);
  uint64_t v76 = *(void *)(v0 + 1800);
  uint64_t v77 = *(void *)(v0 + 1712);
  if (*(void *)(v23 + 16))
  {
    uint64_t v138 = v0 + 288;
    uint64_t v78 = (_OWORD *)(v0 + 952);
    uint64_t v79 = *(void *)(v0 + 1744);
    long long v80 = *(_OWORD *)(v23 + 80);
    long long v82 = *(_OWORD *)(v23 + 32);
    long long v81 = *(_OWORD *)(v23 + 48);
    *(_OWORD *)(v0 + 984) = *(_OWORD *)(v23 + 64);
    *(_OWORD *)(v0 + 1000) = v80;
    *(_OWORD *)(v0 + 952) = v82;
    *(_OWORD *)(v0 + 968) = v81;
    long long v83 = *(_OWORD *)(v23 + 144);
    long long v85 = *(_OWORD *)(v23 + 96);
    long long v84 = *(_OWORD *)(v23 + 112);
    *(_OWORD *)(v0 + 1048) = *(_OWORD *)(v23 + 128);
    *(_OWORD *)(v0 + 1064) = v83;
    *(_OWORD *)(v0 + 1016) = v85;
    *(_OWORD *)(v0 + 1032) = v84;
    swift_beginAccess();
    v75(v79, v76, v77);
    sub_22879CABC(v0 + 952);
    sub_22879CABC(v0 + 952);
    sub_22879CABC(v0 + 952);
    char v86 = sub_2287A83B0();
    os_log_type_t v87 = sub_2287A84C0();
    BOOL v88 = os_log_type_enabled(v86, v87);
    unint64_t v89 = *(void (**)(uint64_t, uint64_t))(v0 + 1824);
    uint64_t v90 = *(void *)(v0 + 1744);
    uint64_t v91 = *(void *)(v0 + 1712);
    if (v88)
    {
      uint64_t v135 = *(void *)(v0 + 1712);
      uint64_t v129 = *(void *)(v0 + 1832);
      uint64_t v92 = (uint8_t *)swift_slowAlloc();
      unint64_t v127 = v89;
      uint64_t v93 = swift_slowAlloc();
      *(_DWORD *)uint64_t v92 = 136315138;
      v139[0] = v93;
      long long v94 = *(_OWORD *)(v0 + 1032);
      *(_OWORD *)(v0 + 1144) = *(_OWORD *)(v0 + 1016);
      *(_OWORD *)(v0 + 1160) = v94;
      long long v95 = *(_OWORD *)(v0 + 1064);
      *(_OWORD *)(v0 + 1176) = *(_OWORD *)(v0 + 1048);
      *(_OWORD *)(v0 + 1192) = v95;
      long long v96 = *(_OWORD *)(v0 + 968);
      *(_OWORD *)(v0 + 1080) = *v78;
      *(_OWORD *)(v0 + 1096) = v96;
      long long v97 = *(_OWORD *)(v0 + 1000);
      *(_OWORD *)(v0 + 1112) = *(_OWORD *)(v0 + 984);
      *(_OWORD *)(v0 + 1128) = v97;
      sub_22879CABC(v0 + 952);
      uint64_t v98 = sub_2287A8420();
      *(void *)(v0 + 1592) = sub_22878DE80(v98, v99, v139);
      sub_2287A84F0();
      swift_bridgeObjectRelease();
      sub_22879CB54(v0 + 952);
      sub_22879CB54(v0 + 952);
      _os_log_impl(&dword_22878A000, v86, v87, "Found matching organization: %s", v92, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A69C820](v93, -1, -1);
      MEMORY[0x22A69C820](v92, -1, -1);

      sub_2287A32EC(v129, 0);
      v127(v90, v135);
    }
    else
    {
      sub_2287A32EC(*(void *)(v0 + 1832), 0);
      sub_22879CB54(v0 + 952);
      sub_22879CB54(v0 + 952);

      v89(v90, v91);
    }
    swift_bridgeObjectRelease();
    uint64_t v106 = v0 + 152;
    long long v107 = *(_OWORD *)(v0 + 1032);
    *(_OWORD *)(v0 + 760) = *(_OWORD *)(v0 + 1016);
    *(_OWORD *)(v0 + 776) = v107;
    long long v108 = *(_OWORD *)(v0 + 1064);
    *(_OWORD *)(v0 + 792) = *(_OWORD *)(v0 + 1048);
    *(_OWORD *)(v0 + 808) = v108;
    long long v109 = *(_OWORD *)(v0 + 968);
    *(_OWORD *)(v0 + 696) = *v78;
    *(_OWORD *)(v0 + 712) = v109;
    long long v110 = *(_OWORD *)(v0 + 1000);
    *(_OWORD *)(v0 + 728) = *(_OWORD *)(v0 + 984);
    *(_OWORD *)(v0 + 744) = v110;
    nullsub_1(v0 + 696);
    sub_2287A32F8(v0 + 696, v138, &qword_268263108);
    sub_2287A335C(v138);
    uint64_t v111 = v0 + 288;
  }
  else
  {
    uint64_t v100 = *(void *)(v0 + 1736);
    swift_beginAccess();
    v75(v100, v76, v77);
    uint64_t v101 = sub_2287A83B0();
    os_log_type_t v102 = sub_2287A84C0();
    BOOL v103 = os_log_type_enabled(v101, v102);
    uint64_t v104 = *(void *)(v0 + 1832);
    if (v103)
    {
      long long v105 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v105 = 0;
      _os_log_impl(&dword_22878A000, v101, v102, "No matching organization found", v105, 2u);
      MEMORY[0x22A69C820](v105, -1, -1);

      sub_2287A32EC(v104, 0);
    }
    else
    {
      sub_2287A32EC(*(void *)(v0 + 1832), 0);
    }
    (*(void (**)(void, void))(v0 + 1824))(*(void *)(v0 + 1736), *(void *)(v0 + 1712));
    swift_bridgeObjectRelease();
    sub_2287A3364((_OWORD *)(v0 + 824));
    sub_2287A32F8(v0 + 824, v0 + 16, &qword_268263108);
    sub_2287A335C(v0 + 16);
    uint64_t v111 = v0 + 16;
    uint64_t v106 = v0 + 152;
  }
  sub_2287A32F8(v111, v106, &qword_268263130);
  sub_2287A32F8(v106, *(void *)(v0 + 1656), &qword_268263130);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v112 = *(uint64_t (**)(void))(v0 + 8);
  return v112();
}

SiriEmergencyIntents::EmergencySituation_optional __swiftcall inferUsableSituation(situation:organization:)(SiriEmergencyIntents::EmergencySituation_optional situation, SiriEmergencyIntents::EmergencyOrganization_optional organization)
{
  uint64_t v4 = sub_2287A83C0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v37 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v37 - v12;
  switch(situation.value)
  {
    case SiriEmergencyIntents_EmergencySituation_abuse:
      uint64_t v30 = sub_2287A83A0();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v30, v4);
      unint64_t v31 = sub_2287A83B0();
      os_log_type_t v32 = sub_2287A84C0();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v39 = v34;
        uint64_t v37 = v4;
        *(_DWORD *)uint64_t v33 = 136315138;
        LOBYTE(v38) = 11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268263040);
        uint64_t v35 = sub_2287A84E0();
        uint64_t v38 = sub_22878DE80(v35, v36, &v39);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        swift_arrayDestroy();
        MEMORY[0x22A69C820](v34, -1, -1);
        MEMORY[0x22A69C820](v33, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      }
      situation.SiriEmergencyIntents::EmergencySituation value = SiriEmergencyIntents_EmergencySituation_domesticViolence;
      break;
    case SiriEmergencyIntents_EmergencySituation_assault:
      uint64_t v23 = sub_2287A83A0();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v23, v4);
      unint64_t v24 = sub_2287A83B0();
      os_log_type_t v25 = sub_2287A84C0();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v39 = v27;
        uint64_t v37 = v4;
        *(_DWORD *)uint64_t v26 = 136315138;
        LOBYTE(v38) = 13;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268263040);
        uint64_t v28 = sub_2287A84E0();
        uint64_t v38 = sub_22878DE80(v28, v29, &v39);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        situation.SiriEmergencyIntents::EmergencySituation value = SiriEmergencyIntents_EmergencySituation_sexualAssault;
        swift_arrayDestroy();
        MEMORY[0x22A69C820](v27, -1, -1);
        MEMORY[0x22A69C820](v26, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
        situation.SiriEmergencyIntents::EmergencySituation value = SiriEmergencyIntents_EmergencySituation_sexualAssault;
      }
      break;
    case SiriEmergencyIntents_EmergencySituation_overdose:
    case SiriEmergencyIntents_EmergencySituation_selfHarm:
    case SiriEmergencyIntents_EmergencySituation_substanceAbuse:
    case SiriEmergencyIntents_EmergencySituation_suicide:
      uint64_t v14 = sub_2287A83A0();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v14, v4);
      uint64_t v15 = sub_2287A83B0();
      os_log_type_t v16 = sub_2287A84C0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v37 = v4;
        uint64_t v19 = v18;
        uint64_t v39 = v18;
        *(_DWORD *)uint64_t v17 = 136315138;
        LOBYTE(v38) = situation;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268263040);
        uint64_t v20 = sub_2287A84E0();
        uint64_t v38 = sub_22878DE80(v20, v21, &v39);
        sub_2287A84F0();
        swift_bridgeObjectRelease();
        swift_arrayDestroy();
        MEMORY[0x22A69C820](v19, -1, -1);
        MEMORY[0x22A69C820](v17, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v37);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      }
      situation.SiriEmergencyIntents::EmergencySituation value = SiriEmergencyIntents_EmergencySituation_suicidePrevention;
      break;
    case SiriEmergencyIntents_EmergencySituation_unknownDefault:
      if (organization.value == SiriEmergencyIntents_EmergencyOrganization_unknownDefault) {
        situation.SiriEmergencyIntents::EmergencySituation value = SiriEmergencyIntents_EmergencySituation_unknownDefault;
      }
      else {
        situation.SiriEmergencyIntents::EmergencySituation value = organization.value;
      }
      break;
    default:
      return situation;
  }
  return situation;
}

BOOL static EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError.hash(into:)()
{
  return sub_2287A8660();
}

uint64_t EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError.hashValue.getter()
{
  return sub_2287A8670();
}

BOOL sub_2287A2BCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2287A2BF4(uint64_t a1, char a2, char a3)
{
  *(void *)(v3 + 152) = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 160) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_2287A2CA8;
  return EmergencyOrganizationInfoProvider.getOrganizationInfo(situation:organization:)(v3 + 16, a2, a3);
}

uint64_t sub_2287A2CA8()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v2 = *(void *)(*v0 + 152);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  sub_2287A32F8(v1, v2, &qword_268263130);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

unint64_t sub_2287A2DC8()
{
  unint64_t result = qword_268263128;
  if (!qword_268263128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263128);
  }
  return result;
}

uint64_t sub_2287A2E1C(uint64_t result)
{
  *(unsigned char *)(result + 128) = 1;
  return result;
}

uint64_t sub_2287A2E28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EmergencyOrganizationInfoProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287A2E8C()
{
  uint64_t v1 = (int *)(type metadata accessor for EmergencyOrganizationInfoProvider() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_2287A8010();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  __swift_destroy_boxed_opaque_existential_0(v0 + v3 + v1[7]);
  if (*(void *)(v0 + v3 + v1[8])) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2287A2F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EmergencyOrganizationInfoProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2287A2FF0(uint64_t a1, unint64_t a2)
{
  return sub_22879EEF4(a1, a2);
}

uint64_t sub_2287A3068(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EmergencyOrganizationInfoProvider();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2287A30C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_2287A3100()
{
  unint64_t result = qword_268263138;
  if (!qword_268263138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263138);
  }
  return result;
}

uint64_t sub_2287A3154(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2287A3174(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2287A3174(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268263160);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 95;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 7);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[128 * v8]) {
      memmove(v13, v14, v8 << 7);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[128 * v8] || v13 >= &v14[128 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2287A85A0();
  __break(1u);
  return result;
}

id sub_2287A32E0(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t sub_2287A32EC(uint64_t a1, char a2)
{
  if (a2) {
    JUMPOUT(0x22A69C720);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2287A32F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2287A335C(uint64_t result)
{
  *(unsigned char *)(result + 128) = 0;
  return result;
}

double sub_2287A3364(_OWORD *a1)
{
  double result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_2287A337C(uint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = *(void *)(result + 16);
  if (!v3) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v6 = 0;
  uint64_t v7 = result + 32;
  uint64_t v8 = MEMORY[0x263F8EE78];
  do
  {
    if (v6 <= v3) {
      unint64_t v9 = v3;
    }
    else {
      unint64_t v9 = v6;
    }
    uint64_t v10 = (long long *)(v7 + (v6 << 7));
    unint64_t v11 = v6;
    while (1)
    {
      if (v9 == v11)
      {
        __break(1u);
        return result;
      }
      long long v12 = v10[5];
      long long v29 = v10[4];
      long long v30 = v12;
      long long v13 = v10[7];
      long long v31 = v10[6];
      long long v32 = v13;
      long long v14 = v10[1];
      long long v25 = *v10;
      long long v26 = v14;
      long long v15 = v10[3];
      long long v27 = v10[2];
      long long v28 = v15;
      if (a3)
      {
        if (v27 == __PAIR128__(a3, a2)) {
          break;
        }
        double result = sub_2287A85F0();
        if (result) {
          break;
        }
      }
      ++v11;
      v10 += 8;
      if (v3 == v11) {
        return v8;
      }
    }
    sub_22879CABC((uint64_t)&v25);
    double result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = v8;
    if ((result & 1) == 0)
    {
      double result = sub_2287A3154(0, *(void *)(v8 + 16) + 1, 1);
      uint64_t v8 = v33;
    }
    unint64_t v17 = *(void *)(v8 + 16);
    unint64_t v16 = *(void *)(v8 + 24);
    if (v17 >= v16 >> 1)
    {
      double result = sub_2287A3154(v16 > 1, v17 + 1, 1);
      uint64_t v8 = v33;
    }
    unint64_t v6 = v11 + 1;
    *(void *)(v8 + 16) = v17 + 1;
    uint64_t v18 = (_OWORD *)(v8 + (v17 << 7));
    long long v19 = v25;
    long long v20 = v26;
    long long v21 = v28;
    v18[4] = v27;
    v18[5] = v21;
    v18[2] = v19;
    v18[3] = v20;
    long long v22 = v29;
    long long v23 = v30;
    long long v24 = v32;
    v18[8] = v31;
    v18[9] = v24;
    v18[6] = v22;
    v18[7] = v23;
  }
  while (v3 - 1 != v11);
  return v8;
}

uint64_t sub_2287A3518(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v5 = *(void *)(result + 16);
  if (!v5) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v10 = 0;
  uint64_t v11 = result + 32;
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v29 = result + 32;
  do
  {
    if (v10 <= v5) {
      unint64_t v13 = v5;
    }
    else {
      unint64_t v13 = v10;
    }
    long long v14 = (long long *)(v11 + (v10 << 7));
    unint64_t v15 = v10;
    while (1)
    {
      if (v13 == v15)
      {
        __break(1u);
        return result;
      }
      long long v16 = v14[5];
      long long v34 = v14[4];
      long long v35 = v16;
      long long v17 = v14[7];
      long long v36 = v14[6];
      long long v37 = v17;
      long long v18 = v14[1];
      long long v30 = *v14;
      long long v31 = v18;
      long long v19 = v14[3];
      long long v32 = v14[2];
      long long v33 = v19;
      if (a3)
      {
        double result = v31;
        if (v31 == __PAIR128__(a3, a2) || (double result = sub_2287A85F0(), (result & 1) != 0))
        {
          if (a5)
          {
            if (v30 == __PAIR128__(a5, a4)) {
              break;
            }
            double result = sub_2287A85F0();
            if (result) {
              break;
            }
          }
        }
      }
      ++v15;
      v14 += 8;
      if (v5 == v15) {
        return v12;
      }
    }
    sub_22879CABC((uint64_t)&v30);
    double result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = v12;
    if ((result & 1) == 0)
    {
      double result = sub_2287A3154(0, *(void *)(v12 + 16) + 1, 1);
      uint64_t v12 = v38;
    }
    unint64_t v21 = *(void *)(v12 + 16);
    unint64_t v20 = *(void *)(v12 + 24);
    if (v21 >= v20 >> 1)
    {
      double result = sub_2287A3154(v20 > 1, v21 + 1, 1);
      uint64_t v12 = v38;
    }
    unint64_t v10 = v15 + 1;
    *(void *)(v12 + 16) = v21 + 1;
    long long v22 = (_OWORD *)(v12 + (v21 << 7));
    long long v23 = v30;
    long long v24 = v31;
    long long v25 = v33;
    v22[4] = v32;
    v22[5] = v25;
    v22[2] = v23;
    v22[3] = v24;
    long long v26 = v34;
    long long v27 = v35;
    long long v28 = v37;
    v22[8] = v36;
    v22[9] = v28;
    v22[6] = v26;
    v22[7] = v27;
    uint64_t v11 = v29;
  }
  while (v5 - 1 != v15);
  return v12;
}

uint64_t sub_2287A36F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v2 + 16))(*a1, a1[1]);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v5 & 1;
  return result;
}

unint64_t sub_2287A3734()
{
  unint64_t result = qword_268263140;
  if (!qword_268263140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263140);
  }
  return result;
}

uint64_t type metadata accessor for BundleHelper()
{
  return self;
}

uint64_t *initializeBufferWithCopyOfBuffer for EmergencyOrganizationInfoProvider(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2287A8010();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    if (*v12)
    {
      uint64_t v13 = v12[1];
      void *v11 = *v12;
      v11[1] = v13;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    }
  }
  return a1;
}

uint64_t destroy for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2287A8010();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0(a1 + *(int *)(a2 + 20));
  if (*(void *)(a1 + *(int *)(a2 + 24)))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287A8010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  if (*v11)
  {
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  }
  return a1;
}

uint64_t assignWithCopy for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287A8010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  uint64_t v7 = *(int *)(a3 + 24);
  long long v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a1 + v7);
  uint64_t v11 = *(void *)(a2 + v7);
  if (!v10)
  {
    if (v11)
    {
      uint64_t v13 = *(void *)(v9 + 8);
      *long long v8 = v11;
      v8[1] = v13;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)long long v8 = *(_OWORD *)v9;
    return a1;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v12 = *(void *)(v9 + 8);
  *long long v8 = v11;
  v8[1] = v12;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *unint64_t v3 = v12;
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
          *uint64_t result = *a2;
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
          *unint64_t v3 = *a2;
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

uint64_t initializeWithTake for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287A8010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (uint64_t *)(a2 + v8);
  uint64_t v14 = *v13;
  if (*v13)
  {
    uint64_t v15 = v13[1];
    *uint64_t v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  return a1;
}

uint64_t assignWithTake for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287A8010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_0(a1 + v7);
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *(void *)(a1 + v11);
  uint64_t v15 = *v13;
  if (!v14)
  {
    if (v15)
    {
      uint64_t v17 = v13[1];
      *uint64_t v12 = v15;
      v12[1] = v17;
      return a1;
    }
LABEL_7:
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    return a1;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v16 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v16;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2287A3F30);
}

uint64_t sub_2287A3F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2287A8010();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for EmergencyOrganizationInfoProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2287A4008);
}

uint64_t sub_2287A4008(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2287A8010();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  return result;
}

uint64_t sub_2287A40C8()
{
  uint64_t result = sub_2287A8010();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2287A4234);
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

ValueMetadata *type metadata accessor for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError()
{
  return &type metadata for EmergencyOrganizationInfoProvider.EmergencyPropertyListReaderError;
}

unint64_t sub_2287A426C()
{
  unint64_t result = qword_268263170;
  if (!qword_268263170)
  {
    sub_2287A7FD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263170);
  }
  return result;
}

unint64_t sub_2287A42C4()
{
  unint64_t result = qword_268263188;
  if (!qword_268263188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268263180);
    sub_2287A4380();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263188);
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

unint64_t sub_2287A4380()
{
  unint64_t result = qword_268263190;
  if (!qword_268263190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263190);
  }
  return result;
}

uint64_t sub_2287A43D4(uint64_t a1, unint64_t a2)
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

unint64_t EmergencySituation.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x61206C6175786573;
      break;
    case 2:
      unint64_t result = 0x63206E6F73696F70;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 6:
      unint64_t result = 0x7078655F6D617363;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
    case 22:
    case 25:
      unint64_t result = 0xD000000000000010;
      break;
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 10:
      unint64_t result = 0x6E65726973;
      break;
    case 11:
      unint64_t result = 0x6573756261;
      break;
    case 12:
      unint64_t result = 0x6853657669746361;
      break;
    case 13:
      unint64_t result = 0x746C7561737361;
      break;
    case 14:
      unint64_t result = 0x676E69796C6C7562;
      break;
    case 15:
      unint64_t result = 0x6469636341726163;
      break;
    case 16:
      unint64_t result = 0x7553736973697263;
      break;
    case 17:
      unint64_t result = 0x7265676E6164;
      break;
    case 18:
      unint64_t result = 0x676E697964;
      break;
    case 19:
      unint64_t result = 0x6944676E69746165;
      break;
    case 20:
      unint64_t result = 1701996902;
      break;
    case 21:
      unint64_t result = 0x75617373416E7567;
      break;
    case 23:
      unint64_t result = 1886152040;
      break;
    case 24:
      unint64_t result = 0x697070616E64696BLL;
      break;
    case 26:
      unint64_t result = 0xD000000000000015;
      break;
    case 27:
      unint64_t result = 0x65736F647265766FLL;
      break;
    case 28:
      unint64_t result = 0x6D726148666C6573;
      break;
    case 29:
      unint64_t result = 0x676E696B6C617473;
      break;
    case 30:
      unint64_t result = 0x636E617473627573;
      break;
    case 31:
      unint64_t result = 0x65646963697573;
      break;
    case 32:
      unint64_t result = 0x7369726F72726574;
      break;
    case 33:
      unint64_t result = 0x65636E656C6F6976;
      break;
    case 34:
      unint64_t result = 0x636E656772656D65;
      break;
    default:
      return result;
  }
  return result;
}

BOOL EmergencySituation.isCSAM.getter(unsigned __int8 a1)
{
  return a1 - 6 < 4;
}

uint64_t static EmergencySituation.fromValueWithCleanup(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2287A7F70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(a1, a2);
  if (v8 != 35) {
    return v8;
  }
  long long v74 = xmmword_2287A9E40;
  uint64_t v72 = a1;
  uint64_t v73 = a2;
  sub_2287A7F60();
  sub_2287A3100();
  uint64_t v9 = sub_2287A8520();
  uint64_t v11 = v10;
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v7, v4);
  uint64_t v75 = v9;
  uint64_t v76 = v11;
  uint64_t v72 = a1;
  uint64_t v73 = a2;
  sub_2287A7F60();
  uint64_t v13 = sub_2287A8520();
  uint64_t v15 = v14;
  v12(v7, v4);
  uint64_t v67 = v12;
  uint64_t v72 = v13;
  uint64_t v73 = v15;
  uint64_t v70 = 32;
  unint64_t v71 = 0xE100000000000000;
  uint64_t v68 = 0;
  unint64_t v69 = 0xE000000000000000;
  uint64_t v16 = sub_2287A8530();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v77 = v16;
  uint64_t v78 = v18;
  uint64_t v79 = sub_2287A8430();
  uint64_t v80 = v19;
  uint64_t v72 = a1;
  uint64_t v73 = a2;
  sub_2287A7F60();
  sub_2287A8520();
  v12(v7, v4);
  uint64_t v20 = sub_2287A8430();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  uint64_t v81 = v20;
  uint64_t v82 = v22;
  uint64_t v83 = sub_2287A8440();
  uint64_t v84 = v23;
  uint64_t v72 = a1;
  uint64_t v73 = a2;
  sub_2287A8510();
  uint64_t v24 = sub_2287A8440();
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v85 = v24;
  uint64_t v86 = v26;
  uint64_t v72 = a1;
  uint64_t v73 = a2;
  sub_2287A8510();
  uint64_t v27 = sub_2287A8440();
  uint64_t v29 = v28;
  swift_bridgeObjectRelease();
  uint64_t v72 = v27;
  uint64_t v73 = v29;
  sub_2287A7F60();
  uint64_t v30 = sub_2287A8520();
  uint64_t v32 = v31;
  uint64_t v33 = v4;
  uint64_t v66 = v4;
  long long v34 = v67;
  v67(v7, v33);
  swift_bridgeObjectRelease();
  uint64_t v72 = v30;
  uint64_t v73 = v32;
  uint64_t v70 = 32;
  unint64_t v71 = 0xE100000000000000;
  uint64_t v68 = 0;
  unint64_t v69 = 0xE000000000000000;
  uint64_t v35 = sub_2287A8530();
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();
  uint64_t v87 = v35;
  uint64_t v88 = v37;
  uint64_t v72 = a1;
  uint64_t v73 = a2;
  sub_2287A7F60();
  uint64_t v38 = sub_2287A8520();
  uint64_t v40 = v39;
  v34(v7, v66);
  uint64_t v72 = v38;
  uint64_t v73 = v40;
  uint64_t v70 = 32;
  unint64_t v71 = 0xE100000000000000;
  uint64_t v68 = 0;
  unint64_t v69 = 0xE000000000000000;
  uint64_t v41 = sub_2287A8530();
  uint64_t v43 = v42;
  swift_bridgeObjectRelease();
  uint64_t v72 = v41;
  uint64_t v73 = v43;
  sub_2287A8510();
  swift_bridgeObjectRelease();
  uint64_t v44 = sub_2287A8440();
  uint64_t v46 = v45;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v89 = v44;
  uint64_t v90 = v46;
  uint64_t v48 = v74;
  if ((void)v74)
  {
    uint64_t v49 = v75;
    uint64_t v50 = v76;
    swift_bridgeObjectRetain();
    uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v49, v50);
    uint64_t result = swift_bridgeObjectRelease();
    if (v8 != 35) {
      goto LABEL_19;
    }
    if (v48 != 1)
    {
      uint64_t v51 = v77;
      uint64_t v52 = v78;
      swift_bridgeObjectRetain();
      uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v51, v52);
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 != 35) {
        goto LABEL_19;
      }
      if (v48 != 2)
      {
        uint64_t v53 = v79;
        uint64_t v54 = v80;
        swift_bridgeObjectRetain();
        uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v53, v54);
        uint64_t result = swift_bridgeObjectRelease();
        if (v8 != 35) {
          goto LABEL_19;
        }
        if (v48 != 3)
        {
          uint64_t v55 = v81;
          uint64_t v56 = v82;
          swift_bridgeObjectRetain();
          uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v55, v56);
          uint64_t result = swift_bridgeObjectRelease();
          if (v8 != 35) {
            goto LABEL_19;
          }
          if (v48 != 4)
          {
            uint64_t v57 = v83;
            uint64_t v58 = v84;
            swift_bridgeObjectRetain();
            uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v57, v58);
            uint64_t result = swift_bridgeObjectRelease();
            if (v8 != 35) {
              goto LABEL_19;
            }
            if (v48 != 5)
            {
              uint64_t v59 = v85;
              uint64_t v60 = v86;
              swift_bridgeObjectRetain();
              uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v59, v60);
              uint64_t result = swift_bridgeObjectRelease();
              if (v8 != 35) {
                goto LABEL_19;
              }
              if (v48 != 6)
              {
                uint64_t v61 = v87;
                uint64_t v62 = v88;
                swift_bridgeObjectRetain();
                uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v61, v62);
                uint64_t result = swift_bridgeObjectRelease();
                if (v8 != 35) {
                  goto LABEL_19;
                }
                if (v48 != 7)
                {
                  uint64_t v63 = v89;
                  uint64_t v64 = v90;
                  swift_bridgeObjectRetain();
                  uint64_t v8 = _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(v63, v64);
                  swift_bridgeObjectRelease();
                  if (v8 == 35)
                  {
                    swift_arrayDestroy();
                    return 35;
                  }
LABEL_19:
                  swift_arrayDestroy();
                  return v8;
                }
              }
            }
          }
        }
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2287A4F7C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = EmergencySituation.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == EmergencySituation.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2287A85F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2287A5008()
{
  char v1 = *v0;
  sub_2287A8650();
  EmergencySituation.rawValue.getter(v1);
  sub_2287A8470();
  swift_bridgeObjectRelease();
  return sub_2287A8670();
}

uint64_t sub_2287A506C()
{
  EmergencySituation.rawValue.getter(*v0);
  sub_2287A8470();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2287A50C0()
{
  char v1 = *v0;
  sub_2287A8650();
  EmergencySituation.rawValue.getter(v1);
  sub_2287A8470();
  swift_bridgeObjectRelease();
  return sub_2287A8670();
}

uint64_t sub_2287A5120@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s20SiriEmergencyIntents0B9SituationO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_2287A5150@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = EmergencySituation.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s20SiriEmergencyIntents0B9SituationO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2287A8600();
  swift_bridgeObjectRelease();
  if (v0 >= 0x23) {
    return 35;
  }
  else {
    return v0;
  }
}

uint64_t _s20SiriEmergencyIntents0B9SituationO4from15identifierValueACSgSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x80000002287AA930) {
    return 0;
  }
  char v5 = sub_2287A85F0();
  uint64_t result = 0;
  if ((v5 & 1) == 0)
  {
    if (a1 == 0xD000000000000011 && a2 == 0x80000002287AAF20) {
      return 0;
    }
    char v6 = sub_2287A85F0();
    uint64_t result = 0;
    if ((v6 & 1) == 0)
    {
      if (a1 == 0x61206C6175786573 && a2 == 0xEE00746C75617373
        || (sub_2287A85F0() & 1) != 0
        || a1 == 0x73416C6175786573 && a2 == 0xED0000746C756173
        || (sub_2287A85F0() & 1) != 0)
      {
        return 1;
      }
      if (a1 == 0x63206E6F73696F70 && a2 == 0xEE006C6F72746E6FLL
        || (sub_2287A85F0() & 1) != 0
        || a1 == 0x6F436E6F73696F70 && a2 == 0xED00006C6F72746ELL
        || (sub_2287A85F0() & 1) != 0)
      {
        return 2;
      }
      if (a1 == 0xD000000000000011 && a2 == 0x80000002287AA970
        || (sub_2287A85F0() & 1) != 0
        || a1 == 0xD000000000000010 && a2 == 0x80000002287AAF40
        || (sub_2287A85F0() & 1) != 0)
      {
        return 3;
      }
      if (a1 == 0xD00000000000001BLL && a2 == 0x80000002287AA990
        || (sub_2287A85F0() & 1) != 0
        || a1 == 0xD000000000000018 && a2 == 0x80000002287AAF60
        || (sub_2287A85F0() & 1) != 0)
      {
        return 4;
      }
      if (a1 == 0xD00000000000001ALL && a2 == 0x80000002287AA9B0
        || (sub_2287A85F0() & 1) != 0
        || a1 == 0xD000000000000017 && a2 == 0x80000002287AAF80
        || (sub_2287A85F0() & 1) != 0)
      {
        return 5;
      }
      if (a1 == 0x7078655F6D617363 && a2 == 0xED0000746963696CLL
        || (sub_2287A85F0() & 1) != 0
        || a1 == 0x6C7078456D617363 && a2 == 0xEC00000074696369
        || (sub_2287A85F0() & 1) != 0)
      {
        return 6;
      }
      if (a1 == 0xD000000000000013 && a2 == 0x80000002287AA9E0) {
        return 7;
      }
      char v7 = sub_2287A85F0();
      BOOL v8 = a1 == 0xD000000000000010 && a2 == 0x80000002287AAFA0;
      BOOL v9 = v8;
      uint64_t result = 7;
      if ((v7 & 1) == 0 && !v9)
      {
        if (sub_2287A85F0()) {
          return 7;
        }
        if (a1 == 0xD000000000000010 && a2 == 0x80000002287AAA00
          || (sub_2287A85F0() & 1) != 0
          || a1 == 0x706C65486D617363 && a2 == 0xEE006D6974636956
          || (sub_2287A85F0() & 1) != 0)
        {
          return 8;
        }
        if (a1 == 0xD000000000000011 && a2 == 0x80000002287AAA20) {
          return 9;
        }
        char v10 = sub_2287A85F0();
        BOOL v11 = a1 == 0xD000000000000012 && a2 == 0x80000002287AAFC0;
        BOOL v12 = v11;
        uint64_t result = 9;
        if ((v10 & 1) == 0 && !v12)
        {
          if (sub_2287A85F0()) {
            return 9;
          }
          if (a1 == 0x6E65726973 && a2 == 0xE500000000000000) {
            return 10;
          }
          char v13 = sub_2287A85F0();
          BOOL v14 = a1 == 0xD000000000000012 && a2 == 0x80000002287AAFE0;
          BOOL v15 = v14;
          uint64_t result = 10;
          if ((v13 & 1) == 0 && !v15)
          {
            char v16 = sub_2287A85F0();
            BOOL v17 = a1 == 0xD000000000000013 && a2 == 0x80000002287AB000;
            BOOL v18 = v17;
            uint64_t result = 10;
            if ((v16 & 1) == 0 && !v18)
            {
              if (sub_2287A85F0()) {
                return 10;
              }
              swift_bridgeObjectRetain();
              return _s20SiriEmergencyIntents0B9SituationO8rawValueACSgSS_tcfC_0();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _s20SiriEmergencyIntents0B9SituationO14catiIntentNameACSgAA010CATIIntentG0O_tcfC_0(uint64_t result)
{
  if (result >= 0xAu) {
    return 35;
  }
  else {
    return result;
  }
}

unint64_t sub_2287A59A0()
{
  unint64_t result = qword_268263198;
  if (!qword_268263198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268263198);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EmergencySituation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 34 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 34) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDD)
  {
    unsigned int v6 = ((a2 - 222) >> 8) + 1;
    *unint64_t result = a2 + 34;
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
        JUMPOUT(0x2287A5AC0);
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
          *unint64_t result = a2 + 34;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencySituation()
{
  return &type metadata for EmergencySituation;
}

uint64_t Siri_Nlu_External_UserParse.toConvertedUsoTask()()
{
  Siri_Nlu_External_UserParse.usoTask.getter();
  sub_2287A81D0();

  return swift_release();
}

uint64_t Siri_Nlu_External_UserParse.identifierValue(entity:attributeName:namespaces:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_2287A8190();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268263080);
  MEMORY[0x270FA5388](v8 - 8);
  char v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2287A81A0();
  swift_bridgeObjectRelease();
  if (v11)
  {
    uint64_t v42 = *(void *)(v11 + 16);
    if (v42)
    {
      uint64_t v38 = v10;
      uint64_t v39 = v5;
      char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v12 = v5 + 16;
      unint64_t v44 = v11 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
      uint64_t v45 = v13;
      uint64_t v14 = *(void *)(a3 + 16);
      uint64_t v41 = (void (**)(char *, uint64_t))(v12 - 8);
      uint64_t v46 = v12;
      uint64_t v43 = *(void *)(v12 + 56);
      v37[1] = v11;
      swift_bridgeObjectRetain_n();
      uint64_t v15 = 0;
      uint64_t v52 = "emergencyAttribute";
      uint64_t v53 = "emergency";
      unint64_t v50 = (unint64_t)"crisisSituationHigh";
      unint64_t v51 = (unint64_t)"emergencySirenNoun";
      uint64_t v49 = "crisisSituationMedium";
      unint64_t v47 = v7;
      uint64_t v40 = v4;
      do
      {
        v45(v7, v44 + v43 * v15, v4);
        uint64_t v48 = v15;
        if (v14)
        {
          swift_bridgeObjectRetain();
          uint64_t v16 = 0;
          BOOL v17 = (void *)MEMORY[0x263F8EE78];
          do
          {
            unint64_t v18 = 0xD000000000000015;
            unint64_t v19 = 0x80000002287A9FB0;
            switch(*(unsigned char *)(a3 + v16 + 32))
            {
              case 1:
                uint64_t v20 = v53;
                goto LABEL_14;
              case 2:
                uint64_t v20 = v52;
                goto LABEL_14;
              case 3:
                unint64_t v18 = 0xD000000000000013;
                unint64_t v19 = v51 | 0x8000000000000000;
                break;
              case 4:
                unint64_t v18 = 0xD000000000000015;
                unint64_t v19 = v50 | 0x8000000000000000;
                break;
              case 5:
                uint64_t v20 = v49;
LABEL_14:
                unint64_t v19 = (unint64_t)v20 | 0x8000000000000000;
                unint64_t v18 = 0xD000000000000012;
                break;
              case 6:
                unint64_t v19 = 0xEB00000000657079;
                unint64_t v18 = 0x54746361746E6F63;
                break;
              case 7:
                unint64_t v19 = 0xE900000000000065;
                unint64_t v18 = 0x707954656E6F6870;
                break;
              case 8:
                unint64_t v19 = 0xEA0000000000656DLL;
                unint64_t v18 = 0x614E746E65746E69;
                break;
              default:
                break;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              BOOL v17 = sub_2287A7C00(0, v17[2] + 1, 1, v17);
            }
            unint64_t v22 = v17[2];
            unint64_t v21 = v17[3];
            if (v22 >= v21 >> 1) {
              BOOL v17 = sub_2287A7C00((void *)(v21 > 1), v22 + 1, 1, v17);
            }
            ++v16;
            v17[2] = v22 + 1;
            uint64_t v23 = &v17[2 * v22];
            v23[4] = v18;
            v23[5] = v19;
          }
          while (v14 != v16);
          swift_bridgeObjectRelease();
          char v7 = v47;
        }
        else
        {
          BOOL v17 = (void *)MEMORY[0x263F8EE78];
        }
        uint64_t v24 = sub_2287A8180();
        if (v25) {
          uint64_t v26 = v24;
        }
        else {
          uint64_t v26 = 0;
        }
        if (v25) {
          unint64_t v27 = v25;
        }
        else {
          unint64_t v27 = 0xE000000000000000;
        }
        uint64_t v28 = v17[2];
        if (v28)
        {
          BOOL v29 = v17[4] == v26 && v17[5] == v27;
          if (v29 || (sub_2287A85F0() & 1) != 0) {
            goto LABEL_48;
          }
          if (v28 != 1)
          {
            uint64_t v30 = v17 + 7;
            uint64_t v31 = 1;
            while (1)
            {
              uint64_t v32 = v31 + 1;
              if (__OFADD__(v31, 1))
              {
                __break(1u);
                JUMPOUT(0x2287A60DCLL);
              }
              BOOL v33 = *(v30 - 1) == v26 && *v30 == v27;
              if (v33 || (sub_2287A85F0() & 1) != 0) {
                break;
              }
              v30 += 2;
              ++v31;
              if (v32 == v28) {
                goto LABEL_4;
              }
            }
LABEL_48:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            char v10 = v38;
            uint64_t v5 = v39;
            uint64_t v4 = v40;
            (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v38, v47, v40);
            uint64_t v34 = 0;
            goto LABEL_50;
          }
LABEL_4:
          swift_bridgeObjectRelease();
          uint64_t v4 = v40;
          char v7 = v47;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v15 = v48 + 1;
        swift_bridgeObjectRelease();
        (*v41)(v7, v4);
      }
      while (v15 != v42);
      swift_bridgeObjectRelease();
      uint64_t v34 = 1;
      char v10 = v38;
      uint64_t v5 = v39;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v34 = 1;
    }
LABEL_50:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v34, 1, v4);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
    {
      uint64_t v35 = sub_2287A8170();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      swift_bridgeObjectRelease();
      return v35;
    }
    sub_228797E88((uint64_t)v10, &qword_268263080);
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t Siri_Nlu_External_UserParse.catiIntentName.getter()
{
  uint64_t v0 = sub_2287A8390();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  int v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2287A8110();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  char v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = Siri_Nlu_External_UserParse.identifiers.getter();
  uint64_t v49 = *(void *)(v10 + 16);
  if (v49)
  {
    uint64_t v45 = v9;
    uint64_t v46 = v5;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    unint64_t v53 = v10 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v54 = v12;
    char v13 = (void (**)(char *, uint64_t))(v1 + 8);
    uint64_t v48 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v55 = v11;
    uint64_t v52 = *(void *)(v11 + 56);
    uint64_t v44 = v10;
    swift_bridgeObjectRetain();
    uint64_t v14 = 0;
    unint64_t v51 = (unint64_t)"emergencyConfirmation";
    uint64_t v42 = "emergencyAttribute";
    uint64_t v43 = "emergency";
    unint64_t v40 = (unint64_t)"crisisSituationHigh";
    unint64_t v41 = (unint64_t)"emergencySirenNoun";
    uint64_t v39 = "crisisSituationMedium";
    uint64_t v50 = v4;
    unint64_t v47 = v7;
    do
    {
      unint64_t v15 = v53 + v52 * v14;
      uint64_t v16 = v14 + 1;
      v54(v7, v15, v4);
      unint64_t v17 = 0xD000000000000015;
      unint64_t v18 = v51 | 0x8000000000000000;
      switch(byte_26DCF3250)
      {
        case 1:
          unint64_t v19 = v43;
          goto LABEL_11;
        case 2:
          unint64_t v19 = v42;
          goto LABEL_11;
        case 3:
          unint64_t v17 = 0xD000000000000013;
          unint64_t v18 = v41 | 0x8000000000000000;
          break;
        case 4:
          unint64_t v17 = 0xD000000000000015;
          unint64_t v18 = v40 | 0x8000000000000000;
          break;
        case 5:
          unint64_t v19 = v39;
LABEL_11:
          unint64_t v18 = (unint64_t)v19 | 0x8000000000000000;
          unint64_t v17 = 0xD000000000000012;
          break;
        case 6:
          unint64_t v18 = 0xEB00000000657079;
          unint64_t v17 = 0x54746361746E6F63;
          break;
        case 7:
          unint64_t v18 = 0xE900000000000065;
          unint64_t v17 = 0x707954656E6F6870;
          break;
        case 8:
          unint64_t v18 = 0xEA0000000000656DLL;
          unint64_t v17 = 0x614E746E65746E69;
          break;
        default:
          break;
      }
      uint64_t v20 = (void *)MEMORY[0x263F8EE78];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v20 = sub_2287A7C00(0, *(void *)(MEMORY[0x263F8EE78] + 16) + 1, 1, MEMORY[0x263F8EE78]);
      }
      unint64_t v22 = v20[2];
      unint64_t v21 = v20[3];
      uint64_t v56 = v16;
      if (v22 >= v21 >> 1) {
        uint64_t v20 = sub_2287A7C00((void *)(v21 > 1), v22 + 1, 1, v20);
      }
      v20[2] = v22 + 1;
      uint64_t v23 = &v20[2 * v22];
      v23[4] = v17;
      v23[5] = v18;
      sub_2287A8100();
      uint64_t v24 = sub_2287A8380();
      uint64_t v26 = v25;
      (*v13)(v3, v0);
      uint64_t v27 = v20[2];
      if (v27)
      {
        if (v20[4] == v24 && v20[5] == v26) {
          goto LABEL_36;
        }
        BOOL v29 = v13;
        uint64_t v30 = v3;
        uint64_t v31 = v0;
        if (sub_2287A85F0()) {
          goto LABEL_36;
        }
        if (v27 != 1)
        {
          uint64_t v32 = v20 + 7;
          uint64_t v33 = 1;
          while (1)
          {
            uint64_t v34 = v33 + 1;
            if (__OFADD__(v33, 1))
            {
              __break(1u);
              JUMPOUT(0x2287A66D8);
            }
            BOOL v35 = *(v32 - 1) == v24 && *v32 == v26;
            if (v35 || (sub_2287A85F0() & 1) != 0) {
              break;
            }
            v32 += 2;
            ++v33;
            if (v34 == v27) {
              goto LABEL_3;
            }
          }
LABEL_36:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v9 = v45;
          uint64_t v5 = v46;
          uint64_t v4 = v50;
          (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v45, v47, v50);
          uint64_t v36 = 0;
          goto LABEL_38;
        }
LABEL_3:
        swift_bridgeObjectRelease();
        uint64_t v0 = v31;
        int v3 = v30;
        char v7 = v47;
        char v13 = v29;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v4 = v50;
      (*v48)(v7, v50);
      uint64_t v14 = v56;
    }
    while (v56 != v49);
    swift_bridgeObjectRelease();
    uint64_t v36 = 1;
    uint64_t v9 = v45;
    uint64_t v5 = v46;
  }
  else
  {
    uint64_t v36 = 1;
  }
LABEL_38:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v9, v36, 1, v4);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) == 1)
  {
    sub_228797E88((uint64_t)v9, &qword_2682630A8);
    return 0;
  }
  else
  {
    uint64_t v37 = sub_2287A80F0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
  return v37;
}

unint64_t Siri_Nlu_External_UserParse.usoTask.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263098);
  MEMORY[0x270FA5388]();
  uint64_t v1 = &v10[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v2 = sub_2287A80C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_2287A8040();
  if (*(void *)(v6 + 16))
  {
    (*(void (**)(unsigned char *, unint64_t, uint64_t))(v3 + 16))(v1, v6 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_228797E88((uint64_t)v1, &qword_268263098);
    return 0;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32))(v5, v1, v2);
  unint64_t result = sub_2287A8130();
  unint64_t v9 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2287A8590();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
      return v7;
    }
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    uint64_t v7 = MEMORY[0x22A69C390](0, v9);
    goto LABEL_11;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v7 = *(void *)(v9 + 32);
    swift_retain();
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

Swift::String_optional __swiftcall Siri_Nlu_External_UserParse.identifierValue(for:)(Swift::OpaquePointer a1)
{
  uint64_t v53 = sub_2287A8390();
  uint64_t v2 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2287A8110();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682630A8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = Siri_Nlu_External_UserParse.identifiers.getter();
  uint64_t v46 = *(void *)(v11 + 16);
  if (v46)
  {
    uint64_t v42 = v10;
    uint64_t v43 = v5;
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    unint64_t v49 = v11 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v50 = v13;
    uint64_t v14 = *((void *)a1._rawValue + 2);
    uint64_t v45 = (void (**)(char *, uint64_t))(v12 - 8);
    uint64_t v51 = v12;
    uint64_t v47 = *(void *)(v12 + 56);
    uint64_t v48 = (void (**)(char *, uint64_t))(v2 + 8);
    v41[1] = v11;
    swift_bridgeObjectRetain();
    uint64_t v15 = 0;
    uint64_t v59 = "emergencyAttribute";
    uint64_t v60 = "emergency";
    unint64_t v57 = (unint64_t)"crisisSituationHigh";
    unint64_t v58 = (unint64_t)"emergencySirenNoun";
    uint64_t v56 = "crisisSituationMedium";
    uint64_t v54 = v7;
    uint64_t v44 = v4;
    do
    {
      v50(v7, v49 + v47 * v15, v4);
      uint64_t v55 = v15;
      if (v14)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = 0;
        unint64_t v17 = (void *)MEMORY[0x263F8EE78];
        do
        {
          unint64_t v18 = 0xD000000000000015;
          unint64_t v19 = 0x80000002287A9FB0;
          switch(*((unsigned char *)a1._rawValue + v16 + 32))
          {
            case 1:
              uint64_t v20 = v60;
              goto LABEL_13;
            case 2:
              uint64_t v20 = v59;
              goto LABEL_13;
            case 3:
              unint64_t v18 = 0xD000000000000013;
              unint64_t v19 = v58 | 0x8000000000000000;
              break;
            case 4:
              unint64_t v18 = 0xD000000000000015;
              unint64_t v19 = v57 | 0x8000000000000000;
              break;
            case 5:
              uint64_t v20 = v56;
LABEL_13:
              unint64_t v19 = (unint64_t)v20 | 0x8000000000000000;
              unint64_t v18 = 0xD000000000000012;
              break;
            case 6:
              unint64_t v19 = 0xEB00000000657079;
              unint64_t v18 = 0x54746361746E6F63;
              break;
            case 7:
              unint64_t v19 = 0xE900000000000065;
              unint64_t v18 = 0x707954656E6F6870;
              break;
            case 8:
              unint64_t v19 = 0xEA0000000000656DLL;
              unint64_t v18 = 0x614E746E65746E69;
              break;
            default:
              break;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v17 = sub_2287A7C00(0, v17[2] + 1, 1, v17);
          }
          unint64_t v22 = v17[2];
          unint64_t v21 = v17[3];
          if (v22 >= v21 >> 1) {
            unint64_t v17 = sub_2287A7C00((void *)(v21 > 1), v22 + 1, 1, v17);
          }
          ++v16;
          v17[2] = v22 + 1;
          uint64_t v23 = &v17[2 * v22];
          v23[4] = v18;
          v23[5] = v19;
        }
        while (v14 != v16);
        swift_bridgeObjectRelease();
        uint64_t v7 = v54;
      }
      else
      {
        unint64_t v17 = (void *)MEMORY[0x263F8EE78];
      }
      uint64_t v24 = v52;
      sub_2287A8100();
      uint64_t v25 = sub_2287A8380();
      uint64_t v27 = v26;
      (*v48)(v24, v53);
      uint64_t v28 = v17[2];
      if (v28)
      {
        BOOL v29 = v17[4] == v25 && v17[5] == v27;
        if (v29 || (sub_2287A85F0() & 1) != 0) {
          goto LABEL_41;
        }
        if (v28 != 1)
        {
          uint64_t v30 = v17 + 7;
          uint64_t v31 = 1;
          while (1)
          {
            uint64_t v32 = v31 + 1;
            if (__OFADD__(v31, 1))
            {
              __break(1u);
              JUMPOUT(0x2287A6F98);
            }
            BOOL v33 = *(v30 - 1) == v25 && *v30 == v27;
            if (v33 || (sub_2287A85F0() & 1) != 0) {
              break;
            }
            v30 += 2;
            ++v31;
            if (v32 == v28) {
              goto LABEL_3;
            }
          }
LABEL_41:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v10 = v42;
          uint64_t v5 = v43;
          uint64_t v4 = v44;
          (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v54, v44);
          uint64_t v34 = 0;
          goto LABEL_43;
        }
LABEL_3:
        swift_bridgeObjectRelease();
        uint64_t v4 = v44;
        uint64_t v7 = v54;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v15 = v55 + 1;
      swift_bridgeObjectRelease();
      (*v45)(v7, v4);
    }
    while (v15 != v46);
    swift_bridgeObjectRelease();
    uint64_t v34 = 1;
    uint64_t v10 = v42;
    uint64_t v5 = v43;
  }
  else
  {
    uint64_t v34 = 1;
  }
LABEL_43:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v34, 1, v4);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_228797E88((uint64_t)v10, &qword_2682630A8);
    uint64_t v35 = 0;
    uint64_t v36 = 0;
  }
  else
  {
    uint64_t v35 = sub_2287A80F0();
    uint64_t v36 = v37;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  uint64_t v38 = v35;
  uint64_t v39 = v36;
  result.value._uint64_t object = v39;
  result.value._uint64_t countAndFlagsBits = v38;
  return result;
}

uint64_t Siri_Nlu_External_UserParse.userDialogAct.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2287A8040();
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = sub_2287A80C0();
  uint64_t v5 = *(void *)(v4 - 8);
  if (v3)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v2+ ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80)), v4);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, v6, 1, v4);

  return swift_bridgeObjectRelease();
}

uint64_t Siri_Nlu_External_UserParse.init(userDialogAct:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682631A0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2287A8060();
  sub_2287A8120();
  uint64_t v3 = sub_2287A8070();
  uint64_t v4 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_228797E88((uint64_t)v2, &qword_2682631A0);
  }
  else
  {
    sub_2287A8040();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  sub_2287A8050();
  return swift_unknownObjectRelease();
}

uint64_t Siri_Nlu_External_UserParse.identifiers.getter()
{
  uint64_t v0 = sub_2287A8030();
  uint64_t v16 = *(void *)(v0 - 8);
  uint64_t v17 = v0;
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2287A80E0();
  uint64_t v15 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268263098);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2287A8040();
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = sub_2287A80C0();
  uint64_t v11 = *(void *)(v10 - 8);
  if (v9)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v7, v8 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v7, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_2287A80C0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) == 1)
  {
    sub_228797E88((uint64_t)v7, &qword_268263098);
    return MEMORY[0x263F8EE78];
  }
  else
  {
    sub_2287A80B0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    sub_2287A80D0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
    uint64_t v12 = sub_2287A8020();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v2, v17);
  }
  return v12;
}

uint64_t sub_2287A7500(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_2287A85F0();
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
    if (v12 || (sub_2287A85F0() & 1) != 0) {
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

uint64_t sub_2287A75C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      unint64_t v6 = 0xD000000000000015;
      unint64_t v7 = 0x80000002287A9FB0;
      switch(*(unsigned char *)(a2 + v4 + 32))
      {
        case 1:
          uint64_t v8 = "emergency";
          goto LABEL_9;
        case 2:
          uint64_t v8 = "emergencyAttribute";
          goto LABEL_9;
        case 3:
          unint64_t v6 = 0xD000000000000013;
          unint64_t v7 = 0x80000002287AA010;
          break;
        case 4:
          unint64_t v6 = 0xD000000000000015;
          unint64_t v7 = 0x80000002287AA030;
          break;
        case 5:
          uint64_t v8 = "crisisSituationMedium";
LABEL_9:
          unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
          unint64_t v6 = 0xD000000000000012;
          break;
        case 6:
          unint64_t v7 = 0xEB00000000657079;
          unint64_t v6 = 0x54746361746E6F63;
          break;
        case 7:
          unint64_t v7 = 0xE900000000000065;
          unint64_t v6 = 0x707954656E6F6870;
          break;
        case 8:
          unint64_t v7 = 0xEA0000000000656DLL;
          unint64_t v6 = 0x614E746E65746E69;
          break;
        default:
          break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_2287A7C00(0, v5[2] + 1, 1, v5);
      }
      unint64_t v10 = v5[2];
      unint64_t v9 = v5[3];
      if (v10 >= v9 >> 1) {
        uint64_t v5 = sub_2287A7C00((void *)(v9 > 1), v10 + 1, 1, v5);
      }
      ++v4;
      v5[2] = v10 + 1;
      uint64_t v11 = &v5[2 * v10];
      v11[4] = v6;
      v11[5] = v7;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = sub_2287A8180();
  if (v13)
  {
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0xE000000000000000;
  }
  char v15 = sub_2287A7500(v12, v14, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15 & 1;
}

uint64_t sub_2287A784C(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_2287A8580();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = sub_2287A84B0();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2287A78E8(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_2287A78F0()
{
  uint64_t v1 = *v0;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_2287A7C00(result, v1[2] + 1, 1, v1);
    *uint64_t v0 = result;
  }
  return result;
}

void *sub_2287A793C(void *result)
{
  unint64_t v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_2287A7C00((void *)(v2 > 1), (int64_t)result + 1, 1, *v1);
    void *v1 = result;
  }
  return result;
}

uint64_t sub_2287A7980(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 16) = result + 1;
  uint64_t v5 = v4 + 16 * result;
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3;
  return result;
}

uint64_t sub_2287A7998(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682631A8);
  uint64_t v10 = *(void *)(sub_2287A83F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2287A8580();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2287A83F0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2287A7E04(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_2287A7C00(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2682631B0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
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
    sub_2287A7D10(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2287A7D10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2287A85A0();
  __break(1u);
  return result;
}

uint64_t sub_2287A7E04(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2287A83F0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2287A85A0();
  __break(1u);
  return result;
}

uint64_t sub_2287A7F60()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2287A7F70()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2287A7F80()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2287A7F90()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_2287A7FA0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_2287A7FB0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2287A7FC0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2287A7FD0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2287A7FE0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2287A7FF0()
{
  return MEMORY[0x270EF0DA0]();
}

uint64_t sub_2287A8000()
{
  return MEMORY[0x270EF0DF8]();
}

uint64_t sub_2287A8010()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2287A8020()
{
  return MEMORY[0x270F6A350]();
}

uint64_t sub_2287A8030()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_2287A8040()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_2287A8050()
{
  return MEMORY[0x270F6A4A0]();
}

uint64_t sub_2287A8060()
{
  return MEMORY[0x270F6A4F0]();
}

uint64_t sub_2287A8070()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_2287A8080()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_2287A8090()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_2287A80A0()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_2287A80B0()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_2287A80C0()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_2287A80D0()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_2287A80E0()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_2287A80F0()
{
  return MEMORY[0x270F6AFB0]();
}

uint64_t sub_2287A8100()
{
  return MEMORY[0x270F6AFC0]();
}

uint64_t sub_2287A8110()
{
  return MEMORY[0x270F6AFC8]();
}

uint64_t sub_2287A8120()
{
  return MEMORY[0x270F6BB08]();
}

uint64_t sub_2287A8130()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_2287A8140()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_2287A8150()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_2287A8160()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_2287A8170()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_2287A8180()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_2287A8190()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_2287A81A0()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_2287A81B0()
{
  return MEMORY[0x270F6D090]();
}

uint64_t sub_2287A81C0()
{
  return MEMORY[0x270F6D0D8]();
}

uint64_t sub_2287A81D0()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_2287A81E0()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_2287A81F0()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_2287A8200()
{
  return MEMORY[0x270F6D540]();
}

uint64_t sub_2287A8210()
{
  return MEMORY[0x270F6D548]();
}

uint64_t sub_2287A8220()
{
  return MEMORY[0x270F6D550]();
}

uint64_t sub_2287A8230()
{
  return MEMORY[0x270F6D7F8]();
}

uint64_t sub_2287A8240()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_2287A8250()
{
  return MEMORY[0x270F6DA68]();
}

uint64_t sub_2287A8260()
{
  return MEMORY[0x270F6DA98]();
}

uint64_t sub_2287A8270()
{
  return MEMORY[0x270F6DCF8]();
}

uint64_t sub_2287A8280()
{
  return MEMORY[0x270F6DF68]();
}

uint64_t sub_2287A8290()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_2287A82A0()
{
  return MEMORY[0x270F6E420]();
}

uint64_t sub_2287A82B0()
{
  return MEMORY[0x270F6E700]();
}

uint64_t sub_2287A82C0()
{
  return MEMORY[0x270F6E838]();
}

uint64_t sub_2287A82D0()
{
  return MEMORY[0x270F6E840]();
}

uint64_t sub_2287A82E0()
{
  return MEMORY[0x270F6E848]();
}

uint64_t sub_2287A82F0()
{
  return MEMORY[0x270F6E850]();
}

uint64_t sub_2287A8300()
{
  return MEMORY[0x270F6E980]();
}

uint64_t sub_2287A8310()
{
  return MEMORY[0x270F6EBF8]();
}

uint64_t sub_2287A8320()
{
  return MEMORY[0x270F6EC08]();
}

uint64_t sub_2287A8330()
{
  return MEMORY[0x270F6EC10]();
}

uint64_t sub_2287A8340()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_2287A8350()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_2287A8360()
{
  return MEMORY[0x270F72A28]();
}

uint64_t sub_2287A8370()
{
  return MEMORY[0x270F72C20]();
}

uint64_t sub_2287A8380()
{
  return MEMORY[0x270F446F8]();
}

uint64_t sub_2287A8390()
{
  return MEMORY[0x270F44710]();
}

uint64_t sub_2287A83A0()
{
  return MEMORY[0x270F31B60]();
}

uint64_t sub_2287A83B0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2287A83C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2287A83D0()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_2287A83E0()
{
  return MEMORY[0x270F70A78]();
}

uint64_t sub_2287A83F0()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_2287A8400()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2287A8410()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2287A8420()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2287A8430()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2287A8440()
{
  return MEMORY[0x270F31B68]();
}

uint64_t sub_2287A8450()
{
  return MEMORY[0x270F31B70]();
}

uint64_t sub_2287A8460()
{
  return MEMORY[0x270F70738]();
}

uint64_t sub_2287A8470()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2287A8480()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2287A8490()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2287A84A0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2287A84B0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2287A84C0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2287A84D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2287A84E0()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_2287A84F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2287A8500()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2287A8510()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_2287A8520()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2287A8530()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2287A8540()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2287A8550()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2287A8560()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2287A8570()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2287A8580()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2287A8590()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2287A85A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2287A85B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2287A85C0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2287A85D0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2287A85E0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2287A85F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2287A8600()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2287A8610()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2287A8620()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2287A8630()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2287A8640()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2287A8650()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2287A8660()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2287A8670()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2287A8680()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2287A8690()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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