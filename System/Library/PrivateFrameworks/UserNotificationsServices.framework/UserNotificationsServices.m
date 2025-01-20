void sub_260AFA264(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_260AFA348(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id UNSLogImageProvider()
{
  if (UNSLogImageProvider_onceToken != -1) {
    dispatch_once(&UNSLogImageProvider_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)UNSLogImageProvider___logger;

  return v0;
}

uint64_t __UNSLogImageProvider_block_invoke()
{
  UNSLogImageProvider___logger = (uint64_t)os_log_create((const char *)UserNotificationsServicesLogSubsystem, "ImageProvider");

  return MEMORY[0x270F9A758]();
}

id UNSLogCommunicationNotifications()
{
  if (UNSLogCommunicationNotifications_onceToken[0] != -1) {
    dispatch_once(UNSLogCommunicationNotifications_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)UNSLogCommunicationNotifications___logger;

  return v0;
}

uint64_t __UNSLogCommunicationNotifications_block_invoke()
{
  UNSLogCommunicationNotifications___logger = (uint64_t)os_log_create((const char *)UserNotificationsServicesLogSubsystem, "CommunicationNotifications");

  return MEMORY[0x270F9A758]();
}

uint64_t UNSList.sections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UNSList.sections.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*UNSList.sections.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.init(sections:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t UNSList.Section.groups.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UNSList.Section.groups.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*UNSList.Section.groups.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.Section.type.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  unint64_t v3 = *(void *)(v1 + 16);
  *a1 = v2;
  a1[1] = v3;
  return sub_260AFDF7C(v2, v3);
}

uint64_t sub_260AFDF7C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xB) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t UNSList.Section.type.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_260AFDFC4(*(void *)(v1 + 8), *(void *)(v1 + 16));
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_260AFDFC4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xB) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*UNSList.Section.type.modify())()
{
  return nullsub_1;
}

unint64_t UNSList.Section.id.getter(uint64_t a1)
{
  long long v2 = *(_OWORD *)(v1 + 8);
  long long v3 = *(_OWORD *)(a1 + 32);
  v5[0] = *(_OWORD *)(a1 + 16);
  v5[1] = v3;
  v5[2] = v2;
  type metadata accessor for UNSList.Section.SectionType(0, (uint64_t)v5);
  return UNSList.Section.SectionType.id.getter();
}

unint64_t UNSList.Section.SectionType.id.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  unint64_t v3 = 0x79726F74736968;
  switch(v2)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 7uLL:
      unint64_t v3 = 0xD000000000000011;
      break;
    case 2uLL:
      unint64_t v3 = 0x676E696D6F636E69;
      break;
    case 3uLL:
    case 5uLL:
      unint64_t v3 = 0x676E696D6F637075;
      break;
    case 4uLL:
      unint64_t v3 = 0x44746E6572727563;
      break;
    case 6uLL:
      unint64_t v3 = 0x6567694464616572;
      break;
    case 8uLL:
      unint64_t v3 = 0xD000000000000010;
      break;
    case 9uLL:
      unint64_t v3 = 0xD000000000000014;
      break;
    case 0xAuLL:
      unint64_t v3 = 0x6867696C68676968;
      break;
    default:
      unint64_t v3 = v1;
      break;
  }
  sub_260AFDF7C(v1, v2);
  return v3;
}

uint64_t type metadata accessor for UNSList.Section.SectionType(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType);
}

uint64_t UNSList.Section.isEmpty.getter(uint64_t a1)
{
  uint64_t v5 = *v1;
  long long v2 = *(_OWORD *)(a1 + 32);
  v4[0] = *(_OWORD *)(a1 + 16);
  v4[1] = v2;
  type metadata accessor for UNSList.Section.Group(255, (uint64_t)v4);
  sub_260B23D40();
  swift_getWitnessTable();
  return sub_260B23D80() & 1;
}

uint64_t type metadata accessor for UNSList.Section.Group(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.Group);
}

uint64_t UNSList.Section.SectionType.init(id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  BOOL v4 = a1 == 0x79726F74736968 && a2 == 0xE700000000000000;
  if (v4 || (uint64_t v5 = a2, v6 = a1, (sub_260B23F50() & 1) != 0))
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  else if (v6 == 0xD000000000000011 && v5 == 0x8000000260B284A0 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 1;
  }
  else if (v6 == 0x676E696D6F636E69 && v5 == 0xE800000000000000 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 2;
  }
  else if (v6 == 0x676E696D6F637075 && v5 == 0xEE0064657373694DLL || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 3;
  }
  else if (v6 == 0x44746E6572727563 && v5 == 0xED00007473656769 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 4;
  }
  else if (v6 == 0x676E696D6F637075 && v5 == 0xEE00747365676944 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 5;
  }
  else if (v6 == 0x6567694464616572 && v5 == 0xEA00000000007473 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 6;
  }
  else if (v6 == 0xD000000000000011 && v5 == 0x8000000260B28480 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 7;
  }
  else if (v6 == 0xD000000000000010 && v5 == 0x8000000260B28460 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 8;
  }
  else if (v6 == 0xD000000000000014 && v5 == 0x8000000260B28440 || (sub_260B23F50() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 9;
  }
  else if (v6 == 0x6867696C68676968 && v5 == 0xEB00000000646574 || (uint64_t result = sub_260B23F50(), (result & 1) != 0))
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v5 = 10;
  }
  *a3 = v6;
  a3[1] = v5;
  return result;
}

uint64_t static UNSList.Section.SectionType.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5) {
        goto LABEL_25;
      }
      unint64_t v3 = 0;
      char v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1) {
        goto LABEL_25;
      }
      unint64_t v3 = 1;
      char v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 7;
      break;
    case 8uLL:
      if (v5 != 8) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 8;
      break;
    case 9uLL:
      if (v5 != 9) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 9;
      break;
    case 0xAuLL:
      if (v5 != 10) {
        goto LABEL_25;
      }
      char v6 = 1;
      unint64_t v3 = 10;
      break;
    default:
      if (v5 >= 0xB)
      {
        if (v2 == v4 && v3 == v5) {
          char v6 = 1;
        }
        else {
          char v6 = sub_260B23F50();
        }
      }
      else
      {
LABEL_25:
        char v6 = 0;
      }
      sub_260AFDF7C(v4, v5);
      sub_260AFDF7C(v2, v3);
      break;
  }
  sub_260AFDFC4(v2, v3);
  sub_260AFDFC4(v4, v5);
  return v6 & 1;
}

uint64_t sub_260AFE958()
{
  return 0;
}

uint64_t sub_260AFE964@<X0>(void *a1@<X2>, unsigned char *a2@<X8>)
{
  return sub_260AFF9A4(a1, (uint64_t (*)(void, void, void, void))sub_260AFF820, a2);
}

uint64_t sub_260AFE97C()
{
  return 0;
}

uint64_t sub_260AFE988@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_260B05E2C(a1, (uint64_t (*)(void, void, void, void))sub_260AFF820, a2);
}

uint64_t sub_260AFE9A0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFE9F4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

BOOL sub_260AFEA48(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_260AFEA58()
{
  return sub_260B23FC0();
}

uint64_t sub_260AFEA80(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x79726F74736968 && a2 == 0xE700000000000000;
  if (v2 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000260B284A0 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696D6F636E69 && a2 == 0xE800000000000000 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E696D6F637075 && a2 == 0xEE0064657373694DLL || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x44746E6572727563 && a2 == 0xED00007473656769 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x676E696D6F637075 && a2 == 0xEE00747365676944 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6567694464616572 && a2 == 0xEA00000000007473 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000260B28480 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000260B28460 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000260B28440 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6867696C68676968 && a2 == 0xEB00000000646574 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6669636570736E75 && a2 == 0xEB00000000646569)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_260B23F50();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

unint64_t sub_260AFEF94(char a1)
{
  unint64_t result = 0x79726F74736968;
  switch(a1)
  {
    case 1:
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x676E696D6F636E69;
      break;
    case 3:
    case 5:
      unint64_t result = 0x676E696D6F637075;
      break;
    case 4:
      unint64_t result = 0x44746E6572727563;
      break;
    case 6:
      unint64_t result = 0x6567694464616572;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 10:
      unint64_t result = 0x6867696C68676968;
      break;
    case 11:
      unint64_t result = 0x6669636570736E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260AFF134(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_260B03CD8(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_260AFEA48);
}

uint64_t sub_260AFF150(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_260B03D34(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_260AFEA58);
}

uint64_t sub_260AFF168(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_260B03D64(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void))sub_260AFEA58);
}

uint64_t sub_260AFF180(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_260B23F50();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_260AFF1F0(void *a1, uint64_t a2)
{
  return sub_260B03DD8(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_260AFEF94);
}

uint64_t sub_260AFF208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_260B04AFC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_260AFEA80, a4);
}

uint64_t sub_260AFF220@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_260B04B38(a1, (uint64_t (*)(void, void, void, void))sub_260B068E0, a2);
}

uint64_t sub_260AFF238(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF28C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF2E0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF334(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF388(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF3DC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF430(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF484(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF4D8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF52C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF580(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF5D4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF628(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF67C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF6D0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF724(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF778(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF7CC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF820()
{
  return 1;
}

uint64_t sub_260AFF830()
{
  return 12383;
}

uint64_t sub_260AFF83C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_260B05DEC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_260AFF180, a4);
}

uint64_t sub_260AFF854(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF8A8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF8FC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFF950(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_260AFF9A4@<X0>(void *a1@<X2>, uint64_t (*a2)(void, void, void, void)@<X4>, unsigned char *a3@<X8>)
{
  char v4 = a2(a1[2], a1[3], a1[4], a1[5]);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_260AFF9F8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260AFFA4C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t UNSList.Section.SectionType.encode(to:)(void *a1, void *a2)
{
  char v3 = v2;
  v129 = a1;
  uint64_t v4 = a2[2];
  uint64_t v6 = a2[4];
  uint64_t v7 = a2[5];
  uint64_t v126 = a2[3];
  uint64_t v5 = v126;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v121 = type metadata accessor for UNSList.Section.SectionType.UnspecifiedCodingKeys(255, (uint64_t)&v125);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v122 = sub_260B23F40();
  uint64_t v118 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388]();
  v120 = (char *)&v65 - v8;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v9 = type metadata accessor for UNSList.Section.SectionType.HighlightedCodingKeys(255, (uint64_t)&v125);
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v117 = v9;
  uint64_t v115 = v10;
  uint64_t v116 = sub_260B23F40();
  uint64_t v114 = *(void *)(v116 - 8);
  MEMORY[0x270FA5388]();
  v113 = (char *)&v65 - v11;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v12 = type metadata accessor for UNSList.Section.SectionType.InlineFeaturedDigestCodingKeys(255, (uint64_t)&v125);
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v112 = v12;
  uint64_t v110 = v13;
  uint64_t v111 = sub_260B23F40();
  uint64_t v109 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388]();
  v108 = (char *)&v65 - v14;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v15 = type metadata accessor for UNSList.Section.SectionType.OnboardingDigestCodingKeys(255, (uint64_t)&v125);
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v107 = v15;
  uint64_t v105 = v16;
  uint64_t v106 = sub_260B23F40();
  uint64_t v104 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388]();
  v103 = (char *)&v65 - v17;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v18 = type metadata accessor for UNSList.Section.SectionType.ApplicationDigestCodingKeys(255, (uint64_t)&v125);
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v102 = v18;
  uint64_t v100 = v19;
  uint64_t v101 = sub_260B23F40();
  uint64_t v99 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388]();
  v98 = (char *)&v65 - v20;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t DigestCodingKeys = type metadata accessor for UNSList.Section.SectionType.ReadDigestCodingKeys(255, (uint64_t)&v125);
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v97 = DigestCodingKeys;
  uint64_t v95 = v22;
  uint64_t v96 = sub_260B23F40();
  uint64_t v94 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388]();
  v93 = (char *)&v65 - v23;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v24 = type metadata accessor for UNSList.Section.SectionType.UpcomingDigestCodingKeys(255, (uint64_t)&v125);
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v92 = v24;
  uint64_t v90 = v25;
  uint64_t v91 = sub_260B23F40();
  uint64_t v89 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388]();
  v88 = (char *)&v65 - v26;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v27 = type metadata accessor for UNSList.Section.SectionType.CurrentDigestCodingKeys(255, (uint64_t)&v125);
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v87 = v27;
  uint64_t v85 = v28;
  uint64_t v86 = sub_260B23F40();
  uint64_t v84 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388]();
  v83 = (char *)&v65 - v29;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v30 = type metadata accessor for UNSList.Section.SectionType.UpcomingMissedCodingKeys(255, (uint64_t)&v125);
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v82 = v30;
  uint64_t v80 = v31;
  uint64_t v81 = sub_260B23F40();
  uint64_t v79 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388]();
  v78 = (char *)&v65 - v32;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v33 = type metadata accessor for UNSList.Section.SectionType.IncomingCodingKeys(255, (uint64_t)&v125);
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v77 = v33;
  uint64_t v75 = v34;
  uint64_t v76 = sub_260B23F40();
  uint64_t v74 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388]();
  v73 = (char *)&v65 - v35;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  type metadata accessor for UNSList.Section.SectionType.ProminentIncomingCodingKeys(255, (uint64_t)&v125);
  uint64_t v71 = swift_getWitnessTable();
  uint64_t v72 = sub_260B23F40();
  uint64_t v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388]();
  v69 = (char *)&v65 - v36;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  type metadata accessor for UNSList.Section.SectionType.HistoryCodingKeys(255, (uint64_t)&v125);
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v68 = sub_260B23F40();
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388]();
  v38 = (char *)&v65 - v37;
  uint64_t v125 = v4;
  uint64_t v126 = v5;
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  type metadata accessor for UNSList.Section.SectionType.CodingKeys(255, (uint64_t)&v125);
  swift_getWitnessTable();
  uint64_t v39 = sub_260B23F40();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v123 = v39;
  uint64_t v124 = v40;
  MEMORY[0x270FA5388]();
  v42 = (uint64_t *)((char *)&v65 - v41);
  uint64_t v43 = *v3;
  uint64_t v44 = v3[1];
  uint64_t v65 = v43;
  __swift_project_boxed_opaque_existential_1(v129, v129[3]);
  v129 = v42;
  sub_260B24000();
  switch(v44)
  {
    case 0:
      LOBYTE(v125) = 0;
      uint64_t v45 = v123;
      v46 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v38, v68);
      goto LABEL_15;
    case 1:
      LOBYTE(v125) = 1;
      v53 = v69;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v53, v72);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 2:
      LOBYTE(v125) = 2;
      v56 = v73;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v56, v76);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 3:
      LOBYTE(v125) = 3;
      v57 = v78;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v57, v81);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 4:
      LOBYTE(v125) = 4;
      v58 = v83;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v84 + 8))(v58, v86);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 5:
      LOBYTE(v125) = 5;
      v59 = v88;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v89 + 8))(v59, v91);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 6:
      LOBYTE(v125) = 6;
      v60 = v93;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v60, v96);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 7:
      LOBYTE(v125) = 7;
      v61 = v98;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v99 + 8))(v61, v101);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 8:
      LOBYTE(v125) = 8;
      v62 = v103;
      uint64_t v54 = v123;
      v55 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v104 + 8))(v62, v106);
      return (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v55, v54);
    case 9:
      LOBYTE(v125) = 9;
      v63 = v108;
      uint64_t v45 = v123;
      v46 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v109 + 8))(v63, v111);
      goto LABEL_15;
    case 10:
      LOBYTE(v125) = 10;
      v64 = v113;
      uint64_t v45 = v123;
      v46 = v129;
      sub_260B23EE0();
      (*(void (**)(char *, uint64_t))(v114 + 8))(v64, v116);
LABEL_15:
      uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v46, v45);
      break;
    default:
      uint64_t v47 = v118;
      LOBYTE(v125) = 11;
      v48 = v120;
      uint64_t v49 = v123;
      v50 = v129;
      sub_260B23EE0();
      uint64_t v51 = v122;
      sub_260B23F10();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v51);
      uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v124 + 8))(v50, v49);
      break;
  }
  return result;
}

uint64_t type metadata accessor for UNSList.Section.SectionType.UnspecifiedCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.UnspecifiedCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.HighlightedCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.HighlightedCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.InlineFeaturedDigestCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.InlineFeaturedDigestCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.OnboardingDigestCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.OnboardingDigestCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.ApplicationDigestCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.ApplicationDigestCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.ReadDigestCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.ReadDigestCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.UpcomingDigestCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.UpcomingDigestCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.CurrentDigestCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.CurrentDigestCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.UpcomingMissedCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.UpcomingMissedCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.IncomingCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.IncomingCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.ProminentIncomingCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.ProminentIncomingCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.HistoryCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.HistoryCodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.SectionType.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.SectionType.CodingKeys);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t UNSList.Section.SectionType.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  v141 = a6;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v11 = type metadata accessor for UNSList.Section.SectionType.UnspecifiedCodingKeys(255, (uint64_t)&v172);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v163 = v11;
  uint64_t v123 = sub_260B23ED0();
  uint64_t v164 = *(void *)(v123 - 8);
  MEMORY[0x270FA5388]();
  v140 = (char *)&v102 - v12;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v13 = type metadata accessor for UNSList.Section.SectionType.HighlightedCodingKeys(255, (uint64_t)&v172);
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v161 = v13;
  uint64_t v158 = v14;
  uint64_t v15 = sub_260B23ED0();
  uint64_t v159 = *(void *)(v15 - 8);
  uint64_t v160 = v15;
  MEMORY[0x270FA5388]();
  v139 = (char *)&v102 - v16;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v17 = type metadata accessor for UNSList.Section.SectionType.InlineFeaturedDigestCodingKeys(255, (uint64_t)&v172);
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v157 = v17;
  uint64_t v154 = v18;
  uint64_t v156 = sub_260B23ED0();
  uint64_t v155 = *(void *)(v156 - 8);
  MEMORY[0x270FA5388]();
  v138 = (char *)&v102 - v19;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v20 = type metadata accessor for UNSList.Section.SectionType.OnboardingDigestCodingKeys(255, (uint64_t)&v172);
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v153 = v20;
  uint64_t v151 = v21;
  uint64_t v152 = sub_260B23ED0();
  uint64_t v122 = *(void *)(v152 - 8);
  MEMORY[0x270FA5388]();
  v137 = (char *)&v102 - v22;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v23 = type metadata accessor for UNSList.Section.SectionType.ApplicationDigestCodingKeys(255, (uint64_t)&v172);
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v150 = v23;
  uint64_t v149 = v24;
  uint64_t v121 = sub_260B23ED0();
  uint64_t v120 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388]();
  v136 = (char *)&v102 - v25;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t DigestCodingKeys = type metadata accessor for UNSList.Section.SectionType.ReadDigestCodingKeys(255, (uint64_t)&v172);
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v148 = DigestCodingKeys;
  uint64_t v147 = v27;
  uint64_t v119 = sub_260B23ED0();
  uint64_t v118 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388]();
  v135 = (char *)&v102 - v28;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v29 = type metadata accessor for UNSList.Section.SectionType.UpcomingDigestCodingKeys(255, (uint64_t)&v172);
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v146 = v29;
  uint64_t v145 = v30;
  uint64_t v117 = sub_260B23ED0();
  uint64_t v116 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388]();
  v134 = (char *)&v102 - v31;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v32 = type metadata accessor for UNSList.Section.SectionType.CurrentDigestCodingKeys(255, (uint64_t)&v172);
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v144 = v32;
  uint64_t v143 = v33;
  uint64_t v115 = sub_260B23ED0();
  uint64_t v114 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388]();
  v133 = (char *)&v102 - v34;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v35 = type metadata accessor for UNSList.Section.SectionType.UpcomingMissedCodingKeys(255, (uint64_t)&v172);
  uint64_t v36 = swift_getWitnessTable();
  uint64_t v142 = v35;
  uint64_t v132 = v36;
  uint64_t v113 = sub_260B23ED0();
  uint64_t v112 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388]();
  v131 = (char *)&v102 - v37;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v38 = type metadata accessor for UNSList.Section.SectionType.IncomingCodingKeys(255, (uint64_t)&v172);
  uint64_t v39 = swift_getWitnessTable();
  uint64_t v130 = v38;
  uint64_t v129 = v39;
  uint64_t v111 = sub_260B23ED0();
  uint64_t v110 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v128 = (char *)&v102 - v40;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v41 = type metadata accessor for UNSList.Section.SectionType.ProminentIncomingCodingKeys(255, (uint64_t)&v172);
  uint64_t v42 = swift_getWitnessTable();
  uint64_t v127 = v41;
  uint64_t v126 = v42;
  uint64_t v109 = sub_260B23ED0();
  uint64_t v108 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v125 = (char *)&v102 - v43;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  uint64_t v44 = type metadata accessor for UNSList.Section.SectionType.HistoryCodingKeys(255, (uint64_t)&v172);
  uint64_t v124 = swift_getWitnessTable();
  uint64_t v107 = sub_260B23ED0();
  uint64_t v106 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388]();
  v46 = (char *)&v102 - v45;
  *(void *)&long long v172 = a2;
  *((void *)&v172 + 1) = a3;
  uint64_t v167 = a4;
  uint64_t v168 = a5;
  *(void *)&long long v173 = a4;
  *((void *)&v173 + 1) = a5;
  type metadata accessor for UNSList.Section.SectionType.CodingKeys(255, (uint64_t)&v172);
  swift_getWitnessTable();
  uint64_t v47 = sub_260B23ED0();
  uint64_t v165 = *(void *)(v47 - 8);
  uint64_t v166 = v47;
  MEMORY[0x270FA5388]();
  uint64_t v49 = (char *)&v102 - v48;
  v50 = a1;
  uint64_t v51 = a1[3];
  v169 = v50;
  __swift_project_boxed_opaque_existential_1(v50, v51);
  v52 = v174;
  sub_260B23FF0();
  if (v52) {
    goto LABEL_7;
  }
  v103 = v46;
  uint64_t v104 = v44;
  *(void *)&long long v105 = a2;
  *((void *)&v105 + 1) = a3;
  uint64_t v53 = v167;
  uint64_t v54 = v168;
  uint64_t v55 = v166;
  v174 = v49;
  *(void *)&long long v170 = sub_260B23EC0();
  sub_260B23D40();
  swift_getWitnessTable();
  *(void *)&long long v172 = sub_260B23DF0();
  *((void *)&v172 + 1) = v56;
  *(void *)&long long v173 = v57;
  *((void *)&v173 + 1) = v58;
  sub_260B23DE0();
  swift_getWitnessTable();
  sub_260B23D70();
  if (v170 == 12 || (long long v102 = v172, v170 = v172, v171 = v173, (sub_260B23D80() & 1) == 0))
  {
    uint64_t v69 = sub_260B23E30();
    swift_allocError();
    uint64_t v71 = v70;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D47C8);
    long long v170 = v105;
    *(void *)&long long v171 = v53;
    *((void *)&v171 + 1) = v54;
    *uint64_t v71 = type metadata accessor for UNSList.Section.SectionType(0, (uint64_t)&v170);
    uint64_t v72 = v174;
    sub_260B23E60();
    sub_260B23E20();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v69 - 8) + 104))(v71, *MEMORY[0x263F8DCB0], v69);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v165 + 8))(v72, v55);
LABEL_7:
    uint64_t v73 = (uint64_t)v169;
    return __swift_destroy_boxed_opaque_existential_1(v73);
  }
  uint64_t v59 = v164;
  uint64_t v61 = v159;
  uint64_t v60 = v160;
  uint64_t v62 = v156;
  uint64_t v63 = v155;
  uint64_t v64 = v152;
  switch((int)v164)
  {
    case 1:
      LOBYTE(v170) = 1;
      uint64_t v75 = v125;
      uint64_t v76 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v108 + 8))(v75, v109);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v76, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 1;
      break;
    case 2:
      LOBYTE(v170) = 2;
      uint64_t v77 = v128;
      v78 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v110 + 8))(v77, v111);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v78, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 2;
      break;
    case 3:
      LOBYTE(v170) = 3;
      uint64_t v79 = v131;
      uint64_t v80 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v112 + 8))(v79, v113);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v80, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 3;
      break;
    case 4:
      LOBYTE(v170) = 4;
      uint64_t v81 = v133;
      uint64_t v82 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v114 + 8))(v81, v115);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v82, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 4;
      break;
    case 5:
      LOBYTE(v170) = 5;
      v83 = v134;
      uint64_t v84 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v116 + 8))(v83, v117);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v84, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 5;
      break;
    case 6:
      LOBYTE(v170) = 6;
      uint64_t v85 = v135;
      uint64_t v86 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v118 + 8))(v85, v119);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v86, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 6;
      break;
    case 7:
      LOBYTE(v170) = 7;
      uint64_t v87 = v136;
      v88 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v120 + 8))(v87, v121);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v88, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 7;
      break;
    case 8:
      LOBYTE(v170) = 8;
      uint64_t v89 = v137;
      uint64_t v90 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v122 + 8))(v89, v64);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v90, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 8;
      break;
    case 9:
      LOBYTE(v170) = 9;
      uint64_t v91 = v138;
      uint64_t v92 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v91, v62);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v92, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 9;
      break;
    case 10:
      LOBYTE(v170) = 10;
      v93 = v139;
      uint64_t v94 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v93, v60);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v94, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 10;
      break;
    case 11:
      LOBYTE(v170) = 11;
      uint64_t v95 = v140;
      uint64_t v96 = v174;
      sub_260B23E50();
      uint64_t v97 = v123;
      uint64_t v98 = sub_260B23E90();
      uint64_t v99 = v165;
      uint64_t v67 = v98;
      uint64_t v68 = v100;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v95, v97);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v99 + 8))(v96, v55);
      break;
    default:
      LOBYTE(v170) = 0;
      uint64_t v65 = v103;
      uint64_t v66 = v174;
      sub_260B23E50();
      (*(void (**)(char *, uint64_t))(v106 + 8))(v65, v107);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v66, v55);
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      break;
  }
  uint64_t v73 = (uint64_t)v169;
  uint64_t v101 = v141;
  uint64_t *v141 = v67;
  v101[1] = v68;
  return __swift_destroy_boxed_opaque_existential_1(v73);
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

uint64_t sub_260B02114@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return UNSList.Section.SectionType.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_260B02138(void *a1, void *a2)
{
  return UNSList.Section.SectionType.encode(to:)(a1, a2);
}

unint64_t sub_260B02154@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = UNSList.Section.SectionType.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

__n128 UNSList.Section.init(groups:type:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  __n128 result = *a2;
  *(__n128 *)(a3 + 8) = *a2;
  return result;
}

uint64_t UNSList.Section.Group.GroupingMethod.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v27 = a6;
  v26[0] = a2;
  v26[1] = a3;
  v26[2] = a4;
  v26[3] = a5;
  type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingKeys(255, (uint64_t)v26);
  swift_getWitnessTable();
  uint64_t v8 = sub_260B23ED0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v24 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B23FF0();
  if (!v6)
  {
    uint64_t v25 = v9;
    uint64_t v12 = v27;
    LOBYTE(v26[0]) = 0;
    uint64_t v13 = sub_260B23E90();
    uint64_t v15 = v14;
    LOBYTE(v26[0]) = 1;
    uint64_t v16 = sub_260B23E90();
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v8);
    if (v15) {
      uint64_t v19 = v13;
    }
    else {
      uint64_t v19 = v16;
    }
    if (v15) {
      uint64_t v20 = v15;
    }
    else {
      uint64_t v20 = v18;
    }
    if (v15) {
      uint64_t v21 = v16;
    }
    else {
      uint64_t v21 = 0;
    }
    if (v15) {
      uint64_t v22 = v18;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)uint64_t v12 = v19;
    *(void *)(v12 + 8) = v20;
    *(void *)(v12 + 16) = v21;
    *(void *)(v12 + 24) = v22;
    *(unsigned char *)(v12 + 32) = v15 == 0;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.Group.GroupingMethod.CodingKeys);
}

uint64_t UNSList.Section.Group.GroupingMethod.encode(to:)(void *a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 32);
  v16[0] = *(_OWORD *)(a2 + 16);
  v16[1] = v4;
  type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingKeys(255, (uint64_t)v16);
  swift_getWitnessTable();
  uint64_t v5 = sub_260B23F40();
  uint64_t v14 = *(void *)(v5 - 8);
  uint64_t v15 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v13 - v6;
  uint64_t v8 = *v2;
  v13[2] = v2[1];
  v13[3] = v8;
  v13[1] = v2[2];
  int v9 = *((unsigned __int8 *)v2 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B24000();
  if (!v9)
  {
    LOBYTE(v16[0]) = 0;
    uint64_t v10 = v15;
    uint64_t v11 = v17;
    sub_260B23F10();
    if (v11) {
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v7, v10);
    }
    LOBYTE(v16[0]) = 1;
LABEL_6:
    sub_260B23F10();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v7, v10);
  }
  if (v9 == 1)
  {
    LOBYTE(v16[0]) = 1;
    uint64_t v10 = v15;
    goto LABEL_6;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v7, v15);
}

uint64_t UNSList.Section.Group.GroupingMethod.init(fromUniqueIdentifier:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    sub_260B23C70();
    swift_bridgeObjectRelease();
    sub_260B23C70();
    sub_260B028DC();
    uint64_t v5 = (void *)sub_260B23DD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5[2];
    if (v6 == 1)
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      if (v6 != 2 || (swift_bridgeObjectRetain(), v7 = sub_260B23C20(), uint64_t result = swift_bridgeObjectRelease(), v7 <= 0))
      {
LABEL_19:
        uint64_t result = swift_bridgeObjectRelease();
        *(_OWORD *)a3 = 0u;
        *(_OWORD *)(a3 + 16) = 0u;
        char v11 = -1;
        goto LABEL_20;
      }
      if (v5[2] < 2uLL)
      {
LABEL_24:
        __break(1u);
        return result;
      }
      uint64_t v10 = v5[6];
      uint64_t v9 = v5[7];
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_260B23C70();
    if (v5[2])
    {
      swift_bridgeObjectRetain();
      char v12 = sub_260B23C80();
      swift_bridgeObjectRelease();
      if (v12)
      {
        uint64_t v13 = v5[4];
        unint64_t v14 = v5[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        unint64_t v15 = sub_260B23C20();
        swift_bridgeObjectRelease();
        unint64_t v16 = sub_260B068E8(v15, v13, v14);
        uint64_t v18 = v17;
        uint64_t v20 = v19;
        uint64_t v22 = v21;
        swift_bridgeObjectRelease();
        uint64_t v23 = MEMORY[0x261222C30](v16, v18, v20, v22);
        uint64_t v25 = v24;
        swift_bridgeObjectRelease();
        uint64_t result = sub_260B23C20();
        if (result >= 1)
        {
          if (v9)
          {
            *(void *)a3 = v10;
            *(void *)(a3 + 8) = v9;
            *(void *)(a3 + 16) = v23;
            *(void *)(a3 + 24) = v25;
            *(unsigned char *)(a3 + 32) = 0;
            return result;
          }
          *(void *)a3 = v23;
          *(void *)(a3 + 8) = v25;
          *(void *)(a3 + 16) = 0;
          *(void *)(a3 + 24) = 0;
          char v11 = 1;
          goto LABEL_20;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    __break(1u);
    goto LABEL_24;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  char v11 = 2;
LABEL_20:
  *(unsigned char *)(a3 + 32) = v11;
  return result;
}

unint64_t sub_260B028A8()
{
  return 0xD000000000000010;
}

unint64_t sub_260B028DC()
{
  unint64_t result = qword_26A8D47D0;
  if (!qword_26A8D47D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D47D0);
  }
  return result;
}

unint64_t UNSList.Section.Group.GroupingMethod.id.getter()
{
  if (!*(unsigned char *)(v0 + 32))
  {
    sub_260B23C70();
    sub_260B23C70();
    sub_260B23C70();
    sub_260B23C70();
    swift_bridgeObjectRelease();
LABEL_5:
    sub_260B23C70();
    sub_260B23C70();
    return 0xD000000000000010;
  }
  if (*(unsigned char *)(v0 + 32) == 1) {
    goto LABEL_5;
  }
  return 0;
}

uint64_t UNSList.Section.Group.GroupingMethod.bundleIdentifier.getter()
{
  if (*((unsigned char *)v0 + 32))
  {
    if (*((unsigned char *)v0 + 32) != 1) {
      return 0;
    }
  }
  else
  {
    v0 += 2;
  }
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static UNSList.Section.Group.GroupingMethod.CodingError.== infix(_:_:)()
{
  return 1;
}

uint64_t UNSList.Section.Group.GroupingMethod.CodingError.hash(into:)()
{
  return sub_260B23FC0();
}

uint64_t UNSList.Section.Group.GroupingMethod.CodingError.hashValue.getter()
{
  return sub_260B23FE0();
}

uint64_t sub_260B02B28()
{
  uint64_t v0 = sub_260B23E40();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_260B02B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];

  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_260B02BF0(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_260B02C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_260B02CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_260B02D3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260B02B28();
  *a1 = result;
  return result;
}

unint64_t sub_260B02D78@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_260B028A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_260B02DB0(void *a1, uint64_t a2)
{
  return sub_260B04AC8(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_260B028A8);
}

uint64_t sub_260B02DC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_260B04AFC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_260B02B28, a4);
}

uint64_t sub_260B02DE0@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_260B04B38(a1, (uint64_t (*)(void, void, void, void))sub_260B06C38, a2);
}

uint64_t sub_260B02DF8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260B02E4C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t static UNSList.Section.Group.GroupingMethod.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  int v6 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v8 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  int v11 = *(unsigned __int8 *)(a2 + 32);
  if (*(unsigned char *)(a1 + 32))
  {
    if (v6 == 1)
    {
      if (v11 == 1)
      {
        if (v3 == v8 && v2 == v7) {
          char v13 = 1;
        }
        else {
          char v13 = sub_260B23F50();
        }
        sub_260B06998(v8, v7, v10, v9, 1);
        sub_260B06998(v3, v2, v5, v4, 1);
        sub_260B069F8(v3, v2, v5, v4, 1);
        sub_260B069F8(v8, v7, v10, v9, 1);
        return v13 & 1;
      }
    }
    else if (v11 == 2 && (v7 | v8 | v10 | v9) == 0)
    {
      sub_260B069F8(*(void *)a1, v2, v5, v4, 2);
      sub_260B069F8(0, 0, 0, 0, 2);
      char v13 = 1;
      return v13 & 1;
    }
    goto LABEL_24;
  }
  if (*(unsigned char *)(a2 + 32))
  {
LABEL_24:
    sub_260B06998(*(void *)a2, *(void *)(a2 + 8), v10, v9, v11);
    sub_260B06998(v3, v2, v5, v4, v6);
    sub_260B069F8(v3, v2, v5, v4, v6);
    uint64_t v17 = v8;
    uint64_t v18 = v7;
    uint64_t v19 = v10;
    uint64_t v20 = v9;
    char v21 = v11;
LABEL_25:
    sub_260B069F8(v17, v18, v19, v20, v21);
    char v13 = 0;
    return v13 & 1;
  }
  BOOL v14 = v3 == v8 && v2 == v7;
  if (!v14 && (sub_260B23F50() & 1) == 0)
  {
    sub_260B06998(v8, v7, v10, v9, 0);
    sub_260B06998(v3, v2, v5, v4, 0);
    sub_260B069F8(v3, v2, v5, v4, 0);
    uint64_t v17 = v8;
    uint64_t v18 = v7;
    uint64_t v19 = v10;
    uint64_t v20 = v9;
    char v21 = 0;
    goto LABEL_25;
  }
  if (v5 == v10 && v4 == v9) {
    char v13 = 1;
  }
  else {
    char v13 = sub_260B23F50();
  }
  sub_260B06998(v8, v7, v10, v9, 0);
  sub_260B06998(v3, v2, v5, v4, 0);
  sub_260B069F8(v3, v2, v5, v4, 0);
  sub_260B069F8(v8, v7, v10, v9, 0);
  return v13 & 1;
}

