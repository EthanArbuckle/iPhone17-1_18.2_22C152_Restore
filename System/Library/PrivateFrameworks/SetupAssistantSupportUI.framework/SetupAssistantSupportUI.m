void *sub_25C22CCA0()
{
  return &unk_270990238;
}

unint64_t sub_25C22CCAC(char a1)
{
  unint64_t result = 1869373768;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x756F72676B636142;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x73756F6E696D754CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C22CD54(unsigned __int8 *a1, char *a2)
{
  return sub_25C22CD60(*a1, *a2);
}

uint64_t sub_25C22CD60(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1869373768;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1869373768;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x756F72676B636142;
      unint64_t v3 = 0xEF7478655420646ELL;
      break;
    case 2:
      unint64_t v3 = 0x800000025C23B660;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v5 = 0x73756F6E696D754CLL;
      unint64_t v3 = 0xED00007478655420;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEF7478655420646ELL;
      if (v5 == 0x756F72676B636142) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0x800000025C23B660;
      unint64_t v2 = 0xD000000000000010;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xED00007478655420;
      if (v5 == 0x73756F6E696D754CLL) {
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
        char v7 = sub_25C23A668();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25C22CF18()
{
  return sub_25C22CF20();
}

uint64_t sub_25C22CF20()
{
  return sub_25C23A698();
}

uint64_t sub_25C22D010()
{
  sub_25C23A598();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C22D0E8()
{
  return sub_25C22D0F0();
}

uint64_t sub_25C22D0F0()
{
  return sub_25C23A698();
}

uint64_t sub_25C22D1DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C230D1C();
  *a1 = result;
  return result;
}

void sub_25C22D20C(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1869373768;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEF7478655420646ELL;
      uint64_t v3 = 0x756F72676B636142;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0xD000000000000010;
      *(void *)(a1 + 8) = 0x800000025C23B660;
      break;
    case 3:
      strcpy((char *)a1, "Luminous Text");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

void sub_25C22D2BC(void *a1@<X8>)
{
  *a1 = &unk_270990260;
}

void *sub_25C22D2CC()
{
  return &unk_25C23AD70;
}

double sub_25C22D2D8()
{
  return -0.5;
}

void *sub_25C22D2E0()
{
  return &unk_25C23AD78;
}

double sub_25C22D2EC()
{
  return 3.9;
}

void *sub_25C22D2FC()
{
  return &unk_25C23AD80;
}

double sub_25C22D308()
{
  return 0.48;
}

void sub_25C22D314()
{
  qword_26A598B60 = 0;
}

uint64_t *sub_25C22D320()
{
  if (qword_26A598380 != -1) {
    swift_once();
  }
  return &qword_26A598B60;
}

double sub_25C22D36C()
{
  return sub_25C22E6B8(&qword_26A598380, (uint64_t)&qword_26A598B60);
}

void sub_25C22D390()
{
  qword_26A598B68 = 0x4034000000000000;
}

uint64_t *sub_25C22D3A0()
{
  if (qword_26A598388 != -1) {
    swift_once();
  }
  return &qword_26A598B68;
}

double sub_25C22D3EC()
{
  return sub_25C22E6B8(&qword_26A598388, (uint64_t)&qword_26A598B68);
}

void sub_25C22D410()
{
  qword_26A598B70 = 0x4043800000000000;
}

uint64_t *sub_25C22D424()
{
  if (qword_26A598390 != -1) {
    swift_once();
  }
  return &qword_26A598B70;
}

double sub_25C22D470()
{
  return sub_25C22E6B8(&qword_26A598390, (uint64_t)&qword_26A598B70);
}

void *sub_25C22D494()
{
  return &unk_25C23AD88;
}

double sub_25C22D4A0()
{
  return 1.1;
}

void *sub_25C22D4AC()
{
  return &unk_25C23AD90;
}

double sub_25C22D4B8()
{
  return 2.0;
}

void *sub_25C22D4C0()
{
  return &unk_25C23AD98;
}

double sub_25C22D4CC()
{
  return 0.2;
}

void sub_25C22D4D8()
{
  qword_26A598B78 = 0x4040000000000000;
}

uint64_t *sub_25C22D4E8()
{
  if (qword_26A598398 != -1) {
    swift_once();
  }
  return &qword_26A598B78;
}

double sub_25C22D534()
{
  return sub_25C22E6B8(&qword_26A598398, (uint64_t)&qword_26A598B78);
}

void sub_25C22D558()
{
  qword_26A598B80 = 0x4059000000000000;
}

uint64_t *sub_25C22D568()
{
  if (qword_26A5983A0 != -1) {
    swift_once();
  }
  return &qword_26A598B80;
}

double sub_25C22D5B4()
{
  return sub_25C22E6B8(qword_26A5983A0, (uint64_t)&qword_26A598B80);
}

void *sub_25C22D5D8()
{
  return &unk_25C23ADA0;
}

double sub_25C22D5E4()
{
  return 0.04;
}

void *sub_25C22D5F0()
{
  return &unk_25C23ADA8;
}

double sub_25C22D5FC()
{
  return 0.1;
}

void *sub_25C22D608()
{
  return &unk_25C23ADB0;
}

double sub_25C22D614()
{
  return 0.15;
}

void *sub_25C22D624()
{
  return &unk_25C23ADB8;
}

double sub_25C22D630()
{
  return 1.4;
}

double sub_25C22D640()
{
  return 50.0;
}

double sub_25C22D64C()
{
  return 0.6;
}

uint64_t sub_25C22D65C()
{
  return sub_25C239FB8();
}

double sub_25C22D68C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25C239FF8();
  swift_release();
  swift_release();
  return v1;
}

void sub_25C22D700(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(void **)a1 + 232))();
}

uint64_t sub_25C22D74C(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(void **)a2 + 240))(*a1);
}

uint64_t sub_25C22D794()
{
  return sub_25C23A008();
}

void (*sub_25C22D80C(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25C239FE8();
  return sub_25C22D898;
}

void sub_25C22D898(void *a1)
{
  double v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_25C22D900()
{
  return swift_endAccess();
}

uint64_t sub_25C22D964(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980C8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980C0);
  sub_25C239FD8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_25C22DA90(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980C8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  char v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980C0);
  sub_25C239FC8();
  swift_endAccess();
  return sub_25C22DBA0;
}

void sub_25C22DBA0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  char v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_25C239FD8();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_25C239FD8();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

id sub_25C22DD10()
{
  uint64_t v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager);
  }
  else
  {
    uint64_t v4 = v0;
    type metadata accessor for DisplayLinkManager();
    uint64_t v5 = swift_allocObject();
    swift_weakInit();
    id v6 = sub_25C239AB0((uint64_t)sub_25C231658, v5);
    char v7 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

uint64_t sub_25C22DDBC()
{
  return 0;
}

uint64_t sub_25C22DDC4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_text);
  swift_bridgeObjectRetain();
  return v1;
}

double sub_25C22DE00()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22DE48(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextIntensity);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22DE9C())()
{
  return j_j__swift_endAccess;
}

double sub_25C22DEF8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22DF40(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextRadius);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22DF94())()
{
  return j_j__swift_endAccess;
}

double sub_25C22DFF0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousOffset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E038(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousOffset);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E08C())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E0E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousForwardFade;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E130(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousForwardFade);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E184())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E1E0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E228(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousSize);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E27C())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E2D8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineAffectedRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E320(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineAffectedRadius);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E374())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E3D0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E418(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineIntensity);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E46C())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E4C8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloGlowIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E510(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloGlowIntensity);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E564())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E5C0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloBlur;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E608(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloBlur);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E65C())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E6B8(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

double sub_25C22E6F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloPadding;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E73C(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloPadding);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E790())()
{
  return j_j__swift_endAccess;
}

double sub_25C22E7EC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloOffset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_25C22E834(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloOffset);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_25C22E888())()
{
  return j__swift_endAccess;
}

uint64_t sub_25C22E8E8()
{
  return sub_25C230DAC((uint64_t)&unk_270990288);
}

uint64_t sub_25C22E8F4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C22E940(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_visibleLayers);
  swift_beginAccess();
  *id v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25C22E994())()
{
  return j_j__swift_endAccess;
}

BOOL sub_25C22E9F0()
{
  type metadata accessor for ColorProducer();
  double v1 = (*(double (**)(void))(*(void *)v0 + 232))();
  return sub_25C2327DC(v1) >= 1.0;
}

uint64_t sub_25C22EA50()
{
  return 0;
}

uint64_t sub_25C22EA58()
{
  uint64_t v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for ColorProducer();
    uint64_t v2 = sub_25C232138();
    *(void *)(v3 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_25C22EAD4(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25C22EAEC(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = sub_25C22EA58();
  return sub_25C22EB34;
}

uint64_t sub_25C22EB34(void *a1)
{
  *(void *)(a1[1]
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries) = *a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C22EB4C()
{
  return swift_retain();
}

uint64_t sub_25C22EB5C(double a1)
{
  double v2 = a1 * 1.4 * 1.2;
  uint64_t v3 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v1 + 248))(v9);
  *uint64_t v4 = v2 + *v4;
  v3(v9, 0);
  type metadata accessor for ColorProducer();
  double v5 = (*(double (**)(void))(*(void *)v1 + 232))();
  if (sub_25C2327DC(v5) >= 0.7
    && (*(unsigned char *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_didNotify) & 1) == 0)
  {
    char v7 = *(uint64_t (**)(void))(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler);
    if (v7) {
      uint64_t v6 = v7();
    }
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 592))(v6);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 696))();
  }
  return result;
}

uint64_t sub_25C22ECE4()
{
  uint64_t v1 = v0;
  (*(void (**)(void))(*(void *)v0 + 672))();
  double v2 = sub_25C22DD10();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x98))();

  uint64_t v3 = *(uint64_t (**)(__n128))(*(void *)v1 + 240);
  v4.n128_u64[0] = -0.5;

  return v3(v4);
}

