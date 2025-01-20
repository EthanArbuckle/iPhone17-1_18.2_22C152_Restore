uint64_t dispatch thunk of MessageAttachment.url.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MessageAttachment.isDraft.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

SiriMessagesCommon::DirectButton_optional __swiftcall DirectButton.init(rawValue:)(Swift::String rawValue)
{
  v2 = v1;
  unint64_t v3 = sub_25D15B770();
  result.value = swift_bridgeObjectRelease();
  char v5 = 14;
  if (v3 < 0xE) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t DirectButton.rawValue.getter()
{
  return *(void *)&aAudiorepcall[8 * *v0];
}

uint64_t sub_25D117154(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25D12F834(*a1, *a2);
}

uint64_t sub_25D117160()
{
  return sub_25D12F8F0(*v0);
}

uint64_t sub_25D117168(uint64_t a1)
{
  return sub_25D12F9F8(a1, *v1);
}

uint64_t sub_25D117170(uint64_t a1)
{
  return sub_25D12FA74(a1, *v1);
}

SiriMessagesCommon::DirectButton_optional sub_25D117178(Swift::String *a1)
{
  return DirectButton.init(rawValue:)(*a1);
}

uint64_t sub_25D117184@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DirectButton.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25D1171AC()
{
  return sub_25D15B530();
}

uint64_t sub_25D11720C()
{
  return sub_25D15B520();
}

SiriMessagesCommon::DirectInvocationURI_optional __swiftcall DirectInvocationURI.init(rawValue:)(Swift::String rawValue)
{
  v2 = v1;
  unint64_t v3 = sub_25D15B910();
  result.value = swift_bridgeObjectRelease();
  char v5 = 19;
  if (v3 < 0x13) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t DirectInvocationURI.rawValue.getter()
{
  unint64_t result = 0xD000000000000038;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000034;
      break;
    case 2:
      unint64_t result = 0xD000000000000036;
      break;
    case 3:
      unint64_t result = 0xD00000000000003ALL;
      break;
    case 4:
      unint64_t result = 0xD00000000000003DLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000003DLL;
      break;
    case 6:
      unint64_t result = 0xD000000000000033;
      break;
    case 7:
    case 8:
    case 0xE:
      unint64_t result = 0xD00000000000003CLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000041;
      break;
    case 0xA:
      unint64_t result = 0xD00000000000003DLL;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000034;
      break;
    case 0xC:
      unint64_t result = 0xD00000000000003BLL;
      break;
    case 0xD:
      unint64_t result = 0xD000000000000030;
      break;
    case 0xF:
      unint64_t result = 0xD00000000000003ALL;
      break;
    case 0x10:
      unint64_t result = 0xD00000000000004ALL;
      break;
    case 0x11:
      unint64_t result = 0xD000000000000044;
      break;
    case 0x12:
      unint64_t result = 0xD000000000000041;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25D11747C()
{
  unint64_t result = qword_26A660708;
  if (!qword_26A660708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660708);
  }
  return result;
}

uint64_t sub_25D1174C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25D12F81C(*a1, *a2);
}

unint64_t sub_25D1174D8()
{
  unint64_t result = qword_26A660710;
  if (!qword_26A660710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660710);
  }
  return result;
}

uint64_t sub_25D117524()
{
  return sub_25D12F924(*v0);
}

uint64_t sub_25D11752C(uint64_t a1)
{
  return sub_25D12F9E0(a1, *v1);
}

uint64_t sub_25D117534(uint64_t a1)
{
  return sub_25D12FA8C(a1, *v1);
}

SiriMessagesCommon::DirectInvocationURI_optional sub_25D11753C(Swift::String *a1)
{
  return DirectInvocationURI.init(rawValue:)(*a1);
}

unint64_t sub_25D117548@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DirectInvocationURI.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DirectButton(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF3)
  {
    if (a2 + 13 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 13) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 14;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v5 = v6 - 14;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DirectButton(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x25D1176D4);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

uint64_t sub_25D1176FC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25D117708(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DirectButton()
{
  return &type metadata for DirectButton;
}

uint64_t getEnumTagSinglePayload for DirectInvocationURI(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEE)
  {
    if (a2 + 18 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 18) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 19;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v5 = v6 - 19;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DirectInvocationURI(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x25D117874);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DirectInvocationURI()
{
  return &type metadata for DirectInvocationURI;
}

unint64_t sub_25D1178AC()
{
  unint64_t result = qword_26A660718;
  if (!qword_26A660718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660718);
  }
  return result;
}

uint64_t AutoSendableCompactCarPlayButton.init(shouldAutoSend:autoSendTimeout:delayedActionCancelCommand:handleIntent:speechSynthesisId:isFirstPartyApp:responseMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v18 = qword_26A660E88;
  *(void *)(a8 + 48) = qword_26A660E80;
  *(void *)(a8 + 56) = v18;
  uint64_t v19 = a8 + *(int *)(type metadata accessor for AutoSendableCompactCarPlayButton() + 44);
  uint64_t v20 = sub_25D15B360();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *(unsigned char *)a8 = a1 & 1;
  *(double *)(a8 + 8) = a9;
  *(void *)(a8 + 16) = a2;
  *(void *)(a8 + 24) = a3;
  *(void *)(a8 + 32) = a4;
  *(void *)(a8 + 40) = a5;
  *(unsigned char *)(a8 + 64) = a6 & 1;
  swift_bridgeObjectRetain();
  return sub_25D118D9C(a7, v19);
}

void AutoSendableCompactCarPlayButton.delayedActionCancelCommand.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

void AutoSendableCompactCarPlayButton.handleIntent.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t AutoSendableCompactCarPlayButton.shouldAutoSend.getter()
{
  return *v0;
}

uint64_t AutoSendableCompactCarPlayButton.shouldAutoSend.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*AutoSendableCompactCarPlayButton.shouldAutoSend.modify())()
{
  return nullsub_1;
}

double AutoSendableCompactCarPlayButton.autoSendTimeout.getter()
{
  return *(double *)(v0 + 8);
}

void AutoSendableCompactCarPlayButton.autoSendTimeout.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*AutoSendableCompactCarPlayButton.autoSendTimeout.modify())()
{
  return nullsub_1;
}

void *AutoSendableCompactCarPlayButton.delayedActionCancelCommand.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void sub_25D117B00(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  AutoSendableCompactCarPlayButton.delayedActionCancelCommand.setter((uint64_t)v1);
}

void (*AutoSendableCompactCarPlayButton.delayedActionCancelCommand.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117B7C;
}

void sub_25D117B7C(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned int v4 = *(void **)(v2 + 16);
  if (a2)
  {
    id v5 = v3;

    *(void *)(v2 + 16) = v3;
  }
  else
  {

    *(void *)(v2 + 16) = v3;
  }
}

void *AutoSendableCompactCarPlayButton.handleIntent.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void sub_25D117C1C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  AutoSendableCompactCarPlayButton.handleIntent.setter((uint64_t)v1);
}

void (*AutoSendableCompactCarPlayButton.handleIntent.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117C98;
}

void sub_25D117C98(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned int v4 = *(void **)(v2 + 24);
  if (a2)
  {
    id v5 = v3;

    *(void *)(v2 + 24) = v3;
  }
  else
  {

    *(void *)(v2 + 24) = v3;
  }
}

uint64_t AutoSendableCompactCarPlayButton.speechSynthesisId.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoSendableCompactCarPlayButton.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AutoSendableCompactCarPlayButton.speechSynthesisId.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCompactCarPlayButton.sendLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoSendableCompactCarPlayButton.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AutoSendableCompactCarPlayButton.sendLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCompactCarPlayButton.isFirstPartyApp.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t AutoSendableCompactCarPlayButton.isFirstPartyApp.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 64) = result;
  return result;
}

uint64_t (*AutoSendableCompactCarPlayButton.isFirstPartyApp.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCompactCarPlayButton.responseMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AutoSendableCompactCarPlayButton() + 44);

  return sub_25D118E48(v3, a1);
}

uint64_t AutoSendableCompactCarPlayButton.responseMode.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AutoSendableCompactCarPlayButton() + 44);

  return sub_25D118D9C(a1, v3);
}

uint64_t (*AutoSendableCompactCarPlayButton.responseMode.modify())()
{
  return nullsub_1;
}

BOOL sub_25D117F20(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25D117F30()
{
  return sub_25D15B980();
}

uint64_t sub_25D117F58(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7541646C756F6873 && a2 == 0xEE00646E65536F74;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025D162B40 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6E49656C646E6168 && a2 == 0xEC000000746E6574;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x800000025D162B60 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        BOOL v8 = a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL;
        if (v8 || (sub_25D15B8C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 0x5074737269467369 && a2 == 0xEF70704179747261;
          if (v9 || (sub_25D15B8C0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            char v11 = sub_25D15B8C0();
            swift_bridgeObjectRelease();
            if (v11) {
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

uint64_t sub_25D1182DC()
{
  return 8;
}

uint64_t sub_25D1182E4()
{
  return sub_25D15B990();
}

uint64_t sub_25D11832C()
{
  return 0;
}

unint64_t sub_25D118338(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x646E65536F747561;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6E49656C646E6168;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0x6562614C646E6573;
      break;
    case 6:
      unint64_t result = 0x5074737269467369;
      break;
    case 7:
      unint64_t result = 0x65736E6F70736572;
      break;
    default:
      unint64_t result = 0x7541646C756F6873;
      break;
  }
  return result;
}

BOOL sub_25D118488(char *a1, char *a2)
{
  return sub_25D117F20(*a1, *a2);
}

uint64_t sub_25D118494()
{
  return sub_25D1182E4();
}

uint64_t sub_25D11849C()
{
  return sub_25D117F30();
}

uint64_t sub_25D1184A4()
{
  return sub_25D15B990();
}

unint64_t sub_25D1184E8()
{
  return sub_25D118338(*v0);
}

uint64_t sub_25D1184F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D117F58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D118518()
{
  return sub_25D11832C();
}

uint64_t sub_25D118538@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D1182DC();
  *a1 = result;
  return result;
}

uint64_t sub_25D118560(uint64_t a1)
{
  unint64_t v2 = sub_25D118EF4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D11859C(uint64_t a1)
{
  unint64_t v2 = sub_25D118EF4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AutoSendableCompactCarPlayButton.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660728);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D118EF4();
  sub_25D15B9D0();
  OUTLINED_FUNCTION_7();
  if (!v1)
  {
    sub_25D15B870();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660738);
    sub_25D119038(&qword_26A660740, &qword_26A660738);
    OUTLINED_FUNCTION_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660748);
    sub_25D119038(&qword_26A660750, &qword_26A660748);
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_5(4);
    sub_25D15B830();
    OUTLINED_FUNCTION_5(5);
    sub_25D15B850();
    OUTLINED_FUNCTION_7();
    type metadata accessor for AutoSendableCompactCarPlayButton();
    sub_25D15B360();
    sub_25D119224(&qword_26A660758, MEMORY[0x263F75718]);
    sub_25D15B840();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t AutoSendableCompactCarPlayButton.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
  MEMORY[0x270FA5388]();
  v23 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660760);
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v6;
  uint64_t v25 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = type metadata accessor for AutoSendableCompactCarPlayButton();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v8 = qword_26A660E88;
  *(void *)(v2 + 48) = qword_26A660E80;
  *(void *)(v2 + 56) = v8;
  uint64_t v9 = v2 + *(int *)(v7 + 44);
  uint64_t v10 = sub_25D15B360();
  uint64_t v26 = v9;
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D118EF4();
  swift_bridgeObjectRetain();
  uint64_t v11 = v27;
  sub_25D15B9B0();
  if (v11)
  {
    uint64_t v12 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_25D118FD8(v12);
  }
  else
  {
    uint64_t v27 = v8;
    LOBYTE(v29) = 0;
    *(unsigned char *)uint64_t v2 = sub_25D15B7D0() & 1;
    LOBYTE(v29) = 1;
    sub_25D15B7E0();
    *(void *)(v2 + 8) = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660738);
    char v28 = 2;
    sub_25D119038(&qword_26A660768, &qword_26A660738);
    OUTLINED_FUNCTION_2();
    *(void *)(v2 + 16) = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660748);
    char v28 = 3;
    sub_25D119038(&qword_26A660770, &qword_26A660748);
    OUTLINED_FUNCTION_2();
    *(void *)(v2 + 24) = v29;
    OUTLINED_FUNCTION_3(4);
    *(void *)(v2 + 32) = sub_25D15B7A0();
    *(void *)(v2 + 40) = v15;
    OUTLINED_FUNCTION_3(5);
    uint64_t v16 = sub_25D15B7C0();
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    *(void *)(v2 + 48) = v16;
    *(void *)(v2 + 56) = v18;
    OUTLINED_FUNCTION_3(6);
    *(unsigned char *)(v2 + 64) = sub_25D15B7D0() & 1;
    LOBYTE(v29) = 7;
    sub_25D119224(&qword_26A660778, MEMORY[0x263F75718]);
    uint64_t v19 = (uint64_t)v23;
    sub_25D15B7B0();
    uint64_t v20 = OUTLINED_FUNCTION_6();
    v21(v20);
    sub_25D118D9C(v19, v26);
    sub_25D11907C(v2, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25D1190E0(v2);
  }
}

uint64_t sub_25D118CFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AutoSendableCompactCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_25D118D14(void *a1)
{
  return AutoSendableCompactCarPlayButton.encode(to:)(a1);
}

uint64_t type metadata accessor for AutoSendableCompactCarPlayButton()
{
  uint64_t result = qword_26A660798;
  if (!qword_26A660798) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25D118D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
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

uint64_t sub_25D118E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

unint64_t sub_25D118EF4()
{
  unint64_t result = qword_26A660730;
  if (!qword_26A660730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660730);
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

uint64_t sub_25D118FD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D119038(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25D11907C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutoSendableCompactCarPlayButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D1190E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AutoSendableCompactCarPlayButton();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D11913C(uint64_t a1)
{
  uint64_t result = sub_25D119224(&qword_26A660780, (void (*)(uint64_t))type metadata accessor for AutoSendableCompactCarPlayButton);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25D119194()
{
  return sub_25D119224(&qword_26A660788, (void (*)(uint64_t))type metadata accessor for AutoSendableCompactCarPlayButton);
}

uint64_t sub_25D1191DC()
{
  return sub_25D119224(&qword_26A660790, (void (*)(uint64_t))type metadata accessor for AutoSendableCompactCarPlayButton);
}

uint64_t sub_25D119224(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_25D11926C@<X0>(void *a1@<X8>)
{
  uint64_t result = AutoSendableCompactCarPlayButton.delayedActionCancelCommand.getter();
  *a1 = result;
  return result;
}

void *sub_25D11929C@<X0>(void *a1@<X8>)
{
  uint64_t result = AutoSendableCompactCarPlayButton.handleIntent.getter();
  *a1 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  BOOL v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *BOOL v3 = *a2;
    BOOL v3 = (void *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = (void *)a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v5;
    uint64_t v7 = (void *)a2[3];
    uint64_t v6 = a2[4];
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v6;
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = a2[7];
    uint64_t v9 = *(int *)(a3 + 44);
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = (void *)(a1 + v9);
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v12 = sub_25D15B360();
    id v13 = v5;
    id v14 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
      memcpy(v11, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v11, v10, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v12);
    }
  }
  return v3;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t destroy for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_25D15B360();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v8 = *(int *)(a3 + 44);
  uint64_t v9 = (const void *)(a2 + v8);
  uint64_t v10 = (void *)(a1 + v8);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v11 = sub_25D15B360();
  id v12 = v4;
  id v13 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v10, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 16))(v10, v9, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v7 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v7;
  id v8 = v7;

  uint64_t v9 = *(void **)(a1 + 24);
  uint64_t v10 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v10;
  id v11 = v10;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v12 = *(int *)(a3 + 44);
  id v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_25D15B360();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int v17 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!EnumTagSinglePayload)
  {
    uint64_t v18 = *(void *)(v15 - 8);
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

uint64_t initializeWithTake for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  uint64_t v5 = *(int *)(a3 + 44);
  uint64_t v6 = (const void *)(a2 + v5);
  uint64_t v7 = (void *)(a1 + v5);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = sub_25D15B360();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v7, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v10 = *(int *)(a3 + 44);
  id v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_25D15B360();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    uint64_t v16 = *(void *)(v13 - 8);
    if (!v15)
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D119AEC);
}

uint64_t sub_25D119AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    uint64_t v9 = a1 + *(int *)(a3 + 44);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AutoSendableCompactCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D119B8C);
}

uint64_t sub_25D119B8C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 56) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    uint64_t v8 = v5 + *(int *)(a4 + 44);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D119C10()
{
  sub_25D119CD8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25D119CD8()
{
  if (!qword_26A6607A8)
  {
    sub_25D15B360();
    unint64_t v0 = sub_25D15B640();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6607A8);
    }
  }
}

uint64_t getEnumTagSinglePayload for AutoSendableCompactCarPlayButton.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AutoSendableCompactCarPlayButton.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D119E84);
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

ValueMetadata *type metadata accessor for AutoSendableCompactCarPlayButton.CodingKeys()
{
  return &type metadata for AutoSendableCompactCarPlayButton.CodingKeys;
}

unint64_t sub_25D119EC0()
{
  unint64_t result = qword_26A6607B0;
  if (!qword_26A6607B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6607B0);
  }
  return result;
}

unint64_t sub_25D119F10()
{
  unint64_t result = qword_26A6607B8;
  if (!qword_26A6607B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6607B8);
  }
  return result;
}

unint64_t sub_25D119F60()
{
  unint64_t result = qword_26A6607C0;
  if (!qword_26A6607C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6607C0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return sub_25D15B880();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_25D15B7F0();
}

uint64_t OUTLINED_FUNCTION_3@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return v1 - 72;
}

void OUTLINED_FUNCTION_5(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_25D15B860();
}

unint64_t static OpenConversationIntentRepresentation.bundleIdentifier.getter()
{
  return 0xD000000000000013;
}

unint64_t static OpenConversationIntentRepresentation.actionIdentifier.getter()
{
  return 0xD000000000000016;
}

uint64_t OpenConversationIntentRepresentation.textPayload.getter()
{
  sub_25D15B3A0();
  return v1;
}

uint64_t sub_25D11A104@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OpenConversationIntentRepresentation.textPayload.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25D11A140()
{
  return OpenConversationIntentRepresentation.textPayload.setter();
}

uint64_t OpenConversationIntentRepresentation.textPayload.setter()
{
  return sub_25D15B3B0();
}

uint64_t (*OpenConversationIntentRepresentation.textPayload.modify(void *a1))()
{
  int v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25D15B390();
  return sub_25D11A220;
}

uint64_t OpenConversationIntentRepresentation.$textPayload.getter()
{
  return sub_25D15B3C0();
}

uint64_t OpenConversationIntentRepresentation.identifier.getter()
{
  sub_25D15B3A0();
  return v1;
}

uint64_t sub_25D11A27C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OpenConversationIntentRepresentation.identifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25D11A2B8()
{
  return OpenConversationIntentRepresentation.identifier.setter();
}

uint64_t OpenConversationIntentRepresentation.identifier.setter()
{
  return sub_25D15B3B0();
}

uint64_t (*OpenConversationIntentRepresentation.identifier.modify(void *a1))()
{
  int v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25D15B390();
  return sub_25D11A220;
}

void sub_25D11A398(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t OpenConversationIntentRepresentation.$identifier.getter()
{
  return sub_25D15B3C0();
}

uint64_t OpenConversationIntentRepresentation.init(identifier:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607C8);
  uint64_t v4 = OUTLINED_FUNCTION_1_0();
  uint64_t v12 = OUTLINED_FUNCTION_0_0(v4, v5, v6, v7, v8, v9, v10, v11, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D0);
  uint64_t v13 = OUTLINED_FUNCTION_1_0();
  uint64_t result = OUTLINED_FUNCTION_0_0(v13, v14, v15, v16, v17, v18, v19, v20, a1);
  *a2 = v12;
  a2[1] = result;
  return result;
}

uint64_t OpenConversationIntentRepresentation.init(identifier:textPayload:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607C8);
  uint64_t v4 = OUTLINED_FUNCTION_1_0();
  *a2 = OUTLINED_FUNCTION_0_0(v4, v5, v6, v7, v8, v9, v10, v11, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D0);
  uint64_t v12 = OUTLINED_FUNCTION_1_0();
  a2[1] = OUTLINED_FUNCTION_0_0(v12, v13, v14, v15, v16, v17, v18, v19, a1);
  return sub_25D15B3B0();
}

unint64_t sub_25D11A51C()
{
  return 0xD000000000000013;
}

unint64_t sub_25D11A53C()
{
  return 0xD000000000000016;
}

uint64_t destroy for OpenConversationIntentRepresentation()
{
  swift_release();

  return swift_release();
}

void *_s18SiriMessagesCommon36OpenConversationIntentRepresentationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for OpenConversationIntentRepresentation(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for OpenConversationIntentRepresentation(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OpenConversationIntentRepresentation(uint64_t *a1, int a2)
{
  if (a2)
  {
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
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OpenConversationIntentRepresentation(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenConversationIntentRepresentation()
{
  return &type metadata for OpenConversationIntentRepresentation;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return MEMORY[0x270F0CB10](&a9);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_allocObject();
}

id SentMessageSnippetModel.intent.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

void sub_25D11A778(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  SentMessageSnippetModel.intent.setter(v1);
}

void SentMessageSnippetModel.intent.setter(void *a1)
{
  id *v1 = a1;
}

void (*SentMessageSnippetModel.intent.modify(void **a1))(uint64_t a1, char a2)
{
  id v2 = *v1;
  *a1 = *v1;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D11A820;
}

void sub_25D11A820(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  id v2 = *(void ***)(a1 + 8);
  uint64_t v4 = *v2;
  if (a2)
  {
    id v5 = v3;

    void *v2 = v3;
  }
  else
  {

    void *v2 = v3;
  }
}

void *SentMessageSnippetModel.intentResponse.getter()
{
  id v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void sub_25D11A8C0(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  SentMessageSnippetModel.intentResponse.setter((uint64_t)v1);
}

void SentMessageSnippetModel.intentResponse.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

void (*SentMessageSnippetModel.intentResponse.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 8);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D11A968;
}

void sub_25D11A968(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void **)(v2 + 8);
  if (a2)
  {
    id v5 = v3;

    *(void *)(v2 + 8) = v3;
  }
  else
  {

    *(void *)(v2 + 8) = v3;
  }
}

uint64_t SentMessageSnippetModel.contactName.getter()
{
  type metadata accessor for SentMessageSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  sub_25D15B300();
  return v1;
}

uint64_t type metadata accessor for SentMessageSnippetModel()
{
  uint64_t result = qword_26A660888;
  if (!qword_26A660888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D11AA74()
{
  return SentMessageSnippetModel.contactName.setter();
}

uint64_t SentMessageSnippetModel.contactName.setter()
{
  return sub_25D15B310();
}

uint64_t (*SentMessageSnippetModel.contactName.modify())()
{
  uint64_t v1 = malloc(0x28uLL);
  OUTLINED_FUNCTION_9((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  *(void *)(v0 + 32) = sub_25D15B2F0();
  return sub_25D11A220;
}

uint64_t SentMessageSnippetModel.shouldConfirmUnsend.getter()
{
  type metadata accessor for SentMessageSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  sub_25D15B300();
  return v1;
}

uint64_t SentMessageSnippetModel.shouldConfirmUnsend.setter()
{
  return sub_25D15B310();
}

uint64_t (*SentMessageSnippetModel.shouldConfirmUnsend.modify())()
{
  unsigned __int8 v1 = malloc(0x28uLL);
  OUTLINED_FUNCTION_9((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  *(void *)(v0 + 32) = sub_25D15B2F0();
  return sub_25D11A220;
}

uint64_t SentMessageSnippetModel.labels.getter()
{
  return sub_25D15B300();
}

uint64_t sub_25D11ACC4(void *__src)
{
  memcpy(v3, __src, sizeof(v3));
  sub_25D11BCD0((uint64_t)v3);
  return SentMessageSnippetModel.labels.setter(__src);
}

uint64_t SentMessageSnippetModel.labels.setter(void *__src)
{
  memcpy(v2, __src, sizeof(v2));
  type metadata accessor for SentMessageSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  return sub_25D15B310();
}

uint64_t (*SentMessageSnippetModel.labels.modify())()
{
  unsigned __int8 v1 = malloc(0x28uLL);
  OUTLINED_FUNCTION_9((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  *(void *)(v0 + 32) = sub_25D15B2F0();
  return sub_25D11A220;
}

void SentMessageSnippetModel.init(intent:intentResponse:contactName:shouldConfirmUnsend:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, void *a6@<X8>)
{
  type metadata accessor for SentMessageSnippetModel();
  __dst[0] = 0;
  sub_25D15B2E0();
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  memcpy(__dst, &qword_26A660E80, 0xE0uLL);
  memcpy(v14, &qword_26A660E80, sizeof(v14));
  sub_25D11BCD0((uint64_t)__dst);
  sub_25D15B2E0();
  *a6 = a1;
  a6[1] = a2;
  v14[0] = a3;
  v14[1] = a4;
  id v12 = a1;
  id v13 = a2;
  sub_25D15B2E0();
  LOBYTE(v14[0]) = a5 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  sub_25D15B310();
}

uint64_t SentMessageSnippetModel.description.getter()
{
  return 0;
}

uint64_t sub_25D11B098(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6552746E65746E69 && a2 == 0xEE0065736E6F7073;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000013 && a2 == 0x800000025D162C10 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x736C6562616CLL && a2 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_25D15B8C0();
        swift_bridgeObjectRelease();
        if (v9) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

uint64_t sub_25D11B2A4()
{
  return 5;
}

unint64_t sub_25D11B2AC(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6552746E65746E69;
      break;
    case 2:
      unint64_t result = 0x4E746361746E6F63;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x736C6562616CLL;
      break;
    default:
      unint64_t result = 0x746E65746E69;
      break;
  }
  return result;
}

unint64_t sub_25D11B36C()
{
  return sub_25D11B2AC(*v0);
}

uint64_t sub_25D11B374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D11B098(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D11B39C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D11B2A4();
  *a1 = result;
  return result;
}

uint64_t sub_25D11B3C4(uint64_t a1)
{
  unint64_t v2 = sub_25D11BDC8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D11B400(uint64_t a1)
{
  unint64_t v2 = sub_25D11BDC8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SentMessageSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607F0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D11BDC8();
  sub_25D15B9D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660800);
  sub_25D11BF10((uint64_t)&unk_26A660808);
  OUTLINED_FUNCTION_4_0();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660810);
    sub_25D11BF10((uint64_t)&unk_26A660818);
    OUTLINED_FUNCTION_4_0();
    type metadata accessor for SentMessageSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    sub_25D11BF50((uint64_t)&unk_26A660820);
    OUTLINED_FUNCTION_3_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
    sub_25D11BE14((uint64_t)&unk_26A660828);
    OUTLINED_FUNCTION_3_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
    sub_25D11BFB4((uint64_t)&unk_26A660830);
    sub_25D15B880();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t SentMessageSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v5;
  uint64_t v29 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5_0();
  uint64_t v23 = v6;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v7;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5_0();
  uint64_t v24 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v10;
  uint64_t v27 = v9;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5_0();
  uint64_t v25 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660848);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6_0();
  uint64_t v12 = type metadata accessor for SentMessageSnippetModel();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6_0();
  uint64_t v15 = (id *)(v14 - v13);
  *uint64_t v15 = 0;
  v15[1] = 0;
  uint64_t v17 = v14 - v13 + *(int *)(v16 + 28);
  LOBYTE(v33[0]) = 0;
  uint64_t v31 = v17;
  sub_25D15B2E0();
  uint64_t v18 = (char *)v15 + *(int *)(v12 + 32);
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  memcpy(v34, &qword_26A660E80, 0xE0uLL);
  memcpy(v33, &qword_26A660E80, sizeof(v33));
  sub_25D11BCD0((uint64_t)v34);
  sub_25D15B2E0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D11BDC8();
  sub_25D15B9B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v18, v29);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660800);
    char v35 = 0;
    sub_25D11BF10((uint64_t)&unk_26A660850);
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_7_0();
    *uint64_t v15 = (id)v33[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660810);
    char v35 = 1;
    sub_25D11BF10((uint64_t)&unk_26A660858);
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_7_0();
    v15[1] = (id)v33[0];
    LOBYTE(v33[0]) = 2;
    sub_25D11BF50((uint64_t)&unk_26A660860);
    OUTLINED_FUNCTION_7_0();
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))((char *)v15 + *(int *)(v12 + 24), v25, v27);
    LOBYTE(v33[0]) = 3;
    sub_25D11BE14((uint64_t)&unk_26A660868);
    OUTLINED_FUNCTION_7_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 40))(v31, v24, v30);
    LOBYTE(v33[0]) = 4;
    sub_25D11BFB4((uint64_t)&unk_26A660870);
    OUTLINED_FUNCTION_7_0();
    uint64_t v19 = OUTLINED_FUNCTION_2_0();
    v20(v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 40))(v18, v23, v29);
    sub_25D11C020((uint64_t)v15, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25D11C084((uint64_t)v15);
  }
}

uint64_t sub_25D11BCA0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SentMessageSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_25D11BCB8(void *a1)
{
  return SentMessageSnippetModel.encode(to:)(a1);
}

uint64_t sub_25D11BCD0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25D11BDC8()
{
  unint64_t result = qword_26A6607F8;
  if (!qword_26A6607F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6607F8);
  }
  return result;
}

unint64_t sub_25D11BE14(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_8(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6607E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25D11BE78()
{
  unint64_t result = qword_26A660838;
  if (!qword_26A660838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660838);
  }
  return result;
}

unint64_t sub_25D11BEC4()
{
  unint64_t result = qword_26A660840;
  if (!qword_26A660840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660840);
  }
  return result;
}

unint64_t sub_25D11BF10(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_8(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25D11BF50(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_8(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6607D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25D11BFB4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_8(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6607E8);
    sub_25D11BE78();
    sub_25D11BEC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25D11C020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SentMessageSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D11C084(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SentMessageSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25D11C0E0()
{
  return sub_25D11C148((uint64_t)&unk_26A660878);
}

unint64_t sub_25D11C114()
{
  return sub_25D11C148((uint64_t)&unk_26A660880);
}

unint64_t sub_25D11C148(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_8(a1);
  if (!result)
  {
    type metadata accessor for SentMessageSnippetModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

id sub_25D11C188()
{
  OUTLINED_FUNCTION_11();
  id result = SentMessageSnippetModel.intent.getter();
  void *v0 = result;
  return result;
}

void *sub_25D11C1B4()
{
  OUTLINED_FUNCTION_11();
  id result = SentMessageSnippetModel.intentResponse.getter();
  void *v0 = result;
  return result;
}

uint64_t sub_25D11C1E0()
{
  OUTLINED_FUNCTION_11();
  uint64_t result = SentMessageSnippetModel.contactName.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25D11C20C()
{
  OUTLINED_FUNCTION_11();
  uint64_t result = SentMessageSnippetModel.shouldConfirmUnsend.getter();
  unsigned char *v0 = result & 1;
  return result;
}

uint64_t sub_25D11C238()
{
  return SentMessageSnippetModel.shouldConfirmUnsend.setter();
}

void *sub_25D11C260@<X0>(void *a1@<X8>)
{
  SentMessageSnippetModel.labels.getter();
  return memcpy(a1, v3, 0xE0uLL);
}

char *initializeBufferWithCopyOfBuffer for SentMessageSnippetModel(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    *((void *)a1 + 1) = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = v5;
    uint64_t v13 = v8;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
    uint64_t v15 = a3[7];
    uint64_t v16 = &a1[v15];
    uint64_t v17 = (uint64_t)a2 + v15;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = a3[8];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = (uint64_t)a2 + v19;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  }
  return a1;
}

uint64_t destroy for SentMessageSnippetModel(id *a1, int *a2)
{
  int v4 = (char *)a1 + a2[6];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (char *)a1 + a2[7];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = (char *)a1 + a2[8];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *initializeWithCopy for SentMessageSnippetModel(void *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v9, v10, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  return a1;
}

uint64_t assignWithCopy for SentMessageSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v10;
  id v11 = v10;

  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

_OWORD *initializeWithTake for SentMessageSnippetModel(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  id v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for SentMessageSnippetModel(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for SentMessageSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D11CA38);
}

uint64_t sub_25D11CA38(uint64_t *a1, uint64_t a2, int *a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    OUTLINED_FUNCTION_1_1();
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = a3[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
      OUTLINED_FUNCTION_1_1();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v11 = v13;
        uint64_t v12 = a3[7];
      }
      else
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        uint64_t v12 = a3[8];
      }
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for SentMessageSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D11CB34);
}

void *sub_25D11CB34(void *result, uint64_t a2, int a3, int *a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    OUTLINED_FUNCTION_1_1();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
      OUTLINED_FUNCTION_1_1();
      if (*(_DWORD *)(v13 + 84) == a3)
      {
        uint64_t v10 = v12;
        uint64_t v11 = a4[7];
      }
      else
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        uint64_t v11 = a4[8];
      }
    }
    return (void *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_25D11CC0C()
{
  sub_25D11CD4C(319, &qword_26A660898);
  if (v0 <= 0x3F)
  {
    sub_25D11CD4C(319, &qword_26A6608A0);
    if (v1 <= 0x3F)
    {
      sub_25D11CD4C(319, &qword_26A6608A8);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_25D11CD4C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_25D15B320();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for SentMessageSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SentMessageSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D11CEE8);
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

ValueMetadata *type metadata accessor for SentMessageSnippetModel.CodingKeys()
{
  return &type metadata for SentMessageSnippetModel.CodingKeys;
}

unint64_t sub_25D11CF24()
{
  unint64_t result = qword_26A6608B0;
  if (!qword_26A6608B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6608B0);
  }
  return result;
}

unint64_t sub_25D11CF74()
{
  unint64_t result = qword_26A6608B8;
  if (!qword_26A6608B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6608B8);
  }
  return result;
}

unint64_t sub_25D11CFC4()
{
  unint64_t result = qword_26A6608C0;
  if (!qword_26A6608C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6608C0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_25D15B880();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_25D15B880();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_25D15B7F0();
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  void *v1 = a1;
  return type metadata accessor for SentMessageSnippetModel();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

unint64_t AttachmentModel.messageAttachment.getter@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_12();
  sub_25D11D328(v1, v1);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *(void *)(a1 + 24) = type metadata accessor for MapAttachment();
      *(void *)(a1 + 32) = sub_25D11F948(&qword_26A6608D8, (void (*)(uint64_t))type metadata accessor for MapAttachment);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
      unsigned int v4 = type metadata accessor for MapAttachment;
      goto LABEL_7;
    case 2u:
      uint64_t v5 = *(void *)v1;
      char v6 = *(unsigned char *)(v1 + 8);
      *(void *)(a1 + 24) = &type metadata for PhotoAttachment;
      unint64_t result = sub_25D11D3D8();
      goto LABEL_5;
    case 3u:
      uint64_t v5 = *(void *)v1;
      char v6 = *(unsigned char *)(v1 + 8);
      *(void *)(a1 + 24) = &type metadata for VideoAttachment;
      unint64_t result = sub_25D11D38C();
LABEL_5:
      *(void *)(a1 + 32) = result;
      *(void *)a1 = v5;
      *(unsigned char *)(a1 + 8) = v6;
      break;
    default:
      *(void *)(a1 + 24) = type metadata accessor for LinkAttachment();
      *(void *)(a1 + 32) = sub_25D11F948(&qword_26A6608E0, (void (*)(uint64_t))type metadata accessor for LinkAttachment);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
      unsigned int v4 = type metadata accessor for LinkAttachment;
LABEL_7:
      unint64_t result = sub_25D11F5AC(v1, (uint64_t)boxed_opaque_existential_1, (void (*)(void))v4);
      break;
  }
  return result;
}

uint64_t type metadata accessor for AttachmentModel()
{
  uint64_t result = qword_26A6609C0;
  if (!qword_26A6609C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D11D328(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AttachmentModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25D11D38C()
{
  unint64_t result = qword_26A6608C8;
  if (!qword_26A6608C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6608C8);
  }
  return result;
}

unint64_t sub_25D11D3D8()
{
  unint64_t result = qword_26A6608D0;
  if (!qword_26A6608D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6608D0);
  }
  return result;
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

uint64_t AttachmentModel.init(messageAttachment:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for MapAttachment();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_13();
  type metadata accessor for LinkAttachment();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_12();
  sub_25D11D854(a1, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6608E8);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    sub_25D11F5AC(v8, v2, (void (*)(void))type metadata accessor for LinkAttachment);
LABEL_8:
    swift_storeEnumTagMultiPayload();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_25D11F5AC(v2, a2, (void (*)(void))type metadata accessor for AttachmentModel);
    uint64_t v10 = 0;
    return __swift_storeEnumTagSinglePayload(a2, v10, 1, v9);
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    sub_25D11F5AC(v3, v2, (void (*)(void))type metadata accessor for MapAttachment);
    goto LABEL_8;
  }
  if (OUTLINED_FUNCTION_14() || OUTLINED_FUNCTION_14())
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    OUTLINED_FUNCTION_5_1();
    goto LABEL_8;
  }
  if (qword_26A6606E8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25D15B440();
  __swift_project_value_buffer(v12, (uint64_t)qword_26A66E658);
  sub_25D11D854(a1, (uint64_t)v20);
  uint64_t v13 = sub_25D15B420();
  os_log_type_t v14 = sub_25D15B5F0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    swift_getDynamicType();
    uint64_t v17 = sub_25D15BA00();
    sub_25D11EDF4(v17, v18, &v19);
    sub_25D15B650();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    _os_log_impl(&dword_25D115000, v13, v14, "#AttachmentModel unknown message attachment type: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611A5830](v16, -1, -1);
    MEMORY[0x2611A5830](v15, -1, -1);
  }
  else
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  uint64_t v10 = 1;
  return __swift_storeEnumTagSinglePayload(a2, v10, 1, v9);
}

uint64_t sub_25D11D854(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25D11D8B8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x617474416B6E696CLL && a2 == 0xEE00746E656D6863;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x636174744170616DLL && a2 == 0xED0000746E656D68;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7474416F746F6870 && a2 == 0xEF746E656D686361;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x7474416F65646976 && a2 == 0xEF746E656D686361)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_25D15B8C0();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_25D11DAA8()
{
  return 4;
}

uint64_t sub_25D11DAB0(char a1)
{
  return *(void *)&aLinkattamapatt[8 * a1];
}

uint64_t sub_25D11DAD0()
{
  return 1;
}

uint64_t sub_25D11DAD8()
{
  return sub_25D15B980();
}

uint64_t sub_25D11DB00()
{
  return 12383;
}

uint64_t sub_25D11DB0C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25D11DB7C()
{
  return sub_25D15B990();
}

uint64_t sub_25D11DBC0()
{
  return sub_25D11DAB0(*v0);
}

uint64_t sub_25D11DBC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D11D8B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D11DBF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D11DAA8();
  *a1 = result;
  return result;
}

uint64_t sub_25D11DC18(uint64_t a1)
{
  unint64_t v2 = sub_25D11F60C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D11DC54(uint64_t a1)
{
  unint64_t v2 = sub_25D11F60C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D11DC94()
{
  return sub_25D11DB7C();
}

uint64_t sub_25D11DCB8(uint64_t a1)
{
  unint64_t v2 = sub_25D11F7D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D11DCF4(uint64_t a1)
{
  unint64_t v2 = sub_25D11F7D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D11DD30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D11DB0C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D11DD5C()
{
  return sub_25D11832C();
}

uint64_t sub_25D11DD78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D11DAD0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25D11DDA4(uint64_t a1)
{
  unint64_t v2 = sub_25D11F788();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D11DDE0(uint64_t a1)
{
  unint64_t v2 = sub_25D11F788();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D11DE1C(uint64_t a1)
{
  unint64_t v2 = sub_25D11F6F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D11DE58(uint64_t a1)
{
  unint64_t v2 = sub_25D11F6F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D11DE94()
{
  return sub_25D15B990();
}

uint64_t sub_25D11DED4(uint64_t a1)
{
  unint64_t v2 = sub_25D11F658();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D11DF10(uint64_t a1)
{
  unint64_t v2 = sub_25D11F658();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AttachmentModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6608F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6608F8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_7_1(v5, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660900);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_8_0(v7, v34);
  type metadata accessor for MapAttachment();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_6_1(v9, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660908);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_9_0();
  type metadata accessor for LinkAttachment();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = v13 - v12;
  type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_6_0();
  uint64_t v18 = v17 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660910);
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_13();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D11F60C();
  sub_25D15B9D0();
  sub_25D11D328(v38, v18);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v21 = type metadata accessor for MapAttachment;
      uint64_t v14 = v36;
      sub_25D11F5AC(v18, v36, (void (*)(void))type metadata accessor for MapAttachment);
      sub_25D11F788();
      OUTLINED_FUNCTION_16();
      sub_25D11F948(&qword_26A660948, (void (*)(uint64_t))type metadata accessor for MapAttachment);
      sub_25D15B880();
      goto LABEL_6;
    case 2u:
      sub_25D11F6F0();
      OUTLINED_FUNCTION_10_0();
      sub_25D11F73C();
      sub_25D15B880();
      OUTLINED_FUNCTION_2_1();
      v23(v22);
      OUTLINED_FUNCTION_2_1();
      v25(v24);
      uint64_t result = swift_release();
      break;
    case 3u:
      sub_25D11F658();
      OUTLINED_FUNCTION_10_0();
      sub_25D11F6A4();
      sub_25D15B880();
      OUTLINED_FUNCTION_2_1();
      v28(v27);
      OUTLINED_FUNCTION_2_1();
      v30(v29);
      uint64_t result = swift_release();
      break;
    default:
      uint64_t v21 = type metadata accessor for LinkAttachment;
      sub_25D11F5AC(v18, v14, (void (*)(void))type metadata accessor for LinkAttachment);
      sub_25D11F7D4();
      OUTLINED_FUNCTION_16();
      sub_25D11F948(&qword_26A660958, (void (*)(uint64_t))type metadata accessor for LinkAttachment);
      sub_25D15B880();
LABEL_6:
      OUTLINED_FUNCTION_2_1();
      v32(v31);
      sub_25D11FF48(v14, (void (*)(void))v21);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v1, v18);
      break;
  }
  return result;
}

uint64_t AttachmentModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660960);
  OUTLINED_FUNCTION_0();
  uint64_t v73 = v5;
  uint64_t v74 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_7_1(v6, v63[0]);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660968);
  OUTLINED_FUNCTION_0();
  uint64_t v71 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_8_0(v8, v63[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660970);
  OUTLINED_FUNCTION_0();
  uint64_t v69 = v10;
  uint64_t v70 = v9;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_5_0();
  uint64_t v72 = v11;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660978);
  OUTLINED_FUNCTION_0();
  uint64_t v67 = v12;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_6_1(v13, v63[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660980);
  OUTLINED_FUNCTION_0();
  uint64_t v76 = v15;
  uint64_t v77 = v14;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_9_0();
  uint64_t v79 = type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_1_2();
  uint64_t v16 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v18 = (char *)v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)v63 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)v63 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)v63 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v63 - v28;
  uint64_t v30 = a1[3];
  v80 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v30);
  sub_25D11F60C();
  uint64_t v31 = v82;
  sub_25D15B9B0();
  if (v31) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
  }
  v64 = v27;
  v63[1] = (uint64_t)v21;
  v65 = v24;
  v63[2] = (uint64_t)v18;
  uint64_t v32 = v79;
  v66 = v29;
  uint64_t v33 = v77;
  uint64_t v34 = sub_25D15B800();
  uint64_t v35 = *(void *)(v34 + 16);
  if (!v35
    || (uint64_t v82 = 0,
        uint64_t v36 = *(unsigned __int8 *)(v34 + 32),
        sub_25D120AB4(1, v35, v34, v34 + 32, 0, (2 * v35) | 1),
        uint64_t v38 = v37,
        unint64_t v40 = v39,
        swift_bridgeObjectRelease(),
        v38 != v40 >> 1))
  {
    uint64_t v43 = sub_25D15B720();
    swift_allocError();
    v45 = v44;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660988);
    uint64_t *v45 = v32;
    sub_25D15B790();
    sub_25D15B710();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v43 - 8) + 104))(v45, *MEMORY[0x263F8DCB0], v43);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v2, v33);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
  }
  uint64_t v41 = v75;
  switch(v36)
  {
    case 1:
      LOBYTE(v81) = 1;
      sub_25D11F788();
      OUTLINED_FUNCTION_3_1();
      type metadata accessor for MapAttachment();
      sub_25D11F948(&qword_26A6609A0, (void (*)(uint64_t))type metadata accessor for MapAttachment);
      uint64_t v42 = (uint64_t)v65;
      sub_25D15B7F0();
      uint64_t v82 = 0;
      OUTLINED_FUNCTION_2_1();
      v51();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_2_1();
      v52();
      goto LABEL_11;
    case 2:
      LOBYTE(v81) = 2;
      sub_25D11F6F0();
      OUTLINED_FUNCTION_3_1();
      sub_25D11F86C();
      sub_25D15B7F0();
      uint64_t v46 = v76;
      uint64_t v82 = 0;
      OUTLINED_FUNCTION_2_1();
      v53();
      swift_unknownObjectRelease();
      uint64_t v54 = OUTLINED_FUNCTION_4_1();
      v55(v54);
      OUTLINED_FUNCTION_17(v81);
      swift_storeEnumTagMultiPayload();
      uint64_t v56 = v46;
      goto LABEL_12;
    case 3:
      LOBYTE(v81) = 3;
      sub_25D11F658();
      OUTLINED_FUNCTION_3_1();
      sub_25D11F820();
      sub_25D15B7F0();
      uint64_t v48 = v76;
      uint64_t v82 = 0;
      uint64_t v57 = OUTLINED_FUNCTION_18();
      v58(v57);
      swift_unknownObjectRelease();
      uint64_t v59 = OUTLINED_FUNCTION_4_1();
      v60(v59);
      OUTLINED_FUNCTION_17(v81);
      swift_storeEnumTagMultiPayload();
      uint64_t v61 = v48;
      uint64_t v62 = (uint64_t)v66;
      sub_25D11F5AC(v61, (uint64_t)v66, (void (*)(void))type metadata accessor for AttachmentModel);
      uint64_t v41 = v75;
      goto LABEL_13;
    default:
      LOBYTE(v81) = 0;
      sub_25D11F7D4();
      OUTLINED_FUNCTION_3_1();
      type metadata accessor for LinkAttachment();
      sub_25D11F948(&qword_26A6609A8, (void (*)(uint64_t))type metadata accessor for LinkAttachment);
      uint64_t v42 = (uint64_t)v64;
      sub_25D15B7F0();
      uint64_t v82 = 0;
      OUTLINED_FUNCTION_2_1();
      v49();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_2_1();
      v50();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      uint64_t v56 = v42;
LABEL_12:
      uint64_t v62 = (uint64_t)v66;
      sub_25D11F5AC(v56, (uint64_t)v66, (void (*)(void))type metadata accessor for AttachmentModel);
LABEL_13:
      sub_25D11F5AC(v62, v41, (void (*)(void))type metadata accessor for AttachmentModel);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
      break;
  }
  return result;
}

uint64_t sub_25D11ED8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AttachmentModel.init(from:)(a1, a2);
}

uint64_t sub_25D11EDA4(void *a1)
{
  return AttachmentModel.encode(to:)(a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25D11EDF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25D11EEC8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25D120B30((uint64_t)v12, *a3);
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
      sub_25D120B30((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25D11EEC8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25D11F020((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25D15B660();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25D11F0F8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25D15B730();
    if (!v8)
    {
      uint64_t result = sub_25D15B740();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_25D11F020(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25D15B760();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25D11F0F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25D11F190(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25D11F36C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25D11F36C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25D11F190(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25D15B500();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_25D11F304(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25D15B6F0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25D15B760();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25D15B740();
  __break(1u);
  return result;
}

void *sub_25D11F304(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A48);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25D11F36C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A48);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25D11F51C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25D11F444(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25D11F444(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25D15B760();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25D11F51C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25D15B760();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_25D11F5AC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_25D11F60C()
{
  unint64_t result = qword_26A660918;
  if (!qword_26A660918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660918);
  }
  return result;
}

unint64_t sub_25D11F658()
{
  unint64_t result = qword_26A660920;
  if (!qword_26A660920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660920);
  }
  return result;
}

unint64_t sub_25D11F6A4()
{
  unint64_t result = qword_26A660928;
  if (!qword_26A660928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660928);
  }
  return result;
}

unint64_t sub_25D11F6F0()
{
  unint64_t result = qword_26A660930;
  if (!qword_26A660930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660930);
  }
  return result;
}

unint64_t sub_25D11F73C()
{
  unint64_t result = qword_26A660938;
  if (!qword_26A660938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660938);
  }
  return result;
}

unint64_t sub_25D11F788()
{
  unint64_t result = qword_26A660940;
  if (!qword_26A660940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660940);
  }
  return result;
}

unint64_t sub_25D11F7D4()
{
  unint64_t result = qword_26A660950;
  if (!qword_26A660950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660950);
  }
  return result;
}

unint64_t sub_25D11F820()
{
  unint64_t result = qword_26A660990;
  if (!qword_26A660990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660990);
  }
  return result;
}

unint64_t sub_25D11F86C()
{
  unint64_t result = qword_26A660998;
  if (!qword_26A660998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660998);
  }
  return result;
}

uint64_t sub_25D11F8B8()
{
  return sub_25D11F948(&qword_26A6609B0, (void (*)(uint64_t))type metadata accessor for AttachmentModel);
}

uint64_t sub_25D11F900()
{
  return sub_25D11F948(&qword_26A6609B8, (void (*)(uint64_t))type metadata accessor for AttachmentModel);
}

uint64_t sub_25D11F948(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t initializeBufferWithCopyOfBuffer for AttachmentModel(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = v8 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v9 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        uint64_t v10 = type metadata accessor for MapAttachment();
        *(unsigned char *)(a1 + *(int *)(v10 + 20)) = *((unsigned char *)a2 + *(int *)(v10 + 20));
        break;
      case 2u:
      case 3u:
        *(void *)a1 = *a2;
        *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
        swift_retain();
        break;
      default:
        uint64_t v6 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = type metadata accessor for LinkAttachment();
        *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *((unsigned char *)a2 + *(int *)(v7 + 20));
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for AttachmentModel(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      uint64_t v3 = sub_25D15B1C0();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    case 2:
    case 3:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for AttachmentModel(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = sub_25D15B1C0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for MapAttachment();
      *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
      break;
    case 2u:
    case 3u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
      swift_retain();
      break;
    default:
      uint64_t v4 = sub_25D15B1C0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = type metadata accessor for LinkAttachment();
      *(unsigned char *)(a1 + *(int *)(v5 + 20)) = *(unsigned char *)(a2 + *(int *)(v5 + 20));
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for AttachmentModel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25D11FF48(a1, (void (*)(void))type metadata accessor for AttachmentModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v6 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = type metadata accessor for MapAttachment();
        *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
        break;
      case 2u:
      case 3u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
        swift_retain();
        break;
      default:
        uint64_t v4 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        uint64_t v5 = type metadata accessor for LinkAttachment();
        *(unsigned char *)(a1 + *(int *)(v5 + 20)) = *(unsigned char *)(a2 + *(int *)(v5 + 20));
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25D11FF48(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1();
  v3();
  return a1;
}

unsigned char *initializeWithTake for AttachmentModel(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v9 = sub_25D15B1C0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    uint64_t v10 = type metadata accessor for MapAttachment();
    a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = sub_25D15B1C0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for LinkAttachment();
    a1[*(int *)(v8 + 20)] = a2[*(int *)(v8 + 20)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

unsigned char *assignWithTake for AttachmentModel(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25D11FF48((uint64_t)a1, (void (*)(void))type metadata accessor for AttachmentModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      uint64_t v10 = type metadata accessor for MapAttachment();
      a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for LinkAttachment();
      a1[*(int *)(v8 + 20)] = a2[*(int *)(v8 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25D12022C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25D12023C()
{
  uint64_t result = type metadata accessor for LinkAttachment();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for MapAttachment();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AttachmentModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AttachmentModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D120460);
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

ValueMetadata *type metadata accessor for AttachmentModel.CodingKeys()
{
  return &type metadata for AttachmentModel.CodingKeys;
}

uint64_t sub_25D1204A4()
{
  return 0;
}

ValueMetadata *type metadata accessor for AttachmentModel.LinkAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.LinkAttachmentCodingKeys;
}

ValueMetadata *type metadata accessor for AttachmentModel.MapAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.MapAttachmentCodingKeys;
}

ValueMetadata *type metadata accessor for AttachmentModel.PhotoAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.PhotoAttachmentCodingKeys;
}

uint64_t getEnumTagSinglePayload for SecurityScopedURL.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *_s18SiriMessagesCommon15AttachmentModelO24LinkAttachmentCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25D1205C8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttachmentModel.VideoAttachmentCodingKeys()
{
  return &type metadata for AttachmentModel.VideoAttachmentCodingKeys;
}

unint64_t sub_25D120604()
{
  unint64_t result = qword_26A6609D0;
  if (!qword_26A6609D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6609D0);
  }
  return result;
}

unint64_t sub_25D120654()
{
  unint64_t result = qword_26A6609D8;
  if (!qword_26A6609D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6609D8);
  }
  return result;
}

unint64_t sub_25D1206A4()
{
  unint64_t result = qword_26A6609E0;
  if (!qword_26A6609E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6609E0);
  }
  return result;
}

unint64_t sub_25D1206F4()
{
  unint64_t result = qword_26A6609E8;
  if (!qword_26A6609E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6609E8);
  }
  return result;
}

unint64_t sub_25D120744()
{
  unint64_t result = qword_26A6609F0;
  if (!qword_26A6609F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6609F0);
  }
  return result;
}

unint64_t sub_25D120794()
{
  unint64_t result = qword_26A6609F8;
  if (!qword_26A6609F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6609F8);
  }
  return result;
}

unint64_t sub_25D1207E4()
{
  unint64_t result = qword_26A660A00;
  if (!qword_26A660A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A00);
  }
  return result;
}

unint64_t sub_25D120834()
{
  unint64_t result = qword_26A660A08;
  if (!qword_26A660A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A08);
  }
  return result;
}

unint64_t sub_25D120884()
{
  unint64_t result = qword_26A660A10;
  if (!qword_26A660A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A10);
  }
  return result;
}

unint64_t sub_25D1208D4()
{
  unint64_t result = qword_26A660A18;
  if (!qword_26A660A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A18);
  }
  return result;
}

unint64_t sub_25D120924()
{
  unint64_t result = qword_26A660A20;
  if (!qword_26A660A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A20);
  }
  return result;
}

unint64_t sub_25D120974()
{
  unint64_t result = qword_26A660A28;
  if (!qword_26A660A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A28);
  }
  return result;
}

unint64_t sub_25D1209C4()
{
  unint64_t result = qword_26A660A30;
  if (!qword_26A660A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A30);
  }
  return result;
}

unint64_t sub_25D120A14()
{
  unint64_t result = qword_26A660A38;
  if (!qword_26A660A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A38);
  }
  return result;
}

unint64_t sub_25D120A64()
{
  unint64_t result = qword_26A660A40;
  if (!qword_26A660A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A40);
  }
  return result;
}

uint64_t sub_25D120AB4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_25D120B30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_25D15B780();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  char v2 = *(unsigned char *)(v1 - 152);
  *(void *)uint64_t v0 = *(void *)(v1 - 160);
  *(unsigned char *)(v0 + 8) = v2;
  return v0;
}

void OUTLINED_FUNCTION_6_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_7_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_25D15B820();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_25D15B820();
}

uint64_t OUTLINED_FUNCTION_17@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v2 - 256);
  *(void *)uint64_t v3 = a1;
  *(unsigned char *)(v3 + 8) = v1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t sub_25D120D38(uint64_t a1)
{
  uint64_t v2 = sub_25D15B1C0();
  MEMORY[0x270FA5388](v2);
  unsigned int v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_25D120F40((uint64_t)v4);
}

uint64_t sub_25D120E04()
{
  uint64_t v1 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_0();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = v0 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  OUTLINED_FUNCTION_5_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v7, v8, v1);
  sub_25D15B180();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
}

uint64_t sub_25D120ED0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  OUTLINED_FUNCTION_5_2();
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_25D120F40(uint64_t a1)
{
  sub_25D120E04();
  uint64_t v3 = v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, a1);
  return swift_endAccess();
}

void (*sub_25D120FC4(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_25D15B1C0();
  v3[10] = v4;
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  v3[11] = v5;
  size_t v8 = *(void *)(v7 + 64);
  v3[12] = malloc(v8);
  uint64_t v9 = malloc(v8);
  uint64_t v10 = OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  v3[13] = v9;
  v3[14] = v10;
  uint64_t v11 = v1 + v10;
  OUTLINED_FUNCTION_5_2();
  uint64_t v12 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 16);
  v3[15] = v12;
  v3[16] = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v12(v9, v11, v4);
  return sub_25D1210B0;
}

void sub_25D1210B0(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(*a1 + 104);
  uint64_t v5 = *(void *)(*a1 + 88);
  uint64_t v4 = *(void **)(*a1 + 96);
  uint64_t v6 = *(void *)(*a1 + 80);
  uint64_t v7 = *(void *)(v2 + 72) + *(void *)(v2 + 112);
  if (a2)
  {
    (*(void (**)(void, void, void))(v2 + 120))(*(void *)(v2 + 96), *(void *)(v2 + 104), *(void *)(v2 + 80));
    sub_25D120E04();
    OUTLINED_FUNCTION_6_2();
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v4, v6);
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
  }
  else
  {
    sub_25D120E04();
    OUTLINED_FUNCTION_6_2();
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v3, v6);
    swift_endAccess();
  }
  free(v3);
  free(v4);

  free((void *)v2);
}

uint64_t SecurityScopedURL.__allocating_init(wrappedValue:)()
{
  uint64_t v0 = swift_allocObject();
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = OUTLINED_FUNCTION_8_1();
  v2(v1);
  return v0;
}

uint64_t SecurityScopedURL.init(wrappedValue:)()
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  uint64_t v1 = OUTLINED_FUNCTION_8_1();
  v2(v1);
  return v0;
}

uint64_t sub_25D121298(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6B72616D6B6F6F62 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25D121320()
{
  return 0x6B72616D6B6F6F62;
}

uint64_t sub_25D121340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D121298(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D12136C(uint64_t a1)
{
  unint64_t v2 = sub_25D1216DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1213A8(uint64_t a1)
{
  unint64_t v2 = sub_25D1216DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SecurityScopedURL.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  SecurityScopedURL.init(from:)(a1);
  return v2;
}

uint64_t SecurityScopedURL.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A50);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_3_2();
  uint64_t v5 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v16 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A58);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1216DC();
  sub_25D15B9B0();
  if (v1)
  {
    uint64_t v15 = v19;
    type metadata accessor for SecurityScopedURL();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_25D121770();
    sub_25D15B7F0();
    __swift_storeEnumTagSinglePayload(v2, 1, 1, v5);
    sub_25D15B160();
    sub_25D1217BC(v17, v18);
    sub_25D121814(v2);
    uint64_t v13 = OUTLINED_FUNCTION_7_2();
    v14(v13);
    uint64_t v15 = v19;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue, v10, v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v15;
}

unint64_t sub_25D1216DC()
{
  unint64_t result = qword_26A660A60;
  if (!qword_26A660A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A60);
  }
  return result;
}

uint64_t type metadata accessor for SecurityScopedURL()
{
  uint64_t result = qword_26A660A80;
  if (!qword_26A660A80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25D121770()
{
  unint64_t result = qword_26A660A68;
  if (!qword_26A660A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A68);
  }
  return result;
}

uint64_t sub_25D1217BC(uint64_t a1, unint64_t a2)
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

uint64_t sub_25D121814(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D121874(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A50);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_2();
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A70);
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6_0();
  uint64_t v17 = v16 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1216DC();
  sub_25D15B9D0();
  uint64_t v18 = v3 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v2, v18, v9);
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  uint64_t v19 = sub_25D15B130();
  if (v28)
  {
    sub_25D121814(v8);
    uint64_t v21 = OUTLINED_FUNCTION_4_2();
    v22(v21);
  }
  else
  {
    uint64_t v24 = v19;
    unint64_t v25 = v20;
    sub_25D121814(v8);
    uint64_t v26 = OUTLINED_FUNCTION_4_2();
    v27(v26);
    sub_25D121AD4();
    sub_25D15B880();
    sub_25D1217BC(v24, v25);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v17, v30);
}

unint64_t sub_25D121AD4()
{
  unint64_t result = qword_26A660A78;
  if (!qword_26A660A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A78);
  }
  return result;
}

uint64_t SecurityScopedURL.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  OUTLINED_FUNCTION_5_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v8, v9, v2);
  sub_25D15B180();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v10(v8, v2);
  v10(v9, v2);
  return v1;
}

uint64_t SecurityScopedURL.__deallocating_deinit()
{
  SecurityScopedURL.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25D121C64@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = SecurityScopedURL.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25D121C90(void *a1)
{
  return sub_25D121874(a1);
}

uint64_t sub_25D121CB4@<X0>(uint64_t a1@<X8>)
{
  return sub_25D120ED0(a1);
}

uint64_t sub_25D121CDC()
{
  return type metadata accessor for SecurityScopedURL();
}

uint64_t sub_25D121CE4()
{
  uint64_t result = sub_25D15B1C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SecurityScopedURL(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SecurityScopedURL);
}

uint64_t dispatch thunk of SecurityScopedURL.wrappedValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of SecurityScopedURL.wrappedValue.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of SecurityScopedURL.wrappedValue.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of SecurityScopedURL.__allocating_init(wrappedValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SecurityScopedURL.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SecurityScopedURL.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

unsigned char *storeEnumTagSinglePayload for SecurityScopedURL.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25D121F08);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SecurityScopedURL.CodingKeys()
{
  return &type metadata for SecurityScopedURL.CodingKeys;
}

unint64_t sub_25D121F44()
{
  unint64_t result = qword_26A660A90;
  if (!qword_26A660A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A90);
  }
  return result;
}

unint64_t sub_25D121F94()
{
  unint64_t result = qword_26A660A98;
  if (!qword_26A660A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660A98);
  }
  return result;
}

unint64_t sub_25D121FE4()
{
  unint64_t result = qword_26A660AA0;
  if (!qword_26A660AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660AA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return v0;
}

uint64_t static SAAppInfo.isFirstPartyApp(appId:)()
{
  return sub_25D15B510();
}

id SAAppInfo.isFirstParty.getter()
{
  id result = objc_msgSend(v0, sel_appIdentifyingInfo);
  if (result)
  {
    id result = (id)sub_25D122728(result);
    if (v2)
    {
      OUTLINED_FUNCTION_1_3();
      char v3 = sub_25D15B510();
      swift_bridgeObjectRelease();
      return (id)(v3 & 1);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *SAAppInfo.getNameForDisplay(locale:)()
{
  unint64_t v1 = v0;
  v22[0] = sub_25D15B240();
  v22[1] = v2;
  sub_25D122798();
  char v3 = v22;
  uint64_t v4 = sub_25D15B670();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_25D1227E4(v1, (SEL *)&selRef_displayAppName);
  if (v8)
  {
    char v3 = (void *)v7;
  }
  else
  {
    uint64_t v9 = sub_25D122844(v1, (SEL *)&selRef_displayAppNameMap);
    if (v9)
    {
      uint64_t v10 = v9;
      swift_bridgeObjectRetain();
      char v3 = (void *)sub_25D122354(v4, v6, v10);
      uint64_t v12 = v11;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_8;
      }
    }
    uint64_t v13 = sub_25D1227E4(v1, (SEL *)&selRef_appName);
    if (v14)
    {
      char v3 = (void *)v13;
    }
    else
    {
      uint64_t v16 = sub_25D122844(v1, (SEL *)&selRef_appNameMap);
      if (!v16
        || (uint64_t v17 = v16,
            swift_bridgeObjectRetain(),
            char v3 = (void *)sub_25D122354(v4, v6, v17),
            uint64_t v19 = v18,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            !v19))
      {
        sub_25D1227E4(v1, (SEL *)&selRef_spotlightName);
        if (v20)
        {
          OUTLINED_FUNCTION_0_1();
          goto LABEL_8;
        }
        uint64_t v21 = sub_25D122844(v1, (SEL *)&selRef_spotlightNameMap);
        if (!v21)
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          return 0;
        }
        sub_25D122354(v4, v6, v21);
        OUTLINED_FUNCTION_0_1();
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_8:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_25D122354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_25D1224C0(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

double sub_25D1223AC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_25D122538(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_25D120B30(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id SAAppInfo.init(appIdentifier:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (a2)
  {
    id v5 = objc_allocWithZone(MEMORY[0x263F64E58]);
    id v6 = v4;
    id v7 = objc_msgSend(v5, sel_init);
    sub_25D1228A4(a1, a2, v7);
    objc_msgSend(v6, sel_setAppIdentifyingInfo_, v7);
  }
  return v4;
}

unint64_t sub_25D1224C0(uint64_t a1, uint64_t a2)
{
  sub_25D15B970();
  sub_25D15B4E0();
  uint64_t v4 = sub_25D15B990();

  return sub_25D12257C(a1, a2, v4);
}

unint64_t sub_25D122538(uint64_t a1)
{
  uint64_t v2 = sub_25D15B690();

  return sub_25D122660(a1, v2);
}

unint64_t sub_25D12257C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25D15B8C0() & 1) == 0)
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
      while (!v14 && (sub_25D15B8C0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25D122660(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25D122908(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2611A4ED0](v9, a1);
      sub_25D122964((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_25D122728(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleId);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25D15B4A0();

  return v3;
}

unint64_t sub_25D122798()
{
  unint64_t result = qword_26A660AA8;
  if (!qword_26A660AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660AA8);
  }
  return result;
}

uint64_t sub_25D1227E4(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_25D15B4A0();

  return v4;
}

uint64_t sub_25D122844(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_25D15B460();

  return v4;
}

void sub_25D1228A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25D15B490();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setBundleId_, v4);
}

uint64_t sub_25D122908(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25D122964(uint64_t a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_25D1229F4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id static AnnounceMessageUtils.bloopSoundCommand()()
{
  uint64_t v0 = sub_25D15B220();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AnnounceMessageUtils.Dummy();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64FD8]), sel_init);
  sub_25D15B210();
  uint64_t v7 = sub_25D15B200();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_25D122C0C(v7, v9, v6);

  sub_25D122C70(0x3367734D746E6553, 0xE900000000000070, 7758199, 0xE300000000000000, v5);
  if (v10)
  {
    BOOL v11 = (void *)sub_25D15B490();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v11 = 0;
  }
  objc_msgSend(v6, sel_setItemURL_, v11);

  sub_25D122D2C();
  uint64_t v12 = (void *)sub_25D15B610();
  objc_msgSend(v6, sel_setVolume_, v12);

  return v6;
}

uint64_t type metadata accessor for AnnounceMessageUtils.Dummy()
{
  return self;
}

void sub_25D122C0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25D15B490();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);
}

uint64_t sub_25D122C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (void *)sub_25D15B490();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_25D15B490();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_pathForResource_ofType_, v6, v7);

  if (!v8) {
    return 0;
  }
  uint64_t v9 = sub_25D15B4A0();

  return v9;
}

unint64_t sub_25D122D2C()
{
  unint64_t result = qword_26A660AB0;
  if (!qword_26A660AB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A660AB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnnounceMessageUtils()
{
  return &type metadata for AnnounceMessageUtils;
}

uint64_t PatternExecutionResult.asDialogExecutionResult()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3A1D8]), sel_init);
  id v2 = objc_msgSend(v0, sel_meta);
  sub_25D15B460();

  uint64_t v3 = (void *)sub_25D15B450();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setMeta_, v3);

  id v4 = objc_msgSend(v0, sel_patternId);
  if (!v4)
  {
    sub_25D15B4A0();
    id v4 = (id)sub_25D15B490();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v1, sel_setCatId_, v4);

  uint64_t v31 = MEMORY[0x263F8EE78];
  id v5 = objc_msgSend(v0, sel_dialog);
  sub_25D1232A0(0, &qword_26A660AB8);
  unint64_t v6 = sub_25D15B560();

  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_5;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    sub_25D1232A0(0, &qword_26A660AC0);
    uint64_t v30 = (void *)sub_25D15B550();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setDialog_, v30);

    return (uint64_t)v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25D15B750();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_25;
  }
LABEL_5:
  uint64_t result = sub_25D1232A0(0, (unint64_t *)&qword_26A660AB0);
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x2611A4F30](v9, v6);
      }
      else {
        id v10 = *(id *)(v6 + 8 * v9 + 32);
      }
      BOOL v11 = v10;
      id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3A1D0]), sel_init);
      id v13 = objc_msgSend(v11, sel_dialogId);
      uint64_t v14 = v13;
      if (!v13)
      {
        sub_25D15B4A0();
        sub_25D15B490();
        id v13 = (id)OUTLINED_FUNCTION_1_4();
      }
      OUTLINED_FUNCTION_0_2((uint64_t)v13, sel_setId_);

      id v15 = objc_msgSend(v11, sel_fullPrint);
      uint64_t v16 = v15;
      if (!v15)
      {
        sub_25D15B4A0();
        sub_25D15B490();
        id v15 = (id)OUTLINED_FUNCTION_1_4();
      }
      OUTLINED_FUNCTION_0_2((uint64_t)v15, sel_setFullPrint_);

      objc_msgSend(v12, sel_setIsApprovedForGrading_, objc_msgSend(v11, sel_isApprovedForGrading));
      id v17 = objc_msgSend(v11, sel_printOnly);
      uint64_t v18 = (void *)sub_25D15B620();
      char v19 = sub_25D15B630();

      objc_msgSend(v12, sel_setPrintOnly_, v19 & 1);
      id v20 = objc_msgSend(v11, sel_fullSpeak);
      uint64_t v21 = v20;
      if (!v20)
      {
        sub_25D15B4A0();
        sub_25D15B490();
        id v20 = (id)OUTLINED_FUNCTION_1_4();
      }
      OUTLINED_FUNCTION_0_2((uint64_t)v20, sel_setFullSpeak_);

      id v22 = objc_msgSend(v11, sel_spokenOnly);
      uint64_t v23 = (void *)sub_25D15B620();
      char v24 = sub_25D15B630();

      objc_msgSend(v12, sel_setSpokenOnly_, v24 & 1);
      id v25 = objc_msgSend(v11, sel_supportingPrint);
      uint64_t v26 = v25;
      if (!v25)
      {
        sub_25D15B4A0();
        sub_25D15B490();
        id v25 = (id)OUTLINED_FUNCTION_1_4();
      }
      OUTLINED_FUNCTION_0_2((uint64_t)v25, sel_setSupportingPrint_);

      id v27 = objc_msgSend(v11, sel_supportingSpeak);
      uint64_t v28 = v27;
      if (!v27)
      {
        sub_25D15B4A0();
        sub_25D15B490();
        id v27 = (id)OUTLINED_FUNCTION_1_4();
      }
      OUTLINED_FUNCTION_0_2((uint64_t)v27, sel_setSupportingSpeak_);

      id v29 = v12;
      MEMORY[0x2611A4D70]();
      if (*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25D15B580();
      }
      ++v9;
      sub_25D15B590();
      sub_25D15B570();
    }
    while (v7 != v9);
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_25D1232A0(uint64_t a1, unint64_t *a2)
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

id OUTLINED_FUNCTION_0_2(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t AutoSendableCarPlayButton.init(shouldAutoSend:autoSendTimeout:delayedActionCancelCommand:handleIntent:speechSynthesisId:isFirstPartyApp:responseMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v18 = unk_26A660EB8;
  *(void *)(a8 + 48) = qword_26A660EB0;
  *(void *)(a8 + 56) = v18;
  uint64_t v19 = a8 + *(int *)(type metadata accessor for AutoSendableCarPlayButton() + 44);
  uint64_t v20 = sub_25D15B360();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *(unsigned char *)a8 = a1 & 1;
  *(double *)(a8 + 8) = a9;
  *(void *)(a8 + 16) = a2;
  *(void *)(a8 + 24) = a3;
  *(void *)(a8 + 32) = a4;
  *(void *)(a8 + 40) = a5;
  *(unsigned char *)(a8 + 64) = a6 & 1;
  swift_bridgeObjectRetain();
  return sub_25D118D9C(a7, v19);
}

void AutoSendableCarPlayButton.delayedActionCancelCommand.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

void AutoSendableCarPlayButton.handleIntent.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t AutoSendableCarPlayButton.shouldAutoSend.getter()
{
  return *v0;
}

uint64_t AutoSendableCarPlayButton.shouldAutoSend.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*AutoSendableCarPlayButton.shouldAutoSend.modify())()
{
  return nullsub_1;
}

double AutoSendableCarPlayButton.autoSendTimeout.getter()
{
  return *(double *)(v0 + 8);
}

void AutoSendableCarPlayButton.autoSendTimeout.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*AutoSendableCarPlayButton.autoSendTimeout.modify())()
{
  return nullsub_1;
}

void *AutoSendableCarPlayButton.delayedActionCancelCommand.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void sub_25D12350C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  AutoSendableCarPlayButton.delayedActionCancelCommand.setter((uint64_t)v1);
}

void (*AutoSendableCarPlayButton.delayedActionCancelCommand.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117B7C;
}

void *AutoSendableCarPlayButton.handleIntent.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void sub_25D1235B0(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  AutoSendableCarPlayButton.handleIntent.setter((uint64_t)v1);
}

void (*AutoSendableCarPlayButton.handleIntent.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117C98;
}

uint64_t AutoSendableCarPlayButton.speechSynthesisId.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoSendableCarPlayButton.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AutoSendableCarPlayButton.speechSynthesisId.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCarPlayButton.changeLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoSendableCarPlayButton.changeLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AutoSendableCarPlayButton.changeLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCarPlayButton.isFirstPartyApp.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t AutoSendableCarPlayButton.isFirstPartyApp.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 64) = result;
  return result;
}

uint64_t (*AutoSendableCarPlayButton.isFirstPartyApp.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableCarPlayButton.responseMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AutoSendableCarPlayButton() + 44);

  return sub_25D118E48(v3, a1);
}

uint64_t AutoSendableCarPlayButton.responseMode.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AutoSendableCarPlayButton() + 44);

  return sub_25D118D9C(a1, v3);
}

uint64_t (*AutoSendableCarPlayButton.responseMode.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D12383C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7541646C756F6873 && a2 == 0xEE00646E65536F74;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025D162B40 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6E49656C646E6168 && a2 == 0xEC000000746E6574;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x800000025D162B60 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        BOOL v8 = a1 == 0x614C65676E616863 && a2 == 0xEF747865546C6562;
        if (v8 || (sub_25D15B8C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 0x5074737269467369 && a2 == 0xEF70704179747261;
          if (v9 || (sub_25D15B8C0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            char v11 = sub_25D15B8C0();
            swift_bridgeObjectRelease();
            if (v11) {
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

unint64_t sub_25D123BC0(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x646E65536F747561;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6E49656C646E6168;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0x614C65676E616863;
      break;
    case 6:
      unint64_t result = 0x5074737269467369;
      break;
    case 7:
      unint64_t result = 0x65736E6F70736572;
      break;
    default:
      unint64_t result = 0x7541646C756F6873;
      break;
  }
  return result;
}

unint64_t sub_25D123D10()
{
  return sub_25D123BC0(*v0);
}

uint64_t sub_25D123D18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D12383C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D123D40(uint64_t a1)
{
  unint64_t v2 = sub_25D124554();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D123D7C(uint64_t a1)
{
  unint64_t v2 = sub_25D124554();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AutoSendableCarPlayButton.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660AC8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D124554();
  sub_25D15B9D0();
  OUTLINED_FUNCTION_7();
  if (!v1)
  {
    sub_25D15B870();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660738);
    sub_25D119038(&qword_26A660740, &qword_26A660738);
    OUTLINED_FUNCTION_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660748);
    sub_25D119038(&qword_26A660750, &qword_26A660748);
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_5(4);
    sub_25D15B830();
    OUTLINED_FUNCTION_5(5);
    sub_25D15B850();
    OUTLINED_FUNCTION_7();
    type metadata accessor for AutoSendableCarPlayButton();
    sub_25D15B360();
    sub_25D124748(&qword_26A660758, MEMORY[0x263F75718]);
    sub_25D15B840();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t AutoSendableCarPlayButton.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
  MEMORY[0x270FA5388](v4 - 8);
  char v24 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660AD8);
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v7;
  uint64_t v26 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = type metadata accessor for AutoSendableCarPlayButton();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4();
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v9 = unk_26A660EB8;
  *(void *)(v2 + 48) = qword_26A660EB0;
  *(void *)(v2 + 56) = v9;
  uint64_t v10 = v2 + *(int *)(v8 + 44);
  uint64_t v11 = sub_25D15B360();
  uint64_t v27 = v10;
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D124554();
  swift_bridgeObjectRetain();
  uint64_t v12 = v28;
  sub_25D15B9B0();
  if (v12)
  {
    uint64_t v13 = v27;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_25D118FD8(v13);
  }
  else
  {
    uint64_t v28 = v9;
    LOBYTE(v30) = 0;
    *(unsigned char *)uint64_t v2 = sub_25D15B7D0() & 1;
    LOBYTE(v30) = 1;
    sub_25D15B7E0();
    *(void *)(v2 + 8) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660738);
    char v29 = 2;
    sub_25D119038(&qword_26A660768, &qword_26A660738);
    OUTLINED_FUNCTION_2();
    *(void *)(v2 + 16) = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660748);
    char v29 = 3;
    sub_25D119038(&qword_26A660770, &qword_26A660748);
    OUTLINED_FUNCTION_2();
    *(void *)(v2 + 24) = v30;
    OUTLINED_FUNCTION_3(4);
    *(void *)(v2 + 32) = sub_25D15B7A0();
    *(void *)(v2 + 40) = v16;
    OUTLINED_FUNCTION_3(5);
    uint64_t v17 = sub_25D15B7C0();
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    *(void *)(v2 + 48) = v17;
    *(void *)(v2 + 56) = v19;
    OUTLINED_FUNCTION_3(6);
    *(unsigned char *)(v2 + 64) = sub_25D15B7D0() & 1;
    LOBYTE(v30) = 7;
    sub_25D124748(&qword_26A660778, MEMORY[0x263F75718]);
    uint64_t v20 = (uint64_t)v24;
    sub_25D15B7B0();
    uint64_t v21 = OUTLINED_FUNCTION_6();
    v22(v21);
    sub_25D118D9C(v20, v27);
    sub_25D1245A0(v2, v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25D124604(v2);
  }
}

uint64_t sub_25D1244DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AutoSendableCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_25D1244F4(void *a1)
{
  return AutoSendableCarPlayButton.encode(to:)(a1);
}

uint64_t type metadata accessor for AutoSendableCarPlayButton()
{
  uint64_t result = qword_26A660AF8;
  if (!qword_26A660AF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25D124554()
{
  unint64_t result = qword_26A660AD0;
  if (!qword_26A660AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660AD0);
  }
  return result;
}

uint64_t sub_25D1245A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutoSendableCarPlayButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D124604(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AutoSendableCarPlayButton();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D124660(uint64_t a1)
{
  uint64_t result = sub_25D124748(&qword_26A660AE0, (void (*)(uint64_t))type metadata accessor for AutoSendableCarPlayButton);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25D1246B8()
{
  return sub_25D124748(&qword_26A660AE8, (void (*)(uint64_t))type metadata accessor for AutoSendableCarPlayButton);
}

uint64_t sub_25D124700()
{
  return sub_25D124748(&qword_26A660AF0, (void (*)(uint64_t))type metadata accessor for AutoSendableCarPlayButton);
}

uint64_t sub_25D124748(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_25D124790@<X0>(void *a1@<X8>)
{
  uint64_t result = AutoSendableCarPlayButton.delayedActionCancelCommand.getter();
  *a1 = result;
  return result;
}

void *sub_25D1247C0@<X0>(void *a1@<X8>)
{
  uint64_t result = AutoSendableCarPlayButton.handleIntent.getter();
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AutoSendableCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D124804);
}

uint64_t sub_25D124804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    uint64_t v9 = a1 + *(int *)(a3 + 44);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AutoSendableCarPlayButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D1248A4);
}

uint64_t sub_25D1248A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 56) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    uint64_t v8 = v5 + *(int *)(a4 + 44);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D124928()
{
  sub_25D119CD8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for AutoSendableCarPlayButton.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D124ABCLL);
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

ValueMetadata *type metadata accessor for AutoSendableCarPlayButton.CodingKeys()
{
  return &type metadata for AutoSendableCarPlayButton.CodingKeys;
}

unint64_t sub_25D124AF8()
{
  unint64_t result = qword_26A660B08;
  if (!qword_26A660B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B08);
  }
  return result;
}

unint64_t sub_25D124B48()
{
  unint64_t result = qword_26A660B10;
  if (!qword_26A660B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B10);
  }
  return result;
}

unint64_t sub_25D124B98()
{
  unint64_t result = qword_26A660B18;
  if (!qword_26A660B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B18);
  }
  return result;
}

uint64_t MapAttachment.init(url:isDraft:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a3, a1);
  uint64_t result = type metadata accessor for MapAttachment();
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for MapAttachment()
{
  uint64_t result = qword_26A660B48;
  if (!qword_26A660B48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t MapAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t MapAttachment.url.setter(uint64_t a1)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v1, a1, v3);
}

uint64_t (*MapAttachment.url.modify())()
{
  return nullsub_1;
}

uint64_t MapAttachment.isDraft.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MapAttachment() + 20));
}

uint64_t MapAttachment.isDraft.setter(char a1)
{
  uint64_t result = type metadata accessor for MapAttachment();
  *(unsigned char *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*MapAttachment.isDraft.modify())()
{
  return nullsub_1;
}

BOOL sub_25D124E1C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25D124E2C()
{
  return sub_25D15B980();
}

uint64_t sub_25D124E54(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7107189 && a2 == 0xE300000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74666172447369 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D124F2C()
{
  return 2;
}

uint64_t sub_25D124F34()
{
  return sub_25D15B990();
}

uint64_t sub_25D124F7C(char a1)
{
  if (a1) {
    return 0x74666172447369;
  }
  else {
    return 7107189;
  }
}

BOOL sub_25D124FAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25D124E1C(*a1, *a2);
}

uint64_t sub_25D124FB8()
{
  return sub_25D124F34();
}

uint64_t sub_25D124FC0()
{
  return sub_25D124E2C();
}

uint64_t sub_25D124FC8()
{
  return sub_25D124F7C(*v0);
}

uint64_t sub_25D124FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D124E54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D124FF8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D124F2C();
  *a1 = result;
  return result;
}

uint64_t sub_25D125020(uint64_t a1)
{
  unint64_t v2 = sub_25D12521C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D12505C(uint64_t a1)
{
  unint64_t v2 = sub_25D12521C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MapAttachment.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660B20);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D12521C();
  sub_25D15B9D0();
  sub_25D15B1C0();
  sub_25D12564C(&qword_26A660B30, MEMORY[0x263F06EA8]);
  sub_25D15B880();
  if (!v1)
  {
    type metadata accessor for MapAttachment();
    sub_25D15B860();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_25D12521C()
{
  unint64_t result = qword_26A660B28;
  if (!qword_26A660B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B28);
  }
  return result;
}

uint64_t MapAttachment.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v5;
  uint64_t v21 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660B38);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = type metadata accessor for MapAttachment();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D12521C();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_25D12564C(&qword_26A660B40, MEMORY[0x263F06EA8]);
  sub_25D15B7F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v14, v8, v21);
  char v15 = sub_25D15B7D0();
  uint64_t v16 = OUTLINED_FUNCTION_4_3();
  v17(v16);
  *(unsigned char *)(v14 + *(int *)(v10 + 20)) = v15 & 1;
  sub_25D125500(v14, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_25D125564(v14);
}

uint64_t sub_25D125500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MapAttachment();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D125564(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MapAttachment();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D1255C8(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_25D12564C(&qword_26A6609A0, (void (*)(uint64_t))type metadata accessor for MapAttachment);
  uint64_t result = sub_25D12564C(&qword_26A660948, (void (*)(uint64_t))type metadata accessor for MapAttachment);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_25D12564C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25D125694@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MapAttachment.init(from:)(a1, a2);
}

uint64_t sub_25D1256AC(void *a1)
{
  return MapAttachment.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for LinkAttachment(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25D15B1C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for LinkAttachment(uint64_t a1)
{
  uint64_t v2 = sub_25D15B1C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for MapAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D1259F8);
}

uint64_t sub_25D1259F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for MapAttachment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D125AA8);
}

void sub_25D125AA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
}

uint64_t sub_25D125B30()
{
  uint64_t result = sub_25D15B1C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MapAttachment.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MapAttachment.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D125D18);
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

unsigned char *sub_25D125D40(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MapAttachment.CodingKeys()
{
  return &type metadata for MapAttachment.CodingKeys;
}

unint64_t sub_25D125D60()
{
  unint64_t result = qword_26A660B58;
  if (!qword_26A660B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B58);
  }
  return result;
}

unint64_t sub_25D125DB0()
{
  unint64_t result = qword_26A660B60;
  if (!qword_26A660B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B60);
  }
  return result;
}

unint64_t sub_25D125E00()
{
  unint64_t result = qword_26A660B68;
  if (!qword_26A660B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B68);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

SiriMessagesCommon::UnreadMessagesCarPlayButton __swiftcall UnreadMessagesCarPlayButton.init(text:)(Swift::String text)
{
  object = text._object;
  uint64_t countAndFlagsBits = text._countAndFlagsBits;
  unsigned int v4 = v1;
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = qword_26A660EF0;
  uint64_t v5 = qword_26A660EF8;
  *unsigned int v4 = countAndFlagsBits;
  v4[1] = (uint64_t)object;
  v4[2] = v6;
  v4[3] = v5;
  uint64_t v7 = swift_bridgeObjectRetain();
  result.unreadMessagesLabelText._object = v10;
  result.unreadMessagesLabelText._uint64_t countAndFlagsBits = v9;
  result.text._object = v8;
  result.text._uint64_t countAndFlagsBits = v7;
  return result;
}

uint64_t UnreadMessagesCarPlayButton.text.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UnreadMessagesCarPlayButton.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UnreadMessagesCarPlayButton.text.modify())()
{
  return nullsub_1;
}

uint64_t UnreadMessagesCarPlayButton.unreadMessagesLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UnreadMessagesCarPlayButton.unreadMessagesLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*UnreadMessagesCarPlayButton.unreadMessagesLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D126008(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000025D163010)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D1260E0(char a1)
{
  if (a1) {
    return 0xD000000000000017;
  }
  else {
    return 1954047348;
  }
}

uint64_t sub_25D126114()
{
  return sub_25D1260E0(*v0);
}

uint64_t sub_25D12611C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D126008(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D126144(uint64_t a1)
{
  unint64_t v2 = sub_25D126550();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D126180(uint64_t a1)
{
  unint64_t v2 = sub_25D126550();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UnreadMessagesCarPlayButton.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660B70);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  v12[1] = *(void *)(v1 + 24);
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D126550();
  sub_25D15B9D0();
  char v14 = 0;
  uint64_t v10 = v12[3];
  sub_25D15B850();
  if (!v10)
  {
    char v13 = 1;
    sub_25D15B850();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t UnreadMessagesCarPlayButton.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v22 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660B80);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D126550();
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v23 = 0;
    uint64_t v11 = OUTLINED_FUNCTION_2_3();
    uint64_t v13 = v12;
    char v23 = 1;
    swift_bridgeObjectRetain();
    uint64_t v14 = OUTLINED_FUNCTION_2_3();
    uint64_t v16 = v15;
    uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v21 = v14;
    v17(v9, v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v19 = v21;
    uint64_t v18 = v22;
    *id v22 = v11;
    v18[1] = v13;
    v18[2] = v19;
    v18[3] = v16;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D126520@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UnreadMessagesCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_25D126538(void *a1)
{
  return UnreadMessagesCarPlayButton.encode(to:)(a1);
}

unint64_t sub_25D126550()
{
  unint64_t result = qword_26A660B78;
  if (!qword_26A660B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B78);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for UnreadMessagesCarPlayButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for UnreadMessagesCarPlayButton()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for UnreadMessagesCarPlayButton(void *a1, void *a2)
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

void *assignWithCopy for UnreadMessagesCarPlayButton(void *a1, void *a2)
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for UnreadMessagesCarPlayButton(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for UnreadMessagesCarPlayButton(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for UnreadMessagesCarPlayButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UnreadMessagesCarPlayButton()
{
  return &type metadata for UnreadMessagesCarPlayButton;
}

unsigned char *storeEnumTagSinglePayload for UnreadMessagesCarPlayButton.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25D12686CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnreadMessagesCarPlayButton.CodingKeys()
{
  return &type metadata for UnreadMessagesCarPlayButton.CodingKeys;
}

unint64_t sub_25D1268A8()
{
  unint64_t result = qword_26A660B88;
  if (!qword_26A660B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B88);
  }
  return result;
}

unint64_t sub_25D1268F8()
{
  unint64_t result = qword_26A660B90;
  if (!qword_26A660B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B90);
  }
  return result;
}

unint64_t sub_25D126948()
{
  unint64_t result = qword_26A660B98;
  if (!qword_26A660B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660B98);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_25D15B7C0();
}

uint64_t PhotoAttachment.init(url:isDraft:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  type metadata accessor for SecurityScopedURL();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v6 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 32))(v7, a1);
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 8) = a2;
  return result;
}

uint64_t PhotoAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_25D126AE0@<X0>(uint64_t a1@<X8>)
{
  return PhotoAttachment.url.getter(a1);
}

uint64_t sub_25D126B1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_25D15B1C0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  char v8 = *((unsigned char *)a2 + 8);
  uint64_t v10 = *a2;
  char v11 = v8;
  return PhotoAttachment.url.setter((uint64_t)v6);
}

uint64_t PhotoAttachment.url.setter(uint64_t a1)
{
  uint64_t v4 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  uint64_t v8 = *v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a1, v4);
  sub_25D120E04();
  uint64_t v9 = v8 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40))(v9, v2, v4);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v4);
}

void (*PhotoAttachment.url.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25D120FC4(v2);
  return sub_25D11A398;
}

uint64_t PhotoAttachment.isDraft.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t PhotoAttachment.isDraft.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t (*PhotoAttachment.isDraft.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D126D90(uint64_t a1)
{
  unint64_t v2 = sub_25D126F78();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D126DCC(uint64_t a1)
{
  unint64_t v2 = sub_25D126F78();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PhotoAttachment.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660BA0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D126F78();
  sub_25D15B9D0();
  type metadata accessor for SecurityScopedURL();
  sub_25D12718C(&qword_26A660BB0);
  sub_25D15B880();
  if (!v1) {
    sub_25D15B860();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_25D126F78()
{
  unint64_t result = qword_26A660BA8;
  if (!qword_26A660BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660BA8);
  }
  return result;
}

uint64_t PhotoAttachment.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660BB8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D126F78();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  type metadata accessor for SecurityScopedURL();
  sub_25D12718C(&qword_26A660BC0);
  sub_25D15B7F0();
  swift_retain();
  char v6 = sub_25D15B7D0();
  uint64_t v7 = OUTLINED_FUNCTION_3_3();
  v8(v7);
  *(void *)a2 = v10;
  *(unsigned char *)(a2 + 8) = v6 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_release();
}

uint64_t sub_25D12718C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SecurityScopedURL();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25D1271D8(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_25D11F86C();
  unint64_t result = sub_25D11F73C();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_25D127208@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PhotoAttachment.init(from:)(a1, a2);
}

uint64_t sub_25D127220(void *a1)
{
  return PhotoAttachment.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for PhotoAttachment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for PhotoAttachment()
{
  return swift_release();
}

uint64_t assignWithCopy for PhotoAttachment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for PhotoAttachment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoAttachment(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 9))
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

uint64_t storeEnumTagSinglePayload for PhotoAttachment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoAttachment()
{
  return &type metadata for PhotoAttachment;
}

unsigned char *storeEnumTagSinglePayload for PhotoAttachment.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D127480);
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

ValueMetadata *type metadata accessor for PhotoAttachment.CodingKeys()
{
  return &type metadata for PhotoAttachment.CodingKeys;
}

unint64_t sub_25D1274BC()
{
  unint64_t result = qword_26A660BC8;
  if (!qword_26A660BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660BC8);
  }
  return result;
}

unint64_t sub_25D12750C()
{
  unint64_t result = qword_26A660BD0;
  if (!qword_26A660BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660BD0);
  }
  return result;
}

unint64_t sub_25D12755C()
{
  unint64_t result = qword_26A660BD8[0];
  if (!qword_26A660BD8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A660BD8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return v0;
}

uint64_t Redacted.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_25D1275F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Redacted();
  return Redacted.wrappedValue.getter(v2, a1);
}

uint64_t sub_25D127634(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v2 = (char *)&v6 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v6 - v1);
  uint64_t v4 = type metadata accessor for Redacted();
  return Redacted.wrappedValue.setter((uint64_t)v2, v4);
}

uint64_t Redacted.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2, a1);
}

void (*Redacted.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  v5[2] = *(void *)(a2 + 16);
  OUTLINED_FUNCTION_0_3();
  *(void *)(v6 + 24) = v7;
  size_t v9 = *(void *)(v8 + 64);
  v5[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v5[5] = v10;
  Redacted.wrappedValue.getter(a2, (uint64_t)v10);
  return sub_25D127800;
}

void sub_25D127800(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[5];
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    Redacted.wrappedValue.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    Redacted.wrappedValue.setter((*a1)[5], *v2);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t Redacted.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t Redacted.description.getter()
{
  return 0x657463616465723CLL;
}

uint64_t sub_25D127914(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25D127994()
{
  return 0x65756C6176;
}

uint64_t sub_25D1279A8()
{
  return sub_25D11DAD0();
}

uint64_t sub_25D1279B4()
{
  return sub_25D11DB7C();
}

uint64_t sub_25D1279C4()
{
  return sub_25D11DAD8();
}

uint64_t sub_25D1279D4()
{
  return sub_25D15B990();
}

uint64_t sub_25D127A1C()
{
  return sub_25D127994();
}

uint64_t sub_25D127A2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D127914(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D127A64()
{
  return sub_25D11832C();
}

uint64_t sub_25D127A8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D11DAD0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25D127AC4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_25D127B18(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t Redacted.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v10 = *(void *)(a2 + 16);
  type metadata accessor for Redacted.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_25D15B890();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v10 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D15B9D0();
  sub_25D15B880();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t type metadata accessor for Redacted.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Redacted.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  OUTLINED_FUNCTION_0_3();
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v28 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Redacted.CodingKeys();
  swift_getWitnessTable();
  uint64_t v29 = sub_25D15B810();
  OUTLINED_FUNCTION_0_3();
  uint64_t v25 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v26 = a3;
  uint64_t v12 = type metadata accessor for Redacted();
  OUTLINED_FUNCTION_0_3();
  uint64_t v23 = v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v22 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v17 = v30;
  sub_25D15B9B0();
  if (!v17)
  {
    uint64_t v30 = v12;
    uint64_t v18 = v27;
    sub_25D15B7F0();
    uint64_t v19 = OUTLINED_FUNCTION_1_6();
    v20(v19);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v16, v28, a2);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v24, v16, v30);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for Redacted()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25D127F3C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Redacted.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_25D127F60(void *a1, uint64_t a2)
{
  return Redacted.encode(to:)(a1, a2);
}

uint64_t sub_25D127F78()
{
  return Redacted.description.getter();
}

uint64_t sub_25D127F98()
{
  return 24;
}

__n128 sub_25D127FA4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_25D127FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_25D127FC0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25D128050(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_25D128108(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_25D128134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25D128184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25D1281D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25D128224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_25D128274(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!a2) {
    return 0;
  }
  int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_25D1283C0(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  size_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
  char v9 = 8 * v8;
  BOOL v10 = a3 >= v7;
  int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v8 < 4)
    {
      int v14 = (v13 >> v9) + 1;
      if (v8)
      {
        int v16 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v8] = v14;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v14;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v14;
        return;
      default:
        return;
    }
  }
  switch(v12)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x25D1285C4);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
      }
      return;
  }
}

uint64_t sub_25D1285EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

unsigned char *sub_25D1285F4(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25D128690);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25D1286B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25D1286D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25D1286F0()
{
  return swift_getWitnessTable();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return v0;
}

uint64_t UpdateSnippetAction.init(launchAppWithIntent:snippetMessage:sendButtonDisabled:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(unsigned char *)(a5 + 24) = a4;
  return result;
}

void UpdateSnippetAction.launchAppWithIntent.setter(void *a1)
{
  id *v1 = a1;
}

id UpdateSnippetAction.launchAppWithIntent.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

id sub_25D1287D0@<X0>(void *a1@<X8>)
{
  id result = UpdateSnippetAction.launchAppWithIntent.getter();
  *a1 = result;
  return result;
}

void sub_25D12881C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  UpdateSnippetAction.launchAppWithIntent.setter(v1);
}

void (*UpdateSnippetAction.launchAppWithIntent.modify(void **a1))(uint64_t a1, char a2)
{
  id v2 = *v1;
  *a1 = *v1;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D11A820;
}

uint64_t UpdateSnippetAction.snippetMessage.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UpdateSnippetAction.snippetMessage.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*UpdateSnippetAction.snippetMessage.modify())()
{
  return nullsub_1;
}

uint64_t UpdateSnippetAction.sendButtonDisabled.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t UpdateSnippetAction.sendButtonDisabled.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*UpdateSnippetAction.sendButtonDisabled.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D128950(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025D163030 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x4D74657070696E73 && a2 == 0xEE00656761737365;
    if (v5 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000012 && a2 == 0x800000025D163050)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v6 = sub_25D15B8C0();
      swift_bridgeObjectRelease();
      if (v6) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_25D128AAC()
{
  return 3;
}

uint64_t sub_25D128AB4(char a1)
{
  if (!a1) {
    return 0xD000000000000013;
  }
  if (a1 == 1) {
    return 0x4D74657070696E73;
  }
  return 0xD000000000000012;
}

uint64_t sub_25D128B1C()
{
  return sub_25D128AB4(*v0);
}

uint64_t sub_25D128B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D128950(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D128B4C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D128AAC();
  *a1 = result;
  return result;
}

uint64_t sub_25D128B74(uint64_t a1)
{
  unint64_t v2 = sub_25D128DA4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D128BB0(uint64_t a1)
{
  unint64_t v2 = sub_25D128DA4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UpdateSnippetAction.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660CE0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v14 = v1[2];
  uint64_t v15 = v10;
  v13[1] = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D128DA4();
  sub_25D15B9D0();
  uint64_t v19 = v11;
  char v18 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660CF0);
  sub_25D129048(&qword_26A660CF8);
  sub_25D15B880();
  if (!v2)
  {
    char v17 = 1;
    sub_25D15B850();
    char v16 = 2;
    sub_25D15B860();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_25D128DA4()
{
  unint64_t result = qword_26A660CE8;
  if (!qword_26A660CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660CE8);
  }
  return result;
}

void UpdateSnippetAction.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D00);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D128DA4();
  sub_25D15B9B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660CF0);
    sub_25D129048(&qword_26A660D08);
    sub_25D15B7F0();
    id v13 = v14;
    uint64_t v6 = sub_25D15B7C0();
    uint64_t v8 = v7;
    uint64_t v12 = v6;
    swift_bridgeObjectRetain();
    char v9 = sub_25D15B7D0();
    uint64_t v10 = OUTLINED_FUNCTION_1_7();
    v11(v10);
    *(void *)a2 = v14;
    *(void *)(a2 + 8) = v12;
    *(void *)(a2 + 16) = v8;
    *(unsigned char *)(a2 + 24) = v9 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25D129048(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A660CF0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_25D129090(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_25D1290A8(void *a1)
{
  return UpdateSnippetAction.encode(to:)(a1);
}

uint64_t destroy for UpdateSnippetAction(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UpdateSnippetAction(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UpdateSnippetAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for UpdateSnippetAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateSnippetAction(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 25))
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

uint64_t storeEnumTagSinglePayload for UpdateSnippetAction(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateSnippetAction()
{
  return &type metadata for UpdateSnippetAction;
}

uint64_t getEnumTagSinglePayload for UpdateSnippetAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for UpdateSnippetAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25D129404);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateSnippetAction.CodingKeys()
{
  return &type metadata for UpdateSnippetAction.CodingKeys;
}

unint64_t sub_25D129440()
{
  unint64_t result = qword_26A660D10;
  if (!qword_26A660D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660D10);
  }
  return result;
}

unint64_t sub_25D129490()
{
  unint64_t result = qword_26A660D18;
  if (!qword_26A660D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660D18);
  }
  return result;
}

unint64_t sub_25D1294E0()
{
  unint64_t result = qword_26A660D20;
  if (!qword_26A660D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660D20);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return v0;
}

uint64_t CATSerializable.serializedBase64SpeakableString()(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(a2 + 8))();
  if (!v2)
  {
    uint64_t v5 = result;
    unint64_t v6 = v4;
    sub_25D15B1E0();
    sub_25D1217BC(v5, v6);
    sub_25D15B4D0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *INInteraction.serializedData()()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  v5[0] = 0;
  id v1 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v5);
  id v2 = v5[0];
  if (v1)
  {
    int v3 = (void *)sub_25D15B1F0();
  }
  else
  {
    int v3 = v2;
    sub_25D15B120();

    swift_willThrow();
  }
  return v3;
}

void *sub_25D1296B0()
{
  return INInteraction.serializedData()();
}

void *SABaseCommand.serializedData()()
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1) {
    __break(1u);
  }
  id v2 = v1;
  v7[0] = 0;
  id v3 = objc_msgSend(self, sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v7);

  id v4 = v7[0];
  if (v3)
  {
    uint64_t v5 = (void *)sub_25D15B1F0();
  }
  else
  {
    uint64_t v5 = v4;
    sub_25D15B120();

    swift_willThrow();
  }
  return v5;
}

void *sub_25D1297D8()
{
  return SABaseCommand.serializedData()();
}

id sub_25D1297FC()
{
  type metadata accessor for AutoSendUtilities.Dummy();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26A660D28 = (uint64_t)result;
  return result;
}

id static AutoSendUtilities.configUITone(isFirstPartyApp:mode:)(int a1, uint64_t a2)
{
  int v36 = a1;
  uint64_t v3 = sub_25D15B360();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v35 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - v10;
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v31 - v12;
  if (qword_26A6606E8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25D15B440();
  uint64_t v15 = (void (*)(uint64_t))__swift_project_value_buffer(v14, (uint64_t)qword_26A66E658);
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v34(v13, a2, v3);
  char v16 = sub_25D15B420();
  os_log_type_t v17 = sub_25D15B5E0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v33 = a2;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v38 = v32;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v31 = v19 + 4;
    sub_25D129DD4();
    uint64_t v20 = sub_25D15B8A0();
    uint64_t v15 = (void (*)(uint64_t))v21;
    uint64_t v37 = sub_25D11EDF4(v20, v21, &v38);
    sub_25D15B650();
    swift_bridgeObjectRelease();
    uint64_t v22 = OUTLINED_FUNCTION_1_8();
    v15(v22);
    _os_log_impl(&dword_25D115000, v16, v17, "#AutoSendUtilities playUITone responseMode: %s", v19, 0xCu);
    uint64_t v23 = v32;
    swift_arrayDestroy();
    MEMORY[0x2611A5830](v23, -1, -1);
    uint64_t v24 = v19;
    a2 = v33;
    MEMORY[0x2611A5830](v24, -1, -1);
  }
  else
  {
    uint64_t v25 = OUTLINED_FUNCTION_1_8();
    v15(v25);
  }

  sub_25D15B330();
  uint64_t v26 = a2;
  char v27 = sub_25D15B340();
  ((void (*)(char *, uint64_t))v15)(v11, v3);
  uint64_t v28 = v35;
  v34(v35, v26, v3);
  if (v27)
  {
    char v29 = 1;
  }
  else
  {
    sub_25D15B350();
    char v29 = sub_25D15B340();
    ((void (*)(char *, uint64_t))v15)(v11, v3);
  }
  ((void (*)(char *, uint64_t))v15)(v28, v3);
  return static AutoSendUtilities.configUITone(isFirstPartyApp:isVoiceMode:)(v36 & 1, v29 & 1);
}

id static AutoSendUtilities.configUITone(isFirstPartyApp:isVoiceMode:)(char a1, char a2)
{
  uint64_t v4 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v10 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v11 = 0x67734D746E6553;
  }
  else {
    uint64_t v11 = 0x3367734D746E6553;
  }
  if (v10) {
    uint64_t v12 = 0xE900000000000070;
  }
  else {
    uint64_t v12 = 0xE700000000000000;
  }
  if (qword_26A6606E0 != -1) {
    swift_once();
  }
  sub_25D122C70(v11, v12, 7758199, 0xE300000000000000, (void *)qword_26A660D28);
  if (!v13) {
    return 0;
  }
  sub_25D15B140();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7FC70]), sel_initWithType_, 2);
  uint64_t v15 = (void *)sub_25D15B150();
  objc_msgSend(v14, sel_setExternalToneFileURL_, v15);

  objc_msgSend(v14, sel_setShouldIgnoreRingerSwitch_, a2 & 1);
  id v16 = objc_msgSend(self, sel_alertWithConfiguration_, v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  return v16;
}

uint64_t static AutoSendUtilities.soundFileURLString(isFirstPartyApp:)(char a1)
{
  if (qword_26A6606E0 != -1) {
    swift_once();
  }
  if (a1) {
    uint64_t v2 = 0x67734D746E6553;
  }
  else {
    uint64_t v2 = 0x3367734D746E6553;
  }
  uint64_t v3 = (void *)qword_26A660D28;
  if (a1) {
    uint64_t v4 = 0xE700000000000000;
  }
  else {
    uint64_t v4 = 0xE900000000000070;
  }

  return sub_25D122C70(v2, v4, 7758199, 0xE300000000000000, v3);
}

unint64_t sub_25D129DD4()
{
  unint64_t result = qword_26A660D30;
  if (!qword_26A660D30)
  {
    sub_25D15B360();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660D30);
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoSendUtilities()
{
  return &type metadata for AutoSendUtilities;
}

uint64_t type metadata accessor for AutoSendUtilities.Dummy()
{
  return self;
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return v0;
}

uint64_t static SFSpeechAssetManagerProtocol.installedASRAssetFor(language:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
    uint64_t v7 = sub_25D129F9C(a1, a2, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26A6606E8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25D15B440();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A66E658);
    uint64_t v9 = (void *)sub_25D15B420();
    os_log_type_t v10 = sub_25D15B5F0();
    if (OUTLINED_FUNCTION_4_4(v10))
    {
      uint64_t v11 = (_WORD *)OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_6_3(v11);
      OUTLINED_FUNCTION_2_4(&dword_25D115000, v12, v13, "#SFSpeechAssetManagerProtocol installedASRAssetFor language nil");
      OUTLINED_FUNCTION_3_4();
    }

    return 0;
  }
  return v7;
}

uint64_t sub_25D129F9C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25D15B440();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_25D15B280();
  uint64_t v10 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v77 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_25D15B2A0();
  uint64_t v12 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v75 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D38);
  MEMORY[0x270FA5388](v14 - 8);
  id v16 = (char *)v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(a3 + 56);
  uint64_t v67 = a3 + 56;
  uint64_t v18 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  int64_t v68 = (unint64_t)(v18 + 63) >> 6;
  unint64_t v21 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v22 = v6;
  uint64_t v72 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v73 = v21;
  uint64_t v23 = v9;
  uint64_t v70 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v71 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v25 = 0;
  *(void *)&long long v26 = 136315138;
  long long v69 = v26;
  v64[1] = MEMORY[0x263F8EE58] + 8;
  uint64_t v74 = v16;
  v65 = v9;
  uint64_t v66 = a1;
  if (!v20) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v27 = __clz(__rbit64(v20));
  uint64_t v28 = (v20 - 1) & v20;
  int64_t v79 = v25;
  for (unint64_t i = v27 | (v25 << 6); ; unint64_t i = __clz(__rbit64(v31)) + (v32 << 6))
  {
    uint64_t v34 = (uint64_t *)(*(void *)(a3 + 48) + 16 * i);
    uint64_t v35 = *v34;
    uint64_t v82 = v34[1];
    uint64_t v83 = v35;
    uint64_t v36 = qword_26A6606E8;
    swift_bridgeObjectRetain();
    if (v36 != -1) {
      swift_once();
    }
    uint64_t v37 = __swift_project_value_buffer(v22, (uint64_t)qword_26A66E658);
    swift_bridgeObjectRetain_n();
    uint64_t v38 = sub_25D15B420();
    os_log_type_t v39 = sub_25D15B600();
    BOOL v40 = os_log_type_enabled(v38, v39);
    unint64_t v80 = v28;
    if (v40)
    {
      uint64_t v41 = swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v84[0] = v42;
      *(_DWORD *)uint64_t v41 = v69;
      swift_bridgeObjectRetain();
      *(void *)(v41 + 4) = sub_25D11EDF4(a1, a2, v84);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25D115000, v38, v39, "#SFSpeechAssetManagerProtocol hasLanguage %s", (uint8_t *)v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611A5830](v42, -1, -1);
      uint64_t v43 = v41;
      id v16 = v74;
      MEMORY[0x2611A5830](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    v44 = v75;
    sub_25D15B230();
    v45 = v77;
    sub_25D15B290();
    (*v73)(v44, v76);
    sub_25D15B270();
    (*v72)(v45, v78);
    uint64_t v46 = sub_25D15B260();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v46) == 1)
    {
      sub_25D12BC3C((uint64_t)v16);
      uint64_t v81 = 0;
      unint64_t v47 = 0;
    }
    else
    {
      uint64_t v81 = sub_25D15B250();
      unint64_t v47 = v48;
      (*(void (**)(char *, uint64_t))(*(void *)(v46 - 8) + 8))(v16, v46);
    }
    (*v71)(v23, v37, v22);
    swift_bridgeObjectRetain_n();
    v49 = sub_25D15B420();
    os_log_type_t v50 = sub_25D15B600();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v84[0] = v52;
      *(_DWORD *)uint64_t v51 = v69;
      unint64_t v53 = a2;
      uint64_t v54 = a3;
      if (v47) {
        uint64_t v55 = v81;
      }
      else {
        uint64_t v55 = 7104878;
      }
      uint64_t v56 = v22;
      if (v47) {
        unint64_t v57 = v47;
      }
      else {
        unint64_t v57 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v58 = v55;
      a3 = v54;
      a2 = v53;
      id v16 = v74;
      *(void *)(v51 + 4) = sub_25D11EDF4(v58, v57, v84);
      swift_bridgeObjectRelease_n();
      uint64_t v22 = v56;
      uint64_t v23 = v65;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25D115000, v49, v50, "#SFSpeechAssetManagerProtocol baseLanguage %s", (uint8_t *)v51, 0xCu);
      swift_arrayDestroy();
      uint64_t v59 = v52;
      a1 = v66;
      MEMORY[0x2611A5830](v59, -1, -1);
      MEMORY[0x2611A5830](v51, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*v70)(v23, v22);
    unint64_t v20 = v80;
    if (v47)
    {
      if (v81 == a1 && v47 == a2)
      {
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v61 = sub_25D15B8C0();
        swift_bridgeObjectRelease();
        if ((v61 & 1) == 0) {
          goto LABEL_42;
        }
        swift_release();
      }
      return v83;
    }
LABEL_42:
    uint64_t v62 = v83;
    if (v83 == a1 && v82 == a2)
    {
      swift_release();
      return a1;
    }
    if (sub_25D15B8C0())
    {
      swift_release();
      return v62;
    }
    uint64_t result = swift_bridgeObjectRelease();
    int64_t v25 = v79;
    if (v20) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v30 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v30 >= v68) {
      goto LABEL_51;
    }
    unint64_t v31 = *(void *)(v67 + 8 * v30);
    int64_t v32 = v25 + 1;
    if (v31) {
      goto LABEL_18;
    }
    int64_t v32 = v25 + 2;
    if (v25 + 2 >= v68) {
      goto LABEL_51;
    }
    unint64_t v31 = *(void *)(v67 + 8 * v32);
    if (v31) {
      goto LABEL_18;
    }
    int64_t v32 = v25 + 3;
    if (v25 + 3 >= v68) {
      goto LABEL_51;
    }
    unint64_t v31 = *(void *)(v67 + 8 * v32);
    if (v31) {
      goto LABEL_18;
    }
    uint64_t v33 = v25 + 4;
    if (v25 + 4 >= v68)
    {
LABEL_51:
      swift_release();
      return 0;
    }
    unint64_t v31 = *(void *)(v67 + 8 * v33);
    if (!v31)
    {
      while (1)
      {
        int64_t v32 = v33 + 1;
        if (__OFADD__(v33, 1)) {
          goto LABEL_57;
        }
        if (v32 >= v68) {
          goto LABEL_51;
        }
        unint64_t v31 = *(void *)(v67 + 8 * v32);
        ++v33;
        if (v31) {
          goto LABEL_18;
        }
      }
    }
    int64_t v32 = v25 + 4;
LABEL_18:
    uint64_t v28 = (v31 - 1) & v31;
    int64_t v79 = v32;
  }
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t static SFSpeechAssetManagerProtocol.supportedLanguages()()
{
  id v0 = (id)AFPreferencesSupportedLanguages();
  if (v0)
  {
    id v1 = v0;
    uint64_t v2 = sub_25D15B560();

    uint64_t v15 = MEMORY[0x263F8EE88];
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      uint64_t v4 = v2 + 32;
      do
      {
        sub_25D120B30(v4, (uint64_t)&v14);
        if (swift_dynamicCast())
        {
          sub_25D12BA8C(&v14, v12, v13);
          swift_bridgeObjectRelease();
        }
        v4 += 32;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease();
      return v15;
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE88];
    }
  }
  else
  {
    if (qword_26A6606E8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25D15B440();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A66E658);
    uint64_t v7 = (void *)sub_25D15B420();
    os_log_type_t v8 = sub_25D15B600();
    if (OUTLINED_FUNCTION_4_4(v8))
    {
      uint64_t v9 = (_WORD *)OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_6_3(v9);
      OUTLINED_FUNCTION_2_4(&dword_25D115000, v10, v11, "#SFSpeechAssetManagerProtocol AFPreferencesSupportedLanguages returned nil");
      OUTLINED_FUNCTION_3_4();
    }

    return 0;
  }
}

uint64_t static SFSpeechAssetManagerProtocol.availableAssetFor(language:possibleLanguages:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    if (qword_26A6606E8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25D15B440();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A66E658);
    uint64_t v5 = (void *)sub_25D15B420();
    os_log_type_t v6 = sub_25D15B600();
    if (!OUTLINED_FUNCTION_4_4(v6)) {
      goto LABEL_13;
    }
    uint64_t v7 = (_WORD *)OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_6_3(v7);
    uint64_t v10 = "#SFSpeechAssetManagerProtocol AFPreferencesSupportedLanguages returned nil";
    goto LABEL_12;
  }
  if (a2) {
    return sub_25D129F9C(a1, a2, a3);
  }
  if (qword_26A6606E8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25D15B440();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A66E658);
  uint64_t v5 = (void *)sub_25D15B420();
  os_log_type_t v12 = sub_25D15B600();
  if (OUTLINED_FUNCTION_4_4(v12))
  {
    uint64_t v13 = (_WORD *)OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_6_3(v13);
    uint64_t v10 = "#SFSpeechAssetManagerProtocol availableAssetFor langauage nil";
LABEL_12:
    OUTLINED_FUNCTION_2_4(&dword_25D115000, v8, v9, v10);
    OUTLINED_FUNCTION_3_4();
  }
LABEL_13:

  return 0;
}

uint64_t static SFSpeechAssetManagerProtocol.numberOfAssetsAvailableForLanguage(language:possibleLanguages:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v96 = a2;
  uint64_t v95 = sub_25D15B440();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_25D15B280();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_5_0();
  uint64_t v88 = v13;
  uint64_t v87 = sub_25D15B2A0();
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_5_0();
  uint64_t v86 = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D38);
  MEMORY[0x270FA5388](v18 - 8);
  unint64_t v20 = (char *)v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = a3;
  if (!a3)
  {
    if (qword_26A6606E8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v95, (uint64_t)qword_26A66E658);
    uint64_t v33 = (void *)sub_25D15B420();
    os_log_type_t v34 = sub_25D15B600();
    if (OUTLINED_FUNCTION_4_4(v34))
    {
      uint64_t v35 = (_WORD *)OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_6_3(v35);
      OUTLINED_FUNCTION_2_4(&dword_25D115000, v36, v37, "#SFSpeechAssetManagerProtocol AFPreferencesSupportedLanguages returned nil");
      OUTLINED_FUNCTION_3_4();
    }

    return 0;
  }
  uint64_t v76 = v9;
  uint64_t v21 = qword_26A6606E8;
  swift_bridgeObjectRetain();
  if (v21 != -1) {
LABEL_68:
  }
    swift_once();
  uint64_t v22 = __swift_project_value_buffer(v95, (uint64_t)qword_26A66E658);
  swift_bridgeObjectRetain_n();
  uint64_t v94 = v22;
  uint64_t v23 = sub_25D15B420();
  os_log_type_t v24 = sub_25D15B600();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = MEMORY[0x263F8EE58];
  v85 = v20;
  if (v25)
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v93 = a1;
    v98[0] = v28;
    uint64_t v92 = v6;
    *(_DWORD *)unint64_t v27 = 136315138;
    uint64_t v91 = (uint64_t)(v27 + 4);
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_25D15B5C0();
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    uint64_t v97 = sub_25D11EDF4(v29, v31, v98);
    uint64_t v6 = v92;
    sub_25D15B650();
    swift_bridgeObjectRelease_n();
    unint64_t v20 = v85;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25D115000, v23, v24, "#SFSpeechAssetManagerProtocol possibleLanguages %s", v27, 0xCu);
    swift_arrayDestroy();
    a1 = v93;
    OUTLINED_FUNCTION_3_4();
    uint64_t v26 = MEMORY[0x263F8EE58];
    OUTLINED_FUNCTION_3_4();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v39 = v76;
  v75[0] = 0;
  uint64_t v40 = 0;
  uint64_t v41 = *(void *)(v90 + 56);
  uint64_t v77 = v90 + 56;
  uint64_t v42 = 1 << *(unsigned char *)(v90 + 32);
  uint64_t v43 = -1;
  if (v42 < 64) {
    uint64_t v43 = ~(-1 << v42);
  }
  unint64_t v44 = v43 & v41;
  int64_t v78 = (unint64_t)(v42 + 63) >> 6;
  uint64_t v83 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  v84 = (void (**)(uint64_t, uint64_t))(v15 + 8);
  uint64_t v81 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v82 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  *(void *)&long long v32 = 136315138;
  long long v80 = v32;
  v75[1] = v26 + 8;
  do
  {
    do
    {
      if (v44)
      {
        uint64_t v91 = (v44 - 1) & v44;
        uint64_t v92 = v40;
        unint64_t v45 = __clz(__rbit64(v44)) | (v40 << 6);
      }
      else
      {
        int64_t v46 = v40 + 1;
        if (__OFADD__(v40, 1))
        {
          __break(1u);
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
        if (v46 >= v78) {
          goto LABEL_65;
        }
        unint64_t v47 = *(void *)(v77 + 8 * v46);
        int64_t v48 = v40 + 1;
        if (!v47)
        {
          OUTLINED_FUNCTION_5_3();
          if (v49 == v50) {
            goto LABEL_65;
          }
          OUTLINED_FUNCTION_8_2();
          if (!v47)
          {
            OUTLINED_FUNCTION_5_3();
            if (v49 == v50) {
              goto LABEL_65;
            }
            OUTLINED_FUNCTION_8_2();
            if (!v47)
            {
              int64_t v52 = v51 + 3;
              if (v52 >= v78) {
                goto LABEL_65;
              }
              unint64_t v47 = *(void *)(v77 + 8 * v52);
              if (!v47)
              {
                while (!__OFADD__(v52, 1))
                {
                  OUTLINED_FUNCTION_5_3();
                  if (v49 == v50) {
                    goto LABEL_65;
                  }
                  OUTLINED_FUNCTION_8_2();
                  int64_t v52 = v53 + 1;
                  if (v47) {
                    goto LABEL_32;
                  }
                }
                goto LABEL_67;
              }
              int64_t v48 = v52;
            }
          }
        }
LABEL_32:
        uint64_t v91 = (v47 - 1) & v47;
        uint64_t v92 = v48;
        unint64_t v45 = __clz(__rbit64(v47)) + (v48 << 6);
      }
      uint64_t v54 = (uint64_t *)(*(void *)(v90 + 48) + 16 * v45);
      uint64_t v11 = *v54;
      uint64_t v55 = v54[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_25D15B420();
      os_log_type_t v57 = sub_25D15B600();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = swift_slowAlloc();
        v98[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v58 = v80;
        unint64_t v59 = v96;
        swift_bridgeObjectRetain();
        *(void *)(v58 + 4) = sub_25D11EDF4(a1, v59, v98);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25D115000, v56, v57, "#SFSpeechAssetManagerProtocol hasLanguage %s", (uint8_t *)v58, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_4();
        OUTLINED_FUNCTION_3_4();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRetain();
      uint64_t v60 = v86;
      uint64_t v93 = v55;
      sub_25D15B230();
      uint64_t v61 = v88;
      sub_25D15B290();
      (*v84)(v60, v87);
      sub_25D15B270();
      (*v83)(v61, v89);
      uint64_t v15 = sub_25D15B260();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v15) == 1)
      {
        sub_25D12BC3C((uint64_t)v20);
        uint64_t v6 = 0;
        unint64_t v62 = 0;
      }
      else
      {
        uint64_t v6 = sub_25D15B250();
        unint64_t v62 = v63;
        (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v20, v15);
      }
      (*v82)(v39, v94, v95);
      swift_bridgeObjectRetain_n();
      v64 = sub_25D15B420();
      os_log_type_t v65 = sub_25D15B600();
      if (os_log_type_enabled(v64, v65))
      {
        uint64_t v15 = swift_slowAlloc();
        uint64_t v66 = swift_slowAlloc();
        uint64_t v79 = v11;
        v98[0] = v66;
        *(_DWORD *)uint64_t v15 = v80;
        uint64_t v67 = v6;
        if (!v62) {
          uint64_t v6 = 7104878;
        }
        uint64_t v68 = a1;
        if (v62) {
          unint64_t v69 = v62;
        }
        else {
          unint64_t v69 = 0xE300000000000000;
        }
        swift_bridgeObjectRetain();
        uint64_t v70 = v6;
        uint64_t v6 = v95;
        *(void *)(v15 + 4) = sub_25D11EDF4(v70, v69, v98);
        swift_bridgeObjectRelease_n();
        a1 = v68;
        os_log_type_t v39 = v76;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25D115000, v64, v65, "#SFSpeechAssetManagerProtocol possible language %s", (uint8_t *)v15, 0xCu);
        swift_arrayDestroy();
        uint64_t v11 = v79;
        OUTLINED_FUNCTION_3_4();
        OUTLINED_FUNCTION_3_4();

        (*v81)(v39, v6);
      }
      else
      {
        uint64_t v67 = v6;

        swift_bridgeObjectRelease_n();
        (*v81)(v39, v95);
      }
      unint64_t v20 = v85;
      if (v62)
      {
        if (v67 == a1 && v62 == v96)
        {
          swift_bridgeObjectRelease();
LABEL_61:
          swift_bridgeObjectRelease();
          unint64_t v44 = v91;
          uint64_t v40 = v92;
          break;
        }
        char v72 = sub_25D15B8C0();
        swift_bridgeObjectRelease();
        if (v72) {
          goto LABEL_61;
        }
      }
      if (v11 == a1 && v93 == v96) {
        goto LABEL_61;
      }
      char v74 = sub_25D15B8C0();
      swift_bridgeObjectRelease();
      unint64_t v44 = v91;
      uint64_t v40 = v92;
    }
    while ((v74 & 1) == 0);
    BOOL v50 = __OFADD__(v75[0]++, 1);
  }
  while (!v50);
  __break(1u);
LABEL_65:
  swift_release();
  return v75[0];
}

uint64_t sub_25D12B3D8()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_installedLanguages);
  uint64_t v1 = sub_25D15B5B0();

  return v1;
}

uint64_t sub_25D12B434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A660D50 + dword_26A660D50);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_25D12B510;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_25D12B510()
{
  OUTLINED_FUNCTION_1_9();
  uint64_t v8 = *v3;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
  if (!v1)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v0;
  }
  return v6(v4, v5);
}

uint64_t sub_25D12B5F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9 = sub_25D15B490();
  v5[18] = v9;
  if (a4)
  {
    v5[14] = a4;
    v5[15] = a5;
    v5[10] = MEMORY[0x263EF8330];
    v5[11] = 1107296256;
    v5[12] = sub_25D12B93C;
    v5[13] = &block_descriptor_5;
    a4 = _Block_copy(v5 + 10);
    swift_retain();
    swift_release();
  }
  v5[19] = a4;
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v5[2] = v5;
  v5[7] = v5 + 16;
  v5[3] = sub_25D12B7A4;
  uint64_t v11 = swift_continuation_init();
  v5[10] = MEMORY[0x263EF8330];
  v5[11] = 0x40000000;
  v5[12] = sub_25D12B990;
  v5[13] = &block_descriptor;
  v5[14] = v11;
  objc_msgSend(ObjCClassFromMetadata, sel_fetchAssetWithConfig_clientIdentifier_progress_completion_, a1, v9, a4, v5 + 10);
  return MEMORY[0x270FA23F0](v5 + 2);
}

uint64_t sub_25D12B7A4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *v0;
  uint64_t v4 = *(const void **)(*v0 + 152);
  uint64_t v5 = *(void **)(*v0 + 144);
  if (*(void *)(v1 + 48))
  {
    swift_willThrow();
    _Block_release(v4);

    uint64_t v6 = *(uint64_t (**)(void))(v3 + 8);
    return v6();
  }
  else
  {
    uint64_t v8 = *(void *)(v2 + 128);
    uint64_t v9 = *(void *)(v2 + 136);
    _Block_release(*(const void **)(v1 + 152));

    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
    return v10(v8, v9);
  }
}

uint64_t sub_25D12B93C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_25D12B990(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_25D12BA08(v3, (uint64_t)v4);
  }
  else
  {
    uint64_t v7 = sub_25D15B4A0();
    return sub_25D12BA6C(v3, v7, v6);
  }
}

uint64_t sub_25D12BA08(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D58);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;

  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_25D12BA6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 64) + 40);
  *uint64_t v3 = a2;
  v3[1] = a3;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_25D12BA8C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25D15B970();
  swift_bridgeObjectRetain();
  sub_25D15B4E0();
  uint64_t v8 = sub_25D15B990();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25D15B8C0() & 1) != 0)
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
      if (v19 || (sub_25D15B8C0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25D12C1CC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25D12BC3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of static SFSpeechAssetManagerProtocol.installedLanguages()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SFSpeechAssetManagerProtocol.availableAssetFor(language:possibleLanguages:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of static SFSpeechAssetManagerProtocol.fetchAsset(with:clientIdentifier:progress:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 24)
                                                                                              + **(int **)(a7 + 24));
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_25D12BDF8;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_25D12BDF8()
{
  OUTLINED_FUNCTION_1_9();
  uint64_t v5 = *v2;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  return v3(v1, v0);
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

uint64_t sub_25D12BEF0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D60);
  uint64_t v3 = sub_25D15B6D0();
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25D15B970();
      sub_25D15B4E0();
      uint64_t result = sub_25D15B990();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_25D12C368(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *unint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25D12C1CC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25D12BEF0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25D12C384();
      goto LABEL_22;
    }
    sub_25D12C538();
  }
  uint64_t v11 = *v4;
  sub_25D15B970();
  sub_25D15B4E0();
  uint64_t result = sub_25D15B990();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25D15B8C0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25D15B920();
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
          uint64_t result = sub_25D15B8C0();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

uint64_t sub_25D12C368(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *sub_25D12C384()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25D15B6C0();
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25D12C538()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D60);
  uint64_t v3 = sub_25D15B6D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25D15B970();
    swift_bridgeObjectRetain();
    sub_25D15B4E0();
    uint64_t result = sub_25D15B990();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_3_4()
{
  JUMPOUT(0x2611A5830);
}

BOOL OUTLINED_FUNCTION_4_4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

_WORD *OUTLINED_FUNCTION_6_3(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_slowAlloc();
}

uint64_t ModelCodable.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25D15B640();
  OUTLINED_FUNCTION_0_3();
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v9);
  int64_t v11 = (char *)&v14 - v10;
  __swift_storeEnumTagSinglePayload(a3, 1, 1, a2);
  OUTLINED_FUNCTION_1_10();
  v12();
  type metadata accessor for ModelCodable();
  ModelCodable.wrappedValue.setter((uint64_t)v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v6);
}

uint64_t ModelCodable.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25D15B640();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t ModelCodable.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = sub_25D15B640();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t type metadata accessor for ModelCodable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static AceObject.decode(from:)()
{
  OUTLINED_FUNCTION_3_5();
  v9[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_25D15B1D0();
  v9[0] = 0;
  id v2 = objc_msgSend(v0, sel_propertyListWithData_options_format_error_, v1, 0, 0, v9);

  if (v2)
  {
    id v3 = v9[0];
    sub_25D15B680();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D68);
    if (swift_dynamicCast())
    {
      uint64_t v4 = (void *)sub_25D15B450();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = 0;
    }
    id v6 = objc_msgSend(self, sel_aceObjectWithDictionary_, v4);

    if (v6)
    {
      uint64_t result = swift_dynamicCastUnknownClass();
      if (result) {
        return result;
      }
    }
    sub_25D12DDE8();
    OUTLINED_FUNCTION_6_4();
    *(void *)uint64_t v8 = 0xD00000000000002ELL;
    *(void *)(v8 + 8) = 0x800000025D163100;
    *(unsigned char *)(v8 + 16) = 1;
  }
  else
  {
    id v5 = v9[0];
    sub_25D15B120();
  }
  return swift_willThrow();
}

void *AceObject.encode()()
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = objc_msgSend(v0, sel_dictionary);
  if (v2)
  {
    id v3 = v2;
    v8[0] = 0;
    id v4 = objc_msgSend(self, sel_dataWithPropertyList_format_options_error_, v2, 200, 0, v8);
    id v5 = v8[0];
    if (v4)
    {
      uint64_t v1 = (void *)sub_25D15B1F0();
    }
    else
    {
      uint64_t v1 = v5;
      sub_25D15B120();

      swift_willThrow();
    }
  }
  else
  {
    sub_25D12DDE8();
    OUTLINED_FUNCTION_6_4();
    *(void *)uint64_t v6 = 0xD000000000000037;
    *(void *)(v6 + 8) = 0x800000025D163130;
    *(unsigned char *)(v6 + 16) = 0;
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_25D12CDD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static AceObject.decode(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

void *sub_25D12CDFC()
{
  return AceObject.encode()();
}

uint64_t static INIntent.decode(from:)()
{
  OUTLINED_FUNCTION_3_5();
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_25D1227E4(ObjCClassFromMetadata, (SEL *)&selRef_typeName);
  if (v1)
  {
    id v2 = (void *)sub_25D15B490();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }
  id v3 = (void *)sub_25D15B1D0();
  id v4 = (id)INIntentCreate();

  if (v4)
  {
    uint64_t result = swift_dynamicCastUnknownClass();
    if (result) {
      return result;
    }
  }
  sub_25D12DDE8();
  OUTLINED_FUNCTION_6_4();
  return OUTLINED_FUNCTION_2_5(v6, 0xD000000000000024);
}

uint64_t INIntent.encode()()
{
  uint64_t result = sub_25D12DE34(objc_msgSend(v0, sel_backingStore));
  if (v2 >> 60 == 15) {
    __break(1u);
  }
  return result;
}

uint64_t sub_25D12CF4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static INIntent.decode(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25D12CF78()
{
  return INIntent.encode()();
}

uint64_t static INIntentResponse.decode(from:)()
{
  OUTLINED_FUNCTION_3_5();
  sub_25D12D05C();
  uint64_t v0 = (void *)sub_25D15B490();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_25D15B1D0();
  id v2 = (id)INIntentResponseCreate();

  if (v2)
  {
    uint64_t result = swift_dynamicCastUnknownClass();
    if (result) {
      return result;
    }
  }
  sub_25D12DDE8();
  OUTLINED_FUNCTION_6_4();
  return OUTLINED_FUNCTION_2_5(v4, 0xD00000000000002DLL);
}

unint64_t sub_25D12D05C()
{
  swift_getObjCClassFromMetadata();
  id v0 = (id)INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
  uint64_t v1 = v0;
  if (v0 && (v2 = v0, uint64_t v3 = sub_25D12DEA4(v2), v4))
  {
    uint64_t v5 = v3;
  }
  else
  {
    swift_bridgeObjectRelease();

    return 0xD000000000000015;
  }
  return v5;
}

id INIntentResponse.encode()()
{
  id result = objc_msgSend(v0, sel_backingStore);
  if (!result)
  {
    __break(1u);
    goto LABEL_5;
  }
  id result = (id)sub_25D12DE34(result);
  if (v2 >> 60 == 15) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_25D12D140@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static INIntentResponse.decode(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

id sub_25D12D16C()
{
  return INIntentResponse.encode()();
}

id INSendMessageIntent.redacted.getter()
{
  swift_getObjectType();
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_outgoingMessageType);
  unint64_t v2 = (void *)sub_25D15B5D0();
  uint64_t v3 = (void *)sub_25D15B490();
  objc_msgSend(v1, sel_setValue_forKey_, v2, v3);

  sub_25D1227E4(v0, (SEL *)&selRef_content);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = sub_25D15B4B0();
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    v11[0] = v6;
    v11[1] = v8;
    uint64_t v5 = sub_25D15B8B0();
    sub_25D12DF20((uint64_t)v11);
  }
  uint64_t v9 = (void *)sub_25D15B490();
  objc_msgSend(v1, sel_setValue_forKey_, v5, v9);
  swift_unknownObjectRelease();

  return v1;
}

id sub_25D12D2CC@<X0>(void *a1@<X8>)
{
  id result = INSendMessageIntent.redacted.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25D12D2F8@<X0>(uint64_t a1@<X8>)
{
  return ModelCodable.wrappedValue.getter(a1);
}

uint64_t sub_25D12D334(uint64_t a1)
{
  uint64_t v2 = sub_25D15B640();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - v3, a1);
  type metadata accessor for ModelCodable();
  return ModelCodable.wrappedValue.setter((uint64_t)v4);
}

void (*ModelCodable.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v6 = sub_25D15B640();
  id v5[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v5[4] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v5[5] = v9;
  ModelCodable.wrappedValue.getter((uint64_t)v9);
  return sub_25D12D4FC;
}

void sub_25D12D4FC(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 32);
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    OUTLINED_FUNCTION_1_10();
    v7();
    ModelCodable.wrappedValue.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    ModelCodable.wrappedValue.setter(*(void *)(*(void *)a1 + 40));
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t ModelCodable.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v32 = a4;
  uint64_t v8 = sub_25D15B640();
  OUTLINED_FUNCTION_0_3();
  uint64_t v31 = v9;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)&v28 - v11;
  uint64_t v39 = type metadata accessor for ModelCodable();
  OUTLINED_FUNCTION_0_3();
  uint64_t v34 = v13;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v14);
  int64_t v16 = (char *)&v28 - v15;
  OUTLINED_FUNCTION_8_3();
  uint64_t v17 = a1[3];
  uint64_t v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_25D15B9A0();
  if (v4)
  {
    uint64_t v26 = v39;
    uint64_t v27 = v34;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v16, v26);
  }
  else
  {
    int64_t v29 = v12;
    uint64_t v30 = v8;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    if (sub_25D15B8E0())
    {
      (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v30);
      OUTLINED_FUNCTION_8_3();
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(v37, v38);
      sub_25D121770();
      sub_25D15B8D0();
      uint64_t v23 = v35;
      unint64_t v24 = v36;
      uint64_t v25 = (uint64_t)v29;
      (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8))(v35, v36, a2, a3);
      sub_25D1217BC(v23, v24);
      __swift_storeEnumTagSinglePayload(v25, 0, 1, a2);
      (*(void (**)(char *, uint64_t, uint64_t))(v31 + 40))(v16, v25, v30);
    }
    uint64_t v18 = v39;
    uint64_t v19 = (uint64_t)v33;
    uint64_t v20 = v34;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    OUTLINED_FUNCTION_1_10();
    v21();
    __swift_destroy_boxed_opaque_existential_1(v19);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v16, v18);
  }
}

uint64_t ModelCodable.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v24 = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = sub_25D15B640();
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v5;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v23 - v8;
  OUTLINED_FUNCTION_0_3();
  uint64_t v25 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D15B9C0();
  OUTLINED_FUNCTION_1_10();
  v14();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
    sub_25D15B900();
  }
  else
  {
    uint64_t v15 = v25;
    OUTLINED_FUNCTION_7_4();
    v16();
    uint64_t v17 = v30;
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)(v24 + 24) + 16))(v3);
    if (!v17)
    {
      uint64_t v20 = v18;
      unint64_t v21 = v19;
      uint64_t v26 = v18;
      unint64_t v27 = v19;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
      sub_25D121AD4();
      sub_25D15B8F0();
      sub_25D1217BC(v20, v21);
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v3);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
}

uint64_t ModelCodable.redacted.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v2 = *(void *)(a1 + 16);
  OUTLINED_FUNCTION_0_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25D15B640();
  OUTLINED_FUNCTION_0_3();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)v27 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)v27 - v18;
  OUTLINED_FUNCTION_1_10();
  v20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v8);
LABEL_7:
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    goto LABEL_8;
  }
  uint64_t v28 = v4;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A660D80);
  if (!swift_dynamicCast()) {
    goto LABEL_7;
  }
  if (!*((void *)&v31 + 1))
  {
LABEL_8:
    sub_25D12DFC4((uint64_t)&v30);
    return OUTLINED_FUNCTION_4_5((uint64_t)v14, 1);
  }
  sub_25D12E024(&v30, (uint64_t)v33);
  uint64_t v22 = v34;
  uint64_t v21 = v35;
  v27[0] = v35;
  v27[1] = __swift_project_boxed_opaque_existential_1(v33, v34);
  *((void *)&v31 + 1) = v22;
  uint64_t v32 = v21;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v30);
  sub_25D15B2B0();
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v2);
    uint64_t v23 = v28;
    OUTLINED_FUNCTION_7_4();
    v24();
    OUTLINED_FUNCTION_1_10();
    v25();
    OUTLINED_FUNCTION_4_5((uint64_t)v14, 0);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v2);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v2);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return OUTLINED_FUNCTION_4_5((uint64_t)v14, 1);
}

uint64_t sub_25D12DDAC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return ModelCodable.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_25D12DDCC(void *a1, uint64_t a2)
{
  return ModelCodable.encode(to:)(a1, a2);
}

unint64_t sub_25D12DDE8()
{
  unint64_t result = qword_26A660D70;
  if (!qword_26A660D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660D70);
  }
  return result;
}

uint64_t sub_25D12DE34(void *a1)
{
  id v2 = objc_msgSend(a1, sel_data);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25D15B1F0();

  return v3;
}

uint64_t sub_25D12DEA4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_type);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25D15B4A0();

  return v3;
}

uint64_t sub_25D12DF14(void *a1)
{
  return sub_25D1227E4(a1, (SEL *)&selRef_content);
}

uint64_t sub_25D12DF20(uint64_t a1)
{
  return a1;
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

uint64_t sub_25D12DFC4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660D78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D12E024(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25D12E044()
{
  return 16;
}

__n128 sub_25D12E050(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of static CodableType.decode(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of CodableType.encode()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25D12E0B0()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for CodableError()
{
  return sub_25D12E0C8();
}

uint64_t sub_25D12E0C8()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18SiriMessagesCommon12CodableErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_25D12E0B0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CodableError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_25D12E0B0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_25D12E0C8();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CodableError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_25D12E0C8();
  return a1;
}

uint64_t getEnumTagSinglePayload for CodableError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CodableError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_25D12E254(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25D12E25C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CodableError()
{
  return &type metadata for CodableError;
}

uint64_t sub_25D12E278()
{
  uint64_t result = sub_25D15B640();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25D12E308(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_25D12E424(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_25D12E4A0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_25D12E564(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  int v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

void *sub_25D12E68C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_25D12E750(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  int v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

uint64_t sub_25D12E878(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  unsigned int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_23;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 > 3) {
            LODWORD(v7) = 4;
          }
          switch((int)v7)
          {
            case 2:
              LODWORD(v7) = *a1;
              break;
            case 3:
              LODWORD(v7) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v7) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v7) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v6 + (v7 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v5 < 2) {
    return 0;
  }
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

void sub_25D12E9FC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v9) {
    size_t v11 = *(void *)(v8 + 64);
  }
  else {
    size_t v11 = *(void *)(v8 + 64) + 1;
  }
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v10;
  unsigned int v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        int v6 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v6 = 2;
      }
      else
      {
        int v6 = v15 > 1;
      }
    }
    else
    {
      int v6 = 1;
    }
  }
  if (v10 < a2)
  {
    unsigned int v16 = ~v10 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v18 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x25D12EC1CLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_27;
    default:
LABEL_27:
      if (a2)
      {
LABEL_28:
        if (v9 >= 2)
        {
          uint64_t v19 = a2 + 1;
          __swift_storeEnumTagSinglePayload((uint64_t)a1, v19, v9, v7);
        }
      }
      return;
  }
}

uint64_t OUTLINED_FUNCTION_2_5@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = (v2 - 32) | 0x8000000000000000;
  *(unsigned char *)(a1 + 16) = 1;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_4_5(uint64_t a1, uint64_t a2)
{
  __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
  uint64_t v5 = *(void *)(v4 - 168);
  return ModelCodable.init(wrappedValue:)(v3, v2, v5);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t sub_25D12ED1C()
{
  uint64_t v0 = sub_25D15B440();
  __swift_allocate_value_buffer(v0, qword_26A66E658);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A66E658);
  return sub_25D15B430();
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

BOOL INSendMessageIntent.hasAttachment.getter()
{
  BOOL result = 0;
  if (sub_25D12F544(v0, (SEL *)&selRef_attachments, &qword_26A660E28))
  {
    OUTLINED_FUNCTION_1_11();
    uint64_t v3 = v2 ? sub_25D15B750() : *(void *)(v1 + 16);
    swift_bridgeObjectRelease();
    if (v3) {
      return 1;
    }
  }
  return result;
}

BOOL INSendMessageIntent.hasContent.getter()
{
  uint64_t v1 = sub_25D12DF14(v0);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v1;
  unint64_t v4 = v2;
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v3 & 0xFFFFFFFFFFFFLL;
  }
  return v5 != 0;
}

uint64_t INSendMessageIntent.isGroupMessage.getter()
{
  if (!sub_25D12F544(v0, (SEL *)&selRef_recipients, &qword_26A660E20)
    || ((OUTLINED_FUNCTION_1_11(), v2) ? (uint64_t v3 = sub_25D15B750()) : (uint64_t v3 = *(void *)(v1 + 16)),
        swift_bridgeObjectRelease(),
        v3 <= 1))
  {
    uint64_t result = (uint64_t)objc_msgSend(v0, sel_speakableGroupName);
    if (!result) {
      return result;
    }
  }
  return 1;
}

BOOL INSendMessageIntent.isAudioMessage.getter()
{
  return objc_msgSend(v0, sel_outgoingMessageType) == (id)2;
}

BOOL INSendMessageIntent.isTextMessage.getter()
{
  return objc_msgSend(v0, sel_outgoingMessageType) == (id)1;
}

BOOL INSendMessageIntent.supportsCorrection.getter()
{
  if (sub_25D12F544(v0, (SEL *)&selRef_recipients, &qword_26A660E20)
    && ((OUTLINED_FUNCTION_1_11(), v2) ? (uint64_t v3 = sub_25D15B750()) : (uint64_t v3 = *(void *)(v1 + 16)),
        (swift_bridgeObjectRelease(), v3 == 1)
     && (id v4 = objc_msgSend(v0, sel_speakableGroupName), v4, !v4)))
  {
    return !INSendMessageIntent.hasAttachment.getter();
  }
  else
  {
    return 0;
  }
}

SiriMessagesCommon::TextBalloon::ServiceType __swiftcall INSendMessageIntentResponse.serviceType(appBundleIdentifier:)(Swift::String_optional appBundleIdentifier)
{
  id v4 = v1;
  if (!appBundleIdentifier.value._object) {
    goto LABEL_58;
  }
  if (appBundleIdentifier.value._countAndFlagsBits != 0xD000000000000013
    || appBundleIdentifier.value._object != (void *)0x800000025D162B80)
  {
    LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = sub_25D15B8C0();
    if ((appBundleIdentifier.value._countAndFlagsBits & 1) == 0) {
      goto LABEL_58;
    }
  }
  unint64_t v5 = sub_25D12F544(v2, (SEL *)&selRef_sentMessages, &qword_26A660E18);
  unint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  if (v5 >> 62)
  {
    appBundleIdentifier.value._uint64_t countAndFlagsBits = sub_25D15B750();
    if (appBundleIdentifier.value._countAndFlagsBits) {
      goto LABEL_8;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v9 = 0;
    unint64_t v6 = 0;
    goto LABEL_15;
  }
  appBundleIdentifier.value._uint64_t countAndFlagsBits = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!appBundleIdentifier.value._countAndFlagsBits) {
    goto LABEL_14;
  }
LABEL_8:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x2611A4F30](0, v6);
  }
  else
  {
    if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return appBundleIdentifier.value._countAndFlagsBits;
    }
    id v7 = *(id *)(v6 + 32);
  }
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_25D12F5B8(v8);
  unint64_t v6 = v10;
LABEL_15:
  uint64_t v11 = sub_25D15B4A0();
  if (v6)
  {
    if (v11 == v9 && v6 == v12) {
      goto LABEL_30;
    }
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_2_6();
    if (v3) {
      goto LABEL_31;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = sub_25D15B4A0();
  if (!v6)
  {
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  if (v14 != v9 || v6 != v15)
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_2_6();
    if (v3) {
      goto LABEL_31;
    }
LABEL_33:
    uint64_t v18 = sub_25D15B4A0();
    if (v6)
    {
      if (v18 == v9 && v6 == v19) {
        goto LABEL_60;
      }
      OUTLINED_FUNCTION_0_4();
      OUTLINED_FUNCTION_2_6();
      if (v3) {
        goto LABEL_61;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v21 = sub_25D15B4A0();
    if (v6)
    {
      if (v21 == v9 && v6 == v22) {
        goto LABEL_60;
      }
      OUTLINED_FUNCTION_0_4();
      OUTLINED_FUNCTION_2_6();
      if (v3) {
        goto LABEL_61;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v24 = sub_25D15B4A0();
    if (!v6)
    {
      LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = swift_bridgeObjectRelease();
      goto LABEL_58;
    }
    if (v24 != v9 || v6 != v25)
    {
      char v27 = OUTLINED_FUNCTION_0_4();
      swift_bridgeObjectRelease();
      LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = swift_bridgeObjectRelease();
      if (v27) {
        goto LABEL_62;
      }
LABEL_58:
      char v17 = 2;
      goto LABEL_59;
    }
LABEL_60:
    swift_bridgeObjectRelease();
LABEL_61:
    LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = swift_bridgeObjectRelease();
LABEL_62:
    char v17 = 1;
    goto LABEL_59;
  }
LABEL_30:
  swift_bridgeObjectRelease();
LABEL_31:
  LOBYTE(appBundleIdentifier.value._countAndFlagsBits) = swift_bridgeObjectRelease();
  char v17 = 0;
LABEL_59:
  *id v4 = v17;
  return appBundleIdentifier.value._countAndFlagsBits;
}

uint64_t INIntent.launchBundleIdentifier.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A50);
  MEMORY[0x270FA5388](v1 - 8);
  char v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25D12F628(v0);
  uint64_t v6 = v4;
  if (v5)
  {
    v9[2] = v4;
    v9[3] = v5;
    v9[0] = 0xD000000000000010;
    v9[1] = 0x800000025D163250;
    sub_25D12F68C();
    sub_25D12F6D8();
    if (sub_25D15B480())
    {
      sub_25D15B1B0();
      swift_bridgeObjectRelease();
      uint64_t v7 = sub_25D15B1C0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v7) == 1)
      {
        sub_25D121814((uint64_t)v3);
        return 0;
      }
      else
      {
        uint64_t v6 = sub_25D15B1A0();
        (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v3, v7);
      }
    }
  }
  return v6;
}

uint64_t INIntent.clone()()
{
  swift_getObjectType();
  objc_msgSend(v0, sel_copy);
  sub_25D15B680();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  return v2;
}

unint64_t sub_25D12F520(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25D12F544(void *a1, SEL *a2, unint64_t *a3)
{
  id v4 = [a1 *a2];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  sub_25D1232A0(0, a3);
  uint64_t v6 = sub_25D15B560();

  return v6;
}

uint64_t sub_25D12F5B8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_serviceName);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25D15B4A0();

  return v3;
}

uint64_t sub_25D12F628(void *a1)
{
  id v1 = objc_msgSend(a1, sel_launchId);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_25D15B4A0();

  return v3;
}

unint64_t sub_25D12F68C()
{
  unint64_t result = qword_26A660E08;
  if (!qword_26A660E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E08);
  }
  return result;
}

unint64_t sub_25D12F6D8()
{
  unint64_t result = qword_26A660E10;
  if (!qword_26A660E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E10);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_25D15B8C0();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D12F76C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD00000000000001BLL;
  }
  else {
    unint64_t v3 = 0x75416C65636E6163;
  }
  if (v2) {
    unint64_t v4 = 0xEE00646E65536F74;
  }
  else {
    unint64_t v4 = 0x800000025D162B20;
  }
  if (a2) {
    unint64_t v5 = 0xD00000000000001BLL;
  }
  else {
    unint64_t v5 = 0x75416C65636E6163;
  }
  if (a2) {
    unint64_t v6 = 0x800000025D162B20;
  }
  else {
    unint64_t v6 = 0xEE00646E65536F74;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25D15B8C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25D12F81C(uint64_t a1, uint64_t a2)
{
  return sub_25D12F84C(a1, a2, (uint64_t (*)(void))DirectInvocationURI.rawValue.getter);
}

uint64_t sub_25D12F834(uint64_t a1, uint64_t a2)
{
  return sub_25D12F84C(a1, a2, DirectButton.rawValue.getter);
}

uint64_t sub_25D12F84C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25D15B8C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25D12F8F0(uint64_t a1)
{
  return sub_25D12FAA4(0, a1, (void (*)(uint64_t))DirectButton.rawValue.getter);
}

uint64_t sub_25D12F924(uint64_t a1)
{
  return sub_25D12FAA4(0, a1, (void (*)(uint64_t))DirectInvocationURI.rawValue.getter);
}

uint64_t sub_25D12F958()
{
  return sub_25D12FB10();
}

uint64_t sub_25D12F964()
{
  sub_25D15B4E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25D12F9E0(uint64_t a1, uint64_t a2)
{
  return sub_25D12FA10(a1, a2, (void (*)(void))DirectInvocationURI.rawValue.getter);
}

uint64_t sub_25D12F9F8(uint64_t a1, uint64_t a2)
{
  return sub_25D12FA10(a1, a2, (void (*)(void))DirectButton.rawValue.getter);
}

uint64_t sub_25D12FA10(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_25D15B4E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25D12FA74(uint64_t a1, uint64_t a2)
{
  return sub_25D12FAA4(a1, a2, (void (*)(uint64_t))DirectButton.rawValue.getter);
}

uint64_t sub_25D12FA8C(uint64_t a1, uint64_t a2)
{
  return sub_25D12FAA4(a1, a2, (void (*)(uint64_t))DirectInvocationURI.rawValue.getter);
}

uint64_t sub_25D12FAA4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_25D15B970();
  a3(v4);
  sub_25D15B4E0();
  swift_bridgeObjectRelease();
  return sub_25D15B990();
}

uint64_t sub_25D12FB10()
{
  return sub_25D15B990();
}

SiriMessagesCommon::AutoSendableButtonAction_optional __swiftcall AutoSendableButtonAction.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  uint64_t v3 = sub_25D15B770();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  char *v2 = v5;
  return result;
}

uint64_t AutoSendableButtonAction.rawValue.getter()
{
  if (*v0) {
    return 0xD00000000000001BLL;
  }
  else {
    return 0x75416C65636E6163;
  }
}

uint64_t sub_25D12FC50(char *a1, char *a2)
{
  return sub_25D12F76C(*a1, *a2);
}

unint64_t sub_25D12FC60()
{
  unint64_t result = qword_26A660E30;
  if (!qword_26A660E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E30);
  }
  return result;
}

uint64_t sub_25D12FCAC()
{
  return sub_25D12F958();
}

uint64_t sub_25D12FCB4()
{
  return sub_25D12F964();
}

uint64_t sub_25D12FCBC()
{
  return sub_25D12FB10();
}

SiriMessagesCommon::AutoSendableButtonAction_optional sub_25D12FCC4(Swift::String *a1)
{
  return AutoSendableButtonAction.init(rawValue:)(*a1);
}

uint64_t sub_25D12FCD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AutoSendableButtonAction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25D12FCF8()
{
  return sub_25D15B530();
}

uint64_t sub_25D12FD58()
{
  return sub_25D15B520();
}

uint64_t dispatch thunk of AutoSendableButton.shouldAutoSend.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AutoSendableButton.autoSendTimeout.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AutoSendableButton.delayedActionCancelCommand.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AutoSendableButton.handleIntent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AutoSendableButton.speechSynthesisId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AutoSendableButton.isFirstPartyApp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AutoSendableButton.responseMode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

unsigned char *storeEnumTagSinglePayload for AutoSendableButtonAction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D12FF00);
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

ValueMetadata *type metadata accessor for AutoSendableButtonAction()
{
  return &type metadata for AutoSendableButtonAction;
}

unint64_t sub_25D12FF38()
{
  unint64_t result = qword_26A660E38;
  if (!qword_26A660E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E38);
  }
  return result;
}

SiriMessagesCommon::CancelAutoSend __swiftcall CancelAutoSend.init()()
{
  unsigned char *v0 = 1;
  return result;
}

uint64_t sub_25D12FF90(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x75416C65636E6163 && a2 == 0xEE00646E65536F74)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25D130030()
{
  return 0x75416C65636E6163;
}

uint64_t sub_25D130058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D12FF90(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D130084(uint64_t a1)
{
  unint64_t v2 = sub_25D1301E4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1300C0(uint64_t a1)
{
  unint64_t v2 = sub_25D1301E4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CancelAutoSend.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660E40);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_2_7();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1301E4();
  sub_25D15B9D0();
  sub_25D15B860();
  uint64_t v3 = OUTLINED_FUNCTION_1_12();
  return v4(v3);
}

unint64_t sub_25D1301E4()
{
  unint64_t result = qword_26A660E48;
  if (!qword_26A660E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E48);
  }
  return result;
}

uint64_t CancelAutoSend.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660E50);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_7();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1301E4();
  sub_25D15B9B0();
  if (!v2)
  {
    char v6 = sub_25D15B7D0();
    uint64_t v7 = OUTLINED_FUNCTION_1_12();
    v8(v7);
    *a2 = v6 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25D130338()
{
  return sub_25D15B2D0();
}

uint64_t sub_25D1303A4()
{
  return sub_25D15B2C0();
}

uint64_t sub_25D1303F8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return CancelAutoSend.init(from:)(a1, a2);
}

uint64_t sub_25D130410(void *a1)
{
  return CancelAutoSend.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for CancelAutoSend(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CancelAutoSend(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D13058CLL);
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

ValueMetadata *type metadata accessor for CancelAutoSend()
{
  return &type metadata for CancelAutoSend;
}

unsigned char *storeEnumTagSinglePayload for CancelAutoSend.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D130660);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CancelAutoSend.CodingKeys()
{
  return &type metadata for CancelAutoSend.CodingKeys;
}

unint64_t sub_25D13069C()
{
  unint64_t result = qword_26A660E58;
  if (!qword_26A660E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E58);
  }
  return result;
}

unint64_t sub_25D1306EC()
{
  unint64_t result = qword_26A660E60;
  if (!qword_26A660E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E60);
  }
  return result;
}

unint64_t sub_25D13073C()
{
  unint64_t result = qword_26A660E68;
  if (!qword_26A660E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E68);
  }
  return result;
}

unint64_t sub_25D130788()
{
  unint64_t result = qword_26A660E70;
  if (!qword_26A660E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E70);
  }
  return result;
}

unint64_t sub_25D1307D4()
{
  unint64_t result = qword_26A660E78;
  if (!qword_26A660E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660E78);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return v0;
}

uint64_t SnippetLabels.send.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.undoSend.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.cancel.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.change.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.done.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.audioMessage.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.readingInProgress.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.unreadMessages.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.changeContact.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.placeholderAttachment.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.newMessage.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.toWithColon.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.toWho.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t SnippetLabels.payloadPrompt.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

void __swiftcall SnippetLabels.init(send:undoSend:cancel:change:done:audioMessage:readingInProgress:unreadMessages:changeContact:placeholderAttachment:newMessage:toWithColon:toWho:payloadPrompt:)(SiriMessagesCommon::SnippetLabels *__return_ptr retstr, Swift::String send, Swift::String undoSend, Swift::String cancel, Swift::String change, Swift::String done, Swift::String audioMessage, Swift::String readingInProgress, Swift::String unreadMessages, Swift::String changeContact, Swift::String placeholderAttachment, Swift::String newMessage, Swift::String toWithColon, Swift::String toWho, Swift::String payloadPrompt)
{
  retstr->send = send;
  retstr->undoSend = undoSend;
  retstr->cancel = cancel;
  retstr->change = change;
  retstr->done = done;
  retstr->audioMessage = audioMessage;
  retstr->readingInProgress = readingInProgress;
  retstr->unreadMessages = unreadMessages;
  retstr->changeContact = changeContact;
  retstr->placeholderAttachment = placeholderAttachment;
  retstr->newMessage = newMessage;
  retstr->toWithColon = toWithColon;
  retstr->toWho = toWho;
  retstr->payloadPrompt = payloadPrompt;
}

uint64_t sub_25D130B1C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1684956531 && a2 == 0xE400000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x646E65536F646E75 && a2 == 0xE800000000000000;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C65636E6163 && a2 == 0xE600000000000000;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x65676E616863 && a2 == 0xE600000000000000;
        if (v8 || (sub_25D15B8C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 1701736292 && a2 == 0xE400000000000000;
          if (v9 || (sub_25D15B8C0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x73654D6F69647561 && a2 == 0xEC00000065676173;
            if (v10 || (sub_25D15B8C0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD000000000000011 && a2 == 0x800000025D163270 || (sub_25D15B8C0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x654D646165726E75 && a2 == 0xEE00736567617373;
              if (v11 || (sub_25D15B8C0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                BOOL v12 = a1 == 0x6F4365676E616863 && a2 == 0xED0000746361746ELL;
                if (v12 || (sub_25D15B8C0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else if (a1 == 0xD000000000000015 && a2 == 0x800000025D163290 || (sub_25D15B8C0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else
                {
                  BOOL v13 = a1 == 0x617373654D77656ELL && a2 == 0xEA00000000006567;
                  if (v13 || (sub_25D15B8C0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 10;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x6F43687469576F74 && a2 == 0xEB000000006E6F6CLL;
                    if (v14 || (sub_25D15B8C0() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 11;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x6F68576F74 && a2 == 0xE500000000000000;
                      if (v15 || (sub_25D15B8C0() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 12;
                      }
                      else if (a1 == 0x5064616F6C796170 && a2 == 0xED000074706D6F72)
                      {
                        swift_bridgeObjectRelease();
                        return 13;
                      }
                      else
                      {
                        char v17 = sub_25D15B8C0();
                        swift_bridgeObjectRelease();
                        if (v17) {
                          return 13;
                        }
                        else {
                          return 14;
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

uint64_t sub_25D131070()
{
  return 14;
}

uint64_t sub_25D131078(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x646E65536F646E75;
      break;
    case 2:
      uint64_t result = 0x6C65636E6163;
      break;
    case 3:
      uint64_t result = 0x65676E616863;
      break;
    case 4:
      uint64_t result = 1701736292;
      break;
    case 5:
      uint64_t result = 0x73654D6F69647561;
      break;
    case 6:
      return result;
    case 7:
      uint64_t result = 0x654D646165726E75;
      break;
    case 8:
      uint64_t v3 = 0x65676E616863;
      goto LABEL_13;
    case 9:
      uint64_t result = 0xD000000000000015;
      break;
    case 10:
      uint64_t result = 0x617373654D77656ELL;
      break;
    case 11:
      uint64_t v3 = 0x687469576F74;
LABEL_13:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6F43000000000000;
      break;
    case 12:
      uint64_t result = 0x6F68576F74;
      break;
    case 13:
      uint64_t result = 0x5064616F6C796170;
      break;
    default:
      uint64_t result = 1684956531;
      break;
  }
  return result;
}

uint64_t sub_25D131240()
{
  return sub_25D131078(*v0);
}

uint64_t sub_25D131248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D130B1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D131270@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D131070();
  *a1 = result;
  return result;
}

uint64_t sub_25D131298(uint64_t a1)
{
  unint64_t v2 = sub_25D1316D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1312D4(uint64_t a1)
{
  unint64_t v2 = sub_25D1316D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SnippetLabels.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660F60);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[2];
  v24[23] = v1[3];
  v24[24] = v8;
  uint64_t v9 = v1[4];
  v24[21] = v1[5];
  v24[22] = v9;
  uint64_t v10 = v1[6];
  v24[19] = v1[7];
  v24[20] = v10;
  uint64_t v11 = v1[8];
  v24[17] = v1[9];
  v24[18] = v11;
  uint64_t v12 = v1[11];
  v24[15] = v1[10];
  v24[16] = v12;
  uint64_t v13 = v1[12];
  v24[13] = v1[13];
  v24[14] = v13;
  uint64_t v14 = v1[14];
  v24[11] = v1[15];
  v24[12] = v14;
  uint64_t v15 = v1[16];
  v24[9] = v1[17];
  v24[10] = v15;
  uint64_t v16 = v1[18];
  v24[7] = v1[19];
  v24[8] = v16;
  v24[6] = v1[20];
  v24[5] = v1[21];
  v24[4] = v1[22];
  v24[3] = v1[23];
  v24[2] = v1[24];
  v24[1] = v1[25];
  uint64_t v17 = v1[27];
  v24[0] = v1[26];
  uint64_t v18 = a1[3];
  uint64_t v19 = a1;
  uint64_t v21 = v20;
  __swift_project_boxed_opaque_existential_1(v19, v18);
  sub_25D1316D4();
  sub_25D15B9D0();
  char v39 = 0;
  uint64_t v22 = v25;
  sub_25D15B850();
  if (!v22)
  {
    uint64_t v25 = v17;
    char v38 = 1;
    OUTLINED_FUNCTION_4_6();
    char v37 = 2;
    OUTLINED_FUNCTION_4_6();
    char v36 = 3;
    OUTLINED_FUNCTION_4_6();
    char v35 = 4;
    OUTLINED_FUNCTION_4_6();
    char v34 = 5;
    OUTLINED_FUNCTION_4_6();
    char v33 = 6;
    OUTLINED_FUNCTION_4_6();
    char v32 = 7;
    OUTLINED_FUNCTION_4_6();
    char v31 = 8;
    OUTLINED_FUNCTION_4_6();
    char v30 = 9;
    OUTLINED_FUNCTION_4_6();
    char v29 = 10;
    sub_25D15B850();
    char v28 = 11;
    OUTLINED_FUNCTION_7_5();
    char v27 = 12;
    OUTLINED_FUNCTION_7_5();
    char v26 = 13;
    OUTLINED_FUNCTION_7_5();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v21);
}

unint64_t sub_25D1316D4()
{
  unint64_t result = qword_26A660F68;
  if (!qword_26A660F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660F68);
  }
  return result;
}

uint64_t SnippetLabels.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660F70);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  uint64_t v70 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1316D4();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  unint64_t v69 = a2;
  uint64_t v6 = OUTLINED_FUNCTION_1_13();
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_5_5(1);
  uint64_t v66 = v8;
  uint64_t v9 = OUTLINED_FUNCTION_1_13();
  uint64_t v11 = v10;
  uint64_t v68 = v9;
  OUTLINED_FUNCTION_5_5(2);
  uint64_t v65 = v11;
  uint64_t v12 = OUTLINED_FUNCTION_1_13();
  uint64_t v14 = v13;
  uint64_t v67 = v12;
  OUTLINED_FUNCTION_5_5(3);
  uint64_t v64 = v14;
  uint64_t v15 = OUTLINED_FUNCTION_1_13();
  uint64_t v17 = v16;
  uint64_t v53 = v15;
  OUTLINED_FUNCTION_5_5(4);
  uint64_t v63 = v17;
  uint64_t v18 = OUTLINED_FUNCTION_1_13();
  uint64_t v20 = v19;
  uint64_t v52 = v18;
  OUTLINED_FUNCTION_5_5(5);
  uint64_t v62 = v20;
  uint64_t v21 = OUTLINED_FUNCTION_1_13();
  uint64_t v23 = v22;
  uint64_t v51 = v21;
  OUTLINED_FUNCTION_5_5(6);
  uint64_t v61 = v23;
  uint64_t v24 = OUTLINED_FUNCTION_1_13();
  uint64_t v26 = v25;
  uint64_t v50 = v24;
  OUTLINED_FUNCTION_5_5(7);
  uint64_t v60 = v26;
  uint64_t v49 = OUTLINED_FUNCTION_1_13();
  uint64_t v28 = v27;
  swift_bridgeObjectRetain();
  uint64_t v48 = OUTLINED_FUNCTION_1_13();
  uint64_t v59 = v28;
  uint64_t v58 = v29;
  swift_bridgeObjectRetain();
  uint64_t v30 = OUTLINED_FUNCTION_1_13();
  uint64_t v57 = v31;
  uint64_t v32 = v30;
  swift_bridgeObjectRetain();
  uint64_t v33 = OUTLINED_FUNCTION_6_5();
  uint64_t v56 = v34;
  int v73 = 1;
  uint64_t v35 = v33;
  swift_bridgeObjectRetain();
  uint64_t v36 = OUTLINED_FUNCTION_6_5();
  uint64_t v55 = v37;
  uint64_t v38 = v36;
  LOBYTE(v72[0]) = 12;
  swift_bridgeObjectRetain();
  uint64_t v47 = OUTLINED_FUNCTION_6_5();
  uint64_t v54 = v39;
  char v74 = 13;
  swift_bridgeObjectRetain();
  uint64_t v40 = OUTLINED_FUNCTION_6_5();
  uint64_t v46 = v41;
  uint64_t v42 = v40;
  uint64_t v43 = OUTLINED_FUNCTION_0_6();
  v44(v43);
  v71[0] = v6;
  v71[1] = v66;
  v71[2] = v68;
  v71[3] = v65;
  v71[4] = v67;
  v71[5] = v64;
  v71[6] = v53;
  v71[7] = v63;
  v71[8] = v52;
  v71[9] = v62;
  v71[10] = v51;
  v71[11] = v61;
  v71[12] = v50;
  v71[13] = v60;
  v71[14] = v49;
  v71[15] = v59;
  v71[16] = v48;
  v71[17] = v58;
  v71[18] = v32;
  v71[19] = v57;
  v71[20] = v35;
  v71[21] = v56;
  v71[22] = v38;
  v71[23] = v55;
  v71[24] = v47;
  v71[25] = v54;
  v71[26] = v42;
  v71[27] = v46;
  sub_25D11BCD0((uint64_t)v71);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v69, v71, 0xE0uLL);
  __swift_destroy_boxed_opaque_existential_1(v70);
  v72[0] = v6;
  v72[1] = v66;
  v72[2] = v68;
  v72[3] = v65;
  v72[4] = v67;
  v72[5] = v64;
  v72[6] = v53;
  v72[7] = v63;
  v72[8] = v52;
  v72[9] = v62;
  v72[10] = v51;
  v72[11] = v61;
  v72[12] = v50;
  v72[13] = v60;
  v72[14] = v49;
  v72[15] = v59;
  v72[16] = v48;
  v72[17] = v58;
  v72[18] = v32;
  v72[19] = v57;
  v72[20] = v35;
  v72[21] = v56;
  v72[22] = v38;
  v72[23] = v55;
  v72[24] = v47;
  v72[25] = v54;
  v72[26] = v42;
  v72[27] = v46;
  return sub_25D132170((uint64_t)v72);
}

uint64_t sub_25D132170(uint64_t a1)
{
  return a1;
}

uint64_t sub_25D132268@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return SnippetLabels.init(from:)(a1, a2);
}

uint64_t sub_25D132280(void *a1)
{
  return SnippetLabels.encode(to:)(a1);
}

void sub_25D132298()
{
  qword_26A660E80 = 1684956499;
  qword_26A660E88 = 0xE400000000000000;
  qword_26A660E90 = 0x6E6553206F646E55;
  unk_26A660E98 = 0xE900000000000064;
  qword_26A660EA0 = 0x6C65636E6143;
  qword_26A660EA8 = 0xE600000000000000;
  qword_26A660EB0 = 0x65676E616843;
  unk_26A660EB8 = 0xE600000000000000;
  qword_26A660EC0 = 1701736260;
  qword_26A660EC8 = 0xE400000000000000;
  strcpy((char *)&qword_26A660ED0, "Audio Message");
  unk_26A660EDE = -4864;
  qword_26A660EE0 = 0xE2676E6964616552;
  qword_26A660EE8 = 0xAA0000000000A680;
  qword_26A660EF0 = 0x4D20646165726E55;
  qword_26A660EF8 = 0xEF73656761737365;
  strcpy((char *)&qword_26A660F00, "Change Contact");
  HIBYTE(qword_26A660F08) = -18;
  qword_26A660F10 = 0xD000000000000014;
  unk_26A660F18 = 0x800000025D1632B0;
  qword_26A660F20 = 0x7373654D2077654ELL;
  unk_26A660F28 = 0xEB00000000656761;
  qword_26A660F30 = 3829588;
  qword_26A660F38 = 0xE300000000000000;
  qword_26A660F40 = 0x3F6F6877206F54;
  unk_26A660F48 = 0xE700000000000000;
  qword_26A660F50 = 0xD000000000000018;
  unk_26A660F58 = 0x800000025D1632D0;
}

uint64_t static LabelsProvider.current.getter()
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  memcpy(__dst, &qword_26A660E80, sizeof(__dst));
  uint64_t v0 = (void *)OUTLINED_FUNCTION_2_8();
  memcpy(v0, v1, 0xE0uLL);
  return sub_25D11BCD0((uint64_t)__dst);
}

uint64_t static LabelsProvider.current.setter(const void *a1)
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  memcpy(__dst, &qword_26A660E80, sizeof(__dst));
  memcpy(&qword_26A660E80, a1, 0xE0uLL);
  return sub_25D132170((uint64_t)__dst);
}

uint64_t (*static LabelsProvider.current.modify())()
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t destroy for SnippetLabels()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SnippetLabels(void *a1, void *a2)
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
  uint64_t v11 = a2[17];
  a1[16] = a2[16];
  a1[17] = v11;
  uint64_t v12 = a2[19];
  a1[18] = a2[18];
  a1[19] = v12;
  uint64_t v13 = a2[21];
  a1[20] = a2[20];
  a1[21] = v13;
  uint64_t v14 = a2[23];
  a1[22] = a2[22];
  a1[23] = v14;
  uint64_t v15 = a2[25];
  a1[24] = a2[24];
  a1[25] = v15;
  uint64_t v16 = a2[27];
  a1[26] = a2[26];
  a1[27] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

void *assignWithCopy for SnippetLabels(void *a1, void *a2)
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
  a1[16] = a2[16];
  a1[17] = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  a1[19] = a2[19];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[20] = a2[20];
  a1[21] = a2[21];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[22] = a2[22];
  a1[23] = a2[23];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[24] = a2[24];
  a1[25] = a2[25];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[26] = a2[26];
  a1[27] = a2[27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy224_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xE0uLL);
}

void *assignWithTake for SnippetLabels(void *a1, void *a2)
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
  uint64_t v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = a2[21];
  a1[20] = a2[20];
  a1[21] = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = a2[23];
  a1[22] = a2[22];
  a1[23] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = a2[25];
  a1[24] = a2[24];
  a1[25] = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = a2[27];
  a1[26] = a2[26];
  a1[27] = v17;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetLabels(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 224))
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

uint64_t storeEnumTagSinglePayload for SnippetLabels(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 216) = 0;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
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
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 224) = 1;
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
    *(unsigned char *)(result + 224) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SnippetLabels()
{
  return &type metadata for SnippetLabels;
}

ValueMetadata *type metadata accessor for LabelsProvider()
{
  return &type metadata for LabelsProvider;
}

unsigned char *storeEnumTagSinglePayload for SnippetLabels.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x25D132C4CLL);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SnippetLabels.CodingKeys()
{
  return &type metadata for SnippetLabels.CodingKeys;
}

unint64_t sub_25D132C88()
{
  unint64_t result = qword_26A660F78;
  if (!qword_26A660F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660F78);
  }
  return result;
}

unint64_t sub_25D132CD8()
{
  unint64_t result = qword_26A660F80;
  if (!qword_26A660F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660F80);
  }
  return result;
}

unint64_t sub_25D132D28()
{
  unint64_t result = qword_26A660F88;
  if (!qword_26A660F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660F88);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return sub_25D15B7C0();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_25D15B850();
}

uint64_t OUTLINED_FUNCTION_5_5@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 + 472) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_25D15B7C0();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return sub_25D15B850();
}

void __swiftcall CarPlayHeader.init(contactName:contactIdentifiers:shouldShowAnnounceButton:isAnnounceEnabled:appBundleIdentifier:)(SiriMessagesCommon::CarPlayHeader *__return_ptr retstr, Swift::String contactName, Swift::OpaquePointer contactIdentifiers, Swift::Bool shouldShowAnnounceButton, Swift::Bool isAnnounceEnabled, Swift::String appBundleIdentifier)
{
  retstr->contactName = contactName;
  retstr->contactIdentifiers = contactIdentifiers;
  retstr->shouldShowAnnounceButton = shouldShowAnnounceButton;
  retstr->isAnnounceEnabled = isAnnounceEnabled;
  retstr->appBundleIdentifier = appBundleIdentifier;
}

uint64_t CarPlayHeader.contactName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CarPlayHeader.contactName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*CarPlayHeader.contactName.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.contactIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CarPlayHeader.contactIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*CarPlayHeader.contactIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.shouldShowAnnounceButton.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t CarPlayHeader.shouldShowAnnounceButton.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*CarPlayHeader.shouldShowAnnounceButton.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.isAnnounceEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t CarPlayHeader.isAnnounceEnabled.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

uint64_t (*CarPlayHeader.isAnnounceEnabled.modify())()
{
  return nullsub_1;
}

uint64_t CarPlayHeader.appBundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CarPlayHeader.appBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*CarPlayHeader.appBundleIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D132FF8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025D1632F0 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025D163310 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025D163330 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025D163350)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_25D1331FC(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      unint64_t result = 0x4E746361746E6F63;
      break;
  }
  return result;
}

unint64_t sub_25D1332B8()
{
  return sub_25D1331FC(*v0);
}

uint64_t sub_25D1332C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D132FF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D1332E8(uint64_t a1)
{
  unint64_t v2 = sub_25D13356C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D133324(uint64_t a1)
{
  unint64_t v2 = sub_25D13356C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarPlayHeader.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660F90);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v1 + 16);
  int v9 = *(unsigned __int8 *)(v1 + 24);
  int v14 = *(unsigned __int8 *)(v1 + 25);
  int v15 = v9;
  uint64_t v10 = *(void *)(v1 + 32);
  v13[0] = *(void *)(v1 + 40);
  v13[1] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13356C();
  sub_25D15B9D0();
  char v23 = 0;
  uint64_t v11 = v17;
  sub_25D15B850();
  if (!v11)
  {
    uint64_t v18 = v16;
    char v22 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660FA0);
    sub_25D1335B8();
    sub_25D15B880();
    char v21 = 2;
    sub_25D15B860();
    char v20 = 3;
    sub_25D15B860();
    char v19 = 4;
    sub_25D15B850();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_25D13356C()
{
  unint64_t result = qword_26A660F98;
  if (!qword_26A660F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660F98);
  }
  return result;
}

unint64_t sub_25D1335B8()
{
  unint64_t result = qword_26A660FA8;
  if (!qword_26A660FA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A660FA0);
    sub_25D1339CC(&qword_26A660FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660FA8);
  }
  return result;
}

uint64_t CarPlayHeader.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660FC0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13356C();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_25D15B7C0();
  uint64_t v8 = v7;
  uint64_t v18 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660FA0);
  sub_25D133934();
  swift_bridgeObjectRetain();
  sub_25D15B7F0();
  swift_bridgeObjectRetain();
  char v17 = sub_25D15B7D0();
  char v16 = sub_25D15B7D0();
  uint64_t v9 = sub_25D15B7C0();
  uint64_t v12 = v11;
  uint64_t v13 = v9;
  uint64_t v14 = OUTLINED_FUNCTION_1_14();
  v15(v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v19;
  *(unsigned char *)(a2 + 24) = v17 & 1;
  *(unsigned char *)(a2 + 25) = v16 & 1;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_25D133934()
{
  unint64_t result = qword_26A660FC8;
  if (!qword_26A660FC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A660FA0);
    sub_25D1339CC(&qword_26A660FD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660FC8);
  }
  return result;
}

uint64_t sub_25D1339CC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A660FB8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25D133A30@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarPlayHeader.init(from:)(a1, a2);
}

uint64_t sub_25D133A48(void *a1)
{
  return CarPlayHeader.encode(to:)(a1);
}

uint64_t destroy for CarPlayHeader()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CarPlayHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CarPlayHeader(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CarPlayHeader(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayHeader(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for CarPlayHeader(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarPlayHeader()
{
  return &type metadata for CarPlayHeader;
}

unsigned char *storeEnumTagSinglePayload for CarPlayHeader.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x25D133D80);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarPlayHeader.CodingKeys()
{
  return &type metadata for CarPlayHeader.CodingKeys;
}

unint64_t sub_25D133DBC()
{
  unint64_t result = qword_26A660FD8;
  if (!qword_26A660FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660FD8);
  }
  return result;
}

unint64_t sub_25D133E0C()
{
  unint64_t result = qword_26A660FE0;
  if (!qword_26A660FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660FE0);
  }
  return result;
}

unint64_t sub_25D133E5C()
{
  unint64_t result = qword_26A660FE8;
  if (!qword_26A660FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660FE8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return v0;
}

SiriMessagesCommon::UnreadMessagesCompactCarPlayButton __swiftcall UnreadMessagesCompactCarPlayButton.init(text:)(Swift::String text)
{
  object = text._object;
  uint64_t countAndFlagsBits = text._countAndFlagsBits;
  unsigned int v4 = v1;
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = qword_26A660EF0;
  uint64_t v5 = qword_26A660EF8;
  *unsigned int v4 = countAndFlagsBits;
  v4[1] = (uint64_t)object;
  v4[2] = v6;
  v4[3] = v5;
  uint64_t v7 = swift_bridgeObjectRetain();
  result.unreadMessagesLabelText._object = v10;
  result.unreadMessagesLabelText._uint64_t countAndFlagsBits = v9;
  result.text._object = v8;
  result.text._uint64_t countAndFlagsBits = v7;
  return result;
}

uint64_t UnreadMessagesCompactCarPlayButton.text.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UnreadMessagesCompactCarPlayButton.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UnreadMessagesCompactCarPlayButton.text.modify())()
{
  return nullsub_1;
}

uint64_t UnreadMessagesCompactCarPlayButton.unreadMessagesLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UnreadMessagesCompactCarPlayButton.unreadMessagesLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*UnreadMessagesCompactCarPlayButton.unreadMessagesLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D134060(uint64_t a1)
{
  unint64_t v2 = sub_25D134228();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13409C(uint64_t a1)
{
  unint64_t v2 = sub_25D134228();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UnreadMessagesCompactCarPlayButton.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660FF0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  v12[1] = *(void *)(v1 + 24);
  v12[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D134228();
  sub_25D15B9D0();
  char v14 = 0;
  uint64_t v10 = v12[3];
  sub_25D15B850();
  if (!v10)
  {
    char v13 = 1;
    sub_25D15B850();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_25D134228()
{
  unint64_t result = qword_26A660FF8;
  if (!qword_26A660FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A660FF8);
  }
  return result;
}

uint64_t UnreadMessagesCompactCarPlayButton.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  char v22 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661000);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D134228();
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v23 = 0;
    uint64_t v11 = OUTLINED_FUNCTION_2_3();
    uint64_t v13 = v12;
    char v23 = 1;
    swift_bridgeObjectRetain();
    uint64_t v14 = OUTLINED_FUNCTION_2_3();
    uint64_t v16 = v15;
    char v17 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v21 = v14;
    v17(v9, v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v19 = v21;
    uint64_t v18 = v22;
    *char v22 = v11;
    v18[1] = v13;
    v18[2] = v19;
    v18[3] = v16;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D134488@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UnreadMessagesCompactCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_25D1344A0(void *a1)
{
  return UnreadMessagesCompactCarPlayButton.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for UnreadMessagesCompactCarPlayButton()
{
  return &type metadata for UnreadMessagesCompactCarPlayButton;
}

unsigned char *storeEnumTagSinglePayload for UnreadMessagesCompactCarPlayButton.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D134594);
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

ValueMetadata *type metadata accessor for UnreadMessagesCompactCarPlayButton.CodingKeys()
{
  return &type metadata for UnreadMessagesCompactCarPlayButton.CodingKeys;
}

unint64_t sub_25D1345D0()
{
  unint64_t result = qword_26A661008;
  if (!qword_26A661008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661008);
  }
  return result;
}

unint64_t sub_25D134620()
{
  unint64_t result = qword_26A661010;
  if (!qword_26A661010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661010);
  }
  return result;
}

unint64_t sub_25D134670()
{
  unint64_t result = qword_26A661018;
  if (!qword_26A661018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661018);
  }
  return result;
}

uint64_t MessageDraftSnippetModel.id.getter()
{
  sub_25D15B220();
  uint64_t v0 = OUTLINED_FUNCTION_2_8();

  return v1(v0);
}

void *MessageDraftSnippetModel.intent.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for MessageDraftSnippetModel() + 20));
  id v2 = v1;
  return v1;
}

uint64_t type metadata accessor for MessageDraftSnippetModel()
{
  uint64_t result = qword_26A6610D8;
  if (!qword_26A6610D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25D13479C(id *a1)
{
  id v1 = *a1;
  MessageDraftSnippetModel.intent.setter();
}

void MessageDraftSnippetModel.intent.setter()
{
  uint64_t v2 = *(int *)(OUTLINED_FUNCTION_10_1() + 20);

  *(void *)(v1 + v2) = v0;
}

void (*MessageDraftSnippetModel.intent.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for MessageDraftSnippetModel() + 20);
  *(_DWORD *)(a1 + 16) = v3;
  unsigned int v4 = *(void **)(v1 + v3);
  *(void *)a1 = v4;
  id v5 = v4;
  return sub_25D134864;
}

void sub_25D134864(uint64_t a1, char a2)
{
  uint64_t v2 = *(int *)(a1 + 16);
  unsigned int v4 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  id v5 = *(void **)(v3 + v2);
  if (a2)
  {
    id v6 = v4;

    *(void *)(v3 + v2) = v4;
  }
  else
  {

    *(void *)(v3 + v2) = v4;
  }
}

uint64_t MessageDraftSnippetModel.contactName.getter()
{
  type metadata accessor for MessageDraftSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  sub_25D15B300();
  return v1;
}

uint64_t sub_25D13492C()
{
  return MessageDraftSnippetModel.contactName.setter();
}

uint64_t MessageDraftSnippetModel.contactName.setter()
{
  return sub_25D15B310();
}

uint64_t (*MessageDraftSnippetModel.contactName.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for MessageDraftSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  v2[4] = sub_25D15B2F0();
  return sub_25D11A220;
}

uint64_t MessageDraftSnippetModel.payload.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t sub_25D134A74(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return MessageDraftSnippetModel.payload.setter(v1, v2);
}

uint64_t MessageDraftSnippetModel.payload.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + *(int *)(type metadata accessor for MessageDraftSnippetModel() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *id v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*MessageDraftSnippetModel.payload.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for MessageDraftSnippetModel() + 28);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (void *)(v1 + v3);
  uint64_t v5 = v4[1];
  *(void *)a1 = *v4;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRetain();
  return sub_25D134B60;
}

uint64_t sub_25D134B60(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)(a1[2] + *((int *)a1 + 6));
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
  }
  return result;
}

uint64_t MessageDraftSnippetModel.shouldUpdateWithASRText.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessageDraftSnippetModel() + 32));
}

uint64_t MessageDraftSnippetModel.shouldUpdateWithASRText.setter(char a1)
{
  uint64_t result = type metadata accessor for MessageDraftSnippetModel();
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*MessageDraftSnippetModel.shouldUpdateWithASRText.modify())()
{
  return nullsub_1;
}

uint64_t MessageDraftSnippetModel.autoSendInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for MessageDraftSnippetModel() + 36));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  *a1 = *v3;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;

  return sub_25D134CCC(v4, v5, v6);
}

uint64_t sub_25D134CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 MessageDraftSnippetModel.autoSendInfo.setter(long long *a1)
{
  __n128 v5 = (__n128)a1[1];
  long long v6 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for MessageDraftSnippetModel() + 36));
  sub_25D134D78(*v3, v3[1], v3[2]);
  __n128 result = v5;
  *(_OWORD *)uint64_t v3 = v6;
  *((__n128 *)v3 + 1) = v5;
  v3[4] = v2;
  return result;
}

uint64_t sub_25D134D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*MessageDraftSnippetModel.autoSendInfo.modify())()
{
  return nullsub_1;
}

uint64_t MessageDraftSnippetModel.correctionInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for MessageDraftSnippetModel() + 40));
  uint64_t v4 = *v3;
  LOBYTE(v3) = *((unsigned char *)v3 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = (_BYTE)v3;

  return swift_bridgeObjectRetain();
}

uint64_t MessageDraftSnippetModel.correctionInfo.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = v1 + *(int *)(type metadata accessor for MessageDraftSnippetModel() + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)uint64_t v4 = v2;
  *(unsigned char *)(v4 + 8) = v3;
  return result;
}

uint64_t (*MessageDraftSnippetModel.correctionInfo.modify())()
{
  return nullsub_1;
}

uint64_t MessageDraftSnippetModel.labels.getter()
{
  return sub_25D15B300();
}

uint64_t sub_25D134F20(void *__src)
{
  memcpy(v3, __src, sizeof(v3));
  sub_25D11BCD0((uint64_t)v3);
  return MessageDraftSnippetModel.labels.setter(__src);
}

uint64_t MessageDraftSnippetModel.labels.setter(void *__src)
{
  memcpy(v2, __src, sizeof(v2));
  type metadata accessor for MessageDraftSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  return sub_25D15B310();
}

uint64_t (*MessageDraftSnippetModel.labels.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for MessageDraftSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  v2[4] = sub_25D15B2F0();
  return sub_25D11A220;
}

uint64_t MessageDraftSnippetModel.init(intent:contactName:payload:shouldUpdateWithASRText:autoSendInfo:correctionInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t *a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v27 = a7[1];
  uint64_t v28 = *a7;
  uint64_t v25 = a7[3];
  uint64_t v26 = a7[2];
  uint64_t v23 = *a8;
  uint64_t v24 = a7[4];
  char v22 = *((unsigned char *)a8 + 8);
  uint64_t v12 = (int *)type metadata accessor for MessageDraftSnippetModel();
  uint64_t v13 = v12[5];
  uint64_t v14 = v12[7];
  uint64_t v16 = v12[9];
  uint64_t v15 = v12[10];
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  uint64_t v17 = a9 + v15;
  uint64_t v18 = (void *)(a9 + v16);
  uint64_t v19 = (void *)(a9 + v14);
  swift_beginAccess();
  memcpy(__dst, &qword_26A660E80, 0xE0uLL);
  memcpy(v32, &qword_26A660E80, sizeof(v32));
  sub_25D11BCD0((uint64_t)__dst);
  sub_25D15B2E0();
  sub_25D15B210();
  *(void *)(a9 + v13) = a1;
  v32[0] = a2;
  v32[1] = a3;
  uint64_t result = sub_25D15B2E0();
  *uint64_t v19 = a4;
  v19[1] = a5;
  *(unsigned char *)(a9 + v12[8]) = a6 & 1;
  *uint64_t v18 = v28;
  v18[1] = v27;
  v18[2] = v26;
  v18[3] = v25;
  v18[4] = v24;
  *(void *)uint64_t v17 = v23;
  *(unsigned char *)(v17 + 8) = v22;
  return result;
}

uint64_t MessageDraftSnippetModel.description.getter()
{
  sub_25D15B6E0();
  sub_25D15B4F0();
  uint64_t v1 = type metadata accessor for MessageDraftSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  sub_25D15B300();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  sub_25D15B6E0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  if (*(void *)(v0 + *(int *)(v1 + 36) + 16) != 1) {
    AutoSendInfo.description.getter();
  }
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  swift_bridgeObjectRetain();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25D15B6E0();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + *(int *)(v1 + 40))) {
    CorrectionInfo.description.getter();
  }
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  swift_bridgeObjectRetain();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t AutoSendInfo.description.getter()
{
  return 0;
}

uint64_t CorrectionInfo.description.getter()
{
  return 0;
}

uint64_t sub_25D135778(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
        if (v8 || (sub_25D15B8C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000017 && a2 == 0x800000025D1634A0 || (sub_25D15B8C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x646E65536F747561 && a2 == 0xEC0000006F666E49;
          if (v9 || (sub_25D15B8C0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x6974636572726F63 && a2 == 0xEE006F666E496E6FLL;
            if (v10 || (sub_25D15B8C0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x736C6562616CLL && a2 == 0xE600000000000000)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              char v12 = sub_25D15B8C0();
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

unint64_t sub_25D135A84(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x746E65746E69;
      break;
    case 2:
      unint64_t result = 0x4E746361746E6F63;
      break;
    case 3:
      unint64_t result = 0x64616F6C796170;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0x646E65536F747561;
      break;
    case 6:
      unint64_t result = 0x6974636572726F63;
      break;
    case 7:
      unint64_t result = 0x736C6562616CLL;
      break;
    default:
      unint64_t result = 25705;
      break;
  }
  return result;
}

unint64_t sub_25D135B98()
{
  return sub_25D135A84(*v0);
}

uint64_t sub_25D135BA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D135778(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D135BC8(uint64_t a1)
{
  unint64_t v2 = sub_25D135FB0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D135C04(uint64_t a1)
{
  unint64_t v2 = sub_25D135FB0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MessageDraftSnippetModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661020);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D135FB0();
  sub_25D15B9D0();
  sub_25D15B220();
  sub_25D137844((uint64_t)&unk_26A661030);
  OUTLINED_FUNCTION_15();
  if (!v1)
  {
    type metadata accessor for MessageDraftSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660800);
    sub_25D11BF10((uint64_t)&unk_26A660808);
    OUTLINED_FUNCTION_3_6();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    sub_25D11BF50((uint64_t)&unk_26A660820);
    OUTLINED_FUNCTION_3_6();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A661038);
    sub_25D11BF10((uint64_t)&unk_26A661040);
    OUTLINED_FUNCTION_3_6();
    sub_25D15B860();
    sub_25D135FFC();
    OUTLINED_FUNCTION_8_4();
    sub_25D136048();
    OUTLINED_FUNCTION_8_4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
    sub_25D11BFB4((uint64_t)&unk_26A660830);
    sub_25D15B880();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_25D135FB0()
{
  unint64_t result = qword_26A661028;
  if (!qword_26A661028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661028);
  }
  return result;
}

unint64_t sub_25D135FFC()
{
  unint64_t result = qword_26A661048;
  if (!qword_26A661048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661048);
  }
  return result;
}

unint64_t sub_25D136048()
{
  unint64_t result = qword_26A661050;
  if (!qword_26A661050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661050);
  }
  return result;
}

void MessageDraftSnippetModel.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  OUTLINED_FUNCTION_0();
  uint64_t v49 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_0();
  uint64_t v37 = v6;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4();
  sub_25D15B220();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v10;
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_0();
  uint64_t v12 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661058);
  OUTLINED_FUNCTION_0();
  uint64_t v40 = v14;
  uint64_t v41 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = type metadata accessor for MessageDraftSnippetModel();
  uint64_t v16 = (int *)MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = v16[5];
  *(void *)&v18[v52] = 0;
  uint64_t v19 = &v18[v16[7]];
  *(void *)uint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v51 = v19;
  uint64_t v20 = (uint64_t *)&v18[v16[9]];
  *uint64_t v20 = 0;
  v20[1] = 0;
  v20[3] = 0;
  v20[4] = 0;
  v20[2] = 1;
  uint64_t v21 = &v18[v16[10]];
  *(void *)uint64_t v21 = 0;
  uint64_t v50 = v21;
  v21[8] = 0;
  uint64_t v39 = v16;
  char v22 = &v18[v16[11]];
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  memcpy(v54, &qword_26A660E80, 0xE0uLL);
  memcpy(v53, &qword_26A660E80, sizeof(v53));
  sub_25D11BCD0((uint64_t)v54);
  uint64_t v48 = v22;
  sub_25D15B2E0();
  uint64_t v23 = a1[3];
  unint64_t v45 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_25D135FB0();
  uint64_t v24 = v47;
  sub_25D15B9B0();
  if (v24)
  {
    uint64_t v25 = v46;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);

    swift_bridgeObjectRelease();
    sub_25D134D78(*v20, v20[1], v20[2]);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v25);
  }
  else
  {
    uint64_t v47 = v2;
    LOBYTE(v53[0]) = 0;
    sub_25D137844((uint64_t)&unk_26A661060);
    uint64_t v26 = v44;
    sub_25D15B7F0();
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v18, v12, v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660800);
    char v55 = 1;
    sub_25D11BF10((uint64_t)&unk_26A660850);
    sub_25D15B7F0();
    uint64_t v27 = v46;
    *(void *)&v18[v52] = *(void *)&v53[0];
    LOBYTE(v53[0]) = 2;
    sub_25D11BF50((uint64_t)&unk_26A660860);
    uint64_t v28 = v47;
    uint64_t v29 = v42;
    sub_25D15B7F0();
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(&v18[v39[6]], v28, v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A661038);
    char v55 = 3;
    sub_25D11BF10((uint64_t)&unk_26A661068);
    sub_25D15B7F0();
    *(_OWORD *)uint64_t v51 = v53[0];
    LOBYTE(v53[0]) = 4;
    v18[v39[8]] = sub_25D15B7D0() & 1;
    char v55 = 5;
    sub_25D136814();
    OUTLINED_FUNCTION_5_6();
    uint64_t v30 = *(void *)&v53[2];
    long long v31 = v53[1];
    *(_OWORD *)uint64_t v20 = v53[0];
    *((_OWORD *)v20 + 1) = v31;
    v20[4] = v30;
    char v55 = 6;
    sub_25D136860();
    OUTLINED_FUNCTION_5_6();
    char v32 = BYTE8(v53[0]);
    uint64_t v33 = v50;
    *(void *)uint64_t v50 = *(void *)&v53[0];
    v33[8] = v32;
    LOBYTE(v53[0]) = 7;
    sub_25D11BFB4((uint64_t)&unk_26A660870);
    sub_25D15B7F0();
    OUTLINED_FUNCTION_2_1();
    v34();
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 40))(v48, v37, v27);
    sub_25D1368AC((uint64_t)v18, v36);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    sub_25D136910((uint64_t)v18);
  }
  OUTLINED_FUNCTION_14_0();
}

unint64_t sub_25D136814()
{
  unint64_t result = qword_26A661070;
  if (!qword_26A661070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661070);
  }
  return result;
}

unint64_t sub_25D136860()
{
  unint64_t result = qword_26A661078;
  if (!qword_26A661078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661078);
  }
  return result;
}

uint64_t sub_25D1368AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageDraftSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D136910(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageDraftSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25D136970(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_25D136988(void *a1)
{
  return MessageDraftSnippetModel.encode(to:)(a1);
}

double AutoSendInfo.autoSendTimeout.getter()
{
  return *(double *)v0;
}

void AutoSendInfo.autoSendTimeout.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*AutoSendInfo.autoSendTimeout.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendInfo.delayedActionAceId.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t AutoSendInfo.delayedActionAceId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*AutoSendInfo.delayedActionAceId.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendInfo.speechSynthesisId.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t AutoSendInfo.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*AutoSendInfo.speechSynthesisId.modify())()
{
  return nullsub_1;
}

void __swiftcall AutoSendInfo.init(autoSendTimeout:delayedActionAceId:speechSynthesisId:)(SiriMessagesCommon::AutoSendInfo *__return_ptr retstr, Swift::Double autoSendTimeout, Swift::String_optional delayedActionAceId, Swift::String_optional speechSynthesisId)
{
  retstr->autoSendTimeout = autoSendTimeout;
  retstr->delayedActionAceId = delayedActionAceId;
  retstr->speechSynthesisId = speechSynthesisId;
}

uint64_t sub_25D136AE8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025D1634C0 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025D162B60)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25D136C48(char a1)
{
  if (!a1) {
    return 0x646E65536F747561;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0xD000000000000011;
}

uint64_t sub_25D136CAC()
{
  return sub_25D1182E4();
}

uint64_t sub_25D136CC8()
{
  return sub_25D136C48(*v0);
}

uint64_t sub_25D136CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D136AE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D136CF8(uint64_t a1)
{
  unint64_t v2 = sub_25D136EE4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D136D34(uint64_t a1)
{
  unint64_t v2 = sub_25D136EE4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void AutoSendInfo.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661080);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D136EE4();
  sub_25D15B9D0();
  sub_25D15B870();
  if (!v1)
  {
    OUTLINED_FUNCTION_11_0();
    sub_25D15B830();
    sub_25D15B830();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
  OUTLINED_FUNCTION_14_0();
}

unint64_t sub_25D136EE4()
{
  unint64_t result = qword_26A661088;
  if (!qword_26A661088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661088);
  }
  return result;
}

uint64_t AutoSendInfo.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661090);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D136EE4();
  sub_25D15B9B0();
  if (!v2)
  {
    sub_25D15B7E0();
    uint64_t v7 = v6;
    OUTLINED_FUNCTION_11_0();
    uint64_t v9 = sub_25D15B7A0();
    uint64_t v11 = v10;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25D15B7A0();
    uint64_t v14 = v13;
    uint64_t v17 = v12;
    uint64_t v15 = OUTLINED_FUNCTION_4_7();
    v16(v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v7;
    a2[1] = v9;
    a2[2] = v11;
    a2[3] = v17;
    a2[4] = v14;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D137120@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AutoSendInfo.init(from:)(a1, a2);
}

void sub_25D137138(void *a1)
{
}

uint64_t CorrectionInfo.appBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CorrectionInfo.appBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*CorrectionInfo.appBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t CorrectionInfo.isAuthenticated.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t CorrectionInfo.isAuthenticated.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t (*CorrectionInfo.isAuthenticated.modify())()
{
  return nullsub_1;
}

SiriMessagesCommon::CorrectionInfo __swiftcall CorrectionInfo.init(appBundleIdentifiers:isAuthenticated:)(Swift::OpaquePointer appBundleIdentifiers, Swift::Bool isAuthenticated)
{
  *(Swift::OpaquePointer *)uint64_t v2 = appBundleIdentifiers;
  *(unsigned char *)(v2 + 8) = isAuthenticated;
  result.appBundleIdentifiers = appBundleIdentifiers;
  result.isAuthenticated = isAuthenticated;
  return result;
}

uint64_t sub_25D1371E4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x800000025D1634E0 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65687475417369 && a2 == 0xEF64657461636974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D1372E8(char a1)
{
  if (a1) {
    return 0x6E65687475417369;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_25D137330()
{
  return sub_25D1372E8(*v0);
}

uint64_t sub_25D137338@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D1371E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D137360(uint64_t a1)
{
  unint64_t v2 = sub_25D13753C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13739C(uint64_t a1)
{
  unint64_t v2 = sub_25D13753C();

  return MEMORY[0x270FA00B8](a1, v2);
}

void CorrectionInfo.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661098);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13753C();
  sub_25D15B9D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6610A8);
  sub_25D137754((uint64_t)&unk_26A6610B0);
  OUTLINED_FUNCTION_15();
  if (!v1)
  {
    OUTLINED_FUNCTION_11_0();
    sub_25D15B860();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
  OUTLINED_FUNCTION_14_0();
}

unint64_t sub_25D13753C()
{
  unint64_t result = qword_26A6610A0;
  if (!qword_26A6610A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6610A0);
  }
  return result;
}

void CorrectionInfo.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6610B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13753C();
  sub_25D15B9B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6610A8);
    sub_25D137754((uint64_t)&unk_26A6610C0);
    sub_25D15B7F0();
    OUTLINED_FUNCTION_11_0();
    swift_bridgeObjectRetain();
    char v6 = sub_25D15B7D0();
    uint64_t v7 = OUTLINED_FUNCTION_4_7();
    v8(v7);
    *(void *)a2 = v9;
    *(unsigned char *)(a2 + 8) = v6 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_14_0();
}

unint64_t sub_25D137754(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_8(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6610A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25D1377B4()
{
  return sub_25D137844((uint64_t)&unk_26A6610C8);
}

unint64_t sub_25D1377FC()
{
  return sub_25D137844((uint64_t)&unk_26A6610D0);
}

unint64_t sub_25D137844(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_8(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

void sub_25D137888(void *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_25D1378A0(void *a1)
{
}

void *sub_25D1378BC@<X0>(void *a1@<X8>)
{
  unint64_t result = MessageDraftSnippetModel.intent.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25D1378EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MessageDraftSnippetModel.contactName.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25D13791C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MessageDraftSnippetModel.payload.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_25D13794C@<X0>(void *a1@<X8>)
{
  MessageDraftSnippetModel.labels.getter();
  return memcpy(a1, v3, 0xE0uLL);
}

void *initializeBufferWithCopyOfBuffer for MessageDraftSnippetModel(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    a1 = (void *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25D15B220();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(void *)((char *)a1 + v8) = v10;
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    id v13 = v10;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
    uint64_t v15 = a3[7];
    uint64_t v16 = a3[8];
    uint64_t v17 = (void *)((char *)a1 + v15);
    uint64_t v18 = (void *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    *((unsigned char *)a1 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)a1 + v20;
    char v22 = (char *)a2 + v20;
    uint64_t v23 = *(void *)((char *)a2 + v20 + 16);
    swift_bridgeObjectRetain();
    if (v23 == 1)
    {
      long long v24 = *((_OWORD *)v22 + 1);
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      *((_OWORD *)v21 + 1) = v24;
      *((void *)v21 + 4) = *((void *)v22 + 4);
    }
    else
    {
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      uint64_t v26 = *((void *)v22 + 3);
      uint64_t v27 = *((void *)v22 + 4);
      *((void *)v21 + 2) = v23;
      *((void *)v21 + 3) = v26;
      *((void *)v21 + 4) = v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v28 = a3[10];
    uint64_t v29 = a3[11];
    uint64_t v30 = (char *)a1 + v28;
    long long v31 = (char *)a2 + v28;
    *(void *)uint64_t v30 = *(void *)v31;
    v30[8] = v31[8];
    char v32 = (char *)a1 + v29;
    uint64_t v33 = (char *)a2 + v29;
    swift_bridgeObjectRetain();
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
  }
  return a1;
}

uint64_t destroy for MessageDraftSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25D15B220();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + a2[9] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[11];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t initializeWithCopy for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  uint64_t v10 = a1 + v8;
  uint64_t v11 = a2 + v8;
  id v12 = v9;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v19 = a3[9];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)(a2 + v19 + 16);
  swift_bridgeObjectRetain();
  if (v22 == 1)
  {
    long long v23 = *(_OWORD *)(v21 + 16);
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    *(_OWORD *)(v20 + 16) = v23;
    *(void *)(v20 + 32) = *(void *)(v21 + 32);
  }
  else
  {
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    uint64_t v24 = *(void *)(v21 + 24);
    uint64_t v25 = *(void *)(v21 + 32);
    *(void *)(v20 + 16) = v22;
    *(void *)(v20 + 24) = v24;
    *(void *)(v20 + 32) = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v26 = a3[10];
  uint64_t v27 = a3[11];
  uint64_t v28 = a1 + v26;
  uint64_t v29 = a2 + v26;
  *(void *)uint64_t v28 = *(void *)v29;
  *(unsigned char *)(v28 + 8) = *(unsigned char *)(v29 + 8);
  uint64_t v30 = a1 + v27;
  uint64_t v31 = a2 + v27;
  swift_bridgeObjectRetain();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
  return a1;
}

uint64_t assignWithCopy for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (long long *)(a2 + v18);
  uint64_t v21 = *(void *)(a1 + v18 + 16);
  uint64_t v22 = *(void *)(a2 + v18 + 16);
  if (v21 == 1)
  {
    if (v22 == 1)
    {
      long long v23 = *v20;
      long long v24 = v20[1];
      *(void *)(v19 + 32) = *((void *)v20 + 4);
      *(_OWORD *)uint64_t v19 = v23;
      *(_OWORD *)(v19 + 16) = v24;
    }
    else
    {
      *(void *)uint64_t v19 = *(void *)v20;
      *(void *)(v19 + 8) = *((void *)v20 + 1);
      *(void *)(v19 + 16) = *((void *)v20 + 2);
      *(void *)(v19 + 24) = *((void *)v20 + 3);
      *(void *)(v19 + 32) = *((void *)v20 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v22 == 1)
  {
    sub_25D1380E0(v19);
    uint64_t v25 = *((void *)v20 + 4);
    long long v26 = v20[1];
    *(_OWORD *)uint64_t v19 = *v20;
    *(_OWORD *)(v19 + 16) = v26;
    *(void *)(v19 + 32) = v25;
  }
  else
  {
    *(void *)uint64_t v19 = *(void *)v20;
    *(void *)(v19 + 8) = *((void *)v20 + 1);
    *(void *)(v19 + 16) = *((void *)v20 + 2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v19 + 24) = *((void *)v20 + 3);
    *(void *)(v19 + 32) = *((void *)v20 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v28 + 8) = *(unsigned char *)(v29 + 8);
  uint64_t v30 = a3[11];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 24))(v31, v32, v33);
  return a1;
}

uint64_t sub_25D1380E0(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)(v14 + 32) = *(void *)(v15 + 32);
  long long v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  uint64_t v17 = a1 + v13;
  uint64_t v18 = a2 + v13;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(void *)uint64_t v17 = *(void *)v18;
  uint64_t v19 = a3[11];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

uint64_t assignWithTake for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  if (*(void *)(a1 + v18 + 16) != 1)
  {
    uint64_t v21 = v20[2];
    if (v21 != 1)
    {
      *uint64_t v19 = *v20;
      v19[1] = v20[1];
      v19[2] = v21;
      swift_bridgeObjectRelease();
      uint64_t v23 = v20[4];
      v19[3] = v20[3];
      v19[4] = v23;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_25D1380E0(a1 + v18);
  }
  long long v22 = *((_OWORD *)v20 + 1);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v22;
  v19[4] = v20[4];
LABEL_6:
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  *(void *)(a1 + v24) = *(void *)(a2 + v24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(v25 + 8) = *(unsigned char *)(v26 + 8);
  uint64_t v27 = a3[11];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D138454);
}

uint64_t sub_25D138454(uint64_t a1, uint64_t a2, int *a3)
{
  sub_25D15B220();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_13:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    OUTLINED_FUNCTION_1_1();
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v15 = a3[6];
    }
    else
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
      uint64_t v15 = a3[11];
    }
    uint64_t v9 = a1 + v15;
    goto LABEL_13;
  }
  unint64_t v10 = *(void *)(a1 + a3[5]);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageDraftSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D138550);
}

void sub_25D138550(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_25D15B220();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + a4[5]) = a2;
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
    OUTLINED_FUNCTION_1_1();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
      uint64_t v14 = a4[11];
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_25D138628()
{
  sub_25D15B220();
  if (v0 <= 0x3F)
  {
    sub_25D11CD4C(319, &qword_26A660898);
    if (v1 <= 0x3F)
    {
      sub_25D11CD4C(319, &qword_26A6608A8);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t destroy for AutoSendInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AutoSendInfo(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AutoSendInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for AutoSendInfo(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoSendInfo(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for AutoSendInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoSendInfo()
{
  return &type metadata for AutoSendInfo;
}

uint64_t initializeBufferWithCopyOfBuffer for CorrectionInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CorrectionInfo()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for CorrectionInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for CorrectionInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for CorrectionInfo()
{
  return &type metadata for CorrectionInfo;
}

unsigned char *storeEnumTagSinglePayload for CorrectionInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25D138B48);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrectionInfo.CodingKeys()
{
  return &type metadata for CorrectionInfo.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for AutoSendInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25D138C4CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoSendInfo.CodingKeys()
{
  return &type metadata for AutoSendInfo.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for MessageDraftSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D138D50);
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

ValueMetadata *type metadata accessor for MessageDraftSnippetModel.CodingKeys()
{
  return &type metadata for MessageDraftSnippetModel.CodingKeys;
}

unint64_t sub_25D138D8C()
{
  unint64_t result = qword_26A6610E8;
  if (!qword_26A6610E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6610E8);
  }
  return result;
}

unint64_t sub_25D138DDC()
{
  unint64_t result = qword_26A6610F0;
  if (!qword_26A6610F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6610F0);
  }
  return result;
}

unint64_t sub_25D138E2C()
{
  unint64_t result = qword_26A6610F8;
  if (!qword_26A6610F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6610F8);
  }
  return result;
}

unint64_t sub_25D138E7C()
{
  unint64_t result = qword_26A661100;
  if (!qword_26A661100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661100);
  }
  return result;
}

unint64_t sub_25D138ECC()
{
  unint64_t result = qword_26A661108;
  if (!qword_26A661108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661108);
  }
  return result;
}

unint64_t sub_25D138F1C()
{
  unint64_t result = qword_26A661110;
  if (!qword_26A661110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661110);
  }
  return result;
}

unint64_t sub_25D138F6C()
{
  unint64_t result = qword_26A661118;
  if (!qword_26A661118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661118);
  }
  return result;
}

unint64_t sub_25D138FBC()
{
  unint64_t result = qword_26A661120;
  if (!qword_26A661120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661120);
  }
  return result;
}

unint64_t sub_25D13900C()
{
  unint64_t result = qword_26A661128;
  if (!qword_26A661128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661128);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return sub_25D15B880();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return sub_25D15B7B0();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_25D15B840();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return type metadata accessor for MessageDraftSnippetModel();
}

void OUTLINED_FUNCTION_11_0()
{
  *(unsigned char *)(v0 - 82) = 1;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_25D15B880();
}

uint64_t sub_25D139148(uint64_t a1, unint64_t a2)
{
  return sub_25D1391A4(a1, a2, (void (*)(void))type metadata accessor for AutoSendableCompactCarPlayButton);
}

uint64_t sub_25D1391A4(uint64_t a1, unint64_t a2, void (*a3)(void))
{
  return swift_release();
}

double sub_25D139264@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D13AE60();
  sub_25D15B0C0();
  sub_25D1217BC(a1, a2);
  swift_release();
  if (!v3)
  {
    *(void *)a3 = v8;
    double result = *(double *)&v9;
    *(_OWORD *)(a3 + 8) = v9;
    *(unsigned char *)(a3 + 24) = v10;
    *(unsigned char *)(a3 + 25) = v11;
    *(void *)(a3 + 32) = v12;
    *(void *)(a3 + 40) = v13;
  }
  return result;
}

uint64_t sub_25D13933C()
{
  OUTLINED_FUNCTION_1_15();
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  sub_25D15B0D0();
  v1();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_5_7();
  uint64_t result = swift_release();
  if (!v2)
  {
    *(_OWORD *)uint64_t v0 = v4;
    *(void *)(v0 + 16) = v5;
    *(void *)(v0 + 24) = v6;
  }
  return result;
}

double sub_25D1393C4@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D13AD30();
  sub_25D15B0C0();
  sub_25D1217BC(a1, a2);
  swift_release();
  if (!v3)
  {
    double result = *(double *)&v8;
    *(_OWORD *)a3 = v8;
    *(void *)(a3 + 16) = v9;
    *(void *)(a3 + 24) = v10;
    *(unsigned char *)(a3 + 32) = v11;
    *(unsigned char *)(a3 + 33) = v12;
    *(void *)(a3 + 40) = v13;
    *(void *)(a3 + 48) = v14;
  }
  return result;
}

double sub_25D13949C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D13AC98();
  sub_25D15B0C0();
  sub_25D1217BC(a1, a2);
  swift_release();
  if (!v3)
  {
    double result = *(double *)&v8;
    *(_OWORD *)a3 = v8;
    *(void *)(a3 + 16) = v9;
  }
  return result;
}

uint64_t sub_25D13955C()
{
  OUTLINED_FUNCTION_1_15();
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  sub_25D15B0D0();
  v1();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_5_7();
  uint64_t result = swift_release();
  if (!v2)
  {
    *(void *)uint64_t v0 = v4;
    *(unsigned char *)(v0 + 8) = v5;
  }
  return result;
}

uint64_t sub_25D1395E4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D13AB68();
  sub_25D15B0C0();
  sub_25D1217BC(a1, a2);
  uint64_t result = swift_release();
  if (!v3)
  {
    *(void *)a3 = v8;
    *(void *)(a3 + 8) = v9;
    *(unsigned char *)(a3 + 16) = v10;
  }
  return result;
}

uint64_t sub_25D1396A4()
{
  OUTLINED_FUNCTION_1_15();
  uint64_t v2 = OUTLINED_FUNCTION_1_0();
  sub_25D15B0D0();
  v1();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_5_7();
  uint64_t result = swift_release();
  if (!v2)
  {
    void *v0 = v4;
    v0[1] = v5;
    v0[2] = v6;
  }
  return result;
}

__n128 sub_25D13972C@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D13AA38();
  sub_25D15B0C0();
  sub_25D1217BC(a1, a2);
  swift_release();
  if (!v3)
  {
    __n128 result = v14;
    *(void *)a3 = v8;
    *(_OWORD *)(a3 + 8) = v9;
    *(_OWORD *)(a3 + 24) = v10;
    *(void *)(a3 + 40) = v11;
    *(_OWORD *)(a3 + 48) = v12;
    *(_OWORD *)(a3 + 64) = v13;
    *(__n128 *)(a3 + 80) = v14;
    *(_OWORD *)(a3 + 96) = v15;
    *(void *)(a3 + 112) = v16;
  }
  return result;
}

uint64_t CustomCanvasModel<>.init(serializedData:)(uint64_t a1, unint64_t a2)
{
  return swift_release();
}

uint64_t sub_25D1398BC()
{
  return sub_25D139924((void (*)(void))type metadata accessor for AutoSendableCompactCarPlayButton, &qword_26A661260);
}

uint64_t sub_25D1398F0(uint64_t a1, uint64_t *a2)
{
  return sub_25D15B4C0();
}

uint64_t sub_25D139924(void (*a1)(void), uint64_t *a2)
{
  return sub_25D15B4C0();
}

uint64_t static CustomCanvasModel<>.name.getter()
{
  return sub_25D15B4C0();
}

uint64_t sub_25D1399A4()
{
  return sub_25D139A00((void (*)(void))type metadata accessor for AutoSendableCompactCarPlayButton);
}

uint64_t sub_25D139A00(void (*a1)(void))
{
  return OUTLINED_FUNCTION_4_8();
}

uint64_t sub_25D139A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_25D15B110();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = sub_25D15B100();
  a5(v6, v7, v8, v9);
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_0_7();
  return OUTLINED_FUNCTION_4_8();
}

uint64_t sub_25D139AFC()
{
  sub_25D15B110();
  swift_allocObject();
  sub_25D15B100();
  sub_25D13AB1C();
  uint64_t v0 = sub_25D15B0F0();
  swift_release();
  return v0;
}

uint64_t sub_25D139B90()
{
  sub_25D15B110();
  swift_allocObject();
  sub_25D15B100();
  sub_25D13AE14();
  uint64_t v0 = sub_25D15B0F0();
  swift_release();
  return v0;
}

uint64_t sub_25D139C2C()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_25D15B110();
  swift_allocObject();
  sub_25D15B100();
  sub_25D13A9EC();
  uint64_t v1 = sub_25D15B0F0();
  swift_release();
  return v1;
}

uint64_t sub_25D139CC8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  sub_25D15B110();
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = sub_25D15B100();
  a3(v4, v5);
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_0_7();
  return OUTLINED_FUNCTION_4_8();
}

uint64_t sub_25D139D34()
{
  sub_25D15B110();
  swift_allocObject();
  sub_25D15B100();
  sub_25D13ACE4();
  uint64_t v0 = sub_25D15B0F0();
  swift_release();
  return v0;
}

uint64_t sub_25D139DD8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return OUTLINED_FUNCTION_4_8();
}

uint64_t sub_25D139E54()
{
  sub_25D15B110();
  swift_allocObject();
  sub_25D15B100();
  sub_25D13AC4C();
  uint64_t v0 = sub_25D15B0F0();
  swift_release();
  return v0;
}

uint64_t CustomCanvasModel<>.serializedData()()
{
  return OUTLINED_FUNCTION_4_8();
}

uint64_t dispatch thunk of CustomCanvasModel.init(serializedData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static CustomCanvasModel.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25D139F94(uint64_t a1, unint64_t a2)
{
  return sub_25D1391A4(a1, a2, (void (*)(void))type metadata accessor for AutoSendableCarPlayButton);
}

uint64_t sub_25D139FF0()
{
  return sub_25D139924((void (*)(void))type metadata accessor for AutoSendableCarPlayButton, &qword_26A661258);
}

uint64_t sub_25D13A024()
{
  return sub_25D139A00((void (*)(void))type metadata accessor for AutoSendableCarPlayButton);
}

uint64_t sub_25D13A080(uint64_t a1, unint64_t a2)
{
  return sub_25D1391A4(a1, a2, (void (*)(void))type metadata accessor for MapAttachment);
}

uint64_t sub_25D13A0DC()
{
  return sub_25D139924((void (*)(void))type metadata accessor for MapAttachment, &qword_26A661250);
}

uint64_t sub_25D13A110()
{
  return sub_25D139A00((void (*)(void))type metadata accessor for MapAttachment);
}

uint64_t sub_25D13A16C()
{
  return sub_25D13933C();
}

uint64_t sub_25D13A1A0()
{
  return sub_25D1398F0((uint64_t)&type metadata for UnreadMessagesCarPlayButton, &qword_26A661240);
}

uint64_t sub_25D13A1C8()
{
  return sub_25D139A90(*v0, v0[1], v0[2], v0[3], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25D13AEAC);
}

uint64_t sub_25D13A204()
{
  return sub_25D13955C();
}

uint64_t sub_25D13A238()
{
  return sub_25D1398F0((uint64_t)&type metadata for PhotoAttachment, &qword_26A661230);
}

uint64_t sub_25D13A260()
{
  return sub_25D139CC8(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t, uint64_t))sub_25D11F73C);
}

double sub_25D13A29C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25D139264(a1, a2, a3);
}

uint64_t sub_25D13A2B4()
{
  return sub_25D1398F0((uint64_t)&type metadata for CarPlayHeader, &qword_26A661220);
}

uint64_t sub_25D13A2DC()
{
  return sub_25D139B90();
}

uint64_t sub_25D13A30C()
{
  return sub_25D13933C();
}

uint64_t sub_25D13A340()
{
  return sub_25D1398F0((uint64_t)&type metadata for UnreadMessagesCompactCarPlayButton, &qword_26A661208);
}

uint64_t sub_25D13A368()
{
  return sub_25D139A90(*v0, v0[1], v0[2], v0[3], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25D13AD7C);
}

double sub_25D13A3A4@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25D1393C4(a1, a2, a3);
}

uint64_t sub_25D13A3BC()
{
  return sub_25D1398F0((uint64_t)&type metadata for PayloadTextInput, &qword_26A6611F0);
}

uint64_t sub_25D13A3E4()
{
  return sub_25D139D34();
}

uint64_t sub_25D13A41C(uint64_t a1, unint64_t a2)
{
  return sub_25D1391A4(a1, a2, (void (*)(void))type metadata accessor for AudioMessagePlayer);
}

uint64_t sub_25D13A478()
{
  return sub_25D139924((void (*)(void))type metadata accessor for AudioMessagePlayer, &qword_26A6611D8);
}

uint64_t sub_25D13A4AC()
{
  return sub_25D139A00((void (*)(void))type metadata accessor for AudioMessagePlayer);
}

double sub_25D13A508@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25D13949C(a1, a2, a3);
}

uint64_t sub_25D13A520()
{
  return sub_25D1398F0((uint64_t)&type metadata for AppSash, &qword_26A6611C0);
}

uint64_t sub_25D13A548()
{
  return sub_25D139E54();
}

uint64_t sub_25D13A568()
{
  return sub_25D1396A4();
}

uint64_t sub_25D13A59C()
{
  return sub_25D1398F0((uint64_t)&type metadata for ReadingCarPlayButton, &qword_26A6611A8);
}

uint64_t sub_25D13A5C4()
{
  return sub_25D139DD8(*(void *)(v0 + 8), *(void *)(v0 + 16), (void (*)(void))sub_25D13ABB4);
}

uint64_t sub_25D13A600()
{
  return sub_25D13955C();
}

uint64_t sub_25D13A634()
{
  return sub_25D1398F0((uint64_t)&type metadata for VideoAttachment, &qword_26A661198);
}

uint64_t sub_25D13A65C()
{
  return sub_25D139CC8(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t, uint64_t))sub_25D11F6A4);
}

uint64_t sub_25D13A698@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25D1395E4(a1, a2, a3);
}

uint64_t sub_25D13A6B0()
{
  return sub_25D1398F0((uint64_t)&type metadata for TextBalloon, &qword_26A661188);
}

uint64_t sub_25D13A6D8()
{
  return sub_25D139AFC();
}

uint64_t sub_25D13A6F8()
{
  return sub_25D1396A4();
}

uint64_t sub_25D13A72C()
{
  return sub_25D1398F0((uint64_t)&type metadata for ReadingCompactCarPlayButton, &qword_26A661170);
}

uint64_t sub_25D13A754()
{
  return sub_25D139DD8(*(void *)(v0 + 8), *(void *)(v0 + 16), (void (*)(void))sub_25D13AA84);
}

uint64_t sub_25D13A790(uint64_t a1, unint64_t a2)
{
  return sub_25D1391A4(a1, a2, (void (*)(void))type metadata accessor for LinkAttachment);
}

uint64_t sub_25D13A7EC()
{
  return sub_25D139924((void (*)(void))type metadata accessor for LinkAttachment, &qword_26A661160);
}

uint64_t sub_25D13A820()
{
  return sub_25D139A00((void (*)(void))type metadata accessor for LinkAttachment);
}

double sub_25D13A87C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&double result = sub_25D13972C(a1, a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_25D13A894()
{
  return sub_25D1398F0((uint64_t)&type metadata for RecipientLabel, &qword_26A661150);
}

uint64_t sub_25D13A8BC()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_25D139C2C();
}

uint64_t sub_25D13A900(uint64_t a1, unint64_t a2)
{
  return sub_25D1391A4(a1, a2, (void (*)(void))type metadata accessor for AutoSendableBinaryButton);
}

uint64_t sub_25D13A95C()
{
  return sub_25D139924((void (*)(void))type metadata accessor for AutoSendableBinaryButton, &qword_26A661138);
}

uint64_t sub_25D13A990()
{
  return sub_25D139A00((void (*)(void))type metadata accessor for AutoSendableBinaryButton);
}

unint64_t sub_25D13A9EC()
{
  unint64_t result = qword_26A661148;
  if (!qword_26A661148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661148);
  }
  return result;
}

unint64_t sub_25D13AA38()
{
  unint64_t result = qword_26A661158;
  if (!qword_26A661158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661158);
  }
  return result;
}

unint64_t sub_25D13AA84()
{
  unint64_t result = qword_26A661168;
  if (!qword_26A661168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661168);
  }
  return result;
}

unint64_t sub_25D13AAD0()
{
  unint64_t result = qword_26A661178;
  if (!qword_26A661178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661178);
  }
  return result;
}

unint64_t sub_25D13AB1C()
{
  unint64_t result = qword_26A661180;
  if (!qword_26A661180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661180);
  }
  return result;
}

unint64_t sub_25D13AB68()
{
  unint64_t result = qword_26A661190;
  if (!qword_26A661190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661190);
  }
  return result;
}

unint64_t sub_25D13ABB4()
{
  unint64_t result = qword_26A6611A0;
  if (!qword_26A6611A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6611A0);
  }
  return result;
}

unint64_t sub_25D13AC00()
{
  unint64_t result = qword_26A6611B0;
  if (!qword_26A6611B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6611B0);
  }
  return result;
}

unint64_t sub_25D13AC4C()
{
  unint64_t result = qword_26A6611B8;
  if (!qword_26A6611B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6611B8);
  }
  return result;
}

unint64_t sub_25D13AC98()
{
  unint64_t result = qword_26A6611C8;
  if (!qword_26A6611C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6611C8);
  }
  return result;
}

unint64_t sub_25D13ACE4()
{
  unint64_t result = qword_26A6611E8;
  if (!qword_26A6611E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6611E8);
  }
  return result;
}

unint64_t sub_25D13AD30()
{
  unint64_t result = qword_26A6611F8;
  if (!qword_26A6611F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6611F8);
  }
  return result;
}

unint64_t sub_25D13AD7C()
{
  unint64_t result = qword_26A661200;
  if (!qword_26A661200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661200);
  }
  return result;
}

unint64_t sub_25D13ADC8()
{
  unint64_t result = qword_26A661210;
  if (!qword_26A661210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661210);
  }
  return result;
}

unint64_t sub_25D13AE14()
{
  unint64_t result = qword_26A661218;
  if (!qword_26A661218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661218);
  }
  return result;
}

unint64_t sub_25D13AE60()
{
  unint64_t result = qword_26A661228;
  if (!qword_26A661228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661228);
  }
  return result;
}

unint64_t sub_25D13AEAC()
{
  unint64_t result = qword_26A661238;
  if (!qword_26A661238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661238);
  }
  return result;
}

unint64_t sub_25D13AEF8()
{
  unint64_t result = qword_26A661248;
  if (!qword_26A661248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661248);
  }
  return result;
}

uint64_t sub_25D13AF44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  return sub_25D15B0E0();
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return sub_25D15B0C0();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return sub_25D1217BC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return sub_25D15B0F0();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return sub_25D13AF44(v1, v0);
}

__n128 OUTLINED_FUNCTION_8_5()
{
  return v0[2];
}

void __swiftcall PayloadTextInput.init(payload:placeholderText:shouldUpdateWithASRText:shouldValidate:)(SiriMessagesCommon::PayloadTextInput *__return_ptr retstr, Swift::String payload, Swift::String placeholderText, Swift::Bool shouldUpdateWithASRText, Swift::Bool shouldValidate)
{
  object = placeholderText._object;
  uint64_t countAndFlagsBits = placeholderText._countAndFlagsBits;
  uint64_t v9 = payload._object;
  uint64_t v10 = payload._countAndFlagsBits;
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v13 = qword_26A660E80;
  long long v12 = (void *)qword_26A660E88;
  retstr->payload._uint64_t countAndFlagsBits = v10;
  retstr->payload._object = v9;
  retstr->placeholderText._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->placeholderText._object = object;
  retstr->shouldUpdateWithASRText = shouldUpdateWithASRText;
  retstr->shouldValidate = shouldValidate;
  retstr->sendLabelText._uint64_t countAndFlagsBits = v13;
  retstr->sendLabelText._object = v12;
  swift_bridgeObjectRetain();
}

uint64_t PayloadTextInput.payload.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PayloadTextInput.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PayloadTextInput.payload.modify())()
{
  return nullsub_1;
}

uint64_t PayloadTextInput.placeholderText.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PayloadTextInput.placeholderText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*PayloadTextInput.placeholderText.modify())()
{
  return nullsub_1;
}

uint64_t PayloadTextInput.shouldUpdateWithASRText.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t PayloadTextInput.shouldUpdateWithASRText.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*PayloadTextInput.shouldUpdateWithASRText.modify())()
{
  return nullsub_1;
}

uint64_t PayloadTextInput.shouldValidate.getter()
{
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t PayloadTextInput.shouldValidate.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 33) = result;
  return result;
}

uint64_t (*PayloadTextInput.shouldValidate.modify())()
{
  return nullsub_1;
}

uint64_t PayloadTextInput.sendLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PayloadTextInput.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*PayloadTextInput.sendLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D13B340(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6C6F686563616C70 && a2 == 0xEF74786554726564;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x800000025D1634A0 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6156646C756F6873 && a2 == 0xEE0065746164696CLL;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v9 = sub_25D15B8C0();
        swift_bridgeObjectRelease();
        if (v9) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

unint64_t sub_25D13B57C(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C6F686563616C70;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6156646C756F6873;
      break;
    case 4:
      unint64_t result = 0x6562614C646E6573;
      break;
    default:
      unint64_t result = 0x64616F6C796170;
      break;
  }
  return result;
}

unint64_t sub_25D13B654()
{
  return sub_25D13B57C(*v0);
}

uint64_t sub_25D13B65C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D13B340(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D13B684(uint64_t a1)
{
  unint64_t v2 = sub_25D13B8D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13B6C0(uint64_t a1)
{
  unint64_t v2 = sub_25D13B8D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void PayloadTextInput.encode(to:)()
{
  OUTLINED_FUNCTION_4_9();
  unint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661268);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D13B8D4();
  sub_25D15B9D0();
  sub_25D15B850();
  if (!v0)
  {
    sub_25D15B850();
    sub_25D15B860();
    sub_25D15B860();
    sub_25D15B850();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
  OUTLINED_FUNCTION_5_8();
}

unint64_t sub_25D13B8D4()
{
  unint64_t result = qword_26A661270;
  if (!qword_26A661270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661270);
  }
  return result;
}

void PayloadTextInput.init(from:)()
{
  OUTLINED_FUNCTION_4_9();
  unint64_t v2 = v1;
  uint64_t v21 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661278);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_0();
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D13B8D4();
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    uint64_t v5 = OUTLINED_FUNCTION_3_7();
    uint64_t v7 = v6;
    uint64_t v20 = v5;
    swift_bridgeObjectRetain();
    uint64_t v8 = OUTLINED_FUNCTION_3_7();
    uint64_t v10 = v9;
    uint64_t v18 = v8;
    swift_bridgeObjectRetain();
    uint64_t v19 = v10;
    char v22 = sub_25D15B7D0();
    char v17 = sub_25D15B7D0();
    uint64_t v11 = OUTLINED_FUNCTION_3_7();
    uint64_t v13 = v12;
    uint64_t v14 = v11;
    uint64_t v15 = OUTLINED_FUNCTION_2_10();
    v16(v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)uint64_t v21 = v20;
    *(void *)(v21 + 8) = v7;
    *(void *)(v21 + 16) = v18;
    *(void *)(v21 + 24) = v19;
    *(unsigned char *)(v21 + 32) = v22 & 1;
    *(unsigned char *)(v21 + 33) = v17 & 1;
    *(void *)(v21 + 40) = v14;
    *(void *)(v21 + 48) = v13;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_8();
}

void sub_25D13BC00()
{
}

void sub_25D13BC18()
{
}

uint64_t static PayloadTextInputAction.== infix(_:_:)()
{
  return 1;
}

uint64_t PayloadTextInputAction.hash(into:)()
{
  return sub_25D15B980();
}

uint64_t sub_25D13BC60(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7961506873756C66 && a2 == 0xEC00000064616F6CLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25D13BCF8()
{
  return 0x7961506873756C66;
}

uint64_t sub_25D13BD18()
{
  return 1;
}

uint64_t sub_25D13BD38()
{
  return 0;
}

uint64_t sub_25D13BD48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D13BC60(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25D13BD74(uint64_t a1)
{
  unint64_t v2 = sub_25D13BFF4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13BDB0(uint64_t a1)
{
  unint64_t v2 = sub_25D13BFF4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D13BDF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D13BD18();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25D13BE1C(uint64_t a1)
{
  unint64_t v2 = sub_25D13C040();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13BE58(uint64_t a1)
{
  unint64_t v2 = sub_25D13C040();

  return MEMORY[0x270FA00B8](a1, v2);
}

void PayloadTextInputAction.encode(to:)()
{
  OUTLINED_FUNCTION_4_9();
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661280);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661288);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_0();
  uint64_t v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_25D13BFF4();
  sub_25D15B9D0();
  sub_25D13C040();
  sub_25D15B820();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  OUTLINED_FUNCTION_5_8();
}

unint64_t sub_25D13BFF4()
{
  unint64_t result = qword_26A661290;
  if (!qword_26A661290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661290);
  }
  return result;
}

unint64_t sub_25D13C040()
{
  unint64_t result = qword_26A661298;
  if (!qword_26A661298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661298);
  }
  return result;
}

uint64_t PayloadTextInputAction.hashValue.getter()
{
  return sub_25D15B990();
}

void PayloadTextInputAction.init(from:)()
{
  OUTLINED_FUNCTION_4_9();
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6612A0);
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6612A8);
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D13BFF4();
  sub_25D15B9B0();
  if (v0) {
    goto LABEL_6;
  }
  uint64_t v25 = v14;
  uint64_t v15 = sub_25D15B800();
  uint64_t v16 = *(void *)(v15 + 16);
  if (!v16
    || (sub_25D120AB0(1, v16, v15, v15 + 32, 0, (2 * v16) | 1),
        uint64_t v18 = v17,
        unint64_t v20 = v19,
        swift_bridgeObjectRelease(),
        v18 != v20 >> 1))
  {
    uint64_t v21 = sub_25D15B720();
    swift_allocError();
    uint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660988);
    void *v23 = &type metadata for PayloadTextInputAction;
    sub_25D15B790();
    sub_25D15B710();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v9);
LABEL_6:
    uint64_t v24 = (uint64_t)v2;
    goto LABEL_7;
  }
  sub_25D13C040();
  sub_25D15B780();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v8, v3);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v14, v9);
  uint64_t v24 = (uint64_t)v2;
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1(v24);
  OUTLINED_FUNCTION_5_8();
}

uint64_t sub_25D13C3CC()
{
  return PayloadTextInputAction.hashValue.getter();
}

uint64_t sub_25D13C3E4()
{
  return PayloadTextInputAction.hash(into:)();
}

void sub_25D13C3FC()
{
}

void sub_25D13C414()
{
}

unint64_t sub_25D13C430()
{
  unint64_t result = qword_26A6612B0;
  if (!qword_26A6612B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612B0);
  }
  return result;
}

uint64_t destroy for PayloadTextInput()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PayloadTextInput(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PayloadTextInput(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
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

uint64_t assignWithTake for PayloadTextInput(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PayloadTextInput(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
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

uint64_t storeEnumTagSinglePayload for PayloadTextInput(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PayloadTextInput()
{
  return &type metadata for PayloadTextInput;
}

ValueMetadata *type metadata accessor for PayloadTextInputAction()
{
  return &type metadata for PayloadTextInputAction;
}

unsigned char *_s18SiriMessagesCommon22PayloadTextInputActionOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25D13C790);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PayloadTextInputAction.CodingKeys()
{
  return &type metadata for PayloadTextInputAction.CodingKeys;
}

ValueMetadata *type metadata accessor for PayloadTextInputAction.FlushPayloadCodingKeys()
{
  return &type metadata for PayloadTextInputAction.FlushPayloadCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PayloadTextInput.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x25D13C8A4);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PayloadTextInput.CodingKeys()
{
  return &type metadata for PayloadTextInput.CodingKeys;
}

unint64_t sub_25D13C8E0()
{
  unint64_t result = qword_26A6612B8;
  if (!qword_26A6612B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612B8);
  }
  return result;
}

unint64_t sub_25D13C930()
{
  unint64_t result = qword_26A6612C0;
  if (!qword_26A6612C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612C0);
  }
  return result;
}

unint64_t sub_25D13C980()
{
  unint64_t result = qword_26A6612C8;
  if (!qword_26A6612C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612C8);
  }
  return result;
}

unint64_t sub_25D13C9D0()
{
  unint64_t result = qword_26A6612D0;
  if (!qword_26A6612D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612D0);
  }
  return result;
}

unint64_t sub_25D13CA20()
{
  unint64_t result = qword_26A6612D8;
  if (!qword_26A6612D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612D8);
  }
  return result;
}

unint64_t sub_25D13CA70()
{
  unint64_t result = qword_26A6612E0;
  if (!qword_26A6612E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612E0);
  }
  return result;
}

unint64_t sub_25D13CAC0()
{
  unint64_t result = qword_26A6612E8;
  if (!qword_26A6612E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612E8);
  }
  return result;
}

unint64_t sub_25D13CB10()
{
  unint64_t result = qword_26A6612F0;
  if (!qword_26A6612F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6612F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_25D15B7C0();
}

uint64_t ConfirmationButtonSnippetModel.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void ConfirmationButtonSnippetModel.primaryButton.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t ConfirmationButtonSnippetModel.primaryButtonLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void ConfirmationButtonSnippetModel.secondaryButton.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 40);
}

uint64_t ConfirmationButtonSnippetModel.secondaryButtonLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall ConfirmationButtonSnippetModel.init(title:primaryButton:primaryButtonLabel:secondaryButton:secondaryButtonLabel:)(SiriMessagesCommon::ConfirmationButtonSnippetModel *__return_ptr retstr, Swift::String_optional title, SiriMessagesCommon::DirectButton primaryButton, Swift::String primaryButtonLabel, SiriMessagesCommon::DirectButton secondaryButton, Swift::String secondaryButtonLabel)
{
  SiriMessagesCommon::DirectButton v6 = *(unsigned char *)primaryButton;
  SiriMessagesCommon::DirectButton v7 = *(unsigned char *)secondaryButton;
  retstr->title = title;
  retstr->primaryButton = v6;
  retstr->primaryButtonLabel = primaryButtonLabel;
  retstr->secondaryButton = v7;
  retstr->secondaryButtonLabel = secondaryButtonLabel;
}

uint64_t ConfirmationButtonSnippetModel.description.getter()
{
  return 0;
}

uint64_t sub_25D13CD70(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x427972616D697270 && a2 == 0xED00006E6F747475;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000012 && a2 == 0x800000025D163550 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x7261646E6F636573 && a2 == 0xEF6E6F7474754279;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000014 && a2 == 0x800000025D163570)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v8 = sub_25D15B8C0();
        swift_bridgeObjectRelease();
        if (v8) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

unint64_t sub_25D13CF8C(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x427972616D697270;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x7261646E6F636573;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      unint64_t result = 0x656C746974;
      break;
  }
  return result;
}

unint64_t sub_25D13D054()
{
  return sub_25D13CF8C(*v0);
}

uint64_t sub_25D13D05C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D13CD70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D13D084(uint64_t a1)
{
  unint64_t v2 = sub_25D13D2F8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13D0C0(uint64_t a1)
{
  unint64_t v2 = sub_25D13D2F8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ConfirmationButtonSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6612F8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v18 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v9 = *(void *)(v1 + 24);
  uint64_t v16 = *(void *)(v1 + 32);
  uint64_t v17 = v9;
  int v15 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v10 = *(void *)(v1 + 48);
  v14[1] = *(void *)(v1 + 56);
  v14[2] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13D2F8();
  sub_25D15B9D0();
  char v26 = 0;
  uint64_t v11 = v19;
  sub_25D15B830();
  if (!v11)
  {
    char v12 = v15;
    char v25 = v18;
    char v24 = 1;
    sub_25D13D344();
    OUTLINED_FUNCTION_3_8();
    char v23 = 2;
    sub_25D15B850();
    char v22 = v12;
    char v21 = 3;
    OUTLINED_FUNCTION_3_8();
    char v20 = 4;
    sub_25D15B850();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_25D13D2F8()
{
  unint64_t result = qword_26A661300;
  if (!qword_26A661300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661300);
  }
  return result;
}

unint64_t sub_25D13D344()
{
  unint64_t result = qword_26A661308;
  if (!qword_26A661308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661308);
  }
  return result;
}

uint64_t ConfirmationButtonSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661310);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13D2F8();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_25D15B7A0();
  uint64_t v8 = v7;
  uint64_t v19 = v6;
  sub_25D13D674();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_11();
  uint64_t v17 = sub_25D15B7C0();
  uint64_t v18 = v10;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_11();
  uint64_t v11 = sub_25D15B7C0();
  uint64_t v13 = v12;
  uint64_t v16 = v11;
  uint64_t v14 = OUTLINED_FUNCTION_1_14();
  v15(v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)a2 = v19;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v21;
  *(void *)(a2 + 24) = v17;
  *(void *)(a2 + 32) = v18;
  *(unsigned char *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_25D13D674()
{
  unint64_t result = qword_26A661318;
  if (!qword_26A661318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661318);
  }
  return result;
}

unint64_t sub_25D13D6C4()
{
  unint64_t result = qword_26A661320;
  if (!qword_26A661320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661320);
  }
  return result;
}

unint64_t sub_25D13D714()
{
  unint64_t result = qword_26A661328;
  if (!qword_26A661328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661328);
  }
  return result;
}

uint64_t sub_25D13D764@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ConfirmationButtonSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_25D13D77C(void *a1)
{
  return ConfirmationButtonSnippetModel.encode(to:)(a1);
}

uint64_t destroy for ConfirmationButtonSnippetModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ConfirmationButtonSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConfirmationButtonSnippetModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ConfirmationButtonSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationButtonSnippetModel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for ConfirmationButtonSnippetModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationButtonSnippetModel()
{
  return &type metadata for ConfirmationButtonSnippetModel;
}

unsigned char *storeEnumTagSinglePayload for ConfirmationButtonSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x25D13DAC8);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationButtonSnippetModel.CodingKeys()
{
  return &type metadata for ConfirmationButtonSnippetModel.CodingKeys;
}

unint64_t sub_25D13DB04()
{
  unint64_t result = qword_26A661330;
  if (!qword_26A661330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661330);
  }
  return result;
}

unint64_t sub_25D13DB54()
{
  unint64_t result = qword_26A661338;
  if (!qword_26A661338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661338);
  }
  return result;
}

unint64_t sub_25D13DBA4()
{
  unint64_t result = qword_26A661340;
  if (!qword_26A661340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661340);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_25D15B7F0();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return sub_25D15B880();
}

uint64_t ConfirmationSnippetModel.MessageType.description.getter()
{
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_12_0();
  sub_25D13FD6C(v1, v0, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  unsigned int v4 = (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType;
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = 0x6F69647561;
    }
    else
    {
      unsigned int v4 = (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType;
      uint64_t v5 = 1954047348;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
    swift_bridgeObjectRelease();
    uint64_t v5 = 0x656D686361747461;
    unsigned int v4 = (void (*)(void))type metadata accessor for AttachmentModel;
  }
  sub_25D13DD84(v0, v4);
  return v5;
}

uint64_t type metadata accessor for ConfirmationSnippetModel.MessageType(uint64_t a1)
{
  return sub_25D13FC88(a1, (uint64_t *)&unk_26A6613F8);
}

uint64_t sub_25D13DD84(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1();
  v3();
  return a1;
}

uint64_t sub_25D13DDD8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D13DE98(char a1)
{
  if (a1) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_25D13DEB0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D686361747461 && a2 == 0xEA0000000000746ELL;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6F69647561 && a2 == 0xE500000000000000;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1954047348 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_25D15B8C0();
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

uint64_t sub_25D13DFE0(char a1)
{
  return *(void *)&aAttachmeaudio[8 * a1];
}

uint64_t sub_25D13E000()
{
  return sub_25D13DE98(*v0);
}

uint64_t sub_25D13E008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D13DDD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D13E030(uint64_t a1)
{
  unint64_t v2 = sub_25D13E900();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13E06C(uint64_t a1)
{
  unint64_t v2 = sub_25D13E900();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D13E0A8(uint64_t a1)
{
  unint64_t v2 = sub_25D13E854();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13E0E4(uint64_t a1)
{
  unint64_t v2 = sub_25D13E854();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D13E120()
{
  return sub_25D13DFE0(*v0);
}

uint64_t sub_25D13E128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D13DEB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D13E150(uint64_t a1)
{
  unint64_t v2 = sub_25D13E7BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13E18C(uint64_t a1)
{
  unint64_t v2 = sub_25D13E7BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D13E1C8(uint64_t a1)
{
  unint64_t v2 = sub_25D13E808();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13E204(uint64_t a1)
{
  unint64_t v2 = sub_25D13E808();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ConfirmationSnippetModel.MessageType.encode(to:)(void *a1)
{
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661350);
  OUTLINED_FUNCTION_0();
  uint64_t v37 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_8_6(v6, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661358);
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v8;
  uint64_t v43 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7_7(v9, v37);
  uint64_t v40 = type metadata accessor for AudioMessagePlayer();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4();
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661360);
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_7();
  uint64_t v39 = type metadata accessor for AttachmentModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5_0();
  uint64_t v41 = v14;
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661368);
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v19;
  MEMORY[0x270FA5388](v20);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13E7BC();
  sub_25D15B9D0();
  sub_25D13FD6C(v51, (uint64_t)v17, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    uint64_t v26 = v38;
    uint64_t v51 = *(void *)&v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48)];
    uint64_t v27 = (uint64_t)v17;
    uint64_t v28 = v41;
    sub_25D13E8A0(v27, v41, (void (*)(void))type metadata accessor for AttachmentModel);
    LOBYTE(v48) = 0;
    sub_25D13E900();
    sub_25D15B820();
    LOBYTE(v48) = 0;
    sub_25D13E94C(&qword_26A6609B8, (void (*)(uint64_t))type metadata accessor for AttachmentModel);
    uint64_t v29 = v44;
    uint64_t v30 = v47;
    sub_25D15B880();
    if (!v30)
    {
      LOBYTE(v48) = 1;
      sub_25D15B830();
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v29);
    sub_25D13DD84(v28, (void (*)(void))type metadata accessor for AttachmentModel);
    uint64_t v23 = OUTLINED_FUNCTION_9_1();
    uint64_t v25 = v18;
    return v24(v23, v25);
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_25D13E8A0((uint64_t)v17, v1, (void (*)(void))type metadata accessor for AudioMessagePlayer);
    LOBYTE(v48) = 1;
    sub_25D13E854();
    sub_25D15B820();
    sub_25D13E94C(&qword_26A6611D0, (void (*)(uint64_t))type metadata accessor for AudioMessagePlayer);
    sub_25D15B880();
    OUTLINED_FUNCTION_2_1();
    v22();
    sub_25D13DD84(v1, (void (*)(void))type metadata accessor for AudioMessagePlayer);
    uint64_t v23 = OUTLINED_FUNCTION_9_1();
    uint64_t v25 = v18;
    return v24(v23, v25);
  }
  uint64_t v33 = *(void *)v17;
  uint64_t v32 = *((void *)v17 + 1);
  char v34 = v17[16];
  LOBYTE(v48) = 2;
  sub_25D13E808();
  sub_25D15B820();
  uint64_t v48 = v33;
  uint64_t v49 = v32;
  char v50 = v34;
  sub_25D13AB1C();
  sub_25D15B880();
  OUTLINED_FUNCTION_2_1();
  v35();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_1();
  v36();
  return swift_bridgeObjectRelease();
}

unint64_t sub_25D13E7BC()
{
  unint64_t result = qword_26A661370;
  if (!qword_26A661370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661370);
  }
  return result;
}

unint64_t sub_25D13E808()
{
  unint64_t result = qword_26A661378;
  if (!qword_26A661378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661378);
  }
  return result;
}

unint64_t sub_25D13E854()
{
  unint64_t result = qword_26A661380;
  if (!qword_26A661380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661380);
  }
  return result;
}

uint64_t sub_25D13E8A0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_25D13E900()
{
  unint64_t result = qword_26A661388;
  if (!qword_26A661388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661388);
  }
  return result;
}

uint64_t sub_25D13E94C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ConfirmationSnippetModel.MessageType.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v82 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661390);
  OUTLINED_FUNCTION_0();
  uint64_t v76 = v5;
  uint64_t v77 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_0();
  uint64_t v81 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661398);
  OUTLINED_FUNCTION_0();
  uint64_t v74 = v8;
  uint64_t v75 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7_7(v9, v69);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6613A0);
  OUTLINED_FUNCTION_0();
  uint64_t v78 = v11;
  uint64_t v79 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8_6(v12, v69);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6613A8);
  OUTLINED_FUNCTION_0();
  uint64_t v83 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_12_0();
  uint64_t v15 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v69 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  char v22 = (char *)&v69 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v69 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v69 - v26;
  uint64_t v28 = a1[3];
  v85 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v28);
  sub_25D13E7BC();
  uint64_t v29 = v89;
  sub_25D15B9B0();
  if (!v29)
  {
    char v72 = v22;
    int v73 = v25;
    uint64_t v70 = v19;
    uint64_t v71 = v27;
    uint64_t v30 = v84;
    uint64_t v89 = v15;
    uint64_t v31 = v2;
    uint64_t v32 = sub_25D15B800();
    uint64_t v33 = *(void *)(v32 + 16);
    if (v33)
    {
      uint64_t v34 = v30;
      uint64_t v69 = 0;
      int v35 = *(unsigned __int8 *)(v32 + 32);
      sub_25D120AB0(1, v33, v32, v32 + 32, 0, (2 * v33) | 1);
      uint64_t v37 = v36;
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      if (v37 == v39 >> 1)
      {
        if (!v35)
        {
          LOBYTE(v86) = 0;
          sub_25D13E900();
          OUTLINED_FUNCTION_11_1();
          uint64_t v49 = v82;
          type metadata accessor for AttachmentModel();
          LOBYTE(v86) = 0;
          sub_25D13E94C(&qword_26A6609B0, (void (*)(uint64_t))type metadata accessor for AttachmentModel);
          sub_25D15B7F0();
          LOBYTE(v86) = 1;
          uint64_t v53 = sub_25D15B7A0();
          uint64_t v81 = v54;
          uint64_t v80 = v53;
          uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
          uint64_t v61 = (uint64_t)v73;
          uint64_t v62 = (uint64_t *)&v73[*(int *)(v60 + 48)];
          OUTLINED_FUNCTION_2_1();
          v63();
          swift_unknownObjectRelease();
          uint64_t v64 = OUTLINED_FUNCTION_10_2();
          v65(v64);
          uint64_t v66 = v81;
          *uint64_t v62 = v80;
          v62[1] = v66;
          swift_storeEnumTagMultiPayload();
          uint64_t v67 = v61;
          uint64_t v68 = (uint64_t)v71;
          sub_25D13E8A0(v67, (uint64_t)v71, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
LABEL_16:
          sub_25D13E8A0(v68, v49, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
        }
        if (v35 != 1)
        {
          LOBYTE(v86) = 2;
          sub_25D13E808();
          OUTLINED_FUNCTION_11_1();
          sub_25D13AB68();
          sub_25D15B7F0();
          OUTLINED_FUNCTION_2_1();
          v55();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_14_1();
          OUTLINED_FUNCTION_2_1();
          v56();
          uint64_t v57 = v87;
          char v58 = v88;
          uint64_t v59 = v70;
          *uint64_t v70 = v86;
          v59[1] = v57;
          *((unsigned char *)v59 + 16) = v58;
          swift_storeEnumTagMultiPayload();
          uint64_t v52 = (uint64_t)v59;
          goto LABEL_15;
        }
        LOBYTE(v86) = 1;
        sub_25D13E854();
        uint64_t v40 = v69;
        sub_25D15B780();
        if (!v40)
        {
          type metadata accessor for AudioMessagePlayer();
          sub_25D13E94C(&qword_26A6611E0, (void (*)(uint64_t))type metadata accessor for AudioMessagePlayer);
          uint64_t v41 = (uint64_t)v72;
          sub_25D15B7F0();
          OUTLINED_FUNCTION_2_1();
          v50();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_13_1();
          OUTLINED_FUNCTION_2_1();
          v51();
          swift_storeEnumTagMultiPayload();
          uint64_t v52 = v41;
LABEL_15:
          uint64_t v68 = (uint64_t)v71;
          sub_25D13E8A0(v52, (uint64_t)v71, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
          uint64_t v49 = v82;
          goto LABEL_16;
        }
        swift_unknownObjectRelease();
        uint64_t v42 = OUTLINED_FUNCTION_13_1();
        goto LABEL_11;
      }
      uint64_t v30 = v34;
      uint64_t v31 = v2;
    }
    uint64_t v45 = sub_25D15B720();
    swift_allocError();
    uint64_t v47 = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660988);
    *uint64_t v47 = v89;
    sub_25D15B790();
    sub_25D15B710();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v45 - 8) + 104))(v47, *MEMORY[0x263F8DCB0], v45);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
    uint64_t v42 = v31;
    uint64_t v43 = v30;
LABEL_11:
    v44(v42, v43);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
}

uint64_t sub_25D13F17C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ConfirmationSnippetModel.MessageType.init(from:)(a1, a2);
}

uint64_t sub_25D13F194(void *a1)
{
  return ConfirmationSnippetModel.MessageType.encode(to:)(a1);
}

uint64_t ConfirmationSnippetModel.init(recipientName:messageType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v8 = qword_26A660F38;
  *a4 = qword_26A660F30;
  a4[1] = v8;
  a4[2] = a1;
  a4[3] = a2;
  OUTLINED_FUNCTION_16_0();
  sub_25D13E8A0(a3, v9, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
  return swift_bridgeObjectRetain();
}

uint64_t ConfirmationSnippetModel.toLabelText.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationSnippetModel.toLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ConfirmationSnippetModel.toLabelText.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.recipientName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationSnippetModel.recipientName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ConfirmationSnippetModel.recipientName.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.messageType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ConfirmationSnippetModel(0);
  return sub_25D13FD6C(v1 + *(int *)(v3 + 24), a1, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
}

uint64_t ConfirmationSnippetModel.messageType.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_16_0();

  return sub_25D13FCBC(a1, v2);
}

uint64_t (*ConfirmationSnippetModel.messageType.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.description.getter()
{
  return 0;
}

uint64_t sub_25D13F534(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x546C6562614C6F74 && a2 == 0xEB00000000747865;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E65697069636572 && a2 == 0xED0000656D614E74;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_25D15B8C0();
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

uint64_t sub_25D13F6AC(char a1)
{
  return *(void *)&aTolabeltrecipi[8 * a1];
}

uint64_t sub_25D13F6CC()
{
  return sub_25D13F6AC(*v0);
}

uint64_t sub_25D13F6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D13F534(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D13F6FC(uint64_t a1)
{
  unint64_t v2 = sub_25D13FD20();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D13F738(uint64_t a1)
{
  unint64_t v2 = sub_25D13FD20();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ConfirmationSnippetModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6613B0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13FD20();
  sub_25D15B9D0();
  sub_25D15B850();
  if (!v1)
  {
    sub_25D15B850();
    type metadata accessor for ConfirmationSnippetModel(0);
    type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    sub_25D13E94C(&qword_26A6613C0, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel.MessageType);
    sub_25D15B880();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t ConfirmationSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_0();
  uint64_t v18 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6613C8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_6_7();
  uint64_t v16 = type metadata accessor for ConfirmationSnippetModel(v8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4();
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v3[1] = qword_26A660F38;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D13FD20();
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_15_0();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *BOOL v3 = v10;
    v3[1] = v12;
    v3[2] = OUTLINED_FUNCTION_15_0();
    v3[3] = v13;
    sub_25D13E94C(&qword_26A6613D0, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel.MessageType);
    sub_25D15B7F0();
    OUTLINED_FUNCTION_2_1();
    v14();
    sub_25D13E8A0(v18, (uint64_t)v3 + *(int *)(v16 + 24), (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
    sub_25D13FD6C((uint64_t)v3, a2, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25D13DD84((uint64_t)v3, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
  }
}

uint64_t sub_25D13FC38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ConfirmationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_25D13FC50(void *a1)
{
  return ConfirmationSnippetModel.encode(to:)(a1);
}

uint64_t type metadata accessor for ConfirmationSnippetModel(uint64_t a1)
{
  return sub_25D13FC88(a1, (uint64_t *)&unk_26A6613E8);
}

uint64_t sub_25D13FC88(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25D13FCBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_25D13FD20()
{
  unint64_t result = qword_26A6613B8;
  if (!qword_26A6613B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6613B8);
  }
  return result;
}

uint64_t sub_25D13FD6C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25D13FDCC()
{
  return sub_25D13E94C(&qword_26A6613D8, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
}

uint64_t sub_25D13FE14()
{
  return sub_25D13E94C(&qword_26A6613E0, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *BOOL v3 = *a2;
    BOOL v3 = (uint64_t *)(v22 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v23 = *((void *)v9 + 1);
      *(void *)uint64_t v8 = *(void *)v9;
      *((void *)v8 + 1) = v23;
      v8[16] = v9[16];
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = sub_25D15B1C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
      uint64_t v12 = (int *)type metadata accessor for AudioMessagePlayer();
      v8[v12[5]] = v9[v12[5]];
      uint64_t v13 = v12[6];
      uint64_t v14 = &v8[v13];
      uint64_t v15 = &v9[v13];
      uint64_t v17 = *(void *)v15;
      uint64_t v16 = *((void *)v15 + 1);
      *(void *)uint64_t v14 = v17;
      *((void *)v14 + 1) = v16;
      uint64_t v18 = v12[7];
      uint64_t v19 = &v8[v18];
      uint64_t v20 = &v9[v18];
      uint64_t v21 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v26 = sub_25D15B1C0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v8, v9, v26);
          uint64_t v25 = type metadata accessor for MapAttachment();
          goto LABEL_11;
        case 2u:
        case 3u:
          *(void *)uint64_t v8 = *(void *)v9;
          v8[8] = v9[8];
          swift_retain();
          break;
        default:
          uint64_t v24 = sub_25D15B1C0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v8, v9, v24);
          uint64_t v25 = type metadata accessor for LinkAttachment();
LABEL_11:
          v8[*(int *)(v25 + 20)] = v9[*(int *)(v25 + 20)];
          break;
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
      uint64_t v28 = &v8[v27];
      uint64_t v29 = &v9[v27];
      uint64_t v30 = *((void *)v29 + 1);
      *(void *)uint64_t v28 = *(void *)v29;
      *((void *)v28 + 1) = v30;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for ConfirmationSnippetModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result != 2)
  {
    if (result == 1)
    {
      uint64_t v7 = sub_25D15B1C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
      type metadata accessor for AudioMessagePlayer();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (result) {
        return result;
      }
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
          uint64_t v6 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
          break;
        case 2u:
        case 3u:
          swift_release();
          break;
        default:
          break;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
    }
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ConfirmationSnippetModel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v21 = *((void *)v8 + 1);
    *(void *)uint64_t v7 = *(void *)v8;
    *((void *)v7 + 1) = v21;
    v7[16] = v8[16];
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = sub_25D15B1C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
    uint64_t v11 = (int *)type metadata accessor for AudioMessagePlayer();
    v7[v11[5]] = v8[v11[5]];
    uint64_t v12 = v11[6];
    uint64_t v13 = &v7[v12];
    uint64_t v14 = &v8[v12];
    uint64_t v16 = *(void *)v14;
    uint64_t v15 = *((void *)v14 + 1);
    *(void *)uint64_t v13 = v16;
    *((void *)v13 + 1) = v15;
    uint64_t v17 = v11[7];
    uint64_t v18 = &v7[v17];
    uint64_t v19 = &v8[v17];
    uint64_t v20 = *((void *)v19 + 1);
    *(void *)uint64_t v18 = *(void *)v19;
    *((void *)v18 + 1) = v20;
    swift_bridgeObjectRetain();
  }
  else
  {
    type metadata accessor for AttachmentModel();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v24 = sub_25D15B1C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v7, v8, v24);
        uint64_t v23 = type metadata accessor for MapAttachment();
        goto LABEL_9;
      case 2u:
      case 3u:
        *(void *)uint64_t v7 = *(void *)v8;
        v7[8] = v8[8];
        swift_retain();
        break;
      default:
        uint64_t v22 = sub_25D15B1C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v7, v8, v22);
        uint64_t v23 = type metadata accessor for LinkAttachment();
LABEL_9:
        v7[*(int *)(v23 + 20)] = v8[*(int *)(v23 + 20)];
        break;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
    uint64_t v26 = &v7[v25];
    uint64_t v27 = &v8[v25];
    uint64_t v28 = *((void *)v27 + 1);
    *(void *)uint64_t v26 = *(void *)v27;
    *((void *)v26 + 1) = v28;
  }
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for ConfirmationSnippetModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_25D13DD84((uint64_t)a1 + v6, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
    type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(void *)uint64_t v7 = *(void *)v8;
      *((void *)v7 + 1) = *((void *)v8 + 1);
      v7[16] = v8[16];
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_25D15B1C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
      uint64_t v11 = (int *)type metadata accessor for AudioMessagePlayer();
      v7[v11[5]] = v8[v11[5]];
      uint64_t v12 = v11[6];
      uint64_t v13 = &v7[v12];
      uint64_t v14 = &v8[v12];
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = *((void *)v14 + 1);
      uint64_t v15 = v11[7];
      uint64_t v16 = &v7[v15];
      uint64_t v17 = &v8[v15];
      *(void *)uint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      swift_bridgeObjectRetain();
    }
    else
    {
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v20 = sub_25D15B1C0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v7, v8, v20);
          uint64_t v19 = type metadata accessor for MapAttachment();
          goto LABEL_10;
        case 2u:
        case 3u:
          *(void *)uint64_t v7 = *(void *)v8;
          v7[8] = v8[8];
          swift_retain();
          break;
        default:
          uint64_t v18 = sub_25D15B1C0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v7, v8, v18);
          uint64_t v19 = type metadata accessor for LinkAttachment();
LABEL_10:
          v7[*(int *)(v19 + 20)] = v8[*(int *)(v19 + 20)];
          break;
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
      uint64_t v22 = &v7[v21];
      uint64_t v23 = &v8[v21];
      *(void *)uint64_t v22 = *(void *)v23;
      *((void *)v22 + 1) = *((void *)v23 + 1);
    }
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for ConfirmationSnippetModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v14 = sub_25D15B1C0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32))(v6, v7, v14);
    uint64_t v15 = (int *)type metadata accessor for AudioMessagePlayer();
    v6[v15[5]] = v7[v15[5]];
    *(_OWORD *)&v6[v15[6]] = *(_OWORD *)&v7[v15[6]];
    *(_OWORD *)&v6[v15[7]] = *(_OWORD *)&v7[v15[7]];
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v10 = type metadata accessor for AttachmentModel();
    int v11 = swift_getEnumCaseMultiPayload();
    if (v11 == 1)
    {
      uint64_t v16 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 32))(v6, v7, v16);
      uint64_t v17 = type metadata accessor for MapAttachment();
      v6[*(int *)(v17 + 20)] = v7[*(int *)(v17 + 20)];
    }
    else
    {
      if (v11)
      {
        memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
        goto LABEL_11;
      }
      uint64_t v12 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v12 - 8) + 32))(v6, v7, v12);
      uint64_t v13 = type metadata accessor for LinkAttachment();
      v6[*(int *)(v13 + 20)] = v7[*(int *)(v13 + 20)];
    }
    swift_storeEnumTagMultiPayload();
LABEL_11:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
    *(_OWORD *)&v6[*(int *)(v18 + 48)] = *(_OWORD *)&v7[*(int *)(v18 + 48)];
    goto LABEL_12;
  }
  memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  return a1;
}

void *assignWithTake for ConfirmationSnippetModel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    sub_25D13DD84((uint64_t)a1 + v8, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
    uint64_t v11 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v17 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 32))(v9, v10, v17);
      uint64_t v18 = (int *)type metadata accessor for AudioMessagePlayer();
      v9[v18[5]] = v10[v18[5]];
      *(_OWORD *)&v9[v18[6]] = *(_OWORD *)&v10[v18[6]];
      *(_OWORD *)&v9[v18[7]] = *(_OWORD *)&v10[v18[7]];
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v13 = type metadata accessor for AttachmentModel();
      int v14 = swift_getEnumCaseMultiPayload();
      if (v14 == 1)
      {
        uint64_t v19 = sub_25D15B1C0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v19 - 8) + 32))(v9, v10, v19);
        uint64_t v20 = type metadata accessor for MapAttachment();
        v9[*(int *)(v20 + 20)] = v10[*(int *)(v20 + 20)];
      }
      else
      {
        if (v14)
        {
          memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
          goto LABEL_12;
        }
        uint64_t v15 = sub_25D15B1C0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 32))(v9, v10, v15);
        uint64_t v16 = type metadata accessor for LinkAttachment();
        v9[*(int *)(v16 + 20)] = v10[*(int *)(v16 + 20)];
      }
      swift_storeEnumTagMultiPayload();
LABEL_12:
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
      *(_OWORD *)&v9[*(int *)(v21 + 48)] = *(_OWORD *)&v10[*(int *)(v21 + 48)];
      goto LABEL_13;
    }
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D140CDC);
}

uint64_t sub_25D140CDC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D140D78);
}

uint64_t sub_25D140D78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_25D140DF8()
{
  uint64_t result = type metadata accessor for ConfirmationSnippetModel.MessageType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ConfirmationSnippetModel.MessageType(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *(void *)a1 = *a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v19 = a2[1];
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = v19;
      *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_25D15B1C0();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = (int *)type metadata accessor for AudioMessagePlayer();
      *(unsigned char *)(a1 + v8[5]) = *((unsigned char *)a2 + v8[5]);
      uint64_t v9 = v8[6];
      uint64_t v10 = (void *)(a1 + v9);
      uint64_t v11 = (uint64_t *)((char *)a2 + v9);
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      *uint64_t v10 = v13;
      v10[1] = v12;
      uint64_t v14 = v8[7];
      uint64_t v15 = (void *)(a1 + v14);
      uint64_t v16 = (uint64_t *)((char *)a2 + v14);
      uint64_t v17 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v22 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v22 - 8) + 16))(a1, a2, v22);
          uint64_t v23 = type metadata accessor for MapAttachment();
          *(unsigned char *)(a1 + *(int *)(v23 + 20)) = *((unsigned char *)a2 + *(int *)(v23 + 20));
          break;
        case 2u:
        case 3u:
          *(void *)a1 = *a2;
          *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
          swift_retain();
          break;
        default:
          uint64_t v20 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v20 - 8) + 16))(a1, a2, v20);
          uint64_t v21 = type metadata accessor for LinkAttachment();
          *(unsigned char *)(a1 + *(int *)(v21 + 20)) = *((unsigned char *)a2 + *(int *)(v21 + 20));
          break;
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
      uint64_t v25 = (void *)(a1 + v24);
      uint64_t v26 = (uint64_t *)((char *)a2 + v24);
      uint64_t v27 = v26[1];
      *uint64_t v25 = *v26;
      v25[1] = v27;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ConfirmationSnippetModel.MessageType(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result != 2)
  {
    if (result == 1)
    {
      uint64_t v4 = sub_25D15B1C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
      type metadata accessor for AudioMessagePlayer();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (result) {
        return result;
      }
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
          uint64_t v3 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
          break;
        case 2u:
        case 3u:
          swift_release();
          break;
        default:
          break;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
    }
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ConfirmationSnippetModel.MessageType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v16 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v16;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_25D15B1C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    uint64_t v6 = (int *)type metadata accessor for AudioMessagePlayer();
    *(unsigned char *)(a1 + v6[5]) = *(unsigned char *)(a2 + v6[5]);
    uint64_t v7 = v6[6];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)(a2 + v7);
    uint64_t v11 = *v9;
    uint64_t v10 = v9[1];
    *uint64_t v8 = v11;
    v8[1] = v10;
    uint64_t v12 = v6[7];
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)(a2 + v12);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    type metadata accessor for AttachmentModel();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v19 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
        uint64_t v20 = type metadata accessor for MapAttachment();
        *(unsigned char *)(a1 + *(int *)(v20 + 20)) = *(unsigned char *)(a2 + *(int *)(v20 + 20));
        break;
      case 2u:
      case 3u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
        swift_retain();
        break;
      default:
        uint64_t v17 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
        uint64_t v18 = type metadata accessor for LinkAttachment();
        *(unsigned char *)(a1 + *(int *)(v18 + 20)) = *(unsigned char *)(a2 + *(int *)(v18 + 20));
        break;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
    uint64_t v22 = (void *)(a1 + v21);
    uint64_t v23 = (void *)(a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ConfirmationSnippetModel.MessageType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25D13DD84(a1, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_25D15B1C0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      uint64_t v6 = (int *)type metadata accessor for AudioMessagePlayer();
      *(unsigned char *)(a1 + v6[5]) = *(unsigned char *)(a2 + v6[5]);
      uint64_t v7 = v6[6];
      uint64_t v8 = (void *)(a1 + v7);
      uint64_t v9 = (void *)(a2 + v7);
      *uint64_t v8 = *v9;
      v8[1] = v9[1];
      uint64_t v10 = v6[7];
      uint64_t v11 = (void *)(a1 + v10);
      uint64_t v12 = (void *)(a2 + v10);
      *uint64_t v11 = *v12;
      v11[1] = v12[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      type metadata accessor for AttachmentModel();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v15 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
          uint64_t v16 = type metadata accessor for MapAttachment();
          *(unsigned char *)(a1 + *(int *)(v16 + 20)) = *(unsigned char *)(a2 + *(int *)(v16 + 20));
          break;
        case 2u:
        case 3u:
          *(void *)a1 = *(void *)a2;
          *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
          swift_retain();
          break;
        default:
          uint64_t v13 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
          uint64_t v14 = type metadata accessor for LinkAttachment();
          *(unsigned char *)(a1 + *(int *)(v14 + 20)) = *(unsigned char *)(a2 + *(int *)(v14 + 20));
          break;
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
      uint64_t v18 = (void *)(a1 + v17);
      uint64_t v19 = (void *)(a2 + v17);
      *uint64_t v18 = *v19;
      v18[1] = v19[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

unsigned char *initializeWithTake for ConfirmationSnippetModel.MessageType(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v11 = sub_25D15B1C0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
    uint64_t v12 = (int *)type metadata accessor for AudioMessagePlayer();
    a1[v12[5]] = a2[v12[5]];
    *(_OWORD *)&a1[v12[6]] = *(_OWORD *)&a2[v12[6]];
    *(_OWORD *)&a1[v12[7]] = *(_OWORD *)&a2[v12[7]];
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = type metadata accessor for AttachmentModel();
    int v8 = swift_getEnumCaseMultiPayload();
    if (v8 == 1)
    {
      uint64_t v13 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
      uint64_t v14 = type metadata accessor for MapAttachment();
      a1[*(int *)(v14 + 20)] = a2[*(int *)(v14 + 20)];
    }
    else
    {
      if (v8)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
        goto LABEL_11;
      }
      uint64_t v9 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      uint64_t v10 = type metadata accessor for LinkAttachment();
      a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
    }
    swift_storeEnumTagMultiPayload();
LABEL_11:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
    *(_OWORD *)&a1[*(int *)(v15 + 48)] = *(_OWORD *)&a2[*(int *)(v15 + 48)];
    goto LABEL_12;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

unsigned char *assignWithTake for ConfirmationSnippetModel.MessageType(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25D13DD84((uint64_t)a1, (void (*)(void))type metadata accessor for ConfirmationSnippetModel.MessageType);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = sub_25D15B1C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
      uint64_t v12 = (int *)type metadata accessor for AudioMessagePlayer();
      a1[v12[5]] = a2[v12[5]];
      *(_OWORD *)&a1[v12[6]] = *(_OWORD *)&a2[v12[6]];
      *(_OWORD *)&a1[v12[7]] = *(_OWORD *)&a2[v12[7]];
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = type metadata accessor for AttachmentModel();
      int v8 = swift_getEnumCaseMultiPayload();
      if (v8 == 1)
      {
        uint64_t v13 = sub_25D15B1C0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
        uint64_t v14 = type metadata accessor for MapAttachment();
        a1[*(int *)(v14 + 20)] = a2[*(int *)(v14 + 20)];
      }
      else
      {
        if (v8)
        {
          memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
          goto LABEL_12;
        }
        uint64_t v9 = sub_25D15B1C0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
        uint64_t v10 = type metadata accessor for LinkAttachment();
        a1[*(int *)(v10 + 20)] = a2[*(int *)(v10 + 20)];
      }
      swift_storeEnumTagMultiPayload();
LABEL_12:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
      *(_OWORD *)&a1[*(int *)(v15 + 48)] = *(_OWORD *)&a2[*(int *)(v15 + 48)];
      goto LABEL_13;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_25D141C94()
{
  uint64_t result = type metadata accessor for AttachmentModel();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    uint64_t v4 = &v3;
    uint64_t result = type metadata accessor for AudioMessagePlayer();
    if (v2 <= 0x3F)
    {
      uint64_t v5 = *(void *)(result - 8) + 64;
      uint64_t v6 = &unk_25D15F5F0;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.CodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.CodingKeys;
}

unsigned char *_s18SiriMessagesCommon24ConfirmationSnippetModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D141E58);
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

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.CodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D141F5CLL);
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

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.AttachmentCodingKeys;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.AudioCodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.AudioCodingKeys;
}

unsigned char *_s18SiriMessagesCommon24ConfirmationSnippetModelV11MessageTypeO15AudioCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25D142044);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.MessageType.TextCodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.MessageType.TextCodingKeys;
}

unint64_t sub_25D142080()
{
  unint64_t result = qword_26A661408;
  if (!qword_26A661408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661408);
  }
  return result;
}

unint64_t sub_25D1420D0()
{
  unint64_t result = qword_26A661410;
  if (!qword_26A661410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661410);
  }
  return result;
}

unint64_t sub_25D142120()
{
  unint64_t result = qword_26A661418;
  if (!qword_26A661418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661418);
  }
  return result;
}

unint64_t sub_25D142170()
{
  unint64_t result = qword_26A661420;
  if (!qword_26A661420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661420);
  }
  return result;
}

unint64_t sub_25D1421C0()
{
  unint64_t result = qword_26A661428;
  if (!qword_26A661428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661428);
  }
  return result;
}

unint64_t sub_25D142210()
{
  unint64_t result = qword_26A661430;
  if (!qword_26A661430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661430);
  }
  return result;
}

unint64_t sub_25D142260()
{
  unint64_t result = qword_26A661438;
  if (!qword_26A661438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661438);
  }
  return result;
}

unint64_t sub_25D1422B0()
{
  unint64_t result = qword_26A661440;
  if (!qword_26A661440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661440);
  }
  return result;
}

unint64_t sub_25D142300()
{
  unint64_t result = qword_26A661448;
  if (!qword_26A661448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661448);
  }
  return result;
}

unint64_t sub_25D142350()
{
  unint64_t result = qword_26A661450;
  if (!qword_26A661450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661450);
  }
  return result;
}

unint64_t sub_25D1423A0()
{
  unint64_t result = qword_26A661458;
  if (!qword_26A661458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661458);
  }
  return result;
}

unint64_t sub_25D1423F0()
{
  unint64_t result = qword_26A661460;
  if (!qword_26A661460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661460);
  }
  return result;
}

unint64_t sub_25D142440()
{
  unint64_t result = qword_26A661468;
  if (!qword_26A661468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661468);
  }
  return result;
}

unint64_t sub_25D142490()
{
  unint64_t result = qword_26A661470;
  if (!qword_26A661470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661470);
  }
  return result;
}

unint64_t sub_25D1424E0()
{
  unint64_t result = qword_26A661478;
  if (!qword_26A661478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661478);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return 0;
}

void OUTLINED_FUNCTION_7_7(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_8_6(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_25D15B780();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_25D15B7C0();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return type metadata accessor for ConfirmationSnippetModel(0);
}

uint64_t AudioMessagePlayer.init(audioMessageURL:isDraft:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  unsigned int v6 = (int *)type metadata accessor for AudioMessagePlayer();
  uint64_t v7 = v6[6];
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  int v8 = (void *)(a3 + v7);
  swift_beginAccess();
  uint64_t v9 = qword_26A660E88;
  *int v8 = qword_26A660E80;
  v8[1] = v9;
  uint64_t v10 = (void *)(a3 + v6[7]);
  uint64_t v11 = unk_26A660ED8;
  *uint64_t v10 = qword_26A660ED0;
  v10[1] = v11;
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(a3, a1);
  *(unsigned char *)(a3 + v6[5]) = a2 & 1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for AudioMessagePlayer()
{
  uint64_t result = qword_26A661498;
  if (!qword_26A661498) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AudioMessagePlayer.audioMessageURL.getter@<X0>(uint64_t a1@<X8>)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t AudioMessagePlayer.audioMessageURL.setter(uint64_t a1)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v1, a1, v3);
}

uint64_t (*AudioMessagePlayer.audioMessageURL.modify())()
{
  return nullsub_1;
}

uint64_t AudioMessagePlayer.isDraft.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AudioMessagePlayer() + 20));
}

uint64_t AudioMessagePlayer.isDraft.setter(char a1)
{
  uint64_t result = type metadata accessor for AudioMessagePlayer();
  *(unsigned char *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*AudioMessagePlayer.isDraft.modify())()
{
  return nullsub_1;
}

uint64_t AudioMessagePlayer.sendLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AudioMessagePlayer() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioMessagePlayer.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AudioMessagePlayer() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AudioMessagePlayer.sendLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AudioMessagePlayer.audioMessageLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AudioMessagePlayer() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioMessagePlayer.audioMessageLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AudioMessagePlayer() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AudioMessagePlayer.audioMessageLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D142AD8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x73654D6F69647561 && a2 == 0xEF4C525565676173;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x74666172447369 && a2 == 0xE700000000000000;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000015 && a2 == 0x800000025D1635E0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v8 = sub_25D15B8C0();
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

unint64_t sub_25D142CA0(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74666172447369;
      break;
    case 2:
      unint64_t result = 0x6562614C646E6573;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0x73654D6F69647561;
      break;
  }
  return result;
}

unint64_t sub_25D142D50()
{
  return sub_25D142CA0(*v0);
}

uint64_t sub_25D142D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D142AD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D142D80(uint64_t a1)
{
  unint64_t v2 = sub_25D142FCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D142DBC(uint64_t a1)
{
  unint64_t v2 = sub_25D142FCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AudioMessagePlayer.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661480);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D142FCC();
  sub_25D15B9D0();
  sub_25D15B1C0();
  sub_25D1433D8(&qword_26A660B30);
  sub_25D15B880();
  if (!v1)
  {
    type metadata accessor for AudioMessagePlayer();
    sub_25D15B860();
    sub_25D15B850();
    sub_25D15B850();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_25D142FCC()
{
  unint64_t result = qword_26A661488;
  if (!qword_26A661488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661488);
  }
  return result;
}

uint64_t AudioMessagePlayer.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_0();
  uint64_t v29 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661490);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = type metadata accessor for AudioMessagePlayer();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_0();
  uint64_t v12 = v11 - v10;
  uint64_t v14 = (uint64_t *)(v11 - v10 + *(int *)(v13 + 24));
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v15 = qword_26A660E88;
  *uint64_t v14 = qword_26A660E80;
  v14[1] = v15;
  uint64_t v16 = (uint64_t *)(v12 + *(int *)(v8 + 28));
  uint64_t v17 = unk_26A660ED8;
  *uint64_t v16 = qword_26A660ED0;
  v16[1] = v17;
  uint64_t v31 = v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D142FCC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (v32)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25D1433D8(&qword_26A660B40);
    sub_25D15B7F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v12, v29, v30);
    OUTLINED_FUNCTION_6_8(1);
    *(unsigned char *)(v12 + *(int *)(v8 + 20)) = sub_25D15B7D0() & 1;
    OUTLINED_FUNCTION_6_8(2);
    uint64_t v18 = sub_25D15B7C0();
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *uint64_t v14 = v18;
    v14[1] = v20;
    uint64_t v21 = sub_25D15B7C0();
    uint64_t v23 = v22;
    uint64_t v24 = OUTLINED_FUNCTION_5_9();
    v25(v24);
    swift_bridgeObjectRelease();
    *uint64_t v31 = v21;
    v31[1] = v23;
    sub_25D14341C(v12, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25D143480(v12);
  }
}

uint64_t sub_25D1433D8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25D15B1C0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25D14341C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AudioMessagePlayer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D143480(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AudioMessagePlayer();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D1434DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AudioMessagePlayer.init(from:)(a1, a2);
}

uint64_t sub_25D1434F4(void *a1)
{
  return AudioMessagePlayer.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for AudioMessagePlayer(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25D15B1C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = (void *)((char *)a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AudioMessagePlayer(uint64_t a1)
{
  uint64_t v2 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for AudioMessagePlayer(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25D15B1C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioMessagePlayer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D143964);
}

uint64_t sub_25D143964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_1();
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

uint64_t storeEnumTagSinglePayload for AudioMessagePlayer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D143A08);
}

void sub_25D143A08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t sub_25D143A94()
{
  uint64_t result = sub_25D15B1C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AudioMessagePlayer.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D143C00);
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

ValueMetadata *type metadata accessor for AudioMessagePlayer.CodingKeys()
{
  return &type metadata for AudioMessagePlayer.CodingKeys;
}

unint64_t sub_25D143C3C()
{
  unint64_t result = qword_26A6614A8;
  if (!qword_26A6614A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6614A8);
  }
  return result;
}

unint64_t sub_25D143C8C()
{
  unint64_t result = qword_26A6614B0;
  if (!qword_26A6614B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6614B0);
  }
  return result;
}

unint64_t sub_25D143CDC()
{
  unint64_t result = qword_26A6614B8;
  if (!qword_26A6614B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6614B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_8@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return v1 - 65;
}

uint64_t sub_25D143D78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25D143D90(a1, a2);
}

uint64_t sub_25D143D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&long long v19 = 0x692D6E6F69746361;
  *((void *)&v19 + 1) = 0xE900000000000064;
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)&v16, a1, &v19);
  sub_25D122964((uint64_t)&v16);
  if (v20)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v14;
      uint64_t v5 = v15;
      goto LABEL_6;
    }
  }
  else
  {
    sub_25D144AF8((uint64_t)&v19, &qword_26A6614C0);
  }
  uint64_t v6 = 0;
  uint64_t v5 = 0;
LABEL_6:
  *(void *)&long long v16 = &type metadata for UpdateSnippetAction;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6614F8);
  uint64_t v7 = sub_25D15B4C0();
  if (!v5)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v6 == v7 && v5 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
  }
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)&v16, a1, &v19);
  swift_bridgeObjectRelease();
  sub_25D122964((uint64_t)&v16);
  if (!v20)
  {
    uint64_t result = sub_25D144AF8((uint64_t)&v19, &qword_26A6614C0);
    goto LABEL_21;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_21:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 24) = 0;
    *(void *)(a2 + 16) = 0;
    return result;
  }
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D144DB4();
  sub_25D15B0C0();
  sub_25D1217BC(0x642D6E6F69746361, 0xEB00000000617461);
  uint64_t result = swift_release();
  if (!v2)
  {
    uint64_t v12 = v17;
    char v13 = v18;
    *(_OWORD *)a2 = v16;
    *(void *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 24) = v13;
  }
  return result;
}

uint64_t sub_25D144034@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  *(void *)&long long v16 = 0x692D6E6F69746361;
  *((void *)&v16 + 1) = 0xE900000000000064;
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)v15, a1, &v16);
  sub_25D122964((uint64_t)v15);
  if (v17)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v13;
      uint64_t v5 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    sub_25D144AF8((uint64_t)&v16, &qword_26A6614C0);
  }
  uint64_t v6 = 0;
  uint64_t v5 = 0;
LABEL_6:
  v15[0] = &type metadata for AutoSendableButtonAction;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6614E8);
  uint64_t v7 = sub_25D15B4C0();
  if (!v5)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v6 == v7 && v5 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
  }
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)v15, a1, &v16);
  swift_bridgeObjectRelease();
  sub_25D122964((uint64_t)v15);
  if (!v17)
  {
    uint64_t result = sub_25D144AF8((uint64_t)&v16, &qword_26A6614C0);
    goto LABEL_21;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_21:
    char v12 = 2;
    goto LABEL_22;
  }
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D144D68();
  sub_25D15B0C0();
  sub_25D1217BC(0x642D6E6F69746361, 0xEB00000000617461);
  uint64_t result = swift_release();
  if (v2) {
    return result;
  }
  char v12 = v15[0];
LABEL_22:
  *a2 = v12;
  return result;
}

uint64_t sub_25D1442C0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  *(void *)&long long v16 = 0x692D6E6F69746361;
  *((void *)&v16 + 1) = 0xE900000000000064;
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)v15, a1, &v16);
  sub_25D122964((uint64_t)v15);
  if (v17)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v13;
      uint64_t v5 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    sub_25D144AF8((uint64_t)&v16, &qword_26A6614C0);
  }
  uint64_t v6 = 0;
  uint64_t v5 = 0;
LABEL_6:
  v15[0] = &type metadata for PayloadTextInputAction;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6614D8);
  uint64_t v7 = sub_25D15B4C0();
  if (!v5)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v6 == v7 && v5 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
  }
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)v15, a1, &v16);
  swift_bridgeObjectRelease();
  sub_25D122964((uint64_t)v15);
  if (!v17)
  {
    uint64_t result = sub_25D144AF8((uint64_t)&v16, &qword_26A6614C0);
    goto LABEL_21;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_21:
    char v12 = 1;
    goto LABEL_22;
  }
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  sub_25D144D1C();
  sub_25D15B0C0();
  sub_25D1217BC(0x642D6E6F69746361, 0xEB00000000617461);
  uint64_t result = swift_release();
  if (v2) {
    return result;
  }
  char v12 = 0;
LABEL_22:
  *a2 = v12;
  return result;
}

uint64_t CustomCanvasAction<>.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  char v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_1_16();
  *(void *)&long long v33 = v11;
  *((void *)&v33 + 1) = v12;
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)v32, a1, &v33);
  sub_25D122964((uint64_t)v32);
  uint64_t v28 = v8;
  uint64_t v29 = a4;
  if (v34)
  {
    if (OUTLINED_FUNCTION_2_12())
    {
      uint64_t v13 = v30;
      unint64_t v14 = v31;
      goto LABEL_6;
    }
  }
  else
  {
    sub_25D144AF8((uint64_t)&v33, &qword_26A6614C0);
  }
  uint64_t v13 = 0;
  unint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  if (!v14)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v13 == v15 && v14 == v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      goto LABEL_14;
    }
  }
  OUTLINED_FUNCTION_0_8();
  uint64_t v30 = v19;
  unint64_t v31 = v20;
  sub_25D15B6B0();
  sub_25D1223AC((uint64_t)v32, a1, &v33);
  swift_bridgeObjectRelease();
  sub_25D122964((uint64_t)v32);
  if (!v34)
  {
    sub_25D144AF8((uint64_t)&v33, &qword_26A6614C0);
    goto LABEL_21;
  }
  if ((OUTLINED_FUNCTION_2_12() & 1) == 0)
  {
LABEL_21:
    uint64_t v26 = 1;
    uint64_t v25 = v29;
    return __swift_storeEnumTagSinglePayload(v25, v26, 1, a2);
  }
  uint64_t v21 = v30;
  unint64_t v22 = v31;
  sub_25D15B0E0();
  swift_allocObject();
  sub_25D15B0D0();
  uint64_t v23 = v35;
  sub_25D15B0C0();
  sub_25D1217BC(v21, v22);
  uint64_t result = swift_release();
  if (v23) {
    return result;
  }
  uint64_t v25 = v29;
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v29, v10, a2);
  uint64_t v26 = 0;
  return __swift_storeEnumTagSinglePayload(v25, v26, 1, a2);
}

uint64_t sub_25D144834()
{
  return sub_25D1398F0((uint64_t)&type metadata for UpdateSnippetAction, &qword_26A6614F8);
}

uint64_t static CustomCanvasAction<>.name.getter()
{
  return sub_25D15B4C0();
}

uint64_t sub_25D14488C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_25D144034(a1, a2);
}

uint64_t sub_25D1448A4()
{
  return sub_25D1398F0((uint64_t)&type metadata for AutoSendableButtonAction, &qword_26A6614E8);
}

uint64_t sub_25D1448CC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_25D1442C0(a1, a2);
}

uint64_t sub_25D1448E4()
{
  return sub_25D1398F0((uint64_t)&type metadata for PayloadTextInputAction, &qword_26A6614D8);
}

uint64_t static CustomCanvasAction<>.idKey.getter()
{
  return 0x692D6E6F69746361;
}

uint64_t static CustomCanvasAction<>.dataKey.getter()
{
  return 0x642D6E6F69746361;
}

uint64_t CustomCanvasAction<>.toSharedState()(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6614C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25D15FDD0;
  OUTLINED_FUNCTION_1_16();
  uint64_t v5 = MEMORY[0x263F8D310];
  sub_25D15B6B0();
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  *(void *)(inited + 96) = v5;
  *(void *)(inited + 72) = v6;
  *(void *)(inited + 80) = v7;
  OUTLINED_FUNCTION_0_8();
  sub_25D15B6B0();
  sub_25D15B110();
  swift_allocObject();
  sub_25D15B100();
  uint64_t v8 = sub_25D15B0F0();
  if (v13)
  {
    swift_release();
    sub_25D122964(inited + 104);
    sub_25D144AF8(inited + 32, &qword_26A6614D0);
    *(void *)(inited + 16) = 0;
    swift_setDeallocating();
    return sub_25D144C7C();
  }
  else
  {
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    swift_release();
    *(void *)(inited + 168) = MEMORY[0x263F06F78];
    *(void *)(inited + 144) = v11;
    *(void *)(inited + 152) = v12;
    return sub_25D15B470();
  }
}

uint64_t sub_25D144AF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *CustomCanvasAction<>.serializedData()(uint64_t a1, uint64_t a2)
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  CustomCanvasAction<>.toSharedState()(a1, a2);
  if (!v2)
  {
    unsigned int v4 = self;
    uint64_t v5 = (void *)sub_25D15B450();
    swift_bridgeObjectRelease();
    v9[0] = 0;
    id v6 = objc_msgSend(v4, sel_dataWithPropertyList_format_options_error_, v5, 200, 0, v9);

    id v7 = v9[0];
    if (v6)
    {
      uint64_t v3 = (void *)sub_25D15B1F0();
    }
    else
    {
      uint64_t v3 = v7;
      sub_25D15B120();

      swift_willThrow();
    }
  }
  return v3;
}

uint64_t sub_25D144C7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6614D0);
  swift_arrayDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t dispatch thunk of CustomCanvasAction.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static CustomCanvasAction.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unint64_t sub_25D144D1C()
{
  unint64_t result = qword_26A6614E0;
  if (!qword_26A6614E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6614E0);
  }
  return result;
}

unint64_t sub_25D144D68()
{
  unint64_t result = qword_26A6614F0;
  if (!qword_26A6614F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6614F0);
  }
  return result;
}

unint64_t sub_25D144DB4()
{
  unint64_t result = qword_26A661500;
  if (!qword_26A661500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661500);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  return swift_dynamicCast();
}

uint64_t AppSash.init(appBundleIdentifier:launchAppWithIntent:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void AppSash.launchAppWithIntent.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t AppSash.appBundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSash.appBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AppSash.appBundleIdentifier.modify())()
{
  return nullsub_1;
}

void *AppSash.launchAppWithIntent.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void *sub_25D144F44@<X0>(void *a1@<X8>)
{
  uint64_t result = AppSash.launchAppWithIntent.getter();
  *a1 = result;
  return result;
}

void sub_25D144F88(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  AppSash.launchAppWithIntent.setter((uint64_t)v1);
}

void (*AppSash.launchAppWithIntent.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117B7C;
}

uint64_t sub_25D145004(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025D163350 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025D163030)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_25D1450F0()
{
  return 0xD000000000000013;
}

unint64_t sub_25D145124()
{
  return sub_25D1450F0();
}

uint64_t sub_25D14512C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D145004(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D145154(uint64_t a1)
{
  unint64_t v2 = sub_25D14535C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D145190(uint64_t a1)
{
  unint64_t v2 = sub_25D14535C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppSash.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661508);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14535C();
  sub_25D15B9D0();
  char v15 = 0;
  sub_25D15B850();
  if (!v2)
  {
    uint64_t v13 = v11;
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660CF0);
    sub_25D129048(&qword_26A660CF8);
    sub_25D15B880();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v8, v4);
}

unint64_t sub_25D14535C()
{
  unint64_t result = qword_26A661510;
  if (!qword_26A661510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661510);
  }
  return result;
}

uint64_t AppSash.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661518);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14535C();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_25D15B7C0();
  uint64_t v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660CF0);
  sub_25D129048(&qword_26A660D08);
  swift_bridgeObjectRetain();
  sub_25D15B7F0();
  uint64_t v9 = OUTLINED_FUNCTION_1_17();
  v10(v9);
  id v11 = v13;
  *a2 = v6;
  a2[1] = v8;
  a2[2] = (uint64_t)v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_25D14559C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AppSash.init(from:)(a1, a2);
}

uint64_t sub_25D1455B4(void *a1)
{
  return AppSash.encode(to:)(a1);
}

void destroy for AppSash(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s18SiriMessagesCommon7AppSashVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for AppSash(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppSash(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSash(uint64_t a1, int a2)
{
  if (a2)
  {
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
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSash(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSash()
{
  return &type metadata for AppSash;
}

unsigned char *storeEnumTagSinglePayload for AppSash.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25D14586CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSash.CodingKeys()
{
  return &type metadata for AppSash.CodingKeys;
}

unint64_t sub_25D1458A8()
{
  unint64_t result = qword_26A661520;
  if (!qword_26A661520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661520);
  }
  return result;
}

unint64_t sub_25D1458F8()
{
  unint64_t result = qword_26A661528;
  if (!qword_26A661528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661528);
  }
  return result;
}

unint64_t sub_25D145948()
{
  unint64_t result = qword_26A661530;
  if (!qword_26A661530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661530);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return v0;
}

SiriMessagesCommon::ReadingCarPlayButton __swiftcall ReadingCarPlayButton.init(speechDuration:readingInProgressLabelText:)(Swift::Double speechDuration, Swift::String readingInProgressLabelText)
{
  object = readingInProgressLabelText._object;
  uint64_t countAndFlagsBits = readingInProgressLabelText._countAndFlagsBits;
  uint64_t v6 = v2;
  if (qword_26A6606F0 != -1) {
    readingInProgressLabelText._uint64_t countAndFlagsBits = swift_once();
  }
  *(Swift::Double *)uint64_t v6 = speechDuration;
  *(void *)(v6 + 8) = countAndFlagsBits;
  *(void *)(v6 + 16) = object;
  result.readingInProgressLabelText = readingInProgressLabelText;
  result.speechDuration = speechDuration;
  return result;
}

double ReadingCarPlayButton.speechDuration.getter()
{
  return *(double *)v0;
}

void ReadingCarPlayButton.speechDuration.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*ReadingCarPlayButton.speechDuration.modify())()
{
  return nullsub_1;
}

uint64_t ReadingCarPlayButton.readingInProgressLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReadingCarPlayButton.readingInProgressLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*ReadingCarPlayButton.readingInProgressLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D145AD8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7544686365657073 && a2 == 0xEE006E6F69746172;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025D163600)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D145BD8(char a1)
{
  if (a1) {
    return 0xD00000000000001ALL;
  }
  else {
    return 0x7544686365657073;
  }
}

uint64_t sub_25D145C20()
{
  return sub_25D145BD8(*v0);
}

uint64_t sub_25D145C28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D145AD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D145C50(uint64_t a1)
{
  unint64_t v2 = sub_25D145E1C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D145C8C(uint64_t a1)
{
  unint64_t v2 = sub_25D145E1C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ReadingCarPlayButton.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661538);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D145E1C();
  sub_25D15B9D0();
  char v13 = 0;
  sub_25D15B870();
  if (!v2)
  {
    char v12 = 1;
    sub_25D15B850();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_25D145E1C()
{
  unint64_t result = qword_26A661540;
  if (!qword_26A661540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661540);
  }
  return result;
}

uint64_t ReadingCarPlayButton.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661548);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D145E1C();
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (!v2)
  {
    OUTLINED_FUNCTION_2_13();
    sub_25D15B7E0();
    uint64_t v6 = v5;
    OUTLINED_FUNCTION_2_13();
    uint64_t v8 = sub_25D15B7C0();
    uint64_t v10 = v9;
    uint64_t v11 = OUTLINED_FUNCTION_1_18();
    v12(v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D146044@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ReadingCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_25D14605C(void *a1)
{
  return ReadingCarPlayButton.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for ReadingCarPlayButton(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ReadingCarPlayButton()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ReadingCarPlayButton(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ReadingCarPlayButton(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingCarPlayButton(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for ReadingCarPlayButton(uint64_t result, int a2, int a3)
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
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReadingCarPlayButton()
{
  return &type metadata for ReadingCarPlayButton;
}

unsigned char *storeEnumTagSinglePayload for ReadingCarPlayButton.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D146298);
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

ValueMetadata *type metadata accessor for ReadingCarPlayButton.CodingKeys()
{
  return &type metadata for ReadingCarPlayButton.CodingKeys;
}

unint64_t sub_25D1462D4()
{
  unint64_t result = qword_26A661550;
  if (!qword_26A661550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661550);
  }
  return result;
}

unint64_t sub_25D146324()
{
  unint64_t result = qword_26A661558;
  if (!qword_26A661558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661558);
  }
  return result;
}

unint64_t sub_25D146374()
{
  unint64_t result = qword_26A661560;
  if (!qword_26A661560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661560);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return v0 - 105;
}

uint64_t VideoAttachment.init(url:isDraft:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  type metadata accessor for SecurityScopedURL();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v6 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 32))(v7, a1);
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 8) = a2;
  return result;
}

uint64_t VideoAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  sub_25D15B1C0();
  OUTLINED_FUNCTION_2_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v3);
}

uint64_t sub_25D146504@<X0>(uint64_t a1@<X8>)
{
  return VideoAttachment.url.getter(a1);
}

uint64_t sub_25D146540(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_25D15B1C0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  char v8 = *((unsigned char *)a2 + 8);
  uint64_t v10 = *a2;
  char v11 = v8;
  return VideoAttachment.url.setter((uint64_t)v6);
}

uint64_t VideoAttachment.url.setter(uint64_t a1)
{
  uint64_t v4 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  uint64_t v8 = *v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a1, v4);
  sub_25D120E04();
  uint64_t v9 = v8 + OBJC_IVAR____TtC18SiriMessagesCommon17SecurityScopedURL_wrappedValue;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40))(v9, v2, v4);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v4);
}

void (*VideoAttachment.url.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25D120FC4(v2);
  return sub_25D11A398;
}

uint64_t VideoAttachment.isDraft.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t VideoAttachment.isDraft.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t (*VideoAttachment.isDraft.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D1467B4(uint64_t a1)
{
  unint64_t v2 = sub_25D14699C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1467F0(uint64_t a1)
{
  unint64_t v2 = sub_25D14699C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t VideoAttachment.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661568);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14699C();
  sub_25D15B9D0();
  type metadata accessor for SecurityScopedURL();
  sub_25D12718C(&qword_26A660BB0);
  sub_25D15B880();
  if (!v1) {
    sub_25D15B860();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_25D14699C()
{
  unint64_t result = qword_26A661570;
  if (!qword_26A661570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661570);
  }
  return result;
}

uint64_t VideoAttachment.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661578);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14699C();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  type metadata accessor for SecurityScopedURL();
  sub_25D12718C(&qword_26A660BC0);
  sub_25D15B7F0();
  swift_retain();
  char v6 = sub_25D15B7D0();
  uint64_t v7 = OUTLINED_FUNCTION_3_3();
  v8(v7);
  *(void *)a2 = v10;
  *(unsigned char *)(a2 + 8) = v6 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_release();
}

unint64_t sub_25D146BB8(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_25D11F820();
  unint64_t result = sub_25D11F6A4();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_25D146BE8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return VideoAttachment.init(from:)(a1, a2);
}

uint64_t sub_25D146C00(void *a1)
{
  return VideoAttachment.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for VideoAttachment()
{
  return &type metadata for VideoAttachment;
}

unsigned char *storeEnumTagSinglePayload for VideoAttachment.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D146CFCLL);
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

ValueMetadata *type metadata accessor for VideoAttachment.CodingKeys()
{
  return &type metadata for VideoAttachment.CodingKeys;
}

unint64_t sub_25D146D38()
{
  unint64_t result = qword_26A661580;
  if (!qword_26A661580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661580);
  }
  return result;
}

unint64_t sub_25D146D88()
{
  unint64_t result = qword_26A661588;
  if (!qword_26A661588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661588);
  }
  return result;
}

unint64_t sub_25D146DD8()
{
  unint64_t result = qword_26A661590;
  if (!qword_26A661590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661590);
  }
  return result;
}

id SAIntentGroupHandleIntent.init(intent:appIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25D15B220();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_25D15B210();
  uint64_t v10 = sub_25D15B200();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_25D122C0C(v10, v12, v9);

  id v13 = v9;
  if (a3)
  {
    char v14 = (void *)sub_25D15B490();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  objc_msgSend(v9, sel_setAppId_, v14);

  sub_25D1472A8();
  id v15 = a1;
  id v16 = SAIntentGroupProtobufMessage.init(intent:)(v15);
  objc_msgSend(v9, sel_setIntent_, v16);

  return v9;
}

id SAIntentGroupProtobufMessage.init(intent:)(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v3 = sub_25D12DE34(objc_msgSend(a1, sel_backingStore));
  if (v4 >> 60 == 15)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = v3;
    unint64_t v7 = v4;
    uint64_t v5 = (void *)sub_25D15B1D0();
    sub_25D14734C(v6, v7);
  }
  objc_msgSend(v2, sel_setData_, v5);

  id v8 = objc_msgSend(a1, sel_typeName);
  uint64_t v9 = sub_25D15B4A0();
  uint64_t v11 = v10;

  sub_25D1472E8(v9, v11, v2);
  return v2;
}

id SAIntentGroupProtobufMessage.init(response:)(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id result = objc_msgSend(a1, sel_backingStore);
  if (result)
  {
    uint64_t v4 = sub_25D12DE34(result);
    if (v5 >> 60 == 15)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v7 = v4;
      unint64_t v8 = v5;
      uint64_t v6 = (void *)sub_25D15B1D0();
      sub_25D14734C(v7, v8);
    }
    objc_msgSend(v2, sel_setData_, v6);

    sub_25D147360(a1);
    if (v9)
    {
      uint64_t v10 = (void *)sub_25D15B490();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
    }
    objc_msgSend(v2, sel_setTypeName_, v10);

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id SAIntentGroupLaunchAppWithIntent.init(intent:)(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_25D1472A8();
  id v3 = v2;
  id v4 = a1;
  id v5 = SAIntentGroupProtobufMessage.init(intent:)(v4);
  objc_msgSend(v3, sel_setHandledIntent_, v5);

  INIntent.launchBundleIdentifier.getter();
  if (v6)
  {
    uint64_t v7 = (void *)sub_25D15B490();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_msgSend(v3, sel_setAppId_, v7);

  return v3;
}

unint64_t sub_25D1472A8()
{
  unint64_t result = qword_26A661598;
  if (!qword_26A661598)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A661598);
  }
  return result;
}

void sub_25D1472E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25D15B490();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setTypeName_, v4);
}

uint64_t sub_25D14734C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25D1217BC(a1, a2);
  }
  return a1;
}

uint64_t sub_25D147360(void *a1)
{
  id v1 = objc_msgSend(a1, sel__payloadResponseTypeName);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_25D15B4A0();

  return v3;
}

BOOL static TextBalloon.ServiceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TextBalloon.ServiceType.hash(into:)()
{
  return sub_25D15B980();
}

uint64_t sub_25D147404(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6567617373654D69 && a2 == 0xE800000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 7564659 && a2 == 0xE300000000000000;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x726568746FLL && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_25D15B8C0();
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

uint64_t sub_25D14752C(char a1)
{
  return *(void *)&aImessagesms[8 * a1];
}

uint64_t sub_25D14754C()
{
  return sub_25D14752C(*v0);
}

uint64_t sub_25D147554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D147404(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D14757C(uint64_t a1)
{
  unint64_t v2 = sub_25D1479CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1475B8(uint64_t a1)
{
  unint64_t v2 = sub_25D1479CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D1475F4(uint64_t a1)
{
  unint64_t v2 = sub_25D147AB0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D147630(uint64_t a1)
{
  unint64_t v2 = sub_25D147AB0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D14766C(uint64_t a1)
{
  unint64_t v2 = sub_25D147A18();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1476A8(uint64_t a1)
{
  unint64_t v2 = sub_25D147A18();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D1476E4(uint64_t a1)
{
  unint64_t v2 = sub_25D147A64();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D147720(uint64_t a1)
{
  unint64_t v2 = sub_25D147A64();

  return MEMORY[0x270FA00B8](a1, v2);
}

void TextBalloon.ServiceType.encode(to:)()
{
  OUTLINED_FUNCTION_4_9();
  id v1 = v0;
  BOOL v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615A0);
  OUTLINED_FUNCTION_0();
  v23[5] = v5;
  v23[6] = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_0();
  v23[4] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615A8);
  OUTLINED_FUNCTION_0();
  v23[2] = v8;
  v23[3] = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_9_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615B0);
  OUTLINED_FUNCTION_0();
  v23[0] = v10;
  v23[1] = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615B8);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  id v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v17 = *v1;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25D1479CC();
  sub_25D15B9D0();
  if (v17)
  {
    if (v17 == 1) {
      sub_25D147A64();
    }
    else {
      sub_25D147A18();
    }
    OUTLINED_FUNCTION_6_9();
  }
  else
  {
    sub_25D147AB0();
    OUTLINED_FUNCTION_6_9();
  }
  OUTLINED_FUNCTION_2_1();
  v22(v18, v19, v20, v21);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
  OUTLINED_FUNCTION_5_8();
}

unint64_t sub_25D1479CC()
{
  unint64_t result = qword_26A6615C0;
  if (!qword_26A6615C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6615C0);
  }
  return result;
}

unint64_t sub_25D147A18()
{
  unint64_t result = qword_26A6615C8;
  if (!qword_26A6615C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6615C8);
  }
  return result;
}

unint64_t sub_25D147A64()
{
  unint64_t result = qword_26A6615D0;
  if (!qword_26A6615D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6615D0);
  }
  return result;
}

unint64_t sub_25D147AB0()
{
  unint64_t result = qword_26A6615D8;
  if (!qword_26A6615D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6615D8);
  }
  return result;
}

uint64_t TextBalloon.ServiceType.hashValue.getter()
{
  return sub_25D15B990();
}

void TextBalloon.ServiceType.init(from:)()
{
  OUTLINED_FUNCTION_4_9();
  BOOL v3 = v2;
  uint64_t v34 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615E0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7_8();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6615F8);
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_9_2();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25D1479CC();
  sub_25D15B9B0();
  if (v0) {
    goto LABEL_10;
  }
  uint64_t v36 = v3;
  uint64_t v11 = v1;
  uint64_t v12 = sub_25D15B800();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
LABEL_9:
    uint64_t v25 = sub_25D15B720();
    swift_allocError();
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660988);
    *uint64_t v27 = &type metadata for TextBalloon.ServiceType;
    sub_25D15B790();
    sub_25D15B710();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v11, v8);
    BOOL v3 = v36;
LABEL_10:
    uint64_t v28 = (uint64_t)v3;
    goto LABEL_11;
  }
  uint64_t v14 = v1;
  int v15 = *(unsigned __int8 *)(v12 + 32);
  sub_25D120AB0(1, v13, v12, v12 + 32, 0, (2 * v13) | 1);
  uint64_t v17 = v16;
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v17 != v19 >> 1)
  {
    uint64_t v11 = v14;
    goto LABEL_9;
  }
  char v20 = v15;
  if (v15)
  {
    if (v15 == 1)
    {
      sub_25D147A64();
      OUTLINED_FUNCTION_3_9();
      uint64_t v21 = v34;
      OUTLINED_FUNCTION_2_1();
      v22();
      swift_unknownObjectRelease();
      uint64_t v23 = OUTLINED_FUNCTION_1_19();
      v24(v23);
    }
    else
    {
      sub_25D147A18();
      OUTLINED_FUNCTION_3_9();
      uint64_t v21 = v34;
      OUTLINED_FUNCTION_2_1();
      v31();
      swift_unknownObjectRelease();
      uint64_t v32 = OUTLINED_FUNCTION_1_19();
      v33(v32);
      char v20 = v15;
    }
  }
  else
  {
    sub_25D147AB0();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_2_1();
    v29();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_2_1();
    v30();
    uint64_t v21 = v34;
  }
  *uint64_t v21 = v20;
  uint64_t v28 = (uint64_t)v36;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_1(v28);
  OUTLINED_FUNCTION_5_8();
}

void sub_25D147FB8()
{
}

void sub_25D147FD0()
{
}

SiriMessagesCommon::TextBalloon __swiftcall TextBalloon.init(payload:serviceType:)(Swift::String payload, SiriMessagesCommon::TextBalloon::ServiceType serviceType)
{
  char v3 = *(unsigned char *)serviceType;
  *(Swift::String *)uint64_t v2 = payload;
  *(unsigned char *)(v2 + 16) = v3;
  result.payload = payload;
  result.serviceType = serviceType;
  return result;
}

uint64_t TextBalloon.payload.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TextBalloon.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TextBalloon.payload.modify())()
{
  return nullsub_1;
}

void TextBalloon.serviceType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *TextBalloon.serviceType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*TextBalloon.serviceType.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D1480B8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5465636976726573 && a2 == 0xEB00000000657079)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D1481B0(char a1)
{
  if (a1) {
    return 0x5465636976726573;
  }
  else {
    return 0x64616F6C796170;
  }
}

uint64_t sub_25D1481F0()
{
  return sub_25D1481B0(*v0);
}

uint64_t sub_25D1481F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D1480B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D148220(uint64_t a1)
{
  unint64_t v2 = sub_25D1485A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D14825C(uint64_t a1)
{
  unint64_t v2 = sub_25D1485A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void TextBalloon.encode(to:)()
{
  OUTLINED_FUNCTION_4_9();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661600);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25D1485A0();
  sub_25D15B9D0();
  sub_25D15B850();
  if (!v0)
  {
    sub_25D1485EC();
    sub_25D15B880();
  }
  OUTLINED_FUNCTION_2_1();
  v4();
  OUTLINED_FUNCTION_5_8();
}

void TextBalloon.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12)
{
  OUTLINED_FUNCTION_4_9();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661618);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_7_8();
  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  sub_25D1485A0();
  sub_25D15B9B0();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    uint64_t v18 = sub_25D15B7C0();
    uint64_t v20 = v19;
    sub_25D148638();
    swift_bridgeObjectRetain();
    sub_25D15B7F0();
    uint64_t v21 = OUTLINED_FUNCTION_1_7();
    v22(v21);
    *(void *)uint64_t v16 = v18;
    *(void *)(v16 + 8) = v20;
    *(unsigned char *)(v16 + 16) = a12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_5_8();
}

void sub_25D148570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  TextBalloon.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, *(__int16 *)&vars8[4], vars8[6]);
}

void sub_25D148588()
{
}

unint64_t sub_25D1485A0()
{
  unint64_t result = qword_26A661608;
  if (!qword_26A661608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661608);
  }
  return result;
}

unint64_t sub_25D1485EC()
{
  unint64_t result = qword_26A661610;
  if (!qword_26A661610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661610);
  }
  return result;
}

unint64_t sub_25D148638()
{
  unint64_t result = qword_26A661620;
  if (!qword_26A661620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661620);
  }
  return result;
}

unint64_t sub_25D148688()
{
  unint64_t result = qword_26A661628;
  if (!qword_26A661628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661628);
  }
  return result;
}

uint64_t destroy for TextBalloon()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18SiriMessagesCommon11TextBalloonVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TextBalloon(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for TextBalloon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for TextBalloon(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TextBalloon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for TextBalloon()
{
  return &type metadata for TextBalloon;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType()
{
  return &type metadata for TextBalloon.ServiceType;
}

unsigned char *storeEnumTagSinglePayload for TextBalloon.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D148920);
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

ValueMetadata *type metadata accessor for TextBalloon.CodingKeys()
{
  return &type metadata for TextBalloon.CodingKeys;
}

unsigned char *_s18SiriMessagesCommon11TextBalloonV11ServiceTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D148A24);
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

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.CodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.CodingKeys;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.IMessageCodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.IMessageCodingKeys;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.SmsCodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.SmsCodingKeys;
}

ValueMetadata *type metadata accessor for TextBalloon.ServiceType.OtherCodingKeys()
{
  return &type metadata for TextBalloon.ServiceType.OtherCodingKeys;
}

unint64_t sub_25D148A90()
{
  unint64_t result = qword_26A661630;
  if (!qword_26A661630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661630);
  }
  return result;
}

unint64_t sub_25D148AE0()
{
  unint64_t result = qword_26A661638;
  if (!qword_26A661638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661638);
  }
  return result;
}

unint64_t sub_25D148B30()
{
  unint64_t result = qword_26A661640;
  if (!qword_26A661640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661640);
  }
  return result;
}

unint64_t sub_25D148B80()
{
  unint64_t result = qword_26A661648;
  if (!qword_26A661648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661648);
  }
  return result;
}

unint64_t sub_25D148BD0()
{
  unint64_t result = qword_26A661650;
  if (!qword_26A661650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661650);
  }
  return result;
}

unint64_t sub_25D148C20()
{
  unint64_t result = qword_26A661658;
  if (!qword_26A661658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661658);
  }
  return result;
}

unint64_t sub_25D148C70()
{
  unint64_t result = qword_26A661660;
  if (!qword_26A661660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661660);
  }
  return result;
}

unint64_t sub_25D148CC0()
{
  unint64_t result = qword_26A661668;
  if (!qword_26A661668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661668);
  }
  return result;
}

unint64_t sub_25D148D10()
{
  unint64_t result = qword_26A661670;
  if (!qword_26A661670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661670);
  }
  return result;
}

unint64_t sub_25D148D60()
{
  unint64_t result = qword_26A661678;
  if (!qword_26A661678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661678);
  }
  return result;
}

unint64_t sub_25D148DB0()
{
  unint64_t result = qword_26A661680;
  if (!qword_26A661680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661680);
  }
  return result;
}

unint64_t sub_25D148E00()
{
  unint64_t result = qword_26A661688;
  if (!qword_26A661688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661688);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_25D15B780();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return sub_25D15B820();
}

uint64_t AppDisambiguationSnippetModel.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppDisambiguationSnippetModel.appBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

SiriMessagesCommon::AppDisambiguationSnippetModel __swiftcall AppDisambiguationSnippetModel.init(title:appBundleIdentifiers:)(Swift::String title, Swift::OpaquePointer appBundleIdentifiers)
{
  *(Swift::String *)uint64_t v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = appBundleIdentifiers;
  result.title = title;
  result.appBundleIdentifiers = appBundleIdentifiers;
  return result;
}

uint64_t AppDisambiguationSnippetModel.description.getter()
{
  return 0;
}

uint64_t sub_25D148FC0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025D1634E0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D1490A0(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_25D1490D8()
{
  return sub_25D1490A0(*v0);
}

uint64_t sub_25D1490E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D148FC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D149108(uint64_t a1)
{
  unint64_t v2 = sub_25D149318();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D149144(uint64_t a1)
{
  unint64_t v2 = sub_25D149318();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppDisambiguationSnippetModel.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661690);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D149318();
  sub_25D15B9D0();
  char v15 = 0;
  sub_25D15B850();
  if (!v2)
  {
    uint64_t v13 = v11;
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6610A8);
    sub_25D149564(&qword_26A6610B0);
    sub_25D15B880();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v8, v4);
}

unint64_t sub_25D149318()
{
  unint64_t result = qword_26A661698;
  if (!qword_26A661698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661698);
  }
  return result;
}

uint64_t AppDisambiguationSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6616A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D149318();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = sub_25D15B7C0();
  uint64_t v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6610A8);
  sub_25D149564(&qword_26A6610C0);
  swift_bridgeObjectRetain();
  sub_25D15B7F0();
  uint64_t v9 = OUTLINED_FUNCTION_1_7();
  v10(v9);
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D149564(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6610A8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25D1495CC()
{
  unint64_t result = qword_26A6616A8;
  if (!qword_26A6616A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616A8);
  }
  return result;
}

unint64_t sub_25D14961C()
{
  unint64_t result = qword_26A6616B0;
  if (!qword_26A6616B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616B0);
  }
  return result;
}

uint64_t sub_25D14966C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AppDisambiguationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_25D149684(void *a1)
{
  return AppDisambiguationSnippetModel.encode(to:)(a1);
}

uint64_t destroy for AppDisambiguationSnippetModel()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s18SiriMessagesCommon29AppDisambiguationSnippetModelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppDisambiguationSnippetModel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AppDisambiguationSnippetModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AppDisambiguationSnippetModel()
{
  return &type metadata for AppDisambiguationSnippetModel;
}

unsigned char *storeEnumTagSinglePayload for AppDisambiguationSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D1498A8);
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

ValueMetadata *type metadata accessor for AppDisambiguationSnippetModel.CodingKeys()
{
  return &type metadata for AppDisambiguationSnippetModel.CodingKeys;
}

unint64_t sub_25D1498E4()
{
  unint64_t result = qword_26A6616B8;
  if (!qword_26A6616B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616B8);
  }
  return result;
}

unint64_t sub_25D149934()
{
  unint64_t result = qword_26A6616C0;
  if (!qword_26A6616C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616C0);
  }
  return result;
}

unint64_t sub_25D149984()
{
  unint64_t result = qword_26A6616C8;
  if (!qword_26A6616C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616C8);
  }
  return result;
}

SiriMessagesCommon::ReadingCompactCarPlayButton __swiftcall ReadingCompactCarPlayButton.init(speechDuration:)(Swift::Double speechDuration)
{
  uint64_t v3 = v1;
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = qword_26A660EE0;
  uint64_t v4 = qword_26A660EE8;
  *(Swift::Double *)uint64_t v3 = speechDuration;
  *(void *)(v3 + 8) = v5;
  *(void *)(v3 + 16) = v4;
  uint64_t v6 = swift_bridgeObjectRetain();
  result.speechDuration = v8;
  result.readingInProgressLabelText._object = v7;
  result.readingInProgressLabelText._uint64_t countAndFlagsBits = v6;
  return result;
}

double ReadingCompactCarPlayButton.speechDuration.getter()
{
  return *(double *)v0;
}

void ReadingCompactCarPlayButton.speechDuration.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*ReadingCompactCarPlayButton.speechDuration.modify())()
{
  return nullsub_1;
}

uint64_t ReadingCompactCarPlayButton.readingInProgressLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ReadingCompactCarPlayButton.readingInProgressLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*ReadingCompactCarPlayButton.readingInProgressLabelText.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D149B18(uint64_t a1)
{
  unint64_t v2 = sub_25D149CE4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D149B54(uint64_t a1)
{
  unint64_t v2 = sub_25D149CE4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ReadingCompactCarPlayButton.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6616D0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D149CE4();
  sub_25D15B9D0();
  char v13 = 0;
  sub_25D15B870();
  if (!v2)
  {
    char v12 = 1;
    sub_25D15B850();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_25D149CE4()
{
  unint64_t result = qword_26A6616D8;
  if (!qword_26A6616D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616D8);
  }
  return result;
}

uint64_t ReadingCompactCarPlayButton.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6616E0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D149CE4();
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (!v2)
  {
    OUTLINED_FUNCTION_2_13();
    sub_25D15B7E0();
    uint64_t v6 = v5;
    OUTLINED_FUNCTION_2_13();
    uint64_t v8 = sub_25D15B7C0();
    uint64_t v10 = v9;
    uint64_t v11 = OUTLINED_FUNCTION_1_18();
    v12(v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D149F0C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ReadingCompactCarPlayButton.init(from:)(a1, a2);
}

uint64_t sub_25D149F24(void *a1)
{
  return ReadingCompactCarPlayButton.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ReadingCompactCarPlayButton()
{
  return &type metadata for ReadingCompactCarPlayButton;
}

unsigned char *storeEnumTagSinglePayload for ReadingCompactCarPlayButton.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D14A018);
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

ValueMetadata *type metadata accessor for ReadingCompactCarPlayButton.CodingKeys()
{
  return &type metadata for ReadingCompactCarPlayButton.CodingKeys;
}

unint64_t sub_25D14A054()
{
  unint64_t result = qword_26A6616E8;
  if (!qword_26A6616E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616E8);
  }
  return result;
}

unint64_t sub_25D14A0A4()
{
  unint64_t result = qword_26A6616F0;
  if (!qword_26A6616F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616F0);
  }
  return result;
}

unint64_t sub_25D14A0F4()
{
  unint64_t result = qword_26A6616F8;
  if (!qword_26A6616F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6616F8);
  }
  return result;
}

uint64_t static ButtonSnippetModel.Action.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = v9 - v8;
  type metadata accessor for ButtonSnippetModel.Action(0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  char v14 = (uint64_t *)((char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661700);
  MEMORY[0x270FA5388](v17 - 8);
  OUTLINED_FUNCTION_12_0();
  uint64_t v19 = (void *)(v2 + *(int *)(v18 + 56));
  sub_25D14BAB4(a1, v2, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
  sub_25D14BAB4(a2, (uint64_t)v19, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v24 = v30;
    sub_25D14BAB4(v2, (uint64_t)v16, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(uint64_t, void *, uint64_t))(v24 + 32))(v10, v19, v5);
      char v26 = MEMORY[0x2611A49A0](v16, v10);
      uint64_t v27 = *(void (**)(void))(v24 + 8);
      OUTLINED_FUNCTION_12_1();
      v27();
      OUTLINED_FUNCTION_12_1();
      v27();
      sub_25D14BB14(v2, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
      return v26 & 1;
    }
    OUTLINED_FUNCTION_12_1();
    v25();
    goto LABEL_12;
  }
  sub_25D14BAB4(v2, (uint64_t)v14, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
  uint64_t v21 = *v14;
  uint64_t v20 = v14[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_25D14A474(v2);
    goto LABEL_13;
  }
  if (v21 == *v19 && v20 == v19[1])
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v23 = sub_25D15B8C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23)
  {
LABEL_16:
    sub_25D14BB14(v2, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
    char v26 = 1;
    return v26 & 1;
  }
  sub_25D14BB14(v2, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
LABEL_13:
  char v26 = 0;
  return v26 & 1;
}

uint64_t type metadata accessor for ButtonSnippetModel.Action(uint64_t a1)
{
  return sub_25D13FC88(a1, (uint64_t *)&unk_26A661798);
}

uint64_t sub_25D14A474(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661700);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D14A4D4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6B6E694C6E65706FLL && a2 == 0xE800000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x704168636E75616CLL && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D14A5C4(char a1)
{
  if (a1) {
    return 0x704168636E75616CLL;
  }
  else {
    return 0x6B6E694C6E65706FLL;
  }
}

uint64_t sub_25D14A600()
{
  return sub_25D14A5C4(*v0);
}

uint64_t sub_25D14A608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D14A4D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D14A630(uint64_t a1)
{
  unint64_t v2 = sub_25D14AB30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D14A66C(uint64_t a1)
{
  unint64_t v2 = sub_25D14AB30();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D14A6A8(uint64_t a1)
{
  unint64_t v2 = sub_25D14AB7C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D14A6E4(uint64_t a1)
{
  unint64_t v2 = sub_25D14AB7C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D14A720(uint64_t a1)
{
  unint64_t v2 = sub_25D14ABC8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D14A75C(uint64_t a1)
{
  unint64_t v2 = sub_25D14ABC8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ButtonSnippetModel.Action.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661708);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661710);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_0();
  sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v7;
  uint64_t v20 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_12_0();
  type metadata accessor for ButtonSnippetModel.Action(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_13();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661718);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14AB30();
  sub_25D15B9D0();
  sub_25D14BAB4(v21, v2, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25D14AB7C();
    sub_25D15B820();
    sub_25D15B850();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_1();
    v15();
    OUTLINED_FUNCTION_10_3();
    return v16();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v1, v2, v20);
    sub_25D14ABC8();
    sub_25D15B820();
    sub_25D14BA00(&qword_26A660B30, MEMORY[0x263F06EA8]);
    sub_25D15B880();
    OUTLINED_FUNCTION_2_1();
    v18();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v1, v20);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v14, v22);
  }
}

unint64_t sub_25D14AB30()
{
  unint64_t result = qword_26A661720;
  if (!qword_26A661720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661720);
  }
  return result;
}

unint64_t sub_25D14AB7C()
{
  unint64_t result = qword_26A661728;
  if (!qword_26A661728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661728);
  }
  return result;
}

unint64_t sub_25D14ABC8()
{
  unint64_t result = qword_26A661730;
  if (!qword_26A661730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661730);
  }
  return result;
}

uint64_t ButtonSnippetModel.Action.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661738);
  OUTLINED_FUNCTION_0();
  uint64_t v55 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_0();
  uint64_t v56 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661740);
  OUTLINED_FUNCTION_0();
  uint64_t v53 = v7;
  uint64_t v54 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5_0();
  uint64_t v58 = v8;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661748);
  OUTLINED_FUNCTION_0();
  uint64_t v57 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_13();
  uint64_t v11 = type metadata accessor for ButtonSnippetModel.Action(0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v47 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v47 - v19;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14AB30();
  uint64_t v21 = v60;
  sub_25D15B9B0();
  if (v21) {
    goto LABEL_8;
  }
  uint64_t v47 = v15;
  uint64_t v48 = v20;
  uint64_t v49 = v18;
  uint64_t v50 = v11;
  uint64_t v60 = a1;
  uint64_t v22 = sub_25D15B800();
  uint64_t v23 = *(void *)(v22 + 16);
  if (!v23
    || (char v24 = *(unsigned char *)(v22 + 32),
        sub_25D120AB0(1, v23, v22, v22 + 32, 0, (2 * v23) | 1),
        uint64_t v26 = v25,
        unint64_t v28 = v27,
        swift_bridgeObjectRelease(),
        v26 != v28 >> 1))
  {
    uint64_t v29 = v50;
    uint64_t v30 = sub_25D15B720();
    swift_allocError();
    uint64_t v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660988);
    *uint64_t v32 = v29;
    sub_25D15B790();
    sub_25D15B710();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_10_3();
    v33();
    a1 = v60;
LABEL_8:
    uint64_t v34 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v34);
  }
  if (v24)
  {
    char v62 = 1;
    sub_25D14AB7C();
    OUTLINED_FUNCTION_13_2();
    uint64_t v36 = sub_25D15B7C0();
    uint64_t v38 = v37;
    OUTLINED_FUNCTION_2_1();
    v39();
    swift_unknownObjectRelease();
    uint64_t v40 = OUTLINED_FUNCTION_9_3();
    v41(v40);
    uint64_t v42 = (uint64_t)v47;
    *uint64_t v47 = v36;
    *(void *)(v42 + 8) = v38;
  }
  else
  {
    char v61 = 0;
    sub_25D14ABC8();
    OUTLINED_FUNCTION_13_2();
    sub_25D15B1C0();
    sub_25D14BA00(&qword_26A660B40, MEMORY[0x263F06EA8]);
    uint64_t v42 = (uint64_t)v49;
    sub_25D15B7F0();
    OUTLINED_FUNCTION_2_1();
    v43();
    swift_unknownObjectRelease();
    uint64_t v44 = OUTLINED_FUNCTION_11_2();
    v45(v44);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v46 = (uint64_t)v48;
  sub_25D14B99C(v42, (uint64_t)v48);
  sub_25D14B99C(v46, v51);
  uint64_t v34 = (uint64_t)v60;
  return __swift_destroy_boxed_opaque_existential_1(v34);
}

uint64_t sub_25D14B190@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ButtonSnippetModel.Action.init(from:)(a1, a2);
}

uint64_t sub_25D14B1A8(void *a1)
{
  return ButtonSnippetModel.Action.encode(to:)(a1);
}

uint64_t ButtonSnippetModel.action.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25D14BAB4(v1, a1, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
}

uint64_t ButtonSnippetModel.label.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ButtonSnippetModel(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ButtonSnippetModel.init(action:label:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_25D14B99C(a1, a4);
  uint64_t result = type metadata accessor for ButtonSnippetModel(0);
  uint64_t v8 = (void *)(a4 + *(int *)(result + 20));
  *uint64_t v8 = a2;
  v8[1] = a3;
  return result;
}

unint64_t ButtonSnippetModel.description.getter()
{
  type metadata accessor for ButtonSnippetModel.Action(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4();
  sub_25D15B6E0();
  swift_bridgeObjectRelease();
  sub_25D14BAB4(v0, v1, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
  sub_25D15B4C0();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  return 0xD00000000000001BLL;
}

uint64_t sub_25D14B36C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25D14B444(char a1)
{
  if (a1) {
    return 0x6C6562616CLL;
  }
  else {
    return 0x6E6F69746361;
  }
}

uint64_t sub_25D14B474()
{
  return sub_25D124F34();
}

uint64_t sub_25D14B490()
{
  return sub_25D14B444(*v0);
}

uint64_t sub_25D14B498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D14B36C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D14B4C0(uint64_t a1)
{
  unint64_t v2 = sub_25D14BA68();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D14B4FC(uint64_t a1)
{
  unint64_t v2 = sub_25D14BA68();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ButtonSnippetModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661750);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14BA68();
  sub_25D15B9D0();
  type metadata accessor for ButtonSnippetModel.Action(0);
  sub_25D14BA00(&qword_26A661760, (void (*)(uint64_t))type metadata accessor for ButtonSnippetModel.Action);
  sub_25D15B880();
  if (!v1)
  {
    type metadata accessor for ButtonSnippetModel(0);
    sub_25D15B850();
  }
  OUTLINED_FUNCTION_10_3();
  return v4();
}

uint64_t ButtonSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for ButtonSnippetModel.Action(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5_0();
  uint64_t v17 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661768);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = type metadata accessor for ButtonSnippetModel(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_13();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D14BA68();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_25D14BA00(&qword_26A661770, (void (*)(uint64_t))type metadata accessor for ButtonSnippetModel.Action);
  sub_25D15B7F0();
  sub_25D14B99C(v17, v3);
  uint64_t v10 = sub_25D15B7C0();
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_10_3();
  v13();
  uint64_t v14 = (uint64_t *)(v3 + *(int *)(v8 + 20));
  *uint64_t v14 = v10;
  v14[1] = v12;
  sub_25D14BAB4(v3, a2, (void (*)(void))type metadata accessor for ButtonSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_25D14BB14(v3, (void (*)(void))type metadata accessor for ButtonSnippetModel);
}

uint64_t sub_25D14B96C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ButtonSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_25D14B984(void *a1)
{
  return ButtonSnippetModel.encode(to:)(a1);
}

uint64_t sub_25D14B99C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ButtonSnippetModel.Action(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D14BA00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ButtonSnippetModel(uint64_t a1)
{
  return sub_25D13FC88(a1, (uint64_t *)&unk_26A661788);
}

unint64_t sub_25D14BA68()
{
  unint64_t result = qword_26A661758;
  if (!qword_26A661758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661758);
  }
  return result;
}

uint64_t sub_25D14BAB4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25D14BB14(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1();
  v3();
  return a1;
}

uint64_t sub_25D14BB68()
{
  return sub_25D14BA00(&qword_26A661778, (void (*)(uint64_t))type metadata accessor for ButtonSnippetModel);
}

uint64_t sub_25D14BBB0()
{
  return sub_25D14BA00(&qword_26A661780, (void (*)(uint64_t))type metadata accessor for ButtonSnippetModel);
}

uint64_t *initializeBufferWithCopyOfBuffer for ButtonSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    type metadata accessor for ButtonSnippetModel.Action(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v9 = sub_25D15B1C0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ButtonSnippetModel(uint64_t a1)
{
  type metadata accessor for ButtonSnippetModel.Action(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = sub_25D15B1C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ButtonSnippetModel(void *a1, void *a2, uint64_t a3)
{
  type metadata accessor for ButtonSnippetModel.Action(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v7 = sub_25D15B1C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)((char *)a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ButtonSnippetModel(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25D14BB14((uint64_t)a1, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
    type metadata accessor for ButtonSnippetModel.Action(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v6 = sub_25D15B1C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for ButtonSnippetModel(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ButtonSnippetModel.Action(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_25D15B1C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for ButtonSnippetModel(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25D14BB14((uint64_t)a1, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
    uint64_t v6 = type metadata accessor for ButtonSnippetModel.Action(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_25D15B1C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D14C184);
}

uint64_t sub_25D14C184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ButtonSnippetModel.Action(0);
  OUTLINED_FUNCTION_1_1();
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

uint64_t storeEnumTagSinglePayload for ButtonSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D14C228);
}

void sub_25D14C228(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for ButtonSnippetModel.Action(0);
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

uint64_t sub_25D14C2B4()
{
  uint64_t result = type metadata accessor for ButtonSnippetModel.Action(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ButtonSnippetModel.Action(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v8 = sub_25D15B1C0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ButtonSnippetModel.Action(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = sub_25D15B1C0();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
}

void *initializeWithCopy for ButtonSnippetModel.Action(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = sub_25D15B1C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for ButtonSnippetModel.Action(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25D14BB14((uint64_t)a1, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v4 = sub_25D15B1C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for ButtonSnippetModel.Action(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_25D15B1C0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for ButtonSnippetModel.Action(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25D14BB14((uint64_t)a1, (void (*)(void))type metadata accessor for ButtonSnippetModel.Action);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_25D15B1C0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25D14C7F0()
{
  uint64_t result = sub_25D15B1C0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonSnippetModel.CodingKeys()
{
  return &type metadata for ButtonSnippetModel.CodingKeys;
}

unsigned char *_s18SiriMessagesCommon18ButtonSnippetModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D14C964);
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

ValueMetadata *type metadata accessor for ButtonSnippetModel.Action.CodingKeys()
{
  return &type metadata for ButtonSnippetModel.Action.CodingKeys;
}

ValueMetadata *type metadata accessor for ButtonSnippetModel.Action.OpenLinkCodingKeys()
{
  return &type metadata for ButtonSnippetModel.Action.OpenLinkCodingKeys;
}

unsigned char *_s18SiriMessagesCommon18ButtonSnippetModelV6ActionO18OpenLinkCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25D14CA4CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonSnippetModel.Action.LaunchAppCodingKeys()
{
  return &type metadata for ButtonSnippetModel.Action.LaunchAppCodingKeys;
}

unint64_t sub_25D14CA88()
{
  unint64_t result = qword_26A6617A8;
  if (!qword_26A6617A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617A8);
  }
  return result;
}

unint64_t sub_25D14CAD8()
{
  unint64_t result = qword_26A6617B0;
  if (!qword_26A6617B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617B0);
  }
  return result;
}

unint64_t sub_25D14CB28()
{
  unint64_t result = qword_26A6617B8;
  if (!qword_26A6617B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617B8);
  }
  return result;
}

unint64_t sub_25D14CB78()
{
  unint64_t result = qword_26A6617C0;
  if (!qword_26A6617C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617C0);
  }
  return result;
}

unint64_t sub_25D14CBC8()
{
  unint64_t result = qword_26A6617C8;
  if (!qword_26A6617C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617C8);
  }
  return result;
}

unint64_t sub_25D14CC18()
{
  unint64_t result = qword_26A6617D0;
  if (!qword_26A6617D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617D0);
  }
  return result;
}

unint64_t sub_25D14CC68()
{
  unint64_t result = qword_26A6617D8;
  if (!qword_26A6617D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617D8);
  }
  return result;
}

unint64_t sub_25D14CCB8()
{
  unint64_t result = qword_26A6617E0;
  if (!qword_26A6617E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617E0);
  }
  return result;
}

unint64_t sub_25D14CD08()
{
  unint64_t result = qword_26A6617E8;
  if (!qword_26A6617E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617E8);
  }
  return result;
}

unint64_t sub_25D14CD58()
{
  unint64_t result = qword_26A6617F0;
  if (!qword_26A6617F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617F0);
  }
  return result;
}

unint64_t sub_25D14CDA8()
{
  unint64_t result = qword_26A6617F8;
  if (!qword_26A6617F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6617F8);
  }
  return result;
}

unint64_t sub_25D14CDF8()
{
  unint64_t result = qword_26A661800;
  if (!qword_26A661800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661800);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_25D15B780();
}

id UpdateMessageDraftSnippet.intent.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

id sub_25D14CEEC@<X0>(void *a1@<X8>)
{
  id result = UpdateMessageDraftSnippet.intent.getter();
  *a1 = result;
  return result;
}

void sub_25D14CF58(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  UpdateMessageDraftSnippet.intent.setter(v1);
}

void UpdateMessageDraftSnippet.intent.setter(void *a1)
{
  id *v1 = a1;
}

void (*UpdateMessageDraftSnippet.intent.modify(void **a1))(uint64_t a1, char a2)
{
  id v2 = *v1;
  *a1 = *v1;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D11A820;
}

uint64_t UpdateMessageDraftSnippet.contactName.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UpdateMessageDraftSnippet.contactName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.contactName.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UpdateMessageDraftSnippet.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.payload.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.autoSendInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  uint64_t v4 = v1[7];
  uint64_t v5 = v1[8];
  uint64_t v6 = v1[9];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  return sub_25D134CCC(v2, v3, v4);
}

__n128 UpdateMessageDraftSnippet.autoSendInfo.setter(long long *a1)
{
  __n128 v4 = (__n128)a1[1];
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  sub_25D134D78(v1[5], v1[6], v1[7]);
  *(_OWORD *)(v1 + 5) = v5;
  __n128 result = v4;
  *(__n128 *)(v1 + 7) = v4;
  v1[9] = v2;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.autoSendInfo.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.correctionInfo.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 88);
  *(void *)a1 = *(void *)(v1 + 80);
  *(unsigned char *)(a1 + 8) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t UpdateMessageDraftSnippet.correctionInfo.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(unsigned char *)(v1 + 88) = v3;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.correctionInfo.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.shouldUpdateWithASRText.getter()
{
  return *(unsigned __int8 *)(v0 + 89);
}

uint64_t UpdateMessageDraftSnippet.shouldUpdateWithASRText.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 89) = result;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.shouldUpdateWithASRText.modify())()
{
  return nullsub_1;
}

uint64_t UpdateMessageDraftSnippet.errorMessage.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UpdateMessageDraftSnippet.errorMessage.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return result;
}

uint64_t (*UpdateMessageDraftSnippet.errorMessage.modify())()
{
  return nullsub_1;
}

__n128 UpdateMessageDraftSnippet.init(intent:contactName:payload:autoSendInfo:correctionInfo:shouldUpdateWithASRText:errorMessage:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  __n128 result = *(__n128 *)a6;
  long long v12 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 40) = *(_OWORD *)a6;
  uint64_t v13 = *(void *)(a6 + 32);
  uint64_t v14 = *a7;
  char v15 = *((unsigned char *)a7 + 8);
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(_OWORD *)(a9 + 56) = v12;
  *(void *)(a9 + 72) = v13;
  *(void *)(a9 + 80) = v14;
  *(unsigned char *)(a9 + 88) = v15;
  *(unsigned char *)(a9 + 89) = a8;
  *(void *)(a9 + 96) = a10;
  *(void *)(a9 + 104) = a11;
  return result;
}

uint64_t UpdateMessageDraftSnippet.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 80);
  sub_25D15B6E0();
  sub_25D15B4F0();
  swift_bridgeObjectRetain();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  sub_25D15B6E0();
  swift_bridgeObjectRelease();
  if (v1 != 1) {
    AutoSendInfo.description.getter();
  }
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  if (v2) {
    CorrectionInfo.description.getter();
  }
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  swift_bridgeObjectRetain();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25D15B6E0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  swift_bridgeObjectRetain();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  sub_25D15B4F0();
  swift_bridgeObjectRetain();
  sub_25D15B4F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_25D14D6BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x646E65536F747561 && a2 == 0xEC0000006F666E49;
        if (v8 || (sub_25D15B8C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6974636572726F63 && a2 == 0xEE006F666E496E6FLL;
          if (v9 || (sub_25D15B8C0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000017 && a2 == 0x800000025D1634A0 || (sub_25D15B8C0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x73654D726F727265 && a2 == 0xEC00000065676173)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            char v11 = sub_25D15B8C0();
            swift_bridgeObjectRelease();
            if (v11) {
              return 6;
            }
            else {
              return 7;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25D14D9A0()
{
  return 7;
}

unint64_t sub_25D14D9A8(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E746361746E6F63;
      break;
    case 2:
      unint64_t result = 0x64616F6C796170;
      break;
    case 3:
      unint64_t result = 0x646E65536F747561;
      break;
    case 4:
      unint64_t result = 0x6974636572726F63;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x73654D726F727265;
      break;
    default:
      unint64_t result = 0x746E65746E69;
      break;
  }
  return result;
}

unint64_t sub_25D14DAB4()
{
  return sub_25D14D9A8(*v0);
}

uint64_t sub_25D14DABC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D14D6BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D14DAE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D14D9A0();
  *a1 = result;
  return result;
}

uint64_t sub_25D14DB0C(uint64_t a1)
{
  unint64_t v2 = sub_25D14DE30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D14DB48(uint64_t a1)
{
  unint64_t v2 = sub_25D14DE30();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UpdateMessageDraftSnippet.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661808);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  BOOL v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v9 = v1[1];
  uint64_t v31 = v1[2];
  uint64_t v32 = v9;
  uint64_t v11 = v1[3];
  uint64_t v29 = v1[4];
  uint64_t v30 = v11;
  uint64_t v12 = v1[5];
  uint64_t v13 = v1[7];
  uint64_t v24 = v1[6];
  uint64_t v25 = v13;
  uint64_t v27 = v1[8];
  uint64_t v28 = v12;
  uint64_t v26 = v1[9];
  uint64_t v23 = v1[10];
  int v38 = *((unsigned __int8 *)v1 + 88);
  int v22 = *((unsigned __int8 *)v1 + 89);
  uint64_t v14 = v1[13];
  v21[1] = v1[12];
  uint64_t v15 = a1[3];
  uint64_t v16 = a1;
  uint64_t v18 = v17;
  __swift_project_boxed_opaque_existential_1(v16, v15);
  sub_25D14DE30();
  sub_25D15B9D0();
  uint64_t v33 = v10;
  char v39 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660800);
  sub_25D14E3AC(&qword_26A660808);
  sub_25D15B880();
  if (!v2)
  {
    uint64_t v19 = v28;
    v21[0] = v14;
    LOBYTE(v33) = 1;
    OUTLINED_FUNCTION_4_12();
    LOBYTE(v33) = 2;
    OUTLINED_FUNCTION_4_12();
    uint64_t v33 = v19;
    uint64_t v34 = v24;
    uint64_t v35 = v25;
    uint64_t v36 = v27;
    uint64_t v37 = v26;
    char v39 = 3;
    sub_25D135FFC();
    OUTLINED_FUNCTION_7_9();
    uint64_t v33 = v23;
    LOBYTE(v34) = v38;
    char v39 = 4;
    sub_25D136048();
    OUTLINED_FUNCTION_7_9();
    LOBYTE(v33) = 5;
    sub_25D15B860();
    LOBYTE(v33) = 6;
    OUTLINED_FUNCTION_4_12();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v18);
}

unint64_t sub_25D14DE30()
{
  unint64_t result = qword_26A661810;
  if (!qword_26A661810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661810);
  }
  return result;
}

uint64_t UpdateMessageDraftSnippet.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661818);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1[3];
  uint64_t v57 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_25D14DE30();
  sub_25D15B9B0();
  if (v2)
  {
    uint64_t v58 = v2;
    OUTLINED_FUNCTION_2_14();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_10();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660800);
    char v65 = 0;
    sub_25D14E3AC(&qword_26A660850);
    sub_25D15B7F0();
    uint64_t v13 = v59;
    LOBYTE(v59) = 1;
    uint64_t v56 = v13;
    id v14 = v13;
    uint64_t v15 = sub_25D15B7A0();
    uint64_t v17 = v16;
    LOBYTE(v59) = 2;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25D15B7A0();
    uint64_t v20 = v19;
    uint64_t v53 = v18;
    uint64_t v55 = v17;
    char v65 = 3;
    sub_25D136814();
    uint64_t v54 = v20;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_8_7();
    sub_25D15B7B0();
    uint64_t v49 = v15;
    uint64_t v50 = a2;
    uint64_t v21 = v60;
    uint64_t v22 = v61;
    uint64_t v23 = v62;
    char v65 = 4;
    uint64_t v51 = v63;
    uint64_t v52 = (uint64_t)v59;
    sub_25D134CCC((uint64_t)v59, v60, v61);
    sub_25D136860();
    OUTLINED_FUNCTION_8_7();
    sub_25D15B7B0();
    uint64_t v47 = v22;
    id v48 = v14;
    uint64_t v24 = v52;
    uint64_t v25 = (uint64_t)v59;
    uint64_t v26 = v60;
    LOBYTE(v59) = 5;
    swift_bridgeObjectRetain();
    int v46 = sub_25D15B7D0();
    int v64 = v26;
    LOBYTE(v59) = 6;
    uint64_t v27 = sub_25D15B7A0();
    uint64_t v58 = 0;
    uint64_t v29 = v28;
    v46 &= 1u;
    uint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v45 = v27;
    v30(v10, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v31 = v48;
    id v48 = v29;
    id v32 = v31;
    id v44 = v31;
    uint64_t v33 = v55;
    swift_bridgeObjectRetain();
    uint64_t v34 = v54;
    swift_bridgeObjectRetain();
    uint64_t v35 = OUTLINED_FUNCTION_3_10();
    uint64_t v36 = v51;
    sub_25D134CCC(v35, v37, v38);
    OUTLINED_FUNCTION_5_10();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v39 = v50;
    uint64_t v40 = v49;
    *uint64_t v50 = v56;
    v39[1] = v40;
    uint64_t v41 = v53;
    v39[2] = v33;
    v39[3] = v41;
    v39[4] = v34;
    v39[5] = v26;
    v39[6] = v21;
    v39[7] = v24;
    v39[8] = v23;
    v39[9] = v36;
    v39[10] = v25;
    *((unsigned char *)v39 + 88) = v64;
    *((unsigned char *)v39 + 89) = v46;
    id v42 = v48;
    v39[12] = v45;
    v39[13] = v42;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_5_10();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25D14E3AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A660800);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25D14E3F4()
{
  return sub_25D15B2D0();
}

uint64_t sub_25D14E460()
{
  return sub_25D15B2C0();
}

uint64_t sub_25D14E4B4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return UpdateMessageDraftSnippet.init(from:)(a1, a2);
}

uint64_t sub_25D14E4CC(void *a1)
{
  return UpdateMessageDraftSnippet.encode(to:)(a1);
}

uint64_t destroy for UpdateMessageDraftSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UpdateMessageDraftSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 56);
  id v8 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 == 1)
  {
    long long v9 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v9;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    uint64_t v10 = *(void *)(a2 + 64);
    uint64_t v11 = *(void *)(a2 + 72);
    *(void *)(a1 + 56) = v7;
    *(void *)(a1 + 64) = v10;
    *(void *)(a1 + 72) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  uint64_t v12 = *(void *)(a2 + 96);
  uint64_t v13 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UpdateMessageDraftSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = (long long *)(a1 + 40);
  id v8 = (long long *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) == 1)
  {
    if (v9 == 1)
    {
      long long v10 = *v8;
      long long v11 = *(_OWORD *)(a2 + 56);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *uint64_t v7 = v10;
      *(_OWORD *)(a1 + 56) = v11;
    }
    else
    {
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_25D1380E0(a1 + 40);
    uint64_t v12 = *(void *)(a2 + 72);
    long long v13 = *(_OWORD *)(a2 + 56);
    *uint64_t v7 = *v8;
    *(_OWORD *)(a1 + 56) = v13;
    *(void *)(a1 + 72) = v12;
  }
  else
  {
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for UpdateMessageDraftSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56) != 1)
  {
    uint64_t v7 = *(void *)(a2 + 56);
    if (v7 != 1)
    {
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = v7;
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(a2 + 72);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = v9;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_25D1380E0(a1 + 40);
  }
  long long v8 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v8;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
LABEL_6:
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateMessageDraftSnippet(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 112))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for UpdateMessageDraftSnippet(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 112) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 112) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateMessageDraftSnippet()
{
  return &type metadata for UpdateMessageDraftSnippet;
}

uint64_t getEnumTagSinglePayload for UpdateMessageDraftSnippet.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for UpdateMessageDraftSnippet.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x25D14EAF8);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateMessageDraftSnippet.CodingKeys()
{
  return &type metadata for UpdateMessageDraftSnippet.CodingKeys;
}

unint64_t sub_25D14EB34()
{
  unint64_t result = qword_26A661820;
  if (!qword_26A661820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661820);
  }
  return result;
}

unint64_t sub_25D14EB84()
{
  unint64_t result = qword_26A661828;
  if (!qword_26A661828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661828);
  }
  return result;
}

unint64_t sub_25D14EBD4()
{
  unint64_t result = qword_26A661830;
  if (!qword_26A661830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661830);
  }
  return result;
}

unint64_t sub_25D14EC20()
{
  unint64_t result = qword_26A661838;
  if (!qword_26A661838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661838);
  }
  return result;
}

unint64_t sub_25D14EC6C()
{
  unint64_t result = qword_26A661840;
  if (!qword_26A661840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661840);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_12()
{
  return sub_25D15B830();
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return sub_25D134D78(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return sub_25D134D78(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return sub_25D15B840();
}

uint64_t sub_25D14EDA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_25D15B1C0();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

void static MessageAttachmentUtils.makeAttachmentModel(for:isDraft:location:)(unint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  int v145 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661848);
  MEMORY[0x270FA5388](v7 - 8);
  v138 = (char *)&v133 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25D15B400();
  OUTLINED_FUNCTION_0();
  uint64_t v139 = v9;
  uint64_t v140 = v10;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7_10();
  uint64_t v136 = v11;
  OUTLINED_FUNCTION_9_4();
  MEMORY[0x270FA5388](v12);
  v137 = (char *)&v133 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A50);
  MEMORY[0x270FA5388](v14 - 8);
  OUTLINED_FUNCTION_7_10();
  uint64_t v142 = v15;
  OUTLINED_FUNCTION_9_4();
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v133 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v133 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v133 - v23;
  uint64_t v25 = sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v147 = v26;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_7_10();
  uint64_t v141 = v28;
  OUTLINED_FUNCTION_9_4();
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  id v32 = (char *)&v133 - v31;
  MEMORY[0x270FA5388](v30);
  v148 = (char *)&v133 - v33;
  OUTLINED_FUNCTION_9_4();
  MEMORY[0x270FA5388](v34);
  v146 = (char *)&v133 - v35;
  OUTLINED_FUNCTION_9_4();
  MEMORY[0x270FA5388](v36);
  v144 = (char *)&v133 - v37;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_25D15B750();
  }
  else
  {
    uint64_t v38 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v149 = v25;
  id v150 = (id)v38;
  if (v38)
  {
    v143 = a4;
    a4 = a3;
    v134 = v24;
    v135 = v32;
    unint64_t v39 = a1 & 0xC000000000000001;
    uint64_t v40 = 4;
    uint64_t v41 = (void (*)(void))&_swift_FORCE_LOAD___swiftUniformTypeIdentifiers___SiriMessagesCommon;
    uint64_t v42 = a1;
    do
    {
      uint64_t v43 = (char *)(v40 - 4);
      if (v39) {
        id v44 = (id)MEMORY[0x2611A4F30](v40 - 4, a1);
      }
      else {
        id v44 = *(id *)(a1 + 8 * v40);
      }
      uint64_t v45 = v44;
      id v46 = (id)(v40 - 3);
      if (__OFADD__(v43, 1))
      {
        __break(1u);
        goto LABEL_78;
      }
      unsigned __int8 v47 = objc_msgSend(v44, sel_currentLocation);

      if (v47)
      {
        swift_bridgeObjectRelease();
        if (qword_26A6606E8 != -1) {
          swift_once();
        }
        uint64_t v63 = sub_25D15B440();
        int v64 = (void *)OUTLINED_FUNCTION_10_4(v63, (uint64_t)qword_26A66E658);
        os_log_type_t v65 = sub_25D15B5E0();
        if (OUTLINED_FUNCTION_4_4(v65))
        {
          uint64_t v66 = (_WORD *)OUTLINED_FUNCTION_7_3();
          OUTLINED_FUNCTION_6_3(v66);
          OUTLINED_FUNCTION_2_4(&dword_25D115000, v67, v68, "#MessageAttachmentUtils creating view model for current location");
          OUTLINED_FUNCTION_3_11();
        }

        uint64_t v69 = type metadata accessor for MapAttachment();
        uint64_t v70 = v143;
        v143[3] = v69;
        v70[4] = sub_25D150328(&qword_26A6608D8, (void (*)(uint64_t))type metadata accessor for MapAttachment);
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v70);
        static MessageAttachmentUtils.makeMapsURL(location:)(a4, (uint64_t)boxed_opaque_existential_1);
        goto LABEL_57;
      }
      ++v40;
      uint64_t v48 = (uint64_t)v150;
      BOOL v49 = v46 == v150;
      uint64_t v25 = v149;
      a1 = v42;
    }
    while (!v49);
    swift_bridgeObjectRelease();
    if (v48 < 1)
    {
      __break(1u);
      goto LABEL_86;
    }
    uint64_t v50 = (void (**)(char *, char *, uint64_t))(v147 + 32);
    swift_bridgeObjectRetain();
    uint64_t v51 = 0;
    uint64_t v52 = MEMORY[0x263F8EE78];
    do
    {
      if (v39) {
        id v53 = (id)MEMORY[0x2611A4F30](v51, a1);
      }
      else {
        id v53 = *(id *)(a1 + 8 * (void)v51 + 32);
      }
      uint64_t v54 = v53;
      id v55 = objc_msgSend(v53, sel_sharedLink);
      if (v55)
      {
        uint64_t v56 = v55;
        sub_25D15B190();

        uint64_t v57 = 0;
      }
      else
      {
        uint64_t v57 = 1;
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v19, v57, 1, v25);
      sub_25D14FBD4((uint64_t)v19, (uint64_t)v22);

      if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v25) == 1)
      {
        sub_25D144AF8((uint64_t)v22, &qword_26A660A50);
      }
      else
      {
        uint64_t v58 = *v50;
        uint64_t v59 = v146;
        (*v50)(v146, v22, v25);
        v58(v148, v59, v25);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v52 = sub_25D14FE08(0, *(void *)(v52 + 16) + 1, 1, v52);
        }
        unint64_t v61 = *(void *)(v52 + 16);
        unint64_t v60 = *(void *)(v52 + 24);
        if (v61 >= v60 >> 1) {
          uint64_t v52 = sub_25D14FE08(v60 > 1, v61 + 1, 1, v52);
        }
        *(void *)(v52 + 16) = v61 + 1;
        unint64_t v62 = v52
            + ((*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80))
            + *(void *)(v147 + 72) * v61;
        uint64_t v25 = v149;
        v58((char *)v62, v148, v149);
      }
      a1 = v42;
      uint64_t v51 = (char *)v51 + 1;
    }
    while (v150 != v51);
    swift_bridgeObjectRelease();
    a4 = v143;
    uint64_t v24 = v134;
    id v32 = v135;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v52 = MEMORY[0x263F8EE78];
  }
  sub_25D14EDA8(v52, (uint64_t)v24);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25) != 1)
  {
    uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v147 + 32);
    uint64_t v80 = v144;
    v79(v144, v24, v25);
    uint64_t v81 = self;
    uint64_t v82 = (void *)sub_25D15B150();
    LODWORD(v81) = objc_msgSend(v81, sel_isValidMapURL_, v82);

    if (v81)
    {
      if (qword_26A6606E8 != -1) {
        swift_once();
      }
      uint64_t v83 = sub_25D15B440();
      uint64_t v84 = (void *)OUTLINED_FUNCTION_10_4(v83, (uint64_t)qword_26A66E658);
      os_log_type_t v85 = sub_25D15B5E0();
      if (OUTLINED_FUNCTION_4_4(v85))
      {
        uint64_t v86 = (_WORD *)OUTLINED_FUNCTION_7_3();
        OUTLINED_FUNCTION_6_3(v86);
        OUTLINED_FUNCTION_2_4(&dword_25D115000, v87, v88, "#MessageAttachmentUtils creating view model for map link");
        OUTLINED_FUNCTION_3_11();
      }

      uint64_t v69 = type metadata accessor for MapAttachment();
      a4[3] = v69;
      uint64_t v89 = &qword_26A6608D8;
      uint64_t v90 = type metadata accessor for MapAttachment;
    }
    else
    {
      if (qword_26A6606E8 != -1) {
        swift_once();
      }
      uint64_t v91 = sub_25D15B440();
      uint64_t v92 = (void *)OUTLINED_FUNCTION_10_4(v91, (uint64_t)qword_26A66E658);
      os_log_type_t v93 = sub_25D15B5E0();
      if (OUTLINED_FUNCTION_4_4(v93))
      {
        uint64_t v94 = (_WORD *)OUTLINED_FUNCTION_7_3();
        OUTLINED_FUNCTION_6_3(v94);
        OUTLINED_FUNCTION_2_4(&dword_25D115000, v95, v96, "#MessageAttachmentUtils creating view model for shared link");
        OUTLINED_FUNCTION_3_11();
      }

      uint64_t v69 = type metadata accessor for LinkAttachment();
      a4[3] = v69;
      uint64_t v89 = &qword_26A6608E0;
      uint64_t v90 = type metadata accessor for LinkAttachment;
    }
    a4[4] = sub_25D150328(v89, (void (*)(uint64_t))v90);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
    v79((char *)boxed_opaque_existential_1, v80, v25);
    goto LABEL_57;
  }
  sub_25D144AF8((uint64_t)v24, &qword_26A660A50);
  if (!v150) {
    goto LABEL_60;
  }
  sub_25D12F520(0, (a1 & 0xC000000000000001) == 0, a1);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v72 = (id)MEMORY[0x2611A4F30](0, a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v72 = *(id *)(a1 + 32);
  }
  id v46 = objc_msgSend(v72, sel_file);

  if (!v46) {
    goto LABEL_60;
  }
  id v73 = objc_msgSend(v46, sel_fileURL);
  if (!v73)
  {
    uint64_t v75 = v142;
    __swift_storeEnumTagSinglePayload(v142, 1, 1, v149);
    goto LABEL_59;
  }
  uint64_t v74 = v73;
  sub_25D15B190();

  uint64_t v41 = *(void (**)(void))(v147 + 32);
  uint64_t v75 = v142;
  uint64_t v76 = v149;
  OUTLINED_FUNCTION_8_8();
  v41();
  __swift_storeEnumTagSinglePayload(v75, 0, 1, v76);
  if (__swift_getEnumTagSinglePayload(v75, 1, v76) == 1)
  {
LABEL_59:

    sub_25D144AF8(v75, &qword_26A660A50);
LABEL_60:
    if (qword_26A6606E8 != -1) {
LABEL_86:
    }
      swift_once();
    uint64_t v97 = sub_25D15B440();
    v98 = (void *)OUTLINED_FUNCTION_10_4(v97, (uint64_t)qword_26A66E658);
    os_log_type_t v99 = sub_25D15B5F0();
    if (OUTLINED_FUNCTION_4_4(v99))
    {
      v100 = (_WORD *)OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_6_3(v100);
      OUTLINED_FUNCTION_2_4(&dword_25D115000, v101, v102, "#MessageAttachmentUtils unsupported attachments");
      OUTLINED_FUNCTION_3_11();
    }

    a4[4] = 0;
    *(_OWORD *)a4 = 0u;
    *((_OWORD *)a4 + 1) = 0u;
    return;
  }
  OUTLINED_FUNCTION_8_8();
  v41();
  sub_25D1502C4(v46);
  if (!v77)
  {
LABEL_79:
    if (qword_26A6606E8 != -1) {
      swift_once();
    }
    uint64_t v127 = sub_25D15B440();
    v128 = (void *)OUTLINED_FUNCTION_10_4(v127, (uint64_t)qword_26A66E658);
    os_log_type_t v129 = sub_25D15B5E0();
    if (OUTLINED_FUNCTION_4_4(v129))
    {
      v130 = (_WORD *)OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_6_3(v130);
      OUTLINED_FUNCTION_2_4(&dword_25D115000, v131, v132, "#MessageAttachmentUtils creating view model for file link");
      OUTLINED_FUNCTION_3_11();
    }

    uint64_t v69 = type metadata accessor for LinkAttachment();
    a4[3] = v69;
    a4[4] = sub_25D150328(&qword_26A6608E0, (void (*)(uint64_t))type metadata accessor for LinkAttachment);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
    OUTLINED_FUNCTION_8_8();
    v41();
LABEL_57:
    *((unsigned char *)boxed_opaque_existential_1 + *(int *)(v69 + 20)) = v145 & 1;
    return;
  }
  uint64_t v78 = (uint64_t)v138;
  sub_25D15B410();
  uint64_t v42 = v139;
  if (__swift_getEnumTagSinglePayload(v78, 1, v139) == 1)
  {
    sub_25D144AF8(v78, &qword_26A661848);
    goto LABEL_79;
  }
  v135 = v32;
  uint64_t v103 = v140;
  uint64_t v104 = v78;
  uint64_t v43 = v137;
  (*(void (**)(char *, uint64_t, uint64_t))(v140 + 32))(v137, v104, v42);
  uint64_t v105 = v136;
  sub_25D15B3D0();
  uint64_t v106 = v105;
  uint64_t v107 = v103;
  LOBYTE(v103) = sub_25D15B3F0();
  v109 = *(void (**)(void, void))(v107 + 8);
  uint64_t v108 = v107 + 8;
  uint64_t v45 = v109;
  v109(v106, v42);
  if (v103)
  {
    if (qword_26A6606E8 != -1) {
      swift_once();
    }
    uint64_t v110 = sub_25D15B440();
    v111 = (void *)OUTLINED_FUNCTION_10_4(v110, (uint64_t)qword_26A66E658);
    os_log_type_t v112 = sub_25D15B5E0();
    if (OUTLINED_FUNCTION_4_4(v112))
    {
      v113 = (_WORD *)OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_6_3(v113);
      OUTLINED_FUNCTION_2_4(&dword_25D115000, v114, v115, "#MessageAttachmentUtils creating view model for photo");
      OUTLINED_FUNCTION_11_3();
    }

    ((void (*)(char *, uint64_t))v45)(v43, v42);
    uint64_t v116 = OUTLINED_FUNCTION_4_13();
    ((void (*)(uint64_t))v41)(v116);
    a4[3] = (uint64_t)&type metadata for PhotoAttachment;
    unint64_t v117 = sub_25D11D3D8();
  }
  else
  {
    sub_25D15B3E0();
    uint64_t v140 = v108;
    char v118 = sub_25D15B3F0();
    ((void (*)(uint64_t, uint64_t))v45)(v106, v42);
    if ((v118 & 1) == 0)
    {
LABEL_78:
      ((void (*)(char *, uint64_t))v45)(v43, v42);
      goto LABEL_79;
    }
    if (qword_26A6606E8 != -1) {
      swift_once();
    }
    uint64_t v119 = sub_25D15B440();
    v120 = (void *)OUTLINED_FUNCTION_10_4(v119, (uint64_t)qword_26A66E658);
    os_log_type_t v121 = sub_25D15B5E0();
    if (OUTLINED_FUNCTION_4_4(v121))
    {
      v122 = (_WORD *)OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_6_3(v122);
      OUTLINED_FUNCTION_2_4(&dword_25D115000, v123, v124, "#MessageAttachmentUtils creating view model for video");
      OUTLINED_FUNCTION_11_3();
    }

    ((void (*)(char *, uint64_t))v45)(v43, v42);
    uint64_t v125 = OUTLINED_FUNCTION_4_13();
    ((void (*)(uint64_t))v41)(v125);
    a4[3] = (uint64_t)&type metadata for VideoAttachment;
    unint64_t v117 = sub_25D11D38C();
  }
  a4[4] = v117;
  type metadata accessor for SecurityScopedURL();
  uint64_t v126 = swift_allocObject();
  OUTLINED_FUNCTION_8_8();
  v41();
  *a4 = v126;
  *((unsigned char *)a4 + 8) = v145 & 1;
}

uint64_t sub_25D14FBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static MessageAttachmentUtils.makeMapsURL(location:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660A50);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_25D15B6E0();
  sub_25D15B4F0();
  if (a1)
  {
    objc_msgSend(a1, sel_coordinate);
    sub_25D15B5A0();
    sub_25D15B4F0();
    objc_msgSend(a1, sel_coordinate);
  }
  else
  {
    sub_25D15B5A0();
    sub_25D15B4F0();
  }
  sub_25D15B5A0();
  sub_25D15B1B0();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_25D15B1C0();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a2, v6, v7);
  }
  __break(1u);
  return result;
}

uint64_t sub_25D14FE08(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661850);
  uint64_t v10 = *(void *)(sub_25D15B1C0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_25D15B740();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25D15B1C0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_25D150194(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25D150034(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_25D150034(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25D15B1C0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_25D15B760();
  __break(1u);
  return result;
}

uint64_t sub_25D150194(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_25D15B760();
    __break(1u);
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_25D15B1C0(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_25D15B1C0();
    return MEMORY[0x270FA01D8](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  return result;
}

uint64_t sub_25D1502C4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_typeIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25D15B4A0();

  return v3;
}

uint64_t sub_25D150328(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for MessageAttachmentUtils()
{
  return &type metadata for MessageAttachmentUtils;
}

void OUTLINED_FUNCTION_3_11()
{
  JUMPOUT(0x2611A5830);
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return *(void *)(v0 - 160);
}

uint64_t OUTLINED_FUNCTION_10_4(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_25D15B420();
}

void OUTLINED_FUNCTION_11_3()
{
  JUMPOUT(0x2611A5830);
}

unint64_t static MessagesUIPluginModel.bundleName.getter()
{
  return 0xD000000000000010;
}

uint64_t MessagesUIPluginModel.snippetHidden(for:idiom:)()
{
  return 0;
}

uint64_t sub_25D150454(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000018 && a2 == 0x800000025D1637B0 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x800000025D1637D0 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025D163800 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000025D163820 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000025D163840 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x800000025D163860 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025D163880)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = sub_25D15B8C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

unint64_t sub_25D1506F4(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000020;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    case 4:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25D1507B4(uint64_t a1)
{
  unint64_t v2 = sub_25D151800();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1507F0(uint64_t a1)
{
  unint64_t v2 = sub_25D151800();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D15082C(uint64_t a1)
{
  unint64_t v2 = sub_25D151768();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D150868(uint64_t a1)
{
  unint64_t v2 = sub_25D151768();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_25D1508A4()
{
  return sub_25D1506F4(*v0);
}

uint64_t sub_25D1508AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D150454(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D1508D4(uint64_t a1)
{
  unint64_t v2 = sub_25D1516B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D150910(uint64_t a1)
{
  unint64_t v2 = sub_25D1516B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D15094C(uint64_t a1)
{
  unint64_t v2 = sub_25D1517B4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D150988(uint64_t a1)
{
  unint64_t v2 = sub_25D1517B4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D1509C4(uint64_t a1)
{
  unint64_t v2 = sub_25D151930();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D150A00(uint64_t a1)
{
  unint64_t v2 = sub_25D151930();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D150A3C(uint64_t a1)
{
  unint64_t v2 = sub_25D151898();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D150A78(uint64_t a1)
{
  unint64_t v2 = sub_25D151898();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D150AB4(uint64_t a1)
{
  unint64_t v2 = sub_25D15184C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D150AF0(uint64_t a1)
{
  unint64_t v2 = sub_25D15184C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25D150B2C(uint64_t a1)
{
  unint64_t v2 = sub_25D1518E4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D150B68(uint64_t a1)
{
  unint64_t v2 = sub_25D1518E4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MessagesUIPluginModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661858);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5_0();
  type metadata accessor for ButtonSnippetModel(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5_0();
  uint64_t v53 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661860);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_8_9(v6, v49);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661868);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12_2(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661870);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_13_3(v10);
  type metadata accessor for SentMessageSnippetModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12_2(v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661878);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_13_3(v14);
  type metadata accessor for MessageDraftSnippetModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12_2(v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661880);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_13_3(v18);
  type metadata accessor for AutoSendableBinaryButton();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12_2(v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661888);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_6_0();
  type metadata accessor for ConfirmationSnippetModel(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_6_0();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = type metadata accessor for MessagesUIPluginModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_6_0();
  uint64_t v30 = v29 - v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661890);
  OUTLINED_FUNCTION_0();
  uint64_t v54 = v31;
  uint64_t v55 = v32;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_6_0();
  uint64_t v35 = v34 - v33;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1516B8();
  sub_25D15B9D0();
  sub_25D151704(v56, v30);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v38 = type metadata accessor for AutoSendableBinaryButton;
      uint64_t v39 = v50;
      sub_25D152758(v30, v50, (void (*)(void))type metadata accessor for AutoSendableBinaryButton);
      sub_25D1518E4();
      OUTLINED_FUNCTION_7_11();
      sub_25D152848(&qword_26A661130, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
      sub_25D15B880();
      goto LABEL_5;
    case 2u:
      uint64_t v38 = type metadata accessor for MessageDraftSnippetModel;
      uint64_t v39 = v51;
      sub_25D152758(v30, v51, (void (*)(void))type metadata accessor for MessageDraftSnippetModel);
      sub_25D151898();
      OUTLINED_FUNCTION_7_11();
      sub_25D152848(&qword_26A6610D0, (void (*)(uint64_t))type metadata accessor for MessageDraftSnippetModel);
      sub_25D15B880();
LABEL_5:
      OUTLINED_FUNCTION_2_1();
      v40();
      sub_25D1545F4(v39, (void (*)(void))v38);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v35, v25);
    case 3u:
      uint64_t v41 = v52;
      sub_25D152758(v30, v52, (void (*)(void))type metadata accessor for SentMessageSnippetModel);
      sub_25D15184C();
      OUTLINED_FUNCTION_15_1();
      sub_25D152848(&qword_26A660880, (void (*)(uint64_t))type metadata accessor for SentMessageSnippetModel);
      sub_25D15B880();
      OUTLINED_FUNCTION_2_1();
      v42();
      uint64_t v43 = (void (*)(void))type metadata accessor for SentMessageSnippetModel;
      goto LABEL_11;
    case 4u:
      sub_25D151800();
      sub_25D15B820();
      sub_25D14961C();
      sub_25D15B880();
      OUTLINED_FUNCTION_2_1();
      v44();
      OUTLINED_FUNCTION_2_1();
      v45();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    case 5u:
      sub_25D1517B4();
      sub_25D15B820();
      sub_25D13D714();
      sub_25D15B880();
      OUTLINED_FUNCTION_2_1();
      v46();
      OUTLINED_FUNCTION_2_1();
      v47();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_9:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 6u:
      uint64_t v41 = v53;
      sub_25D152758(v30, v53, (void (*)(void))type metadata accessor for ButtonSnippetModel);
      sub_25D151768();
      OUTLINED_FUNCTION_15_1();
      sub_25D152848(&qword_26A661780, (void (*)(uint64_t))type metadata accessor for ButtonSnippetModel);
      sub_25D15B880();
      OUTLINED_FUNCTION_2_1();
      v48();
      uint64_t v43 = (void (*)(void))type metadata accessor for ButtonSnippetModel;
LABEL_11:
      sub_25D1545F4(v41, v43);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v25, v26);
      break;
    default:
      sub_25D152758(v30, v25, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
      sub_25D151930();
      sub_25D15B820();
      sub_25D152848(&qword_26A6613E0, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
      sub_25D15B880();
      OUTLINED_FUNCTION_2_1();
      v36();
      sub_25D1545F4(v25, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v35, v54);
      break;
  }
  return result;
}

uint64_t type metadata accessor for MessagesUIPluginModel()
{
  uint64_t result = qword_26A661928;
  if (!qword_26A661928) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25D1516B8()
{
  unint64_t result = qword_26A661898;
  if (!qword_26A661898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661898);
  }
  return result;
}

uint64_t sub_25D151704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessagesUIPluginModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25D151768()
{
  unint64_t result = qword_26A6618A0;
  if (!qword_26A6618A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6618A0);
  }
  return result;
}

unint64_t sub_25D1517B4()
{
  unint64_t result = qword_26A6618A8;
  if (!qword_26A6618A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6618A8);
  }
  return result;
}

unint64_t sub_25D151800()
{
  unint64_t result = qword_26A6618B0;
  if (!qword_26A6618B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6618B0);
  }
  return result;
}

unint64_t sub_25D15184C()
{
  unint64_t result = qword_26A6618B8;
  if (!qword_26A6618B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6618B8);
  }
  return result;
}

unint64_t sub_25D151898()
{
  unint64_t result = qword_26A6618C0;
  if (!qword_26A6618C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6618C0);
  }
  return result;
}

unint64_t sub_25D1518E4()
{
  unint64_t result = qword_26A6618C8;
  if (!qword_26A6618C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6618C8);
  }
  return result;
}

unint64_t sub_25D151930()
{
  unint64_t result = qword_26A6618D0;
  if (!qword_26A6618D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6618D0);
  }
  return result;
}

uint64_t MessagesUIPluginModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v124 = a2;
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6618D8);
  OUTLINED_FUNCTION_0();
  uint64_t v120 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_0();
  uint64_t v123 = v5;
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6618E0);
  OUTLINED_FUNCTION_0();
  uint64_t v119 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12_2(v8);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6618E8);
  OUTLINED_FUNCTION_0();
  uint64_t v117 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8_9(v11, v100);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6618F0);
  OUTLINED_FUNCTION_0();
  uint64_t v115 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5_0();
  uint64_t v125 = v14;
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6618F8);
  OUTLINED_FUNCTION_0();
  uint64_t v113 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_5_0();
  uint64_t v130 = v17;
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661900);
  OUTLINED_FUNCTION_0();
  uint64_t v111 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_5_0();
  uint64_t v122 = v20;
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661908);
  OUTLINED_FUNCTION_0();
  uint64_t v109 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_5_0();
  uint64_t v128 = v23;
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661910);
  OUTLINED_FUNCTION_0();
  uint64_t v127 = v24;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_6_0();
  uint64_t v28 = v27 - v26;
  uint64_t v131 = type metadata accessor for MessagesUIPluginModel();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_11_4();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_11_4();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_11_4();
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v100 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v38 = (char *)&v100 - v37;
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  uint64_t v41 = (char *)&v100 - v40;
  uint64_t v42 = MEMORY[0x270FA5388](v39);
  id v44 = (char *)&v100 - v43;
  MEMORY[0x270FA5388](v42);
  id v46 = (char *)&v100 - v45;
  uint64_t v47 = a1[3];
  uint64_t v132 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v47);
  sub_25D1516B8();
  uint64_t v48 = (uint64_t)v139;
  sub_25D15B9B0();
  if (v48) {
    goto LABEL_8;
  }
  uint64_t v103 = v44;
  uint64_t v104 = v41;
  uint64_t v105 = v38;
  uint64_t v106 = v35;
  uint64_t v49 = v128;
  uint64_t v50 = v129;
  uint64_t v51 = v131;
  uint64_t v139 = v46;
  uint64_t v52 = sub_25D15B800();
  uint64_t v53 = *(void *)(v52 + 16);
  if (!v53
    || (uint64_t v102 = 0,
        uint64_t v101 = *(unsigned __int8 *)(v52 + 32),
        sub_25D120AB0(1, v53, v52, v52 + 32, 0, (2 * v53) | 1),
        uint64_t v55 = v54,
        unint64_t v57 = v56,
        swift_bridgeObjectRelease(),
        v55 != v57 >> 1))
  {
    uint64_t v63 = v28;
    uint64_t v64 = v127;
    uint64_t v65 = sub_25D15B720();
    swift_allocError();
    uint64_t v67 = v66;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660988);
    *uint64_t v67 = v51;
    sub_25D15B790();
    sub_25D15B710();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v65 - 8) + 104))(v67, *MEMORY[0x263F8DCB0], v65);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v50);
LABEL_8:
    uint64_t v58 = (uint64_t)v132;
    return __swift_destroy_boxed_opaque_existential_1(v58);
  }
  uint64_t v58 = v102;
  switch(v101)
  {
    case 1:
      v133[0] = 1;
      sub_25D1518E4();
      OUTLINED_FUNCTION_4_14();
      type metadata accessor for AutoSendableBinaryButton();
      sub_25D152848(&qword_26A661140, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
      uint64_t v77 = (uint64_t)v104;
      sub_25D15B7F0();
      OUTLINED_FUNCTION_2_1();
      v83();
      swift_unknownObjectRelease();
      uint64_t v84 = OUTLINED_FUNCTION_2_15();
      v85(v84);
      swift_storeEnumTagMultiPayload();
      uint64_t v86 = (uint64_t)v139;
      sub_25D152758(v77, (uint64_t)v139, (void (*)(void))type metadata accessor for MessagesUIPluginModel);
      uint64_t v58 = (uint64_t)v132;
      goto LABEL_22;
    case 2:
      v133[0] = 2;
      sub_25D151898();
      OUTLINED_FUNCTION_4_14();
      OUTLINED_FUNCTION_9_5();
      type metadata accessor for MessageDraftSnippetModel();
      sub_25D152848(&qword_26A6610C8, (void (*)(uint64_t))type metadata accessor for MessageDraftSnippetModel);
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_2_1();
      v69();
      swift_unknownObjectRelease();
      uint64_t v70 = OUTLINED_FUNCTION_2_15();
      v71(v70);
      goto LABEL_20;
    case 3:
      v133[0] = 3;
      sub_25D15184C();
      OUTLINED_FUNCTION_4_14();
      OUTLINED_FUNCTION_9_5();
      type metadata accessor for SentMessageSnippetModel();
      sub_25D152848(&qword_26A660878, (void (*)(uint64_t))type metadata accessor for SentMessageSnippetModel);
      OUTLINED_FUNCTION_14_2();
      sub_25D15B7F0();
      if (v55)
      {
        OUTLINED_FUNCTION_2_1();
        v72();
        swift_unknownObjectRelease();
        OUTLINED_FUNCTION_2_1();
        v76();
        return __swift_destroy_boxed_opaque_existential_1(v58);
      }
      OUTLINED_FUNCTION_2_1();
      v81();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_2_1();
      v82();
LABEL_20:
      swift_storeEnumTagMultiPayload();
      uint64_t v96 = v49;
      goto LABEL_21;
    case 4:
      v133[0] = 4;
      sub_25D151800();
      OUTLINED_FUNCTION_4_14();
      OUTLINED_FUNCTION_9_5();
      sub_25D1495CC();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_2_1();
      v73();
      swift_unknownObjectRelease();
      uint64_t v74 = OUTLINED_FUNCTION_2_15();
      v75(v74);
      uint64_t v59 = v107;
      *uint64_t v107 = *(void *)v133;
      *(_OWORD *)(v59 + 1) = *(_OWORD *)&v133[8];
      goto LABEL_19;
    case 5:
      v133[0] = 5;
      sub_25D1517B4();
      OUTLINED_FUNCTION_4_14();
      OUTLINED_FUNCTION_9_5();
      sub_25D13D6C4();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_2_1();
      v87();
      swift_unknownObjectRelease();
      uint64_t v88 = OUTLINED_FUNCTION_2_15();
      v89(v88);
      char v90 = v133[16];
      uint64_t v91 = v134;
      uint64_t v92 = v135;
      char v93 = v136;
      uint64_t v94 = v137;
      uint64_t v95 = v138;
      uint64_t v59 = v108;
      *uint64_t v108 = *(_OWORD *)v133;
      *((unsigned char *)v59 + 16) = v90;
      v59[3] = v91;
      v59[4] = v92;
      *((unsigned char *)v59 + 40) = v93;
      v59[6] = v94;
      v59[7] = v95;
      goto LABEL_19;
    case 6:
      v133[0] = 6;
      sub_25D151768();
      OUTLINED_FUNCTION_4_14();
      OUTLINED_FUNCTION_9_5();
      type metadata accessor for ButtonSnippetModel(0);
      sub_25D152848(&qword_26A661778, (void (*)(uint64_t))type metadata accessor for ButtonSnippetModel);
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_2_1();
      v97();
      swift_unknownObjectRelease();
      uint64_t v98 = OUTLINED_FUNCTION_2_15();
      v99(v98);
      goto LABEL_20;
    default:
      v133[0] = 0;
      sub_25D151930();
      OUTLINED_FUNCTION_4_14();
      OUTLINED_FUNCTION_9_5();
      type metadata accessor for ConfirmationSnippetModel(0);
      sub_25D152848(&qword_26A6613D8, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
      uint64_t v59 = v103;
      sub_25D15B7F0();
      if (v55)
      {
        OUTLINED_FUNCTION_2_1();
        v60();
        swift_unknownObjectRelease();
        uint64_t v61 = OUTLINED_FUNCTION_10_5();
        v62(v61);
      }
      else
      {
        OUTLINED_FUNCTION_2_1();
        v78();
        swift_unknownObjectRelease();
        uint64_t v79 = OUTLINED_FUNCTION_10_5();
        v80(v79);
LABEL_19:
        swift_storeEnumTagMultiPayload();
        uint64_t v96 = (uint64_t)v59;
LABEL_21:
        uint64_t v86 = (uint64_t)v139;
        sub_25D152758(v96, (uint64_t)v139, (void (*)(void))type metadata accessor for MessagesUIPluginModel);
LABEL_22:
        sub_25D152758(v86, v124, (void (*)(void))type metadata accessor for MessagesUIPluginModel);
      }
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v58);
}

unint64_t sub_25D152708()
{
  return 0xD000000000000010;
}

uint64_t sub_25D152728@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MessagesUIPluginModel.init(from:)(a1, a2);
}

uint64_t sub_25D152740(void *a1)
{
  return MessagesUIPluginModel.encode(to:)(a1);
}

uint64_t sub_25D152758(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25D1527B8()
{
  return sub_25D152848(&qword_26A661918, (void (*)(uint64_t))type metadata accessor for MessagesUIPluginModel);
}

uint64_t sub_25D152800()
{
  return sub_25D152848(&qword_26A661920, (void (*)(uint64_t))type metadata accessor for MessagesUIPluginModel);
}

uint64_t sub_25D152848(unint64_t *a1, void (*a2)(uint64_t))
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

char *initializeBufferWithCopyOfBuffer for MessagesUIPluginModel(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *(void *)a1 = *a2;
    a1 = &v23[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *(unsigned char *)a2;
        uint64_t v24 = a2[2];
        *((void *)a1 + 1) = a2[1];
        *((void *)a1 + 2) = v24;
        uint64_t v26 = a2[3];
        uint64_t v25 = a2[4];
        *((void *)a1 + 3) = v26;
        *((void *)a1 + 4) = v25;
        uint64_t v27 = a2[6];
        *((void *)a1 + 5) = a2[5];
        *((void *)a1 + 6) = v27;
        uint64_t v28 = a2[8];
        *((void *)a1 + 7) = a2[7];
        *((void *)a1 + 8) = v28;
        *((void *)a1 + 9) = a2[9];
        a1[80] = *((unsigned char *)a2 + 80);
        uint64_t v29 = *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
        uint64_t v30 = &a1[v29];
        uint64_t v31 = (char *)a2 + v29;
        uint64_t v32 = sub_25D15B360();
        uint64_t v33 = v24;
        uint64_t v34 = v26;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
        {
          uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
          memcpy(v30, v31, *(void *)(*(void *)(v35 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
          __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
        }
        break;
      case 2u:
        uint64_t v36 = sub_25D15B220();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v36 - 8) + 16))(a1, a2, v36);
        uint64_t v37 = (int *)type metadata accessor for MessageDraftSnippetModel();
        uint64_t v38 = v37[5];
        uint64_t v39 = *(char **)((char *)a2 + v38);
        *(void *)&a1[v38] = v39;
        uint64_t v40 = v37[6];
        uint64_t v41 = &a1[v40];
        uint64_t v42 = (uint64_t)a2 + v40;
        id v43 = v39;
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 16))(v41, v42, v44);
        uint64_t v45 = v37[7];
        id v46 = &a1[v45];
        uint64_t v47 = (char **)((char *)a2 + v45);
        uint64_t v48 = v47[1];
        *(void *)id v46 = *v47;
        *((void *)v46 + 1) = v48;
        a1[v37[8]] = *((unsigned char *)a2 + v37[8]);
        uint64_t v49 = v37[9];
        uint64_t v50 = &a1[v49];
        uint64_t v51 = (uint64_t)a2 + v49;
        uint64_t v52 = *(uint64_t *)((char *)a2 + v49 + 16);
        swift_bridgeObjectRetain();
        if (v52 == 1)
        {
          long long v53 = *(_OWORD *)(v51 + 16);
          *(_OWORD *)uint64_t v50 = *(_OWORD *)v51;
          *((_OWORD *)v50 + 1) = v53;
          *((void *)v50 + 4) = *(void *)(v51 + 32);
        }
        else
        {
          *(_OWORD *)uint64_t v50 = *(_OWORD *)v51;
          uint64_t v77 = *(void *)(v51 + 24);
          uint64_t v78 = *(void *)(v51 + 32);
          *((void *)v50 + 2) = v52;
          *((void *)v50 + 3) = v77;
          *((void *)v50 + 4) = v78;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        uint64_t v79 = v37[10];
        uint64_t v80 = &a1[v79];
        uint64_t v81 = (uint64_t)a2 + v79;
        *(void *)uint64_t v80 = *(void *)v81;
        v80[8] = *(unsigned char *)(v81 + 8);
        uint64_t v82 = v37[11];
        uint64_t v83 = &a1[v82];
        uint64_t v84 = (uint64_t)a2 + v82;
        swift_bridgeObjectRetain();
        uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v85 - 8) + 16))(v83, v84, v85);
        break;
      case 3u:
        uint64_t v54 = *a2;
        uint64_t v55 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v55;
        unint64_t v56 = (int *)type metadata accessor for SentMessageSnippetModel();
        uint64_t v57 = v56[6];
        uint64_t v58 = &a1[v57];
        uint64_t v59 = (uint64_t)a2 + v57;
        unint64_t v60 = v54;
        uint64_t v61 = v55;
        uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v62 - 8) + 16))(v58, v59, v62);
        uint64_t v63 = v56[7];
        uint64_t v64 = &a1[v63];
        uint64_t v65 = (uint64_t)a2 + v63;
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v66 - 8) + 16))(v64, v65, v66);
        uint64_t v67 = v56[8];
        uint64_t v68 = &a1[v67];
        uint64_t v69 = (uint64_t)a2 + v67;
        uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v70 - 8) + 16))(v68, v69, v70);
        break;
      case 4u:
        uint64_t v71 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v71;
        *((void *)a1 + 2) = a2[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 5u:
        id v72 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v72;
        a1[16] = *((unsigned char *)a2 + 16);
        id v73 = a2[4];
        *((void *)a1 + 3) = a2[3];
        *((void *)a1 + 4) = v73;
        a1[40] = *((unsigned char *)a2 + 40);
        uint64_t v74 = a2[6];
        uint64_t v75 = a2[7];
        *((void *)a1 + 6) = v74;
        *((void *)a1 + 7) = v75;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 6u:
        type metadata accessor for ButtonSnippetModel.Action(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v76 = a2[1];
          *(void *)a1 = *a2;
          *((void *)a1 + 1) = v76;
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v86 = sub_25D15B1C0();
          (*(void (**)(char *, char **, uint64_t))(*(void *)(v86 - 8) + 16))(a1, a2, v86);
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v87 = *(int *)(type metadata accessor for ButtonSnippetModel(0) + 20);
        uint64_t v88 = &a1[v87];
        uint64_t v89 = (char **)((char *)a2 + v87);
        uint64_t v90 = v89[1];
        *(void *)uint64_t v88 = *v89;
        *((void *)v88 + 1) = v90;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v6;
        uint64_t v7 = a2[3];
        *((void *)a1 + 2) = a2[2];
        *((void *)a1 + 3) = v7;
        uint64_t v8 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
        uint64_t v9 = &a1[v8];
        uint64_t v10 = (uint64_t)a2 + v8;
        type metadata accessor for ConfirmationSnippetModel.MessageType(0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          uint64_t v91 = *(void *)(v10 + 8);
          *(void *)uint64_t v9 = *(void *)v10;
          *((void *)v9 + 1) = v91;
          v9[16] = *(unsigned char *)(v10 + 16);
        }
        else if (EnumCaseMultiPayload == 1)
        {
          uint64_t v12 = sub_25D15B1C0();
          (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
          uint64_t v13 = (int *)type metadata accessor for AudioMessagePlayer();
          v9[v13[5]] = *(unsigned char *)(v10 + v13[5]);
          uint64_t v14 = v13[6];
          uint64_t v15 = &v9[v14];
          uint64_t v16 = (uint64_t *)(v10 + v14);
          uint64_t v18 = *v16;
          uint64_t v17 = v16[1];
          *(void *)uint64_t v15 = v18;
          *((void *)v15 + 1) = v17;
          uint64_t v19 = v13[7];
          uint64_t v20 = &v9[v19];
          uint64_t v21 = (void *)(v10 + v19);
          uint64_t v22 = v21[1];
          *(void *)uint64_t v20 = *v21;
          *((void *)v20 + 1) = v22;
          swift_bridgeObjectRetain();
        }
        else
        {
          type metadata accessor for AttachmentModel();
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
              uint64_t v94 = sub_25D15B1C0();
              (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v94 - 8) + 16))(v9, v10, v94);
              uint64_t v93 = type metadata accessor for MapAttachment();
              goto LABEL_27;
            case 2u:
            case 3u:
              *(void *)uint64_t v9 = *(void *)v10;
              v9[8] = *(unsigned char *)(v10 + 8);
              swift_retain();
              break;
            default:
              uint64_t v92 = sub_25D15B1C0();
              (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v92 - 8) + 16))(v9, v10, v92);
              uint64_t v93 = type metadata accessor for LinkAttachment();
LABEL_27:
              v9[*(int *)(v93 + 20)] = *(unsigned char *)(v10 + *(int *)(v93 + 20));
              break;
          }
          swift_storeEnumTagMultiPayload();
          uint64_t v95 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
          uint64_t v96 = &v9[v95];
          uint64_t v97 = (void *)(v10 + v95);
          uint64_t v98 = v97[1];
          *(void *)uint64_t v96 = *v97;
          *((void *)v96 + 1) = v98;
        }
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MessagesUIPluginModel(id *a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = (char *)a1 + *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
      type metadata accessor for ConfirmationSnippetModel.MessageType(0);
      uint64_t result = swift_getEnumCaseMultiPayload();
      switch(result)
      {
        case 2:
          goto LABEL_28;
        case 1:
          uint64_t v23 = sub_25D15B1C0();
          (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v3, v23);
          type metadata accessor for AudioMessagePlayer();
          swift_bridgeObjectRelease();
          goto LABEL_28;
        case 0:
          type metadata accessor for AttachmentModel();
          switch(swift_getEnumCaseMultiPayload())
          {
            case 0u:
            case 1u:
              uint64_t v4 = sub_25D15B1C0();
              (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
              break;
            case 2u:
            case 3u:
              swift_release();
              break;
            default:
              break;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
          goto LABEL_28;
      }
      return result;
    case 1:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = (uint64_t)a1 + *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
      uint64_t v6 = sub_25D15B360();
      uint64_t result = __swift_getEnumTagSinglePayload(v5, 1, v6);
      if (!result)
      {
        uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
        uint64_t v21 = v5;
        uint64_t v20 = v6;
        goto LABEL_15;
      }
      return result;
    case 2:
      uint64_t v7 = sub_25D15B220();
      (*(void (**)(id *, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
      uint64_t v8 = (int *)type metadata accessor for MessageDraftSnippetModel();

      uint64_t v9 = (char *)a1 + v8[6];
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
      (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
      swift_bridgeObjectRelease();
      if (*(id *)((char *)a1 + v8[9] + 16) != (id)1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v11 = v8[11];
      goto LABEL_14;
    case 3:

      uint64_t v12 = (int *)type metadata accessor for SentMessageSnippetModel();
      uint64_t v13 = (char *)a1 + v12[6];
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
      (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
      uint64_t v15 = (char *)a1 + v12[7];
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
      (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
      uint64_t v11 = v12[8];
LABEL_14:
      uint64_t v17 = (char *)a1 + v11;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
      uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
      uint64_t v20 = v18;
      uint64_t v21 = (uint64_t)v17;
LABEL_15:
      return v19(v21, v20);
    case 4:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    case 5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_28;
    case 6:
      type metadata accessor for ButtonSnippetModel.Action(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v22 = sub_25D15B1C0();
        (*(void (**)(id *, uint64_t))(*(void *)(v22 - 8) + 8))(a1, v22);
      }
      type metadata accessor for ButtonSnippetModel(0);
LABEL_28:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for MessagesUIPluginModel(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v21 = *(void **)(a2 + 16);
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = v21;
      uint64_t v23 = *(void **)(a2 + 24);
      uint64_t v22 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v23;
      *(void *)(a1 + 32) = v22;
      uint64_t v24 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v24;
      uint64_t v25 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v25;
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      uint64_t v26 = *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
      uint64_t v27 = (void *)(a1 + v26);
      uint64_t v28 = (const void *)(a2 + v26);
      uint64_t v29 = sub_25D15B360();
      id v30 = v21;
      id v31 = v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, v29))
      {
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
        memcpy(v27, v28, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
        __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v29);
      }
      break;
    case 2u:
      uint64_t v33 = sub_25D15B220();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(a1, a2, v33);
      uint64_t v34 = (int *)type metadata accessor for MessageDraftSnippetModel();
      uint64_t v35 = v34[5];
      uint64_t v36 = *(void **)(a2 + v35);
      *(void *)(a1 + v35) = v36;
      uint64_t v37 = v34[6];
      uint64_t v38 = a1 + v37;
      uint64_t v39 = a2 + v37;
      id v40 = v36;
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v38, v39, v41);
      uint64_t v42 = v34[7];
      id v43 = (void *)(a1 + v42);
      uint64_t v44 = (void *)(a2 + v42);
      uint64_t v45 = v44[1];
      *id v43 = *v44;
      v43[1] = v45;
      *(unsigned char *)(a1 + v34[8]) = *(unsigned char *)(a2 + v34[8]);
      uint64_t v46 = v34[9];
      uint64_t v47 = a1 + v46;
      uint64_t v48 = a2 + v46;
      uint64_t v49 = *(void *)(a2 + v46 + 16);
      swift_bridgeObjectRetain();
      if (v49 == 1)
      {
        long long v50 = *(_OWORD *)(v48 + 16);
        *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
        *(_OWORD *)(v47 + 16) = v50;
        *(void *)(v47 + 32) = *(void *)(v48 + 32);
      }
      else
      {
        *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
        uint64_t v74 = *(void *)(v48 + 24);
        uint64_t v75 = *(void *)(v48 + 32);
        *(void *)(v47 + 16) = v49;
        *(void *)(v47 + 24) = v74;
        *(void *)(v47 + 32) = v75;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      uint64_t v76 = v34[10];
      uint64_t v77 = a1 + v76;
      uint64_t v78 = a2 + v76;
      *(void *)uint64_t v77 = *(void *)v78;
      *(unsigned char *)(v77 + 8) = *(unsigned char *)(v78 + 8);
      uint64_t v79 = v34[11];
      uint64_t v80 = a1 + v79;
      uint64_t v81 = a2 + v79;
      swift_bridgeObjectRetain();
      uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 16))(v80, v81, v82);
      break;
    case 3u:
      uint64_t v51 = *(void **)a2;
      uint64_t v52 = *(void **)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v52;
      long long v53 = (int *)type metadata accessor for SentMessageSnippetModel();
      uint64_t v54 = v53[6];
      uint64_t v55 = a1 + v54;
      uint64_t v56 = a2 + v54;
      id v57 = v51;
      id v58 = v52;
      uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16))(v55, v56, v59);
      uint64_t v60 = v53[7];
      uint64_t v61 = a1 + v60;
      uint64_t v62 = a2 + v60;
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
      uint64_t v64 = v53[8];
      uint64_t v65 = a1 + v64;
      uint64_t v66 = a2 + v64;
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 16))(v65, v66, v67);
      break;
    case 4u:
      uint64_t v68 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v68;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 5u:
      uint64_t v69 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v69;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v70 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v70;
      *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
      uint64_t v71 = *(void *)(a2 + 48);
      uint64_t v72 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v71;
      *(void *)(a1 + 56) = v72;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 6u:
      type metadata accessor for ButtonSnippetModel.Action(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v73 = *(void *)(a2 + 8);
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = v73;
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v83 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 16))(a1, a2, v83);
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v84 = *(int *)(type metadata accessor for ButtonSnippetModel(0) + 20);
      uint64_t v85 = (void *)(a1 + v84);
      uint64_t v86 = (void *)(a2 + v84);
      uint64_t v87 = v86[1];
      void *v85 = *v86;
      v85[1] = v87;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v5;
      uint64_t v6 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
      uint64_t v7 = a1 + v6;
      uint64_t v8 = a2 + v6;
      type metadata accessor for ConfirmationSnippetModel.MessageType(0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v88 = *(void *)(v8 + 8);
        *(void *)uint64_t v7 = *(void *)v8;
        *(void *)(v7 + 8) = v88;
        *(unsigned char *)(v7 + 16) = *(unsigned char *)(v8 + 16);
      }
      else if (EnumCaseMultiPayload == 1)
      {
        uint64_t v10 = sub_25D15B1C0();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
        uint64_t v11 = (int *)type metadata accessor for AudioMessagePlayer();
        *(unsigned char *)(v7 + v11[5]) = *(unsigned char *)(v8 + v11[5]);
        uint64_t v12 = v11[6];
        uint64_t v13 = (void *)(v7 + v12);
        uint64_t v14 = (uint64_t *)(v8 + v12);
        uint64_t v16 = *v14;
        uint64_t v15 = v14[1];
        *uint64_t v13 = v16;
        v13[1] = v15;
        uint64_t v17 = v11[7];
        uint64_t v18 = (void *)(v7 + v17);
        uint64_t v19 = (void *)(v8 + v17);
        uint64_t v20 = v19[1];
        *uint64_t v18 = *v19;
        v18[1] = v20;
        swift_bridgeObjectRetain();
      }
      else
      {
        type metadata accessor for AttachmentModel();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v91 = sub_25D15B1C0();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 16))(v7, v8, v91);
            uint64_t v90 = type metadata accessor for MapAttachment();
            goto LABEL_25;
          case 2u:
          case 3u:
            *(void *)uint64_t v7 = *(void *)v8;
            *(unsigned char *)(v7 + 8) = *(unsigned char *)(v8 + 8);
            swift_retain();
            break;
          default:
            uint64_t v89 = sub_25D15B1C0();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 16))(v7, v8, v89);
            uint64_t v90 = type metadata accessor for LinkAttachment();
LABEL_25:
            *(unsigned char *)(v7 + *(int *)(v90 + 20)) = *(unsigned char *)(v8 + *(int *)(v90 + 20));
            break;
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v92 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
        uint64_t v93 = (void *)(v7 + v92);
        uint64_t v94 = (void *)(v8 + v92);
        uint64_t v95 = v94[1];
        *uint64_t v93 = *v94;
        v93[1] = v95;
      }
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for MessagesUIPluginModel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25D1545F4(a1, (void (*)(void))type metadata accessor for MessagesUIPluginModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        uint64_t v16 = *(void **)(a2 + 16);
        *(void *)(a1 + 16) = v16;
        uint64_t v17 = *(void **)(a2 + 24);
        *(void *)(a1 + 24) = v17;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
        uint64_t v18 = *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
        uint64_t v19 = (void *)(a1 + v18);
        uint64_t v20 = (const void *)(a2 + v18);
        uint64_t v21 = sub_25D15B360();
        id v22 = v16;
        id v23 = v17;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21))
        {
          uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
          memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
          __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
        }
        break;
      case 2u:
        uint64_t v25 = sub_25D15B220();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(a1, a2, v25);
        uint64_t v26 = (int *)type metadata accessor for MessageDraftSnippetModel();
        uint64_t v27 = v26[5];
        uint64_t v28 = *(void **)(a2 + v27);
        *(void *)(a1 + v27) = v28;
        uint64_t v29 = v26[6];
        uint64_t v30 = a1 + v29;
        uint64_t v31 = a2 + v29;
        id v32 = v28;
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
        uint64_t v34 = v26[7];
        uint64_t v35 = (void *)(a1 + v34);
        uint64_t v36 = (void *)(a2 + v34);
        *uint64_t v35 = *v36;
        v35[1] = v36[1];
        *(unsigned char *)(a1 + v26[8]) = *(unsigned char *)(a2 + v26[8]);
        uint64_t v37 = v26[9];
        uint64_t v38 = a1 + v37;
        uint64_t v39 = (long long *)(a2 + v37);
        uint64_t v40 = *(void *)(a2 + v37 + 16);
        swift_bridgeObjectRetain();
        if (v40 == 1)
        {
          long long v41 = *v39;
          long long v42 = v39[1];
          *(void *)(v38 + 32) = *((void *)v39 + 4);
          *(_OWORD *)uint64_t v38 = v41;
          *(_OWORD *)(v38 + 16) = v42;
        }
        else
        {
          *(void *)uint64_t v38 = *(void *)v39;
          *(void *)(v38 + 8) = *((void *)v39 + 1);
          *(void *)(v38 + 16) = *((void *)v39 + 2);
          *(void *)(v38 + 24) = *((void *)v39 + 3);
          *(void *)(v38 + 32) = *((void *)v39 + 4);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        uint64_t v60 = v26[10];
        uint64_t v61 = a1 + v60;
        uint64_t v62 = a2 + v60;
        *(void *)uint64_t v61 = *(void *)v62;
        *(unsigned char *)(v61 + 8) = *(unsigned char *)(v62 + 8);
        uint64_t v63 = v26[11];
        uint64_t v64 = a1 + v63;
        uint64_t v65 = a2 + v63;
        swift_bridgeObjectRetain();
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 16))(v64, v65, v66);
        break;
      case 3u:
        id v43 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        uint64_t v44 = *(void **)(a2 + 8);
        *(void *)(a1 + 8) = v44;
        uint64_t v45 = (int *)type metadata accessor for SentMessageSnippetModel();
        uint64_t v46 = v45[6];
        uint64_t v47 = a1 + v46;
        uint64_t v48 = a2 + v46;
        id v49 = v43;
        id v50 = v44;
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16))(v47, v48, v51);
        uint64_t v52 = v45[7];
        uint64_t v53 = a1 + v52;
        uint64_t v54 = a2 + v52;
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 16))(v53, v54, v55);
        uint64_t v56 = v45[8];
        uint64_t v57 = a1 + v56;
        uint64_t v58 = a2 + v56;
        uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16))(v57, v58, v59);
        break;
      case 4u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 5u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 6u:
        type metadata accessor for ButtonSnippetModel.Action(0);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          *(void *)a1 = *(void *)a2;
          *(void *)(a1 + 8) = *(void *)(a2 + 8);
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v67 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 16))(a1, a2, v67);
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v68 = *(int *)(type metadata accessor for ButtonSnippetModel(0) + 20);
        uint64_t v69 = (void *)(a1 + v68);
        uint64_t v70 = (void *)(a2 + v68);
        *uint64_t v69 = *v70;
        v69[1] = v70[1];
        swift_bridgeObjectRetain();
        break;
      default:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v4 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
        uint64_t v5 = a1 + v4;
        uint64_t v6 = a2 + v4;
        type metadata accessor for ConfirmationSnippetModel.MessageType(0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          *(void *)uint64_t v5 = *(void *)v6;
          *(void *)(v5 + 8) = *(void *)(v6 + 8);
          *(unsigned char *)(v5 + 16) = *(unsigned char *)(v6 + 16);
        }
        else if (EnumCaseMultiPayload == 1)
        {
          uint64_t v8 = sub_25D15B1C0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v5, v6, v8);
          uint64_t v9 = (int *)type metadata accessor for AudioMessagePlayer();
          *(unsigned char *)(v5 + v9[5]) = *(unsigned char *)(v6 + v9[5]);
          uint64_t v10 = v9[6];
          uint64_t v11 = (void *)(v5 + v10);
          uint64_t v12 = (void *)(v6 + v10);
          *uint64_t v11 = *v12;
          v11[1] = v12[1];
          uint64_t v13 = v9[7];
          uint64_t v14 = (void *)(v5 + v13);
          uint64_t v15 = (void *)(v6 + v13);
          *uint64_t v14 = *v15;
          v14[1] = v15[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          type metadata accessor for AttachmentModel();
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
              uint64_t v73 = sub_25D15B1C0();
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 16))(v5, v6, v73);
              uint64_t v72 = type metadata accessor for MapAttachment();
              goto LABEL_26;
            case 2u:
            case 3u:
              *(void *)uint64_t v5 = *(void *)v6;
              *(unsigned char *)(v5 + 8) = *(unsigned char *)(v6 + 8);
              swift_retain();
              break;
            default:
              uint64_t v71 = sub_25D15B1C0();
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 16))(v5, v6, v71);
              uint64_t v72 = type metadata accessor for LinkAttachment();
LABEL_26:
              *(unsigned char *)(v5 + *(int *)(v72 + 20)) = *(unsigned char *)(v6 + *(int *)(v72 + 20));
              break;
          }
          swift_storeEnumTagMultiPayload();
          uint64_t v74 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A661348) + 48);
          uint64_t v75 = (void *)(v5 + v74);
          uint64_t v76 = (void *)(v6 + v74);
          *uint64_t v75 = *v76;
          v75[1] = v76[1];
        }
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25D1545F4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1();
  v3();
  return a1;
}

_OWORD *initializeWithTake for MessagesUIPluginModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v55 = sub_25D15B1C0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v55 - 8) + 32))(v8, v9, v55);
        uint64_t v56 = (int *)type metadata accessor for AudioMessagePlayer();
        v8[v56[5]] = v9[v56[5]];
        *(_OWORD *)&v8[v56[6]] = *(_OWORD *)&v9[v56[6]];
        *(_OWORD *)&v8[v56[7]] = *(_OWORD *)&v9[v56[7]];
LABEL_24:
        swift_storeEnumTagMultiPayload();
        goto LABEL_25;
      }
      if (EnumCaseMultiPayload)
      {
        memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
        goto LABEL_25;
      }
      uint64_t v12 = type metadata accessor for AttachmentModel();
      int v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 1)
      {
        uint64_t v57 = sub_25D15B1C0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v57 - 8) + 32))(v8, v9, v57);
        uint64_t v58 = type metadata accessor for MapAttachment();
        v8[*(int *)(v58 + 20)] = v9[*(int *)(v58 + 20)];
      }
      else
      {
        if (v13)
        {
          memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
          goto LABEL_23;
        }
        uint64_t v14 = sub_25D15B1C0();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32))(v8, v9, v14);
        uint64_t v15 = type metadata accessor for LinkAttachment();
        v8[*(int *)(v15 + 20)] = v9[*(int *)(v15 + 20)];
      }
      swift_storeEnumTagMultiPayload();
LABEL_23:
      uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
      *(_OWORD *)&v8[*(int *)(v59 + 48)] = *(_OWORD *)&v9[*(int *)(v59 + 48)];
      goto LABEL_24;
    case 1u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
      *((void *)a1 + 3) = *((void *)a2 + 3);
      long long v16 = a2[3];
      a1[2] = a2[2];
      a1[3] = v16;
      a1[4] = a2[4];
      *((unsigned char *)a1 + 80) = *((unsigned char *)a2 + 80);
      uint64_t v17 = *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = sub_25D15B360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
        memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
        __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
      }
      goto LABEL_25;
    case 2u:
      uint64_t v22 = sub_25D15B220();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v22 - 8) + 32))(a1, a2, v22);
      id v23 = (int *)type metadata accessor for MessageDraftSnippetModel();
      *(void *)((char *)a1 + v23[5]) = *(void *)((char *)a2 + v23[5]);
      uint64_t v24 = v23[6];
      uint64_t v25 = (char *)a1 + v24;
      uint64_t v26 = (char *)a2 + v24;
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
      *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
      *((unsigned char *)a1 + v23[8]) = *((unsigned char *)a2 + v23[8]);
      uint64_t v28 = v23[9];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      *((void *)v29 + 4) = *((void *)v30 + 4);
      long long v31 = *((_OWORD *)v30 + 1);
      *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
      *((_OWORD *)v29 + 1) = v31;
      uint64_t v32 = v23[10];
      uint64_t v33 = (char *)a1 + v32;
      uint64_t v34 = (char *)a2 + v32;
      v33[8] = v34[8];
      *(void *)uint64_t v33 = *(void *)v34;
      uint64_t v35 = v23[11];
      uint64_t v36 = (char *)a1 + v35;
      uint64_t v37 = (char *)a2 + v35;
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
      goto LABEL_25;
    case 3u:
      *a1 = *a2;
      uint64_t v39 = (int *)type metadata accessor for SentMessageSnippetModel();
      uint64_t v40 = v39[6];
      long long v41 = (char *)a1 + v40;
      long long v42 = (char *)a2 + v40;
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
      uint64_t v44 = v39[7];
      uint64_t v45 = (char *)a1 + v44;
      uint64_t v46 = (char *)a2 + v44;
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
      uint64_t v48 = v39[8];
      id v49 = (char *)a1 + v48;
      id v50 = (char *)a2 + v48;
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v49, v50, v51);
      goto LABEL_25;
    case 6u:
      uint64_t v52 = type metadata accessor for ButtonSnippetModel.Action(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(a1, a2, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        uint64_t v53 = sub_25D15B1C0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v53 - 8) + 32))(a1, a2, v53);
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v54 = type metadata accessor for ButtonSnippetModel(0);
      *(_OWORD *)((char *)a1 + *(int *)(v54 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v54 + 20));
LABEL_25:
      swift_storeEnumTagMultiPayload();
      return a1;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
  }
}

_OWORD *assignWithTake for MessagesUIPluginModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25D1545F4((uint64_t)a1, (void (*)(void))type metadata accessor for MessagesUIPluginModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        long long v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        uint64_t v7 = *(int *)(type metadata accessor for ConfirmationSnippetModel(0) + 24);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = type metadata accessor for ConfirmationSnippetModel.MessageType(0);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v55 = sub_25D15B1C0();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v55 - 8) + 32))(v8, v9, v55);
          uint64_t v56 = (int *)type metadata accessor for AudioMessagePlayer();
          v8[v56[5]] = v9[v56[5]];
          *(_OWORD *)&v8[v56[6]] = *(_OWORD *)&v9[v56[6]];
          *(_OWORD *)&v8[v56[7]] = *(_OWORD *)&v9[v56[7]];
LABEL_25:
          swift_storeEnumTagMultiPayload();
          goto LABEL_26;
        }
        if (EnumCaseMultiPayload)
        {
          memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
          goto LABEL_26;
        }
        uint64_t v12 = type metadata accessor for AttachmentModel();
        int v13 = swift_getEnumCaseMultiPayload();
        if (v13 == 1)
        {
          uint64_t v57 = sub_25D15B1C0();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v57 - 8) + 32))(v8, v9, v57);
          uint64_t v58 = type metadata accessor for MapAttachment();
          v8[*(int *)(v58 + 20)] = v9[*(int *)(v58 + 20)];
        }
        else
        {
          if (v13)
          {
            memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
            goto LABEL_24;
          }
          uint64_t v14 = sub_25D15B1C0();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32))(v8, v9, v14);
          uint64_t v15 = type metadata accessor for LinkAttachment();
          v8[*(int *)(v15 + 20)] = v9[*(int *)(v15 + 20)];
        }
        swift_storeEnumTagMultiPayload();
LABEL_24:
        uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661348);
        *(_OWORD *)&v8[*(int *)(v59 + 48)] = *(_OWORD *)&v9[*(int *)(v59 + 48)];
        goto LABEL_25;
      case 1u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        long long v16 = a2[3];
        a1[2] = a2[2];
        a1[3] = v16;
        a1[4] = a2[4];
        *((unsigned char *)a1 + 80) = *((unsigned char *)a2 + 80);
        uint64_t v17 = *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (char *)a2 + v17;
        uint64_t v20 = sub_25D15B360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
        {
          uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
          memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
          __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
        }
        goto LABEL_26;
      case 2u:
        uint64_t v22 = sub_25D15B220();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v22 - 8) + 32))(a1, a2, v22);
        id v23 = (int *)type metadata accessor for MessageDraftSnippetModel();
        *(void *)((char *)a1 + v23[5]) = *(void *)((char *)a2 + v23[5]);
        uint64_t v24 = v23[6];
        uint64_t v25 = (char *)a1 + v24;
        uint64_t v26 = (char *)a2 + v24;
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
        *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
        *((unsigned char *)a1 + v23[8]) = *((unsigned char *)a2 + v23[8]);
        uint64_t v28 = v23[9];
        uint64_t v29 = (char *)a1 + v28;
        uint64_t v30 = (char *)a2 + v28;
        *((void *)v29 + 4) = *((void *)v30 + 4);
        long long v31 = *((_OWORD *)v30 + 1);
        *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
        *((_OWORD *)v29 + 1) = v31;
        uint64_t v32 = v23[10];
        uint64_t v33 = (char *)a1 + v32;
        uint64_t v34 = (char *)a2 + v32;
        v33[8] = v34[8];
        *(void *)uint64_t v33 = *(void *)v34;
        uint64_t v35 = v23[11];
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = (char *)a2 + v35;
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
        goto LABEL_26;
      case 3u:
        *a1 = *a2;
        uint64_t v39 = (int *)type metadata accessor for SentMessageSnippetModel();
        uint64_t v40 = v39[6];
        long long v41 = (char *)a1 + v40;
        long long v42 = (char *)a2 + v40;
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607D8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
        uint64_t v44 = v39[7];
        uint64_t v45 = (char *)a1 + v44;
        uint64_t v46 = (char *)a2 + v44;
        uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
        uint64_t v48 = v39[8];
        id v49 = (char *)a1 + v48;
        id v50 = (char *)a2 + v48;
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6607E8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v49, v50, v51);
        goto LABEL_26;
      case 6u:
        uint64_t v52 = type metadata accessor for ButtonSnippetModel.Action(0);
        if (swift_getEnumCaseMultiPayload())
        {
          memcpy(a1, a2, *(void *)(*(void *)(v52 - 8) + 64));
        }
        else
        {
          uint64_t v53 = sub_25D15B1C0();
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v53 - 8) + 32))(a1, a2, v53);
          swift_storeEnumTagMultiPayload();
        }
        uint64_t v54 = type metadata accessor for ButtonSnippetModel(0);
        *(_OWORD *)((char *)a1 + *(int *)(v54 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v54 + 20));
LABEL_26:
        swift_storeEnumTagMultiPayload();
        return a1;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
    }
  }
  return a1;
}

uint64_t sub_25D1553EC()
{
  uint64_t result = type metadata accessor for ConfirmationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AutoSendableBinaryButton();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for MessageDraftSnippetModel();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for SentMessageSnippetModel();
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for ButtonSnippetModel(319);
          if (v5 <= 0x3F)
          {
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MessagesUIPluginModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x25D155644);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.CodingKeys()
{
  return &type metadata for MessagesUIPluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.ConfirmationSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.WatchAutosendButtonsSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.MessageDraftSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.SentMessageSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.AppDisambiguationSnippetModelCodingKeys;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.ConfirmationButtonSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.ConfirmationButtonSnippetModelCodingKeys;
}

unsigned char *_s18SiriMessagesCommon21MessagesUIPluginModelO34ConfirmationSnippetModelCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25D15577CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesUIPluginModel.ButtonSnippetModelCodingKeys()
{
  return &type metadata for MessagesUIPluginModel.ButtonSnippetModelCodingKeys;
}

unint64_t sub_25D1557B8()
{
  unint64_t result = qword_26A661938;
  if (!qword_26A661938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661938);
  }
  return result;
}

unint64_t sub_25D155808()
{
  unint64_t result = qword_26A661940;
  if (!qword_26A661940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661940);
  }
  return result;
}

unint64_t sub_25D155858()
{
  unint64_t result = qword_26A661948;
  if (!qword_26A661948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661948);
  }
  return result;
}

unint64_t sub_25D1558A8()
{
  unint64_t result = qword_26A661950;
  if (!qword_26A661950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661950);
  }
  return result;
}

unint64_t sub_25D1558F8()
{
  unint64_t result = qword_26A661958;
  if (!qword_26A661958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661958);
  }
  return result;
}

unint64_t sub_25D155948()
{
  unint64_t result = qword_26A661960;
  if (!qword_26A661960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661960);
  }
  return result;
}

unint64_t sub_25D155998()
{
  unint64_t result = qword_26A661968;
  if (!qword_26A661968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661968);
  }
  return result;
}

unint64_t sub_25D1559E8()
{
  unint64_t result = qword_26A661970;
  if (!qword_26A661970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661970);
  }
  return result;
}

unint64_t sub_25D155A38()
{
  unint64_t result = qword_26A661978;
  if (!qword_26A661978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661978);
  }
  return result;
}

unint64_t sub_25D155A88()
{
  unint64_t result = qword_26A661980;
  if (!qword_26A661980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661980);
  }
  return result;
}

unint64_t sub_25D155AD8()
{
  unint64_t result = qword_26A661988;
  if (!qword_26A661988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661988);
  }
  return result;
}

unint64_t sub_25D155B28()
{
  unint64_t result = qword_26A661990;
  if (!qword_26A661990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661990);
  }
  return result;
}

unint64_t sub_25D155B78()
{
  unint64_t result = qword_26A661998;
  if (!qword_26A661998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661998);
  }
  return result;
}

unint64_t sub_25D155BC8()
{
  unint64_t result = qword_26A6619A0;
  if (!qword_26A6619A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619A0);
  }
  return result;
}

unint64_t sub_25D155C18()
{
  unint64_t result = qword_26A6619A8;
  if (!qword_26A6619A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619A8);
  }
  return result;
}

unint64_t sub_25D155C68()
{
  unint64_t result = qword_26A6619B0;
  if (!qword_26A6619B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619B0);
  }
  return result;
}

unint64_t sub_25D155CB8()
{
  unint64_t result = qword_26A6619B8;
  if (!qword_26A6619B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619B8);
  }
  return result;
}

unint64_t sub_25D155D08()
{
  unint64_t result = qword_26A6619C0;
  if (!qword_26A6619C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619C0);
  }
  return result;
}

unint64_t sub_25D155D58()
{
  unint64_t result = qword_26A6619C8;
  if (!qword_26A6619C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619C8);
  }
  return result;
}

unint64_t sub_25D155DA8()
{
  unint64_t result = qword_26A6619D0;
  if (!qword_26A6619D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619D0);
  }
  return result;
}

unint64_t sub_25D155DF8()
{
  unint64_t result = qword_26A6619D8;
  if (!qword_26A6619D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619D8);
  }
  return result;
}

unint64_t sub_25D155E48()
{
  unint64_t result = qword_26A6619E0;
  if (!qword_26A6619E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619E0);
  }
  return result;
}

unint64_t sub_25D155E98()
{
  unint64_t result = qword_26A6619E8;
  if (!qword_26A6619E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619E8);
  }
  return result;
}

unint64_t sub_25D155EE8()
{
  unint64_t result = qword_26A6619F0;
  if (!qword_26A6619F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6619F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_14()
{
  return sub_25D15B780();
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  return sub_25D15B820();
}

void OUTLINED_FUNCTION_8_9(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return v0;
}

void OUTLINED_FUNCTION_11_4()
{
  *(void *)(v1 - 256) = v0;
}

void OUTLINED_FUNCTION_12_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_13_3@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_25D15B820();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_25D15B7F0();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_25D15B7F0();
}

uint64_t LinkAttachment.init(url:isDraft:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a3, a1);
  uint64_t result = type metadata accessor for LinkAttachment();
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for LinkAttachment()
{
  uint64_t result = qword_26A661A10;
  if (!qword_26A661A10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LinkAttachment.url.getter@<X0>(uint64_t a1@<X8>)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t LinkAttachment.url.setter(uint64_t a1)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v1, a1, v3);
}

uint64_t (*LinkAttachment.url.modify())()
{
  return nullsub_1;
}

uint64_t LinkAttachment.isDraft.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for LinkAttachment() + 20));
}

uint64_t LinkAttachment.isDraft.setter(char a1)
{
  uint64_t result = type metadata accessor for LinkAttachment();
  *(unsigned char *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*LinkAttachment.isDraft.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D1562AC(uint64_t a1)
{
  unint64_t v2 = sub_25D1564A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1562E8(uint64_t a1)
{
  unint64_t v2 = sub_25D1564A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LinkAttachment.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6619F8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1564A8();
  sub_25D15B9D0();
  sub_25D15B1C0();
  sub_25D1568D8(&qword_26A660B30, MEMORY[0x263F06EA8]);
  sub_25D15B880();
  if (!v1)
  {
    type metadata accessor for LinkAttachment();
    sub_25D15B860();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_25D1564A8()
{
  unint64_t result = qword_26A661A00;
  if (!qword_26A661A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A00);
  }
  return result;
}

uint64_t LinkAttachment.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v5;
  uint64_t v21 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661A08);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = type metadata accessor for LinkAttachment();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_0();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D1564A8();
  sub_25D15B9B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_25D1568D8(&qword_26A660B40, MEMORY[0x263F06EA8]);
  sub_25D15B7F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v14, v8, v21);
  char v15 = sub_25D15B7D0();
  uint64_t v16 = OUTLINED_FUNCTION_4_3();
  v17(v16);
  *(unsigned char *)(v14 + *(int *)(v10 + 20)) = v15 & 1;
  sub_25D15678C(v14, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_25D1567F0(v14);
}

uint64_t sub_25D15678C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LinkAttachment();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D1567F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LinkAttachment();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D156854(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_25D1568D8(&qword_26A6609A8, (void (*)(uint64_t))type metadata accessor for LinkAttachment);
  uint64_t result = sub_25D1568D8(&qword_26A660958, (void (*)(uint64_t))type metadata accessor for LinkAttachment);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_25D1568D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25D156920@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LinkAttachment.init(from:)(a1, a2);
}

uint64_t sub_25D156938(void *a1)
{
  return LinkAttachment.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D156964);
}

uint64_t sub_25D156964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for LinkAttachment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D156A14);
}

void sub_25D156A14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25D15B1C0();
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
}

uint64_t sub_25D156A9C()
{
  uint64_t result = sub_25D15B1C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LinkAttachment.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D156BFCLL);
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

ValueMetadata *type metadata accessor for LinkAttachment.CodingKeys()
{
  return &type metadata for LinkAttachment.CodingKeys;
}

unint64_t sub_25D156C38()
{
  unint64_t result = qword_26A661A20;
  if (!qword_26A661A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A20);
  }
  return result;
}

unint64_t sub_25D156C88()
{
  unint64_t result = qword_26A661A28;
  if (!qword_26A661A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A28);
  }
  return result;
}

unint64_t sub_25D156CD8()
{
  unint64_t result = qword_26A661A30;
  if (!qword_26A661A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A30);
  }
  return result;
}

uint64_t dispatch thunk of CATSerializable.serializedData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t RecipientLabel.init(contactName:appBundleIdentifiers:launchAppWithIntent:selectedAppIdentifier:unlockDevice:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = qword_26A660F30;
  uint64_t v15 = qword_26A660F38;
  uint64_t v17 = qword_26A660F00;
  uint64_t v18 = qword_26A660F08;
  uint64_t v19 = qword_26A660EA0;
  uint64_t v20 = qword_26A660EA8;
  uint64_t v21 = qword_26A660EC0;
  uint64_t v22 = qword_26A660EC8;
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  a8[7] = v16;
  a8[8] = v15;
  a8[9] = v17;
  a8[10] = v18;
  a8[11] = v19;
  a8[12] = v20;
  a8[13] = v21;
  a8[14] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void RecipientLabel.launchAppWithIntent.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

void RecipientLabel.unlockDevice.setter(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
}

uint64_t RecipientLabel.contactName.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t RecipientLabel.contactName.setter()
{
  OUTLINED_FUNCTION_6_11();
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*RecipientLabel.contactName.modify())()
{
  return nullsub_1;
}

uint64_t RecipientLabel.appBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RecipientLabel.appBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*RecipientLabel.appBundleIdentifiers.modify())()
{
  return nullsub_1;
}

void *RecipientLabel.launchAppWithIntent.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void sub_25D156FA0(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  RecipientLabel.launchAppWithIntent.setter((uint64_t)v1);
}

void (*RecipientLabel.launchAppWithIntent.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117C98;
}

uint64_t RecipientLabel.selectedAppIdentifier.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t RecipientLabel.selectedAppIdentifier.setter()
{
  OUTLINED_FUNCTION_6_11();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*RecipientLabel.selectedAppIdentifier.modify())()
{
  return nullsub_1;
}

void *RecipientLabel.unlockDevice.getter()
{
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = v1;
  return v1;
}

uint64_t sub_25D1570C4@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void sub_25D157138(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  RecipientLabel.unlockDevice.setter((uint64_t)v1);
}

void (*RecipientLabel.unlockDevice.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 48);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D1571B4;
}

void sub_25D1571B4(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned int v4 = *(void **)(v2 + 48);
  if (a2)
  {
    id v5 = v3;

    *(void *)(v2 + 48) = v3;
  }
  else
  {

    *(void *)(v2 + 48) = v3;
  }
}

uint64_t RecipientLabel.toLabelText.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t RecipientLabel.toLabelText.setter()
{
  OUTLINED_FUNCTION_6_11();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = v0;
  return result;
}

uint64_t (*RecipientLabel.toLabelText.modify())()
{
  return nullsub_1;
}

uint64_t RecipientLabel.changeContactLabelText.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t RecipientLabel.changeContactLabelText.setter()
{
  OUTLINED_FUNCTION_6_11();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = v2;
  *(void *)(v1 + 80) = v0;
  return result;
}

uint64_t (*RecipientLabel.changeContactLabelText.modify())()
{
  return nullsub_1;
}

uint64_t RecipientLabel.cancelButtonText.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t RecipientLabel.cancelButtonText.setter()
{
  OUTLINED_FUNCTION_6_11();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 88) = v2;
  *(void *)(v1 + 96) = v0;
  return result;
}

uint64_t (*RecipientLabel.cancelButtonText.modify())()
{
  return nullsub_1;
}

uint64_t RecipientLabel.doneButtonText.getter()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t RecipientLabel.doneButtonText.setter()
{
  OUTLINED_FUNCTION_6_11();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 104) = v2;
  *(void *)(v1 + 112) = v0;
  return result;
}

uint64_t (*RecipientLabel.doneButtonText.modify())()
{
  return nullsub_1;
}

uint64_t sub_25D15742C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025D1634E0 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025D163030 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025D1638A0 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    BOOL v6 = a1 == 0x65446B636F6C6E75 && a2 == 0xEC00000065636976;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      BOOL v7 = a1 == 0x546C6562614C6F74 && a2 == 0xEB00000000747865;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else if (a1 == 0xD000000000000016 && a2 == 0x800000025D1638C0 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000025D1638E0 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 7;
      }
      else if (a1 == 0x74747542656E6F64 && a2 == 0xEE00747865546E6FLL)
      {
        swift_bridgeObjectRelease();
        return 8;
      }
      else
      {
        char v9 = sub_25D15B8C0();
        swift_bridgeObjectRelease();
        if (v9) {
          return 8;
        }
        else {
          return 9;
        }
      }
    }
  }
}

uint64_t sub_25D1577CC()
{
  return 9;
}

unint64_t sub_25D1577D4(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0x65446B636F6C6E75;
      break;
    case 5:
      unint64_t result = 0x546C6562614C6F74;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 7:
      unint64_t result = 0xD000000000000010;
      break;
    case 8:
      unint64_t result = 0x74747542656E6F64;
      break;
    default:
      unint64_t result = 0x4E746361746E6F63;
      break;
  }
  return result;
}

unint64_t sub_25D157914()
{
  return sub_25D1577D4(*v0);
}

uint64_t sub_25D15791C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D15742C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D157944@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25D1577CC();
  *a1 = result;
  return result;
}

uint64_t sub_25D15796C(uint64_t a1)
{
  unint64_t v2 = sub_25D157D00();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D1579A8(uint64_t a1)
{
  unint64_t v2 = sub_25D157D00();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RecipientLabel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661A38);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1[2];
  uint64_t v23 = v1[3];
  uint64_t v24 = v9;
  uint64_t v10 = v1[4];
  uint64_t v21 = v1[5];
  uint64_t v22 = v10;
  uint64_t v11 = v1[6];
  uint64_t v12 = v1[7];
  v19[8] = v1[8];
  uint64_t v20 = v11;
  uint64_t v13 = v1[9];
  v19[6] = v1[10];
  v19[7] = v12;
  uint64_t v14 = v1[11];
  v19[4] = v1[12];
  v19[5] = v13;
  v19[2] = v1[13];
  v19[3] = v14;
  v19[1] = v1[14];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D157D00();
  sub_25D15B9D0();
  LOBYTE(v27) = 0;
  uint64_t v15 = v25;
  sub_25D15B850();
  if (v15) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  }
  uint64_t v16 = v23;
  uint64_t v17 = v20;
  uint64_t v27 = v24;
  char v26 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6610A8);
  sub_25D149564(&qword_26A6610B0);
  sub_25D15B880();
  uint64_t v27 = v16;
  char v26 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660CF0);
  sub_25D119038(&qword_26A660CF8, &qword_26A660CF0);
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_8_10(3);
  OUTLINED_FUNCTION_9_6();
  uint64_t v27 = v17;
  char v26 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661A48);
  sub_25D119038(&qword_26A661A50, &qword_26A661A48);
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_8_10(5);
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_8_10(6);
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_8_10(7);
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_8_10(8);
  OUTLINED_FUNCTION_9_6();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_25D157D00()
{
  unint64_t result = qword_26A661A40;
  if (!qword_26A661A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A40);
  }
  return result;
}

void RecipientLabel.init(from:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v57 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661A58);
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v5;
  uint64_t v59 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v8 = qword_26A660F38;
  uint64_t v9 = qword_26A660F08;
  uint64_t v10 = qword_26A660EA8;
  uint64_t v11 = qword_26A660EC8;
  uint64_t v12 = a1[3];
  uint64_t v64 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_25D157D00();
  uint64_t v63 = v8;
  swift_bridgeObjectRetain();
  uint64_t v60 = v9;
  swift_bridgeObjectRetain();
  uint64_t v61 = v10;
  swift_bridgeObjectRetain();
  uint64_t v62 = v11;
  swift_bridgeObjectRetain();
  sub_25D15B9B0();
  if (v2)
  {
    unsigned int v13 = 500;
    uint64_t v14 = (uint64_t)v64;
    goto LABEL_9;
  }
  uint64_t v15 = v7;
  LOBYTE(v66) = 0;
  uint64_t v16 = sub_25D15B7C0();
  uint64_t v14 = (uint64_t)v64;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6610A8);
  char v65 = 1;
  uint64_t v20 = sub_25D149564(&qword_26A6610C0);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_15();
  if (v20)
  {
    OUTLINED_FUNCTION_1_20();
    v21();
    swift_bridgeObjectRelease();
    unsigned int v13 = 501;
    goto LABEL_9;
  }
  uint64_t v22 = (uint64_t)v66;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A660CF0);
  char v65 = 2;
  uint64_t v23 = sub_25D119038(&qword_26A660D08, &qword_26A660CF0);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_15();
  uint64_t v56 = v22;
  if (v23)
  {
    OUTLINED_FUNCTION_1_20();
    v24();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unsigned int v13 = 503;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1(v14);
    if (v13)
    {
      swift_bridgeObjectRelease();
      if (((v13 >> 1) & 1) == 0)
      {

        goto LABEL_15;
      }
    }
    else if ((v13 & 2) == 0)
    {
LABEL_15:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    swift_bridgeObjectRelease();

    goto LABEL_15;
  }
  uint64_t v54 = v17;
  uint64_t v25 = v66;
  LOBYTE(v66) = 3;
  id v26 = v25;
  uint64_t v27 = sub_25D15B7C0();
  uint64_t v55 = v28;
  uint64_t v51 = v27;
  id v52 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661A48);
  char v65 = 4;
  sub_25D119038(&qword_26A661A60, &qword_26A661A48);
  swift_bridgeObjectRetain();
  uint64_t v53 = v15;
  sub_25D15B7F0();
  uint64_t v29 = v66;
  LOBYTE(v66) = 5;
  id v50 = v29;
  uint64_t v30 = OUTLINED_FUNCTION_3_12();
  uint64_t v32 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  LOBYTE(v66) = 6;
  uint64_t v49 = OUTLINED_FUNCTION_3_12();
  uint64_t v63 = v30;
  uint64_t v34 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  LOBYTE(v66) = 7;
  uint64_t v48 = OUTLINED_FUNCTION_3_12();
  uint64_t v60 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  LOBYTE(v66) = 8;
  uint64_t v61 = OUTLINED_FUNCTION_3_12();
  uint64_t v37 = v36;
  uint64_t v38 = OUTLINED_FUNCTION_0_10();
  v39(v38);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = v56;
  uint64_t v40 = v57;
  *uint64_t v57 = v54;
  v40[1] = v19;
  v40[2] = v41;
  v40[3] = (uint64_t)v25;
  uint64_t v42 = v55;
  v40[4] = v51;
  v40[5] = v42;
  uint64_t v44 = v63;
  uint64_t v43 = (uint64_t)v64;
  v40[6] = (uint64_t)v29;
  v40[7] = v44;
  uint64_t v45 = v49;
  v40[8] = v32;
  v40[9] = v45;
  uint64_t v46 = v48;
  v40[10] = v34;
  v40[11] = v46;
  uint64_t v47 = v61;
  v40[12] = v60;
  v40[13] = v47;
  v40[14] = v37;
  __swift_destroy_boxed_opaque_existential_1(v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_25D15847C(void *a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_25D158494(void *a1)
{
  return RecipientLabel.encode(to:)(a1);
}

uint64_t sub_25D1584AC@<X0>(uint64_t *a1@<X8>)
{
  return sub_25D1570C4((uint64_t (*)(void))RecipientLabel.launchAppWithIntent.getter, a1);
}

uint64_t sub_25D1584DC@<X0>(uint64_t *a1@<X8>)
{
  return sub_25D1570C4((uint64_t (*)(void))RecipientLabel.unlockDevice.getter, a1);
}

uint64_t destroy for RecipientLabel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RecipientLabel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v7 = (void *)a2[6];
  uint64_t v6 = a2[7];
  a1[6] = v7;
  a1[7] = v6;
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v4;
  swift_bridgeObjectRetain();
  id v12 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RecipientLabel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[3];
  uint64_t v5 = (void *)a2[3];
  a1[3] = v5;
  id v6 = v5;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[6];
  uint64_t v8 = (void *)a2[6];
  a1[6] = v8;
  id v9 = v8;

  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for RecipientLabel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RecipientLabel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 120))
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

uint64_t storeEnumTagSinglePayload for RecipientLabel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RecipientLabel()
{
  return &type metadata for RecipientLabel;
}

uint64_t getEnumTagSinglePayload for RecipientLabel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RecipientLabel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25D158A30);
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

ValueMetadata *type metadata accessor for RecipientLabel.CodingKeys()
{
  return &type metadata for RecipientLabel.CodingKeys;
}

unint64_t sub_25D158A6C()
{
  unint64_t result = qword_26A661A68;
  if (!qword_26A661A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A68);
  }
  return result;
}

unint64_t sub_25D158ABC()
{
  unint64_t result = qword_26A661A70;
  if (!qword_26A661A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A70);
  }
  return result;
}

unint64_t sub_25D158B0C()
{
  unint64_t result = qword_26A661A78;
  if (!qword_26A661A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A78);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  return *(void *)(v0 - 216);
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return sub_25D15B7C0();
}

uint64_t OUTLINED_FUNCTION_4_15()
{
  return sub_25D15B7F0();
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  return sub_25D15B880();
}

void OUTLINED_FUNCTION_8_10(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return sub_25D15B850();
}

uint64_t AutoSendableBinaryButton.init(shouldAutoSend:autoSendTimeout:delayedActionCancelCommand:handleIntent:speechSynthesisId:isFirstPartyApp:responseMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v17 = qword_26A660E88;
  *(void *)(a8 + 48) = qword_26A660E80;
  *(void *)(a8 + 56) = v17;
  uint64_t v18 = qword_26A660EA8;
  *(void *)(a8 + 64) = qword_26A660EA0;
  *(void *)(a8 + 72) = v18;
  uint64_t v19 = a8 + *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);
  uint64_t v20 = sub_25D15B360();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *(unsigned char *)a8 = a1 & 1;
  *(double *)(a8 + 8) = a9;
  *(void *)(a8 + 16) = a2;
  *(void *)(a8 + 24) = a3;
  *(void *)(a8 + 32) = a4;
  *(void *)(a8 + 40) = a5;
  *(unsigned char *)(a8 + 80) = a6 & 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_25D118D9C(a7, v19);
}

uint64_t type metadata accessor for AutoSendableBinaryButton()
{
  uint64_t result = qword_26A661AA0;
  if (!qword_26A661AA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void AutoSendableBinaryButton.delayedActionCancelCommand.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

void AutoSendableBinaryButton.handleIntent.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t AutoSendableBinaryButton.shouldAutoSend.getter()
{
  return *v0;
}

uint64_t AutoSendableBinaryButton.shouldAutoSend.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*AutoSendableBinaryButton.shouldAutoSend.modify())()
{
  return nullsub_1;
}

double AutoSendableBinaryButton.autoSendTimeout.getter()
{
  return *(double *)(v0 + 8);
}

void AutoSendableBinaryButton.autoSendTimeout.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*AutoSendableBinaryButton.autoSendTimeout.modify())()
{
  return nullsub_1;
}

void *AutoSendableBinaryButton.delayedActionCancelCommand.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void sub_25D158E80(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  AutoSendableBinaryButton.delayedActionCancelCommand.setter((uint64_t)v1);
}

void (*AutoSendableBinaryButton.delayedActionCancelCommand.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 16);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117B7C;
}

void *AutoSendableBinaryButton.handleIntent.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void sub_25D158F24(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  AutoSendableBinaryButton.handleIntent.setter((uint64_t)v1);
}

void (*AutoSendableBinaryButton.handleIntent.modify(void *a1))(uint64_t a1, char a2)
{
  id v2 = *(void **)(v1 + 24);
  *a1 = v2;
  a1[1] = v1;
  id v3 = v2;
  return sub_25D117C98;
}

uint64_t AutoSendableBinaryButton.speechSynthesisId.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoSendableBinaryButton.speechSynthesisId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AutoSendableBinaryButton.speechSynthesisId.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.sendLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoSendableBinaryButton.sendLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AutoSendableBinaryButton.sendLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.cancelLabelText.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoSendableBinaryButton.cancelLabelText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*AutoSendableBinaryButton.cancelLabelText.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.isFirstPartyApp.getter()
{
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t AutoSendableBinaryButton.isFirstPartyApp.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 80) = result;
  return result;
}

uint64_t (*AutoSendableBinaryButton.isFirstPartyApp.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.responseMode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);

  return sub_25D118E48(v3, a1);
}

uint64_t AutoSendableBinaryButton.responseMode.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AutoSendableBinaryButton() + 48);

  return sub_25D118D9C(a1, v3);
}

uint64_t (*AutoSendableBinaryButton.responseMode.modify())()
{
  return nullsub_1;
}

uint64_t AutoSendableBinaryButton.description.getter()
{
  return 0;
}

uint64_t sub_25D159358(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7541646C756F6873 && a2 == 0xEE00646E65536F74;
  if (v3 || (sub_25D15B8C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x646E65536F747561 && a2 == 0xEF74756F656D6954;
    if (v6 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x800000025D162B40 || (sub_25D15B8C0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x6E49656C646E6168 && a2 == 0xEC000000746E6574;
      if (v7 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x800000025D162B60 || (sub_25D15B8C0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        BOOL v8 = a1 == 0x6562614C646E6573 && a2 == 0xED0000747865546CLL;
        if (v8 || (sub_25D15B8C0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 0x614C6C65636E6163 && a2 == 0xEF747865546C6562;
          if (v9 || (sub_25D15B8C0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            BOOL v10 = a1 == 0x5074737269467369 && a2 == 0xEF70704179747261;
            if (v10 || (sub_25D15B8C0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else if (a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              char v12 = sub_25D15B8C0();
              swift_bridgeObjectRelease();
              if (v12) {
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

unint64_t sub_25D15974C(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x646E65536F747561;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6E49656C646E6168;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0x6562614C646E6573;
      break;
    case 6:
      unint64_t result = 0x614C6C65636E6163;
      break;
    case 7:
      unint64_t result = 0x5074737269467369;
      break;
    case 8:
      unint64_t result = 0x65736E6F70736572;
      break;
    default:
      unint64_t result = 0x7541646C756F6873;
      break;
  }
  return result;
}

unint64_t sub_25D1598C4()
{
  return sub_25D15974C(*v0);
}

uint64_t sub_25D1598CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25D159358(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25D1598F4(uint64_t a1)
{
  unint64_t v2 = sub_25D159C14();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25D159930(uint64_t a1)
{
  unint64_t v2 = sub_25D159C14();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AutoSendableBinaryButton.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A661A80);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D159C14();
  sub_25D15B9D0();
  OUTLINED_FUNCTION_7();
  if (!v1)
  {
    sub_25D15B870();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660738);
    sub_25D119038(&qword_26A660740, &qword_26A660738);
    OUTLINED_FUNCTION_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660748);
    sub_25D119038(&qword_26A660750, &qword_26A660748);
    OUTLINED_FUNCTION_1();
    sub_25D15B830();
    OUTLINED_FUNCTION_4_16(5);
    OUTLINED_FUNCTION_4_16(6);
    OUTLINED_FUNCTION_7();
    type metadata accessor for AutoSendableBinaryButton();
    sub_25D15B360();
    sub_25D15A324(&qword_26A660758, MEMORY[0x263F75718]);
    sub_25D15B840();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_25D159C14()
{
  unint64_t result = qword_26A661A88;
  if (!qword_26A661A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661A88);
  }
  return result;
}

uint64_t AutoSendableBinaryButton.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v33 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A661A90);
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v7;
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v6);
  BOOL v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AutoSendableBinaryButton();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_4();
  *(_OWORD *)(v2 + 16) = 0u;
  uint64_t v34 = (void *)(v2 + 16);
  *(_OWORD *)(v2 + 32) = 0u;
  if (qword_26A6606F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_26A660E88;
  *(void *)(v2 + 48) = qword_26A660E80;
  *(void *)(v2 + 56) = v11;
  uint64_t v12 = qword_26A660EA8;
  *(void *)(v2 + 64) = qword_26A660EA0;
  *(void *)(v2 + 72) = v12;
  uint64_t v13 = v2 + *(int *)(v10 + 48);
  uint64_t v14 = sub_25D15B360();
  uint64_t v37 = v13;
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25D159C14();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = v38;
  sub_25D15B9B0();
  if (v15)
  {
    uint64_t v17 = v37;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_25D118FD8(v17);
  }
  else
  {
    uint64_t v38 = v11;
    v31[1] = v14;
    v31[2] = v12;
    LOBYTE(v40) = 0;
    uint64_t v16 = v36;
    *(unsigned char *)uint64_t v2 = sub_25D15B7D0() & 1;
    LOBYTE(v40) = 1;
    sub_25D15B7E0();
    *(void *)(v2 + 8) = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660738);
    uint64_t v20 = v9;
    uint64_t v21 = v16;
    char v39 = 2;
    sub_25D119038(&qword_26A660768, &qword_26A660738);
    OUTLINED_FUNCTION_1_21();
    *uint64_t v34 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A660748);
    char v39 = 3;
    sub_25D119038(&qword_26A660770, &qword_26A660748);
    OUTLINED_FUNCTION_1_21();
    *(void *)(v2 + 24) = v40;
    OUTLINED_FUNCTION_6_12(4);
    *(void *)(v2 + 32) = sub_25D15B7A0();
    *(void *)(v2 + 40) = v22;
    OUTLINED_FUNCTION_6_12(5);
    uint64_t v23 = v20;
    uint64_t v24 = sub_25D15B7C0();
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    *(void *)(v2 + 48) = v24;
    *(void *)(v2 + 56) = v26;
    OUTLINED_FUNCTION_5_12(6);
    uint64_t v27 = sub_25D15B7C0();
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    *(void *)(v2 + 64) = v27;
    *(void *)(v2 + 72) = v29;
    OUTLINED_FUNCTION_5_12(7);
    *(unsigned char *)(v2 + 80) = sub_25D15B7D0() & 1;
    LOBYTE(v40) = 8;
    sub_25D15A324(&qword_26A660778, MEMORY[0x263F75718]);
    uint64_t v30 = (uint64_t)v33;
    sub_25D15B7B0();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v23, v21);
    sub_25D118D9C(v30, v37);
    sub_25D15A15C(v2, v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25D15A1C0(v2);
  }
}

uint64_t sub_25D15A15C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutoSendableBinaryButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25D15A1C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AutoSendableBinaryButton();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25D15A238(uint64_t a1)
{
  uint64_t result = sub_25D15A324(&qword_26A661A98, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25D15A294()
{
  return sub_25D15A324(&qword_26A661140, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
}

uint64_t sub_25D15A2DC()
{
  return sub_25D15A324(&qword_26A661130, (void (*)(uint64_t))type metadata accessor for AutoSendableBinaryButton);
}

uint64_t sub_25D15A324(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25D15A36C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AutoSendableBinaryButton.init(from:)(a1, a2);
}

uint64_t sub_25D15A384(void *a1)
{
  return AutoSendableBinaryButton.encode(to:)(a1);
}

void *sub_25D15A39C@<X0>(void *a1@<X8>)
{
  uint64_t result = AutoSendableBinaryButton.delayedActionCancelCommand.getter();
  *a1 = result;
  return result;
}

void *sub_25D15A3CC@<X0>(void *a1@<X8>)
{
  uint64_t result = AutoSendableBinaryButton.handleIntent.getter();
  *a1 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for AutoSendableBinaryButton(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  BOOL v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *BOOL v3 = *a2;
    BOOL v3 = (void *)(v17 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = (void *)a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v5;
    uint64_t v7 = (void *)a2[3];
    uint64_t v6 = a2[4];
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v6;
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    uint64_t v9 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 72) = a2[9];
    uint64_t v10 = *(int *)(a3 + 48);
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = (void *)(a1 + v10);
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    uint64_t v13 = sub_25D15B360();
    id v14 = v5;
    id v15 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
      memcpy(v12, v11, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v12, v11, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v13);
    }
  }
  return v3;
}

uint64_t destroy for AutoSendableBinaryButton(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = sub_25D15B360();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v9 = *(int *)(a3 + 48);
  uint64_t v10 = (const void *)(a2 + v9);
  uint64_t v11 = (void *)(a1 + v9);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v12 = sub_25D15B360();
  id v13 = v4;
  id v14 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v11, v10, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 16))(v11, v10, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v12);
  }
  return a1;
}

uint64_t assignWithCopy for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v7 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v7;
  id v8 = v7;

  uint64_t v9 = *(void **)(a1 + 24);
  uint64_t v10 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v10;
  id v11 = v10;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v12 = *(int *)(a3 + 48);
  id v13 = (void *)(a1 + v12);
  id v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_25D15B360();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  int v17 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!EnumTagSinglePayload)
  {
    uint64_t v18 = *(void *)(v15 - 8);
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

uint64_t initializeWithTake for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(int *)(a3 + 48);
  uint64_t v6 = (const void *)(a2 + v5);
  uint64_t v7 = (void *)(a1 + v5);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v8 = sub_25D15B360();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v7, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v11 = *(int *)(a3 + 48);
  uint64_t v12 = (void *)(a1 + v11);
  id v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_25D15B360();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v14);
  int v16 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14);
  if (!EnumTagSinglePayload)
  {
    uint64_t v17 = *(void *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(v17 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25D15AC64);
}

uint64_t sub_25D15AC64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    uint64_t v9 = a1 + *(int *)(a3 + 48);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AutoSendableBinaryButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25D15AD04);
}

uint64_t sub_25D15AD04(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 56) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A660720);
    uint64_t v8 = v5 + *(int *)(a4 + 48);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_25D15AD88()
{
  sub_25D119CD8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for AutoSendableBinaryButton.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x25D15AF1CLL);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoSendableBinaryButton.CodingKeys()
{
  return &type metadata for AutoSendableBinaryButton.CodingKeys;
}

unint64_t sub_25D15AF58()
{
  unint64_t result = qword_26A661AB0;
  if (!qword_26A661AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661AB0);
  }
  return result;
}

unint64_t sub_25D15AFA8()
{
  unint64_t result = qword_26A661AB8;
  if (!qword_26A661AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661AB8);
  }
  return result;
}

unint64_t sub_25D15AFF8()
{
  unint64_t result = qword_26A661AC0;
  if (!qword_26A661AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A661AC0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  return sub_25D15B7F0();
}

uint64_t OUTLINED_FUNCTION_4_16@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return sub_25D15B850();
}

uint64_t OUTLINED_FUNCTION_5_12@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t OUTLINED_FUNCTION_6_12@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_25D15B0C0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25D15B0D0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25D15B0E0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25D15B0F0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25D15B100()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25D15B110()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25D15B120()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25D15B130()
{
  return MEMORY[0x270EEFBF0]();
}

uint64_t sub_25D15B140()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25D15B150()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25D15B160()
{
  return MEMORY[0x270EEFD68]();
}

uint64_t sub_25D15B170()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25D15B180()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_25D15B190()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25D15B1A0()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_25D15B1B0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25D15B1C0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25D15B1D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25D15B1E0()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_25D15B1F0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25D15B200()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25D15B210()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25D15B220()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25D15B230()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_25D15B240()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25D15B250()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_25D15B260()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_25D15B270()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_25D15B280()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_25D15B290()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_25D15B2A0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25D15B2B0()
{
  return MEMORY[0x270F73A38]();
}

uint64_t sub_25D15B2C0()
{
  return MEMORY[0x270F74E00]();
}

uint64_t sub_25D15B2D0()
{
  return MEMORY[0x270F74E08]();
}

uint64_t sub_25D15B2E0()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_25D15B2F0()
{
  return MEMORY[0x270F756A8]();
}

uint64_t sub_25D15B300()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_25D15B310()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_25D15B320()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_25D15B330()
{
  return MEMORY[0x270F72A48]();
}

uint64_t sub_25D15B340()
{
  return MEMORY[0x270F72A58]();
}

uint64_t sub_25D15B350()
{
  return MEMORY[0x270F72A68]();
}

uint64_t sub_25D15B360()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_25D15B370()
{
  return MEMORY[0x270F0CA30]();
}

uint64_t sub_25D15B390()
{
  return MEMORY[0x270F0CB20]();
}

uint64_t sub_25D15B3A0()
{
  return MEMORY[0x270F0CB38]();
}

uint64_t sub_25D15B3B0()
{
  return MEMORY[0x270F0CB48]();
}

uint64_t sub_25D15B3C0()
{
  return MEMORY[0x270F0CB50]();
}

uint64_t sub_25D15B3D0()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_25D15B3E0()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_25D15B3F0()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_25D15B400()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25D15B410()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_25D15B420()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25D15B430()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25D15B440()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25D15B450()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25D15B460()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25D15B470()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25D15B480()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_25D15B490()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25D15B4A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25D15B4B0()
{
  return MEMORY[0x270F757E0]();
}

uint64_t sub_25D15B4C0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25D15B4D0()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_25D15B4E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25D15B4F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25D15B500()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25D15B510()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25D15B520()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25D15B530()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25D15B540()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25D15B550()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25D15B560()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25D15B570()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25D15B580()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25D15B590()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25D15B5A0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25D15B5B0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25D15B5C0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25D15B5D0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25D15B5E0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25D15B5F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25D15B600()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25D15B610()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_25D15B620()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25D15B630()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25D15B640()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25D15B650()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25D15B660()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25D15B670()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25D15B680()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25D15B690()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25D15B6A0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25D15B6B0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25D15B6C0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25D15B6D0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25D15B6E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25D15B6F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25D15B700()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25D15B710()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25D15B720()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25D15B730()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25D15B740()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25D15B750()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25D15B760()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25D15B770()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25D15B780()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25D15B790()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25D15B7A0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25D15B7B0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25D15B7C0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25D15B7D0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25D15B7E0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25D15B7F0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25D15B800()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25D15B810()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25D15B820()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25D15B830()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25D15B840()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25D15B850()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25D15B860()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25D15B870()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25D15B880()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25D15B890()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25D15B8A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25D15B8B0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25D15B8C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25D15B8D0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_25D15B8E0()
{
  return MEMORY[0x270F9F858]();
}

uint64_t sub_25D15B8F0()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_25D15B900()
{
  return MEMORY[0x270F9F8F0]();
}

uint64_t sub_25D15B910()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25D15B920()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25D15B930()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25D15B940()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25D15B950()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25D15B960()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25D15B970()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25D15B980()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25D15B990()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25D15B9A0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_25D15B9B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25D15B9C0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_25D15B9D0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25D15BA00()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x270F0EEB8]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x270EF51E0]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x270EF51F8]();
}

uint64_t INIntentSchemaGetIntentResponseDescriptionWithFacadeClass()
{
  return MEMORY[0x270EF5218]();
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

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}