uint64_t sub_260B03174@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return UNSList.Section.Group.GroupingMethod.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_260B03198(void *a1, uint64_t a2)
{
  return UNSList.Section.Group.GroupingMethod.encode(to:)(a1, a2);
}

unint64_t sub_260B031B4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = UNSList.Section.Group.GroupingMethod.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t UNSList.Section.Group.id.getter(uint64_t a1)
{
  char v2 = *(unsigned char *)(v1 + 40);
  long long v3 = *(_OWORD *)(v1 + 24);
  v6[2] = *(_OWORD *)(v1 + 8);
  v6[3] = v3;
  char v7 = v2;
  long long v4 = *(_OWORD *)(a1 + 32);
  v6[0] = *(_OWORD *)(a1 + 16);
  v6[1] = v4;
  type metadata accessor for UNSList.Section.Group.GroupingMethod(0, (uint64_t)v6);
  return UNSList.Section.Group.GroupingMethod.id.getter();
}

uint64_t UNSList.Section.Group.notifications.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UNSList.Section.Group.notifications.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*UNSList.Section.Group.notifications.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.Section.Group.groupingMethod.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  char v6 = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(a1 + 32) = v6;
  return sub_260B06998(v2, v3, v4, v5, v6);
}

uint64_t UNSList.Section.Group.summary.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_260B06A70(v2 + *(int *)(a1 + 56), a2);
}

uint64_t UNSList.Section.Group.summary.setter(uint64_t a1, uint64_t a2)
{
  return sub_260B06AD8(a1, v2 + *(int *)(a2 + 56));
}

uint64_t (*UNSList.Section.Group.summary.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.Section.Group.spotlightIdentifier.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t UNSList.Section.Group.spotlightIdentifier.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = (void *)(v3 + *(int *)(a3 + 60));
  uint64_t result = swift_bridgeObjectRelease();
  *char v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*UNSList.Section.Group.spotlightIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.Section.Group.isEmpty.getter()
{
  return sub_260B23D80() & 1;
}

uint64_t UNSList.Section.Group.bundleIdentifier.getter()
{
  if (*(unsigned char *)(v0 + 40))
  {
    if (*(unsigned char *)(v0 + 40) != 1) {
      return 0;
    }
    uint64_t v1 = (uint64_t *)(v0 + 8);
  }
  else
  {
    uint64_t v1 = (uint64_t *)(v0 + 24);
  }
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

__n128 UNSList.Section.Group.init(notifications:groupingMethod:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  __n128 v17 = *a2;
  unint64_t v9 = a2[1].n128_u64[0];
  unint64_t v10 = a2[1].n128_u64[1];
  unsigned __int8 v11 = a2[2].n128_u8[0];
  v18[0] = a3;
  v18[1] = a4;
  v18[2] = a5;
  v18[3] = a6;
  uint64_t v12 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v18);
  uint64_t v13 = a7 + *(int *)(v12 + 56);
  uint64_t v14 = sub_260B23A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  unint64_t v15 = (void *)(a7 + *(int *)(v12 + 60));
  *unint64_t v15 = 0;
  v15[1] = 0;
  *(void *)a7 = a1;
  __n128 result = v17;
  *(__n128 *)(a7 + 8) = v17;
  *(void *)(a7 + 24) = v9;
  *(void *)(a7 + 32) = v10;
  *(unsigned char *)(a7 + 40) = v11;
  return result;
}

uint64_t static UNSList.Section.Group.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v51 = a4;
  uint64_t v52 = a5;
  uint64_t v10 = sub_260B23A10();
  uint64_t v53 = *(void *)(v10 - 8);
  uint64_t v54 = v10;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v50 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D47D8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  __n128 v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v45 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v45 - v21;
  if ((sub_260B23D50() & 1) == 0) {
    return 0;
  }
  uint64_t v46 = v12;
  uint64_t v47 = v22;
  uint64_t v48 = v14;
  uint64_t v49 = v20;
  uint64_t v45 = v17;
  uint64_t v23 = v54;
  char v24 = *(unsigned char *)(a1 + 40);
  long long v25 = *(_OWORD *)(a1 + 24);
  long long v57 = *(_OWORD *)(a1 + 8);
  long long v58 = v25;
  char v59 = v24;
  char v26 = *(unsigned char *)(a2 + 40);
  long long v27 = *(_OWORD *)(a2 + 24);
  v55[0] = *(_OWORD *)(a2 + 8);
  v55[1] = v27;
  char v56 = v26;
  if ((static UNSList.Section.Group.GroupingMethod.== infix(_:_:)((uint64_t)&v57, (uint64_t)v55) & 1) == 0) {
    return 0;
  }
  *(void *)&long long v57 = a3;
  *((void *)&v57 + 1) = v51;
  *(void *)&long long v58 = v52;
  *((void *)&v58 + 1) = a6;
  uint64_t v28 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)&v57);
  uint64_t v29 = (uint64_t)v47;
  sub_260B06A70(a1 + *(int *)(v28 + 56), (uint64_t)v47);
  uint64_t v52 = v28;
  uint64_t v30 = a2 + *(int *)(v28 + 56);
  uint64_t v31 = (uint64_t)v49;
  sub_260B06A70(v30, (uint64_t)v49);
  uint64_t v32 = (uint64_t)v48;
  uint64_t v33 = (uint64_t)&v48[*(int *)(v46 + 48)];
  sub_260B06A70(v29, (uint64_t)v48);
  sub_260B06A70(v31, v33);
  uint64_t v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48);
  if (v34(v32, 1, v23) != 1)
  {
    uint64_t v35 = (uint64_t)v45;
    sub_260B06A70(v32, (uint64_t)v45);
    if (v34(v33, 1, v23) != 1)
    {
      uint64_t v36 = v53;
      uint64_t v37 = v50;
      (*(void (**)(char *, uint64_t, uint64_t))(v53 + 32))(v50, v33, v23);
      sub_260B09EB0(&qword_26A8D47E0, MEMORY[0x263F06828]);
      LODWORD(v51) = sub_260B23B90();
      uint64_t v38 = *(void (**)(char *, uint64_t))(v36 + 8);
      v38(v37, v23);
      sub_260B06B40((uint64_t)v49, qword_26B4026D0);
      sub_260B06B40(v29, qword_26B4026D0);
      v38((char *)v35, v23);
      sub_260B06B40(v32, qword_26B4026D0);
      if ((v51 & 1) == 0) {
        return 0;
      }
      goto LABEL_10;
    }
    sub_260B06B40((uint64_t)v49, qword_26B4026D0);
    sub_260B06B40(v29, qword_26B4026D0);
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v35, v23);
LABEL_8:
    sub_260B06B40(v32, &qword_26A8D47D8);
    return 0;
  }
  sub_260B06B40(v31, qword_26B4026D0);
  sub_260B06B40(v29, qword_26B4026D0);
  if (v34(v33, 1, v23) != 1) {
    goto LABEL_8;
  }
  sub_260B06B40(v32, qword_26B4026D0);
LABEL_10:
  uint64_t v39 = *(int *)(v52 + 60);
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = *(void *)(a1 + v39 + 8);
  uint64_t v42 = (void *)(a2 + v39);
  uint64_t v43 = v42[1];
  if (v41)
  {
    if (v43 && (*v40 == *v42 && v41 == v43 || (sub_260B23F50() & 1) != 0)) {
      return 1;
    }
  }
  else if (!v43)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_260B039C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6163696669746F6ELL && a2 == 0xED0000736E6F6974;
  if (v2 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E6970756F7267 && a2 == 0xEE00646F6874654DLL || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000260B284F0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_260B23F50();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_260B03BC8()
{
  return sub_260B23FE0();
}

unint64_t sub_260B03C10(char a1)
{
  unint64_t result = 0x6163696669746F6ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x676E6970756F7267;
      break;
    case 2:
      unint64_t result = 0x7972616D6D7573;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260B03CC0(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_260B03CD8(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_260B09F40);
}

uint64_t sub_260B03CD8(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5(*a1, *a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t sub_260B03CF8()
{
  return sub_260B03BC8();
}

uint64_t sub_260B03D1C(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_260B03D34(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_260B09F38);
}

uint64_t sub_260B03D34(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void))
{
  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5]);
}

uint64_t sub_260B03D4C(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_260B03D64(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void))sub_260B09F38);
}

uint64_t sub_260B03D64(uint64_t a1, void *a2, uint64_t a3, void (*a4)(unsigned char *, void, void, void, void, void))
{
  sub_260B23FB0();
  a4(v8, *v4, a2[2], a2[3], a2[4], a2[5]);
  return sub_260B23FE0();
}

uint64_t sub_260B03DC0(void *a1, uint64_t a2)
{
  return sub_260B03DD8(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_260B03C10);
}

uint64_t sub_260B03DD8(void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*v3, a1[2], a1[3], a1[4], a1[5]);
}

uint64_t sub_260B03DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_260B04AFC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_260B039C8, a4);
}

uint64_t sub_260B03E08@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_260B04B38(a1, (uint64_t (*)(void, void, void, void))sub_260B06C40, a2);
}

uint64_t sub_260B03E20(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260B03E74(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t UNSList.Section.Group.encode(to:)(void *a1, void *a2)
{
  uint64_t v3 = a2[3];
  uint64_t v21 = a2[2];
  uint64_t v5 = a2[4];
  uint64_t v4 = a2[5];
  *(void *)&long long v26 = v21;
  *((void *)&v26 + 1) = v3;
  uint64_t v18 = v4;
  uint64_t v19 = v3;
  *(void *)&long long v27 = v5;
  *((void *)&v27 + 1) = v4;
  type metadata accessor for UNSList.Section.Group.CodingKeys(255, (uint64_t)&v26);
  swift_getWitnessTable();
  uint64_t v6 = sub_260B23F40();
  uint64_t v20 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v17 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v9 = v6;
  uint64_t v10 = v21;
  uint64_t v11 = v22;
  sub_260B24000();
  *(void *)&long long v26 = *(void *)v11;
  LOBYTE(v24[0]) = 0;
  sub_260B23D40();
  uint64_t v29 = v5;
  swift_getWitnessTable();
  uint64_t v12 = v23;
  sub_260B23F30();
  if (v12) {
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v8, v6);
  }
  char v14 = *(unsigned char *)(v11 + 40);
  long long v15 = *(_OWORD *)(v11 + 24);
  long long v26 = *(_OWORD *)(v11 + 8);
  long long v27 = v15;
  char v28 = v14;
  char v25 = 1;
  uint64_t v16 = v20;
  v24[0] = v10;
  v24[1] = v19;
  v24[2] = v5;
  v24[3] = v18;
  type metadata accessor for UNSList.Section.Group.GroupingMethod(0, (uint64_t)v24);
  swift_getWitnessTable();
  sub_260B23F30();
  LOBYTE(v26) = 2;
  sub_260B23A10();
  sub_260B09EB0(&qword_26A8D47E8, MEMORY[0x263F06828]);
  sub_260B23F00();
  LOBYTE(v26) = 3;
  sub_260B23EF0();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v8, v9);
}

uint64_t UNSList.Section.Group.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v43 = a6;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  MEMORY[0x270FA5388]();
  uint64_t v44 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v57 = a2;
  *((void *)&v57 + 1) = a3;
  *(void *)&long long v58 = a4;
  *((void *)&v58 + 1) = a5;
  type metadata accessor for UNSList.Section.Group.CodingKeys(255, (uint64_t)&v57);
  swift_getWitnessTable();
  uint64_t v49 = sub_260B23ED0();
  uint64_t v45 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v50 = a2;
  *(void *)&long long v57 = a2;
  *((void *)&v57 + 1) = a3;
  uint64_t v47 = a5;
  uint64_t v48 = a3;
  uint64_t v46 = a4;
  *(void *)&long long v58 = a4;
  *((void *)&v58 + 1) = a5;
  uint64_t v14 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)&v57);
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388]();
  uint64_t v17 = (char *)&v40 - v16;
  uint64_t v18 = (char *)&v40 + *(int *)(v15 + 56) - v16;
  uint64_t v19 = sub_260B23A10();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  uint64_t v53 = v18;
  v20(v18, 1, 1, v19);
  uint64_t v21 = &v17[*(int *)(v14 + 60)];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v54 = v21;
  uint64_t v22 = a1[3];
  uint64_t v52 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  uint64_t v51 = v13;
  uint64_t v23 = v55;
  sub_260B23FF0();
  if (v23)
  {
    uint64_t v28 = (uint64_t)v53;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    sub_260B06B40(v28, qword_26B4026D0);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v55 = v19;
    uint64_t v24 = v46;
    uint64_t v25 = v47;
    uint64_t v41 = v14;
    uint64_t v26 = v45;
    sub_260B23D40();
    LOBYTE(v56[0]) = 0;
    uint64_t v27 = v48;
    uint64_t v60 = v48;
    swift_getWitnessTable();
    sub_260B23EB0();
    uint64_t v29 = v17;
    *(void *)uint64_t v17 = v57;
    v56[0] = v50;
    v56[1] = v27;
    v56[2] = v24;
    v56[3] = v25;
    type metadata accessor for UNSList.Section.Group.GroupingMethod(0, (uint64_t)v56);
    LOBYTE(v56[0]) = 1;
    swift_getWitnessTable();
    sub_260B23EB0();
    char v30 = v59;
    long long v31 = v58;
    *(_OWORD *)(v17 + 8) = v57;
    *(_OWORD *)(v17 + 24) = v31;
    v17[40] = v30;
    LOBYTE(v57) = 2;
    sub_260B09EB0(qword_26A8D47F0, MEMORY[0x263F06828]);
    uint64_t v32 = (uint64_t)v44;
    sub_260B23E80();
    sub_260B06AD8(v32, (uint64_t)v53);
    LOBYTE(v57) = 3;
    uint64_t v33 = sub_260B23E70();
    uint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v51, v49);
    uint64_t v36 = (uint64_t *)v54;
    swift_bridgeObjectRelease();
    *uint64_t v36 = v33;
    v36[1] = v35;
    uint64_t v37 = v42;
    uint64_t v38 = v41;
    (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v43, v29, v41);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v29, v38);
  }
}

uint64_t sub_260B04770@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return UNSList.Section.Group.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_260B04794(void *a1, void *a2)
{
  return UNSList.Section.Group.encode(to:)(a1, a2);
}

uint64_t sub_260B047AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static UNSList.Section.Group.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

unint64_t sub_260B047BC@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = UNSList.Section.Group.id.getter(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t static UNSList.Section.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t v15 = a5;
  uint64_t v16 = a6;
  type metadata accessor for UNSList.Section.Group(0, (uint64_t)&v13);
  swift_getWitnessTable();
  if (sub_260B23D50())
  {
    uint64_t v13 = v6;
    uint64_t v14 = v7;
    v12[0] = v8;
    v12[1] = v9;
    char v10 = static UNSList.Section.SectionType.== infix(_:_:)(&v13, v12);
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

BOOL sub_260B0489C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_260B048AC()
{
  return sub_260B23FC0();
}

uint64_t sub_260B048D4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7370756F7267 && a2 == 0xE600000000000000;
  if (v2 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_260B23F50();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_260B049B0()
{
  return sub_260B23FE0();
}

uint64_t sub_260B049F8(char a1)
{
  if (a1) {
    return 1701869940;
  }
  else {
    return 0x7370756F7267;
  }
}

BOOL sub_260B04A24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_260B0489C(*a1, *a2);
}

uint64_t sub_260B04A3C()
{
  return sub_260B049B0();
}

uint64_t sub_260B04A50()
{
  return sub_260B048AC();
}

uint64_t sub_260B04A64()
{
  return sub_260B23FE0();
}

uint64_t sub_260B04AB0(void *a1, uint64_t a2)
{
  return sub_260B04AC8(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_260B049F8);
}

uint64_t sub_260B04AC8(void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*v3, a1[2], a1[3], a1[4], a1[5]);
}

uint64_t sub_260B04AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_260B04AFC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_260B048D4, a4);
}

uint64_t sub_260B04AFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void)@<X4>, unsigned char *a5@<X8>)
{
  uint64_t result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5]);
  *a5 = result;
  return result;
}

uint64_t sub_260B04B38@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5]);
  *a3 = result;
  return result;
}

uint64_t sub_260B04B74(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260B04BC8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t UNSList.Section.encode(to:)(void *a1, void *a2)
{
  uint64_t v4 = a2[3];
  uint64_t v6 = a2[4];
  uint64_t v5 = a2[5];
  uint64_t v24 = a2[2];
  uint64_t v25 = v6;
  uint64_t v26 = v4;
  uint64_t v27 = v5;
  uint64_t v33 = v24;
  uint64_t v34 = v4;
  uint64_t v35 = v6;
  uint64_t v36 = v5;
  type metadata accessor for UNSList.Section.CodingKeys(255, (uint64_t)&v33);
  swift_getWitnessTable();
  uint64_t v7 = sub_260B23F40();
  uint64_t v28 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - v8;
  uint64_t v11 = *v2;
  uint64_t v10 = v2[1];
  uint64_t v22 = v2[2];
  uint64_t v23 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v12 = v7;
  uint64_t v13 = v26;
  uint64_t v14 = v24;
  uint64_t v15 = v25;
  sub_260B24000();
  uint64_t v30 = v11;
  char v37 = 0;
  uint64_t v33 = v14;
  uint64_t v34 = v13;
  uint64_t v16 = v27;
  uint64_t v35 = v15;
  uint64_t v36 = v27;
  type metadata accessor for UNSList.Section.Group(255, (uint64_t)&v33);
  sub_260B23D40();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v17 = v9;
  uint64_t v18 = v29;
  sub_260B23F30();
  if (v18) {
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v9, v12);
  }
  uint64_t v20 = v28;
  uint64_t v30 = v23;
  uint64_t v31 = v22;
  char v37 = 1;
  uint64_t v33 = v14;
  uint64_t v34 = v13;
  uint64_t v35 = v15;
  uint64_t v36 = v16;
  type metadata accessor for UNSList.Section.SectionType(0, (uint64_t)&v33);
  swift_getWitnessTable();
  sub_260B23F30();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v17, v12);
}

uint64_t UNSList.Section.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v21 = a6;
  uint64_t v22 = a5;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  type metadata accessor for UNSList.Section.CodingKeys(255, (uint64_t)&v28);
  swift_getWitnessTable();
  uint64_t v23 = sub_260B23ED0();
  uint64_t v9 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v11 = (char *)&v20 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B23FF0();
  if (v6) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v12 = v9;
  uint64_t v28 = a2;
  uint64_t v29 = v24;
  uint64_t v13 = v22;
  uint64_t v30 = v25;
  uint64_t v31 = v22;
  type metadata accessor for UNSList.Section.Group(255, (uint64_t)&v28);
  sub_260B23D40();
  LOBYTE(v28) = 0;
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v14 = v23;
  sub_260B23EB0();
  uint64_t v28 = a2;
  uint64_t v29 = v24;
  uint64_t v15 = v26;
  uint64_t v30 = v25;
  uint64_t v31 = v13;
  type metadata accessor for UNSList.Section.SectionType(0, (uint64_t)&v28);
  LOBYTE(v28) = 1;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_260B23EB0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v11, v14);
  uint64_t v16 = v26;
  unint64_t v17 = v27;
  swift_bridgeObjectRetain();
  sub_260AFDF7C(v16, v17);
  swift_bridgeObjectRelease();
  uint64_t v18 = v21;
  *uint64_t v21 = v15;
  v18[1] = v16;
  v18[2] = v17;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return sub_260AFDFC4(v16, v17);
}

uint64_t sub_260B051EC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return UNSList.Section.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_260B05210(void *a1, void *a2)
{
  return UNSList.Section.encode(to:)(a1, a2);
}

uint64_t sub_260B05228(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static UNSList.Section.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

unint64_t sub_260B05238@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = UNSList.Section.id.getter(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t UNSList.FlattenedGroup.group.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 32);
  v7[0] = *(_OWORD *)(a1 + 16);
  v7[1] = v4;
  uint64_t v5 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v2, v5);
}

uint64_t UNSList.FlattenedGroup.sectionID.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 52));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static UNSList.FlattenedGroup.decode(uniqueIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)&v43[0] = 44;
  *((void *)&v43[0] + 1) = 0xE100000000000000;
  sub_260B23C70();
  swift_bridgeObjectRelease();
  sub_260B23C70();
  long long v6 = v43[0];
  *(void *)&v43[0] = a1;
  *((void *)&v43[0] + 1) = a2;
  long long v45 = v6;
  sub_260B028DC();
  uint64_t v7 = (void *)sub_260B23DD0();
  swift_bridgeObjectRelease();
  if (v7[2] != 2) {
    goto LABEL_15;
  }
  *(void *)&v43[0] = 0x496E6F6974636573;
  *((void *)&v43[0] + 1) = 0xE900000000000044;
  uint64_t result = sub_260B23C70();
  if (v7[2])
  {
    swift_bridgeObjectRetain();
    char v9 = sub_260B23C80();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v10 = v7[4];
    unint64_t v11 = v7[5];
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_260B23C20();
    swift_bridgeObjectRelease();
    unint64_t v13 = sub_260B068E8(v12, v10, v11);
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x261222C30](v13, v15, v17, v19);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t result = sub_260B23C20();
    if (result < 1) {
      goto LABEL_14;
    }
    if (v7[2] >= 2uLL)
    {
      uint64_t v23 = v7[6];
      unint64_t v24 = v7[7];
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_260B05688(v23, v24);
      uint64_t v27 = v26;
      swift_bridgeObjectRelease();
      if (v27)
      {
        if (v25 == 93 && v27 == 0xE100000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
        char v28 = sub_260B23F50();
        swift_bridgeObjectRelease();
        if (v28)
        {
LABEL_11:
          swift_bridgeObjectRetain();
          uint64_t v29 = sub_260B23C20();
          swift_bridgeObjectRelease();
          if (v29 >= 2)
          {
            swift_bridgeObjectRetain();
            sub_260B23C60();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v30 = sub_260B23CA0();
            uint64_t v32 = v31;
            uint64_t v34 = v33;
            uint64_t v36 = v35;
            swift_bridgeObjectRelease();
            uint64_t v37 = MEMORY[0x261222C30](v30, v32, v34, v36);
            unint64_t v39 = v38;
            swift_bridgeObjectRelease();
            uint64_t result = UNSList.Section.Group.GroupingMethod.init(fromUniqueIdentifier:)(v37, v39, (uint64_t)v43);
            unsigned __int8 v40 = v44;
            if (v44 != 255)
            {
              long long v41 = v43[0];
              long long v42 = v43[1];
              *(void *)a3 = v20;
              *(void *)(a3 + 8) = v22;
              *(_OWORD *)(a3 + 16) = v41;
              *(_OWORD *)(a3 + 32) = v42;
              *(unsigned char *)(a3 + 48) = v40;
              return result;
            }
            goto LABEL_15;
          }
        }
      }
LABEL_14:
      swift_bridgeObjectRelease();
LABEL_15:
      uint64_t result = swift_bridgeObjectRelease();
      *(unsigned char *)(a3 + 48) = 0;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)a3 = 0u;
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

uint64_t sub_260B05688(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  sub_260B23C40();
  return sub_260B23C90();
}

uint64_t sub_260B05708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = a7;
  uint64_t v16 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)&v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(a8, a1, v16);
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = a7;
  uint64_t result = type metadata accessor for UNSList.FlattenedGroup(0, (uint64_t)&v19);
  uint64_t v18 = (void *)(a8 + *(int *)(result + 52));
  *uint64_t v18 = a2;
  v18[1] = a3;
  return result;
}

uint64_t UNSList.flattenedGroups.getter(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = a1[2];
  uint64_t v1 = v6;
  uint64_t v7 = v2;
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  type metadata accessor for UNSList.FlattenedGroup(0, (uint64_t)&v6);
  uint64_t v10 = sub_260B23B60();
  swift_bridgeObjectRetain();
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  type metadata accessor for UNSList.Section(255, (uint64_t)&v6);
  sub_260B23D40();
  swift_getWitnessTable();
  sub_260B23CD0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_260B058BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v11[4] = *a1;
  swift_bridgeObjectRetain();
  v11[0] = a3;
  v11[1] = a4;
  v11[2] = a5;
  v11[3] = a6;
  type metadata accessor for UNSList.Section.Group(255, (uint64_t)v11);
  sub_260B23D40();
  swift_getWitnessTable();
  sub_260B23CD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260B059A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v35 = a4;
  uint64_t v36 = a5;
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v32 = a1;
  uint64_t v40 = a6;
  uint64_t v41 = a7;
  uint64_t v42 = a8;
  uint64_t v43 = a9;
  uint64_t v30 = a9;
  uint64_t v31 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)&v40);
  uint64_t v12 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v29 = (uint64_t)&v28 - v13;
  uint64_t v40 = a6;
  uint64_t v41 = a7;
  uint64_t v42 = a8;
  uint64_t v43 = a9;
  uint64_t v15 = a8;
  uint64_t v16 = type metadata accessor for UNSList.FlattenedGroup(0, (uint64_t)&v40);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v28 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v32, v31);
  uint64_t v37 = v33;
  uint64_t v38 = v34;
  uint64_t v39 = v35;
  uint64_t v40 = a6;
  uint64_t v41 = a7;
  uint64_t v42 = v15;
  uint64_t v23 = v30;
  uint64_t v43 = v30;
  uint64_t v24 = type metadata accessor for UNSList.Section(0, (uint64_t)&v40);
  unint64_t v25 = UNSList.Section.id.getter(v24);
  sub_260B05708(v29, v25, v26, a6, a7, v15, v23, (uint64_t)v22);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
  sub_260B23D40();
  sub_260B23D30();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v16);
}

uint64_t static UNSList.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = a3;
  v7[1] = a4;
  _OWORD v7[2] = a5;
  v7[3] = a6;
  type metadata accessor for UNSList.Section(0, (uint64_t)v7);
  swift_getWitnessTable();
  return sub_260B23D50() & 1;
}

uint64_t sub_260B05C88(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x736E6F6974636573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_260B23F50();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_260B05D10()
{
  return sub_260B23FE0();
}

uint64_t sub_260B05D54()
{
  return sub_260B23FC0();
}

uint64_t sub_260B05D7C()
{
  return sub_260B23FE0();
}

uint64_t sub_260B05DBC()
{
  return 0x736E6F6974636573;
}

uint64_t sub_260B05DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_260B05DEC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_260B05C88, a4);
}

uint64_t sub_260B05DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void)@<X4>, unsigned char *a5@<X8>)
{
  uint64_t result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5]);
  *a5 = result & 1;
  return result;
}

uint64_t sub_260B05E2C@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_260B05E6C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_260B05EC0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t UNSList.encode(to:)(void *a1, void *a2)
{
  uint64_t v4 = a2[2];
  uint64_t v14 = a2[3];
  uint64_t v15 = v4;
  uint64_t v5 = a2[4];
  uint64_t v12 = a2[5];
  uint64_t v13 = v5;
  uint64_t v18 = v4;
  uint64_t v19 = v14;
  uint64_t v20 = v5;
  uint64_t v21 = v12;
  type metadata accessor for UNSList.CodingKeys(255, (uint64_t)&v18);
  swift_getWitnessTable();
  uint64_t v6 = sub_260B23F40();
  uint64_t v16 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B24000();
  uint64_t v22 = v9;
  uint64_t v18 = v15;
  uint64_t v19 = v14;
  uint64_t v20 = v13;
  uint64_t v21 = v12;
  type metadata accessor for UNSList.Section(255, (uint64_t)&v18);
  sub_260B23D40();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_260B23F30();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v8, v6);
}

uint64_t UNSList.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v16 = a6;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v25 = a5;
  uint64_t v18 = a5;
  type metadata accessor for UNSList.CodingKeys(255, (uint64_t)&v22);
  swift_getWitnessTable();
  uint64_t v19 = sub_260B23ED0();
  uint64_t v17 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v11 = (char *)&v16 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v12 = v20;
  sub_260B23FF0();
  if (!v12)
  {
    uint64_t v13 = v17;
    uint64_t v22 = a2;
    uint64_t v23 = a3;
    uint64_t v24 = a4;
    uint64_t v25 = v18;
    type metadata accessor for UNSList.Section(255, (uint64_t)&v22);
    sub_260B23D40();
    uint64_t WitnessTable = swift_getWitnessTable();
    swift_getWitnessTable();
    uint64_t v14 = v19;
    sub_260B23EB0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v14);
    *uint64_t v16 = v26;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_260B0634C@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  return UNSList.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_260B06370(void *a1, void *a2)
{
  return UNSList.encode(to:)(a1, a2);
}

uint64_t sub_260B06388(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static UNSList.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t UNSList.FlattenedGroup<>.id.getter()
{
  return _s25UserNotificationsServices7UNSListV14FlattenedGroupVAASSRszrlE2id4fromSSSaySSG_tFZ_0(*v0);
}

uint64_t sub_260B063A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s25UserNotificationsServices7UNSListV14FlattenedGroupVAASSRszrlE2id4fromSSSaySSG_tFZ_0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_260B063D0(uint64_t a1)
{
  uint64_t v2 = sub_260B23B20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B09EB0(&qword_26A8D5090, MEMORY[0x263F045C0]);
  uint64_t v6 = sub_260B23CC0();
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_260B067BC(0, v6 & ~(v6 >> 63), 0);
  uint64_t v7 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t result = sub_260B23CB0();
  if ((v6 & 0x8000000000000000) == 0)
  {
    unint64_t v9 = v36;
    if (v6)
    {
      uint64_t v10 = *(void *)(v35 + 16);
      uint64_t v33 = v35;
      *(void *)&long long v34 = v10;
      uint64_t v32 = v35 + 32;
      long long v31 = xmmword_260B249D0;
      unint64_t v11 = v36;
      while ((void)v34 != v11)
      {
        if ((v9 & 0x8000000000000000) != 0) {
          goto LABEL_21;
        }
        if (v11 >= *(void *)(v33 + 16)) {
          goto LABEL_22;
        }
        char v12 = *(unsigned char *)(v32 + v11);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5098);
        uint64_t v13 = swift_allocObject();
        *(_OWORD *)(v13 + 16) = v31;
        *(void *)(v13 + 56) = MEMORY[0x263F8D6C8];
        *(void *)(v13 + 64) = MEMORY[0x263F8D750];
        *(void *)(v13 + 32) = 2;
        *(void *)(v13 + 96) = MEMORY[0x263F8E778];
        *(void *)(v13 + 104) = MEMORY[0x263F8E7C0];
        *(unsigned char *)(v13 + 72) = v12;
        uint64_t result = sub_260B23BD0();
        uint64_t v14 = result;
        uint64_t v16 = v15;
        uint64_t v37 = v7;
        unint64_t v18 = *(void *)(v7 + 16);
        unint64_t v17 = *(void *)(v7 + 24);
        if (v18 >= v17 >> 1)
        {
          uint64_t result = (uint64_t)sub_260B067BC((char *)(v17 > 1), v18 + 1, 1);
          uint64_t v7 = v37;
        }
        *(void *)(v7 + 16) = v18 + 1;
        uint64_t v19 = v7 + 16 * v18;
        *(void *)(v19 + 32) = v14;
        *(void *)(v19 + 40) = v16;
        ++v11;
        if (!--v6)
        {
          unint64_t v36 = v11;
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
    }
    else
    {
      unint64_t v11 = v36;
LABEL_12:
      uint64_t v20 = v35;
      unint64_t v21 = *(void *)(v35 + 16);
      if (v11 == v21)
      {
LABEL_13:
        swift_bridgeObjectRelease();
        return v7;
      }
      long long v34 = xmmword_260B249D0;
      while (v11 < v21)
      {
        char v22 = *(unsigned char *)(v20 + 32 + v11);
        unint64_t v36 = v11 + 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5098);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = v34;
        *(void *)(v23 + 56) = MEMORY[0x263F8D6C8];
        *(void *)(v23 + 64) = MEMORY[0x263F8D750];
        *(void *)(v23 + 32) = 2;
        *(void *)(v23 + 96) = MEMORY[0x263F8E778];
        *(void *)(v23 + 104) = MEMORY[0x263F8E7C0];
        *(unsigned char *)(v23 + 72) = v22;
        uint64_t result = sub_260B23BD0();
        uint64_t v24 = result;
        uint64_t v26 = v25;
        uint64_t v37 = v7;
        unint64_t v28 = *(void *)(v7 + 16);
        unint64_t v27 = *(void *)(v7 + 24);
        if (v28 >= v27 >> 1)
        {
          uint64_t result = (uint64_t)sub_260B067BC((char *)(v27 > 1), v28 + 1, 1);
          uint64_t v7 = v37;
        }
        *(void *)(v7 + 16) = v28 + 1;
        uint64_t v29 = v7 + 16 * v28;
        *(void *)(v29 + 32) = v24;
        *(void *)(v29 + 40) = v26;
        unint64_t v11 = v36;
        unint64_t v21 = *(void *)(v20 + 16);
        if (v36 == v21) {
          goto LABEL_13;
        }
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL sub_260B0679C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_260B067B0(void *a1@<X8>)
{
  *a1 = *v1;
}

char *sub_260B067BC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_260B067DC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_260B067DC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D50A0);
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

uint64_t sub_260B068E0()
{
  return 12;
}

unint64_t sub_260B068E8(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  uint64_t result = sub_260B23C50();
  if (v6) {
    uint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }

  return sub_260B23CA0();
}

uint64_t sub_260B06998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != 1)
  {
    if (a5) {
      return result;
    }
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_260B069F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != 1)
  {
    if (a5) {
      return result;
    }
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for UNSList.Section.Group.GroupingMethod(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.Group.GroupingMethod);
}

uint64_t sub_260B06A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_260B06AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_260B06B40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for UNSList.Section.Group.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.Group.CodingKeys);
}

uint64_t type metadata accessor for UNSList.Section.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.CodingKeys);
}

uint64_t type metadata accessor for UNSList.FlattenedGroup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.FlattenedGroup);
}

uint64_t sub_260B06BE4(void *a1)
{
  return sub_260B058BC(a1, v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t type metadata accessor for UNSList.Section(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section);
}

uint64_t type metadata accessor for UNSList.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.CodingKeys);
}

uint64_t sub_260B06C38()
{
  return 2;
}

uint64_t sub_260B06C40()
{
  return 4;
}