void sub_25C22EDA4()
{
  uint64_t v43 = sub_25C23A4F8();
  uint64_t v1 = *(void *)(v43 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v42 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_25C23A518();
  uint64_t v3 = *(void *)(v41 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v40 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_25C23A538();
  uint64_t v5 = *(void *)(v39 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v38 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v37 = (char *)&v29 - v9;
  if (((*(uint64_t (**)(uint64_t))(*(void *)v0 + 680))(v8) & 1) == 0) {
    return;
  }
  if ((*(uint64_t (**)(void))(*(void *)v0 + 688))()) {
    return;
  }
  id v10 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v10, sel_brightness);
  double v12 = v11;

  if (v12 <= 0.7) {
    return;
  }
  double v13 = (v12 + -0.7) * 100.0;
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v13 >= 9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v14 = (uint64_t)v13;
  uint64_t v15 = swift_allocObject();
  uint64_t v35 = v14;
  uint64_t v36 = v15;
  *(double *)(v15 + 16) = v12;
  if (v14 < 1)
  {
LABEL_18:
    __break(1u);
    return;
  }
  unint64_t v16 = sub_25C230E30();
  uint64_t v33 = v5 + 8;
  unint64_t v34 = v16;
  v32 = v47;
  v31 = (void (**)(char *, uint64_t))(v1 + 8);
  v30 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v17 = 1;
  v18 = v37;
  v19 = (void (**)(char *, uint64_t))(v5 + 8);
  v20 = v40;
  uint64_t v21 = v43;
  while (1)
  {
    uint64_t v44 = sub_25C23A5E8();
    v22 = v38;
    sub_25C23A528();
    MEMORY[0x261181800](v22, (double)v17 * 0.01);
    v45 = *v19;
    v23 = v22;
    uint64_t v24 = v39;
    v45(v23, v39);
    v47[2] = sub_25C230E70;
    v47[3] = v36;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    v47[0] = sub_25C22F330;
    v47[1] = &block_descriptor;
    v25 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_25C23A508();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_25C2310D4(&qword_26A5980D8, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980E0);
    sub_25C231038(&qword_26A5980E8, &qword_26A5980E0);
    v26 = v42;
    sub_25C23A5F8();
    v27 = (void *)v44;
    MEMORY[0x261181890](v18, v20, v26, v25);
    _Block_release(v25);

    (*v31)(v26, v21);
    (*v30)(v20, v41);
    v45(v18, v24);
    if (v35 == v17) {
      break;
    }
    if (__OFADD__(v17++, 1))
    {
      __break(1u);
      break;
    }
  }
  swift_release();
}

uint64_t sub_25C22F330(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

BOOL sub_25C22F374()
{
  id v0 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v0, sel_potentialEDRHeadroom);
  double v2 = v1;

  return v2 > 2.0;
}

BOOL sub_25C22F3DC()
{
  id v0 = objc_msgSend(self, sel_currentTraitCollection);
  id v1 = objc_msgSend(v0, sel_userInterfaceStyle);

  return v1 == (id)2;
}

void sub_25C22F438()
{
  id v0 = sub_25C22DD10();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t sub_25C22F4B0()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_didNotify) = 0;
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t sub_25C22F4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  sub_25C22F558(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_25C22F558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980C0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  v25[1] = 0xBFE0000000000000;
  sub_25C239FB8();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v15, v14, v11);
  *(void *)(v5
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager) = 0;
  *(void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextIntensity) = 0x400F333333333333;
  *(void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextRadius) = 0x3FDEB851EB851EB8;
  uint64_t v16 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousOffset;
  if (qword_26A598380 != -1) {
    swift_once();
  }
  *(void *)(v5 + v16) = qword_26A598B60;
  uint64_t v17 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousForwardFade;
  if (qword_26A598388 != -1) {
    swift_once();
  }
  *(void *)(v5 + v17) = qword_26A598B68;
  uint64_t v18 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousSize;
  if (qword_26A598390 != -1) {
    swift_once();
  }
  *(void *)(v5 + v18) = qword_26A598B70;
  *(void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineAffectedRadius) = 0x3FF199999999999ALL;
  *(void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineIntensity) = 0x4000000000000000;
  *(void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloGlowIntensity) = 0x3FC999999999999ALL;
  uint64_t v19 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloBlur;
  if (qword_26A598398 != -1) {
    swift_once();
  }
  *(void *)(v5 + v19) = qword_26A598B78;
  uint64_t v20 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloPadding;
  if (qword_26A5983A0[0] != -1) {
    swift_once();
  }
  *(void *)(v5 + v20) = qword_26A598B80;
  *(void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloOffset) = 0x3FA47AE147AE147BLL;
  uint64_t v21 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_visibleLayers;
  *(void *)(v5 + v21) = sub_25C230DAC((uint64_t)&unk_2709902B0);
  *(unsigned char *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_didNotify) = 0;
  *(void *)(v5
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries) = 0;
  v22 = (void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_text);
  void *v22 = a1;
  v22[1] = a2;
  *(void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_finalColor) = a3;
  v23 = (void *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler);
  void *v23 = a4;
  v23[1] = a5;
  return v5;
}

uint64_t sub_25C22F8BC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager));
  swift_bridgeObjectRelease();
  sub_25C230F94(*(void *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_25C22F98C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5980C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager));
  swift_bridgeObjectRelease();
  sub_25C230F94(*(void *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C22FA98()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t sub_25C22FABC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t sub_25C22FAE8()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t sub_25C22FB14()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t sub_25C22FB40()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t sub_25C22FB6C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t sub_25C22FB98()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t sub_25C22FBC4()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t sub_25C22FBF0()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t sub_25C22FC1C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t sub_25C22FC48()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t sub_25C22FC74()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t sub_25C22FCA0()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

uint64_t sub_25C22FCCC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t sub_25C22FCF8()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t sub_25C22FD24()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

uint64_t sub_25C22FD50()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 704))();
}

uint64_t sub_25C22FD7C()
{
  return (*(uint64_t (**)(void))(v0 + 712))();
}

uint64_t sub_25C22FD90@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WelcomeToDeviceViewModel();
  uint64_t result = sub_25C239FA8();
  *a1 = result;
  return result;
}

uint64_t sub_25C22FDD0(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_25C23A688();
  swift_bridgeObjectRetain();
  sub_25C23A598();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_25C23A698();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    char v15 = a2;
    sub_25C2304C0(a2, v7, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v18;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_21;
  }
  uint64_t v8 = ~v6;
  while (2)
  {
    unint64_t v9 = 0xE400000000000000;
    unint64_t v10 = 1869373768;
    switch(*(unsigned char *)(*(void *)(v4 + 48) + v7))
    {
      case 1:
        unint64_t v10 = 0x756F72676B636142;
        unint64_t v9 = 0xEF7478655420646ELL;
        break;
      case 2:
        unint64_t v9 = 0x800000025C23B660;
        unint64_t v10 = 0xD000000000000010;
        break;
      case 3:
        unint64_t v10 = 0x73756F6E696D754CLL;
        unint64_t v9 = 0xED00007478655420;
        break;
      default:
        break;
    }
    unint64_t v11 = 0xE400000000000000;
    unint64_t v12 = 1869373768;
    switch((char)a2)
    {
      case 1:
        unint64_t v11 = 0xEF7478655420646ELL;
        if (v10 == 0x756F72676B636142) {
          goto LABEL_14;
        }
        goto LABEL_15;
      case 2:
        unint64_t v11 = 0x800000025C23B660;
        unint64_t v12 = 0xD000000000000010;
        goto LABEL_11;
      case 3:
        unint64_t v11 = 0xED00007478655420;
        if (v10 == 0x73756F6E696D754CLL) {
          goto LABEL_14;
        }
        goto LABEL_15;
      default:
LABEL_11:
        if (v10 != v12) {
          goto LABEL_15;
        }
LABEL_14:
        if (v9 == v11)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_20;
        }
LABEL_15:
        char v13 = sub_25C23A668();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0)
        {
          unint64_t v7 = (v7 + 1) & v8;
          if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
            goto LABEL_17;
          }
          continue;
        }
        swift_bridgeObjectRelease();
LABEL_20:
        uint64_t result = 0;
        char v15 = *(unsigned char *)(*(void *)(*v2 + 48) + v7);
LABEL_21:
        *a1 = v15;
        return result;
    }
  }
}

uint64_t sub_25C230154()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598120);
  uint64_t v3 = sub_25C23A618();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = (void *)(v2 + 56);
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_38;
    }
    if (v15 >= v9) {
      break;
    }
    unint64_t v16 = v6[v15];
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v9) {
        break;
      }
      unint64_t v16 = v6[v11];
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v9) {
          break;
        }
        unint64_t v16 = v6[v11];
        if (!v16)
        {
          int64_t v17 = v15 + 3;
          if (v17 >= v9) {
            break;
          }
          unint64_t v16 = v6[v17];
          if (!v16)
          {
            while (1)
            {
              int64_t v11 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_39;
              }
              if (v11 >= v9) {
                goto LABEL_33;
              }
              unint64_t v16 = v6[v11];
              ++v17;
              if (v16) {
                goto LABEL_23;
              }
            }
          }
          int64_t v11 = v17;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
    sub_25C23A688();
    sub_25C23A598();
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_25C23A698();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v20) >> 6;
    do
    {
      if (++v22 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x25C2304B0);
      }
      BOOL v25 = v22 == v24;
      if (v22 == v24) {
        unint64_t v22 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v10 + 8 * v22);
    }
    while (v26 == -1);
    unint64_t v12 = __clz(__rbit64(~v26)) + (v22 << 6);
LABEL_7:
    *(void *)(v10 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  swift_release();
  uint64_t v1 = v0;
  uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
  if (v27 > 63) {
    bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v6 = -1 << v27;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25C2304C0(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  char v20 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_25C230154();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_25C230850();
        goto LABEL_25;
      }
      sub_25C2309E4();
    }
    uint64_t v8 = *v3;
    sub_25C23A688();
    sub_25C23A598();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25C23A698();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      while (2)
      {
        unint64_t v11 = 0xE400000000000000;
        unint64_t v12 = 1869373768;
        switch(*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          case 1:
            unint64_t v12 = 0x756F72676B636142;
            unint64_t v11 = 0xEF7478655420646ELL;
            break;
          case 2:
            unint64_t v11 = 0x800000025C23B660;
            unint64_t v12 = 0xD000000000000010;
            break;
          case 3:
            unint64_t v12 = 0x73756F6E696D754CLL;
            unint64_t v11 = 0xED00007478655420;
            break;
          default:
            break;
        }
        unint64_t v13 = 0xE400000000000000;
        unint64_t v14 = 1869373768;
        switch(v5)
        {
          case 1:
            unint64_t v13 = 0xEF7478655420646ELL;
            if (v12 != 0x756F72676B636142) {
              goto LABEL_20;
            }
            goto LABEL_19;
          case 2:
            unint64_t v13 = 0x800000025C23B660;
            unint64_t v14 = 0xD000000000000010;
            goto LABEL_18;
          case 3:
            unint64_t v13 = 0xED00007478655420;
            if (v12 != 0x73756F6E696D754CLL) {
              goto LABEL_20;
            }
            goto LABEL_19;
          default:
LABEL_18:
            if (v12 != v14) {
              goto LABEL_20;
            }
LABEL_19:
            if (v11 == v13) {
              goto LABEL_28;
            }
LABEL_20:
            char v15 = sub_25C23A668();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v15) {
              goto LABEL_29;
            }
            a2 = (a2 + 1) & v10;
            if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
LABEL_25:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v16 + 48) + a2) = v20;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18)
  {
    __break(1u);
LABEL_28:
    swift_bridgeObjectRelease_n();
LABEL_29:
    sub_25C23A678();
    __break(1u);
    JUMPOUT(0x25C230820);
  }
  *(void *)(v16 + 16) = v19;
  return result;
}

void *sub_25C230850()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598120);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C23A608();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25C2309E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598120);
  uint64_t v3 = sub_25C23A618();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_35;
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      break;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v9) {
        break;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v9) {
          break;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v11);
        if (!v16)
        {
          int64_t v17 = v15 + 3;
          if (v17 >= v9) {
            break;
          }
          unint64_t v16 = *(void *)(v6 + 8 * v17);
          if (!v16)
          {
            while (1)
            {
              int64_t v11 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_37;
              }
              if (v11 >= v9) {
                goto LABEL_33;
              }
              unint64_t v16 = *(void *)(v6 + 8 * v11);
              ++v17;
              if (v16) {
                goto LABEL_23;
              }
            }
          }
          int64_t v11 = v17;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
    sub_25C23A688();
    sub_25C23A598();
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_25C23A698();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v20) >> 6;
    do
    {
      if (++v22 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        JUMPOUT(0x25C230D0CLL);
      }
      BOOL v25 = v22 == v24;
      if (v22 == v24) {
        unint64_t v22 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v10 + 8 * v22);
    }
    while (v26 == -1);
    unint64_t v12 = __clz(__rbit64(~v26)) + (v22 << 6);