uint64_t _s25UserNotificationsServices7UNSListV14FlattenedGroupVAASSRszrlE2id4fromSSSaySSG_tFZ_0(uint64_t a1)
{
  v32[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_260B23B20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_260B23BF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_260B23B50();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v31 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B23B40();
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v24 = v11;
    uint64_t v25 = v5;
    uint64_t v26 = v3;
    uint64_t v27 = v2;
    uint64_t v14 = (void (**)(char *, uint64_t))(v7 + 8);
    swift_bridgeObjectRetain();
    uint64_t v23 = a1;
    uint64_t v15 = a1 + 40;
    uint64_t v29 = v6;
    uint64_t v30 = v10;
    do
    {
      swift_bridgeObjectRetain();
      sub_260B23BE0();
      uint64_t v16 = sub_260B23BC0();
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      (*v14)(v9, v6);
      if (v18 >> 60 != 15)
      {
        switch(v18 >> 62)
        {
          case 1uLL:
            if (v16 >> 32 < (int)v16)
            {
              __break(1u);
LABEL_21:
              __break(1u);
LABEL_22:
              __break(1u);
LABEL_23:
              __break(1u);
            }
            sub_260B09DEC(v16, v18);
            if (sub_260B239D0() && __OFSUB__((int)v16, sub_260B239F0())) {
              goto LABEL_23;
            }
            sub_260B239E0();
            sub_260B09EB0(&qword_26A8D5088, MEMORY[0x263F047F8]);
            uint64_t v10 = v30;
            sub_260B23B10();
LABEL_17:
            sub_260B09E44(v16, v18);
            sub_260B09E44(v16, v18);
            uint64_t v6 = v29;
            break;
          case 2uLL:
            uint64_t v19 = *(void *)(v16 + 16);
            uint64_t v28 = *(void *)(v16 + 24);
            sub_260B09DD8(v16, v18);
            swift_retain();
            swift_retain();
            if (sub_260B239D0() && __OFSUB__(v19, sub_260B239F0())) {
              goto LABEL_22;
            }
            if (__OFSUB__(v28, v19)) {
              goto LABEL_21;
            }
            sub_260B239E0();
            sub_260B09EB0(&qword_26A8D5088, MEMORY[0x263F047F8]);
            uint64_t v10 = v30;
            sub_260B23B10();
            swift_release();
            swift_release();
            goto LABEL_17;
          case 3uLL:
            sub_260B09EB0(&qword_26A8D5088, MEMORY[0x263F047F8]);
            memset(v32, 0, 14);
            goto LABEL_4;
          default:
            v32[0] = v16;
            LOWORD(v32[1]) = v18;
            BYTE2(v32[1]) = BYTE2(v18);
            BYTE3(v32[1]) = BYTE3(v18);
            BYTE4(v32[1]) = BYTE4(v18);
            BYTE5(v32[1]) = BYTE5(v18);
            sub_260B09EB0(&qword_26A8D5088, MEMORY[0x263F047F8]);
LABEL_4:
            sub_260B23B10();
            sub_260B09E44(v16, v18);
            sub_260B09E44(v16, v18);
            break;
        }
      }
      v15 += 16;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    uint64_t v3 = v26;
    uint64_t v2 = v27;
    uint64_t v11 = v24;
    unint64_t v5 = v25;
  }
  uint64_t v20 = v31;
  sub_260B23B30();
  v32[0] = sub_260B063D0((uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5078);
  sub_260B09D34();
  uint64_t v21 = sub_260B23B80();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v20, v10);
  return v21;
}

uint64_t sub_260B07268()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_260B07274()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B07290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t type metadata accessor for UNSList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList);
}

unint64_t sub_260B072B4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t result = *(void *)(a1 + 16);
  if (result >= 0xB)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_260B07304(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2 + 1;
  unint64_t v4 = a2[2];
  swift_bridgeObjectRetain();
  if (v4 >= 0xB)
  {
    a1[1] = *v3;
    a1[2] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v3;
  }
  return a1;
}

void *sub_260B0736C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v4 = a2[2];
  if (a1[2] >= 0xBuLL)
  {
    if (v4 >= 0xB)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_260B0742C((uint64_t)(a1 + 1));
    goto LABEL_6;
  }
  if (v4 < 0xB)
  {
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    return a1;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_260B0742C(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *sub_260B07494(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  unint64_t v4 = a2 + 1;
  if (a1[2] >= 0xBuLL)
  {
    unint64_t v5 = a2[2];
    if (v5 >= 0xB)
    {
      a1[1] = *v4;
      a1[2] = v5;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_260B0742C((uint64_t)(a1 + 1));
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)v4;
  return a1;
}

uint64_t sub_260B07514(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_260B0755C(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_260B0759C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

unint64_t sub_260B075A8(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_260B075C0(uint64_t a1, uint64_t a2)
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

void *sub_260B0760C(void *a1, void *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_260B076BC(uint64_t a1, uint64_t a2)
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

uint64_t sub_260B07720(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF4 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483637);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 10;
  if (v4 >= 0xC) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_260B07778(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF5)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483637;
    if (a3 >= 0x7FFFFFF5) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF5) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 10;
    }
  }
  return result;
}

uint64_t sub_260B077C8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_260B077E0(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

uint64_t sub_260B07800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

void sub_260B07808()
{
  sub_260B08368();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_260B078B4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    uint64_t v9 = a2[2];
    uint64_t v10 = a2[3];
    uint64_t v11 = a2[4];
    char v12 = *((unsigned char *)a2 + 40);
    swift_bridgeObjectRetain();
    sub_260B06998(v8, v9, v10, v11, v12);
    *(void *)(a1 + 8) = v8;
    *(void *)(a1 + 16) = v9;
    *(void *)(a1 + 24) = v10;
    *(void *)(a1 + 32) = v11;
    *(unsigned char *)(a1 + 40) = v12;
    uint64_t v13 = *(int *)(a3 + 56);
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_260B23A10();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v19 = *(int *)(a3 + 60);
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_260B07A6C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_260B069F8(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = sub_260B23A10();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_260B07B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  char v10 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_260B06998(v6, v7, v8, v9, v10);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 40) = v10;
  uint64_t v11 = *(int *)(a3 + 56);
  char v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_260B23A10();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = *(int *)(a3 + 60);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_260B07CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  char v10 = *(unsigned char *)(a2 + 40);
  sub_260B06998(v6, v7, v8, v9, v10);
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  char v15 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v10;
  sub_260B069F8(v11, v12, v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 56);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_260B23A10();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v9) = v21(v17, 1, v19);
  int v22 = v21(v18, 1, v19);
  if (!v9)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_7:
  uint64_t v24 = *(int *)(a3 + 60);
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_260B07EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(int *)(a3 + 56);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_260B23A10();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 60)) = *(_OWORD *)(a2 + *(int *)(a3 + 60));
  return a1;
}

uint64_t sub_260B0800C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v6 = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v6;
  sub_260B069F8(v7, v8, v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 56);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_260B23A10();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_7:
  uint64_t v21 = *(int *)(a3 + 60);
  int v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *int v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_260B081E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260B081F4);
}

uint64_t sub_260B081F4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    char v11 = (char *)a1 + *(int *)(a3 + 56);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_260B082A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260B082BC);
}

void *sub_260B082BC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *__n128 result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 56);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_260B08368()
{
  if (!qword_26B402990)
  {
    sub_260B23A10();
    unint64_t v0 = sub_260B23DC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B402990);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for UserNotification.LegacyAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_260B083F4(uint64_t a1)
{
  return sub_260B069F8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_260B08408(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_260B06998(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t sub_260B0846C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_260B06998(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_260B069F8(v8, v9, v10, v11, v12);
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

uint64_t sub_260B084F4(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_260B069F8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t sub_260B08540(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_260B08588(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_260B085D0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_260B085E8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

uint64_t sub_260B08614()
{
  return 0;
}

uint64_t type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingError(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for UNSList.Section.Group.GroupingMethod.CodingError);
}

uint64_t sub_260B08634(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = *(_OWORD *)(a1 + 16);
  v4[1] = v1;
  uint64_t result = type metadata accessor for UNSList.Section.Group(319, (uint64_t)v4);
  if (v3 <= 0x3F)
  {
    *(void *)&v4[0] = *(void *)(result - 8) + 64;
    *((void *)&v4[0] + 1) = &unk_260B24FB0;
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_260B086D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    uint64_t v9 = a2[2];
    uint64_t v10 = a2[3];
    uint64_t v11 = a2[4];
    char v12 = *((unsigned char *)a2 + 40);
    swift_bridgeObjectRetain();
    sub_260B06998(v8, v9, v10, v11, v12);
    *(void *)(a1 + 8) = v8;
    *(void *)(a1 + 16) = v9;
    *(void *)(a1 + 24) = v10;
    *(void *)(a1 + 32) = v11;
    *(unsigned char *)(a1 + 40) = v12;
    long long v13 = *(_OWORD *)(a3 + 32);
    v30[0] = *(_OWORD *)(a3 + 16);
    v30[1] = v13;
    uint64_t v14 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v30);
    uint64_t v15 = *(int *)(v14 + 56);
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_260B23A10();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    uint64_t v21 = *(int *)(v14 + 60);
    int v22 = (void *)(a1 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *int v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = *(int *)(a3 + 52);
    uint64_t v26 = (void *)(a1 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_260B088C8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_260B069F8(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  long long v4 = *(_OWORD *)(a2 + 32);
  v9[0] = *(_OWORD *)(a2 + 16);
  v9[1] = v4;
  uint64_t v5 = a1 + *(int *)(type metadata accessor for UNSList.Section.Group(0, (uint64_t)v9) + 56);
  uint64_t v6 = sub_260B23A10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260B089D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  char v10 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_260B06998(v6, v7, v8, v9, v10);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 40) = v10;
  long long v11 = *(_OWORD *)(a3 + 32);
  v28[0] = *(_OWORD *)(a3 + 16);
  v28[1] = v11;
  uint64_t v12 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v28);
  uint64_t v13 = *(int *)(v12 + 56);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_260B23A10();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = *(int *)(v12 + 60);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = *(int *)(a3 + 52);
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_260B08B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  char v10 = *(unsigned char *)(a2 + 40);
  sub_260B06998(v6, v7, v8, v9, v10);
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  char v15 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v10;
  sub_260B069F8(v11, v12, v13, v14, v15);
  long long v16 = *(_OWORD *)(a3 + 32);
  uint64_t v34 = a3;
  v35[0] = *(_OWORD *)(a3 + 16);
  v35[1] = v16;
  uint64_t v17 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v35);
  uint64_t v18 = *(int *)(v17 + 56);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_260B23A10();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  uint64_t v27 = *(int *)(v17 + 60);
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = *(int *)(v34 + 52);
  long long v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  *long long v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_260B08DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v6 = *(_OWORD *)(a3 + 32);
  v15[0] = *(_OWORD *)(a3 + 16);
  v15[1] = v6;
  uint64_t v7 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v15);
  uint64_t v8 = *(int *)(v7 + 56);
  uint64_t v9 = (void *)(a1 + v8);
  char v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_260B23A10();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + *(int *)(v7 + 60)) = *(_OWORD *)(a2 + *(int *)(v7 + 60));
  *(_OWORD *)(a1 + *(int *)(a3 + 52)) = *(_OWORD *)(a2 + *(int *)(a3 + 52));
  return a1;
}

uint64_t sub_260B08F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v6 = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v6;
  sub_260B069F8(v7, v8, v9, v10, v11);
  long long v12 = *(_OWORD *)(a3 + 32);
  uint64_t v34 = a3;
  v35[0] = *(_OWORD *)(a3 + 16);
  v35[1] = v12;
  uint64_t v13 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v35);
  uint64_t v14 = *(int *)(v13 + 56);
  char v15 = (void *)(a1 + v14);
  long long v16 = (void *)(a2 + v14);
  uint64_t v17 = sub_260B23A10();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 40))(v15, v16, v17);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 32))(v15, v16, v17);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
LABEL_7:
  uint64_t v23 = *(int *)(v13 + 60);
  int v24 = (void *)(a1 + v23);
  int v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *int v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = *(int *)(v34 + 52);
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *uint64_t v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_260B09160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260B09174);
}

uint64_t sub_260B09174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a3 + 32);
  v11[0] = *(_OWORD *)(a3 + 16);
  v11[1] = v6;
  uint64_t v7 = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v11);
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, a2, v7);
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 52) + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t sub_260B09234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260B09248);
}