LABEL_7:
    *(void *)(v10 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  uint64_t result = swift_release_n();
  uint64_t v1 = v0;
LABEL_35:
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25C230D1C()
{
  unint64_t v0 = sub_25C23A658();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
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

uint64_t sub_25C230DAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25C2316E8();
  uint64_t result = sub_25C23A5B8();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_25C22FDD0(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_25C230E20()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_25C230E30()
{
  unint64_t result = qword_26A5980D0;
  if (!qword_26A5980D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5980D0);
  }
  return result;
}

void sub_25C230E70()
{
  swift_beginAccess();
  double v1 = *(double *)(v0 + 16) + -0.01;
  swift_beginAccess();
  *(double *)(v0 + 16) = v1;
  id v2 = objc_msgSend(self, sel_mainScreen);
  swift_beginAccess();
  objc_msgSend(v2, sel_setBrightness_, *(double *)(v0 + 16));
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

uint64_t sub_25C230F94(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_25C230FA8()
{
  unint64_t result = qword_26A5980F0;
  if (!qword_26A5980F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5980F0);
  }
  return result;
}

uint64_t sub_25C230FFC()
{
  return sub_25C231038(&qword_26A5980F8, &qword_26A598100);
}

uint64_t sub_25C231038(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C23107C(uint64_t a1)
{
  uint64_t result = sub_25C2310D4((unint64_t *)&qword_26A598108, (void (*)(uint64_t))type metadata accessor for WelcomeToDeviceViewModel);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25C2310D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for WelcomeToDeviceViewModel()
{
  uint64_t result = qword_26A5986E0;
  if (!qword_26A5986E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C231168()
{
  return MEMORY[0x263EFDDD8];
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VisibleLayer(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for VisibleLayer(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C2312E0);
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

uint64_t sub_25C231308(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C231314(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VisibleLayer()
{
  return &type metadata for VisibleLayer;
}

ValueMetadata *type metadata accessor for AnimationDefaults()
{
  return &type metadata for AnimationDefaults;
}

uint64_t sub_25C23133C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25C231350(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25C231364(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25C231378(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25C23138C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_25C2313A0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_25C2313B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_25C2313C8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_25C2313DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_25C2313F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t sub_25C231404(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t sub_25C231418(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t sub_25C23142C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t sub_25C231440(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t sub_25C231454(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t sub_25C231468(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t sub_25C23147C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t sub_25C231490(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t sub_25C2314A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t sub_25C2314B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 168))();
}

uint64_t sub_25C2314CC()
{
  return type metadata accessor for WelcomeToDeviceViewModel();
}

void sub_25C2314D4()
{
  sub_25C2315C8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25C2315C8()
{
  if (!qword_26A598110)
  {
    unint64_t v0 = sub_25C23A018();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A598110);
    }
  }
}

uint64_t sub_25C231620()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C231658(double a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(uint64_t, double))(*(void *)result + 656))(result, a1);
    return swift_release();
  }
  return result;
}

unint64_t sub_25C2316E8()
{
  unint64_t result = qword_26A598118;
  if (!qword_26A598118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598118);
  }
  return result;
}

void sub_25C23173C()
{
}

void sub_25C231754(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  *a1 = sub_25C23176C;
  a1[1] = 0;
}

uint64_t sub_25C23176C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25C23A218();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25C23A348();
  sub_25C23A228();
  sub_25C23A068();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  a1[2] = v10;
  a1[3] = v12;
  a1[4] = v14;
  return result;
}

uint64_t sub_25C23188C()
{
  return sub_25C23A318();
}

double sub_25C2318A8()
{
  double result = 0.0;
  xmmword_26A598C00 = 0u;
  *(_OWORD *)&qword_26A598C10 = 0u;
  return result;
}

long long *sub_25C2318BC()
{
  if (qword_26A5986F0 != -1) {
    swift_once();
  }
  return &xmmword_26A598C00;
}

double sub_25C231908()
{
  if (qword_26A5986F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return *(double *)&xmmword_26A598C00;
}

uint64_t sub_25C231980(double a1, double a2, double a3, double a4)
{
  if (qword_26A5986F0 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  *(double *)&xmmword_26A598C00 = a1;
  *((double *)&xmmword_26A598C00 + 1) = a2;
  qword_26A598C10 = *(void *)&a3;
  unk_26A598C18 = *(void *)&a4;
  return result;
}

uint64_t (*sub_25C231A18())()
{
  if (qword_26A5986F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_25C231AA0(uint64_t a1, double (*a2)(void))
{
  *(double *)a1 = a2();
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
}

uint64_t sub_25C231AD4()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_25C231AF0@<D0>(_OWORD *a1@<X8>)
{
  if (qword_26A5986F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  double result = *(double *)&xmmword_26A598C00;
  long long v3 = *(_OWORD *)&qword_26A598C10;
  *a1 = xmmword_26A598C00;
  a1[1] = v3;
  return result;
}

double sub_25C231B6C(_OWORD *a1, void (*a2)(_OWORD *__return_ptr))
{
  a2(v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *a1 = v5[0];
  a1[1] = v4;
  return result;
}

ValueMetadata *type metadata accessor for ViewGeometry()
{
  return &type metadata for ViewGeometry;
}

ValueMetadata *type metadata accessor for ViewSizeKey()
{
  return &type metadata for ViewSizeKey;
}

unint64_t sub_25C231BD8()
{
  unint64_t result = qword_26A598128;
  if (!qword_26A598128)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A598130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598128);
  }
  return result;
}

uint64_t sub_25C231C34(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_25C231C74(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25C231C94(uint64_t result, int a2, int a3)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_25C231CE0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25C231D00(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_25C231D50(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25C231DA0(uint64_t a1)
{
  return sub_25C231F88(0.890196078, 0.678431373, 0.380392157, a1, &qword_26A598C20);
}

uint64_t *sub_25C231DC8()
{
  if (qword_26A598800 != -1) {
    swift_once();
  }
  return &qword_26A598C20;
}

uint64_t sub_25C231E14()
{
  return sub_25C2320EC(&qword_26A598800);
}

uint64_t sub_25C231E38(uint64_t a1)
{
  return sub_25C231F88(0.941176471, 0.560784314, 0.635294118, a1, &qword_26A598C28);
}

uint64_t *sub_25C231E60()
{
  if (qword_26A598808 != -1) {
    swift_once();
  }
  return &qword_26A598C28;
}

uint64_t sub_25C231EAC()
{
  return sub_25C2320EC(&qword_26A598808);
}

uint64_t sub_25C231ED0(uint64_t a1)
{
  return sub_25C231F88(0.784313725, 0.654901961, 0.956862745, a1, &qword_26A598C30);
}

uint64_t *sub_25C231EF4()
{
  if (qword_26A598810 != -1) {
    swift_once();
  }
  return &qword_26A598C30;
}

uint64_t sub_25C231F40()
{
  return sub_25C2320EC(&qword_26A598810);
}

uint64_t sub_25C231F64(uint64_t a1)
{
  return sub_25C231F88(0.462745098, 0.729411765, 0.964705882, a1, &qword_26A598C38);
}

uint64_t sub_25C231F88(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  sub_25C23A338();
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v11 + 104))(v10, *MEMORY[0x263F1B388]);
  uint64_t result = MEMORY[0x261181630](v10, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t *sub_25C23207C()
{
  if (qword_26A598818 != -1) {
    swift_once();
  }
  return &qword_26A598C38;
}

uint64_t sub_25C2320C8()
{
  return sub_25C2320EC(&qword_26A598818);
}

uint64_t sub_25C2320EC(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_25C232138()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598150);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C23B1A0;
  *(void *)(inited + 32) = sub_25C23A348() | 0x8000000000000000;
  *(void *)(inited + 40) = 0xC00B333333333333;
  if (qword_26A598818 != -1) {
    goto LABEL_59;
  }
  while (1)
  {
    unint64_t v1 = qword_26A598C38 | 0x8000000000000000;
    *(void *)(inited + 48) = qword_26A598C38 | 0x8000000000000000;
    *(void *)(inited + 56) = 0xBFC3333333333333;
    *(void *)(inited + 64) = v1;
    *(void *)(inited + 72) = 0xBFE6666666666666;
    uint64_t v2 = qword_26A598810;
    swift_retain_n();
    if (v2 != -1) {
      swift_once();
    }
    unint64_t v3 = qword_26A598C30 | 0x8000000000000000;
    *(void *)(inited + 80) = qword_26A598C30 | 0x8000000000000000;
    *(void *)(inited + 88) = 0xBFC999999999999ALL;
    *(void *)(inited + 96) = v3;
    *(void *)(inited + 104) = 0xBFD999999999999ALL;
    uint64_t v4 = qword_26A598808;
    swift_retain_n();
    if (v4 != -1) {
      swift_once();
    }
    unint64_t v5 = qword_26A598C28 | 0x8000000000000000;
    *(void *)(inited + 112) = qword_26A598C28 | 0x8000000000000000;
    *(void *)(inited + 120) = 0xBFD0000000000000;
    *(void *)(inited + 128) = v5;
    *(void *)(inited + 136) = 0xBFD3333333333333;
    uint64_t v6 = qword_26A598800;
    swift_retain_n();
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_26A598C20;
    *(void *)(inited + 144) = qword_26A598C20 | 0x8000000000000000;
    *(void *)(inited + 152) = 0xBFD3333333333333;
    swift_retain_n();
    uint64_t v8 = *(void *)sub_25C22D5F0();
    *(void *)(inited + 160) = v7;
    *(void *)(inited + 168) = v8;
    uint64_t v9 = sub_25C23A348();
    uint64_t v10 = *(void *)sub_25C22D608();
    *(void *)(inited + 176) = v9 | 0x8000000000000000;
    *(void *)(inited + 184) = v10;
    uint64_t v11 = *(void *)(inited + 16);
    if (!v11) {
      break;
    }
    swift_bridgeObjectRetain();
    double v12 = 0.0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    *(void *)&double v52 = v11 - 1;
    uint64_t v53 = inited;
    uint64_t v15 = inited + 40;
    char v16 = 1;
    uint64_t v17 = 0xF000000000000007;
LABEL_10:
    char v18 = (double *)(v15 + 16 * v14);
    uint64_t inited = v14;
    do
    {
      uint64_t v19 = *((void *)v18 - 1);
      uint64_t v14 = inited + 1;
      if ((v19 & 0x8000000000000000) == 0)
      {
        double v20 = *v18;
        swift_retain();
        sub_25C233078(v17);
        char v16 = 0;
        uint64_t v17 = v19;
        double v12 = v20;
        uint64_t v13 = inited;
        if (*(void *)&v52 != inited) {
          goto LABEL_10;
        }
        uint64_t v21 = v53;
        swift_bridgeObjectRelease();
        double v12 = v20;
        goto LABEL_18;
      }
      v18 += 2;
      ++inited;
    }
    while (v11 != v14);
    swift_bridgeObjectRelease();
    if (v16)
    {
      sub_25C233078(v17);
      break;
    }
    uint64_t v19 = v17;
    uint64_t inited = v13;
    uint64_t v21 = v53;
LABEL_18:
    if ((~v19 & 0xF000000000000007) == 0) {
      break;
    }
    if (inited < 0)
    {
      __break(1u);
    }
    else
    {
      double v52 = v12;
      if (inited)
      {
        *(void *)&double v22 = *(void *)&v12 ^ 0x8000000000000000;
        swift_bridgeObjectRetain();
        sub_25C23308C(v19);
        char v23 = (double *)(v21 + 16 * inited + 24);
        unint64_t v24 = (void *)MEMORY[0x263F8EE78];
        uint64_t v25 = inited;
        while (inited >= v25)
        {
          if (--v25 >= v11) {
            goto LABEL_31;
          }
          uint64_t v26 = *((void *)v23 - 1);
          double v27 = *v23;
          sub_25C232EE8();
          sub_25C232EE8();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v24 = sub_25C232C18(0, v24[2] + 1, 1, v24);
          }
          unint64_t v29 = v24[2];
          unint64_t v28 = v24[3];
          if (v29 >= v28 >> 1) {
            unint64_t v24 = sub_25C232C18((void *)(v28 > 1), v29 + 1, 1, v24);
          }
          double v22 = v22 + v27;
          v24[2] = v29 + 1;
          v30 = (double *)&v24[2 * v29];
          *((void *)v30 + 4) = v26 & 0x7FFFFFFFFFFFFFFFLL;
          v30[5] = v22;
          sub_25C232EFC();
          v23 -= 2;
          if (!v25) {
            goto LABEL_32;
          }
        }
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        uint64_t v21 = v53;
        swift_bridgeObjectRelease();
        uint64_t v31 = v24[2];
        if (!v31) {
          goto LABEL_43;
        }
LABEL_33:
        unint64_t v32 = v31 - 1;
        if (v31 != 1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v24 = sub_25C232E60(v24);
          }
          uint64_t v33 = &v24[2 * v31 + 2];
          unint64_t v34 = v24 + 5;
          uint64_t v35 = 1;
          do
          {
            if (v35 - 1 != v32)
            {
              unint64_t v37 = v24[2];
              if (v35 - 1 >= v37) {
                goto LABEL_57;
              }
              if (v32 >= v37) {
                goto LABEL_58;
              }
              uint64_t v38 = *v34;
              uint64_t v39 = *(v34 - 1);
              uint64_t v40 = v33[1];
              *(v34 - 1) = *v33;
              *unint64_t v34 = v40;
              *uint64_t v33 = v39;
              v33[1] = v38;
              swift_retain();
              swift_release();
            }
            --v32;
            v33 -= 2;
            v34 += 2;
          }
          while (v35++ < (uint64_t)v32);
          uint64_t v21 = v53;
        }
        goto LABEL_43;
      }
    }
    sub_25C232EE8();
    unint64_t v24 = (void *)MEMORY[0x263F8EE78];
    uint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v31) {
      goto LABEL_33;
    }
LABEL_43:
    sub_25C23308C(v19);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v24 = sub_25C232C18(0, v24[2] + 1, 1, v24);
    }
    unint64_t v42 = v24[2];
    unint64_t v41 = v24[3];
    if (v42 >= v41 >> 1) {
      unint64_t v24 = sub_25C232C18((void *)(v41 > 1), v42 + 1, 1, v24);
    }
    double v43 = -v52;
    v24[2] = v42 + 1;
    uint64_t v44 = (double *)&v24[2 * v42];
    *((void *)v44 + 4) = v19 & 0x7FFFFFFFFFFFFFFFLL;
    v44[5] = -v52;
    if (inited >= v11 || inited + 1 == v11)
    {
LABEL_55:
      sub_25C233078(v19);
      sub_25C233078(v19);
      swift_setDeallocating();
      swift_arrayDestroy();
      return (uint64_t)v24;
    }
    swift_bridgeObjectRetain();
    uint64_t v45 = ~inited + v11;
    uint64_t inited = v21 + 16 * inited + 56;
    while (v45)
    {
      uint64_t v46 = *(void *)(inited - 8);
      double v47 = *(double *)inited;
      sub_25C232EE8();
      sub_25C232EE8();
      unint64_t v49 = v24[2];
      unint64_t v48 = v24[3];
      if (v49 >= v48 >> 1) {
        unint64_t v24 = sub_25C232C18((void *)(v48 > 1), v49 + 1, 1, v24);
      }
      double v43 = v43 + v47;
      v24[2] = v49 + 1;
      v50 = (double *)&v24[2 * v49];
      *((void *)v50 + 4) = v46 & 0x7FFFFFFFFFFFFFFFLL;
      v50[5] = v43;
      sub_25C232EFC();
      inited += 16;
      if (!--v45)
      {
        swift_bridgeObjectRelease();
        goto LABEL_55;
      }
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    swift_once();
  }
  uint64_t result = sub_25C23A648();
  __break(1u);
  return result;
}

double sub_25C2327DC(double a1)
{
  double result = 0.0;
  if (a1 >= 1.5)
  {
    double v3 = fmin((a1 + -1.5) / 3.6, 1.0);
    return v3 * v3 * (3.0 - (v3 + v3));
  }
  return result;
}

double sub_25C232824@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  unint64_t v24 = a2;
  uint64_t v3 = sub_25C23A128();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (v7)
  {
    *(void *)&long long v25 = MEMORY[0x263F8EE78];
    sub_25C232D3C(0, v7, 0);
    uint64_t v8 = v25;
    uint64_t v9 = a1 + 40;
    do
    {
      swift_retain();
      uint64_t v10 = sub_25C23A498();
      uint64_t v12 = v11;
      *(void *)&long long v25 = v8;
      unint64_t v14 = *(void *)(v8 + 16);
      unint64_t v13 = *(void *)(v8 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_25C232D3C((char *)(v13 > 1), v14 + 1, 1);
        uint64_t v8 = v25;
      }
      *(void *)(v8 + 16) = v14 + 1;
      uint64_t v15 = v8 + 16 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v12;
      v9 += 16;
      --v7;
    }
    while (v7);
  }
  uint64_t v16 = *MEMORY[0x263F18DC8];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v17(v6, v16, v3);
  char v18 = sub_25C23A118();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19(v6, v3);
  if (v18) {
    sub_25C23A4D8();
  }
  else {
    sub_25C23A4E8();
  }
  v17(v6, v16, v3);
  char v20 = sub_25C23A118();
  v19(v6, v3);
  if (v20) {
    sub_25C23A4E8();
  }
  else {
    sub_25C23A4D8();
  }
  MEMORY[0x261181760](v8);
  sub_25C23A0C8();
  double result = *(double *)&v25;
  long long v22 = v26;
  char v23 = v24;
  *unint64_t v24 = v25;
  v23[1] = v22;
  *((void *)v23 + 4) = v27;
  return result;
}

double sub_25C232A9C()
{
  return 0.0;
}

uint64_t sub_25C232AA4()
{
  uint64_t v0 = sub_25C23A128();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F18DC8], v0);
  sub_25C23A118();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_25C232C00()
{
  return v0;
}

uint64_t sub_25C232C08()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

void *sub_25C232C18(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598160);
    uint64_t v10 = (void *)swift_allocObject();
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
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598168);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25C232D3C(char *a1, int64_t a2, char a3)
{
  double result = sub_25C232D5C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_25C232D5C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598158);
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
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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

void *sub_25C232E60(void *a1)
{
  return sub_25C232C18(0, a1[2], 0, a1);
}

ValueMetadata *type metadata accessor for SiriColorProfile()
{
  return &type metadata for SiriColorProfile;
}

uint64_t type metadata accessor for ColorProducer()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for ColorTracker(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  sub_25C232EE8();
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_25C232EE8()
{
  return swift_retain();
}

uint64_t destroy for ColorTracker()
{
  return sub_25C232EFC();
}

uint64_t sub_25C232EFC()
{
  return swift_release();
}

void *assignWithCopy for ColorTracker(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  sub_25C232EE8();
  *a1 = v3;
  a1[1] = v4;
  sub_25C232EFC();
  return a1;
}

_OWORD *assignWithTake for ColorTracker(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  sub_25C232EFC();
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorTracker(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7F && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 127);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 6) | (2 * ((*(void *)a1 >> 57) & 0x38 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ColorTracker(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(void *)double result = a2 - 127;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(void *)double result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(void *)(result + 8) = 0;
    }
  }
  return result;
}

uint64_t sub_25C233034(void *a1)
{
  return *a1 >> 63;
}

void *sub_25C233040(void *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_25C233050(uint64_t *result, uint64_t a2)
{
  *double result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for ColorTracker()
{
  return &type metadata for ColorTracker;
}

uint64_t sub_25C233078(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return sub_25C232EFC();
  }
  return result;
}

uint64_t sub_25C23308C(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return sub_25C232EE8();
  }
  return result;
}

id sub_25C2330F0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_25C2331A8(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

id sub_25C2331FC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)sub_25C23A578();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12[4] = a4;
    v12[5] = a5;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 1107296256;
    v12[2] = sub_25C22F330;
    v12[3] = &block_descriptor_0;
    uint64_t v9 = _Block_copy(v12);
    swift_release();
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithText_finalTextColor_onAnimationCompleteHandler_, v8, a3, v9);

  _Block_release(v9);
  return v10;
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

id sub_25C233310(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7 = sub_25C2336B0(a1, a2, a3, a4, a5);
  sub_25C230F94(a4);

  return v7;
}

Swift::Void __swiftcall SASWelcomeToDeviceViewControllerProvider.startAnimation()()
{
  (*(void (**)(void))(**(void **)(v0 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel) + 664))();
}

Swift::Void __swiftcall SASWelcomeToDeviceViewControllerProvider.stopAnimation()()
{
  (*(void (**)(void))(**(void **)(v0 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel) + 696))();
}

void __swiftcall SASWelcomeToDeviceViewControllerProvider.init()(SASWelcomeToDeviceViewControllerProvider *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void SASWelcomeToDeviceViewControllerProvider.init()()
{
}

id sub_25C2336B0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598180);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  unint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (uint64_t *)((char *)&v22 - v15);
  type metadata accessor for WelcomeToDeviceViewModel();
  uint64_t v17 = v5;
  uint64_t v18 = MEMORY[0x2611815E0](a3);
  sub_25C2338D0(a4);
  *(void *)&v17[OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel] = sub_25C22F4E8(a1, a2, v18, a4, a5);
  sub_25C2338E0();
  swift_retain();
  sub_25C2342D4(v16);
  sub_25C233938((uint64_t)v16, (uint64_t)v14);
  id v19 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A598190));
  uint64_t v20 = sub_25C23A208();
  sub_25C2339A0((uint64_t)v16);
  *(void *)&v17[OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController] = v20;

  v22.receiver = v17;
  v22.super_class = (Class)SASWelcomeToDeviceViewControllerProvider;
  return objc_msgSendSuper2(&v22, sel_init);
}

unint64_t type metadata accessor for SASWelcomeToDeviceViewControllerProvider()
{
  unint64_t result = qword_26A598820[0];
  if (!qword_26A598820[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26A598820);
  }
  return result;
}

uint64_t sub_25C233888()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C2338C0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_25C2338D0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_25C2338E0()
{
  unint64_t result = qword_26A598188;
  if (!qword_26A598188)
  {
    type metadata accessor for WelcomeToDeviceViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598188);
  }
  return result;
}

uint64_t sub_25C233938(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C2339A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598180);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C233A04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C23A1F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C239960(v2, (uint64_t)v10, &qword_26A598198);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25C23A128();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_25C23A5C8();
    unint64_t v14 = sub_25C23A238();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_25C237C70(0x694474756F79614CLL, 0xEF6E6F6974636572, &v18);
      _os_log_impl(&dword_25C22B000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261181E60](v16, -1, -1);
      MEMORY[0x261181E60](v15, -1, -1);
    }

    sub_25C23A1E8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_25C233C98@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25C233CF0()
{
  return sub_25C23A168();
}

uint64_t sub_25C233D14(uint64_t a1)
{
  uint64_t v2 = sub_25C23A128();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25C23A178();
}

uint64_t sub_25C233DDC()
{
  return sub_25C23A0D8();
}

uint64_t sub_25C233DE4(uint64_t a1)
{
  sub_25C2381CC(a1);

  return swift_unknownObjectRetain();
}

uint64_t sub_25C233E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 36);
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v4 + 8) = a1;
  return result;
}

uint64_t (*sub_25C233E40())()
{
  return nullsub_1;
}

uint64_t sub_25C233E68(uint64_t a1)
{
  return MEMORY[0x270EFFB88](*(void *)(v1 + *(int *)(a1 + 36)), *(void *)(v1 + *(int *)(a1 + 36) + 8), *(void *)(a1 + 16), *(void *)(*(void *)(a1 + 24) + 8));
}

double sub_25C233E84@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for CGRect(0);
  sub_25C23A408();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

double sub_25C233EDC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981A0);
  sub_25C23A418();
  return v1;
}

uint64_t sub_25C233F38()
{
  return sub_25C23A428();
}

void (*sub_25C233F98(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v5 = malloc(0x98uLL);
  *a1 = v5;
  uint64_t v6 = (uint64_t *)(v2 + *(int *)(a2 + 40));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  v5[13] = *v6;
  v5[14] = v8;
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[3];
  v5[15] = v9;
  v5[16] = v10;
  uint64_t v11 = v6[4];
  v5[17] = v11;
  *uint64_t v5 = v7;
  v5[1] = v8;
  _OWORD v5[2] = v9;
  v5[3] = v10;
  v5[4] = v11;
  swift_retain();
  v5[18] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981A0);
  sub_25C23A418();
  return sub_25C234048;
}

void sub_25C234048(uint64_t a1)
{
  double v1 = *(_OWORD **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 136);
  long long v3 = *(_OWORD *)(*(void *)a1 + 120);
  _OWORD *v1 = *(_OWORD *)(*(void *)a1 + 104);
  v1[1] = v3;
  *((void *)v1 + 4) = v2;
  *(_OWORD *)((char *)v1 + 72) = *(_OWORD *)((char *)v1 + 40);
  *(_OWORD *)((char *)v1 + 88) = *(_OWORD *)((char *)v1 + 56);
  sub_25C23A428();
  swift_release();

  free(v1);
}

double sub_25C2340B0()
{
  return 0.0;
}

__n128 sub_25C2340C4@<Q0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981A0);
  sub_25C23A438();
  __n128 result = v5;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(__n128 *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  return result;
}

double sub_25C23412C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v3 = *(double (**)(uint64_t, uint64_t))(v1 + 104);
  swift_unknownObjectRetain();
  double v4 = v3(v2, v1);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_25C2341A4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598180);
  uint64_t v3 = (char *)a1 + *(int *)(v2 + 40);
  type metadata accessor for CGRect(0);
  sub_25C23A408();
  *(_OWORD *)uint64_t v3 = v9;
  *((_OWORD *)v3 + 1) = v10;
  *((void *)v3 + 4) = v11;
  double v4 = (uint64_t *)((char *)a1 + *(int *)(v2 + 36));
  type metadata accessor for WelcomeToDeviceViewModel();
  sub_25C23914C();
  swift_retain();
  *double v4 = sub_25C23A0D8();
  v4[1] = v5;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata, 0, 0, 0, 0);
  sub_25C23A0A8();

  return swift_release();
}

uint64_t sub_25C2342D4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = type metadata accessor for WelcomeToDeviceView();
  uint64_t v3 = (char *)a1 + *(int *)(v2 + 40);
  type metadata accessor for CGRect(0);
  sub_25C23A408();
  *(_OWORD *)uint64_t v3 = v9;
  *((_OWORD *)v3 + 1) = v10;
  *((void *)v3 + 4) = v11;
  double v4 = (uint64_t *)((char *)a1 + *(int *)(v2 + 36));
  swift_unknownObjectRetain();
  *double v4 = sub_25C23A0D8();
  v4[1] = v5;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata, 0, 0, 0, 0);
  sub_25C23A0A8();

  return swift_unknownObjectRelease();
}

uint64_t sub_25C234400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981A8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (uint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v11 = sub_25C23A4B8();
  v11[1] = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981B8);
  sub_25C2345BC(v3, *(void *)(a1 + 16), *(void **)(a1 + 24), (uint64_t *)((char *)v11 + *(int *)(v13 + 44)));
  sub_25C23A388();
  uint64_t v14 = sub_25C23A398();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 0, 1, v14);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5981C0) + 36));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981C8);
  sub_25C239960((uint64_t)v8, (uint64_t)v16 + *(int *)(v17 + 28), &qword_26A5981A8);
  *uint64_t v16 = KeyPath;
  sub_25C239960((uint64_t)v11, a2, &qword_26A5981B0);
  sub_25C2398A0((uint64_t)v8, &qword_26A5981A8);
  return sub_25C2398A0((uint64_t)v11, &qword_26A5981B0);
}