uint64_t sub_260B09248(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  long long v8 = *(_OWORD *)(a4 + 32);
  v11[0] = *(_OWORD *)(a4 + 16);
  v11[1] = v8;
  uint64_t result = type metadata accessor for UNSList.Section.Group(0, (uint64_t)v11);
  uint64_t v10 = *(void *)(result - 8);
  if (*(_DWORD *)(v10 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 52) + 8) = (a2 - 1);
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_260B09318(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_260B09320(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t _s25UserNotificationsServices16UserNotificationV16LocalizedContentV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_260B093BC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B09488);
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

uint64_t getEnumTagSinglePayload for UserNotification.LegacyAction.Style(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_260B09540(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B0960CLL);
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

uint64_t sub_260B09634(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *sub_260B096C4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B09790);
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

unsigned char *sub_260B097B8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t sub_260B097C0(unsigned int *a1, int a2)
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

unsigned char *sub_260B09810(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x260B098ACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260B098D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B098F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B0990C()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09928()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09944()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09960()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B0997C()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09998()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B099B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B099D0()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B099EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09A08()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09A24()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09A40()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09A5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09A78()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09A94()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09AB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09ACC()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09AE8()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09B04()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09B20()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09B3C()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09B58()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09B74()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09B90()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09BAC()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09BC8()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09BE4()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09C00()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09C1C()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09C38()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09C54()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09C70()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09C8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09CA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09CC4()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09CE0()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09CFC()
{
  return swift_getWitnessTable();
}

uint64_t sub_260B09D18()
{
  return swift_getWitnessTable();
}

unint64_t sub_260B09D34()
{
  unint64_t result = qword_26A8D5080;
  if (!qword_26A8D5080)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8D5078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5080);
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

uint64_t sub_260B09DD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_260B09DEC(a1, a2);
  }
  return a1;
}

uint64_t sub_260B09DEC(uint64_t a1, unint64_t a2)
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

uint64_t sub_260B09E44(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_260B09E58(a1, a2);
  }
  return a1;
}

uint64_t sub_260B09E58(uint64_t a1, unint64_t a2)
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

uint64_t sub_260B09EB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_260B09EFC(uint64_t a1)
{
  return sub_260B059A0(a1, v1[6], v1[7], v1[8], v1[9], v1[2], v1[3], v1[4], v1[5]);
}

UserNotificationsServices::UserNotificationDestinations __swiftcall UserNotificationDestinations.init(rawValue:)(UserNotificationsServices::UserNotificationDestinations rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static UserNotificationDestinations.notices.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static UserNotificationDestinations.banner.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static UserNotificationDestinations.modalAlert.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static UserNotificationDestinations.lockScreen.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static UserNotificationDestinations.sound.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static UserNotificationDestinations.lockedBanner.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static UserNotificationDestinations.lockedModalAlert.getter(void *a1@<X8>)
{
  *a1 = 64;
}

void static UserNotificationDestinations.car.getter(void *a1@<X8>)
{
  *a1 = 128;
}

void static UserNotificationDestinations.spoken.getter(void *a1@<X8>)
{
  *a1 = 256;
}

void static UserNotificationDestinations.settings.getter(void *a1@<X8>)
{
  *a1 = 512;
}

void static UserNotificationDestinations.forwarding.getter(void *a1@<X8>)
{
  *a1 = 1024;
}

void static UserNotificationDestinations.display.getter(void *a1@<X8>)
{
  *a1 = 2048;
}

void static UserNotificationDestinations.spokenCar.getter(void *a1@<X8>)
{
  *a1 = 4096;
}

void static UserNotificationDestinations.digest.getter(void *a1@<X8>)
{
  *a1 = 0x2000;
}

void static UserNotificationDestinations.remoteNotifications.getter(void *a1@<X8>)
{
  *a1 = 0x4000;
}

void sub_260B0A004()
{
  uint64_t v0 = unk_270CE2840;
  if ((unk_270CE2840 & ~qword_270CE2838) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = v0 | qword_270CE2838;
  uint64_t v2 = qword_270CE2848;
  if ((qword_270CE2848 & ~v1) == 0) {
    uint64_t v2 = 0;
  }
  uint64_t v3 = v2 | v1;
  if ((unk_270CE2850 & ~v3) != 0) {
    uint64_t v4 = unk_270CE2850;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 | v3;
  uint64_t v6 = qword_270CE2858;
  if ((qword_270CE2858 & ~v5) == 0) {
    uint64_t v6 = 0;
  }
  qword_26A8D50A8 = v6 | v5;
}

uint64_t sub_260B0A054@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

void *static UserNotificationDestinations.interrupting.getter@<X0>(void *a1@<X8>)
{
  return sub_260B0A150(&qword_26A8D47B8, &qword_26A8D50A8, a1);
}

uint64_t sub_260B0A0D0()
{
  if (qword_26A8D47B8 != -1) {
    uint64_t result = swift_once();
  }
  qword_26A8D50B0 = qword_26A8D50A8 | 0x7D91;
  return result;
}

void *static UserNotificationDestinations.all.getter@<X0>(void *a1@<X8>)
{
  return sub_260B0A150(&qword_26A8D47C0, &qword_26A8D50B0, a1);
}

void *sub_260B0A150@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result != -1) {
    uint64_t result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

uint64_t UserNotificationDestinations.rawValue.getter()
{
  return *(void *)v0;
}

void *sub_260B0A19C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_260B0A1A8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_260B0A1B0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_260B0A1C4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_260B0A1D8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_260B0A1EC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_260B0A21C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_260B0A248@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_260B0A26C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_260B0A280(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_260B0A294(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_260B0A2A8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_260B0A2BC(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_260B0A2D0(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_260B0A2E4(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_260B0A2F8()
{
  return *v0 == 0;
}

uint64_t sub_260B0A308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_260B0A320(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_260B0A334@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t UserNotificationDestinations.description.getter()
{
  uint64_t v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    uint64_t v2 = (char *)MEMORY[0x263F8EE78];
    if ((v1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_260B0ABAC(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  uint64_t v5 = &v2[16 * v4];
  *((void *)v5 + 4) = 0x73656369746F6ELL;
  *((void *)v5 + 5) = 0xE700000000000000;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_260B0ABAC((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    int v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x72656E6E6162;
    *((void *)v8 + 5) = 0xE600000000000000;
  }
LABEL_12:
  if ((v1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v10 = *((void *)v2 + 2);
    unint64_t v9 = *((void *)v2 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_260B0ABAC((char *)(v9 > 1), v10 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v10 + 1;
    char v11 = &v2[16 * v10];
    *((void *)v11 + 4) = 0x656C416C61646F6DLL;
    *((void *)v11 + 5) = 0xEA00000000007472;
    if ((v1 & 8) == 0)
    {
LABEL_14:
      if ((v1 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_27;
    }
  }
  else if ((v1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v13 = *((void *)v2 + 2);
  unint64_t v12 = *((void *)v2 + 3);
  if (v13 >= v12 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v12 > 1), v13 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v13 + 1;
  uint64_t v14 = &v2[16 * v13];
  *((void *)v14 + 4) = 0x657263536B636F6CLL;
  *((void *)v14 + 5) = 0xEA00000000006E65;
  if ((v1 & 0x10) == 0)
  {
LABEL_15:
    if ((v1 & 0x20) == 0) {
      goto LABEL_37;
    }
    goto LABEL_32;
  }
LABEL_27:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v16 = *((void *)v2 + 2);
  unint64_t v15 = *((void *)v2 + 3);
  if (v16 >= v15 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v15 > 1), v16 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v16 + 1;
  uint64_t v17 = &v2[16 * v16];
  *((void *)v17 + 4) = 0x646E756F73;
  *((void *)v17 + 5) = 0xE500000000000000;
  if ((v1 & 0x20) != 0)
  {
LABEL_32:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v19 = *((void *)v2 + 2);
    unint64_t v18 = *((void *)v2 + 3);
    if (v19 >= v18 >> 1) {
      uint64_t v2 = sub_260B0ABAC((char *)(v18 > 1), v19 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v19 + 1;
    int v20 = &v2[16 * v19];
    strcpy(v20 + 32, "lockedBanner");
    v20[45] = 0;
    *((_WORD *)v20 + 23) = -5120;
  }
LABEL_37:
  if ((v1 & 0x40) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v22 = *((void *)v2 + 2);
    unint64_t v21 = *((void *)v2 + 3);
    if (v22 >= v21 >> 1) {
      uint64_t v2 = sub_260B0ABAC((char *)(v21 > 1), v22 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v22 + 1;
    uint64_t v23 = &v2[16 * v22];
    *((void *)v23 + 4) = 0xD000000000000010;
    *((void *)v23 + 5) = 0x8000000260B28530;
    if ((v1 & 0x80) == 0)
    {
LABEL_39:
      if ((v1 & 0x100) == 0) {
        goto LABEL_40;
      }
      goto LABEL_57;
    }
  }
  else if ((v1 & 0x80) == 0)
  {
    goto LABEL_39;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v25 = *((void *)v2 + 2);
  unint64_t v24 = *((void *)v2 + 3);
  if (v25 >= v24 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v24 > 1), v25 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v25 + 1;
  uint64_t v26 = &v2[16 * v25];
  *((void *)v26 + 4) = 7496035;
  *((void *)v26 + 5) = 0xE300000000000000;
  if ((v1 & 0x100) == 0)
  {
LABEL_40:
    if ((v1 & 0x200) == 0) {
      goto LABEL_41;
    }
    goto LABEL_62;
  }
LABEL_57:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v28 = *((void *)v2 + 2);
  unint64_t v27 = *((void *)v2 + 3);
  if (v28 >= v27 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v27 > 1), v28 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v28 + 1;
  uint64_t v29 = &v2[16 * v28];
  *((void *)v29 + 4) = 0x6E656B6F7073;
  *((void *)v29 + 5) = 0xE600000000000000;
  if ((v1 & 0x200) == 0)
  {
LABEL_41:
    if ((v1 & 0x400) == 0) {
      goto LABEL_42;
    }
    goto LABEL_67;
  }
LABEL_62:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v31 = *((void *)v2 + 2);
  unint64_t v30 = *((void *)v2 + 3);
  if (v31 >= v30 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v30 > 1), v31 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v31 + 1;
  uint64_t v32 = &v2[16 * v31];
  *((void *)v32 + 4) = 0x73676E6974746573;
  *((void *)v32 + 5) = 0xE800000000000000;
  if ((v1 & 0x400) == 0)
  {
LABEL_42:
    if ((v1 & 0x800) == 0) {
      goto LABEL_43;
    }
    goto LABEL_72;
  }
LABEL_67:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v34 = *((void *)v2 + 2);
  unint64_t v33 = *((void *)v2 + 3);
  if (v34 >= v33 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v33 > 1), v34 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v34 + 1;
  uint64_t v35 = &v2[16 * v34];
  *((void *)v35 + 4) = 0x6964726177726F66;
  *((void *)v35 + 5) = 0xEA0000000000676ELL;
  if ((v1 & 0x800) == 0)
  {
LABEL_43:
    if ((v1 & 0x1000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_77;
  }
LABEL_72:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v37 = *((void *)v2 + 2);
  unint64_t v36 = *((void *)v2 + 3);
  if (v37 >= v36 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v36 > 1), v37 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v37 + 1;
  uint64_t v38 = &v2[16 * v37];
  *((void *)v38 + 4) = 0x79616C70736964;
  *((void *)v38 + 5) = 0xE700000000000000;
  if ((v1 & 0x1000) == 0)
  {
LABEL_44:
    if ((v1 & 0x2000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_82;
  }
LABEL_77:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v40 = *((void *)v2 + 2);
  unint64_t v39 = *((void *)v2 + 3);
  if (v40 >= v39 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v39 > 1), v40 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v40 + 1;
  uint64_t v41 = &v2[16 * v40];
  *((void *)v41 + 4) = 0x61436E656B6F7073;
  *((void *)v41 + 5) = 0xE900000000000072;
  if ((v1 & 0x2000) == 0)
  {
LABEL_45:
    if ((v1 & 0x4000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_87;
  }
LABEL_82:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v43 = *((void *)v2 + 2);
  unint64_t v42 = *((void *)v2 + 3);
  if (v43 >= v42 >> 1) {
    uint64_t v2 = sub_260B0ABAC((char *)(v42 > 1), v43 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v43 + 1;
  unsigned __int8 v44 = &v2[16 * v43];
  *((void *)v44 + 4) = 0x747365676964;
  *((void *)v44 + 5) = 0xE600000000000000;
  if ((v1 & 0x4000) != 0)
  {
LABEL_87:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_260B0ABAC(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v46 = *((void *)v2 + 2);
    unint64_t v45 = *((void *)v2 + 3);
    if (v46 >= v45 >> 1) {
      uint64_t v2 = sub_260B0ABAC((char *)(v45 > 1), v46 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v46 + 1;
    uint64_t v47 = &v2[16 * v46];
    *((void *)v47 + 4) = 0xD000000000000013;
    *((void *)v47 + 5) = 0x8000000260B28510;
  }
LABEL_92:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5078);
  sub_260B09D34();
  sub_260B23B80();
  swift_bridgeObjectRelease();
  sub_260B23C70();
  swift_bridgeObjectRelease();
  sub_260B23C70();
  return 91;
}

char *sub_260B0ABAC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D50A0);
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
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_260B0ACB4()
{
  unint64_t result = qword_26A8D50B8;
  if (!qword_26A8D50B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D50B8);
  }
  return result;
}

unint64_t sub_260B0AD0C()
{
  unint64_t result = qword_26A8D50C0;
  if (!qword_26A8D50C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D50C0);
  }
  return result;
}

unint64_t sub_260B0AD64()
{
  unint64_t result = qword_26A8D50C8;
  if (!qword_26A8D50C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D50C8);
  }
  return result;
}

unint64_t sub_260B0ADBC()
{
  unint64_t result = qword_26A8D50D0;
  if (!qword_26A8D50D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D50D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotificationDestinations()
{
  return &type metadata for UserNotificationDestinations;
}

char *sub_260B0AE20(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D50D8);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

uint64_t sub_260B0AF28(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x6C61636974697263;
  unint64_t v3 = 0xE800000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6C61636974697263;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x736E6553656D6974;
      unint64_t v3 = 0xED00006576697469;
      break;
    case 2:
      unint64_t v3 = 0x8000000260B283E0;
      unint64_t v5 = 0xD000000000000012;
      break;
    case 3:
      unint64_t v5 = 0x7661686542646E64;
      unint64_t v3 = 0xEB00000000726F69;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE800000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xED00006576697469;
      if (v5 == 0x736E6553656D6974) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0x8000000260B283E0;
      unint64_t v2 = 0xD000000000000012;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEB00000000726F69;
      if (v5 == 0x7661686542646E64) {
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
        char v7 = sub_260B23F50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_260B0B0E8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEE00656C74695464;
  uint64_t v3 = a1;
  unint64_t v4 = 0x657A696C61636F6CLL;
  unint64_t v5 = 0xEE00656C74695464;
  switch(v3)
  {
    case 1:
      unint64_t v5 = 0x8000000260B28410;
      unint64_t v4 = 0xD000000000000011;
      break;
    case 2:
      unint64_t v5 = 0xED000079646F4264;
      break;
    case 3:
      unint64_t v5 = 0xE700000000000000;
      unint64_t v4 = 0x7972616D6D7573;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x8000000260B28410;
      if (v4 == 0xD000000000000011) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xED000079646F4264;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xE700000000000000;
      if (v4 == 0x7972616D6D7573) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v4 != 0x657A696C61636F6CLL) {
        goto LABEL_14;
      }
LABEL_12:
      if (v5 == v2) {
        char v6 = 1;
      }
      else {
LABEL_14:
      }
        char v6 = sub_260B23F50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v6 & 1;
  }
}

uint64_t sub_260B0B290()
{
  return sub_260B23FE0();
}

uint64_t sub_260B0B384()
{
  return sub_260B23FE0();
}

uint64_t sub_260B0B478()
{
  return sub_260B23FE0();
}

uint64_t sub_260B0B568()
{
  return sub_260B23FE0();
}

uint64_t sub_260B0B658(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2)
  {
    uint64_t v3 = a2;
    if (a1 != a2)
    {
      uint64_t v4 = 0;
      uint64_t v23 = a1;
      while (1)
      {
        int v6 = *(unsigned __int8 *)(a1 + v4 + 48);
        int v7 = *(unsigned __int8 *)(a1 + v4 + 49);
        uint64_t v8 = *(void *)(a1 + v4 + 56);
        uint64_t v9 = *(void *)(a1 + v4 + 64);
        uint64_t v10 = *(void *)(a1 + v4 + 80);
        int v28 = *(unsigned __int8 *)(a1 + v4 + 88);
        int v11 = *(unsigned __int8 *)(v3 + v4 + 48);
        int v12 = *(unsigned __int8 *)(v3 + v4 + 49);
        uint64_t v14 = *(void *)(v3 + v4 + 56);
        uint64_t v13 = *(void *)(v3 + v4 + 64);
        uint64_t v15 = *(void *)(v3 + v4 + 80);
        uint64_t v25 = *(void *)(v3 + v4 + 72);
        uint64_t v26 = *(void *)(a1 + v4 + 72);
        int v27 = *(unsigned __int8 *)(v3 + v4 + 88);
        if (*(void *)(a1 + v4 + 32) != *(void *)(v3 + v4 + 32)) {
          goto LABEL_13;
        }
        if (*(void *)(a1 + v4 + 40) == *(void *)(v3 + v4 + 40))
        {
          uint64_t result = 0;
          if (v6 != v11 || v7 != v12) {
            return result;
          }
        }
        else
        {
LABEL_13:
          uint64_t v21 = *(void *)(v3 + v4 + 64);
          uint64_t v22 = v2;
          uint64_t v16 = *(void *)(v3 + v4 + 80);
          uint64_t v17 = *(void *)(a1 + v4 + 80);
          uint64_t v18 = *(void *)(a1 + v4 + 56);
          char v19 = sub_260B23F50();
          uint64_t result = 0;
          if ((v19 & 1) == 0) {
            return result;
          }
          if (v6 != v11) {
            return result;
          }
          uint64_t v8 = v18;
          uint64_t v10 = v17;
          uint64_t v15 = v16;
          uint64_t v13 = v21;
          uint64_t v2 = v22;
          if (v7 != v12) {
            return result;
          }
        }
        if (v9)
        {
          if (!v13 || (v8 != v14 || v9 != v13) && (sub_260B23F50() & 1) == 0) {
            return 0;
          }
        }
        else if (v13)
        {
          return 0;
        }
        if (!v10) {
          break;
        }
        if (!v15) {
          return 0;
        }
        if (v26 != v25 || v10 != v15)
        {
          char v20 = sub_260B23F50();
          uint64_t result = 0;
          if ((v20 & 1) == 0) {
            return result;
          }
          goto LABEL_6;
        }
        if (v28 != v27) {
          return 0;
        }
LABEL_7:
        v4 += 64;
        --v2;
        a1 = v23;
        uint64_t v3 = a2;
        if (!v2) {
          return 1;
        }
      }
      uint64_t result = 0;
      if (v15) {
        return result;
      }
LABEL_6:
      if ((v28 ^ v27)) {
        return result;
      }
      goto LABEL_7;
    }
  }
  return 1;
}

id UserNotification.originalContent.getter()
{
  return *v0;
}

void UserNotification.originalContent.setter(void *a1)
{
  id *v1 = a1;
}

uint64_t (*UserNotification.originalContent.modify())()
{
  return nullsub_1;
}

void *UserNotification.originalCategory.getter()
{
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void UserNotification.originalCategory.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*UserNotification.originalCategory.modify())()
{
  return nullsub_1;
}

void UserNotification.origin.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *UserNotification.origin.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*UserNotification.origin.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.legacyContent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_260B1188C(type metadata accessor for UserNotification, &qword_26B4029A0, a1);
}

uint64_t type metadata accessor for UserNotification(uint64_t a1)
{
  return sub_260B0D44C(a1, (uint64_t *)&unk_26B402978);
}

uint64_t UserNotification.legacyContent.setter(uint64_t a1)
{
  return sub_260B118FC(a1, type metadata accessor for UserNotification, &qword_26B4029A0);
}

uint64_t (*UserNotification.legacyContent.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.bundleIdentifier.getter()
{
  uint64_t v1 = type metadata accessor for UserNotification.Identifier(0);
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (uint64_t *)((char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v5 = *v0;
  id v6 = objc_msgSend(v5, sel_request);
  id v7 = objc_msgSend(v6, sel_identifier);

  uint64_t v8 = sub_260B23BB0();
  uint64_t v10 = v9;

  *uint64_t v4 = v8;
  v4[1] = v10;
  id v11 = objc_msgSend(v5, sel_date);
  sub_260B23A80();

  id v12 = objc_msgSend(v5, sel_sourceIdentifier);
  uint64_t v13 = sub_260B23BB0();
  uint64_t v15 = v14;

  uint64_t v16 = (uint64_t *)((char *)v4 + *(int *)(v2 + 32));
  *uint64_t v16 = v13;
  v16[1] = v15;
  swift_bridgeObjectRetain();
  sub_260B0C9C4((uint64_t)v4, type metadata accessor for UserNotification.Identifier);
  return v13;
}

uint64_t type metadata accessor for UserNotification.Identifier(uint64_t a1)
{
  return sub_260B0D44C(a1, qword_26B402A58);
}

void UserNotification.id.getter(uint64_t *a1@<X8>)
{
  id v3 = *v1;
  id v4 = objc_msgSend(v3, sel_request);
  id v5 = objc_msgSend(v4, sel_identifier);

  uint64_t v6 = sub_260B23BB0();
  uint64_t v8 = v7;

  *a1 = v6;
  a1[1] = v8;
  id v9 = objc_msgSend(v3, sel_date);
  uint64_t v10 = type metadata accessor for UserNotification.Identifier(0);
  sub_260B23A80();

  id v11 = objc_msgSend(v3, sel_sourceIdentifier);
  uint64_t v12 = sub_260B23BB0();
  uint64_t v14 = v13;

  uint64_t v15 = (uint64_t *)((char *)a1 + *(int *)(v10 + 24));
  *uint64_t v15 = v12;
  v15[1] = v14;
}

uint64_t UserNotification.requestIdentifier.getter()
{
  uint64_t v1 = type metadata accessor for UserNotification.Identifier(0);
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  id v4 = (uint64_t *)((char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v5 = *v0;
  id v6 = objc_msgSend(v5, sel_request);
  id v7 = objc_msgSend(v6, sel_identifier);

  uint64_t v8 = sub_260B23BB0();
  uint64_t v10 = v9;

  *id v4 = v8;
  v4[1] = v10;
  id v11 = objc_msgSend(v5, sel_date);
  sub_260B23A80();

  id v12 = objc_msgSend(v5, sel_sourceIdentifier);
  uint64_t v13 = sub_260B23BB0();
  uint64_t v15 = v14;

  uint64_t v16 = (uint64_t *)((char *)v4 + *(int *)(v2 + 32));
  *uint64_t v16 = v13;
  v16[1] = v15;
  swift_bridgeObjectRetain();
  sub_260B0C9C4((uint64_t)v4, type metadata accessor for UserNotification.Identifier);
  return v8;
}

id UserNotification.contentType.getter()
{
  id v1 = objc_msgSend(*v0, sel_request);
  id v2 = objc_msgSend(v1, sel_content);

  id v3 = objc_msgSend(v2, sel_contentType);
  return v3;
}

uint64_t UserNotification.threadIdentifier.getter()
{
  id v1 = objc_msgSend(*v0, sel_request);
  id v2 = objc_msgSend(v1, sel_content);

  id v3 = objc_msgSend(v2, sel_threadIdentifier);
  uint64_t v4 = sub_260B23BB0();

  return v4;
}

uint64_t UserNotification.localizedContent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UserNotification(0);
  return sub_260B197EC(v1 + *(int *)(v3 + 32), a1, &qword_26B4029B0);
}

uint64_t UserNotification.localizedContent.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UserNotification(0);
  return sub_260B19850(a1, v1 + *(int *)(v3 + 32), &qword_26B4029B0);
}

uint64_t (*UserNotification.localizedContent.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.derivedBehavior.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for UserNotification(0) + 36));
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;

  return sub_260B0BFE8(v4, v5);
}

uint64_t sub_260B0BFE8(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return MEMORY[0x270F9A8A0]();
  }
  return result;
}

uint64_t UserNotification.derivedBehavior.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for UserNotification(0) + 36));
  uint64_t result = sub_260B0C03C(*v4, v4[1]);
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t sub_260B0C03C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t (*UserNotification.derivedBehavior.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.allowsPrivateProperties.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification(0) + 40));
}

uint64_t UserNotification.allowsPrivateProperties.setter(char a1)
{
  uint64_t result = type metadata accessor for UserNotification(0);
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*UserNotification.allowsPrivateProperties.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.incomingPriority.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for UserNotification(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t UserNotification.incomingPriority.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for UserNotification(0);
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*UserNotification.incomingPriority.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.incomingPersistence.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for UserNotification(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t UserNotification.incomingPersistence.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for UserNotification(0);
  *(unsigned char *)(v1 + *(int *)(result + 48)) = v2;
  return result;
}

uint64_t (*UserNotification.incomingPersistence.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.destinations.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for UserNotification(0);
  *a1 = *(void *)(v1 + *(int *)(result + 52));
  return result;
}

uint64_t UserNotification.destinations.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for UserNotification(0);
  *(void *)(v1 + *(int *)(result + 52)) = v2;
  return result;
}

uint64_t (*UserNotification.destinations.modify())()
{
  return nullsub_1;
}

void *UserNotification.settings.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for UserNotification(0) + 56));
  id v2 = v1;
  return v1;
}

void UserNotification.settings.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for UserNotification(0) + 56);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*UserNotification.settings.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.sourceDeviceType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UserNotification(0);
  return sub_260B197EC(v1 + *(int *)(v3 + 60), a1, &qword_26B402A48);
}

uint64_t UserNotification.sourceDeviceType.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UserNotification(0);
  return sub_260B19850(a1, v1 + *(int *)(v3 + 60), &qword_26B402A48);
}

uint64_t (*UserNotification.sourceDeviceType.modify())()
{
  return nullsub_1;
}

void *UserNotification.derivedCommunicationContext.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for UserNotification(0) + 64));
  id v2 = v1;
  return v1;
}

void UserNotification.derivedCommunicationContext.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for UserNotification(0) + 64);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*UserNotification.derivedCommunicationContext.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.secureAttachments.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for UserNotification(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 68));
  return result;
}

uint64_t UserNotification.secureAttachments.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for UserNotification(0);
  *(unsigned char *)(v1 + *(int *)(result + 68)) = v2;
  return result;
}

uint64_t (*UserNotification.secureAttachments.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.priorityStatus.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for UserNotification(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 72));
  return result;
}

uint64_t UserNotification.priorityStatus.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for UserNotification(0);
  *(unsigned char *)(v1 + *(int *)(result + 72)) = v2;
  return result;
}

uint64_t (*UserNotification.priorityStatus.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.summaryStatus.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for UserNotification(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 76));
  return result;
}

uint64_t UserNotification.summaryStatus.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for UserNotification(0);
  *(unsigned char *)(v1 + *(int *)(result + 76)) = v2;
  return result;
}

uint64_t (*UserNotification.summaryStatus.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.title.getter()
{
  uint64_t v1 = type metadata accessor for UserNotification(0);
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (id *)((char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (uint64_t *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_260B197EC(v0 + *(int *)(v2 + 40), (uint64_t)v7, &qword_26B4029B0);
  uint64_t v8 = type metadata accessor for UserNotification.LocalizedContent(0);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8) == 1)
  {
    sub_260B06B40((uint64_t)v7, &qword_26B4029B0);
    sub_260B19084(v0, (uint64_t)v4, type metadata accessor for UserNotification);
LABEL_4:
    id v11 = objc_msgSend(*v4, sel_request);
    id v12 = objc_msgSend(v11, sel_content);

    id v13 = objc_msgSend(v12, sel_title);
    uint64_t v9 = sub_260B23BB0();

    goto LABEL_5;
  }
  uint64_t v9 = *v7;
  uint64_t v10 = v7[1];
  swift_bridgeObjectRetain();
  sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification.LocalizedContent);
  sub_260B19084(v0, (uint64_t)v4, type metadata accessor for UserNotification);
  if (!v10) {
    goto LABEL_4;
  }
LABEL_5:
  sub_260B0C9C4((uint64_t)v4, type metadata accessor for UserNotification);
  return v9;
}

uint64_t type metadata accessor for UserNotification.LocalizedContent(uint64_t a1)
{
  return sub_260B0D44C(a1, (uint64_t *)&unk_26B402968);
}

uint64_t sub_260B0C9C4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t UserNotification.subtitle.getter()
{
  uint64_t v1 = type metadata accessor for UserNotification(0);
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (id *)((char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B197EC(v0 + *(int *)(v2 + 40), (uint64_t)v7, &qword_26B4029B0);
  uint64_t v8 = type metadata accessor for UserNotification.LocalizedContent(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8) == 1)
  {
    sub_260B06B40((uint64_t)v7, &qword_26B4029B0);
    sub_260B19084(v0, (uint64_t)v4, type metadata accessor for UserNotification);
LABEL_4:
    id v11 = objc_msgSend(*v4, sel_request);
    id v12 = objc_msgSend(v11, sel_content);

    id v13 = objc_msgSend(v12, sel_subtitle);
    uint64_t v9 = sub_260B23BB0();

    goto LABEL_5;
  }
  uint64_t v9 = *((void *)v7 + 2);
  uint64_t v10 = *((void *)v7 + 3);
  swift_bridgeObjectRetain();
  sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification.LocalizedContent);
  sub_260B19084(v0, (uint64_t)v4, type metadata accessor for UserNotification);
  if (!v10) {
    goto LABEL_4;
  }
LABEL_5:
  sub_260B0C9C4((uint64_t)v4, type metadata accessor for UserNotification);
  return v9;
}

uint64_t UserNotification.body.getter()
{
  uint64_t v1 = type metadata accessor for UserNotification(0);
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (id *)((char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B197EC(v0 + *(int *)(v2 + 40), (uint64_t)v7, &qword_26B4029B0);
  uint64_t v8 = type metadata accessor for UserNotification.LocalizedContent(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8) == 1)
  {
    sub_260B06B40((uint64_t)v7, &qword_26B4029B0);
    sub_260B19084(v0, (uint64_t)v4, type metadata accessor for UserNotification);
LABEL_4:
    id v11 = objc_msgSend(*v4, sel_request);
    id v12 = objc_msgSend(v11, sel_content);

    id v13 = objc_msgSend(v12, sel_body);
    uint64_t v9 = sub_260B23BB0();

    goto LABEL_5;
  }
  uint64_t v9 = *((void *)v7 + 4);
  uint64_t v10 = *((void *)v7 + 5);
  swift_bridgeObjectRetain();
  sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification.LocalizedContent);
  sub_260B19084(v0, (uint64_t)v4, type metadata accessor for UserNotification);
  if (!v10) {
    goto LABEL_4;
  }
LABEL_5:
  sub_260B0C9C4((uint64_t)v4, type metadata accessor for UserNotification);
  return v9;
}

uint64_t UserNotification.attributedBody.getter()
{
  return 0;
}

BOOL UserNotification.hasAlertContent.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  id v7 = (char *)&v43 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v43 - v8;
  uint64_t v10 = UserNotification.body.getter();
  unint64_t v12 = v11;
  if (v11) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = 0xE000000000000000;
  }
  uint64_t v49 = v10;
  unint64_t v50 = v13;
  uint64_t v15 = UserNotification.subtitle.getter() & 0xFFFFFFFFFFFFLL;
  if (!v14) {
    uint64_t v15 = 0;
  }
  uint64_t v47 = v15;
  if (v14) {
    unint64_t v16 = v14;
  }
  else {
    unint64_t v16 = 0xE000000000000000;
  }
  unint64_t v51 = v16;
  uint64_t v18 = UserNotification.title.getter() & 0xFFFFFFFFFFFFLL;
  if (!v17) {
    uint64_t v18 = 0;
  }
  uint64_t v46 = v18;
  if (v17) {
    unint64_t v19 = v17;
  }
  else {
    unint64_t v19 = 0xE000000000000000;
  }
  unint64_t v48 = v19;
  uint64_t v20 = v0 + *(int *)(type metadata accessor for UserNotification(0) + 32);
  sub_260B197EC(v20, (uint64_t)v9, &qword_26B4029B0);
  uint64_t v21 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48);
  if (v22(v9, 1, v21) == 1)
  {
    sub_260B06B40((uint64_t)v9, &qword_26B4029B0);
  }
  else
  {
    uint64_t v23 = *((void *)v9 + 4);
    unint64_t v24 = *((void *)v9 + 5);
    swift_bridgeObjectRetain();
    sub_260B0C9C4((uint64_t)v9, type metadata accessor for UserNotification.LocalizedContent);
    unint64_t v52 = v24;
    if (v24)
    {
      uint64_t v45 = v23 & 0xFFFFFFFFFFFFLL;
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v45 = 0;
  unint64_t v52 = 0xE000000000000000;
LABEL_19:
  sub_260B197EC(v20, (uint64_t)v7, &qword_26B4029B0);
  if (v22(v7, 1, v21) == 1)
  {
    sub_260B06B40((uint64_t)v7, &qword_26B4029B0);
  }
  else
  {
    uint64_t v25 = *((void *)v7 + 2);
    unint64_t v26 = *((void *)v7 + 3);
    swift_bridgeObjectRetain();
    sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification.LocalizedContent);
    if (v26)
    {
      uint64_t v44 = v25 & 0xFFFFFFFFFFFFLL;
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v44 = 0;
  unint64_t v26 = 0xE000000000000000;
LABEL_24:
  uint64_t v27 = v49 & 0xFFFFFFFFFFFFLL;
  sub_260B197EC(v20, (uint64_t)v4, &qword_26B4029B0);
  if (v22((char *)v4, 1, v21) == 1)
  {
    sub_260B06B40((uint64_t)v4, &qword_26B4029B0);
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t v30 = 0;
    unint64_t v28 = 0xE000000000000000;
    goto LABEL_29;
  }
  uint64_t v29 = *v4;
  unint64_t v28 = v4[1];
  swift_bridgeObjectRetain();
  sub_260B0C9C4((uint64_t)v4, type metadata accessor for UserNotification.LocalizedContent);
  if (!v28) {
    goto LABEL_28;
  }
  uint64_t v30 = v29 & 0xFFFFFFFFFFFFLL;
LABEL_29:
  unint64_t v31 = v50;
  swift_bridgeObjectRelease();
  if (v12) {
    uint64_t v32 = v27;
  }
  else {
    uint64_t v32 = 0;
  }
  if ((v31 & 0x2000000000000000) != 0) {
    uint64_t v33 = HIBYTE(v31) & 0xF;
  }
  else {
    uint64_t v33 = v32;
  }
  unint64_t v34 = v51;
  swift_bridgeObjectRelease();
  if (v33) {
    goto LABEL_39;
  }
  uint64_t v35 = HIBYTE(v34) & 0xF;
  if ((v34 & 0x2000000000000000) == 0) {
    uint64_t v35 = v47;
  }
  if (v35)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_40:
    swift_bridgeObjectRelease();
    return 1;
  }
  unint64_t v37 = v48;
  swift_bridgeObjectRelease();
  uint64_t v38 = HIBYTE(v37) & 0xF;
  if ((v37 & 0x2000000000000000) == 0) {
    uint64_t v38 = v46;
  }
  if (v38)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  unint64_t v39 = v52;
  swift_bridgeObjectRelease();
  uint64_t v40 = HIBYTE(v39) & 0xF;
  if ((v39 & 0x2000000000000000) == 0) {
    uint64_t v40 = v45;
  }
  if (v40)
  {
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  swift_bridgeObjectRelease();
  if ((v26 & 0x2000000000000000) != 0) {
    uint64_t v41 = HIBYTE(v26) & 0xF;
  }
  else {
    uint64_t v41 = v44;
  }
  swift_bridgeObjectRelease();
  if (v41) {
    return 1;
  }
  uint64_t v42 = HIBYTE(v28) & 0xF;
  if ((v28 & 0x2000000000000000) == 0) {
    uint64_t v42 = v30;
  }
  return v42 != 0;
}

uint64_t UserNotification.init(notification:category:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v6 = (int *)type metadata accessor for UserNotification(0);
  uint64_t v7 = a3 + v6[7];
  uint64_t v8 = type metadata accessor for UserNotification.LegacyContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = a3 + v6[8];
  uint64_t v10 = type metadata accessor for UserNotification.LocalizedContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(_OWORD *)(a3 + v6[9]) = xmmword_260B261D0;
  *(unsigned char *)(a3 + v6[10]) = 0;
  *(unsigned char *)(a3 + v6[11]) = 0;
  *(unsigned char *)(a3 + v6[12]) = 0;
  *(void *)(a3 + v6[13]) = 0;
  *(void *)(a3 + v6[14]) = 0;
  uint64_t v11 = a3 + v6[15];
  uint64_t v12 = sub_260B23B00();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)(a3 + v6[16]) = 0;
  *(unsigned char *)(a3 + v6[17]) = 1;
  *(unsigned char *)(a3 + v6[18]) = 6;
  *(unsigned char *)(a3 + v6[19]) = 5;
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t type metadata accessor for UserNotification.LegacyContent(uint64_t a1)
{
  return sub_260B0D44C(a1, (uint64_t *)&unk_26B402958);
}

uint64_t sub_260B0D44C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t UserNotification.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_260B23B00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *v1;
  sub_260B23DB0();

  id v12 = v2[1];
  sub_260B23FD0();
  if (v12)
  {
    id v13 = v12;
    sub_260B23DB0();
  }
  sub_260B23FC0();
  uint64_t v14 = type metadata accessor for UserNotification(0);
  sub_260B17CC4(a1);
  sub_260B17878();
  uint64_t v15 = (uint64_t *)((char *)v2 + *(int *)(v14 + 36));
  unint64_t v16 = (void *)v15[1];
  if (v16 == (void *)1 || (uint64_t v17 = *v15, sub_260B23FD0(), sub_260B23FD0(), sub_260B23FD0(), sub_260B23FD0(), !v16))
  {
    sub_260B23FD0();
  }
  else
  {
    sub_260B23FD0();
    id v18 = v16;
    sub_260B23DB0();
    sub_260B0C03C(v17, (uint64_t)v16);
  }
  sub_260B23FD0();
  sub_260B23FC0();
  sub_260B23FC0();
  sub_260B197EC((uint64_t)v2 + *(int *)(v14 + 60), (uint64_t)v10, &qword_26B402A48);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1) {
    return sub_260B23FD0();
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
  sub_260B23FD0();
  sub_260B18B54(&qword_26A8D50E0, MEMORY[0x263F8F3A0]);
  sub_260B23B70();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void UserNotification.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v99 = a1;
  uint64_t v76 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v82 = (char *)v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v81 = (char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v87 = (char *)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D50E8);
  uint64_t v88 = *(void *)(v8 - 8);
  uint64_t v89 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v98 = (char *)v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UserNotification(0);
  id v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v14 = (uint64_t)&v13[v11[9]];
  uint64_t v15 = type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56);
  uint64_t v97 = v14;
  uint64_t v83 = v15;
  uint64_t v80 = v17;
  uint64_t v79 = v16 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t))v17)(v14, 1, 1);
  id v18 = &v13[v11[10]];
  uint64_t v19 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56);
  uint64_t v94 = (uint64_t)v18;
  uint64_t v84 = v20 + 56;
  uint64_t v85 = v21;
  v21((uint64_t)v18, 1, 1, v19);
  v93 = (uint64_t *)&v13[v11[11]];
  *(_OWORD *)v93 = xmmword_260B261D0;
  uint64_t v78 = v11[12];
  v13[v78] = 0;
  uint64_t v86 = v11[13];
  v13[v86] = 0;
  uint64_t v77 = v11[14];
  v13[v77] = 0;
  *(void *)&v13[v11[15]] = 0;
  uint64_t v91 = v11[16];
  *(void *)&v13[v91] = 0;
  uint64_t v22 = &v13[v11[17]];
  uint64_t v23 = sub_260B23B00();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
  uint64_t v26 = v24 + 56;
  uint64_t v96 = (uint64_t)v22;
  v25(v22, 1, 1, v23);
  uint64_t v90 = v11[18];
  *(void *)&v13[v90] = 0;
  v13[v11[19]] = 1;
  uint64_t v27 = v11[20];
  v13[v27] = 6;
  uint64_t v28 = v11[21];
  uint64_t v92 = v13;
  v13[v28] = 5;
  __swift_project_boxed_opaque_existential_1(v99, v99[3]);
  sub_260B18A04();
  uint64_t v29 = v95;
  sub_260B23FF0();
  if (v29)
  {
    uint64_t v30 = v97;
    uint64_t v32 = v93;
    uint64_t v31 = v94;
    uint64_t v35 = v96;
    uint64_t v36 = (uint64_t)v92;
LABEL_4:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
    uint64_t v37 = v90;

    sub_260B06B40(v30, &qword_26B4029A0);
    sub_260B06B40(v31, &qword_26B4029B0);
    sub_260B0C03C(*v32, v32[1]);

    sub_260B06B40(v35, &qword_26B402A48);
    return;
  }
  uint64_t v73 = v26;
  uint64_t v74 = v25;
  uint64_t v75 = v23;
  uint64_t v33 = v87;
  uint64_t v95 = v19;
  uint64_t v72 = v27;
  uint64_t v71 = v28;
  char v102 = 0;
  unint64_t v34 = sub_260B18A58();
  sub_260B23EB0();
  uint64_t v32 = v93;
  unint64_t v70 = v34;
  uint64_t v39 = v100;
  unint64_t v38 = v101;
  uint64_t v40 = sub_260B2331C(0, &qword_26A8D5100);
  sub_260B2331C(0, &qword_26A8D5108);
  uint64_t v41 = (void *)sub_260B23D90();
  uint64_t v31 = v94;
  uint64_t v35 = v96;
  uint64_t v36 = (uint64_t)v92;
  v66[1] = v40;
  uint64_t v42 = v88;
  if (!v41)
  {
    sub_260B18AAC();
    swift_allocError();
    unsigned char *v46 = 0;
    swift_willThrow();
    sub_260B09E58(v39, v38);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v98, v89);
    uint64_t v30 = v97;
    goto LABEL_4;
  }
  uint64_t v68 = v39;
  unint64_t v69 = v38;
  *uint64_t v92 = v41;
  char v102 = 1;
  id v67 = v41;
  sub_260B23EB0();
  uint64_t v44 = v100;
  unint64_t v43 = v101;
  sub_260B2331C(0, &qword_26A8D5168);
  unint64_t v45 = v43;
  uint64_t v49 = sub_260B23D90();
  sub_260B09E58(v44, v45);
  if (v49) {
    *(void *)(v36 + 8) = v49;
  }
  char v102 = 2;
  sub_260B18B00();
  sub_260B23EB0();
  *(unsigned char *)(v36 + 16) = v100;
  LOBYTE(v100) = 3;
  sub_260B18B54(&qword_26A8D5120, (void (*)(uint64_t))type metadata accessor for UserNotification.LegacyContent);
  uint64_t v47 = (uint64_t)v33;
  uint64_t v48 = v83;
  sub_260B23EB0();
  v80(v47, 0, 1, v48);
  sub_260B19850(v47, v97, &qword_26B4029A0);
  uint64_t v50 = (uint64_t)v81;
  LOBYTE(v100) = 10;
  sub_260B18B54(&qword_26A8D5128, MEMORY[0x263F8F3A0]);
  uint64_t v51 = v75;
  sub_260B23EB0();
  v74((char *)v50, 0, 1, v51);
  sub_260B19850(v50, v35, &qword_26B402A48);
  uint64_t v52 = (uint64_t)v82;
  LOBYTE(v100) = 4;
  sub_260B18B54(&qword_26A8D5130, (void (*)(uint64_t))type metadata accessor for UserNotification.LocalizedContent);
  uint64_t v53 = v95;
  sub_260B23EB0();
  uint64_t v54 = v86;
  v85(v52, 0, 1, v53);
  sub_260B19850(v52, v31, &qword_26B4029B0);
  char v102 = 5;
  sub_260B18B9C();
  sub_260B23EB0();
  uint64_t v55 = v101;
  uint64_t v56 = 256;
  if (!BYTE1(v100)) {
    uint64_t v56 = 0;
  }
  uint64_t v57 = v56 | v100;
  uint64_t v58 = 0x10000;
  if (!BYTE2(v100)) {
    uint64_t v58 = 0;
  }
  uint64_t v59 = v57 | v58;
  sub_260B0C03C(*v32, v32[1]);
  *uint64_t v32 = v59;
  v32[1] = v55;
  LOBYTE(v100) = 6;
  *(unsigned char *)(v36 + v78) = sub_260B23EA0() & 1;
  char v102 = 7;
  sub_260B18BF0();
  sub_260B23EB0();
  *(unsigned char *)(v36 + v54) = v100;
  char v102 = 8;
  sub_260B18C44();
  sub_260B23EB0();
  *(unsigned char *)(v36 + v77) = v100;
  char v102 = 9;
  sub_260B23EB0();
  uint64_t v60 = v100;
  unint64_t v61 = v101;
  sub_260B2331C(0, &qword_26A8D5160);
  uint64_t v62 = sub_260B23D90();
  sub_260B09E58(v60, v61);
  if (v62)
  {
    uint64_t v63 = v91;

    *(void *)(v36 + v63) = v62;
  }
  uint64_t v64 = v98;
  char v102 = 11;
  sub_260B18C98();
  uint64_t v65 = v89;
  sub_260B23E80();
  *(unsigned char *)(v36 + v72) = v100;
  char v102 = 12;
  sub_260B18CEC();
  sub_260B23E80();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v64, v65);
  sub_260B09E58(v68, v69);

  *(unsigned char *)(v36 + v71) = v100;
  sub_260B19084(v36, v76, type metadata accessor for UserNotification);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
  sub_260B0C9C4(v36, type metadata accessor for UserNotification);
}

uint64_t UserNotification.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v61 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_260B23B00();
  uint64_t v64 = *(void *)(v7 - 8);
  uint64_t v65 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v66 = *(void *)(v12 - 8);
  id v67 = (int *)v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v63 = (uint64_t)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5170);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B18A04();
  sub_260B24000();
  id v18 = self;
  uint64_t v68 = v3;
  uint64_t v19 = *v3;
  id v71 = 0;
  id v20 = objc_msgSend(v18, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v19, 1, &v71);
  id v21 = v71;
  if (!v20)
  {
    uint64_t v27 = v21;
    sub_260B23A30();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  id v60 = v18;
  uint64_t v69 = v15;
  uint64_t v22 = (void *)sub_260B23A40();
  unint64_t v24 = v23;

  id v71 = v22;
  unint64_t v72 = v24;
  char v70 = 0;
  unint64_t v25 = sub_260B18D40();
  sub_260B23F30();
  if (v2)
  {
    sub_260B09E58((uint64_t)v22, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v17, v14);
  }
  unint64_t v58 = v25;
  uint64_t v59 = v14;
  sub_260B09E58((uint64_t)v22, v24);
  uint64_t v28 = v68;
  uint64_t v29 = (void *)v68[1];
  if (v29)
  {
    id v71 = 0;
    id v30 = v29;
    id v31 = objc_msgSend(v60, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v30, 1, &v71);
    id v32 = v71;
    if (!v31)
    {
      uint64_t v36 = v32;
      sub_260B23A30();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v17, v59);
    }
    uint64_t v33 = (void *)sub_260B23A40();
    unint64_t v35 = v34;

    id v71 = v33;
    unint64_t v72 = v35;
    char v70 = 1;
    sub_260B23F30();
    sub_260B09E58((uint64_t)v33, v35);
  }
  LOBYTE(v71) = *((unsigned char *)v28 + 16);
  char v70 = 2;
  sub_260B18D94();
  uint64_t v37 = v59;
  sub_260B23F30();
  uint64_t v38 = type metadata accessor for UserNotification(0);
  LOBYTE(v71) = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
  sub_260B18DE8();
  sub_260B23F30();
  sub_260B197EC((uint64_t)v28 + *(int *)(v38 + 32), (uint64_t)v11, &qword_26B4029B0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v66 + 48))(v11, 1, v67) == 1)
  {
    sub_260B06B40((uint64_t)v11, &qword_26B4029B0);
  }
  else
  {
    uint64_t v39 = v63;
    sub_260B23358((uint64_t)v11, v63, type metadata accessor for UserNotification.LocalizedContent);
    LOBYTE(v71) = 4;
    sub_260B18B54(&qword_26A8D51C8, (void (*)(uint64_t))type metadata accessor for UserNotification.LocalizedContent);
    sub_260B23F30();
    sub_260B0C9C4(v39, type metadata accessor for UserNotification.LocalizedContent);
  }
  id v67 = (int *)v38;
  uint64_t v40 = (void *)((char *)v28 + *(int *)(v38 + 36));
  uint64_t v41 = (void *)v40[1];
  uint64_t v43 = v64;
  uint64_t v42 = v65;
  if (v41 != (void *)1)
  {
    uint64_t v44 = *v40;
    LOWORD(v71) = *v40 & 0x101;
    BYTE2(v71) = BYTE2(v44) & 1;
    unint64_t v72 = (unint64_t)v41;
    char v70 = 5;
    sub_260B18FDC();
    id v45 = v41;
    sub_260B23F30();
    sub_260B0C03C(v44, (uint64_t)v41);
  }
  uint64_t v47 = v61;
  uint64_t v46 = v62;
  uint64_t v48 = v68;
  sub_260B197EC((uint64_t)v68 + v67[15], v61, &qword_26B402A48);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v47, 1, v42) == 1)
  {
    sub_260B06B40(v47, &qword_26B402A48);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v46, v47, v42);
    LOBYTE(v71) = 10;
    sub_260B18B54(&qword_26A8D51B8, MEMORY[0x263F8F3A0]);
    sub_260B23F30();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v42);
  }
  uint64_t v49 = v67;
  LOBYTE(v71) = 6;
  sub_260B23F20();
  LOBYTE(v71) = *((unsigned char *)v48 + v49[11]);
  char v70 = 7;
  sub_260B18E8C();
  sub_260B23F30();
  LOBYTE(v71) = *((unsigned char *)v48 + v49[12]);
  char v70 = 8;
  sub_260B18EE0();
  sub_260B23F30();
  uint64_t v50 = *(void **)((char *)v48 + v49[14]);
  if (!v50) {
    goto LABEL_23;
  }
  id v71 = 0;
  id v51 = v50;
  id v52 = objc_msgSend(v60, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v51, 1, &v71);
  id v53 = v71;
  if (v52)
  {
    uint64_t v54 = (void *)sub_260B23A40();
    unint64_t v56 = v55;

    id v71 = v54;
    unint64_t v72 = v56;
    char v70 = 9;
    sub_260B23F30();
    sub_260B09E58((uint64_t)v54, v56);

    uint64_t v48 = v68;
LABEL_23:
    LOBYTE(v71) = *((unsigned char *)v48 + v49[18]);
    char v70 = 11;
    sub_260B18F34();
    sub_260B23F00();
    LOBYTE(v71) = *((unsigned char *)v48 + v49[19]);
    char v70 = 12;
    sub_260B18F88();
    sub_260B23F00();
    return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v17, v37);
  }
  uint64_t v57 = v53;
  sub_260B23A30();

  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v17, v37);
}