uint64_t sub_25C2345BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  v128 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598230);
  MEMORY[0x270FA5388](v7 - 8);
  v126 = (void *)((char *)v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598238);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v127 = (uint64_t)v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v132 = (uint64_t)v101 - v12;
  uint64_t v108 = sub_25C23A128();
  uint64_t v110 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  uint64_t v109 = (uint64_t)v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_25C23A108();
  uint64_t v114 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  v129 = (char *)v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_25C23A488();
  uint64_t v116 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  v113 = (char *)v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598240);
  *(void *)&long long v120 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  v115 = (char *)v101 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598248);
  MEMORY[0x270FA5388](v112);
  v122 = (char *)v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598250);
  MEMORY[0x270FA5388](v118);
  uint64_t v125 = (uint64_t)v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598258);
  uint64_t v19 = MEMORY[0x270FA5388](v124);
  uint64_t v131 = (uint64_t)v101 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v123 = (uint64_t)v101 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v130 = (uint64_t)v101 - v23;
  uint64_t v133 = a2;
  v134 = a3;
  uint64_t v24 = type metadata accessor for WelcomeToDeviceView();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  unint64_t v28 = (char *)v101 - v27;
  uint64_t v29 = v26;
  v158.origin.x = sub_25C233EDC();
  v163.origin.x = 0.0;
  v163.origin.y = 0.0;
  v163.size.width = 0.0;
  v163.size.height = 0.0;
  BOOL v30 = CGRectEqualToRect(v158, v163);
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v135 = 0;
  uint64_t v140 = 0;
  uint64_t v139 = 0;
  uint64_t v138 = 0;
  uint64_t v137 = 0;
  uint64_t v136 = 0;
  uint64_t v143 = 0;
  uint64_t v142 = 0;
  uint64_t v33 = 0;
  uint64_t v141 = 0;
  if (v30)
  {
    uint64_t v34 = sub_25C2355AC(v29, (uint64_t)&v144);
    uint64_t v31 = v144;
    uint64_t v32 = v145;
    uint64_t v135 = v146;
    uint64_t v140 = v147;
    uint64_t v138 = *((void *)&v148 + 1);
    uint64_t v139 = v148;
    uint64_t v137 = v149;
    uint64_t v136 = BYTE8(v149);
    nullsub_1(v34);
    uint64_t v143 = sub_25C23A4B8();
    uint64_t v142 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, a1, v29);
    unint64_t v36 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v37 = swift_allocObject();
    uint64_t v38 = v134;
    *(void *)(v37 + 16) = v133;
    *(void *)(v37 + 24) = v38;
    uint64_t v141 = v37;
    (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v37 + v36, v28, v29);
    uint64_t v33 = sub_25C2394EC;
  }
  uint64_t v106 = v32;
  uint64_t v107 = v31;
  v111 = v33;
  uint64_t v39 = v29;
  v159.origin.x = sub_25C233EDC();
  CGRectGetWidth(v159);
  v160.origin.x = sub_25C233EDC();
  CGRectGetHeight(v160);
  sub_25C23412C(v29);
  sub_25C23A4B8();
  sub_25C23A058();
  uint64_t v144 = v153;
  LOBYTE(v145) = v154;
  uint64_t v146 = v155;
  LOBYTE(v147) = v156;
  long long v148 = v157;
  sub_25C23A098();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598260);
  uint64_t v40 = *(void *)(sub_25C23A478() - 8);
  unint64_t v41 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v42 = swift_allocObject();
  uint64_t v105 = v42;
  *(_OWORD *)(v42 + 16) = xmmword_25C23B210;
  unint64_t v43 = v42 + v41;
  uint64_t v104 = type metadata accessor for ColorProducer();
  uint64_t v44 = v134;
  uint64_t v45 = (void (*)(uint64_t, void *))v134[15];
  swift_unknownObjectRetain();
  uint64_t v46 = v133;
  v45(v133, v44);
  swift_unknownObjectRelease();
  v161.origin.x = sub_25C233EDC();
  CGRectGetWidth(v161);
  double v47 = (void (*)(uint64_t, void *))v44[14];
  swift_unknownObjectRetain();
  v47(v46, v44);
  swift_unknownObjectRelease();
  unint64_t v48 = (void (*)(uint64_t, void *))v44[2];
  swift_unknownObjectRetain();
  v48(v46, v44);
  swift_unknownObjectRelease();
  uint64_t v49 = v109;
  sub_25C233A04(v109);
  sub_25C232AA4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v49, v108);
  v162.origin.x = sub_25C233EDC();
  CGRectGetHeight(v162);
  sub_25C23412C(v39);
  v101[1] = v43;
  sub_25C23A468();
  sub_25C23A448();
  uint64_t v50 = v39;
  uint64_t v51 = v46;
  double v52 = (void (*)(uint64_t, void *))v44[11];
  swift_unknownObjectRetain();
  v52(v51, v44);
  swift_unknownObjectRelease();
  sub_25C23A458();
  uint64_t v103 = v50;
  swift_unknownObjectRetain();
  sub_25C22D64C();
  swift_unknownObjectRelease();
  sub_25C23A458();
  uint64_t v53 = v113;
  v54 = v129;
  sub_25C23A0F8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v114 + 8))(v54, v117);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598268);
  sub_25C2391A4();
  v55 = v115;
  sub_25C23A2F8();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v53, v119);
  uint64_t v102 = a1;
  swift_unknownObjectRetain();
  double v56 = sub_25C22D640();
  swift_unknownObjectRelease();
  uint64_t v57 = v120;
  uint64_t v58 = (uint64_t)v122;
  uint64_t v59 = v121;
  (*(void (**)(char *, char *, void))(v120 + 16))(v122, v55, v121);
  uint64_t v60 = v58 + *(int *)(v112 + 36);
  *(double *)uint64_t v60 = v56;
  *(unsigned char *)(v60 + 8) = 0;
  (*(void (**)(char *, uint64_t))(v57 + 8))(v55, v59);
  v129 = (char *)sub_25C23A4B8();
  uint64_t v62 = v61;
  sub_25C235744(v51, v44, (uint64_t)&v144);
  uint64_t v63 = v144;
  LOBYTE(v52) = v145;
  uint64_t v64 = v146;
  char v65 = v147;
  long long v66 = v148;
  long long v121 = v149;
  long long v120 = v150;
  uint64_t v67 = v151;
  LOBYTE(v51) = v152;
  uint64_t v68 = v125;
  sub_25C239960(v58, v125, &qword_26A598248);
  uint64_t v69 = v68 + *(int *)(v118 + 36);
  *(void *)uint64_t v69 = v129;
  *(void *)(v69 + 8) = v62;
  *(void *)(v69 + 16) = v63;
  *(unsigned char *)(v69 + 24) = (_BYTE)v52;
  *(void *)(v69 + 32) = v64;
  *(unsigned char *)(v69 + 40) = v65;
  *(_OWORD *)(v69 + 48) = v66;
  long long v70 = v120;
  *(_OWORD *)(v69 + 64) = v121;
  *(_OWORD *)(v69 + 80) = v70;
  *(void *)(v69 + 96) = v67;
  *(unsigned char *)(v69 + 104) = v51;
  sub_25C2398A0(v58, &qword_26A598248);
  uint64_t v71 = v102;
  v72 = v134;
  v73 = (uint64_t (*)(uint64_t, void *))v134[16];
  swift_unknownObjectRetain();
  uint64_t v74 = v133;
  uint64_t v75 = v73(v133, v72);
  swift_unknownObjectRelease();
  LOBYTE(v58) = sub_25C235A9C(0, v75);
  swift_bridgeObjectRelease();
  if (v58) {
    double v76 = 1.0;
  }
  else {
    double v76 = 0.0;
  }
  uint64_t v77 = v123;
  sub_25C239960(v68, v123, &qword_26A598250);
  *(double *)(v77 + *(int *)(v124 + 36)) = v76;
  sub_25C2398A0(v68, &qword_26A598250);
  uint64_t v78 = v130;
  sub_25C2398FC(v77, v130, &qword_26A598258);
  uint64_t v79 = sub_25C23A4B8();
  uint64_t v80 = (uint64_t)v126;
  uint64_t *v126 = v79;
  *(void *)(v80 + 8) = v81;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598280);
  sub_25C235B88(v71, v74, v72, v80 + *(int *)(v82 + 44));
  uint64_t v83 = v127;
  sub_25C239960(v80, v127, &qword_26A598230);
  sub_25C2398A0(v80, &qword_26A598230);
  uint64_t v84 = v132;
  sub_25C2398FC(v83, v132, &qword_26A598238);
  uint64_t v85 = v78;
  uint64_t v86 = v131;
  sub_25C239960(v85, v131, &qword_26A598258);
  sub_25C239960(v84, v83, &qword_26A598238);
  v87 = v128;
  uint64_t v88 = v107;
  uint64_t v89 = v106;
  uint64_t *v128 = v107;
  v87[1] = v89;
  uint64_t v90 = v140;
  v87[2] = v135;
  v87[3] = v90;
  uint64_t v91 = v138;
  v87[4] = v139;
  v87[5] = v91;
  uint64_t v92 = v136;
  v87[6] = v137;
  v87[7] = v92;
  uint64_t v93 = v143;
  v87[8] = 0;
  v87[9] = v93;
  uint64_t v143 = v93;
  v94 = v111;
  v87[10] = v142;
  v87[11] = (uint64_t)v94;
  uint64_t v95 = v141;
  v87[12] = v141;
  uint64_t v141 = v95;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598288);
  sub_25C239960(v86, (uint64_t)v87 + *(int *)(v96 + 48), &qword_26A598258);
  sub_25C239960(v83, (uint64_t)v87 + *(int *)(v96 + 64), &qword_26A598238);
  uint64_t v97 = v89;
  uint64_t v98 = v89;
  LOBYTE(v89) = v135;
  uint64_t v99 = v140;
  sub_25C239274(v88, v98, v135, v140);
  sub_25C2398A0(v132, &qword_26A598238);
  sub_25C2398A0(v130, &qword_26A598258);
  sub_25C2398A0(v83, &qword_26A598238);
  sub_25C2398A0(v131, &qword_26A598258);
  return sub_25C2392F4(v88, v97, v89, v99);
}

uint64_t sub_25C2355AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 24);
  swift_unknownObjectRetain();
  v5(v4, v3);
  swift_unknownObjectRelease();
  sub_25C2395A8();
  uint64_t v6 = sub_25C23A2C8();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_25C23A248();
  uint64_t v11 = sub_25C23A2B8();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  sub_25C239364(v6, v8, v10);
  swift_bridgeObjectRelease();
  sub_25C23A258();
  uint64_t v16 = sub_25C23A2A8();
  uint64_t v18 = v17;
  LOBYTE(v4) = v19;
  uint64_t v21 = v20;
  sub_25C239364(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)a2 = v16;
  *(void *)(a2 + 8) = v18;
  *(unsigned char *)(a2 + 16) = v4 & 1;
  *(void *)(a2 + 24) = v21;
  *(void *)(a2 + 32) = KeyPath;
  *(void *)(a2 + 40) = 0x3F847AE147AE147BLL;
  *(void *)(a2 + 48) = result;
  *(unsigned char *)(a2 + 56) = 1;
  return result;
}

uint64_t sub_25C235744@<X0>(uint64_t a1@<X1>, void *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25C23A128();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v27 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WelcomeToDeviceView();
  v40.origin.x = sub_25C233EDC();
  CGRectGetWidth(v40);
  v41.origin.x = sub_25C233EDC();
  CGRectGetHeight(v41);
  sub_25C23A4B8();
  sub_25C23A058();
  uint64_t v33 = v34;
  int v32 = v35;
  uint64_t v31 = v36;
  int v30 = v37;
  uint64_t v28 = v39;
  uint64_t v29 = v38;
  uint64_t v25 = type metadata accessor for ColorProducer();
  char v10 = (void (*)(uint64_t, void *))a2[15];
  swift_unknownObjectRetain();
  v10(a1, a2);
  swift_unknownObjectRelease();
  v42.origin.x = sub_25C233EDC();
  CGRectGetWidth(v42);
  uint64_t v11 = (void (*)(uint64_t, void *))a2[14];
  swift_unknownObjectRetain();
  v11(a1, a2);
  swift_unknownObjectRelease();
  uint64_t v12 = (void (*)(uint64_t, void *))a2[2];
  swift_unknownObjectRetain();
  v12(a1, a2);
  swift_unknownObjectRelease();
  uint64_t v14 = v26;
  uint64_t v13 = v27;
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v8, *MEMORY[0x263F18DC8], v27);
  sub_25C232AA4();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  v43.origin.x = sub_25C233EDC();
  double Height = CGRectGetHeight(v43);
  double v18 = (Height + sub_25C23412C(v9)) * 0.5;
  v44.origin.x = sub_25C233EDC();
  CGFloat Width = CGRectGetWidth(v44);
  uint64_t v20 = (double (*)(uint64_t, void *))a2[12];
  CGFloat v21 = Width / -3.0;
  swift_unknownObjectRetain();
  double v22 = v20(a1, a2);
  uint64_t result = swift_unknownObjectRelease();
  *(void *)a3 = v33;
  *(unsigned char *)(a3 + 8) = v32;
  *(void *)(a3 + 16) = v31;
  *(unsigned char *)(a3 + 24) = v30;
  uint64_t v24 = v28;
  *(void *)(a3 + 32) = v29;
  *(void *)(a3 + 40) = v24;
  *(void *)(a3 + 48) = v16;
  *(double *)(a3 + 56) = v18;
  *(CGFloat *)(a3 + 64) = v21;
  *(void *)(a3 + 72) = 0;
  *(double *)(a3 + 80) = v22;
  *(unsigned char *)(a3 + 88) = 0;
  return result;
}

uint64_t sub_25C235A9C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (sub_25C2316E8(),
        uint64_t v3 = sub_25C23A558(),
        uint64_t v4 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v5 = v3 & ~v4,
        ((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0))
  {
    uint64_t v6 = ~v4;
    sub_25C230FA8();
    do
    {
      char v7 = sub_25C23A568();
      if (v7) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v6;
    }
    while (((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_25C235B88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v148 = a4;
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598298);
  uint64_t v154 = *(void *)(v155 - 8);
  MEMORY[0x270FA5388](v155);
  uint64_t v136 = (char *)&v122 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982A0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v147 = (uint64_t)&v122 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v156 = (char *)&v122 - v11;
  uint64_t v143 = sub_25C23A108();
  uint64_t v142 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  CGRect v160 = (char *)&v122 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_25C23A488();
  uint64_t v141 = *(void *)(v145 - 8);
  MEMORY[0x270FA5388](v145);
  uint64_t v144 = (char *)&v122 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982A8);
  uint64_t v138 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  uint64_t v135 = (char *)&v122 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982B0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v146 = (uint64_t)&v122 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v153 = (char *)&v122 - v18;
  uint64_t v19 = sub_25C23A138();
  MEMORY[0x270FA5388](v19 - 8);
  v134 = (char *)&v122 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = (void *)sub_25C23A4C8();
  uint64_t v132 = *(v133 - 1);
  MEMORY[0x270FA5388](v133);
  uint64_t v131 = (char *)&v122 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_25C23A128();
  uint64_t v150 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v122 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982B8);
  uint64_t v25 = MEMORY[0x270FA5388](v130);
  uint64_t v27 = (char *)&v122 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v137 = (uint64_t)&v122 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982C0);
  uint64_t v30 = MEMORY[0x270FA5388](v29 - 8);
  uint64_t v152 = (uint64_t)&v122 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v122 - v32;
  uint64_t v34 = type metadata accessor for WelcomeToDeviceView();
  uint64_t v162 = a1;
  unsigned __int8 v35 = (uint64_t (*)(uint64_t, void *))a3[16];
  swift_unknownObjectRetain();
  uint64_t v163 = a2;
  CGRect v161 = a3;
  uint64_t v158 = (uint64_t)(a3 + 16);
  long long v157 = v35;
  uint64_t v36 = v35(a2, a3);
  swift_unknownObjectRelease();
  LOBYTE(a1) = sub_25C235A9C(1, v36);
  swift_bridgeObjectRelease();
  uint64_t v151 = v33;
  uint64_t v159 = v22;
  uint64_t v140 = v24;
  uint64_t v149 = v34;
  if (a1)
  {
    sub_25C2355AC(v34, (uint64_t)&v164);
    uint64_t v37 = v164;
    uint64_t v129 = v165;
    int v128 = v166;
    uint64_t v38 = *((void *)&v167 + 1);
    uint64_t v123 = v167;
    uint64_t v39 = v168;
    uint64_t v40 = v169;
    int v124 = v170;
    uint64_t v125 = type metadata accessor for ColorProducer();
    CGRect v41 = (uint64_t (*)(uint64_t, void *))v161[15];
    swift_unknownObjectRetain();
    uint64_t v42 = v41(v163, v161);
    swift_unknownObjectRelease();
    sub_25C233EDC();
    CGRect v43 = (void (*)(uint64_t, void *))v161[2];
    *(void *)&long long v126 = v161 + 2;
    *(void *)&long long v127 = v43;
    swift_unknownObjectRetain();
    v43(v163, v161);
    swift_unknownObjectRelease();
    sub_25C233A04((uint64_t)v24);
    sub_25C232824(v42, &v175);
    uint64_t v44 = v175;
    long long v122 = v176;
    uint64_t v45 = v177;
    uint64_t v46 = v178;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v150 + 8))(v24, v159);
    uint64_t v47 = v132;
    unint64_t v48 = v131;
    uint64_t v49 = v133;
    (*(void (**)(char *, void, void *))(v132 + 104))(v131, *MEMORY[0x263F1B950], v133);
    uint64_t v50 = (uint64_t)v134;
    (*(void (**)(char *, char *, void *))(v47 + 16))(v134, v48, v49);
    sub_25C2397E0(v50, (uint64_t)&v27[*(int *)(v130 + 36)]);
    uint64_t v51 = v129;
    *(void *)uint64_t v27 = v37;
    *((void *)v27 + 1) = v51;
    char v52 = v128;
    v27[16] = v128;
    *((void *)v27 + 3) = v123;
    *((void *)v27 + 4) = v38;
    *((void *)v27 + 5) = v39;
    *((void *)v27 + 6) = v40;
    v27[56] = v124;
    *((void *)v27 + 8) = v44;
    *(_OWORD *)(v27 + 72) = v122;
    *((void *)v27 + 11) = v45;
    *((void *)v27 + 12) = v46;
    sub_25C2392E4(v37, v51, v52);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_25C239844(v50);
    (*(void (**)(char *, void *))(v47 + 8))(v48, v49);
    sub_25C239364(v37, v129, v128);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v53 = v137;
    sub_25C2398FC((uint64_t)v27, v137, &qword_26A5982B8);
    sub_25C2355AC(v149, (uint64_t)&v164);
    uint64_t v54 = v164;
    uint64_t v132 = v165;
    LOBYTE(v50) = v166;
    uint64_t v55 = *((void *)&v167 + 1);
    uint64_t v133 = (void *)v167;
    uint64_t v56 = v168;
    uint64_t v57 = v169;
    LODWORD(v134) = v170;
    uint64_t v58 = (uint64_t (*)(uint64_t, void *))v161[17];
    swift_unknownObjectRetain();
    uint64_t v59 = v58(v163, v161);
    swift_unknownObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    swift_unknownObjectRetain();
    double v61 = ((double (*)(uint64_t, void *))v127)(v163, v161);
    swift_unknownObjectRelease();
    double v62 = sub_25C2327DC(v61);
    sub_25C239960(v53, (uint64_t)v27, &qword_26A5982B8);
    uint64_t v63 = v152;
    sub_25C239960((uint64_t)v27, v152, &qword_26A5982B8);
    uint64_t v64 = v63 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A598358) + 48);
    uint64_t v65 = v132;
    *(void *)uint64_t v64 = v54;
    *(void *)(v64 + 8) = v65;
    *(unsigned char *)(v64 + 16) = v50;
    *(void *)(v64 + 24) = v133;
    *(void *)(v64 + 32) = v55;
    *(void *)(v64 + 40) = v56;
    *(void *)(v64 + 48) = v57;
    *(unsigned char *)(v64 + 56) = (_BYTE)v134;
    *(void *)(v64 + 64) = KeyPath;
    *(void *)(v64 + 72) = v59;
    *(double *)(v64 + 80) = v62;
    sub_25C2392E4(v54, v65, v50);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_25C2398A0(v137, &qword_26A5982B8);
    sub_25C239364(v54, v65, v50);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_25C2398A0((uint64_t)v27, &qword_26A5982B8);
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982C8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v63, 0, 1, v66);
    sub_25C2398FC(v63, (uint64_t)v151, &qword_26A5982C0);
    uint64_t v34 = v149;
  }
  else
  {
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982C8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v33, 1, 1, v67);
  }
  swift_unknownObjectRetain();
  uint64_t v68 = v157(v163, v161);
  swift_unknownObjectRelease();
  char v69 = sub_25C235A9C(2, v68);
  swift_bridgeObjectRelease();
  if (v69)
  {
    sub_25C2355AC(v34, (uint64_t)&v164);
    uint64_t v129 = v164;
    uint64_t v70 = v34;
    uint64_t v71 = v165;
    int v128 = v166;
    uint64_t v72 = v168;
    uint64_t v137 = v169;
    LODWORD(v130) = v170;
    v134 = (char *)type metadata accessor for ColorProducer();
    v73 = v161;
    uint64_t v132 = v161[15];
    uint64_t v74 = (uint64_t (*)(uint64_t, void *))v132;
    swift_unknownObjectRetain();
    uint64_t v75 = v74(v163, v73);
    swift_unknownObjectRelease();
    long long v127 = v167;
    sub_25C233EDC();
    uint64_t v133 = (void *)v73[2];
    double v76 = (void (*)(uint64_t, void *))v133;
    swift_unknownObjectRetain();
    v76(v163, v73);
    swift_unknownObjectRelease();
    uint64_t v77 = (uint64_t)v140;
    sub_25C233A04((uint64_t)v140);
    sub_25C232824(v75, &v179);
    uint64_t v78 = v179;
    long long v126 = v180;
    uint64_t v79 = v181;
    uint64_t v80 = v182;
    swift_bridgeObjectRelease();
    uint64_t v131 = *(char **)(v150 + 8);
    ((void (*)(uint64_t, uint64_t))v131)(v77, v159);
    uint64_t v164 = v129;
    uint64_t v165 = v71;
    unsigned __int8 v166 = v128;
    long long v167 = v127;
    uint64_t v168 = v72;
    uint64_t v169 = v137;
    unsigned __int8 v170 = v130;
    uint64_t v171 = v78;
    long long v172 = v126;
    uint64_t v173 = v79;
    uint64_t v174 = v80;
    sub_25C23A098();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598260);
    sub_25C23A478();
    uint64_t v137 = swift_allocObject();
    *(_OWORD *)(v137 + 16) = xmmword_25C23B210;
    swift_unknownObjectRetain();
    ((void (*)(uint64_t, void *))v132)(v163, v73);
    swift_unknownObjectRelease();
    v183.origin.x = sub_25C233EDC();
    CGRectGetWidth(v183);
    swift_unknownObjectRetain();
    ((void (*)(uint64_t, void *))v133)(v163, v73);
    swift_unknownObjectRelease();
    sub_25C233A04(v77);
    sub_25C232A9C();
    sub_25C232AA4();
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, uint64_t))v131)(v77, v159);
    v184.origin.x = sub_25C233EDC();
    CGRectGetHeight(v184);
    sub_25C23412C(v70);
    sub_25C23A468();
    sub_25C23A448();
    uint64_t v81 = (void (*)(uint64_t, void *))v73[10];
    swift_unknownObjectRetain();
    v81(v163, v73);
    swift_unknownObjectRelease();
    sub_25C23A458();
    uint64_t v34 = v70;
    uint64_t v82 = (void (*)(uint64_t, void *))v73[9];
    swift_unknownObjectRetain();
    v82(v163, v73);
    swift_unknownObjectRelease();
    sub_25C23A458();
    uint64_t v83 = v144;
    uint64_t v84 = v160;
    sub_25C23A0F8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v142 + 8))(v84, v143);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598338);
    sub_25C2395FC(&qword_26A598340, &qword_26A598338, &qword_26A598348, &qword_26A598350);
    uint64_t v85 = v135;
    sub_25C23A308();
    (*(void (**)(char *, uint64_t))(v141 + 8))(v83, v145);
    sub_25C239364(v164, v165, v166);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v86 = v138;
    v87 = v153;
    uint64_t v88 = v139;
    (*(void (**)(char *, char *, uint64_t))(v138 + 32))(v153, v85, v139);
    uint64_t v89 = 0;
  }
  else
  {
    uint64_t v89 = 1;
    v87 = v153;
    uint64_t v88 = v139;
    uint64_t v86 = v138;
  }
  uint64_t v90 = 1;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56))(v87, v89, 1, v88);
  swift_unknownObjectRetain();
  uint64_t v91 = v157(v163, v161);
  swift_unknownObjectRelease();
  char v92 = sub_25C235A9C(3, v91);
  swift_bridgeObjectRelease();
  if (v92)
  {
    sub_25C2355AC(v34, (uint64_t)&v164);
    uint64_t v93 = v164;
    uint64_t v94 = v165;
    unsigned __int8 v95 = v166;
    uint64_t v96 = v168;
    uint64_t v97 = v169;
    unsigned __int8 v98 = v170;
    uint64_t v99 = sub_25C23A358();
    uint64_t v164 = v93;
    uint64_t v165 = v94;
    unsigned __int8 v166 = v95;
    uint64_t v168 = v96;
    uint64_t v169 = v97;
    unsigned __int8 v170 = v98;
    uint64_t v171 = v99;
    sub_25C23A098();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598260);
    long long v157 = *(uint64_t (**)(uint64_t, void *))(*(void *)(sub_25C23A478() - 8) + 72);
    uint64_t v158 = swift_allocObject();
    *(_OWORD *)(v158 + 16) = xmmword_25C23B210;
    type metadata accessor for ColorProducer();
    v100 = v161;
    v101 = (void (*)(uint64_t, void *))v161[15];
    swift_unknownObjectRetain();
    uint64_t v102 = v163;
    v101(v163, v100);
    swift_unknownObjectRelease();
    v185.origin.x = sub_25C233EDC();
    CGRectGetWidth(v185);
    uint64_t v103 = (void (*)(uint64_t, void *))v100[6];
    swift_unknownObjectRetain();
    v103(v102, v100);
    swift_unknownObjectRelease();
    uint64_t v104 = (void (*)(uint64_t, void *))v100[2];
    swift_unknownObjectRetain();
    v104(v102, v100);
    swift_unknownObjectRelease();
    uint64_t v105 = (uint64_t)v140;
    sub_25C233A04((uint64_t)v140);
    sub_25C232AA4();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v105, v159);
    v186.origin.x = sub_25C233EDC();
    CGRectGetHeight(v186);
    sub_25C23A468();
    sub_25C23A448();
    uint64_t v106 = (void (*)(uint64_t, void *))v100[4];
    swift_unknownObjectRetain();
    uint64_t v107 = v163;
    v106(v163, v100);
    swift_unknownObjectRelease();
    sub_25C23A458();
    v87 = v153;
    uint64_t v108 = (void (*)(uint64_t, void *))v100[5];
    swift_unknownObjectRetain();
    v108(v107, v100);
    swift_unknownObjectRelease();
    sub_25C23A458();
    uint64_t v109 = v144;
    uint64_t v110 = v160;
    sub_25C23A0F8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v142 + 8))(v110, v143);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982D8);
    sub_25C2395FC(&qword_26A5982E0, &qword_26A5982D8, &qword_26A598328, &qword_26A598330);
    v111 = v136;
    sub_25C23A308();
    (*(void (**)(char *, uint64_t))(v141 + 8))(v109, v145);
    sub_25C239364(v164, v165, v166);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v154 + 32))(v156, v111, v155);
    uint64_t v90 = 0;
  }
  uint64_t v112 = (uint64_t)v156;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v154 + 56))(v156, v90, 1, v155);
  uint64_t v113 = (uint64_t)v151;
  uint64_t v114 = v152;
  sub_25C239960((uint64_t)v151, v152, &qword_26A5982C0);
  uint64_t v115 = (uint64_t)v87;
  uint64_t v116 = (uint64_t)v87;
  uint64_t v117 = v146;
  sub_25C239960(v115, v146, &qword_26A5982B0);
  uint64_t v118 = v147;
  sub_25C239960(v112, v147, &qword_26A5982A0);
  uint64_t v119 = v148;
  sub_25C239960(v114, v148, &qword_26A5982C0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5982D0);
  sub_25C239960(v117, v119 + *(int *)(v120 + 48), &qword_26A5982B0);
  sub_25C239960(v118, v119 + *(int *)(v120 + 64), &qword_26A5982A0);
  sub_25C2398A0(v112, &qword_26A5982A0);
  sub_25C2398A0(v116, &qword_26A5982B0);
  sub_25C2398A0(v113, &qword_26A5982C0);
  sub_25C2398A0(v118, &qword_26A5982A0);
  sub_25C2398A0(v117, &qword_26A5982B0);
  return sub_25C2398A0(v114, &qword_26A5982C0);
}