unint64_t sub_260B0EF84(char a1)
{
  unint64_t result = 0x6C616E696769726FLL;
  switch(a1)
  {
    case 1:
    case 4:
    case 7:
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6E696769726FLL;
      break;
    case 3:
      unint64_t result = 0x6F4379636167656CLL;
      break;
    case 5:
      unint64_t result = 0x4264657669726564;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x73676E6974746573;
      break;
    case 11:
      unint64_t result = 0x797469726F697270;
      break;
    case 12:
      unint64_t result = 0x537972616D6D7573;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_260B0F134(char a1)
{
  unint64_t result = 0x6C616E696769726FLL;
  switch(a1)
  {
    case 1:
    case 4:
    case 7:
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6E696769726FLL;
      break;
    case 3:
      unint64_t result = 0x6F4379636167656CLL;
      break;
    case 5:
      unint64_t result = 0x4264657669726564;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0x73676E6974746573;
      break;
    case 11:
      unint64_t result = 0x797469726F697270;
      break;
    case 12:
      unint64_t result = 0x537972616D6D7573;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260B0F2E4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_260B0EF84(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_260B0EF84(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_260B23F50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_260B0F370()
{
  char v1 = *v0;
  sub_260B23FB0();
  sub_260B0EF84(v1);
  sub_260B23C10();
  swift_bridgeObjectRelease();
  return sub_260B23FE0();
}

uint64_t sub_260B0F3D4()
{
  sub_260B0EF84(*v0);
  sub_260B23C10();

  return swift_bridgeObjectRelease();
}

uint64_t sub_260B0F428()
{
  char v1 = *v0;
  sub_260B23FB0();
  sub_260B0EF84(v1);
  sub_260B23C10();
  swift_bridgeObjectRelease();
  return sub_260B23FE0();
}

uint64_t sub_260B0F488@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260B22410();
  *a1 = result;
  return result;
}

unint64_t sub_260B0F4B8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_260B0EF84(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_260B0F4E4()
{
  return sub_260B0F134(*v0);
}

uint64_t sub_260B0F4EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260B22410();
  *a1 = result;
  return result;
}

void sub_260B0F514(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_260B0F520(uint64_t a1)
{
  unint64_t v2 = sub_260B18A04();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B0F55C(uint64_t a1)
{
  unint64_t v2 = sub_260B18A04();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.hashValue.getter()
{
  return sub_260B12954((void (*)(unsigned char *))UserNotification.hash(into:));
}

void sub_260B0F5B8(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_260B0F5D0(void *a1)
{
  return UserNotification.encode(to:)(a1);
}

uint64_t sub_260B0F5EC(uint64_t a1, uint64_t a2)
{
  return sub_260B129E4(a1, a2, (void (*)(unsigned char *))UserNotification.hash(into:));
}

uint64_t sub_260B0F608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260B12A48(a1, a2, a3, (void (*)(unsigned char *))UserNotification.hash(into:));
}

uint64_t UserNotification.Identifier.id.getter()
{
  return 0;
}

uint64_t sub_260B0F6E0(char a1)
{
  if (a1)
  {
    char v1 = (void *)sub_260B23BA0();
    id v2 = objc_msgSend(v1, sel_un_logDigest);

    if (v2)
    {
      sub_260B23BB0();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_260B23E10();
  swift_bridgeObjectRelease();
  sub_260B23C70();
  swift_bridgeObjectRelease();
  sub_260B23C70();
  unint64_t v3 = (void *)sub_260B2245C();
  type metadata accessor for UserNotification.Identifier(0);
  unint64_t v4 = (void *)sub_260B23A60();
  id v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  sub_260B23BB0();
  sub_260B23C70();
  swift_bridgeObjectRelease();
  sub_260B23C70();
  swift_bridgeObjectRetain();
  sub_260B23C70();
  swift_bridgeObjectRelease();
  sub_260B23C70();
  return 1029990747;
}

uint64_t UserNotification.Identifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  type metadata accessor for UserNotification.Identifier(0);
  sub_260B23A90();
  sub_260B18B54(&qword_26A8D51D0, MEMORY[0x263F07490]);
  sub_260B23B70();
  swift_bridgeObjectRetain();
  sub_260B23C10();

  return swift_bridgeObjectRelease();
}

BOOL sub_260B0F9B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_260B0F9C4()
{
  return sub_260B23FC0();
}

unint64_t sub_260B0F9F0()
{
  unint64_t v1 = 0xD000000000000010;
  if (*v0 == 1) {
    unint64_t v1 = 1702125924;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_260B0FA48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_260B2271C(a1, a2);
  *a3 = result;
  return result;
}

void sub_260B0FA70(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_260B0FA7C(uint64_t a1)
{
  unint64_t v2 = sub_260B19030();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B0FAB8(uint64_t a1)
{
  unint64_t v2 = sub_260B19030();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.Identifier.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D51D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B19030();
  sub_260B24000();
  v8[15] = 0;
  sub_260B23F10();
  if (!v1)
  {
    type metadata accessor for UserNotification.Identifier(0);
    v8[14] = 1;
    sub_260B23A90();
    sub_260B18B54(&qword_26A8D51E8, MEMORY[0x263F07490]);
    sub_260B23F30();
    v8[13] = 2;
    sub_260B23F10();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t UserNotification.Identifier.hashValue.getter()
{
  return sub_260B23FE0();
}

uint64_t UserNotification.Identifier.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = sub_260B23A90();
  uint64_t v24 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D51F0);
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v26 = v6;
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UserNotification.Identifier(0);
  MEMORY[0x270FA5388](v9);
  id v11 = (void *)((char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B19030();
  uint64_t v27 = v8;
  uint64_t v12 = v28;
  sub_260B23FF0();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v28 = v9;
  uint64_t v13 = v25;
  char v31 = 0;
  uint64_t v14 = (uint64_t)v11;
  *id v11 = sub_260B23E90();
  v11[1] = v15;
  char v30 = 1;
  sub_260B18B54(&qword_26A8D51F8, MEMORY[0x263F07490]);
  sub_260B23EB0();
  uint64_t v16 = v28;
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v14 + *(int *)(v28 + 20), v5, v3);
  char v29 = 2;
  v22[1] = 0;
  uint64_t v17 = sub_260B23E90();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v27, v26);
  id v20 = (uint64_t *)(v14 + *(int *)(v16 + 24));
  *id v20 = v17;
  v20[1] = v19;
  sub_260B19084(v14, v23, type metadata accessor for UserNotification.Identifier);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_260B0C9C4(v14, type metadata accessor for UserNotification.Identifier);
}

uint64_t sub_260B101AC@<X0>(void *a1@<X8>)
{
  swift_bridgeObjectRetain();
  sub_260B23C70();
  swift_bridgeObjectRelease();
  sub_260B23A50();
  sub_260B23D60();
  swift_bridgeObjectRetain();
  sub_260B23C70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return result;
}

uint64_t sub_260B10270()
{
  return sub_260B23FE0();
}

uint64_t sub_260B10364()
{
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  sub_260B23A90();
  sub_260B18B54(&qword_26A8D51D0, MEMORY[0x263F07490]);
  sub_260B23B70();
  swift_bridgeObjectRetain();
  sub_260B23C10();

  return swift_bridgeObjectRelease();
}

uint64_t sub_260B10454()
{
  return sub_260B23FE0();
}

uint64_t sub_260B10544@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return UserNotification.Identifier.init(from:)(a1, a2);
}

uint64_t sub_260B1055C(void *a1)
{
  return UserNotification.Identifier.encode(to:)(a1);
}

uint64_t UserNotification.Identifier.description.getter()
{
  return sub_260B0F6E0(1);
}

uint64_t sub_260B10580()
{
  return sub_260B0F6E0(1);
}

uint64_t UserNotification.Identifier.debugDescription.getter()
{
  return sub_260B0F6E0(0);
}

uint64_t sub_260B10590()
{
  return sub_260B0F6E0(0);
}

uint64_t UserNotification.description.getter()
{
  return sub_260B105AC(1);
}

uint64_t UserNotification.debugDescription.getter()
{
  return sub_260B105AC(0);
}

uint64_t sub_260B105AC(char a1)
{
  uint64_t v3 = type metadata accessor for UserNotification.Identifier(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v7 = *v1;
  id v8 = objc_msgSend(v7, sel_request);
  id v9 = objc_msgSend(v8, sel_identifier);

  uint64_t v10 = sub_260B23BB0();
  uint64_t v12 = v11;

  *uint64_t v6 = v10;
  v6[1] = v12;
  id v13 = objc_msgSend(v7, sel_date);
  sub_260B23A80();

  id v14 = objc_msgSend(v7, sel_sourceIdentifier);
  uint64_t v15 = sub_260B23BB0();
  uint64_t v17 = v16;

  uint64_t v18 = (uint64_t *)((char *)v6 + *(int *)(v4 + 32));
  *uint64_t v18 = v15;
  v18[1] = v17;
  uint64_t v19 = sub_260B0F6E0(a1);
  sub_260B0C9C4((uint64_t)v6, type metadata accessor for UserNotification.Identifier);
  return v19;
}

uint64_t UserNotification.spotlightIdentifier.getter()
{
  uint64_t v1 = UserNotification.bundleIdentifier.getter();
  sub_260B23C70();
  UserNotification.requestIdentifier.getter();
  sub_260B23C70();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static UserNotification.bundleId(for:)(uint64_t a1, unint64_t a2)
{
  v12[0] = 58;
  v12[1] = 0xE100000000000000;
  _OWORD v11[2] = v12;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_260B17348(0x7FFFFFFFFFFFFFFFLL, 1, sub_260B190EC, (uint64_t)v11, a1, a2);
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = *((void *)v4 + 4);
    uint64_t v6 = *((void *)v4 + 5);
    uint64_t v7 = *((void *)v4 + 6);
    uint64_t v8 = *((void *)v4 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x261222C30](v5, v6, v7, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v9;
}

uint64_t static UserNotification.requestIdentifierFromSpotlightIdentifier(_:)(uint64_t a1, unint64_t a2)
{
  v12[0] = 58;
  v12[1] = 0xE100000000000000;
  _OWORD v11[2] = v12;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_260B17348(1, 0, sub_260B190EC, (uint64_t)v11, a1, a2);
  if (*((void *)v4 + 2) == 2)
  {
    uint64_t v5 = *((void *)v4 + 8);
    uint64_t v6 = *((void *)v4 + 9);
    uint64_t v7 = *((void *)v4 + 10);
    uint64_t v8 = *((void *)v4 + 11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x261222C30](v5, v6, v7, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v9;
}

uint64_t static UserNotification.bundleIdentifierFromSpotlightIdentifier(_:)(uint64_t a1, unint64_t a2)
{
  v12[0] = 58;
  v12[1] = 0xE100000000000000;
  _OWORD v11[2] = v12;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_260B17348(1, 0, sub_260B190EC, (uint64_t)v11, a1, a2);
  if (*((void *)v4 + 2) == 2)
  {
    uint64_t v5 = *((void *)v4 + 4);
    uint64_t v6 = *((void *)v4 + 5);
    uint64_t v7 = *((void *)v4 + 6);
    uint64_t v8 = *((void *)v4 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x261222C30](v5, v6, v7, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v9;
}

uint64_t UserNotification.Behavior.critical.getter()
{
  return *v0;
}

uint64_t UserNotification.Behavior.critical.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*UserNotification.Behavior.critical.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.Behavior.timeSensitive.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t UserNotification.Behavior.timeSensitive.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*UserNotification.Behavior.timeSensitive.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.Behavior.ignoreDoNotDisturb.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t UserNotification.Behavior.ignoreDoNotDisturb.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*UserNotification.Behavior.ignoreDoNotDisturb.modify())()
{
  return nullsub_1;
}

void *UserNotification.Behavior.dndBehavior.getter()
{
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void UserNotification.Behavior.dndBehavior.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*UserNotification.Behavior.dndBehavior.modify())()
{
  return nullsub_1;
}

void *UserNotification.Behavior.shouldDelayDelivery.getter()
{
  uint64_t result = *(void **)(v0 + 8);
  if (result) {
    return (void *)(objc_msgSend(result, sel_interruptionSuppression) == (id)2);
  }
  return result;
}

uint64_t UserNotification.Behavior.init(critical:timeSensitive:ignoreDoNotDisturb:dndBehavior:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = result;
  *(unsigned char *)(a5 + 1) = a2;
  *(unsigned char *)(a5 + 2) = a3;
  *(void *)(a5 + 8) = a4;
  return result;
}

void UserNotification.Behavior.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5200);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B19160();
  sub_260B23FF0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v18) = 0;
    char v9 = sub_260B23EA0();
    LOBYTE(v18) = 1;
    char v10 = sub_260B23EA0();
    LOBYTE(v18) = 2;
    LOBYTE(v20) = sub_260B23EA0() & 1;
    int v20 = v20;
    char v21 = 3;
    sub_260B18A58();
    sub_260B23EB0();
    int v16 = v10 & 1;
    int v17 = v9 & 1;
    uint64_t v11 = v18;
    unint64_t v12 = v19;
    sub_260B2331C(0, &qword_26A8D5100);
    sub_260B2331C(0, &qword_26A8D5210);
    id v13 = (void *)sub_260B23D90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_260B09E58(v11, v12);
    LOBYTE(v12) = v16;
    *(unsigned char *)a2 = v17;
    *(unsigned char *)(a2 + 1) = v12;
    *(unsigned char *)(a2 + 2) = v20;
    *(void *)(a2 + 8) = v13;
    id v14 = v13;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
}

uint64_t UserNotification.Behavior.encode(to:)(void *a1)
{
  v24[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5218);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = *(unsigned __int8 *)(v1 + 1);
  int v21 = *(unsigned __int8 *)(v1 + 2);
  int v22 = v8;
  int v20 = *(void **)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B19160();
  uint64_t v9 = v4;
  sub_260B24000();
  LOBYTE(v24[0]) = 0;
  sub_260B23F20();
  if (!v2)
  {
    char v10 = v20;
    LOBYTE(v24[0]) = 1;
    sub_260B23F20();
    LOBYTE(v24[0]) = 2;
    sub_260B23F20();
    if (v10)
    {
      unint64_t v12 = self;
      v24[0] = 0;
      id v13 = v10;
      id v14 = objc_msgSend(v12, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v13, 1, v24);
      id v15 = v24[0];
      if (v14)
      {
        int v16 = (void *)sub_260B23A40();
        uint64_t v18 = v17;

        v24[0] = v16;
        v24[1] = v18;
        char v23 = 3;
        sub_260B18D40();
        sub_260B23F30();

        sub_260B09E58((uint64_t)v16, (unint64_t)v18);
      }
      else
      {
        unint64_t v19 = v15;
        sub_260B23A30();

        swift_willThrow();
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v9);
}

uint64_t sub_260B11154(unsigned __int8 *a1, char *a2)
{
  return sub_260B0AF28(*a1, *a2);
}

uint64_t sub_260B11160()
{
  return sub_260B0B290();
}

uint64_t sub_260B11168()
{
  sub_260B23C10();

  return swift_bridgeObjectRelease();
}

uint64_t sub_260B11244()
{
  return sub_260B0B568();
}

uint64_t sub_260B1124C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260B2285C();
  *a1 = result;
  return result;
}

void sub_260B11284(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE800000000000000;
  uint64_t v3 = 0x6C61636974697263;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xED00006576697469;
      uint64_t v3 = 0x736E6553656D6974;
      goto LABEL_3;
    case 2:
      *a1 = 0xD000000000000012;
      a1[1] = 0x8000000260B283E0;
      break;
    case 3:
      *a1 = 0x7661686542646E64;
      a1[1] = 0xEB00000000726F69;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_260B11338()
{
  unint64_t result = 0x6C61636974697263;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x736E6553656D6974;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x7661686542646E64;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260B113E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260B2285C();
  *a1 = result;
  return result;
}

void sub_260B11410(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_260B1141C(uint64_t a1)
{
  unint64_t v2 = sub_260B19160();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B11458(uint64_t a1)
{
  unint64_t v2 = sub_260B19160();

  return MEMORY[0x270FA00B8](a1, v2);
}

void UserNotification.Behavior.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 8);
  sub_260B23FD0();
  sub_260B23FD0();
  sub_260B23FD0();
  if (v1)
  {
    sub_260B23FD0();
    id v2 = v1;
    sub_260B23DB0();
  }
  else
  {
    sub_260B23FD0();
  }
}

uint64_t UserNotification.Behavior.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 8);
  sub_260B23FB0();
  sub_260B23FD0();
  sub_260B23FD0();
  sub_260B23FD0();
  sub_260B23FD0();
  if (v1)
  {
    id v2 = v1;
    sub_260B23DB0();
  }
  return sub_260B23FE0();
}

void sub_260B115F0(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_260B11608(void *a1)
{
  return UserNotification.Behavior.encode(to:)(a1);
}

uint64_t sub_260B11628()
{
  uint64_t v1 = *(void **)(v0 + 8);
  sub_260B23FB0();
  sub_260B23FD0();
  sub_260B23FD0();
  sub_260B23FD0();
  sub_260B23FD0();
  if (v1)
  {
    id v2 = v1;
    sub_260B23DB0();
  }
  return sub_260B23FE0();
}

uint64_t UserNotification.LocalizedContent.localizedTitle.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LocalizedContent.localizedTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *id v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.localizedTitle.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.localizedSubtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LocalizedContent.localizedSubtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.localizedSubtitle.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.localizedBody.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LocalizedContent.localizedBody.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.localizedBody.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.summary.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_260B1188C(type metadata accessor for UserNotification.LocalizedContent, qword_26B4026D0, a1);
}

uint64_t sub_260B1188C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1(0);
  return sub_260B197EC(v3 + *(int *)(v6 + 28), a3, a2);
}

uint64_t UserNotification.LocalizedContent.summary.setter(uint64_t a1)
{
  return sub_260B118FC(a1, type metadata accessor for UserNotification.LocalizedContent, qword_26B4026D0);
}

uint64_t sub_260B118FC(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = a2(0);
  return sub_260B19850(a1, v3 + *(int *)(v6 + 28), a3);
}

uint64_t (*UserNotification.LocalizedContent.summary.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.isHighlight.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification.LocalizedContent(0) + 32));
}

uint64_t UserNotification.LocalizedContent.isHighlight.setter(char a1)
{
  uint64_t result = type metadata accessor for UserNotification.LocalizedContent(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.isHighlight.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.init(localizedTitle:localizedSubtitle:localizedBody:summary:isHighlight:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, void *a9@<X8>)
{
  int v29 = a8;
  uint64_t v27 = a5;
  uint64_t v28 = a6;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  MEMORY[0x270FA5388](v13 - 8);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v17 = (uint64_t)a9 + *(int *)(v16 + 28);
  uint64_t v18 = sub_260B23A10();
  unint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t result = v19(v17, 1, 1, v18);
  uint64_t v21 = *(int *)(v16 + 32);
  *((unsigned char *)a9 + v21) = 2;
  *a9 = a1;
  a9[1] = a2;
  uint64_t v22 = v26;
  a9[2] = v25;
  a9[3] = v22;
  uint64_t v23 = v28;
  a9[4] = v27;
  a9[5] = v23;
  if (a7)
  {
    sub_260B23A20();
    v19((uint64_t)v15, 0, 1, v18);
    uint64_t result = sub_260B19850((uint64_t)v15, v17, qword_26B4026D0);
  }
  *((unsigned char *)a9 + v21) = v29;
  return result;
}

uint64_t UserNotification.LocalizedContent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v37 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5220);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *(_OWORD *)uint64_t v11 = 0u;
  unint64_t v12 = &v11[*(int *)(v9 + 36)];
  uint64_t v13 = sub_260B23A10();
  uint64_t v14 = *(void *)(v13 - 8);
  id v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v16 = v14 + 56;
  uint64_t v38 = (uint64_t)v12;
  v15(v12, 1, 1, v13);
  v11[*(int *)(v9 + 40)] = 2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B191B4();
  uint64_t v41 = v7;
  uint64_t v17 = v40;
  sub_260B23FF0();
  if (v17)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    uint64_t v18 = (uint64_t)v11;
  }
  else
  {
    v33[1] = v16;
    unint64_t v34 = v15;
    uint64_t v40 = v13;
    uint64_t v19 = v35;
    uint64_t v20 = (uint64_t)v37;
    char v45 = 0;
    uint64_t v21 = v36;
    uint64_t v22 = v11;
    *(void *)uint64_t v11 = sub_260B23E90();
    *((void *)v11 + 1) = v23;
    char v44 = 1;
    uint64_t v24 = v21;
    void v22[2] = sub_260B23E90();
    v22[3] = v25;
    uint64_t v26 = v19;
    char v43 = 2;
    uint64_t v27 = sub_260B23E90();
    uint64_t v28 = v38;
    v22[4] = v27;
    v22[5] = v29;
    uint64_t v30 = v40;
    char v42 = 3;
    sub_260B18B54(qword_26A8D47F0, MEMORY[0x263F06828]);
    char v31 = v41;
    sub_260B23EB0();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v24);
    v34((char *)v20, 0, 1, v30);
    sub_260B19850(v20, v28, qword_26B4026D0);
    sub_260B19084((uint64_t)v22, v39, type metadata accessor for UserNotification.LocalizedContent);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    uint64_t v18 = (uint64_t)v22;
  }
  return sub_260B0C9C4(v18, type metadata accessor for UserNotification.LocalizedContent);
}

uint64_t UserNotification.LocalizedContent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_260B23A10();
  uint64_t v21 = *(void *)(v8 - 8);
  uint64_t v22 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v20 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5230);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B191B4();
  sub_260B24000();
  if (!v3[1] || (char v23 = 0, sub_260B23F10(), !v2))
  {
    if (!v3[3] || (char v24 = 1, sub_260B23F10(), !v2))
    {
      if (!v3[5] || (char v25 = 2, sub_260B23F10(), !v2))
      {
        uint64_t v14 = type metadata accessor for UserNotification.LocalizedContent(0);
        sub_260B197EC((uint64_t)v3 + *(int *)(v14 + 28), (uint64_t)v7, qword_26B4026D0);
        uint64_t v16 = v21;
        uint64_t v15 = v22;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v7, 1, v22) == 1)
        {
          (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
          return sub_260B06B40((uint64_t)v7, qword_26B4026D0);
        }
        uint64_t v18 = v20;
        (*(void (**)(void))(v16 + 32))();
        char v26 = 3;
        sub_260B18B54(&qword_26A8D47E8, MEMORY[0x263F06828]);
        sub_260B23F30();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_260B12324(unsigned __int8 *a1, char *a2)
{
  return sub_260B0B0E8(*a1, *a2);
}

uint64_t sub_260B12330()
{
  return sub_260B0B384();
}

uint64_t sub_260B12338()
{
  sub_260B23C10();

  return swift_bridgeObjectRelease();
}

uint64_t sub_260B12408()
{
  return sub_260B0B478();
}

uint64_t sub_260B12410@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260B2285C();
  *a1 = result;
  return result;
}

void sub_260B12448(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xEE00656C74695464;
  unint64_t v3 = 0x657A696C61636F6CLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0x8000000260B28410;
      unint64_t v3 = 0xD000000000000011;
      goto LABEL_3;
    case 2:
      strcpy((char *)a1, "localizedBody");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    case 3:
      *(void *)a1 = 0x7972616D6D7573;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

unint64_t sub_260B124F0()
{
  unint64_t result = 0x657A696C61636F6CLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x7972616D6D7573;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260B1258C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_260B2285C();
  *a1 = result;
  return result;
}

uint64_t sub_260B125BC(uint64_t a1)
{
  unint64_t v2 = sub_260B191B4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B125F8(uint64_t a1)
{
  unint64_t v2 = sub_260B191B4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.LocalizedContent.hash(into:)()
{
  uint64_t v1 = sub_260B23A10();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v0[1])
  {
    sub_260B23FD0();
    swift_bridgeObjectRetain();
    sub_260B23C10();
    swift_bridgeObjectRelease();
    if (v0[3]) {
      goto LABEL_3;
    }
LABEL_6:
    sub_260B23FD0();
    if (v0[5]) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  sub_260B23FD0();
  if (!v0[3]) {
    goto LABEL_6;
  }
LABEL_3:
  sub_260B23FD0();
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  if (v0[5])
  {
LABEL_4:
    sub_260B23FD0();
    swift_bridgeObjectRetain();
    sub_260B23C10();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  sub_260B23FD0();
LABEL_8:
  uint64_t v8 = type metadata accessor for UserNotification.LocalizedContent(0);
  sub_260B197EC((uint64_t)v0 + *(int *)(v8 + 28), (uint64_t)v7, qword_26B4026D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D5238, MEMORY[0x263F06828]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  if (*((unsigned char *)v0 + *(int *)(v8 + 32)) != 2) {
    sub_260B23FD0();
  }
  return sub_260B23FD0();
}

uint64_t UserNotification.LocalizedContent.hashValue.getter()
{
  return sub_260B12954((void (*)(unsigned char *))UserNotification.LocalizedContent.hash(into:));
}

uint64_t sub_260B12954(void (*a1)(unsigned char *))
{
  sub_260B23FB0();
  a1(v3);
  return sub_260B23FE0();
}

uint64_t sub_260B1299C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return UserNotification.LocalizedContent.init(from:)(a1, a2);
}

uint64_t sub_260B129B4(void *a1)
{
  return UserNotification.LocalizedContent.encode(to:)(a1);
}

uint64_t sub_260B129CC(uint64_t a1, uint64_t a2)
{
  return sub_260B129E4(a1, a2, (void (*)(unsigned char *))UserNotification.LocalizedContent.hash(into:));
}

uint64_t sub_260B129E4(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *))
{
  sub_260B23FB0();
  a3(v5);
  return sub_260B23FE0();
}

uint64_t sub_260B12A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_260B12A48(a1, a2, a3, (void (*)(unsigned char *))UserNotification.LocalizedContent.hash(into:));
}

uint64_t sub_260B12A48(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *))
{
  sub_260B23FB0();
  a4(v6);
  return sub_260B23FE0();
}

BOOL static UserNotification.IncomingPersistence.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t sub_260B12AA4()
{
  return sub_260B23D20();
}

uint64_t sub_260B12B04()
{
  return sub_260B23CE0();
}

BOOL sub_260B12B54(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_260B12B68(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_260B12B7C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_260B12B90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

BOOL static UserNotification.IncomingPriority.< infix(_:_:)(char *a1, char *a2)
{
  return qword_260B27D58[*a1] < qword_260B27D58[*a2];
}

uint64_t UserNotification.IncomingPriority.rawValue.getter()
{
  return qword_260B27D58[*v0];
}

UserNotificationsServices::UserNotification::IncomingPriority_optional __swiftcall UserNotification.IncomingPriority.init(rawValue:)(Swift::Int rawValue)
{
  switch(rawValue)
  {
    case 300:
      char *v1 = 2;
      break;
    case 301:
      char *v1 = 3;
      break;
    case 302:
      char *v1 = 4;
      break;
    case 303:
      char *v1 = 5;
      break;
    case 304:
      char *v1 = 6;
      break;
    default:
      if (rawValue == 200) {
        char v2 = 1;
      }
      else {
        char v2 = 7;
      }
      if (rawValue == 100) {
        char v2 = 0;
      }
      char *v1 = v2;
      break;
  }
  return (UserNotificationsServices::UserNotification::IncomingPriority_optional)rawValue;
}

BOOL sub_260B12C78(char *a1, char *a2)
{
  return qword_260B27D58[*a1] == qword_260B27D58[*a2];
}

UserNotificationsServices::UserNotification::IncomingPriority_optional sub_260B12C9C(Swift::Int *a1)
{
  return UserNotification.IncomingPriority.init(rawValue:)(*a1);
}

void sub_260B12CA4(void *a1@<X8>)
{
  *a1 = qword_260B27D58[*v1];
}

uint64_t sub_260B12CBC()
{
  return sub_260B23FE0();
}

uint64_t sub_260B12D0C()
{
  return sub_260B23FC0();
}

uint64_t sub_260B12D44()
{
  return sub_260B23FE0();
}

uint64_t sub_260B12D90()
{
  return sub_260B23D20();
}

uint64_t sub_260B12DF0()
{
  return sub_260B23CE0();
}

BOOL sub_260B12E40(char *a1, char *a2)
{
  return qword_260B27D58[*a1] < qword_260B27D58[*a2];
}

BOOL sub_260B12E64(char *a1, char *a2)
{
  return qword_260B27D58[*a2] >= qword_260B27D58[*a1];
}

BOOL sub_260B12E88(char *a1, char *a2)
{
  return qword_260B27D58[*a1] >= qword_260B27D58[*a2];
}

BOOL sub_260B12EAC(char *a1, char *a2)
{
  return qword_260B27D58[*a2] < qword_260B27D58[*a1];
}

uint64_t sub_260B12ED0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_260B12F00(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_260B12F0C(uint64_t a1)
{
  unint64_t v2 = sub_260B196F8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B12F48(uint64_t a1)
{
  unint64_t v2 = sub_260B196F8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.SecureAttachments.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5240);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B196F8();
  sub_260B24000();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t UserNotification.SecureAttachments.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_260B130BC(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_260B130E4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5240);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B196F8();
  sub_260B24000();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

UserNotificationsServices::UserNotification::Origin_optional __swiftcall UserNotification.Origin.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 6;
  if ((unint64_t)rawValue < 6) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (UserNotificationsServices::UserNotification::Origin_optional)rawValue;
}

UserNotificationsServices::UserNotification::Origin_optional sub_260B13208(Swift::Int *a1)
{
  return UserNotification.Origin.init(rawValue:)(*a1);
}

uint64_t sub_260B13210()
{
  return sub_260B23D20();
}

uint64_t sub_260B13270()
{
  return sub_260B23CE0();
}

uint64_t UserNotification.LegacyContent.category.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 42);
  __int16 v8 = *(_WORD *)(v1 + 40);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 42) = v7;
  *(_WORD *)(a1 + 40) = v8;
  return sub_260B1974C(v2, v3);
}

__n128 UserNotification.LegacyContent.category.setter(__n128 *a1)
{
  __n128 v6 = a1[1];
  __n128 v7 = *a1;
  unint64_t v2 = a1[2].n128_u64[0];
  unsigned __int16 v3 = a1[2].n128_u16[4];
  unsigned __int8 v4 = a1[2].n128_u8[10];
  sub_260B1979C(v1->n128_u64[0], v1->n128_i64[1]);
  __n128 result = v6;
  __n128 *v1 = v7;
  v1[1] = v6;
  v1[2].n128_u64[0] = v2;
  v1[2].n128_u8[10] = v4;
  v1[2].n128_u16[4] = v3;
  return result;
}

uint64_t (*UserNotification.LegacyContent.category.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.eventDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_260B197EC(v1 + *(int *)(v3 + 20), a1, &qword_26A8D5250);
}

uint64_t UserNotification.LegacyContent.eventDate.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_260B19850(a1, v1 + *(int *)(v3 + 20), &qword_26A8D5250);
}

uint64_t (*UserNotification.LegacyContent.eventDate.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.duration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_260B197EC(v1 + *(int *)(v3 + 24), a1, &qword_26A8D5258);
}

uint64_t UserNotification.LegacyContent.duration.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_260B19850(a1, v1 + *(int *)(v3 + 24), &qword_26A8D5258);
}

uint64_t (*UserNotification.LegacyContent.duration.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.isAllDayEvent.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification.LegacyContent(0) + 28));
}

uint64_t UserNotification.LegacyContent.isAllDayEvent.setter(char a1)
{
  uint64_t result = type metadata accessor for UserNotification.LegacyContent(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*UserNotification.LegacyContent.isAllDayEvent.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.dismissAfterDuration.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification.LegacyContent(0) + 32));
}

uint64_t UserNotification.LegacyContent.dismissAfterDuration.setter(char a1)
{
  uint64_t result = type metadata accessor for UserNotification.LegacyContent(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*UserNotification.LegacyContent.dismissAfterDuration.modify())()
{
  return nullsub_1;
}

UserNotificationsServices::UserNotification::LegacyContent::IdentityImageStyle_optional __swiftcall UserNotification.LegacyContent.IdentityImageStyle.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (UserNotificationsServices::UserNotification::LegacyContent::IdentityImageStyle_optional)rawValue;
}

UserNotificationsServices::UserNotification::LegacyContent::IdentityImageStyle_optional sub_260B13670(Swift::Int *a1)
{
  return UserNotification.LegacyContent.IdentityImageStyle.init(rawValue:)(*a1);
}

uint64_t sub_260B13678()
{
  return sub_260B23D20();
}

uint64_t sub_260B136D8()
{
  return sub_260B23CE0();
}

uint64_t UserNotification.LegacyContent.init()@<X0>(_OWORD *a1@<X8>)
{
  char v2 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 27) = 0u;
  uint64_t v3 = (char *)a1 + v2[5];
  uint64_t v4 = sub_260B23A90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = (char *)a1 + v2[6];
  uint64_t v6 = sub_260B23A00();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)a1 + v2[7]) = 0;
  *((unsigned char *)a1 + v2[8]) = 0;
  return result;
}

uint64_t UserNotification.LegacyContent.isEmpty.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v7 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v27 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v27 - v17;
  uint64_t v19 = *(void *)(v0 + 8);
  sub_260B19084(v0, (uint64_t)&v27 - v17, type metadata accessor for UserNotification.LegacyContent);
  if (v19)
  {
    sub_260B0C9C4((uint64_t)v18, type metadata accessor for UserNotification.LegacyContent);
    sub_260B19084(v0, (uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
LABEL_7:
    sub_260B0C9C4((uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
    sub_260B19084(v0, (uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
    goto LABEL_8;
  }
  sub_260B197EC((uint64_t)&v18[v7[5]], (uint64_t)v6, &qword_26A8D5250);
  sub_260B0C9C4((uint64_t)v18, type metadata accessor for UserNotification.LegacyContent);
  uint64_t v20 = sub_260B23A90();
  int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v6, 1, v20);
  sub_260B06B40((uint64_t)v6, &qword_26A8D5250);
  sub_260B19084(v0, (uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
  if (v21 != 1) {
    goto LABEL_7;
  }
  sub_260B197EC((uint64_t)&v16[v7[6]], (uint64_t)v3, &qword_26A8D5258);
  sub_260B0C9C4((uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
  uint64_t v22 = sub_260B23A00();
  int v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v3, 1, v22);
  sub_260B06B40((uint64_t)v3, &qword_26A8D5258);
  sub_260B19084(v0, (uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
  if (v23 != 1)
  {
LABEL_8:
    sub_260B0C9C4((uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
    sub_260B19084(v0, (uint64_t)v10, type metadata accessor for UserNotification.LegacyContent);
    goto LABEL_9;
  }
  char v24 = v13[v7[7]];
  sub_260B0C9C4((uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
  sub_260B19084(v0, (uint64_t)v10, type metadata accessor for UserNotification.LegacyContent);
  if (v24)
  {
LABEL_9:
    char v25 = 0;
    goto LABEL_10;
  }
  char v25 = v10[v7[8]] ^ 1;
LABEL_10:
  sub_260B0C9C4((uint64_t)v10, type metadata accessor for UserNotification.LegacyContent);
  return v25 & 1;
}

uint64_t UserNotification.LegacyContent.hash(into:)(uint64_t a1)
{
  uint64_t v3 = sub_260B23A00();
  uint64_t v24 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  int v23 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  MEMORY[0x270FA5388](v5 - 8);
  __n128 v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_260B23A90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v1[1];
  if (v15)
  {
    char v16 = *((unsigned char *)v1 + 42);
    __int16 v17 = *((_WORD *)v1 + 20);
    uint64_t v18 = v1[2];
    uint64_t v25 = *v1;
    uint64_t v26 = v15;
    uint64_t v27 = v18;
    long long v28 = *(_OWORD *)(v1 + 3);
    __int16 v29 = v17 & 0x101;
    char v30 = v16 & 1;
    sub_260B23FD0();
    UserNotification.LegacyCategory.hash(into:)(a1);
  }
  else
  {
    sub_260B23FD0();
  }
  uint64_t v19 = type metadata accessor for UserNotification.LegacyContent(0);
  sub_260B197EC((uint64_t)v1 + *(int *)(v19 + 20), (uint64_t)v14, &qword_26A8D5250);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v14, v8);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D51D0, MEMORY[0x263F07490]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v20 = v24;
  sub_260B197EC((uint64_t)v1 + *(int *)(v19 + 24), (uint64_t)v7, &qword_26A8D5258);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v7, 1, v3) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    int v21 = v23;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v23, v7, v3);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D5260, MEMORY[0x263F063B0]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v3);
  }
  sub_260B23FD0();
  return sub_260B23FD0();
}

unint64_t sub_260B14060()
{
  unint64_t result = 0x79726F6765746163;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x746144746E657665;
      break;
    case 2:
      unint64_t result = 0x6E6F697461727564;
      break;
    case 3:
      unint64_t result = 0x7961446C6C417369;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260B1411C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_260B228A4(a1, a2);
  *a3 = result;
  return result;
}

void sub_260B14144(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_260B14150(uint64_t a1)
{
  unint64_t v2 = sub_260B1A25C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B1418C(uint64_t a1)
{
  unint64_t v2 = sub_260B1A25C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.LegacyContent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5268);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B1A25C();
  sub_260B24000();
  uint64_t v9 = *((void *)v3 + 4);
  __int16 v10 = *((_WORD *)v3 + 20);
  char v11 = *((unsigned char *)v3 + 42);
  long long v12 = v3[1];
  long long v15 = *v3;
  long long v16 = v12;
  uint64_t v17 = v9;
  char v19 = v11;
  __int16 v18 = v10;
  v14[15] = 0;
  sub_260B1A2B0();
  sub_260B23F00();
  if (!v2)
  {
    type metadata accessor for UserNotification.LegacyContent(0);
    LOBYTE(v15) = 1;
    sub_260B23A90();
    sub_260B18B54(&qword_26A8D51E8, MEMORY[0x263F07490]);
    sub_260B23F00();
    LOBYTE(v15) = 2;
    sub_260B23A00();
    sub_260B18B54(&qword_26A8D5280, MEMORY[0x263F063B0]);
    sub_260B23F00();
    LOBYTE(v15) = 3;
    sub_260B23F20();
    LOBYTE(v15) = 4;
    sub_260B23F20();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t UserNotification.LegacyContent.hashValue.getter()
{
  uint64_t v1 = sub_260B23A00();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v21[0] = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_260B23A90();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  __int16 v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B23FB0();
  uint64_t v14 = *(void *)(v0 + 8);
  if (v14)
  {
    char v15 = *(unsigned char *)(v0 + 42);
    __int16 v16 = *(_WORD *)(v0 + 40);
    uint64_t v17 = *(void *)(v0 + 16);
    v21[1] = *(void *)v0;
    v21[2] = v14;
    v21[3] = v17;
    long long v22 = *(_OWORD *)(v0 + 24);
    __int16 v23 = v16 & 0x101;
    char v24 = v15 & 1;
    sub_260B23FD0();
    UserNotification.LegacyCategory.hash(into:)((uint64_t)v25);
  }
  else
  {
    sub_260B23FD0();
  }
  uint64_t v18 = type metadata accessor for UserNotification.LegacyContent(0);
  sub_260B197EC(v0 + *(int *)(v18 + 20), (uint64_t)v13, &qword_26A8D5250);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v13, v7);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D51D0, MEMORY[0x263F07490]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_260B197EC(v0 + *(int *)(v18 + 24), (uint64_t)v6, &qword_26A8D5258);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v6, 1, v1) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    uint64_t v19 = v21[0];
    (*(void (**)(void, char *, uint64_t))(v2 + 32))(v21[0], v6, v1);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D5260, MEMORY[0x263F063B0]);
    sub_260B23B70();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v19, v1);
  }
  sub_260B23FD0();
  sub_260B23FD0();
  return sub_260B23FE0();
}

uint64_t UserNotification.LegacyContent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  MEMORY[0x270FA5388](v3 - 8);
  char v44 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  MEMORY[0x270FA5388](v5 - 8);
  char v43 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5288);
  uint64_t v42 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v48 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (_OWORD *)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_OWORD *)((char *)v11 + 27) = 0u;
  *uint64_t v11 = 0u;
  v11[1] = 0u;
  uint64_t v12 = (char *)v11 + v9[7];
  uint64_t v13 = sub_260B23A90();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  uint64_t v41 = (uint64_t)v12;
  v14(v12, 1, 1, v13);
  uint64_t v15 = (uint64_t)v11 + v9[8];
  uint64_t v16 = sub_260B23A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = v9[9];
  *((unsigned char *)v11 + v17) = 0;
  uint64_t v18 = v9[10];
  uint64_t v46 = (uint64_t)a1;
  uint64_t v47 = v11;
  *((unsigned char *)v11 + v18) = 0;
  uint64_t v19 = a1[3];
  uint64_t v20 = a1;
  int v21 = v48;
  __swift_project_boxed_opaque_existential_1(v20, v19);
  sub_260B1A25C();
  uint64_t v22 = v49;
  sub_260B23FF0();
  if (v22)
  {
    uint64_t v35 = v46;
    uint64_t v32 = (uint64_t)v47;
  }
  else
  {
    uint64_t v49 = v16;
    uint64_t v38 = v17;
    uint64_t v39 = v15;
    uint64_t v37 = v18;
    uint64_t v24 = (uint64_t)v43;
    uint64_t v23 = (uint64_t)v44;
    uint64_t v25 = v41;
    uint64_t v26 = v42;
    char v55 = 0;
    sub_260B1A304();
    sub_260B23E80();
    uint64_t v28 = v52;
    __int16 v29 = v53;
    char v30 = v54;
    long long v31 = v51;
    uint64_t v32 = (uint64_t)v47;
    *uint64_t v47 = v50;
    *(_OWORD *)(v32 + 16) = v31;
    *(void *)(v32 + 32) = v28;
    *(unsigned char *)(v32 + 42) = v30;
    *(_WORD *)(v32 + 40) = v29;
    LOBYTE(v50) = 1;
    sub_260B18B54(&qword_26A8D51F8, MEMORY[0x263F07490]);
    sub_260B23E80();
    sub_260B19850(v24, v25, &qword_26A8D5250);
    LOBYTE(v50) = 2;
    sub_260B18B54(&qword_26A8D5298, MEMORY[0x263F063B0]);
    sub_260B23E80();
    sub_260B19850(v23, v39, &qword_26A8D5258);
    LOBYTE(v50) = 3;
    *(unsigned char *)(v32 + v38) = sub_260B23EA0() & 1;
    LOBYTE(v50) = 4;
    uint64_t v33 = v45;
    char v34 = sub_260B23EA0();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v33);
    uint64_t v35 = v46;
    *(unsigned char *)(v32 + v37) = v34 & 1;
    sub_260B19084(v32, v40, type metadata accessor for UserNotification.LegacyContent);
  }
  __swift_destroy_boxed_opaque_existential_1(v35);
  return sub_260B0C9C4(v32, type metadata accessor for UserNotification.LegacyContent);
}

uint64_t sub_260B14DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_260B23A00();
  uint64_t v25 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v24 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_260B23A90();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v2[1];
  if (v17)
  {
    char v18 = *((unsigned char *)v2 + 42);
    __int16 v19 = *((_WORD *)v2 + 20);
    uint64_t v20 = v2[2];
    uint64_t v26 = *v2;
    uint64_t v27 = v17;
    uint64_t v28 = v20;
    long long v29 = *(_OWORD *)(v2 + 3);
    __int16 v30 = v19 & 0x101;
    char v31 = v18 & 1;
    sub_260B23FD0();
    UserNotification.LegacyCategory.hash(into:)(a1);
  }
  else
  {
    sub_260B23FD0();
  }
  sub_260B197EC((uint64_t)v2 + *(int *)(a2 + 20), (uint64_t)v16, &qword_26A8D5250);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v16, v10);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D51D0, MEMORY[0x263F07490]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  uint64_t v21 = v25;
  sub_260B197EC((uint64_t)v2 + *(int *)(a2 + 24), (uint64_t)v9, &qword_26A8D5258);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v9, 1, v5) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    uint64_t v22 = v24;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v24, v9, v5);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D5260, MEMORY[0x263F063B0]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v5);
  }
  sub_260B23FD0();
  return sub_260B23FD0();
}