double sub_25C2375C0@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  CGRectGetMinX(*(CGRect *)&a2);
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  CGRectGetMidY(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetMaxX(v15);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGRectGetMinY(v16);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetMaxX(v17);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetMidY(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetMaxX(v19);
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  CGRectGetMaxY(v20);
  sub_25C23A298();
  double result = *(double *)&v11;
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 32) = v13;
  return result;
}

uint64_t sub_25C23772C(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  sub_25C23A278();
  v13.origin.x = a5;
  v13.origin.y = a6;
  v13.size.width = a7;
  v13.size.height = a8;
  CGRectGetMaxX(v13);
  v14.origin.x = a5;
  v14.origin.y = a6;
  v14.size.width = a7;
  v14.size.height = a8;
  CGRectGetMinY(v14);
  sub_25C23A268();
  v15.origin.x = a5;
  v15.origin.y = a6;
  v15.size.width = a7;
  v15.size.height = a8;
  CGRectGetMaxX(v15);
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  CGRectGetMinY(v16);
  sub_25C23A268();
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  CGRectGetMaxX(v17);
  v18.origin.x = a5;
  v18.origin.y = a6;
  v18.size.width = a7;
  v18.size.height = a8;
  CGRectGetMaxY(v18);
  sub_25C23A268();
  return sub_25C23A288();
}

uint64_t sub_25C237890()
{
  return MEMORY[0x270F047C8]();
}

void (*sub_25C2378A8(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25C23A028();
  return sub_25C237918;
}

void sub_25C237918(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_25C237964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25C239054();

  return MEMORY[0x270F04808](a1, a2, a3, v6);
}

uint64_t sub_25C2379C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25C239054();

  return MEMORY[0x270F047D0](a1, a2, a3, v6);
}

uint64_t sub_25C237A2C(uint64_t a1)
{
  unint64_t v2 = sub_25C239054();

  return MEMORY[0x270F047E0](a1, v2);
}

unint64_t sub_25C237A78()
{
  return 0xD000000000000031;
}

uint64_t sub_25C237A94()
{
  return 160;
}

uint64_t sub_25C237A9C()
{
  return 1;
}

uint64_t sub_25C237AA4()
{
  return sub_25C239F98();
}

uint64_t sub_25C237AF4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WelcomeToDeviceViewModel();
  uint64_t v2 = sub_25C23A368();
  sub_25C22F4E8(0x656D6F636C6557, 0xE700000000000000, v2, (uint64_t)nullsub_1, 0);
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598180);
  a1[4] = sub_25C231038(&qword_26A598228, &qword_26A598180);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  return sub_25C2341A4(boxed_opaque_existential_1);
}

uint64_t sub_25C237BB8()
{
  return sub_25C23A1A8();
}

uint64_t sub_25C237BDC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981A8);
  MEMORY[0x270FA5388](v2 - 8);
  sub_25C239960(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26A5981A8);
  return sub_25C23A1B8();
}

unint64_t sub_25C237C70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_25C237D44(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C239A14((uint64_t)v12, *a3);
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
      sub_25C239A14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_25C237D44(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_25C237E44(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_25C23A638();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25C237E44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C237EDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C237FE0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C237FE0((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C237EDC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_25C237F78(v2, 0);
      uint64_t result = sub_25C23A628();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_25C23A5A8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25C237F78(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598360);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C237FE0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598360);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v12 = v10 + 32;
  CGRect v13 = a4 + 32;
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

uint64_t sub_25C2380CC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25C23A188();
  *a1 = v3;
  return result;
}

uint64_t sub_25C2380F8()
{
  return sub_25C23A198();
}

uint64_t sub_25C238120@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C23A1C8();
  *a1 = result;
  return result;
}

uint64_t sub_25C23814C()
{
  return sub_25C23A1D8();
}

uint64_t sub_25C238174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C23A148();
  *a1 = result;
  return result;
}

uint64_t sub_25C2381A0()
{
  return sub_25C23A158();
}

uint64_t sub_25C2381CC(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36) + 8);
}

uint64_t type metadata accessor for WelcomeToDeviceView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C2381F8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25C238240()
{
  unint64_t result = qword_26A5981D0;
  if (!qword_26A5981D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5981D0);
  }
  return result;
}

unint64_t sub_25C238298()
{
  unint64_t result = qword_26A5981D8;
  if (!qword_26A5981D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5981D8);
  }
  return result;
}

unint64_t sub_25C2382F0()
{
  unint64_t result = qword_26A5981E0;
  if (!qword_26A5981E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5981E0);
  }
  return result;
}

uint64_t sub_25C238344()
{
  return sub_25C231038(&qword_26A5981E8, &qword_26A5981F0);
}

uint64_t sub_25C238380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

void sub_25C238388()
{
  sub_25C238F14();
  if (v0 <= 0x3F)
  {
    sub_25C23A0B8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_25C238464(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25C23A128();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[9];
    uint64_t v10 = a3[10];
    size_t v11 = (uint64_t *)((char *)a1 + v9);
    long long v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *size_t v11 = *v12;
    v11[1] = v13;
    CGRect v14 = (char *)a1 + v10;
    CGRect v15 = (char *)a2 + v10;
    long long v16 = *((_OWORD *)v15 + 1);
    *(_OWORD *)CGRect v14 = *(_OWORD *)v15;
    *((_OWORD *)v14 + 1) = v16;
    *((void *)v14 + 4) = *((void *)v15 + 4);
    uint64_t v17 = a3[11];
    CGRect v18 = (char *)a1 + v17;
    CGRect v19 = (char *)a2 + v17;
    uint64_t v20 = sub_25C23A0B8();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_unknownObjectRetain();
    swift_retain();
    v21(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_25C23860C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_25C23A128();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 44);
  uint64_t v6 = sub_25C23A0B8();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *sub_25C238700(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25C23A128();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[9];
  uint64_t v8 = a3[10];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  long long v12 = (char *)a1 + v8;
  uint64_t v13 = (char *)a2 + v8;
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)long long v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  uint64_t v15 = a3[11];
  long long v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_25C23A0B8();
  CGRect v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_unknownObjectRetain();
  swift_retain();
  v19(v16, v17, v18);
  return a1;
}

void *sub_25C238858(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25C2398A0((uint64_t)a1, &qword_26A598198);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25C23A128();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v10 = a3[10];
  uint64_t v11 = (void *)((char *)a1 + v10);
  long long v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  v11[3] = v12[3];
  v11[4] = v12[4];
  swift_retain();
  swift_release();
  uint64_t v13 = a3[11];
  long long v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_25C23A0B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *sub_25C2389E8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25C23A128();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  long long v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  *((void *)v9 + 4) = *((void *)v10 + 4);
  uint64_t v12 = a3[11];
  uint64_t v13 = &a1[v12];
  long long v14 = &a2[v12];
  uint64_t v15 = sub_25C23A0B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

char *sub_25C238B1C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_25C2398A0((uint64_t)a1, &qword_26A598198);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25C23A128();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[9];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_unknownObjectRelease();
  uint64_t v13 = a3[10];
  long long v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  long long v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)long long v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *((void *)v14 + 4) = *((void *)v15 + 4);
  swift_release();
  uint64_t v17 = a3[11];
  uint64_t v18 = &a1[v17];
  CGRect v19 = &a2[v17];
  uint64_t v20 = sub_25C23A0B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t sub_25C238C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C238C98);
}

uint64_t sub_25C238C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981F8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_25C23A0B8();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 44);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_25C238DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C238DE0);
}

uint64_t sub_25C238DE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5981F8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_25C23A0B8();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 44);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_25C238F14()
{
  if (!qword_26A598200)
  {
    sub_25C23A128();
    unint64_t v0 = sub_25C23A048();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A598200);
    }
  }
}

ValueMetadata *type metadata accessor for HaloShape()
{
  return &type metadata for HaloShape;
}

ValueMetadata *type metadata accessor for $s23SetupAssistantSupportUI0030WelcomeToDeviceViewswift_eDAEifMX159_0_33_BC0DD2D37507743ABA0B33D4935926D6Ll7PreviewfMf_15PreviewRegistryfMu_()
{
  return &type metadata for $s23SetupAssistantSupportUI0030WelcomeToDeviceViewswift_eDAEifMX159_0_33_BC0DD2D37507743ABA0B33D4935926D67PreviewfMf_15PreviewRegistryfMu_;
}

unint64_t sub_25C238F90()
{
  unint64_t result = qword_26A598208;
  if (!qword_26A598208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5981C0);
    sub_25C231038(&qword_26A598210, &qword_26A5981B0);
    sub_25C231038(&qword_26A598218, &qword_26A5981C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598208);
  }
  return result;
}

unint64_t sub_25C239054()
{
  unint64_t result = qword_26A598220;
  if (!qword_26A598220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598220);
  }
  return result;
}

uint64_t sub_25C2390A8()
{
  return sub_25C23772C(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9]);
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

unint64_t sub_25C23914C()
{
  unint64_t result = qword_26A598108;
  if (!qword_26A598108)
  {
    type metadata accessor for WelcomeToDeviceViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598108);
  }
  return result;
}

unint64_t sub_25C2391A4()
{
  unint64_t result = qword_26A598270;
  if (!qword_26A598270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A598268);
    sub_25C239220();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598270);
  }
  return result;
}

unint64_t sub_25C239220()
{
  unint64_t result = qword_26A598278;
  if (!qword_26A598278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598278);
  }
  return result;
}

uint64_t sub_25C239274(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_25C2392E4(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_25C2392E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25C2392F4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_25C239364(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C239364(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25C239374()
{
  uint64_t v1 = type metadata accessor for WelcomeToDeviceView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598198);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25C23A128();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 44);
  uint64_t v7 = sub_25C23A0B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25C2394EC(CGFloat *a1)
{
  type metadata accessor for WelcomeToDeviceView();
  CGFloat v2 = *a1;
  CGFloat v3 = a1[1];
  CGFloat v4 = a1[2];
  CGFloat v5 = a1[3];
  v7.origin.x = sub_25C233EDC();
  v8.origin.x = v2;
  v8.origin.y = v3;
  v8.size.width = v4;
  v8.size.height = v5;
  uint64_t result = CGRectEqualToRect(v7, v8);
  if ((result & 1) == 0) {
    return sub_25C233F38();
  }
  return result;
}

unint64_t sub_25C2395A8()
{
  unint64_t result = qword_26A598290;
  if (!qword_26A598290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598290);
  }
  return result;
}

uint64_t sub_25C2395FC(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_25C2396A0();
    sub_25C231038(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25C2396A0()
{
  unint64_t result = qword_26A5982E8;
  if (!qword_26A5982E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5982F0);
    sub_25C239740();
    sub_25C231038(&qword_26A598318, &qword_26A598320);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5982E8);
  }
  return result;
}

unint64_t sub_25C239740()
{
  unint64_t result = qword_26A5982F8;
  if (!qword_26A5982F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A598300);
    sub_25C231038(&qword_26A598308, &qword_26A598310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5982F8);
  }
  return result;
}

uint64_t sub_25C2397E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C23A138();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C239844(uint64_t a1)
{
  uint64_t v2 = sub_25C23A138();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C2398A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C2398FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C239960(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_25C239A14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25C239AA4()
{
  return 0;
}

id sub_25C239AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink] = 0;
  uint64_t v6 = (uint64_t *)&v5[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock];
  *uint64_t v6 = a1;
  v6[1] = a2;
  sub_25C2338D0(a1);
  sub_25C230F94(0);
  v9.receiver = v5;
  v9.super_class = v2;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_25C230F94(a1);
  return v7;
}

id sub_25C239B4C(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink] = 0;
  uint64_t v4 = (uint64_t *)&v2[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock];
  *uint64_t v4 = a1;
  v4[1] = a2;
  sub_25C2338D0(a1);
  sub_25C230F94(0);
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for DisplayLinkManager();
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_25C230F94(a1);
  return v5;
}

uint64_t type metadata accessor for DisplayLinkManager()
{
  return self;
}

void sub_25C239BFC()
{
  uint64_t v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink;
  if (!*(void *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink))
  {
    id v2 = objc_msgSend(self, sel_displayLinkWithTarget_selector_, v0, sel_frameWithDisplayLink_);
    uint64_t v3 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v2;

    uint64_t v4 = *(void **)(v0 + v1);
    if (v4)
    {
      id v5 = self;
      id v6 = v4;
      id v7 = objc_msgSend(v5, sel_currentRunLoop);
      objc_msgSend(v6, sel_addToRunLoop_forMode_, v7, *MEMORY[0x263EFF478]);
    }
  }
}

void sub_25C239CFC()
{
  uint64_t v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink);
  if (v2)
  {
    uint64_t v3 = self;
    id v4 = v2;
    id v5 = objc_msgSend(v3, sel_currentRunLoop);
    objc_msgSend(v4, sel_removeFromRunLoop_forMode_, v5, *MEMORY[0x263EFF478]);

    id v6 = *(void **)(v0 + v1);
  }
  else
  {
    id v6 = 0;
  }
  *(void *)(v0 + v1) = 0;
}

id sub_25C239E70()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void sub_25C239EA4()
{
}

id sub_25C239F04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisplayLinkManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C239F88()
{
  return MEMORY[0x270EEB248]();
}

uint64_t sub_25C239F98()
{
  return MEMORY[0x270EFEB40]();
}

uint64_t sub_25C239FA8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25C239FB8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_25C239FC8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_25C239FD8()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_25C239FE8()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_25C239FF8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_25C23A008()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_25C23A018()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_25C23A028()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_25C23A038()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_25C23A048()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25C23A058()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25C23A068()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_25C23A078()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_25C23A088()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_25C23A098()
{
  return MEMORY[0x270EFF8C0]();
}

uint64_t sub_25C23A0A8()
{
  return MEMORY[0x270EFF8C8]();
}

uint64_t sub_25C23A0B8()
{
  return MEMORY[0x270EFF8D0]();
}

uint64_t sub_25C23A0C8()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_25C23A0D8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_25C23A0F8()
{
  return MEMORY[0x270EFFC78]();
}

uint64_t sub_25C23A108()
{
  return MEMORY[0x270EFFC80]();
}

uint64_t sub_25C23A118()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_25C23A128()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_25C23A138()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_25C23A148()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25C23A158()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25C23A168()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_25C23A178()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_25C23A188()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_25C23A198()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_25C23A1A8()
{
  return MEMORY[0x270F00B98]();
}

uint64_t sub_25C23A1B8()
{
  return MEMORY[0x270F00BA0]();
}

uint64_t sub_25C23A1C8()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_25C23A1D8()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_25C23A1E8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25C23A1F8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25C23A208()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25C23A218()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_25C23A228()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_25C23A238()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25C23A248()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_25C23A258()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_25C23A268()
{
  return MEMORY[0x270F02E58]();
}

uint64_t sub_25C23A278()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_25C23A288()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_25C23A298()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_25C23A2A8()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_25C23A2B8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25C23A2C8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25C23A2D8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25C23A2E8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25C23A2F8()
{
  return MEMORY[0x270F03458]();
}

uint64_t sub_25C23A308()
{
  return MEMORY[0x270F034B8]();
}

uint64_t sub_25C23A318()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25C23A328()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_25C23A338()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_25C23A348()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25C23A358()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25C23A368()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_25C23A378()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_25C23A388()
{
  return MEMORY[0x270F04678]();
}

uint64_t sub_25C23A398()
{
  return MEMORY[0x270F04680]();
}

uint64_t sub_25C23A3C8()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_25C23A3E8()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_25C23A408()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25C23A418()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25C23A428()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25C23A438()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25C23A448()
{
  return MEMORY[0x270F049F0]();
}

uint64_t sub_25C23A458()
{
  return MEMORY[0x270F049F8]();
}

uint64_t sub_25C23A468()
{
  return MEMORY[0x270F04A00]();
}

uint64_t sub_25C23A478()
{
  return MEMORY[0x270F04A08]();
}

uint64_t sub_25C23A488()
{
  return MEMORY[0x270F04A10]();
}

uint64_t sub_25C23A498()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_25C23A4A8()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_25C23A4B8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25C23A4C8()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_25C23A4D8()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_25C23A4E8()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_25C23A4F8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25C23A508()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25C23A518()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25C23A528()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25C23A538()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25C23A548()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25C23A558()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25C23A568()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C23A578()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C23A588()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C23A598()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C23A5A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C23A5B8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25C23A5C8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25C23A5D8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25C23A5E8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25C23A5F8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25C23A608()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C23A618()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C23A628()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C23A638()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C23A648()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C23A658()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C23A668()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C23A678()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C23A688()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C23A698()
{
  return MEMORY[0x270F9FC90]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
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