uint64_t sub_260B151F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_260B23A00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v23[0] = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_260B23A90();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B23FB0();
  uint64_t v17 = *(void *)(v2 + 8);
  if (v17)
  {
    char v18 = *(unsigned char *)(v2 + 42);
    __int16 v19 = *(_WORD *)(v2 + 40);
    uint64_t v20 = *(void *)(v2 + 16);
    v23[1] = *(void *)v2;
    v23[2] = v17;
    v23[3] = v20;
    long long v24 = *(_OWORD *)(v2 + 24);
    __int16 v25 = v19 & 0x101;
    char v26 = v18 & 1;
    sub_260B23FD0();
    UserNotification.LegacyCategory.hash(into:)((uint64_t)v27);
  }
  else
  {
    sub_260B23FD0();
  }
  sub_260B197EC(v2 + *(int *)(a2 + 20), (uint64_t)v16, &qword_26A8D5250);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v16, v10);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D51D0, MEMORY[0x263F07490]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_260B197EC(v2 + *(int *)(a2 + 24), (uint64_t)v9, &qword_26A8D5258);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    uint64_t v21 = v23[0];
    (*(void (**)(void, char *, uint64_t))(v5 + 32))(v23[0], v9, v4);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D5260, MEMORY[0x263F063B0]);
    sub_260B23B70();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v21, v4);
  }
  sub_260B23FD0();
  sub_260B23FD0();
  return sub_260B23FE0();
}

uint64_t sub_260B15614@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return UserNotification.LegacyContent.init(from:)(a1, a2);
}

uint64_t sub_260B1562C(void *a1)
{
  return UserNotification.LegacyContent.encode(to:)(a1);
}

uint64_t UserNotification.LegacyCategory.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyCategory.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.identifier.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.actions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UserNotification.LegacyCategory.actions.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.actions.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.actionsMenuTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyCategory.actionsMenuTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.actionsMenuTitle.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.showButtonsOnBanner.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t UserNotification.LegacyCategory.showButtonsOnBanner.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.showButtonsOnBanner.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.lockScreenOnly.getter()
{
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t UserNotification.LegacyCategory.lockScreenOnly.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 41) = result;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.lockScreenOnly.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.alwaysShowAlternateActionMenu.getter()
{
  return *(unsigned __int8 *)(v0 + 42);
}

uint64_t UserNotification.LegacyCategory.alwaysShowAlternateActionMenu.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 42) = result;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.alwaysShowAlternateActionMenu.modify())()
{
  return nullsub_1;
}

void __swiftcall UserNotification.LegacyCategory.init(identifier:)(UserNotificationsServices::UserNotification::LegacyCategory *__return_ptr retstr, Swift::String identifier)
{
  retstr->identifier = identifier;
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  retstr->actionsMenuTitle.value._countAndFlagsBits = 0;
  retstr->actionsMenuTitle.value._object = 0;
  retstr->actions._rawValue = v2;
  *(_DWORD *)((char *)&retstr->actionsMenuTitle.value._object + 7) = 0;
}

uint64_t UserNotification.LegacyCategory.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 32);
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_260B1822C(a1, v4);
  swift_bridgeObjectRelease();
  sub_260B23FD0();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_260B23C10();
    swift_bridgeObjectRelease();
  }
  sub_260B23FD0();
  sub_260B23FD0();
  return sub_260B23FD0();
}

unint64_t sub_260B15944(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x736E6F69746361;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0x657263536B636F6CLL;
      break;
    case 5:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_260B15A30()
{
  return sub_260B15944(*v0);
}

uint64_t sub_260B15A38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_260B22AF0(a1, a2);
  *a3 = result;
  return result;
}

void sub_260B15A60(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_260B15A6C(uint64_t a1)
{
  unint64_t v2 = sub_260B1A358();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B15AA8(uint64_t a1)
{
  unint64_t v2 = sub_260B1A358();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.LegacyCategory.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D52A0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v12 = *(void *)(v1 + 24);
  uint64_t v13 = v7;
  uint64_t v11 = *(void *)(v1 + 32);
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 40);
  v10[4] = *(unsigned __int8 *)(v1 + 41);
  v10[5] = v7;
  v10[3] = *(unsigned __int8 *)(v1 + 42);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B1A358();
  sub_260B24000();
  char v21 = 0;
  uint64_t v8 = v14;
  sub_260B23F10();
  if (!v8)
  {
    uint64_t v15 = v13;
    char v20 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D52B0);
    sub_260B1A400(&qword_26A8D52B8, (void (*)(void))sub_260B1A3AC);
    sub_260B23F30();
    char v19 = 2;
    sub_260B23EF0();
    char v18 = 3;
    sub_260B23F20();
    char v17 = 4;
    sub_260B23F20();
    char v16 = 5;
    sub_260B23F20();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t UserNotification.LegacyCategory.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 40);
  char v2 = *((unsigned char *)v0 + 41);
  char v3 = *((unsigned char *)v0 + 42);
  uint64_t v6 = *v0;
  long long v7 = *(_OWORD *)(v0 + 1);
  long long v8 = *(_OWORD *)(v0 + 3);
  char v9 = v1;
  char v10 = v2;
  char v11 = v3;
  sub_260B23FB0();
  UserNotification.LegacyCategory.hash(into:)((uint64_t)v5);
  return sub_260B23FE0();
}

uint64_t UserNotification.LegacyCategory.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D52C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B1A358();
  sub_260B23FF0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v35 = 0;
    uint64_t v10 = sub_260B23E90();
    uint64_t v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D52B0);
    char v34 = 1;
    sub_260B1A400(&qword_26A8D52D0, (void (*)(void))sub_260B1A470);
    swift_bridgeObjectRetain();
    sub_260B23EB0();
    uint64_t v27 = v10;
    uint64_t v28 = a2;
    uint64_t v13 = v29;
    char v33 = 2;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_260B23E70();
    uint64_t v16 = v15;
    uint64_t v26 = v14;
    char v32 = 3;
    swift_bridgeObjectRetain();
    int v25 = sub_260B23EA0();
    char v31 = 4;
    int v24 = sub_260B23EA0();
    char v30 = 5;
    char v17 = sub_260B23EA0();
    char v18 = (void (**)(char *, uint64_t))(v6 + 8);
    char v19 = v17;
    v25 &= 1u;
    char v20 = v24 & 1;
    (*v18)(v8, v5);
    char v21 = v28;
    *uint64_t v28 = v27;
    v21[1] = v12;
    uint64_t v22 = v26;
    v21[2] = v13;
    v21[3] = v22;
    void v21[4] = v16;
    *((unsigned char *)v21 + 40) = v25;
    *((unsigned char *)v21 + 41) = v20;
    *((unsigned char *)v21 + 42) = v19 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260B161DC()
{
  char v1 = *((unsigned char *)v0 + 40);
  char v2 = *((unsigned char *)v0 + 41);
  char v3 = *((unsigned char *)v0 + 42);
  uint64_t v6 = *v0;
  long long v7 = *(_OWORD *)(v0 + 1);
  long long v8 = *(_OWORD *)(v0 + 3);
  char v9 = v1;
  char v10 = v2;
  char v11 = v3;
  sub_260B23FB0();
  UserNotification.LegacyCategory.hash(into:)((uint64_t)v5);
  return sub_260B23FE0();
}

uint64_t sub_260B16254()
{
  char v1 = *((unsigned char *)v0 + 40);
  char v2 = *((unsigned char *)v0 + 41);
  char v3 = *((unsigned char *)v0 + 42);
  uint64_t v6 = *v0;
  long long v7 = *(_OWORD *)(v0 + 1);
  long long v8 = *(_OWORD *)(v0 + 3);
  char v9 = v1;
  char v10 = v2;
  char v11 = v3;
  sub_260B23FB0();
  UserNotification.LegacyCategory.hash(into:)((uint64_t)v5);
  return sub_260B23FE0();
}

uint64_t sub_260B162C4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UserNotification.LegacyCategory.init(from:)(a1, a2);
}

uint64_t sub_260B162DC(void *a1)
{
  return UserNotification.LegacyCategory.encode(to:)(a1);
}

uint64_t UserNotification.LegacyAction.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyAction.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *char v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UserNotification.LegacyAction.identifier.modify())()
{
  return nullsub_1;
}

void UserNotification.LegacyAction.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *UserNotification.LegacyAction.style.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*UserNotification.LegacyAction.style.modify())()
{
  return nullsub_1;
}

void UserNotification.LegacyAction.actionType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

unsigned char *UserNotification.LegacyAction.actionType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 17) = *result;
  return result;
}

uint64_t (*UserNotification.LegacyAction.actionType.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyAction.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyAction.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*UserNotification.LegacyAction.title.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyAction.textPlaceholder.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyAction.textPlaceholder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*UserNotification.LegacyAction.textPlaceholder.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyAction.substituteEmojiInTextInput.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t UserNotification.LegacyAction.substituteEmojiInTextInput.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 56) = result;
  return result;
}

uint64_t (*UserNotification.LegacyAction.substituteEmojiInTextInput.modify())()
{
  return nullsub_1;
}

UserNotificationsServices::UserNotification::LegacyAction::Style_optional __swiftcall UserNotification.LegacyAction.Style.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  char *v1 = v2;
  return (UserNotificationsServices::UserNotification::LegacyAction::Style_optional)rawValue;
}

uint64_t UserNotification.LegacyAction.Style.rawValue.getter()
{
  return *v0;
}

BOOL sub_260B16554(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void *sub_260B1656C@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_260B1658C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_260B16598()
{
  return sub_260B23FE0();
}

uint64_t sub_260B165E0()
{
  return sub_260B23FE0();
}

uint64_t sub_260B16624()
{
  return sub_260B23D20();
}

uint64_t sub_260B16684()
{
  return sub_260B23CE0();
}

UserNotificationsServices::UserNotification::LegacyAction::ActionType_optional __swiftcall UserNotification.LegacyAction.ActionType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 5;
  if ((unint64_t)rawValue < 5) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (UserNotificationsServices::UserNotification::LegacyAction::ActionType_optional)rawValue;
}

uint64_t UserNotification.LegacyAction.ActionType.rawValue.getter()
{
  return *v0;
}

UserNotificationsServices::UserNotification::LegacyAction::ActionType_optional sub_260B166F0(Swift::Int *a1)
{
  return UserNotification.LegacyAction.ActionType.init(rawValue:)(*a1);
}

uint64_t sub_260B166F8()
{
  return sub_260B23D20();
}

uint64_t sub_260B16758()
{
  return sub_260B23CE0();
}

void __swiftcall UserNotification.LegacyAction.init(identifier:)(UserNotificationsServices::UserNotification::LegacyAction *__return_ptr retstr, Swift::String identifier)
{
  retstr->identifier = identifier;
  *(_WORD *)&retstr->style = 0;
  retstr->title = 0u;
  retstr->textPlaceholder = 0u;
  retstr->substituteEmojiInTextInput = 0;
}

uint64_t UserNotification.LegacyAction.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  sub_260B23FC0();
  sub_260B23FC0();
  if (!v1)
  {
    sub_260B23FD0();
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    sub_260B23FD0();
    return sub_260B23FD0();
  }
  sub_260B23FD0();
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_5;
  }
LABEL_3:
  sub_260B23FD0();
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  return sub_260B23FD0();
}

unint64_t sub_260B168CC()
{
  unint64_t result = 0x696669746E656469;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656C797473;
      break;
    case 2:
      unint64_t result = 0x79546E6F69746361;
      break;
    case 3:
      unint64_t result = 0x656C746974;
      break;
    case 4:
      unint64_t result = 0x63616C5074786574;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_260B169A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_260B22D8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_260B169D0(uint64_t a1)
{
  unint64_t v2 = sub_260B1A4C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_260B16A0C(uint64_t a1)
{
  unint64_t v2 = sub_260B1A4C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UserNotification.LegacyAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D52E0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = *(unsigned __int8 *)(v1 + 16);
  int v18 = *(unsigned __int8 *)(v1 + 17);
  int v19 = v7;
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v16 = *(void *)(v1 + 32);
  uint64_t v17 = v8;
  uint64_t v9 = *(void *)(v1 + 48);
  uint64_t v14 = *(void *)(v1 + 40);
  uint64_t v15 = v9;
  v13[3] = *(unsigned __int8 *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B1A4C4();
  sub_260B24000();
  char v28 = 0;
  uint64_t v10 = v20;
  sub_260B23F10();
  if (!v10)
  {
    char v11 = v18;
    char v27 = v19;
    char v26 = 1;
    sub_260B1A518();
    sub_260B23F30();
    char v25 = v11;
    char v24 = 2;
    sub_260B1A56C();
    sub_260B23F30();
    char v23 = 3;
    sub_260B23EF0();
    char v22 = 4;
    sub_260B23EF0();
    char v21 = 5;
    sub_260B23F20();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t UserNotification.LegacyAction.hashValue.getter()
{
  return sub_260B23FE0();
}

uint64_t UserNotification.LegacyAction.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5300);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_260B1A4C4();
  sub_260B23FF0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v34 = 0;
    uint64_t v10 = sub_260B23E90();
    uint64_t v12 = v11;
    char v32 = 1;
    sub_260B1A5C0();
    swift_bridgeObjectRetain();
    sub_260B23EB0();
    int v26 = v33;
    char v30 = 2;
    sub_260B1A614();
    sub_260B23EB0();
    uint64_t v25 = v10;
    int v24 = v31;
    char v29 = 3;
    uint64_t v13 = sub_260B23E70();
    uint64_t v15 = v14;
    uint64_t v22 = v13;
    char v23 = a2;
    char v28 = 4;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_260B23E70();
    uint64_t v18 = v17;
    uint64_t v21 = v16;
    char v27 = 5;
    swift_bridgeObjectRetain();
    char v19 = sub_260B23EA0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v20 = v23;
    *char v23 = v25;
    v20[1] = v12;
    *((unsigned char *)v20 + 16) = v26;
    *((unsigned char *)v20 + 17) = v24;
    v20[3] = v22;
    v20[4] = v15;
    v20[5] = v21;
    v20[6] = v18;
    *((unsigned char *)v20 + 56) = v19 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_260B170CC()
{
  return sub_260B23FE0();
}

uint64_t sub_260B17144()
{
  return sub_260B23FE0();
}

uint64_t sub_260B171B4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UserNotification.LegacyAction.init(from:)(a1, a2);
}

uint64_t sub_260B171CC(void *a1)
{
  return UserNotification.LegacyAction.encode(to:)(a1);
}

uint64_t sub_260B171E8()
{
  return sub_260B23D20();
}

uint64_t sub_260B17248()
{
  return sub_260B23CE0();
}

uint64_t sub_260B17298()
{
  return sub_260B23D20();
}

uint64_t sub_260B172F8()
{
  return sub_260B23CE0();
}

char *sub_260B17348(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v11 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = 15;
  uint64_t v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v16 = HIBYTE(a6) & 0xF) : (uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_260B17768(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  uint64_t v38 = a1;
  uint64_t v39 = v14;
  unint64_t v44 = 4 * v16;
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v9 = 15;
  unint64_t v8 = 15;
  unint64_t v17 = 15;
  while (1)
  {
    v46[0] = sub_260B23C90();
    v46[1] = v18;
    uint64_t v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    uint64_t v6 = v19;
    swift_bridgeObjectRelease();
    if (v6) {
      break;
    }
    unint64_t v9 = sub_260B23C30();
LABEL_9:
    if (v44 == v9 >> 14) {
      goto LABEL_29;
    }
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v9 = sub_260B23C30();
    *(void *)(v43 + 16) = v9;
    unint64_t v8 = v9;
    unint64_t v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v20 = sub_260B23CA0();
  uint64_t v40 = v21;
  uint64_t v41 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = sub_260B0AE20(0, *((void *)v10 + 2) + 1, 1, v10);
  }
  unint64_t v27 = *((void *)v10 + 2);
  unint64_t v26 = *((void *)v10 + 3);
  uint64_t v6 = v27 + 1;
  if (v27 >= v26 >> 1) {
    uint64_t v10 = sub_260B0AE20((char *)(v26 > 1), v27 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v6;
  char v28 = &v10[32 * v27];
  *((void *)v28 + 4) = v41;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v40;
  *(void *)(v39 + 16) = v10;
  uint64_t v29 = sub_260B23C30();
  unint64_t v9 = v29;
  *(void *)(v43 + 16) = v29;
  if (*((void *)v10 + 2) != v38)
  {
    unint64_t v8 = v29;
    unint64_t v17 = v29;
    goto LABEL_9;
  }
  unint64_t v17 = v29;
  unint64_t v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    uint64_t v6 = sub_260B23CA0();
    unint64_t v8 = v31;
    unint64_t v9 = v32;
    uint64_t v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t v10 = sub_260B0AE20(0, *((void *)v10 + 2) + 1, 1, v10);
LABEL_34:
  unint64_t v35 = *((void *)v10 + 2);
  unint64_t v34 = *((void *)v10 + 3);
  if (v35 >= v34 >> 1) {
    uint64_t v10 = sub_260B0AE20((char *)(v34 > 1), v35 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v35 + 1;
  uint64_t v36 = &v10[32 * v35];
  *((void *)v36 + 4) = v6;
  *((void *)v36 + 5) = v8;
  *((void *)v36 + 6) = v9;
  *((void *)v36 + 7) = v11;
  *(void *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_260B17768(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = a4;
  uint64_t v5 = sub_260B23CA0();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  unint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    unint64_t v9 = sub_260B0AE20(0, *((void *)v9 + 2) + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    unint64_t v9 = sub_260B0AE20((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  *((void *)v9 + 2) = v17 + 1;
  uint64_t v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

uint64_t sub_260B17878()
{
  uint64_t v1 = sub_260B23A10();
  uint64_t v17 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (uint64_t *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B197EC(v0, (uint64_t)v13, &qword_26B4029B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1) {
    return sub_260B23FD0();
  }
  sub_260B23358((uint64_t)v13, (uint64_t)v10, type metadata accessor for UserNotification.LocalizedContent);
  sub_260B23FD0();
  if (v10[1])
  {
    sub_260B23FD0();
    swift_bridgeObjectRetain();
    sub_260B23C10();
    swift_bridgeObjectRelease();
    if (v10[3]) {
      goto LABEL_5;
    }
LABEL_8:
    sub_260B23FD0();
    if (v10[5]) {
      goto LABEL_6;
    }
LABEL_9:
    sub_260B23FD0();
    goto LABEL_10;
  }
  sub_260B23FD0();
  if (!v10[3]) {
    goto LABEL_8;
  }
LABEL_5:
  sub_260B23FD0();
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
  if (!v10[5]) {
    goto LABEL_9;
  }
LABEL_6:
  sub_260B23FD0();
  swift_bridgeObjectRetain();
  sub_260B23C10();
  swift_bridgeObjectRelease();
LABEL_10:
  sub_260B197EC((uint64_t)v10 + *(int *)(v7 + 28), (uint64_t)v6, qword_26B4026D0);
  uint64_t v15 = v17;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v6, 1, v1) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v3, v6, v1);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D5238, MEMORY[0x263F06828]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v3, v1);
  }
  if (*((unsigned char *)v10 + *(int *)(v7 + 32)) != 2) {
    sub_260B23FD0();
  }
  sub_260B23FD0();
  return sub_260B0C9C4((uint64_t)v10, type metadata accessor for UserNotification.LocalizedContent);
}

uint64_t sub_260B17CC4(uint64_t a1)
{
  uint64_t v3 = sub_260B23A00();
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v31 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v32 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_260B23A90();
  uint64_t v35 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_260B197EC(v1, (uint64_t)v19, &qword_26B4029A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v19, 1, v13) == 1) {
    return sub_260B23FD0();
  }
  sub_260B23358((uint64_t)v19, (uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
  sub_260B23FD0();
  uint64_t v21 = *((void *)v16 + 1);
  if (v21)
  {
    char v22 = v16[42];
    __int16 v23 = *((_WORD *)v16 + 20);
    uint64_t v24 = *((void *)v16 + 2);
    uint64_t v36 = *(void *)v16;
    uint64_t v37 = v21;
    uint64_t v38 = v24;
    long long v39 = *(_OWORD *)(v16 + 24);
    __int16 v40 = v23 & 0x101;
    char v41 = v22 & 1;
    sub_260B23FD0();
    UserNotification.LegacyCategory.hash(into:)(a1);
  }
  else
  {
    sub_260B23FD0();
  }
  uint64_t v25 = v35;
  sub_260B197EC((uint64_t)&v16[*(int *)(v13 + 20)], (uint64_t)v12, &qword_26A8D5250);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v12, 1, v7) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v9, v12, v7);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D51D0, MEMORY[0x263F07490]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);
  }
  uint64_t v27 = v33;
  uint64_t v26 = v34;
  uint64_t v28 = v32;
  sub_260B197EC((uint64_t)&v16[*(int *)(v13 + 24)], v32, &qword_26A8D5258);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v28, 1, v26) == 1)
  {
    sub_260B23FD0();
  }
  else
  {
    uint64_t v29 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v31, v28, v26);
    sub_260B23FD0();
    sub_260B18B54(&qword_26A8D5260, MEMORY[0x263F063B0]);
    sub_260B23B70();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  }
  sub_260B23FD0();
  sub_260B23FD0();
  return sub_260B0C9C4((uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
}

uint64_t sub_260B1822C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_260B23FC0();
  if (v3)
  {
    uint64_t v5 = a2 + 88;
    do
    {
      uint64_t v6 = *(void *)(v5 - 24);
      uint64_t v7 = *(void *)(v5 - 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_260B23C10();
      sub_260B23FC0();
      sub_260B23FC0();
      if (v6)
      {
        sub_260B23FD0();
        swift_bridgeObjectRetain();
        sub_260B23C10();
        swift_bridgeObjectRelease();
        if (!v7) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_260B23FD0();
        if (!v7)
        {
LABEL_9:
          sub_260B23FD0();
          goto LABEL_4;
        }
      }
      sub_260B23FD0();
      swift_bridgeObjectRetain();
      sub_260B23C10();
      swift_bridgeObjectRelease();
LABEL_4:
      v5 += 64;
      sub_260B23FD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV10IdentifierV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_260B23F50(), uint64_t result = 0, (v5 & 1) != 0))
  {
    uint64_t v7 = type metadata accessor for UserNotification.Identifier(0);
    if (sub_260B23A70())
    {
      uint64_t v8 = *(int *)(v7 + 24);
      uint64_t v9 = *(void *)((char *)a1 + v8);
      uint64_t v10 = *(void *)((char *)a1 + v8 + 8);
      uint64_t v11 = (void *)((char *)a2 + v8);
      if (v9 == *v11 && v10 == v11[1])
      {
        return 1;
      }
      else
      {
        return sub_260B23F50();
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV12LegacyActionV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 17);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  int v26 = *(unsigned __int8 *)(a1 + 56);
  int v8 = *(unsigned __int8 *)(a2 + 16);
  int v9 = *(unsigned __int8 *)(a2 + 17);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a2 + 48);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    uint64_t result = 0;
    if (v2 != v8) {
      return result;
    }
    int v25 = *(unsigned __int8 *)(a2 + 56);
    if (v3 != v9) {
      return result;
    }
  }
  else
  {
    uint64_t v23 = *(void *)(a2 + 24);
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a2 + 48);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 40);
    int v25 = *(unsigned __int8 *)(a2 + 56);
    char v18 = sub_260B23F50();
    uint64_t result = 0;
    if ((v18 & 1) == 0) {
      return result;
    }
    if (v2 != v8) {
      return result;
    }
    uint64_t v6 = v17;
    uint64_t v7 = v16;
    uint64_t v12 = v15;
    uint64_t v10 = v23;
    uint64_t v4 = v24;
    if (v3 != v9) {
      return result;
    }
  }
  if (!v4)
  {
    if (v11) {
      return 0;
    }
    goto LABEL_16;
  }
  if (!v11) {
    return 0;
  }
  if (v5 == v10 && v4 == v11 || (v19 = v6, v20 = sub_260B23F50(), v6 = v19, v21 = v20, uint64_t result = 0, (v21 & 1) != 0))
  {
LABEL_16:
    if (v7)
    {
      if (v12)
      {
        if (v6 != v13 || v7 != v12)
        {
          char v22 = sub_260B23F50();
          uint64_t result = 0;
          if ((v22 & 1) == 0) {
            return result;
          }
        }
        return v26 ^ v25 ^ 1u;
      }
    }
    else if (!v12)
    {
      return v26 ^ v25 ^ 1u;
    }
    return 0;
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV14LegacyCategoryV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  int v6 = *(unsigned __int8 *)(a1 + 41);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  int v10 = *(unsigned __int8 *)(a2 + 40);
  int v11 = *(unsigned __int8 *)(a2 + 41);
  int v15 = *(unsigned __int8 *)(a2 + 42);
  int v16 = *(unsigned __int8 *)(a1 + 42);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (v12 = sub_260B23F50(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (sub_260B0B658(v2, v8))
    {
      if (v3)
      {
        if (v9)
        {
          if (v4 != v7 || v3 != v9)
          {
            char v14 = sub_260B23F50();
            uint64_t result = 0;
            if (v14 & 1) == 0 || ((v5 ^ v10)) {
              return result;
            }
LABEL_16:
            if (((v6 ^ v11) & 1) == 0) {
              return v16 ^ v15 ^ 1u;
            }
            return result;
          }
LABEL_15:
          uint64_t result = 0;
          if (v5 != v10) {
            return result;
          }
          goto LABEL_16;
        }
      }
      else if (!v9)
      {
        goto LABEL_15;
      }
    }
    return 0;
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV8BehaviorV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t result = 0;
  if (*a1 == *a2 && ((a1[1] ^ a2[1]) & 1) == 0 && ((a1[2] ^ a2[2]) & 1) == 0)
  {
    uint64_t v4 = (void *)*((void *)a1 + 1);
    int v5 = (void *)*((void *)a2 + 1);
    if (v4)
    {
      if (v5)
      {
        sub_260B2331C(0, &qword_26A8D5210);
        id v6 = v5;
        id v7 = v4;
        char v8 = sub_260B23DA0();

        if (v8) {
          return 1;
        }
      }
    }
    else if (!v5)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserNotification(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  id v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - v8;
  sub_260B2331C(0, &qword_26A8D54B8);
  char v10 = sub_260B23DA0();
  sub_260B19084(a1, (uint64_t)v9, type metadata accessor for UserNotification);
  sub_260B19084(a2, (uint64_t)v7, type metadata accessor for UserNotification);
  if ((v10 & 1) == 0)
  {
    sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification);
    sub_260B0C9C4((uint64_t)v9, type metadata accessor for UserNotification);
LABEL_10:
    char v15 = 0;
    return v15 & 1;
  }
  int v11 = (void *)*((void *)v9 + 1);
  char v12 = (void *)*((void *)v7 + 1);
  if (!v11)
  {
    id v16 = v12;
    sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification);
    sub_260B0C9C4((uint64_t)v9, type metadata accessor for UserNotification);
    if (!v12)
    {
      char v15 = 1;
      return v15 & 1;
    }
    goto LABEL_9;
  }
  if (!v12)
  {
    id v16 = v11;
    sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification);
    sub_260B0C9C4((uint64_t)v9, type metadata accessor for UserNotification);
LABEL_9:

    goto LABEL_10;
  }
  sub_260B2331C(0, &qword_26A8D5168);
  id v13 = v12;
  id v14 = v11;
  char v15 = sub_260B23DA0();
  sub_260B0C9C4((uint64_t)v7, type metadata accessor for UserNotification);
  sub_260B0C9C4((uint64_t)v9, type metadata accessor for UserNotification);

  return v15 & 1;
}

unint64_t sub_260B18A04()
{
  unint64_t result = qword_26A8D50F0;
  if (!qword_26A8D50F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D50F0);
  }
  return result;
}

unint64_t sub_260B18A58()
{
  unint64_t result = qword_26A8D50F8;
  if (!qword_26A8D50F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D50F8);
  }
  return result;
}

unint64_t sub_260B18AAC()
{
  unint64_t result = qword_26A8D5110;
  if (!qword_26A8D5110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5110);
  }
  return result;
}

unint64_t sub_260B18B00()
{
  unint64_t result = qword_26A8D5118;
  if (!qword_26A8D5118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5118);
  }
  return result;
}

uint64_t sub_260B18B54(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_260B18B9C()
{
  unint64_t result = qword_26A8D5138;
  if (!qword_26A8D5138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5138);
  }
  return result;
}

unint64_t sub_260B18BF0()
{
  unint64_t result = qword_26A8D5140;
  if (!qword_26A8D5140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5140);
  }
  return result;
}

unint64_t sub_260B18C44()
{
  unint64_t result = qword_26A8D5148;
  if (!qword_26A8D5148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5148);
  }
  return result;
}

unint64_t sub_260B18C98()
{
  unint64_t result = qword_26A8D5150;
  if (!qword_26A8D5150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5150);
  }
  return result;
}

unint64_t sub_260B18CEC()
{
  unint64_t result = qword_26A8D5158;
  if (!qword_26A8D5158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5158);
  }
  return result;
}

unint64_t sub_260B18D40()
{
  unint64_t result = qword_26A8D5178;
  if (!qword_26A8D5178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5178);
  }
  return result;
}

unint64_t sub_260B18D94()
{
  unint64_t result = qword_26A8D5180;
  if (!qword_26A8D5180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5180);
  }
  return result;
}

unint64_t sub_260B18DE8()
{
  unint64_t result = qword_26A8D5188;
  if (!qword_26A8D5188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B4029A0);
    sub_260B18B54(&qword_26A8D5190, (void (*)(uint64_t))type metadata accessor for UserNotification.LegacyContent);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5188);
  }
  return result;
}

unint64_t sub_260B18E8C()
{
  unint64_t result = qword_26A8D5198;
  if (!qword_26A8D5198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5198);
  }
  return result;
}

unint64_t sub_260B18EE0()
{
  unint64_t result = qword_26A8D51A0;
  if (!qword_26A8D51A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D51A0);
  }
  return result;
}

unint64_t sub_260B18F34()
{
  unint64_t result = qword_26A8D51A8;
  if (!qword_26A8D51A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D51A8);
  }
  return result;
}

unint64_t sub_260B18F88()
{
  unint64_t result = qword_26A8D51B0;
  if (!qword_26A8D51B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D51B0);
  }
  return result;
}

unint64_t sub_260B18FDC()
{
  unint64_t result = qword_26A8D51C0;
  if (!qword_26A8D51C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D51C0);
  }
  return result;
}

unint64_t sub_260B19030()
{
  unint64_t result = qword_26A8D51E0;
  if (!qword_26A8D51E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D51E0);
  }
  return result;
}

uint64_t sub_260B19084(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_260B190EC(void *a1)
{
  return sub_260B19108(a1) & 1;
}

uint64_t sub_260B19108(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_260B23F50() & 1;
  }
}

unint64_t sub_260B19160()
{
  unint64_t result = qword_26A8D5208;
  if (!qword_26A8D5208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5208);
  }
  return result;
}

unint64_t sub_260B191B4()
{
  unint64_t result = qword_26A8D5228;
  if (!qword_26A8D5228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5228);
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV16LocalizedContentV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = sub_260B23A10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D47D8);
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  id v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v40 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v40 - v18;
  uint64_t v20 = a1[1];
  uint64_t v21 = a2[1];
  if (!v20)
  {
    if (v21) {
      return 0;
    }
    goto LABEL_8;
  }
  if (!v21) {
    return 0;
  }
  if (*a1 == *a2 && v20 == v21 || (v22 = sub_260B23F50(), uint64_t result = 0, (v22 & 1) != 0))
  {
LABEL_8:
    uint64_t v24 = a1[3];
    uint64_t v25 = a2[3];
    if (v24)
    {
      if (!v25) {
        return 0;
      }
      if (a1[2] != a2[2] || v24 != v25)
      {
        char v26 = sub_260B23F50();
        uint64_t result = 0;
        if ((v26 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v25)
    {
      return 0;
    }
    uint64_t v27 = a1[5];
    uint64_t v28 = a2[5];
    if (v27)
    {
      if (!v28) {
        return 0;
      }
      if (a1[4] != a2[4] || v27 != v28)
      {
        char v29 = sub_260B23F50();
        uint64_t result = 0;
        if ((v29 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v28)
    {
      return 0;
    }
    uint64_t v30 = type metadata accessor for UserNotification.LocalizedContent(0);
    uint64_t v43 = v5;
    uint64_t v31 = v30;
    sub_260B197EC((uint64_t)a1 + *(int *)(v30 + 28), (uint64_t)v19, qword_26B4026D0);
    uint64_t v41 = v31;
    sub_260B197EC((uint64_t)a2 + *(int *)(v31 + 28), (uint64_t)v17, qword_26B4026D0);
    uint64_t v32 = (uint64_t)&v10[*(int *)(v8 + 48)];
    sub_260B197EC((uint64_t)v19, (uint64_t)v10, qword_26B4026D0);
    uint64_t v42 = v32;
    sub_260B197EC((uint64_t)v17, v32, qword_26B4026D0);
    uint64_t v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
    if (v33((uint64_t)v10, 1, v4) == 1)
    {
      sub_260B06B40((uint64_t)v17, qword_26B4026D0);
      sub_260B06B40((uint64_t)v19, qword_26B4026D0);
      if (v33(v42, 1, v4) == 1)
      {
        sub_260B06B40((uint64_t)v10, qword_26B4026D0);
        goto LABEL_29;
      }
      goto LABEL_27;
    }
    sub_260B197EC((uint64_t)v10, (uint64_t)v14, qword_26B4026D0);
    if (v33(v42, 1, v4) == 1)
    {
      sub_260B06B40((uint64_t)v17, qword_26B4026D0);
      sub_260B06B40((uint64_t)v19, qword_26B4026D0);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v4);
LABEL_27:
      sub_260B06B40((uint64_t)v10, &qword_26A8D47D8);
      return 0;
    }
    uint64_t v34 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v7, v42, v4);
    sub_260B18B54(&qword_26A8D47E0, MEMORY[0x263F06828]);
    LODWORD(v42) = sub_260B23B90();
    uint64_t v35 = *(void (**)(char *, uint64_t))(v34 + 8);
    v35(v7, v4);
    sub_260B06B40((uint64_t)v17, qword_26B4026D0);
    sub_260B06B40((uint64_t)v19, qword_26B4026D0);
    v35(v14, v4);
    sub_260B06B40((uint64_t)v10, qword_26B4026D0);
    if (v42)
    {
LABEL_29:
      uint64_t v36 = *(int *)(v41 + 32);
      int v37 = *((unsigned __int8 *)a1 + v36);
      int v38 = *((unsigned __int8 *)a2 + v36);
      if (v37 == 2)
      {
        if (v38 != 2) {
          return 0;
        }
      }
      else
      {
        BOOL v39 = (v37 & 1) == 0;
        if (v38 == 2 || ((v39 ^ v38) & 1) == 0) {
          return 0;
        }
      }
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_260B196F8()
{
  unint64_t result = qword_26A8D5248;
  if (!qword_26A8D5248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5248);
  }
  return result;
}

uint64_t sub_260B1974C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_260B1979C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_260B197EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_260B19850(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t _s25UserNotificationsServices0A12NotificationV13LegacyContentV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v76 = sub_260B23A00();
  uint64_t v78 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  id v71 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5498);
  MEMORY[0x270FA5388](v75);
  uint64_t v81 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v72 = (uint64_t)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v77 = (uint64_t)&v69 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v82 = (uint64_t)&v69 - v11;
  uint64_t v80 = sub_260B23A90();
  uint64_t v87 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v74 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D54A0);
  MEMORY[0x270FA5388](v79);
  uint64_t v88 = (uint64_t)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v85 = (uint64_t)&v69 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v86 = (uint64_t)&v69 - v19;
  uint64_t v20 = *(void *)a1;
  uint64_t v21 = *(void *)(a1 + 8);
  uint64_t v22 = *(void *)(a1 + 16);
  uint64_t v23 = *(void *)(a1 + 24);
  uint64_t v24 = *(void *)(a1 + 32);
  int v25 = *(unsigned __int8 *)(a1 + 42);
  uint64_t v83 = a2;
  uint64_t v84 = a1;
  int v26 = *(unsigned __int16 *)(a1 + 40) | (v25 << 16);
  uint64_t v27 = *(void *)a2;
  uint64_t v28 = *(void *)(a2 + 8);
  uint64_t v29 = *(void *)(a2 + 16);
  uint64_t v30 = *(void *)(a2 + 24);
  int v31 = *(unsigned __int16 *)(a2 + 40) | (*(unsigned __int8 *)(a2 + 42) << 16);
  uint64_t v32 = *(void *)(a2 + 32);
  uint64_t v89 = v22;
  if (!v21)
  {
    uint64_t v73 = v20;
    uint64_t v70 = v18;
    if (!v28) {
      goto LABEL_6;
    }
LABEL_10:
    sub_260B1974C(v27, v28);
    sub_260B1979C(v73, v21);
    sub_260B1979C(v27, v28);
    goto LABEL_22;
  }
  v93[0] = v20;
  v93[1] = v21;
  v93[2] = v22;
  v93[3] = v23;
  v93[4] = v24;
  __int16 v94 = v26;
  char v95 = BYTE2(v26);
  if (!v28)
  {
    uint64_t v73 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  uint64_t v70 = v18;
  v90[0] = v27;
  v90[1] = v28;
  v90[2] = v29;
  v90[3] = v30;
  v90[4] = v32;
  __int16 v91 = v31 & 0x101;
  char v92 = BYTE2(v31) & 1;
  char v33 = _s25UserNotificationsServices0A12NotificationV14LegacyCategoryV2eeoiySbAE_AEtFZ_0((uint64_t)v93, (uint64_t)v90);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_6:
  uint64_t v34 = type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v35 = v86;
  sub_260B197EC(v84 + *(int *)(v34 + 20), v86, &qword_26A8D5250);
  uint64_t v36 = v83;
  uint64_t v37 = v85;
  sub_260B197EC(v83 + *(int *)(v34 + 20), v85, &qword_26A8D5250);
  uint64_t v38 = v88;
  uint64_t v39 = v88 + *(int *)(v79 + 48);
  sub_260B197EC(v35, v88, &qword_26A8D5250);
  sub_260B197EC(v37, v39, &qword_26A8D5250);
  uint64_t v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v87 + 48);
  uint64_t v41 = v80;
  if (v40(v38, 1, v80) == 1)
  {
    sub_260B06B40(v37, &qword_26A8D5250);
    sub_260B06B40(v35, &qword_26A8D5250);
    int v42 = v40(v39, 1, v41);
    uint64_t v43 = (uint64_t)v81;
    uint64_t v44 = v82;
    uint64_t v45 = v78;
    if (v42 == 1)
    {
      sub_260B06B40(v88, &qword_26A8D5250);
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v49 = &qword_26A8D54A0;
    uint64_t v50 = v88;
LABEL_21:
    sub_260B06B40(v50, v49);
    goto LABEL_22;
  }
  uint64_t v46 = v70;
  sub_260B197EC(v38, v70, &qword_26A8D5250);
  int v47 = v40(v39, 1, v41);
  uint64_t v43 = (uint64_t)v81;
  uint64_t v44 = v82;
  uint64_t v48 = v41;
  if (v47 == 1)
  {
    sub_260B06B40(v85, &qword_26A8D5250);
    sub_260B06B40(v86, &qword_26A8D5250);
    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v46, v41);
    goto LABEL_13;
  }
  uint64_t v51 = v87;
  uint64_t v52 = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(v74, v39, v48);
  sub_260B18B54(&qword_26A8D54B0, MEMORY[0x263F07490]);
  char v53 = sub_260B23B90();
  char v54 = *(void (**)(char *, uint64_t))(v51 + 8);
  char v55 = v52;
  uint64_t v45 = v78;
  v54(v55, v48);
  sub_260B06B40(v85, &qword_26A8D5250);
  sub_260B06B40(v86, &qword_26A8D5250);
  v54((char *)v46, v48);
  uint64_t v36 = v83;
  sub_260B06B40(v88, &qword_26A8D5250);
  if ((v53 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_15:
  uint64_t v56 = v84;
  sub_260B197EC(v84 + *(int *)(v34 + 24), v44, &qword_26A8D5258);
  uint64_t v89 = v34;
  uint64_t v57 = v36 + *(int *)(v34 + 24);
  uint64_t v58 = v77;
  sub_260B197EC(v57, v77, &qword_26A8D5258);
  uint64_t v59 = v43 + *(int *)(v75 + 48);
  sub_260B197EC(v44, v43, &qword_26A8D5258);
  sub_260B197EC(v58, v59, &qword_26A8D5258);
  id v60 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48);
  uint64_t v61 = v76;
  if (v60(v43, 1, v76) != 1)
  {
    uint64_t v62 = v72;
    sub_260B197EC(v43, v72, &qword_26A8D5258);
    if (v60(v59, 1, v61) != 1)
    {
      uint64_t v65 = v71;
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v71, v59, v61);
      sub_260B18B54(&qword_26A8D54A8, MEMORY[0x263F063B0]);
      uint64_t v66 = v61;
      char v67 = sub_260B23B90();
      uint64_t v68 = *(void (**)(char *, uint64_t))(v45 + 8);
      v68(v65, v66);
      sub_260B06B40(v77, &qword_26A8D5258);
      sub_260B06B40(v82, &qword_26A8D5258);
      v68((char *)v62, v66);
      sub_260B06B40(v43, &qword_26A8D5258);
      if ((v67 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    sub_260B06B40(v77, &qword_26A8D5258);
    sub_260B06B40(v44, &qword_26A8D5258);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v62, v61);
    goto LABEL_20;
  }
  sub_260B06B40(v58, &qword_26A8D5258);
  sub_260B06B40(v44, &qword_26A8D5258);
  if (v60(v59, 1, v61) != 1)
  {
LABEL_20:
    uint64_t v49 = &qword_26A8D5498;
    uint64_t v50 = v43;
    goto LABEL_21;
  }
  sub_260B06B40(v43, &qword_26A8D5258);
LABEL_25:
  if (*(unsigned __int8 *)(v56 + *(int *)(v89 + 28)) == *(unsigned __int8 *)(v36 + *(int *)(v89 + 28)))
  {
    char v63 = *(unsigned char *)(v56 + *(int *)(v89 + 32)) ^ *(unsigned char *)(v36 + *(int *)(v89 + 32)) ^ 1;
    return v63 & 1;
  }
LABEL_22:
  char v63 = 0;
  return v63 & 1;
}

unint64_t sub_260B1A25C()
{
  unint64_t result = qword_26A8D5270;
  if (!qword_26A8D5270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5270);
  }
  return result;
}

unint64_t sub_260B1A2B0()
{
  unint64_t result = qword_26A8D5278;
  if (!qword_26A8D5278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5278);
  }
  return result;
}

unint64_t sub_260B1A304()
{
  unint64_t result = qword_26A8D5290;
  if (!qword_26A8D5290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5290);
  }
  return result;
}

unint64_t sub_260B1A358()
{
  unint64_t result = qword_26A8D52A8;
  if (!qword_26A8D52A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D52A8);
  }
  return result;
}

unint64_t sub_260B1A3AC()
{
  unint64_t result = qword_26A8D52C0;
  if (!qword_26A8D52C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D52C0);
  }
  return result;
}

uint64_t sub_260B1A400(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8D52B0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_260B1A470()
{
  unint64_t result = qword_26A8D52D8;
  if (!qword_26A8D52D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D52D8);
  }
  return result;
}

unint64_t sub_260B1A4C4()
{
  unint64_t result = qword_26A8D52E8;
  if (!qword_26A8D52E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D52E8);
  }
  return result;
}

unint64_t sub_260B1A518()
{
  unint64_t result = qword_26A8D52F0;
  if (!qword_26A8D52F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D52F0);
  }
  return result;
}

unint64_t sub_260B1A56C()
{
  unint64_t result = qword_26A8D52F8;
  if (!qword_26A8D52F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D52F8);
  }
  return result;
}

unint64_t sub_260B1A5C0()
{
  unint64_t result = qword_26A8D5308;
  if (!qword_26A8D5308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5308);
  }
  return result;
}

unint64_t sub_260B1A614()
{
  unint64_t result = qword_26A8D5310;
  if (!qword_26A8D5310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5310);
  }
  return result;
}

uint64_t sub_260B1A668()
{
  return sub_260B18B54(&qword_26A8D5318, (void (*)(uint64_t))type metadata accessor for UserNotification);
}

uint64_t sub_260B1A6B0()
{
  return sub_260B18B54(&qword_26A8D5320, (void (*)(uint64_t))type metadata accessor for UserNotification.Identifier);
}

uint64_t sub_260B1A6F8()
{
  return sub_260B18B54(&qword_26A8D5328, (void (*)(uint64_t))type metadata accessor for UserNotification.Identifier);
}

unint64_t sub_260B1A744()
{
  unint64_t result = qword_26A8D5330;
  if (!qword_26A8D5330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5330);
  }
  return result;
}

uint64_t sub_260B1A798()
{
  return sub_260B18B54(&qword_26A8D5338, (void (*)(uint64_t))type metadata accessor for UserNotification.LocalizedContent);
}

unint64_t sub_260B1A7E4()
{
  unint64_t result = qword_26A8D5340;
  if (!qword_26A8D5340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5340);
  }
  return result;
}

unint64_t sub_260B1A83C()
{
  unint64_t result = qword_26A8D5348;
  if (!qword_26A8D5348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5348);
  }
  return result;
}

unint64_t sub_260B1A894()
{
  unint64_t result = qword_26A8D5350;
  if (!qword_26A8D5350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5350);
  }
  return result;
}

unint64_t sub_260B1A8EC()
{
  unint64_t result = qword_26A8D5358;
  if (!qword_26A8D5358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5358);
  }
  return result;
}

uint64_t sub_260B1A940()
{
  return sub_260B18B54(&qword_26A8D5360, (void (*)(uint64_t))type metadata accessor for UserNotification.LegacyContent);
}

unint64_t sub_260B1A98C()
{
  unint64_t result = qword_26A8D5368;
  if (!qword_26A8D5368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5368);
  }
  return result;
}

unint64_t sub_260B1A9E4()
{
  unint64_t result = qword_26A8D5370;
  if (!qword_26A8D5370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5370);
  }
  return result;
}

unint64_t sub_260B1AA3C()
{
  unint64_t result = qword_26A8D5378;
  if (!qword_26A8D5378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5378);
  }
  return result;
}

unint64_t sub_260B1AA94()
{
  unint64_t result = qword_26A8D5380;
  if (!qword_26A8D5380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5380);
  }
  return result;
}

unint64_t sub_260B1AAEC()
{
  unint64_t result = qword_26A8D5388;
  if (!qword_26A8D5388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5388);
  }
  return result;
}

unint64_t sub_260B1AB44()
{
  unint64_t result = qword_26A8D5390;
  if (!qword_26A8D5390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5390);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for UserNotification(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[1];
    *((void *)a1 + 1) = v8;
    a1[16] = *((unsigned char *)a2 + 16);
    uint64_t v9 = a3[7];
    __dst = &a1[v9];
    uint64_t v10 = (char **)((char *)a2 + v9);
    uint64_t v11 = type metadata accessor for UserNotification.LegacyContent(0);
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48);
    uint64_t v14 = v4;
    uint64_t v15 = v8;
    if (v13(v10, 1, v11))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
      memcpy(__dst, v10, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v17 = (int *)v11;
      uint64_t v18 = v10[1];
      uint64_t v73 = v12;
      if (v18)
      {
        uint64_t v19 = __dst;
        *(void *)__dst = *v10;
        *((void *)__dst + 1) = v18;
        uint64_t v20 = v10[3];
        *((void *)__dst + 2) = v10[2];
        *((void *)__dst + 3) = v20;
        *((void *)__dst + 4) = v10[4];
        __dst[40] = *((unsigned char *)v10 + 40);
        *(_WORD *)(__dst + 41) = *(_WORD *)((char *)v10 + 41);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v21 = *((_OWORD *)v10 + 1);
        uint64_t v19 = __dst;
        *(_OWORD *)__dst = *(_OWORD *)v10;
        *((_OWORD *)__dst + 1) = v21;
        *(_OWORD *)(__dst + 27) = *(_OWORD *)((char *)v10 + 27);
      }
      uint64_t v22 = v17[5];
      uint64_t v23 = (char *)v19 + v22;
      uint64_t v24 = (char *)v10 + v22;
      uint64_t v25 = sub_260B23A90();
      uint64_t v26 = *(void *)(v25 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
        memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      }
      uint64_t v28 = v17[6];
      uint64_t v29 = (char *)v19 + v28;
      uint64_t v30 = (char *)v10 + v28;
      uint64_t v31 = sub_260B23A00();
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
      {
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      }
      *((unsigned char *)v19 + v17[7]) = *((unsigned char *)v10 + v17[7]);
      *((unsigned char *)v19 + v17[8]) = *((unsigned char *)v10 + v17[8]);
      (*(void (**)(void *, void, uint64_t, int *))(v73 + 56))(v19, 0, 1, v17);
    }
    uint64_t v34 = a3[8];
    uint64_t v35 = &v7[v34];
    uint64_t v36 = (char **)((char *)a2 + v34);
    uint64_t v37 = type metadata accessor for UserNotification.LocalizedContent(0);
    uint64_t v38 = *(void *)(v37 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
      memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      uint64_t v72 = v38;
      uint64_t v40 = v36[1];
      *(void *)uint64_t v35 = *v36;
      *((void *)v35 + 1) = v40;
      uint64_t v41 = v36[3];
      *((void *)v35 + 2) = v36[2];
      *((void *)v35 + 3) = v41;
      uint64_t v42 = v36[5];
      *((void *)v35 + 4) = v36[4];
      *((void *)v35 + 5) = v42;
      uint64_t v43 = *(int *)(v37 + 28);
      id v71 = &v35[v43];
      __dsta = (char *)v36 + v43;
      uint64_t v44 = sub_260B23A10();
      uint64_t v70 = *(void *)(v44 - 8);
      uint64_t v74 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48);
      uint64_t v45 = v44;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v74(__dsta, 1, v45))
      {
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
        memcpy(v71, __dsta, *(void *)(*(void *)(v46 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v71, __dsta, v45);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v71, 0, 1, v45);
      }
      v35[*(int *)(v37 + 32)] = *((unsigned char *)v36 + *(int *)(v37 + 32));
      (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v35, 0, 1, v37);
    }
    uint64_t v47 = a3[9];
    uint64_t v48 = &v7[v47];
    uint64_t v49 = (uint64_t)a2 + v47;
    uint64_t v50 = *(char **)((char *)a2 + v47 + 8);
    if (v50 == (void *)1)
    {
      *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
    }
    else
    {
      char *v48 = *(unsigned char *)v49;
      *(_WORD *)(v48 + 1) = *(_WORD *)(v49 + 1);
      *((void *)v48 + 1) = v50;
      id v51 = v50;
    }
    uint64_t v52 = a3[11];
    v7[a3[10]] = *((unsigned char *)a2 + a3[10]);
    v7[v52] = *((unsigned char *)a2 + v52);
    uint64_t v53 = a3[13];
    v7[a3[12]] = *((unsigned char *)a2 + a3[12]);
    *(void *)&v7[v53] = *(char **)((char *)a2 + v53);
    uint64_t v54 = a3[14];
    uint64_t v55 = a3[15];
    uint64_t v56 = *(char **)((char *)a2 + v54);
    *(void *)&v7[v54] = v56;
    uint64_t v57 = &v7[v55];
    uint64_t v58 = (char *)a2 + v55;
    uint64_t v59 = sub_260B23B00();
    uint64_t v60 = *(void *)(v59 - 8);
    uint64_t v61 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48);
    id v62 = v56;
    if (v61(v58, 1, v59))
    {
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
      memcpy(v57, v58, *(void *)(*(void *)(v63 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v57, v58, v59);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v57, 0, 1, v59);
    }
    uint64_t v64 = a3[16];
    uint64_t v65 = a3[17];
    uint64_t v66 = *(char **)((char *)a2 + v64);
    *(void *)&v7[v64] = v66;
    v7[v65] = *((unsigned char *)a2 + v65);
    uint64_t v67 = a3[19];
    v7[a3[18]] = *((unsigned char *)a2 + a3[18]);
    v7[v67] = *((unsigned char *)a2 + v67);
    id v68 = v66;
  }
  return v7;
}

void destroy for UserNotification(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[7];
  uint64_t v5 = type metadata accessor for UserNotification.LegacyContent(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    if (*((void *)v4 + 1))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v6 = &v4[*(int *)(v5 + 20)];
    uint64_t v7 = sub_260B23A90();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    }
    uint64_t v9 = &v4[*(int *)(v5 + 24)];
    uint64_t v10 = sub_260B23A00();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  uint64_t v12 = (char *)a1 + a2[8];
  uint64_t v13 = type metadata accessor for UserNotification.LocalizedContent(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = &v12[*(int *)(v13 + 28)];
    uint64_t v15 = sub_260B23A10();
    uint64_t v16 = *(void *)(v15 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15)) {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
    }
  }
  uint64_t v17 = *(id *)((char *)a1 + a2[9] + 8);
  if (v17 != (void *)1) {

  }
  uint64_t v18 = (char *)a1 + a2[15];
  uint64_t v19 = sub_260B23B00();
  uint64_t v20 = *(void *)(v19 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19)) {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v19);
  }
  long long v21 = *(id *)((char *)a1 + a2[16]);
}

uint64_t initializeWithCopy for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v11 = *(void **)(v10 - 8);
  uint64_t v12 = (unsigned int (*)(void *, uint64_t, uint64_t))v11[6];
  id v13 = v5;
  uint64_t v14 = v9;
  id v15 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
    memcpy(v8, v9, *(void *)(*(void *)(v16 - 8) + 64));
    uint64_t v17 = a3;
  }
  else
  {
    uint64_t v18 = v11;
    uint64_t v19 = v9[1];
    uint64_t v20 = v9;
    uint64_t v75 = v18;
    if (v19)
    {
      *uint64_t v8 = *v9;
      v8[1] = v19;
      uint64_t v21 = v9[3];
      v8[2] = v9[2];
      v8[3] = v21;
      v8[4] = v9[4];
      *((unsigned char *)v8 + 40) = *((unsigned char *)v9 + 40);
      *(_WORD *)((char *)v8 + 41) = *(_WORD *)((char *)v9 + 41);
      swift_bridgeObjectRetain();
      uint64_t v14 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v22 = *((_OWORD *)v9 + 1);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v22;
      *(_OWORD *)((char *)v8 + 27) = *(_OWORD *)((char *)v9 + 27);
    }
    uint64_t v23 = (int *)v10;
    uint64_t v17 = a3;
    uint64_t v24 = *(int *)(v10 + 20);
    __dsta = (char *)v8 + v24;
    uint64_t v25 = (char *)v14 + v24;
    uint64_t v26 = sub_260B23A90();
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = v8;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
      memcpy(__dsta, v25, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(__dsta, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(__dsta, 0, 1, v26);
    }
    uint64_t v30 = v23[6];
    uint64_t v31 = (char *)v8 + v30;
    uint64_t v32 = (char *)v20 + v30;
    uint64_t v33 = sub_260B23A00();
    uint64_t v34 = *(void *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    *((unsigned char *)v28 + v23[7]) = *((unsigned char *)v20 + v23[7]);
    *((unsigned char *)v28 + v23[8]) = *((unsigned char *)v20 + v23[8]);
    (*((void (**)(void *, void, uint64_t, int *))v75 + 7))(v28, 0, 1, v23);
  }
  uint64_t v36 = v17[8];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  uint64_t v39 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v40 = *(unsigned int (***)(void *, uint64_t, uint64_t))(v39 - 8);
  if (v40[6](v38, 1, v39))
  {
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    __dstb = v40;
    uint64_t v42 = v38[1];
    *uint64_t v37 = *v38;
    v37[1] = v42;
    uint64_t v43 = v38[3];
    v37[2] = v38[2];
    v37[3] = v43;
    uint64_t v44 = v38[5];
    v37[4] = v38[4];
    v37[5] = v44;
    uint64_t v45 = *(int *)(v39 + 28);
    uint64_t v74 = (char *)v38 + v45;
    uint64_t v76 = (char *)v37 + v45;
    uint64_t v46 = sub_260B23A10();
    uint64_t v72 = *(void *)(v46 - 8);
    uint64_t v73 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48);
    uint64_t v47 = v46;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v73(v74, 1, v47))
    {
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
      memcpy(v76, v74, *(void *)(*(void *)(v48 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v76, v74, v47);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v76, 0, 1, v47);
    }
    *((unsigned char *)v37 + *(int *)(v39 + 32)) = *((unsigned char *)v38 + *(int *)(v39 + 32));
    (*((void (**)(void *, void, uint64_t, uint64_t))__dstb + 7))(v37, 0, 1, v39);
  }
  uint64_t v49 = v17[9];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = a2 + v49;
  uint64_t v52 = *(void **)(a2 + v49 + 8);
  if (v52 == (void *)1)
  {
    *(_OWORD *)uint64_t v50 = *(_OWORD *)v51;
  }
  else
  {
    *(unsigned char *)uint64_t v50 = *(unsigned char *)v51;
    *(_WORD *)(v50 + 1) = *(_WORD *)(v51 + 1);
    *(void *)(v50 + 8) = v52;
    id v53 = v52;
  }
  uint64_t v54 = v17[11];
  *(unsigned char *)(a1 + v17[10]) = *(unsigned char *)(a2 + v17[10]);
  *(unsigned char *)(a1 + v54) = *(unsigned char *)(a2 + v54);
  uint64_t v55 = v17[13];
  *(unsigned char *)(a1 + v17[12]) = *(unsigned char *)(a2 + v17[12]);
  *(void *)(a1 + v55) = *(void *)(a2 + v55);
  uint64_t v56 = v17[14];
  uint64_t v57 = v17[15];
  uint64_t v58 = *(void **)(a2 + v56);
  *(void *)(a1 + v56) = v58;
  uint64_t v59 = (void *)(a1 + v57);
  uint64_t v60 = (const void *)(a2 + v57);
  uint64_t v61 = sub_260B23B00();
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v63 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v62 + 48);
  id v64 = v58;
  if (v63(v60, 1, v61))
  {
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
    memcpy(v59, v60, *(void *)(*(void *)(v65 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v62 + 16))(v59, v60, v61);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
  }
  uint64_t v66 = v17[16];
  uint64_t v67 = v17[17];
  id v68 = *(void **)(a2 + v66);
  *(void *)(a1 + v66) = v68;
  *(unsigned char *)(a1 + v67) = *(unsigned char *)(a2 + v67);
  uint64_t v69 = v17[19];
  *(unsigned char *)(a1 + v17[18]) = *(unsigned char *)(a2 + v17[18]);
  *(unsigned char *)(a1 + v69) = *(unsigned char *)(a2 + v69);
  id v70 = v68;
  return a1;
}

uint64_t assignWithCopy for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v10;
  id v11 = v10;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v115 = a3;
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (long long *)(a2 + v12);
  id v15 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v16 = *((void *)v15 - 1);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17((uint64_t)v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      if (*((void *)v14 + 1))
      {
        *(void *)uint64_t v13 = *(void *)v14;
        *(void *)(v13 + 8) = *((void *)v14 + 1);
        *(void *)(v13 + 16) = *((void *)v14 + 2);
        *(void *)(v13 + 24) = *((void *)v14 + 3);
        *(void *)(v13 + 32) = *((void *)v14 + 4);
        *(unsigned char *)(v13 + 40) = *((unsigned char *)v14 + 40);
        *(unsigned char *)(v13 + 41) = *((unsigned char *)v14 + 41);
        *(unsigned char *)(v13 + 42) = *((unsigned char *)v14 + 42);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v22 = *v14;
        long long v23 = v14[1];
        *(_OWORD *)(v13 + 27) = *(long long *)((char *)v14 + 27);
        *(_OWORD *)uint64_t v13 = v22;
        *(_OWORD *)(v13 + 16) = v23;
      }
      uint64_t v24 = v15[5];
      uint64_t v25 = (void *)(v13 + v24);
      uint64_t v26 = (char *)v14 + v24;
      uint64_t v27 = sub_260B23A90();
      uint64_t v28 = *(void *)(v27 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
        memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      }
      uint64_t v30 = v15[6];
      uint64_t v31 = (void *)(v13 + v30);
      uint64_t v32 = (char *)v14 + v30;
      uint64_t v33 = sub_260B23A00();
      uint64_t v34 = *(void *)(v33 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
      {
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
        memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      }
      *(unsigned char *)(v13 + v15[7]) = *((unsigned char *)v14 + v15[7]);
      *(unsigned char *)(v13 + v15[8]) = *((unsigned char *)v14 + v15[8]);
      (*(void (**)(uint64_t, void, uint64_t, int *))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_19;
    }
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
    memcpy((void *)v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
LABEL_19:
    uint64_t v36 = v115;
    goto LABEL_20;
  }
  if (v19)
  {
    sub_260B0C9C4(v13, type metadata accessor for UserNotification.LegacyContent);
    goto LABEL_7;
  }
  uint64_t v21 = *((void *)v14 + 1);
  if (*(void *)(v13 + 8))
  {
    if (v21)
    {
      *(void *)uint64_t v13 = *(void *)v14;
      *(void *)(v13 + 8) = *((void *)v14 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v13 + 16) = *((void *)v14 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v13 + 24) = *((void *)v14 + 3);
      *(void *)(v13 + 32) = *((void *)v14 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v13 + 40) = *((unsigned char *)v14 + 40);
      *(unsigned char *)(v13 + 41) = *((unsigned char *)v14 + 41);
      *(unsigned char *)(v13 + 42) = *((unsigned char *)v14 + 42);
    }
    else
    {
      sub_260B1CBFC(v13);
      long long v57 = *(long long *)((char *)v14 + 27);
      long long v58 = v14[1];
      *(_OWORD *)uint64_t v13 = *v14;
      *(_OWORD *)(v13 + 16) = v58;
      *(_OWORD *)(v13 + 27) = v57;
    }
  }
  else if (v21)
  {
    *(void *)uint64_t v13 = *(void *)v14;
    *(void *)(v13 + 8) = *((void *)v14 + 1);
    *(void *)(v13 + 16) = *((void *)v14 + 2);
    *(void *)(v13 + 24) = *((void *)v14 + 3);
    *(void *)(v13 + 32) = *((void *)v14 + 4);
    *(unsigned char *)(v13 + 40) = *((unsigned char *)v14 + 40);
    *(unsigned char *)(v13 + 41) = *((unsigned char *)v14 + 41);
    *(unsigned char *)(v13 + 42) = *((unsigned char *)v14 + 42);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v59 = *v14;
    long long v60 = v14[1];
    *(_OWORD *)(v13 + 27) = *(long long *)((char *)v14 + 27);
    *(_OWORD *)uint64_t v13 = v59;
    *(_OWORD *)(v13 + 16) = v60;
  }
  uint64_t v61 = v15[5];
  uint64_t v62 = (void *)(v13 + v61);
  uint64_t v63 = (char *)v14 + v61;
  uint64_t v64 = sub_260B23A90();
  uint64_t v108 = *(void *)(v64 - 8);
  uint64_t v65 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v108 + 48);
  uint64_t v113 = v62;
  LODWORD(v62) = v65(v62, 1, v64);
  int v66 = v65(v63, 1, v64);
  if (v62)
  {
    if (v66)
    {
      size_t v67 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250) - 8) + 64);
      id v68 = v113;
LABEL_45:
      memcpy(v68, v63, v67);
      goto LABEL_65;
    }
    (*(void (**)(void *, char *, uint64_t))(v108 + 16))(v113, v63, v64);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v108 + 56))(v113, 0, 1, v64);
  }
  else
  {
    if (v66)
    {
      (*(void (**)(void *, uint64_t))(v108 + 8))(v113, v64);
      size_t v67 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250) - 8) + 64);
      id v68 = v113;
      goto LABEL_45;
    }
    (*(void (**)(void *, char *, uint64_t))(v108 + 24))(v113, v63, v64);
  }
LABEL_65:
  uint64_t v96 = v15[6];
  uint64_t v97 = (void *)(v13 + v96);
  uint64_t v98 = (char *)v14 + v96;
  uint64_t v99 = sub_260B23A00();
  uint64_t v109 = *(void *)(v99 - 8);
  uint64_t v100 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v109 + 48);
  uint64_t v114 = v97;
  LODWORD(v97) = v100(v97, 1, v99);
  int v101 = v100(v98, 1, v99);
  if (v97)
  {
    if (!v101)
    {
      (*(void (**)(void *, char *, uint64_t))(v109 + 16))(v114, v98, v99);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v109 + 56))(v114, 0, 1, v99);
      goto LABEL_73;
    }
    size_t v102 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258) - 8) + 64);
    v103 = v114;
  }
  else
  {
    if (!v101)
    {
      (*(void (**)(void *, char *, uint64_t))(v109 + 24))(v114, v98, v99);
      goto LABEL_73;
    }
    (*(void (**)(void *, uint64_t))(v109 + 8))(v114, v99);
    size_t v102 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258) - 8) + 64);
    v103 = v114;
  }
  memcpy(v103, v98, v102);
LABEL_73:
  uint64_t v36 = v115;
  *(unsigned char *)(v13 + v15[7]) = *((unsigned char *)v14 + v15[7]);
  *(unsigned char *)(v13 + v15[8]) = *((unsigned char *)v14 + v15[8]);
LABEL_20:
  uint64_t v37 = v36[8];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  uint64_t v40 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v41 + 48);
  int v43 = v42(v38, 1, v40);
  int v44 = v42(v39, 1, v40);
  if (!v43)
  {
    if (v44)
    {
      sub_260B0C9C4((uint64_t)v38, type metadata accessor for UserNotification.LocalizedContent);
      goto LABEL_26;
    }
    void *v38 = *v39;
    v38[1] = v39[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v38[2] = v39[2];
    v38[3] = v39[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v38[4] = v39[4];
    v38[5] = v39[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v49 = *(int *)(v40 + 28);
    uint64_t v50 = (char *)v38 + v49;
    uint64_t v51 = (char *)v39 + v49;
    uint64_t v52 = sub_260B23A10();
    uint64_t v107 = *(void *)(v52 - 8);
    id v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v107 + 48);
    uint64_t v112 = v50;
    LODWORD(v50) = v53(v50, 1, v52);
    int v54 = v53(v51, 1, v52);
    if (v50)
    {
      if (!v54)
      {
        (*(void (**)(void *, char *, uint64_t))(v107 + 16))(v112, v51, v52);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v107 + 56))(v112, 0, 1, v52);
        goto LABEL_48;
      }
      size_t v55 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0) - 8) + 64);
      uint64_t v56 = v112;
    }
    else
    {
      if (!v54)
      {
        (*(void (**)(void *, char *, uint64_t))(v107 + 24))(v112, v51, v52);
        goto LABEL_48;
      }
      (*(void (**)(void *, uint64_t))(v107 + 8))(v112, v52);
      size_t v55 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0) - 8) + 64);
      uint64_t v56 = v112;
    }
    memcpy(v56, v51, v55);
LABEL_48:
    uint64_t v36 = v115;
    *((unsigned char *)v38 + *(int *)(v40 + 32)) = *((unsigned char *)v39 + *(int *)(v40 + 32));
    goto LABEL_49;
  }
  if (v44)
  {
LABEL_26:
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
    memcpy(v38, v39, *(void *)(*(void *)(v48 - 8) + 64));
    goto LABEL_49;
  }
  void *v38 = *v39;
  v38[1] = v39[1];
  v38[2] = v39[2];
  v38[3] = v39[3];
  v38[4] = v39[4];
  v38[5] = v39[5];
  uint64_t v45 = *(int *)(v40 + 28);
  __dst = (char *)v38 + v45;
  uint64_t v111 = v41;
  uint64_t v106 = (char *)v39 + v45;
  uint64_t v46 = sub_260B23A10();
  uint64_t v104 = *(void *)(v46 - 8);
  long long v105 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v104 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v105(v106, 1, v46))
  {
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(__dst, v106, *(void *)(*(void *)(v47 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v104 + 16))(__dst, v106, v46);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v104 + 56))(__dst, 0, 1, v46);
  }
  *((unsigned char *)v38 + *(int *)(v40 + 32)) = *((unsigned char *)v39 + *(int *)(v40 + 32));
  uint64_t v36 = v115;
  (*(void (**)(void *, void, uint64_t, uint64_t))(v111 + 56))(v38, 0, 1, v40);
LABEL_49:
  uint64_t v69 = v36[9];
  uint64_t v70 = a1 + v69;
  uint64_t v71 = a2 + v69;
  uint64_t v72 = *(void **)(a1 + v69 + 8);
  uint64_t v73 = *(void *)(a2 + v69 + 8);
  if (v72 == (void *)1)
  {
    if (v73 != 1)
    {
      *(unsigned char *)uint64_t v70 = *(unsigned char *)v71;
      *(unsigned char *)(v70 + 1) = *(unsigned char *)(v71 + 1);
      *(unsigned char *)(v70 + 2) = *(unsigned char *)(v71 + 2);
      uint64_t v74 = *(void **)(v71 + 8);
      *(void *)(v70 + 8) = v74;
      id v75 = v74;
      goto LABEL_56;
    }
    goto LABEL_54;
  }
  if (v73 == 1)
  {
    sub_260B1CC2C(v70);
LABEL_54:
    *(_OWORD *)uint64_t v70 = *(_OWORD *)v71;
    goto LABEL_56;
  }
  *(unsigned char *)uint64_t v70 = *(unsigned char *)v71;
  *(unsigned char *)(v70 + 1) = *(unsigned char *)(v71 + 1);
  *(unsigned char *)(v70 + 2) = *(unsigned char *)(v71 + 2);
  uint64_t v76 = *(void **)(v71 + 8);
  *(void *)(v70 + 8) = v76;
  id v77 = v76;

LABEL_56:
  *(unsigned char *)(a1 + v36[10]) = *(unsigned char *)(a2 + v36[10]);
  *(unsigned char *)(a1 + v36[11]) = *(unsigned char *)(a2 + v36[11]);
  *(unsigned char *)(a1 + v36[12]) = *(unsigned char *)(a2 + v36[12]);
  *(void *)(a1 + v36[13]) = *(void *)(a2 + v36[13]);
  uint64_t v78 = v36[14];
  uint64_t v79 = *(void **)(a1 + v78);
  uint64_t v80 = *(void **)(a2 + v78);
  *(void *)(a1 + v78) = v80;
  id v81 = v80;

  uint64_t v82 = v36[15];
  uint64_t v83 = (void *)(a1 + v82);
  uint64_t v84 = (void *)(a2 + v82);
  uint64_t v85 = sub_260B23B00();
  uint64_t v86 = *(void *)(v85 - 8);
  uint64_t v87 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v86 + 48);
  int v88 = v87(v83, 1, v85);
  int v89 = v87(v84, 1, v85);
  if (!v88)
  {
    if (!v89)
    {
      (*(void (**)(void *, void *, uint64_t))(v86 + 24))(v83, v84, v85);
      goto LABEL_62;
    }
    (*(void (**)(void *, uint64_t))(v86 + 8))(v83, v85);
    goto LABEL_61;
  }
  if (v89)
  {
LABEL_61:
    uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
    memcpy(v83, v84, *(void *)(*(void *)(v90 - 8) + 64));
    goto LABEL_62;
  }
  (*(void (**)(void *, void *, uint64_t))(v86 + 16))(v83, v84, v85);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v86 + 56))(v83, 0, 1, v85);
LABEL_62:
  uint64_t v91 = v36[16];
  char v92 = *(void **)(a1 + v91);
  v93 = *(void **)(a2 + v91);
  *(void *)(a1 + v91) = v93;
  id v94 = v93;

  *(unsigned char *)(a1 + v36[17]) = *(unsigned char *)(a2 + v36[17]);
  *(unsigned char *)(a1 + v36[18]) = *(unsigned char *)(a2 + v36[18]);
  *(unsigned char *)(a1 + v36[19]) = *(unsigned char *)(a2 + v36[19]);
  return a1;
}

uint64_t sub_260B1CBFC(uint64_t a1)
{
  return a1;
}

uint64_t sub_260B1CC2C(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = (_OWORD *)(a1 + v6);
  id v8 = (_OWORD *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v10 = *((void *)v9 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    long long v12 = v8[1];
    *uint64_t v7 = *v8;
    v7[1] = v12;
    *(_OWORD *)((char *)v7 + 27) = *(_OWORD *)((char *)v8 + 27);
    uint64_t v13 = v9[5];
    __dst = (char *)v7 + v13;
    uint64_t v14 = (char *)v8 + v13;
    uint64_t v15 = sub_260B23A90();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
      memcpy(__dst, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(__dst, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
    }
    uint64_t v18 = v9[6];
    __dsta = (char *)v7 + v18;
    int v19 = (char *)v8 + v18;
    uint64_t v20 = sub_260B23A00();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
      memcpy(__dsta, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(__dsta, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dsta, 0, 1, v20);
    }
    *((unsigned char *)v7 + v9[7]) = *((unsigned char *)v8 + v9[7]);
    *((unsigned char *)v7 + v9[8]) = *((unsigned char *)v8 + v9[8]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v23 = a3[8];
  uint64_t v24 = (_OWORD *)(a1 + v23);
  uint64_t v25 = (_OWORD *)(a2 + v23);
  uint64_t v26 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    long long v29 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v29;
    v24[2] = v25[2];
    uint64_t v30 = *(int *)(v26 + 28);
    __dstb = (char *)v24 + v30;
    uint64_t v31 = (char *)v25 + v30;
    uint64_t v32 = sub_260B23A10();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
      memcpy(__dstb, v31, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(__dstb, v31, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(__dstb, 0, 1, v32);
    }
    *((unsigned char *)v24 + *(int *)(v26 + 32)) = *((unsigned char *)v25 + *(int *)(v26 + 32));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v35 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v35) = *(unsigned char *)(a2 + v35);
  uint64_t v36 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v36) = *(unsigned char *)(a2 + v36);
  uint64_t v37 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v37) = *(void *)(a2 + v37);
  uint64_t v38 = a3[15];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (const void *)(a2 + v38);
  uint64_t v41 = sub_260B23B00();
  uint64_t v42 = *(void *)(v41 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
  {
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
    memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v42 + 32))(v39, v40, v41);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
  }
  uint64_t v44 = a3[17];
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(unsigned char *)(a1 + v44) = *(unsigned char *)(a2 + v44);
  uint64_t v45 = a3[19];
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  *(unsigned char *)(a1 + v45) = *(unsigned char *)(a2 + v45);
  return a1;
}

uint64_t assignWithTake for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v8 = a3[7];
  uint64_t v9 = (_OWORD *)(a1 + v8);
  uint64_t v10 = (_OWORD *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(uint64_t (**)(_OWORD *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_260B0C9C4((uint64_t)v9, type metadata accessor for UserNotification.LegacyContent);
      goto LABEL_7;
    }
    if (*((void *)v9 + 1))
    {
      uint64_t v23 = *((void *)v10 + 1);
      if (v23)
      {
        *(void *)uint64_t v9 = *(void *)v10;
        *((void *)v9 + 1) = v23;
        swift_bridgeObjectRelease();
        *((void *)v9 + 2) = *((void *)v10 + 2);
        swift_bridgeObjectRelease();
        uint64_t v24 = *((void *)v10 + 4);
        *((void *)v9 + 3) = *((void *)v10 + 3);
        *((void *)v9 + 4) = v24;
        swift_bridgeObjectRelease();
        *((unsigned char *)v9 + 40) = *((unsigned char *)v10 + 40);
        *((unsigned char *)v9 + 41) = *((unsigned char *)v10 + 41);
        *((unsigned char *)v9 + 42) = *((unsigned char *)v10 + 42);
        goto LABEL_18;
      }
      sub_260B1CBFC((uint64_t)v9);
    }
    long long v30 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v30;
    *(_OWORD *)((char *)v9 + 27) = *(_OWORD *)((char *)v10 + 27);
LABEL_18:
    uint64_t v31 = v11[5];
    uint64_t v32 = (char *)v9 + v31;
    __dstb = (char *)v10 + v31;
    uint64_t v33 = sub_260B23A90();
    uint64_t v92 = *(void *)(v33 - 8);
    uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v92 + 48);
    char v95 = v32;
    LODWORD(v32) = v34(v32, 1, v33);
    int v35 = v34(__dstb, 1, v33);
    if (v32)
    {
      if (v35)
      {
        size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250) - 8) + 64);
        uint64_t v37 = v95;
LABEL_23:
        memcpy(v37, __dstb, v36);
        goto LABEL_26;
      }
      (*(void (**)(void *, char *, uint64_t))(v92 + 32))(v95, __dstb, v33);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v92 + 56))(v95, 0, 1, v33);
    }
    else
    {
      if (v35)
      {
        (*(void (**)(void *, uint64_t))(v92 + 8))(v95, v33);
        size_t v36 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250) - 8) + 64);
        uint64_t v37 = v95;
        goto LABEL_23;
      }
      (*(void (**)(void *, char *, uint64_t))(v92 + 40))(v95, __dstb, v33);
    }
LABEL_26:
    uint64_t v38 = v11[6];
    uint64_t v39 = (char *)v9 + v38;
    __dstc = (char *)v10 + v38;
    uint64_t v40 = sub_260B23A00();
    uint64_t v93 = *(void *)(v40 - 8);
    uint64_t v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v93 + 48);
    uint64_t v96 = v39;
    LODWORD(v39) = v41(v39, 1, v40);
    int v42 = v41(__dstc, 1, v40);
    if (v39)
    {
      if (!v42)
      {
        (*(void (**)(void *, char *, uint64_t))(v93 + 32))(v96, __dstc, v40);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v93 + 56))(v96, 0, 1, v40);
        goto LABEL_34;
      }
      size_t v43 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258) - 8) + 64);
      uint64_t v44 = v96;
    }
    else
    {
      if (!v42)
      {
        (*(void (**)(void *, char *, uint64_t))(v93 + 40))(v96, __dstc, v40);
        goto LABEL_34;
      }
      (*(void (**)(void *, uint64_t))(v93 + 8))(v96, v40);
      size_t v43 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258) - 8) + 64);
      uint64_t v44 = v96;
    }
    memcpy(v44, __dstc, v43);
LABEL_34:
    *((unsigned char *)v9 + v11[7]) = *((unsigned char *)v10 + v11[7]);
    *((unsigned char *)v9 + v11[8]) = *((unsigned char *)v10 + v11[8]);
    goto LABEL_35;
  }
  if (v15)
  {
LABEL_7:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
    memcpy(v9, v10, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_35;
  }
  long long v16 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v16;
  *(_OWORD *)((char *)v9 + 27) = *(_OWORD *)((char *)v10 + 27);
  uint64_t v17 = v11[5];
  __dst = (char *)v9 + v17;
  uint64_t v18 = (char *)v10 + v17;
  uint64_t v19 = sub_260B23A90();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
    memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(__dst, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
  }
  uint64_t v25 = v11[6];
  __dsta = (char *)v9 + v25;
  uint64_t v26 = (char *)v10 + v25;
  uint64_t v27 = sub_260B23A00();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
    memcpy(__dsta, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(__dsta, v26, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(__dsta, 0, 1, v27);
  }
  *((unsigned char *)v9 + v11[7]) = *((unsigned char *)v10 + v11[7]);
  *((unsigned char *)v9 + v11[8]) = *((unsigned char *)v10 + v11[8]);
  (*(void (**)(_OWORD *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
LABEL_35:
  uint64_t v45 = a3[8];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (void *)(a2 + v45);
  uint64_t v48 = type metadata accessor for UserNotification.LocalizedContent(0);
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v50 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v49 + 48);
  int v51 = v50(v46, 1, v48);
  int v52 = v50(v47, 1, v48);
  if (!v51)
  {
    if (v52)
    {
      sub_260B0C9C4((uint64_t)v46, type metadata accessor for UserNotification.LocalizedContent);
      goto LABEL_41;
    }
    uint64_t v60 = v47[1];
    void *v46 = *v47;
    v46[1] = v60;
    swift_bridgeObjectRelease();
    uint64_t v61 = v47[3];
    v46[2] = v47[2];
    v46[3] = v61;
    swift_bridgeObjectRelease();
    uint64_t v62 = v47[5];
    void v46[4] = v47[4];
    v46[5] = v62;
    swift_bridgeObjectRelease();
    uint64_t v63 = *(int *)(v48 + 28);
    uint64_t v64 = (char *)v46 + v63;
    __dste = (char *)v47 + v63;
    uint64_t v65 = sub_260B23A10();
    uint64_t v94 = *(void *)(v65 - 8);
    uint64_t v97 = v64;
    int v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v94 + 48);
    LODWORD(v64) = v66(v64, 1, v65);
    int v67 = v66(__dste, 1, v65);
    if (v64)
    {
      if (!v67)
      {
        (*(void (**)(void *, char *, uint64_t))(v94 + 32))(v97, __dste, v65);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v94 + 56))(v97, 0, 1, v65);
        goto LABEL_52;
      }
      size_t v68 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0) - 8) + 64);
      uint64_t v69 = v97;
    }
    else
    {
      if (!v67)
      {
        (*(void (**)(void *, char *, uint64_t))(v94 + 40))(v97, __dste, v65);
        goto LABEL_52;
      }
      (*(void (**)(void *, uint64_t))(v94 + 8))(v97, v65);
      size_t v68 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0) - 8) + 64);
      uint64_t v69 = v97;
    }
    memcpy(v69, __dste, v68);
LABEL_52:
    *((unsigned char *)v46 + *(int *)(v48 + 32)) = *((unsigned char *)v47 + *(int *)(v48 + 32));
    goto LABEL_53;
  }
  if (v52)
  {
LABEL_41:
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
    memcpy(v46, v47, *(void *)(*(void *)(v59 - 8) + 64));
    goto LABEL_53;
  }
  long long v53 = *((_OWORD *)v47 + 1);
  *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
  *((_OWORD *)v46 + 1) = v53;
  *((_OWORD *)v46 + 2) = *((_OWORD *)v47 + 2);
  uint64_t v54 = *(int *)(v48 + 28);
  __dstd = (char *)v46 + v54;
  size_t v55 = (char *)v47 + v54;
  uint64_t v56 = sub_260B23A10();
  uint64_t v57 = *(void *)(v56 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v55, 1, v56))
  {
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(__dstd, v55, *(void *)(*(void *)(v58 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(__dstd, v55, v56);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(__dstd, 0, 1, v56);
  }
  *((unsigned char *)v46 + *(int *)(v48 + 32)) = *((unsigned char *)v47 + *(int *)(v48 + 32));
  (*(void (**)(void *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
LABEL_53:
  uint64_t v70 = a3[9];
  uint64_t v71 = a1 + v70;
  uint64_t v72 = a2 + v70;
  uint64_t v73 = *(void **)(a1 + v70 + 8);
  if (v73 == (void *)1)
  {
LABEL_56:
    *(_OWORD *)uint64_t v71 = *(_OWORD *)v72;
    goto LABEL_58;
  }
  uint64_t v74 = *(void *)(v72 + 8);
  if (v74 == 1)
  {
    sub_260B1CC2C(v71);
    goto LABEL_56;
  }
  *(unsigned char *)uint64_t v71 = *(unsigned char *)v72;
  *(unsigned char *)(v71 + 1) = *(unsigned char *)(v72 + 1);
  *(unsigned char *)(v71 + 2) = *(unsigned char *)(v72 + 2);
  *(void *)(v71 + 8) = v74;

LABEL_58:
  uint64_t v75 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v75) = *(unsigned char *)(a2 + v75);
  uint64_t v76 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(void *)(a1 + v76) = *(void *)(a2 + v76);
  uint64_t v77 = a3[14];
  uint64_t v78 = *(void **)(a1 + v77);
  *(void *)(a1 + v77) = *(void *)(a2 + v77);

  uint64_t v79 = a3[15];
  uint64_t v80 = (void *)(a1 + v79);
  id v81 = (void *)(a2 + v79);
  uint64_t v82 = sub_260B23B00();
  uint64_t v83 = *(void *)(v82 - 8);
  uint64_t v84 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v83 + 48);
  int v85 = v84(v80, 1, v82);
  int v86 = v84(v81, 1, v82);
  if (!v85)
  {
    if (!v86)
    {
      (*(void (**)(void *, void *, uint64_t))(v83 + 40))(v80, v81, v82);
      goto LABEL_64;
    }
    (*(void (**)(void *, uint64_t))(v83 + 8))(v80, v82);
    goto LABEL_63;
  }
  if (v86)
  {
LABEL_63:
    uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
    memcpy(v80, v81, *(void *)(*(void *)(v87 - 8) + 64));
    goto LABEL_64;
  }
  (*(void (**)(void *, void *, uint64_t))(v83 + 32))(v80, v81, v82);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v83 + 56))(v80, 0, 1, v82);
LABEL_64:
  uint64_t v88 = a3[16];
  int v89 = *(void **)(a1 + v88);
  *(void *)(a1 + v88) = *(void *)(a2 + v88);

  uint64_t v90 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v90) = *(unsigned char *)(a2 + v90);
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260B1DF18);
}

uint64_t sub_260B1DF18(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[7];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_9;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
  int v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[15]];

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for UserNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260B1E0B0);
}

char *sub_260B1E0B0(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)unint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029A0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[7];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4029B0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_7;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A48);
  int v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[15]];

  return (char *)v15(v17, a2, a2, v16);
}

void sub_260B1E234()
{
  sub_260B1E404(319, &qword_26B4029A8, (void (*)(uint64_t))type metadata accessor for UserNotification.LegacyContent);
  if (v0 <= 0x3F)
  {
    sub_260B1E404(319, qword_26B4029B8, (void (*)(uint64_t))type metadata accessor for UserNotification.LocalizedContent);
    if (v1 <= 0x3F)
    {
      sub_260B1E404(319, &qword_26B402A50, MEMORY[0x263F8F3A0]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_260B1E404(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_260B23DC0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for UserNotification.Identifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_260B23A90();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    int v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for UserNotification.Identifier(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_260B23A90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for UserNotification.Identifier(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_260B23A90();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UserNotification.Identifier(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_260B23A90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for UserNotification.Identifier(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_260B23A90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for UserNotification.Identifier(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_260B23A90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.Identifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260B1E8E4);
}

uint64_t sub_260B1E8E4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_260B23A90();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification.Identifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260B1E9A8);
}

uint64_t sub_260B1E9A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_260B23A90();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_260B1EA50()
{
  uint64_t result = sub_260B23A90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void destroy for UserNotification.Behavior(uint64_t a1)
{
}

uint64_t _s25UserNotificationsServices16UserNotificationV8BehaviorVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  int v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for UserNotification.Behavior(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  int v3 = *(void **)(a1 + 8);
  id v4 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v4;
  id v5 = v4;

  return a1;
}

uint64_t assignWithTake for UserNotification.Behavior(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  int v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.Behavior(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UserNotification.Behavior(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.Behavior()
{
  return &type metadata for UserNotification.Behavior;
}

void *initializeBufferWithCopyOfBuffer for UserNotification.LocalizedContent(void *a1, void *a2, uint64_t a3)
{
  int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *int v4 = *a2;
    int v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    uint64_t v9 = *(int *)(a3 + 28);
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v11 = sub_260B23A10();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    *((unsigned char *)v4 + *(int *)(a3 + 32)) = *((unsigned char *)a2 + *(int *)(a3 + 32));
  }
  return v4;
}

uint64_t destroy for UserNotification.LocalizedContent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_260B23A10();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for UserNotification.LocalizedContent(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  uint64_t v8 = *(int *)(a3 + 28);
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v10 = sub_260B23A10();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 32)) = *((unsigned char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithCopy for UserNotification.LocalizedContent(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_260B23A10();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 32)) = *((unsigned char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_OWORD *initializeWithTake for UserNotification.LocalizedContent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_260B23A10();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 32)) = *((unsigned char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for UserNotification.LocalizedContent(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_260B23A10();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 32)) = *((unsigned char *)a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LocalizedContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260B1F590);
}

uint64_t sub_260B1F590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 28);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification.LocalizedContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260B1F664);
}

uint64_t sub_260B1F664(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26B4026D0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_260B1F710()
{
  sub_260B1E404(319, (unint64_t *)&qword_26B402990, MEMORY[0x263F06828]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for UserNotification.IncomingPersistence()
{
  return &type metadata for UserNotification.IncomingPersistence;
}

uint64_t getEnumTagSinglePayload for UserNotification.IncomingPriority(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for UserNotification.IncomingPriority(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B1F944);
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

ValueMetadata *type metadata accessor for UserNotification.IncomingPriority()
{
  return &type metadata for UserNotification.IncomingPriority;
}

ValueMetadata *type metadata accessor for UserNotification.SecureAttachments()
{
  return &type metadata for UserNotification.SecureAttachments;
}

ValueMetadata *type metadata accessor for UserNotification.Origin()
{
  return &type metadata for UserNotification.Origin;
}

uint64_t initializeBufferWithCopyOfBuffer for UserNotification.LegacyContent(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    if (v7)
    {
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = v7;
      uint64_t v8 = a2[3];
      *(void *)(a1 + 16) = a2[2];
      *(void *)(a1 + 24) = v8;
      *(void *)(a1 + 32) = a2[4];
      *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
      *(_WORD *)(a1 + 41) = *(_WORD *)((char *)a2 + 41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v10;
      *(_OWORD *)(a1 + 27) = *(_OWORD *)((char *)a2 + 27);
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_260B23A90();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v17 = a3[6];
    uint64_t v18 = (void *)(a1 + v17);
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_260B23A00();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v23 = a3[8];
    *(unsigned char *)(a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *(unsigned char *)(a1 + v23) = *((unsigned char *)a2 + v23);
  }
  return a1;
}

uint64_t destroy for UserNotification.LegacyContent(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_260B23A90();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_260B23A00();
  uint64_t v11 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v7, 1, v8);
  if (!result)
  {
    long long v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v7, v8);
  }
  return result;
}

uint64_t initializeWithCopy for UserNotification.LegacyContent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    *(_WORD *)(a1 + 41) = *(_WORD *)(a2 + 41);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
  }
  uint64_t v9 = a3[5];
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_260B23A90();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_260B23A00();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v21 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v21) = *(unsigned char *)(a2 + v21);
  return a1;
}

uint64_t assignWithCopy for UserNotification.LegacyContent(uint64_t a1, long long *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8))
  {
    if (v6)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
      *(unsigned char *)(a1 + 41) = *((unsigned char *)a2 + 41);
      *(unsigned char *)(a1 + 42) = *((unsigned char *)a2 + 42);
    }
    else
    {
      sub_260B1CBFC(a1);
      long long v7 = *(long long *)((char *)a2 + 27);
      long long v8 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v8;
      *(_OWORD *)(a1 + 27) = v7;
    }
  }
  else if (v6)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *((void *)a2 + 1);
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(unsigned char *)(a1 + 41) = *((unsigned char *)a2 + 41);
    *(unsigned char *)(a1 + 42) = *((unsigned char *)a2 + 42);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v9 = *a2;
    long long v10 = a2[1];
    *(_OWORD *)(a1 + 27) = *(long long *)((char *)a2 + 27);
    *(_OWORD *)a1 = v9;
    *(_OWORD *)(a1 + 16) = v10;
  }
  uint64_t v11 = a3[5];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_260B23A90();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_13:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_14:
  uint64_t v20 = a3[6];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = sub_260B23A00();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_19;
  }
  if (v27)
  {
LABEL_19:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
LABEL_20:
  *(unsigned char *)(a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  return a1;
}

_OWORD *initializeWithTake for UserNotification.LegacyContent(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  *(_OWORD *)((char *)a1 + 27) = *(_OWORD *)((char *)a2 + 27);
  uint64_t v7 = a3[5];
  long long v8 = (char *)a1 + v7;
  long long v9 = (char *)a2 + v7;
  uint64_t v10 = sub_260B23A90();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_260B23A00();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *((unsigned char *)a1 + v19) = *((unsigned char *)a2 + v19);
  return a1;
}

uint64_t assignWithTake for UserNotification.LegacyContent(uint64_t a1, uint64_t a2, int *a3)
{
  if (*(void *)(a1 + 8))
  {
    uint64_t v6 = *(void *)(a2 + 8);
    if (v6)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v6;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_bridgeObjectRelease();
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v7;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
      *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
      *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
      goto LABEL_6;
    }
    sub_260B1CBFC(a1);
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
LABEL_6:
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_260B23A90();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
LABEL_11:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_12:
  uint64_t v18 = a3[6];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_260B23A00();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v19, v20, v21);
      goto LABEL_18;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_17;
  }
  if (v25)
  {
LABEL_17:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v19, v20, v21);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_18:
  uint64_t v27 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v27) = *(unsigned char *)(a2 + v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LegacyContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_260B20A40);
}

uint64_t sub_260B20A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
      int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification.LegacyContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_260B20B94);
}

uint64_t sub_260B20B94(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5250);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8D5258);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_260B20CC8()
{
  sub_260B1E404(319, &qword_26B402998, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    sub_260B1E404(319, &qword_26B402988, MEMORY[0x263F063B0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for UserNotification.LegacyContent.IdentityImageStyle()
{
  return &type metadata for UserNotification.LegacyContent.IdentityImageStyle;
}

uint64_t destroy for UserNotification.LegacyCategory()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserNotification.LegacyCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_WORD *)(a1 + 41) = *(_WORD *)(a2 + 41);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserNotification.LegacyCategory(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  return a1;
}

__n128 __swift_memcpy43_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for UserNotification.LegacyCategory(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LegacyCategory(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 43)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserNotification.LegacyCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 42) = 0;
    *(_WORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 43) = 1;
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
    *(unsigned char *)(result + 43) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyCategory()
{
  return &type metadata for UserNotification.LegacyCategory;
}

uint64_t destroy for UserNotification.LegacyAction()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserNotification.LegacyAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserNotification.LegacyAction(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for UserNotification.LegacyAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LegacyAction(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserNotification.LegacyAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyAction()
{
  return &type metadata for UserNotification.LegacyAction;
}

unsigned char *storeEnumTagSinglePayload for UserNotification.LegacyAction.Style(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B213C4);
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

ValueMetadata *type metadata accessor for UserNotification.LegacyAction.Style()
{
  return &type metadata for UserNotification.LegacyAction.Style;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyAction.ActionType()
{
  return &type metadata for UserNotification.LegacyAction.ActionType;
}

ValueMetadata *type metadata accessor for NotificationPriorityStatus()
{
  return &type metadata for NotificationPriorityStatus;
}

ValueMetadata *type metadata accessor for NotificationSummaryStatus()
{
  return &type metadata for NotificationSummaryStatus;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyAction.CodingKeys()
{
  return &type metadata for UserNotification.LegacyAction.CodingKeys;
}

uint64_t _s25UserNotificationsServices16UserNotificationV6OriginOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s25UserNotificationsServices16UserNotificationV6OriginOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x260B215A0);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyCategory.CodingKeys()
{
  return &type metadata for UserNotification.LegacyCategory.CodingKeys;
}

uint64_t _s25UserNotificationsServices16UserNotificationV12LegacyActionV10ActionTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s25UserNotificationsServices16UserNotificationV12LegacyActionV10ActionTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B21734);
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

ValueMetadata *type metadata accessor for UserNotification.LegacyContent.CodingKeys()
{
  return &type metadata for UserNotification.LegacyContent.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.SecureAttachments.CodingKeys()
{
  return &type metadata for UserNotification.SecureAttachments.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.LocalizedContent.CodingKeys()
{
  return &type metadata for UserNotification.LocalizedContent.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.Behavior.CodingKeys()
{
  return &type metadata for UserNotification.Behavior.CodingKeys;
}

uint64_t _s25UserNotificationsServices16UserNotificationV19IncomingPersistenceOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s25UserNotificationsServices16UserNotificationV19IncomingPersistenceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B21900);
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

ValueMetadata *type metadata accessor for UserNotification.Identifier.CodingKeys()
{
  return &type metadata for UserNotification.Identifier.CodingKeys;
}

unsigned char *_s25UserNotificationsServices16UserNotificationV16LocalizedContentV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x260B21A04);
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

ValueMetadata *type metadata accessor for UserNotification.CodingError()
{
  return &type metadata for UserNotification.CodingError;
}

uint64_t getEnumTagSinglePayload for UserNotification.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UserNotification.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 12;
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
        JUMPOUT(0x260B21B98);
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
          *__n128 result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.CodingKeys()
{
  return &type metadata for UserNotification.CodingKeys;
}

unint64_t sub_260B21BD4()
{
  unint64_t result = qword_26A8D5398;
  if (!qword_26A8D5398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5398);
  }
  return result;
}

unint64_t sub_260B21C2C()
{
  unint64_t result = qword_26A8D53A0;
  if (!qword_26A8D53A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53A0);
  }
  return result;
}

unint64_t sub_260B21C84()
{
  unint64_t result = qword_26A8D53A8;
  if (!qword_26A8D53A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53A8);
  }
  return result;
}

unint64_t sub_260B21CDC()
{
  unint64_t result = qword_26A8D53B0;
  if (!qword_26A8D53B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53B0);
  }
  return result;
}

unint64_t sub_260B21D34()
{
  unint64_t result = qword_26A8D53B8;
  if (!qword_26A8D53B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53B8);
  }
  return result;
}

unint64_t sub_260B21D8C()
{
  unint64_t result = qword_26A8D53C0;
  if (!qword_26A8D53C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53C0);
  }
  return result;
}

unint64_t sub_260B21DE4()
{
  unint64_t result = qword_26A8D53C8;
  if (!qword_26A8D53C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53C8);
  }
  return result;
}

unint64_t sub_260B21E3C()
{
  unint64_t result = qword_26A8D53D0;
  if (!qword_26A8D53D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53D0);
  }
  return result;
}

unint64_t sub_260B21E94()
{
  unint64_t result = qword_26A8D53D8;
  if (!qword_26A8D53D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53D8);
  }
  return result;
}

unint64_t sub_260B21EEC()
{
  unint64_t result = qword_26A8D53E0;
  if (!qword_26A8D53E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53E0);
  }
  return result;
}

unint64_t sub_260B21F44()
{
  unint64_t result = qword_26A8D53E8;
  if (!qword_26A8D53E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53E8);
  }
  return result;
}

unint64_t sub_260B21F9C()
{
  unint64_t result = qword_26A8D53F0;
  if (!qword_26A8D53F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53F0);
  }
  return result;
}

unint64_t sub_260B21FF4()
{
  unint64_t result = qword_26A8D53F8;
  if (!qword_26A8D53F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D53F8);
  }
  return result;
}

unint64_t sub_260B2204C()
{
  unint64_t result = qword_26A8D5400;
  if (!qword_26A8D5400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5400);
  }
  return result;
}

unint64_t sub_260B220A4()
{
  unint64_t result = qword_26A8D5408;
  if (!qword_26A8D5408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5408);
  }
  return result;
}

unint64_t sub_260B220FC()
{
  unint64_t result = qword_26A8D5410;
  if (!qword_26A8D5410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5410);
  }
  return result;
}

unint64_t sub_260B22154()
{
  unint64_t result = qword_26A8D5418;
  if (!qword_26A8D5418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5418);
  }
  return result;
}

unint64_t sub_260B221AC()
{
  unint64_t result = qword_26A8D5420;
  if (!qword_26A8D5420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5420);
  }
  return result;
}

unint64_t sub_260B22204()
{
  unint64_t result = qword_26A8D5428;
  if (!qword_26A8D5428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5428);
  }
  return result;
}

unint64_t sub_260B2225C()
{
  unint64_t result = qword_26A8D5430;
  if (!qword_26A8D5430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5430);
  }
  return result;
}

unint64_t sub_260B222B4()
{
  unint64_t result = qword_26A8D5438;
  if (!qword_26A8D5438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5438);
  }
  return result;
}

unint64_t sub_260B2230C()
{
  unint64_t result = qword_26A8D5440;
  if (!qword_26A8D5440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5440);
  }
  return result;
}

unint64_t sub_260B22364()
{
  unint64_t result = qword_26A8D5448;
  if (!qword_26A8D5448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5448);
  }
  return result;
}

unint64_t sub_260B223BC()
{
  unint64_t result = qword_26A8D5450;
  if (!qword_26A8D5450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5450);
  }
  return result;
}

uint64_t sub_260B22410()
{
  unint64_t v0 = sub_260B23E40();
  swift_bridgeObjectRelease();
  if (v0 >= 0xD) {
    return 13;
  }
  else {
    return v0;
  }
}

uint64_t sub_260B2245C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B402A40);
  MEMORY[0x270FA5388](v0 - 8);
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_260B23AF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_260B23AC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v12 = (void *)sub_260B23BA0();
  objc_msgSend(v11, sel_setDateFormat_, v12);

  sub_260B23AA0();
  uint64_t v13 = (void *)sub_260B23AB0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  objc_msgSend(v11, sel_setLocale_, v13);

  sub_260B23AD0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    uint64_t v15 = (void *)sub_260B23AE0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    objc_msgSend(v11, sel_setTimeZone_, v15);

    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_260B2271C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x8000000260B28550 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000260B282A0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_260B23F50();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_260B2285C()
{
  unint64_t v0 = sub_260B23E40();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_260B228A4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x79726F6765746163 && a2 == 0xE800000000000000;
  if (v2 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746144746E657665 && a2 == 0xE900000000000065 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7961446C6C417369 && a2 == 0xED0000746E657645 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000260B28570)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_260B23F50();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_260B22AF0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736E6F69746361 && a2 == 0xE700000000000000 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000260B28590 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000260B285B0 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x657263536B636F6CLL && a2 == 0xEE00796C6E4F6E65 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000260B285D0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_260B23F50();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_260B22D8C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79546E6F69746361 && a2 == 0xEA00000000006570 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x63616C5074786574 && a2 == 0xEF7265646C6F6865 || (sub_260B23F50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000260B285F0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_260B23F50();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

unint64_t sub_260B23034()
{
  unint64_t result = qword_26A8D5458;
  if (!qword_26A8D5458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5458);
  }
  return result;
}

unint64_t sub_260B23088()
{
  unint64_t result = qword_26A8D5460;
  if (!qword_26A8D5460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5460);
  }
  return result;
}

unint64_t sub_260B230DC()
{
  unint64_t result = qword_26A8D5468;
  if (!qword_26A8D5468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5468);
  }
  return result;
}

unint64_t sub_260B23130()
{
  unint64_t result = qword_26A8D5470;
  if (!qword_26A8D5470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5470);
  }
  return result;
}

unint64_t sub_260B23184()
{
  unint64_t result = qword_26A8D5478;
  if (!qword_26A8D5478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5478);
  }
  return result;
}

unint64_t sub_260B231D8()
{
  unint64_t result = qword_26A8D5480;
  if (!qword_26A8D5480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5480);
  }
  return result;
}

unint64_t sub_260B2322C()
{
  unint64_t result = qword_26A8D5488;
  if (!qword_26A8D5488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5488);
  }
  return result;
}

unint64_t sub_260B23280()
{
  unint64_t result = qword_26A8D5490;
  if (!qword_26A8D5490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8D5490);
  }
  return result;
}

uint64_t sub_260B232D4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260B2330C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_260B2331C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_260B23358(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t UNSNotificationList.list.getter@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

uint64_t UNSNotificationList.list.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  return result;
}

uint64_t (*UNSNotificationList.list.modify())()
{
  return nullsub_1;
}

void *UNSNotificationList.init(list:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t UNSNotificationList.debugDescription.getter()
{
  return 0xD000000000000015;
}

unint64_t sub_260B23480()
{
  return 0xD000000000000015;
}

ValueMetadata *type metadata accessor for UNSNotificationList()
{
  return &type metadata for UNSNotificationList;
}

uint64_t sub_260B239D0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_260B239E0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_260B239F0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_260B23A00()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_260B23A10()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_260B23A20()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_260B23A30()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_260B23A40()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_260B23A50()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_260B23A60()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_260B23A70()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_260B23A80()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_260B23A90()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_260B23AA0()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_260B23AB0()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_260B23AC0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_260B23AD0()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_260B23AE0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_260B23AF0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_260B23B00()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_260B23B10()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_260B23B20()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_260B23B30()
{
  return MEMORY[0x270EEB078]();
}

uint64_t sub_260B23B40()
{
  return MEMORY[0x270EEB088]();
}

uint64_t sub_260B23B50()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_260B23B60()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_260B23B70()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_260B23B80()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_260B23B90()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_260B23BA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_260B23BB0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_260B23BC0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_260B23BD0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_260B23BE0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_260B23BF0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_260B23C00()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_260B23C10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_260B23C20()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_260B23C30()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_260B23C40()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_260B23C50()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_260B23C60()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_260B23C70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_260B23C80()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_260B23C90()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_260B23CA0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_260B23CB0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_260B23CC0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_260B23CD0()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_260B23CE0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_260B23D20()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_260B23D30()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_260B23D40()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_260B23D50()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_260B23D60()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_260B23D70()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_260B23D80()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_260B23D90()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_260B23DA0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_260B23DB0()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_260B23DC0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_260B23DD0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_260B23DE0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_260B23DF0()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_260B23E10()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_260B23E20()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_260B23E30()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_260B23E40()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_260B23E50()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_260B23E60()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_260B23E70()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_260B23E80()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_260B23E90()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_260B23EA0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_260B23EB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_260B23EC0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_260B23ED0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_260B23EE0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_260B23EF0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_260B23F00()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_260B23F10()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_260B23F20()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_260B23F30()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_260B23F40()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_260B23F50()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_260B23F70()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_260B23F80()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_260B23F90()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_260B23FA0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_260B23FB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_260B23FC0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_260B23FD0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_260B23FE0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_260B23FF0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_260B24000()
{
  return MEMORY[0x270F9FD98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}