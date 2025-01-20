uint64_t sub_21F18B530()
{
  uint64_t result;
  double v1;
  uint64_t v2;
  uint64_t v3;

  userInterface()();
  sub_21F18B90C();
  sub_21F1C30A0();
  result = sub_21F1C30A0();
  v1 = 20.0;
  if (v3 != v2)
  {
    userInterface()();
    sub_21F1C30A0();
    result = sub_21F1C30A0();
    v1 = 16.0;
  }
  qword_26AD3FDD0 = *(void *)&v1;
  return result;
}

uint64_t *sub_21F18B608()
{
  if (qword_26AD3FDD8 != -1) {
    swift_once();
  }
  return &qword_26AD3FDD0;
}

double static SheetConstants.horizontalSheetPadding.getter()
{
  return sub_21F18B6F0(&qword_26AD3FDD8, (uint64_t)&qword_26AD3FDD0);
}

double sub_21F18B678()
{
  if (qword_26AD3FDD8 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_26AD3FDD0;
  qword_26AD3FDF0 = qword_26AD3FDD0;
  return result;
}

double static SheetConstants.horizontalHeaderPadding.getter()
{
  return sub_21F18B6F0(qword_26AD3FDF8, (uint64_t)&qword_26AD3FDF0);
}

double sub_21F18B6F0(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

void *sub_21F18B72C()
{
  return &unk_21F1C3A38;
}

double static SheetConstants.paymentItemCornerRadius.getter()
{
  return 12.0;
}

void sub_21F18B740()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    char pearlIDCapability = MobileGestalt_get_pearlIDCapability();

    byte_26AD3FDE0 = pearlIDCapability;
  }
  else
  {
    __break(1u);
  }
}

char *sub_21F18B788()
{
  if (qword_26AD3FDE8 != -1) {
    swift_once();
  }
  return &byte_26AD3FDE0;
}

uint64_t static SheetConstants.pearlIsAvailable.getter()
{
  return sub_21F18B8C0(&qword_26AD3FDE8, (unsigned __int8 *)&byte_26AD3FDE0);
}

void sub_21F18B7F8()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    int homeButtonType = MobileGestalt_get_homeButtonType();

    if ((homeButtonType & 0x80000000) == 0)
    {
      byte_267EC45B8 = homeButtonType != 2;
      return;
    }
    __break(1u);
  }
  __break(1u);
}

char *sub_21F18B850()
{
  if (qword_267EC45B0 != -1) {
    swift_once();
  }
  return &byte_267EC45B8;
}

uint64_t static SheetConstants.homeButtonIsAvailable.getter()
{
  return sub_21F18B8C0(&qword_267EC45B0, (unsigned __int8 *)&byte_267EC45B8);
}

uint64_t sub_21F18B8C0(void *a1, unsigned __int8 *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *a2;
}

ValueMetadata *type metadata accessor for SheetConstants()
{
  return &type metadata for SheetConstants;
}

unint64_t sub_21F18B90C()
{
  unint64_t result = qword_26AD3F868;
  if (!qword_26AD3F868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3F868);
  }
  return result;
}

uint64_t sub_21F18B960(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0x6F6C2F726F6C6F63, 0xEA00000000006F67, &qword_267EC45C8);
}

uint64_t static Color.logoColor.getter()
{
  return sub_21F18C5A4(&qword_267EC45C0);
}

uint64_t sub_21F18B9A8(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000018, 0x800000021F1CA250, &qword_267EC45D8);
}

uint64_t *sub_21F18B9CC()
{
  if (qword_267EC45D0 != -1) {
    swift_once();
  }
  return &qword_267EC45D8;
}

uint64_t static Color.itemIconBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC45D0);
}

uint64_t sub_21F18BA3C(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000018, 0x800000021F1CA230, &qword_267EC45E8);
}

uint64_t *sub_21F18BA60()
{
  if (qword_267EC45E0 != -1) {
    swift_once();
  }
  return &qword_267EC45E8;
}

uint64_t static Color.itemIconForeground.getter()
{
  return sub_21F18C5A4(&qword_267EC45E0);
}

uint64_t sub_21F18BAD0(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000017, 0x800000021F1CA210, &qword_26AD409E0);
}

uint64_t static Color.overlayBackground.getter()
{
  return sub_21F18C5A4(&qword_26AD409E8);
}

uint64_t sub_21F18BB18(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000015, 0x800000021F1CA1F0, &qword_267EC45F8);
}

uint64_t *sub_21F18BB3C()
{
  if (qword_267EC45F0 != -1) {
    swift_once();
  }
  return &qword_267EC45F8;
}

uint64_t static Color.sheetBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC45F0);
}

uint64_t sub_21F18BBAC(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD00000000000001CLL, 0x800000021F1CA1D0, &qword_267EC4608);
}

uint64_t static Color.shippingIconBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4600);
}

uint64_t sub_21F18BBF4(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD00000000000001CLL, 0x800000021F1CA1B0, &qword_267EC4618);
}

uint64_t static Color.shippingIconForeground.getter()
{
  return sub_21F18C5A4(&qword_267EC4610);
}

uint64_t sub_21F18BC3C(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD00000000000001ALL, 0x800000021F1CA190, &qword_267EC4628);
}

uint64_t static Color.meCardHomeBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4620);
}

uint64_t sub_21F18BC84(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD00000000000001ALL, 0x800000021F1CA170, &qword_267EC4638);
}

uint64_t static Color.meCardWorkBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4630);
}

uint64_t sub_21F18BCCC(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD00000000000001CLL, 0x800000021F1CA150, &qword_267EC4648);
}

uint64_t static Color.meCardSchoolBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4640);
}

uint64_t sub_21F18BD14(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD00000000000001BLL, 0x800000021F1CA130, &qword_267EC4658);
}

uint64_t static Color.addressIconBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4650);
}

uint64_t sub_21F18BD5C(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000014, 0x800000021F1CA110, &qword_26AD409D0);
}

uint64_t *sub_21F18BD80()
{
  if (qword_26AD409D8 != -1) {
    swift_once();
  }
  return &qword_26AD409D0;
}

uint64_t static Color.itemBackground.getter()
{
  return sub_21F18C5A4(&qword_26AD409D8);
}

uint64_t sub_21F18BDF0(uint64_t a1)
{
  return sub_21F18C23C(a1, &qword_267EC4668);
}

uint64_t static Color.itemBorder.getter()
{
  return sub_21F18C5A4(&qword_267EC4660);
}

uint64_t sub_21F18BE28(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000014, 0x800000021F1CA0F0, &qword_267EC4678);
}

uint64_t static Color.boxBorderColor.getter()
{
  return sub_21F18C5A4(&qword_267EC4670);
}

uint64_t sub_21F18BE70(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000015, 0x800000021F1CA0D0, &qword_267EC4688);
}

uint64_t static Color.itemImageShadow.getter()
{
  return sub_21F18C5A4(&qword_267EC4680);
}

uint64_t sub_21F18BEB8()
{
  uint64_t result = sub_21F1C2E10();
  qword_26AD409B0 = result;
  return result;
}

uint64_t *sub_21F18BED8()
{
  if (qword_26AD409B8 != -1) {
    swift_once();
  }
  return &qword_26AD409B0;
}

uint64_t static Color.primaryText.getter()
{
  return sub_21F18C5A4(&qword_26AD409B8);
}

uint64_t sub_21F18BF48()
{
  uint64_t result = sub_21F1C2E20();
  qword_26AD409C0 = result;
  return result;
}

uint64_t *sub_21F18BF68()
{
  if (qword_26AD409C8 != -1) {
    swift_once();
  }
  return &qword_26AD409C0;
}

uint64_t static Color.secondaryText.getter()
{
  return sub_21F18C5A4(&qword_26AD409C8);
}

uint64_t sub_21F18BFD8(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000015, 0x800000021F1CA0B0, &qword_267EC4698);
}

uint64_t *sub_21F18BFFC()
{
  if (qword_267EC4690 != -1) {
    swift_once();
  }
  return &qword_267EC4698;
}

uint64_t static Color.errorForeground.getter()
{
  return sub_21F18C5A4(&qword_267EC4690);
}

uint64_t sub_21F18C06C(uint64_t a1)
{
  return sub_21F18C4B0(a1, (SEL *)&selRef_tertiarySystemGroupedBackgroundColor, &qword_267EC46A8);
}

uint64_t static Color.appleCashBalanceBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC46A0);
}

uint64_t sub_21F18C0A4(uint64_t a1)
{
  return sub_21F18C4B0(a1, (SEL *)&selRef_tertiarySystemFillColor, &qword_267EC46B8);
}

uint64_t static Color.tertiarySystemFill.getter()
{
  return sub_21F18C5A4(&qword_267EC46B0);
}

uint64_t sub_21F18C0DC(uint64_t a1)
{
  return sub_21F18C4B0(a1, (SEL *)&selRef_systemBackgroundColor, &qword_267EC46C8);
}

uint64_t static Color.systemBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC46C0);
}

uint64_t sub_21F18C114(uint64_t a1)
{
  return sub_21F18C4B0(a1, (SEL *)&selRef_tertiaryLabelColor, &qword_267EC46D8);
}

uint64_t *sub_21F18C128()
{
  if (qword_267EC46D0 != -1) {
    swift_once();
  }
  return &qword_267EC46D8;
}

uint64_t static Color.tertiaryLabel.getter()
{
  return sub_21F18C5A4(&qword_267EC46D0);
}

uint64_t sub_21F18C198(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000027, 0x800000021F1CA080, &qword_267EC46E8);
}

uint64_t static Color.appleCashInsufficientBalanceBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC46E0);
}

uint64_t sub_21F18C1E0(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000017, 0x800000021F1CA060, &qword_267EC46F8);
}

uint64_t static Color.webIconBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC46F0);
}

uint64_t sub_21F18C228(uint64_t a1)
{
  return sub_21F18C23C(a1, &qword_267EC4708);
}

uint64_t sub_21F18C23C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21F1C2DF0();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, void))(v5 + 104))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F1B388]);
  uint64_t result = sub_21F1C2E30();
  *a2 = result;
  return result;
}

uint64_t static Color.bannerBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4700);
}

uint64_t sub_21F18C33C(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000024, 0x800000021F1CA030, &qword_267EC4718);
}

uint64_t static Color.thumbnailPlaceholderBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4710);
}

uint64_t sub_21F18C384(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD000000000000024, 0x800000021F1CA000, &qword_267EC4728);
}

uint64_t static Color.thumbnailPlaceholderForeground.getter()
{
  return sub_21F18C5A4(&qword_267EC4720);
}

uint64_t sub_21F18C3CC(uint64_t a1)
{
  return sub_21F18C3F0(a1, 0xD00000000000001ALL, 0x800000021F1C9FE0, &qword_267EC4738);
}

uint64_t sub_21F18C3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  id v5 = (id)*sub_21F19E688();
  uint64_t result = sub_21F1C2E40();
  *a4 = result;
  return result;
}

uint64_t static Color.deviceIconBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4730);
}

uint64_t sub_21F18C464(uint64_t a1)
{
  return sub_21F18C4B0(a1, (SEL *)&selRef_secondarySystemGroupedBackgroundColor, &qword_267EC4748);
}

uint64_t static Color.secondarySystemGroupedBackground.getter()
{
  return sub_21F18C5A4(&qword_267EC4740);
}

uint64_t sub_21F18C49C(uint64_t a1)
{
  return sub_21F18C4B0(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_26AD409F0);
}

uint64_t sub_21F18C4B0(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4 = [self *a2];
  uint64_t result = MEMORY[0x223C46280](v4);
  *a3 = result;
  return result;
}

uint64_t static Color.secondarySystemBackground.getter()
{
  return sub_21F18C5A4(&qword_26AD409F8);
}

uint64_t sub_21F18C51C()
{
  uint64_t result = sub_21F1C2DE0();
  qword_267EC4758 = result;
  return result;
}

uint64_t static Color.defaultCheckmarkColor.getter()
{
  return sub_21F18C5A4(&qword_267EC4750);
}

uint64_t sub_21F18C560()
{
  uint64_t result = sub_21F1C2DE0();
  qword_267EC4768 = result;
  return result;
}

uint64_t static Color.defaultButtonTitleColor.getter()
{
  return sub_21F18C5A4(&qword_267EC4760);
}

uint64_t sub_21F18C5A4(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t FooterViewType.hash(into:)()
{
  return sub_21F1C3290();
}

BOOL static FooterViewType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FooterViewType.hashValue.getter()
{
  return sub_21F1C32A0();
}

uint64_t sub_21F18C678()
{
  return sub_21F1C32A0();
}

uint64_t sub_21F18C6C0()
{
  return sub_21F1C3290();
}

uint64_t sub_21F18C6EC()
{
  return sub_21F1C32A0();
}

BOOL sub_21F18C730(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t static BaseAuthenticatorModel.defaultHasPearl.getter()
{
  return *sub_21F18B788();
}

uint64_t sub_21F18C760@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18C7B0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 224))(*a1);
}

uint64_t sub_21F18C7F8()
{
  return sub_21F190138();
}

uint64_t sub_21F18C80C()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18C820(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18C8B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 240))();
}

uint64_t sub_21F18C8F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 248))(v6);
}

uint64_t sub_21F18C9E4()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating, &qword_26AD3F928);
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

uint64_t sub_21F18CA3C(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating, &qword_26AD3F928);
}

uint64_t (*sub_21F18CA58(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18CB6C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 264))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18CBC4(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 272))(*a1);
}

uint64_t sub_21F18CC14()
{
  return sub_21F190138();
}

uint64_t sub_21F18CC28()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18CC3C(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18CCC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 288))();
}

uint64_t sub_21F18CD14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 296))(v6);
}

uint64_t sub_21F18CE18()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator, &qword_26AD3F928);
}

uint64_t sub_21F18CE2C(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator, &qword_26AD3F928);
}

uint64_t (*sub_21F18CE48(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18CF58@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 312))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18CFB0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 320))(*a1);
}

uint64_t sub_21F18D000()
{
  return sub_21F190138();
}

uint64_t sub_21F18D014()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18D028(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18D0B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 336))();
}

uint64_t sub_21F18D100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 344))(v6);
}

uint64_t sub_21F18D204()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout, &qword_26AD3F928);
}

uint64_t sub_21F18D218(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout, &qword_26AD3F928);
}

uint64_t (*sub_21F18D234(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18D344@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 360))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18D39C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 368))(*a1);
}

uint64_t sub_21F18D3EC()
{
  return sub_21F190138();
}

uint64_t sub_21F18D400()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18D414(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18D4A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 384))();
}

uint64_t sub_21F18D4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 392))(v6);
}

uint64_t sub_21F18D5F0()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback, &qword_26AD3F928);
}

uint64_t sub_21F18D604(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback, &qword_26AD3F928);
}

uint64_t (*sub_21F18D620(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18D730()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  return swift_release();
}

void *sub_21F18D7A8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 408))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_21F18D80C()
{
  return sub_21F1C2580();
}

uint64_t sub_21F18D880()
{
  return sub_21F1C2580();
}

uint64_t sub_21F18D8F0()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType, &qword_26AD3F8F8);
}

uint64_t sub_21F18D904(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8C0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType, &qword_26AD3F8F8);
}

uint64_t sub_21F18D920@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 456))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18D978(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 464))(*a1);
}

uint64_t sub_21F18D9C8()
{
  return sub_21F190138();
}

uint64_t sub_21F18D9DC()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18D9F0(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18DA7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 480))();
}

uint64_t sub_21F18DAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 488))(v6);
}

uint64_t sub_21F18DBCC()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton, &qword_26AD3F928);
}

uint64_t sub_21F18DBE0(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton, &qword_26AD3F928);
}

uint64_t (*sub_21F18DBFC(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

double sub_21F18DD0C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(**(void **)a1 + 504))(v6);
  uint64_t v3 = v7;
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v5;
  *(void *)(a2 + 32) = v3;
  return result;
}

uint64_t sub_21F18DD78(uint64_t a1, uint64_t *a2)
{
  v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  long long v5 = *(void **)(a1 + 32);
  uint64_t v6 = *a2;
  v9[0] = *(void **)a1;
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  v9[4] = v5;
  uint64_t v7 = *(uint64_t (**)(void **))(*(void *)v6 + 512);
  sub_21F192F28(v9[0], (uint64_t)v2, (uint64_t)v3, (uint64_t)v4);
  return v7(v9);
}

uint64_t sub_21F18DE08()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  return swift_release();
}

uint64_t sub_21F18DE80()
{
  return sub_21F1C2580();
}

uint64_t (*sub_21F18DF0C(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18DF98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 528))();
}

uint64_t sub_21F18DFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3D90);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 536))(v6);
}

uint64_t sub_21F18E0E8()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry, &qword_26AD3F908);
}

uint64_t sub_21F18E0FC(uint64_t a1)
{
  return sub_21F190500(a1, &qword_267EC3D90, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry, &qword_26AD3F908);
}

uint64_t (*sub_21F18E118(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3D90);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F908);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18E228@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 552))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18E280(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 560))(*a1);
}

uint64_t sub_21F18E2D0()
{
  return sub_21F190138();
}

uint64_t sub_21F18E2E4()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18E2F8(void *a1))()
{
  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18E384(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 576))();
}

uint64_t sub_21F18E3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 584))(v6);
}

uint64_t sub_21F18E4D4()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity, &qword_26AD3F928);
}

uint64_t sub_21F18E4E8(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity, &qword_26AD3F928);
}

uint64_t (*sub_21F18E504(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

void *sub_21F18E614@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 600))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_21F18E678(id *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  id v6 = *a1;
  uint64_t v3 = *(uint64_t (**)(id *))(*(void *)v2 + 608);
  id v4 = v6;
  return v3(&v6);
}

uint64_t sub_21F18E6E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  return swift_release();
}

uint64_t sub_21F18E75C(void **a1)
{
  uint64_t v2 = *a1;
  (*(void (**)(id *__return_ptr))(*(void *)v1 + 600))(&v5);
  id v3 = v5;
  if (v5)
  {
    if (!v2) {
      objc_msgSend(v5, sel_resignFirstResponder);
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v2;
  swift_retain();
  return sub_21F1C2580();
}

void (*sub_21F18E81C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  swift_release();
  return sub_21F18E8A8;
}

void sub_21F18E8A8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  id v4 = *(void **)a1;
  if (a2)
  {
    (*(void (**)(id *__return_ptr, void *))(*(void *)v3 + 600))(&v8, v4);
    id v5 = v8;
    if (v8)
    {
      if (!v4) {
        objc_msgSend(v8, sel_resignFirstResponder);
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(a1 + 8) = v4;
    swift_retain();
    sub_21F1C2580();
    id v6 = *(void **)a1;
  }
  else
  {
    (*(void (**)(id *__return_ptr))(*(void *)v3 + 600))(&v8);
    id v7 = v8;
    if (v8)
    {
      if (!v4) {
        objc_msgSend(v8, sel_resignFirstResponder);
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(a1 + 8) = v4;
    swift_retain();
    sub_21F1C2580();
  }
}

uint64_t sub_21F18EA54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 624))();
}

uint64_t sub_21F18EAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3D98);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 632))(v6);
}

uint64_t sub_21F18EBA4()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry, &qword_26AD3F918);
}

uint64_t sub_21F18EBB8(uint64_t a1)
{
  return sub_21F190500(a1, &qword_267EC3D98, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry, &qword_26AD3F918);
}

uint64_t (*sub_21F18EBD4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3D98);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F918);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18ECE4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 648))();
  *a2 = result;
  return result;
}

uint64_t sub_21F18ED38(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 656))(*a1);
}

uint64_t sub_21F18ED88()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21F18EDFC()
{
  return sub_21F1C2580();
}

uint64_t (*sub_21F18EE6C(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18EEF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 672))();
}

uint64_t sub_21F18EF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8D0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 680))(v6);
}

uint64_t sub_21F18F048()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached, &qword_26AD3F930);
}

uint64_t sub_21F18F05C(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8D0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached, &qword_26AD3F930);
}

uint64_t (*sub_21F18F078(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8D0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F930);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18F188@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 696))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18F1E0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 704))(*a1);
}

uint64_t sub_21F18F230()
{
  return sub_21F190138();
}

uint64_t sub_21F18F244()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18F258(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18F2E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 720))();
}

uint64_t sub_21F18F330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 728))(v6);
}

uint64_t sub_21F18F434()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled, &qword_26AD3F928);
}

uint64_t sub_21F18F448(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled, &qword_26AD3F928);
}

uint64_t (*sub_21F18F464(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18F574@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 744))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18F5CC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 752))(*a1);
}

uint64_t sub_21F18F61C()
{
  return sub_21F190138();
}

uint64_t sub_21F18F630()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18F644(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18F6D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 768))();
}

uint64_t sub_21F18F71C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 776))(v6);
}

uint64_t sub_21F18F820()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight, &qword_26AD3F928);
}

uint64_t sub_21F18F834(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight, &qword_26AD3F928);
}

uint64_t (*sub_21F18F850(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F18F960@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 792))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18F9B8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 800))(*a1);
}

uint64_t sub_21F18FA08()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_hasPearl);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21F18FA50(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_hasPearl);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21F18FA9C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21F18FAF8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 816))();
  *a2 = result;
  return result;
}

uint64_t sub_21F18FB4C(unsigned int *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 824))(*a1);
}

uint64_t sub_21F18FB9C()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_physicalButtonEdge);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21F18FBE4(int a1)
{
  uint64_t v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_physicalButtonEdge);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21F18FC30())()
{
  return j__swift_endAccess;
}

uint64_t sub_21F18FC90@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 840))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F18FCE8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 848))(*a1);
}

uint64_t sub_21F18FD38()
{
  return sub_21F190138();
}

uint64_t sub_21F18FD4C()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F18FD60(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F18FDEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 864))();
}

uint64_t sub_21F18FE38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 872))(v6);
}

uint64_t sub_21F18FF3C()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused, &qword_26AD3F928);
}

uint64_t sub_21F18FF50(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused, &qword_26AD3F928);
}

uint64_t (*sub_21F18FF6C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F19007C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 888))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F1900D4(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 896))(*a1);
}

uint64_t sub_21F190124()
{
  return sub_21F190138();
}

uint64_t sub_21F190138()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21F1901A4()
{
  return sub_21F1901B8();
}

uint64_t sub_21F1901B8()
{
  return sub_21F1C2580();
}

uint64_t (*sub_21F190224(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

void sub_21F1902B0(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_21F190318(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 912))();
}

uint64_t sub_21F190364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 920))(v6);
}

uint64_t sub_21F190468()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented, &qword_26AD3F928);
}

uint64_t sub_21F19047C(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_21F1904E4(uint64_t a1)
{
  return sub_21F190500(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented, &qword_26AD3F928);
}

uint64_t sub_21F190500(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_21F1C2550();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_21F190630(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

void sub_21F190740(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_21F1C2550();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_21F1C2550();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t sub_21F1908B0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 936))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F190908(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 944))(*a1);
}

uint64_t sub_21F190958()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_alwaysHidePhysicalButton);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21F1909A0(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_alwaysHidePhysicalButton);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_21F1909EC())()
{
  return j_j__swift_endAccess;
}

uint64_t BaseAuthenticatorModel.__allocating_init(hasPearl:)(unsigned __int8 a1)
{
  uint64_t v2 = swift_allocObject();
  BaseAuthenticatorModel.init(hasPearl:)(a1);
  return v2;
}

uint64_t BaseAuthenticatorModel.init(hasPearl:)(unsigned __int8 a1)
{
  int v45 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F930);
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v2);
  v42 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F918);
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x270FA5388](v4);
  v39 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F908);
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  MEMORY[0x270FA5388](v6);
  v36 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8F8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v17(v16, v15, v12);
  uint64_t v18 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v18, v15, v12);
  uint64_t v19 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v19, v15, v12);
  uint64_t v20 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v20, v15, v12);
  uint64_t v21 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v21, v11, v8);
  uint64_t v22 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v22, v15, v12);
  uint64_t v23 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry;
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F878);
  v24 = v36;
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v23, v24, v38);
  uint64_t v25 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity;
  LOBYTE(v46) = 1;
  sub_21F1C2530();
  v17(v25, v15, v12);
  uint64_t v26 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry;
  *(void *)&long long v46 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F880);
  v27 = v39;
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v26, v27, v41);
  uint64_t v28 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached;
  LOBYTE(v46) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA50);
  v29 = v42;
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v28, v29, v44);
  uint64_t v30 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v30, v15, v12);
  uint64_t v31 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v31, v15, v12);
  *(_DWORD *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_physicalButtonEdge) = 1;
  uint64_t v32 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v32, v15, v12);
  uint64_t v33 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented;
  LOBYTE(v46) = 0;
  sub_21F1C2530();
  v17(v33, v15, v12);
  if (v45 == 2) {
    char v34 = *sub_21F18B788();
  }
  else {
    char v34 = v45 & 1;
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_hasPearl) = v34;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_alwaysHidePhysicalButton) = 0;
  sub_21F1910F8();
  return v1;
}

uint64_t sub_21F1910F8()
{
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8C0);
  MEMORY[0x270FA5388](v33);
  v29 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  uint64_t v2 = MEMORY[0x270FA5388](v32);
  v25[1] = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8D0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8A0);
  MEMORY[0x270FA5388](v26);
  v25[0] = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F890);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v27 = v9;
  uint64_t v28 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8B0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v30 = v13;
  uint64_t v31 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(*(void *)v0 + 672))(v15);
  sub_21F192EE4(&qword_26AD3F8C8, &qword_26AD3F8D0);
  sub_21F1C25A0();
  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 864))(v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 240))(v19);
  (*(void (**)(uint64_t))(*(void *)v0 + 432))(v20);
  sub_21F192EE4(&qword_26AD3F898, &qword_26AD3F8A0);
  sub_21F192EE4(&qword_26AD3F8D8, &qword_26AD3F8E0);
  sub_21F192EE4(&qword_26AD3F8B8, &qword_26AD3F8C0);
  sub_21F1C2510();
  sub_21F192EE4(&qword_26AD3F888, &qword_26AD3F890);
  uint64_t v21 = v27;
  sub_21F1C25A0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v21);
  uint64_t v22 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v0 + 928))(v34);
  sub_21F192EE4(&qword_26AD3F8A8, &qword_26AD3F8B0);
  uint64_t v23 = v30;
  sub_21F1C25B0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v17, v23);
  return v22(v34, 0);
}

unsigned char *sub_21F1916EC@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unsigned char *sub_21F1916F8@<X0>(unsigned char *result@<X0>, char *a2@<X8>)
{
  if (result[2]) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (result[1]) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  if (*result) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t BaseAuthenticatorModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  char v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton, v2);
  uint64_t v6 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F908);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity, v2);
  uint64_t v8 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F918);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F930);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented, v2);
  return v0;
}

uint64_t BaseAuthenticatorModel.__deallocating_deinit()
{
  BaseAuthenticatorModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

unint64_t sub_21F191A1C()
{
  unint64_t result = qword_267EC3DA0;
  if (!qword_267EC3DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3DA0);
  }
  return result;
}

uint64_t sub_21F191A70()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_21F191A7C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BaseAuthenticatorModel();
  uint64_t result = sub_21F1C2520();
  *a1 = result;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FooterViewType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FooterViewType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21F191C28);
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

uint64_t sub_21F191C50(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21F191C5C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FooterViewType()
{
  return &type metadata for FooterViewType;
}

uint64_t sub_21F191C74()
{
  return type metadata accessor for BaseAuthenticatorModel();
}

uint64_t type metadata accessor for BaseAuthenticatorModel()
{
  uint64_t result = qword_26AD406C0;
  if (!qword_26AD406C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21F191CC8()
{
  sub_21F192E98(319, (unint64_t *)&qword_26AD3F2D8, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F)
  {
    sub_21F192E98(319, &qword_26AD3F900, (uint64_t)&type metadata for FooterViewType, MEMORY[0x263EFDE58]);
    if (v1 <= 0x3F)
    {
      sub_21F192E20(319, &qword_26AD3F910, &qword_26AD3F878);
      if (v2 <= 0x3F)
      {
        sub_21F192E20(319, &qword_26AD3F920, &qword_26AD3F880);
        if (v3 <= 0x3F)
        {
          sub_21F192E20(319, (unint64_t *)&unk_26AD3F938, &qword_26AD3FA50);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t method lookup function for BaseAuthenticatorModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BaseAuthenticatorModel);
}

uint64_t dispatch thunk of BaseAuthenticatorModel.authenticating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.authenticating.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.authenticating.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$authenticating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$authenticating.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$authenticating.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.bypassAuthenticator.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.bypassAuthenticator.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.bypassAuthenticator.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$bypassAuthenticator.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$bypassAuthenticator.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$bypassAuthenticator.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isInBioLockout.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isInBioLockout.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isInBioLockout.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isInBioLockout.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isInBioLockout.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isInBioLockout.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disablePasscodeFallback.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disablePasscodeFallback.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disablePasscodeFallback.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disablePasscodeFallback.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disablePasscodeFallback.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disablePasscodeFallback.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.showEnterPasswordButton.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.showEnterPasswordButton.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.showEnterPasswordButton.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$showEnterPasswordButton.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$showEnterPasswordButton.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$showEnterPasswordButton.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.passcodeEntry.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.passcodeEntry.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.passcodeEntry.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$passcodeEntry.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$passcodeEntry.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$passcodeEntry.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disableInteractivity.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disableInteractivity.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disableInteractivity.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disableInteractivity.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 576))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disableInteractivity.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 584))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disableInteractivity.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.externalPasswordEntry.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.externalPasswordEntry.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.externalPasswordEntry.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$externalPasswordEntry.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 624))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$externalPasswordEntry.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$externalPasswordEntry.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 640))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isAuthenticationDetached.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 648))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isAuthenticationDetached.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 656))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isAuthenticationDetached.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isAuthenticationDetached.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 672))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isAuthenticationDetached.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isAuthenticationDetached.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isSheetFullHeightOverrideEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isSheetFullHeightOverrideEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 704))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isSheetFullHeightOverrideEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 712))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isSheetFullHeightOverrideEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 720))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isSheetFullHeightOverrideEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 728))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isSheetFullHeightOverrideEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 736))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.shouldDisplaySheetFullHeight.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 744))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.shouldDisplaySheetFullHeight.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 752))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.shouldDisplaySheetFullHeight.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 760))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$shouldDisplaySheetFullHeight.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 768))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$shouldDisplaySheetFullHeight.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 776))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$shouldDisplaySheetFullHeight.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 784))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.hasPearl.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 792))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.hasPearl.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 800))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.hasPearl.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 808))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.physicalButtonEdge.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 816))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.physicalButtonEdge.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 824))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.physicalButtonEdge.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 832))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isEvaluationPaused.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 840))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isEvaluationPaused.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 848))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isEvaluationPaused.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 856))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isEvaluationPaused.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 864))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isEvaluationPaused.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 872))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isEvaluationPaused.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 880))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isDetachedAuthenticationSheetPresented.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 888))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isDetachedAuthenticationSheetPresented.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 896))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isDetachedAuthenticationSheetPresented.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 904))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isDetachedAuthenticationSheetPresented.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 912))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isDetachedAuthenticationSheetPresented.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 920))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isDetachedAuthenticationSheetPresented.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 928))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.alwaysHidePhysicalButton.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 936))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.alwaysHidePhysicalButton.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 944))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.alwaysHidePhysicalButton.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 952))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.__allocating_init(hasPearl:)()
{
  return (*(uint64_t (**)(void))(v0 + 960))();
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

void sub_21F192E20(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_21F1C2590();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void type metadata accessor for CGRectEdge(uint64_t a1)
{
}

void sub_21F192E98(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_21F192EE4(unint64_t *a1, uint64_t *a2)
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

void *sub_21F192F28(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    id v5 = result;
    swift_retain();
    return (void *)sub_21F192F84(a4);
  }
  return result;
}

uint64_t sub_21F192F84(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t PaymentItemPrimaryLabel.init(title:subtextView:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, void *a4@<X8>)
{
  int v8 = (int *)type metadata accessor for PaymentItemPrimaryLabel();
  uint64_t v9 = (void *)((char *)a4 + v8[10]);
  uint64_t v10 = *sub_21F18BF68();
  uint64_t v11 = MEMORY[0x263F1B420];
  v9[3] = MEMORY[0x263F1B440];
  v9[4] = v11;
  *uint64_t v9 = v10;
  uint64_t v12 = (char *)a4 + v8[11];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = v8[12];
  swift_retain();
  *(void *)((char *)a4 + v13) = *sub_21F1ABB84();
  *a4 = a1;
  a4[1] = a2;
  uint64_t v14 = swift_retain();
  return a3(v14);
}

uint64_t type metadata accessor for PaymentItemPrimaryLabel()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PaymentItemPrimaryLabel.body.getter@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3DA8);
  uint64_t v5 = *(void *)(a1 + 16);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  uint64_t v6 = sub_21F1C2F00();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v17[-v11];
  sub_21F1C2950();
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v18 = v5;
  uint64_t v19 = v13;
  uint64_t v20 = v2;
  sub_21F1C2EF0();
  swift_getWitnessTable();
  uint64_t v14 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16);
  v14(v12, v10, v6);
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  v14(a2, v12, v6);
  return ((uint64_t (*)(unsigned char *, uint64_t))v15)(v12, v6);
}

uint64_t sub_21F193284@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v5 = a1;
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v50 - v11;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3DA8);
  uint64_t v13 = MEMORY[0x270FA5388](v58);
  uint64_t v59 = (uint64_t)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v60 = (uint64_t)v50 - v15;
  uint64_t v16 = (char *)v5[1];
  if (v16)
  {
    uint64_t v17 = *v5;
    uint64_t v18 = type metadata accessor for PaymentItemPrimaryLabel();
    uint64_t v19 = *(int *)(v18 + 40);
    uint64_t v53 = v18;
    uint64_t v51 = *(uint64_t *)((char *)v5 + v19 + 24);
    uint64_t v52 = *(uint64_t *)((char *)v5 + v19 + 32);
    v50[1] = __swift_project_boxed_opaque_existential_1((uint64_t *)((char *)v5 + v19), v51);
    uint64_t v62 = v17;
    v63 = v16;
    sub_21F193DA8();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_21F1C2CB0();
    uint64_t v22 = v21;
    uint64_t v55 = a4;
    v56 = v10;
    char v24 = v23 & 1;
    uint64_t v25 = sub_21F1C2C80();
    v54 = v5;
    uint64_t v26 = v12;
    uint64_t v27 = v25;
    uint64_t v29 = v28;
    uint64_t v57 = v7;
    char v31 = v30 & 1;
    sub_21F193DFC(v20, v22, v24);
    swift_bridgeObjectRelease();
    uint64_t v32 = sub_21F1C2C70();
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    LOBYTE(v22) = v37 & 1;
    uint64_t v38 = v27;
    uint64_t v12 = v26;
    sub_21F193DFC(v38, v29, v31);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v62 = v32;
    v63 = (char *)v34;
    char v64 = v22;
    uint64_t v65 = v36;
    uint64_t v66 = KeyPath;
    char v67 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E90);
    sub_21F1966C4(&qword_267EC3E88, &qword_267EC3E90, &qword_267EC3DF8, &qword_267EC3E00);
    uint64_t v40 = v60;
    uint64_t v7 = v57;
    sub_21F1C2D40();
    uint64_t v41 = v32;
    uint64_t v10 = v56;
    uint64_t v5 = v54;
    sub_21F193DFC(v41, v34, v22);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E70);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v40, 0, 1, v42);
    uint64_t v43 = v53;
  }
  else
  {
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E70);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v60, 1, 1, v44);
    uint64_t v43 = type metadata accessor for PaymentItemPrimaryLabel();
  }
  int v45 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v45(v12, (char *)v5 + *(int *)(v43 + 36), a2);
  uint64_t v47 = v59;
  uint64_t v46 = v60;
  sub_21F196550(v60, v59, &qword_267EC3DA8);
  uint64_t v62 = v47;
  v45(v10, v12, a2);
  v63 = v10;
  v70[0] = v58;
  v70[1] = a2;
  unint64_t v68 = sub_21F1965B4();
  uint64_t v69 = v61;
  sub_21F193734((uint64_t)&v62, 2uLL, (uint64_t)v70);
  uint64_t v48 = *(void (**)(char *, uint64_t))(v7 + 8);
  v48(v12, a2);
  sub_21F196760(v46, &qword_267EC3DA8);
  v48(v10, a2);
  return sub_21F196760(v47, &qword_267EC3DA8);
}

uint64_t sub_21F193728@<X0>(uint64_t a1@<X8>)
{
  return sub_21F193284(*(uint64_t **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_21F193734(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        uint64_t v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_21F1C2FC0();
}

uint64_t sub_21F193900()
{
  return sub_21F1C2D00();
}

uint64_t SubtextView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3DB0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3DB8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = v1[1];
  if (v8)
  {
    uint64_t v37 = *v1;
    uint64_t v38 = v8;
    uint64_t v33 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_21F193DA8();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_21F1C2CB0();
    uint64_t v11 = v10;
    uint64_t v36 = a1;
    char v13 = v12 & 1;
    uint64_t v14 = sub_21F1C2C80();
    uint64_t v34 = v3;
    uint64_t v35 = v6;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v32 = v5;
    char v19 = v18 & 1;
    sub_21F193DFC(v9, v11, v13);
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_21F1C2C60();
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    char v26 = v25 & 1;
    sub_21F193DFC(v15, v17, v19);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = swift_getKeyPath();
    uint64_t v37 = v20;
    uint64_t v38 = v22;
    char v39 = v26;
    uint64_t v40 = v24;
    uint64_t v41 = KeyPath;
    char v42 = 1;
    uint64_t v43 = v28;
    char v44 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3DD0);
    sub_21F193C90();
    uint64_t v29 = (uint64_t)v33;
    sub_21F1C2D40();
    sub_21F193DFC(v20, v22, v26);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_21F196550(v29, (uint64_t)v32, &qword_267EC3DB8);
    swift_storeEnumTagMultiPayload();
    sub_21F193C14();
    sub_21F1C2A50();
    return sub_21F196760(v29, &qword_267EC3DB8);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_21F193C14();
    return sub_21F1C2A50();
  }
}

unint64_t sub_21F193C14()
{
  unint64_t result = qword_267EC3DC0;
  if (!qword_267EC3DC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3DB8);
    sub_21F193C90();
    sub_21F193D50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3DC0);
  }
  return result;
}

unint64_t sub_21F193C90()
{
  unint64_t result = qword_267EC3DC8;
  if (!qword_267EC3DC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3DD0);
    sub_21F1966C4(&qword_267EC3DD8, &qword_267EC3DE0, &qword_267EC3DE8, &qword_267EC3DF0);
    sub_21F192EE4(&qword_267EC3DF8, &qword_267EC3E00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3DC8);
  }
  return result;
}

unint64_t sub_21F193D50()
{
  unint64_t result = qword_267EC3E08;
  if (!qword_267EC3E08)
  {
    sub_21F1C2B40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3E08);
  }
  return result;
}

unint64_t sub_21F193DA8()
{
  unint64_t result = qword_26AD3FA30;
  if (!qword_26AD3FA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3FA30);
  }
  return result;
}

uint64_t sub_21F193DFC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t AttributedSubtextView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3DB0);
  MEMORY[0x270FA5388](v36);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3DB8);
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F1C2450();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v29 - v15;
  sub_21F196550(v1, (uint64_t)v9, &qword_267EC3E10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_21F196760((uint64_t)v9, &qword_267EC3E10);
    swift_storeEnumTagMultiPayload();
    sub_21F193C14();
    return sub_21F1C2A50();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
    uint64_t v18 = sub_21F1C2CA0();
    uint64_t v30 = v18;
    uint64_t v31 = v19;
    uint64_t v21 = v20;
    uint64_t v22 = v19;
    uint64_t v34 = a1;
    char v24 = v23 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v32 = v4;
    uint64_t v26 = KeyPath;
    uint64_t v27 = swift_getKeyPath();
    uint64_t v33 = v5;
    uint64_t v37 = v18;
    uint64_t v38 = v21;
    char v39 = v24;
    uint64_t v40 = v22;
    uint64_t v41 = v26;
    char v42 = 1;
    uint64_t v43 = v27;
    char v44 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3DD0);
    sub_21F193C90();
    uint64_t v28 = (uint64_t)v35;
    sub_21F1C2D40();
    sub_21F193DFC(v30, v21, v24);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_21F196550(v28, (uint64_t)v32, &qword_267EC3DB8);
    swift_storeEnumTagMultiPayload();
    sub_21F193C14();
    sub_21F1C2A50();
    sub_21F196760(v28, &qword_267EC3DB8);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
}

uint64_t PaymentItemPrimaryLabel<>.init(title:text:textColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = *sub_21F18BF68();
  uint64_t v13 = MEMORY[0x263F1B420];
  *(void *)(a6 + 72) = MEMORY[0x263F1B440];
  *(void *)(a6 + 80) = v13;
  *(void *)(a6 + 48) = v12;
  *(void *)(a6 + 88) = 0;
  *(unsigned char *)(a6 + 96) = 1;
  swift_retain();
  *(void *)(a6 + 104) = *sub_21F1ABB84();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  swift_retain();
  uint64_t result = sub_21F1C2BE0();
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  *(void *)(a6 + 40) = result;
  return result;
}

uint64_t PaymentItemPrimaryLabel<>.init(title:attributedText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E18);
  uint64_t v9 = (void *)((char *)a4 + v8[10]);
  uint64_t v10 = *sub_21F18BF68();
  uint64_t v11 = MEMORY[0x263F1B420];
  v9[3] = MEMORY[0x263F1B440];
  v9[4] = v11;
  *uint64_t v9 = v10;
  uint64_t v12 = (char *)a4 + v8[11];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = v8[12];
  swift_retain();
  *(void *)((char *)a4 + v13) = *sub_21F1ABB84();
  *a4 = a1;
  a4[1] = a2;
  sub_21F1948DC(a3, (uint64_t)a4 + v8[9]);
  return swift_retain();
}

uint64_t sub_21F194344@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E18);
  uint64_t v2 = (int *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v43 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v42 = (uint64_t)&v39 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v39 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)((char *)&v39 - v10);
  uint64_t v12 = (char *)&v39 + v2[11] - v10;
  uint64_t v13 = sub_21F1C2450();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  uint64_t v15 = (void *)((char *)v11 + v2[12]);
  uint64_t v16 = sub_21F18BF68();
  uint64_t v17 = *v16;
  uint64_t v18 = MEMORY[0x263F1B420];
  v15[3] = MEMORY[0x263F1B440];
  v15[4] = v18;
  uint64_t *v15 = v17;
  uint64_t v19 = (char *)v11 + v2[13];
  *(void *)uint64_t v19 = 0;
  v19[8] = 1;
  uint64_t v20 = v2[14];
  swift_retain();
  uint64_t v40 = sub_21F1ABB84();
  uint64_t v21 = *v40;
  *(void *)((char *)v11 + v20) = *v40;
  void *v11 = 0;
  v11[1] = 0;
  v14(&v9[v2[11]], 1, 1, v13);
  uint64_t v22 = (uint64_t *)&v9[v2[12]];
  uint64_t v23 = *v16;
  uint64_t v24 = MEMORY[0x263F1B440];
  v22[3] = MEMORY[0x263F1B440];
  uint64_t v25 = MEMORY[0x263F1B420];
  v22[4] = MEMORY[0x263F1B420];
  *uint64_t v22 = v23;
  uint64_t v26 = &v9[v2[13]];
  *(void *)uint64_t v26 = 0;
  v26[8] = 1;
  *(void *)&v9[v2[14]] = v21;
  long long v41 = xmmword_21F1C3F90;
  *(_OWORD *)uint64_t v9 = xmmword_21F1C3F90;
  swift_retain_n();
  swift_retain();
  uint64_t v27 = static Color.primaryText.getter();
  uint64_t v28 = *v16;
  v58[9] = v24;
  v58[10] = v25;
  v58[6] = v28;
  v58[11] = 0;
  char v59 = 1;
  uint64_t v29 = v40;
  uint64_t v60 = *v40;
  v58[0] = 0;
  v58[1] = 0;
  swift_retain();
  swift_retain();
  uint64_t v30 = sub_21F1C2BE0();
  v58[2] = 0xD00000000000001ALL;
  v58[3] = 0x800000021F1CA490;
  v58[4] = v27;
  v58[5] = v30;
  uint64_t v31 = static Color.primaryText.getter();
  uint64_t v32 = *v16;
  uint64_t v53 = v24;
  uint64_t v54 = v25;
  uint64_t v52 = v32;
  uint64_t v55 = 0;
  char v56 = 1;
  uint64_t v57 = *v29;
  long long v47 = v41;
  swift_retain();
  swift_retain();
  uint64_t v33 = sub_21F1C2BE0();
  unint64_t v48 = 0xD000000000000014;
  unint64_t v49 = 0x800000021F1CA4B0;
  uint64_t v50 = v31;
  uint64_t v51 = v33;
  uint64_t v34 = v42;
  sub_21F196550((uint64_t)v11, v42, &qword_267EC3E18);
  uint64_t v35 = v43;
  sub_21F196550((uint64_t)v9, v43, &qword_267EC3E18);
  sub_21F196550((uint64_t)v58, (uint64_t)v46, &qword_267EC3E60);
  sub_21F196550((uint64_t)&v47, (uint64_t)v45, &qword_267EC3E60);
  uint64_t v36 = v44;
  sub_21F196550(v34, v44, &qword_267EC3E18);
  uint64_t v37 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E68);
  sub_21F196550(v35, v36 + v37[12], &qword_267EC3E18);
  sub_21F196550((uint64_t)v46, v36 + v37[16], &qword_267EC3E60);
  sub_21F196550((uint64_t)v45, v36 + v37[20], &qword_267EC3E60);
  sub_21F196760((uint64_t)&v47, &qword_267EC3E60);
  sub_21F196760((uint64_t)v58, &qword_267EC3E60);
  sub_21F196760((uint64_t)v9, &qword_267EC3E18);
  sub_21F196760((uint64_t)v11, &qword_267EC3E18);
  sub_21F196760((uint64_t)v45, &qword_267EC3E60);
  sub_21F196760((uint64_t)v46, &qword_267EC3E60);
  sub_21F196760(v35, &qword_267EC3E18);
  return sub_21F196760(v34, &qword_267EC3E18);
}

uint64_t sub_21F19474C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_21F1C2940();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E20);
  return sub_21F194344(a1 + *(int *)(v2 + 44));
}

uint64_t sub_21F194798(uint64_t a1)
{
  unint64_t v2 = sub_21F1964FC();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_21F1947E4(uint64_t a1)
{
  unint64_t v2 = sub_21F1964FC();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t sub_21F194830@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21F1C2830();
  *a1 = result;
  return result;
}

uint64_t sub_21F19485C()
{
  return sub_21F1C2840();
}

uint64_t sub_21F194884@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21F1C27E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21F1948B4()
{
  return sub_21F1C27F0();
}

uint64_t sub_21F1948DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F194944()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F194988()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1949A4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21F1949C4()
{
  unint64_t result = qword_267EC3E28;
  if (!qword_267EC3E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3E28);
  }
  return result;
}

uint64_t sub_21F194A18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F194A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_21F194A3C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21F194AF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    uint64_t v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    uint64_t v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    unint64_t v15 = (v7 + v12) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v16 = (v7 + v13) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v17 = *(void *)(v16 + 24);
    *(void *)(v15 + 24) = v17;
    *(void *)(v15 + 32) = *(void *)(v16 + 32);
    (**(void (***)(unint64_t, unint64_t))(v17 - 8))(v15, v16);
    unint64_t v18 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v19 = (v16 + 47) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v20 = *(void *)v19;
    *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
    *(void *)unint64_t v18 = v20;
    *(void *)((v15 + 63) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v16 + 63) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_21F194CB8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  __swift_destroy_boxed_opaque_existential_1((*(void *)(v5 + 56) + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  return swift_release();
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

void *sub_21F194DB0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_bridgeObjectRetain();
  v6(v9, v10, v5);
  uint64_t v11 = *(void *)(v7 + 48) + 7;
  unint64_t v12 = (v11 + v9) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v11 + v10) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)(v13 + 24);
  *(void *)(v12 + 24) = v14;
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  (**(void (***)(unint64_t, unint64_t))(v14 - 8))(v12, v13);
  unint64_t v15 = (v12 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v13 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(void *)unint64_t v15 = v17;
  *(void *)((v12 + 63) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v13 + 63) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

void *sub_21F194EE8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40) + 7;
  unint64_t v12 = (uint64_t *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v13 = (uint64_t *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  __swift_assign_boxed_opaque_existential_1(v12, v13);
  unint64_t v14 = ((unint64_t)v12 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = ((unint64_t)v13 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(void *)unint64_t v14 = v16;
  *(void *)(((unint64_t)v12 + 63) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v13 + 63) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
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
          *uint64_t v3 = *a2;
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

_OWORD *sub_21F195224(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32) + 7;
  unint64_t v10 = (v9 + v7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = (v9 + v8) & 0xFFFFFFFFFFFFFFF8;
  long long v12 = *(_OWORD *)v11;
  long long v13 = *(_OWORD *)(v11 + 16);
  *(void *)(v10 + 32) = *(void *)(v11 + 32);
  *(_OWORD *)unint64_t v10 = v12;
  *(_OWORD *)(v10 + 16) = v13;
  unint64_t v14 = (v10 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v11 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(void *)unint64_t v14 = v16;
  *(void *)((v10 + 63) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v11 + 63) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_21F195304(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  uint64_t v12 = *(void *)(v8 + 24) + 7;
  unint64_t v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_1(v13);
  long long v15 = *(_OWORD *)v14;
  long long v16 = *(_OWORD *)(v14 + 16);
  *(void *)(v13 + 32) = *(void *)(v14 + 32);
  *(_OWORD *)unint64_t v13 = v15;
  *(_OWORD *)(v13 + 16) = v16;
  unint64_t v17 = (v13 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v14 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(void *)unint64_t v17 = v19;
  *(void *)((v13 + 63) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v14 + 63) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_21F195404(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7;
  if (v7 < a2)
  {
    unint64_t v9 = ((((v8 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x21F195574);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  uint64_t v18 = ((unint64_t)a1 + v6 + 16) & ~v6;
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))(v18);
  }
  unint64_t v19 = *(void *)(((v8 + v18) & 0xFFFFFFFFFFFFFFF8) + 24);
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

double sub_21F195588(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7;
  unint64_t v11 = ((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v15 = 0;
    int v16 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v11] = 0;
          if (!a2) {
            return result;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v11] = 0;
          if (!a2) {
            return result;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v11] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v20 = (unint64_t)&a1[v9 + 16] & ~v9;
            if (v7 < 0x7FFFFFFF)
            {
              unint64_t v22 = (v10 + v20) & 0xFFFFFFFFFFFFFFF8;
              if ((a2 & 0x80000000) != 0)
              {
                double result = 0.0;
                *(_OWORD *)(v22 + 8) = 0u;
                *(_OWORD *)(v22 + 24) = 0u;
                *(void *)unint64_t v22 = a2 ^ 0x80000000;
              }
              else
              {
                *(void *)(v22 + 24) = a2 - 1;
              }
            }
            else
            {
              uint64_t v21 = *(void (**)(unint64_t))(v6 + 56);
              v21(v20);
            }
          }
          break;
      }
      return result;
    }
  }
  else
  {
    unsigned int v12 = a3 - v8;
    if (((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    int v16 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v17 = v16;
  }
  else {
    int v17 = 1;
  }
  if (((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v18 = ~v8 + a2;
    bzero(a1, ((((v10 + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8) + 8);
    *(_DWORD *)a1 = v18;
  }
  switch(v15)
  {
    case 1:
      a1[v11] = v17;
      break;
    case 2:
      *(_WORD *)&a1[v11] = v17;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x21F1957A0);
    case 4:
      *(_DWORD *)&a1[v11] = v17;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SubtextView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SubtextView()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for SubtextView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SubtextView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for SubtextView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubtextView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SubtextView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubtextView()
{
  return &type metadata for SubtextView;
}

uint64_t *initializeBufferWithCopyOfBuffer for AttributedSubtextView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_21F1C2450();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for AttributedSubtextView(uint64_t a1)
{
  uint64_t v2 = sub_21F1C2450();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for AttributedSubtextView(void *a1, const void *a2)
{
  uint64_t v4 = sub_21F1C2450();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for AttributedSubtextView(void *a1, void *a2)
{
  uint64_t v4 = sub_21F1C2450();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *initializeWithTake for AttributedSubtextView(void *a1, const void *a2)
{
  uint64_t v4 = sub_21F1C2450();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for AttributedSubtextView(void *a1, void *a2)
{
  uint64_t v4 = sub_21F1C2450();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributedSubtextView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21F196160);
}

uint64_t sub_21F196160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AttributedSubtextView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21F1961E4);
}

uint64_t sub_21F1961E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3E10);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AttributedSubtextView()
{
  uint64_t result = qword_267EC4CD0;
  if (!qword_267EC4CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21F1962A4()
{
  sub_21F196330();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_21F196330()
{
  if (!qword_267EC3E30)
  {
    sub_21F1C2450();
    unint64_t v0 = sub_21F1C3130();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267EC3E30);
    }
  }
}

ValueMetadata *type metadata accessor for PaymentItemPrimaryLabel_Previews()
{
  return &type metadata for PaymentItemPrimaryLabel_Previews;
}

uint64_t sub_21F196398()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3DA8);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2F00();
  return swift_getWitnessTable();
}

unint64_t sub_21F196444()
{
  unint64_t result = qword_267EC3E38;
  if (!qword_267EC3E38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3E40);
    sub_21F193C14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3E38);
  }
  return result;
}

uint64_t sub_21F1964C0()
{
  return sub_21F192EE4(&qword_267EC3E48, &qword_267EC3E50);
}

unint64_t sub_21F1964FC()
{
  unint64_t result = qword_267EC3E58;
  if (!qword_267EC3E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3E58);
  }
  return result;
}

uint64_t sub_21F196550(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_21F1965B4()
{
  unint64_t result = qword_267EC3E78;
  if (!qword_267EC3E78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3DA8);
    sub_21F196628();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3E78);
  }
  return result;
}

unint64_t sub_21F196628()
{
  unint64_t result = qword_267EC3E80;
  if (!qword_267EC3E80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3E70);
    sub_21F1966C4(&qword_267EC3E88, &qword_267EC3E90, &qword_267EC3DF8, &qword_267EC3E00);
    sub_21F193D50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3E80);
  }
  return result;
}

uint64_t sub_21F1966C4(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_21F192EE4(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21F196760(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t PhysicalButtonView.init(glyph:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = swift_getKeyPath();
  *(unsigned char *)(a2 + 8) = 0;
  return sub_21F1968F8(a1, a2 + 16);
}

uint64_t sub_21F196884@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.userInterfaceType.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_21F1968C0()
{
  return EnvironmentValues.userInterfaceType.setter();
}

uint64_t sub_21F1968F8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id PhysicalButtonView.makeUIView(context:)()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F52588]), sel_initWithStyle_, 1);
  if (v0)
  {
    uint64_t v1 = v0;
    sub_21F1969BC(v0);
    id v2 = objc_allocWithZone((Class)type metadata accessor for PhysicalButtonContainerView());
    return sub_21F1974E0(v1);
  }
  else
  {
    id result = (id)sub_21F1C31F0();
    __break(1u);
  }
  return result;
}

id sub_21F1969BC(void *a1)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v4 = *v1;
  char v5 = *(unsigned char *)(v2 + 8);
  sub_21F1980F0(v4, v5);
  sub_21F19772C(v4, v5, v23);
  sub_21F198130(v4, v5);
  if (!UserInterfaceType.isPad.getter() || (*sub_21F18B788() & 1) != 0)
  {
    sub_21F197948(v2, (uint64_t)v23);
LABEL_4:
    char v6 = 0;
    goto LABEL_5;
  }
  char v14 = *sub_21F18B850();
  sub_21F197948(v2, (uint64_t)v23);
  if (v14) {
    goto LABEL_4;
  }
  uint64_t v15 = v25;
  uint64_t v16 = v26;
  __swift_project_boxed_opaque_existential_1(v24, v25);
  char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 56))(v15, v16) ^ 1;
LABEL_5:
  sub_21F197958((uint64_t)v23);
  int v7 = (void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 40);
  uint64_t v9 = *(void *)(v2 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), v8);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9) & 1) == 0)
  {
    id v10 = objc_msgSend(a1, sel_setAnimationStyle_, 0);
    if (v6) {
      goto LABEL_9;
    }
LABEL_13:
    uint64_t v17 = *(void *)(v2 + 40);
    uint64_t v18 = *(void *)(v2 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v2 + 16), v17);
    (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
    goto LABEL_14;
  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1, sel_setAnimationStyle_, 1);
    goto LABEL_13;
  }
  id v10 = objc_msgSend(a1, sel_setAnimationStyle_, 2);
LABEL_9:
  uint64_t v11 = nullsub_1(v10);
  unsigned int v12 = (void *)sub_21F1B0448(v11);
  PaymentUIBaseLocalizedString(for:table:bundle:)(0xD000000000000010, 0x800000021F1CA850, v13, v12);

LABEL_14:
  unint64_t v19 = (void *)sub_21F1C3050();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInstruction_, v19);

  uint64_t v21 = *(void *)(v2 + 40);
  uint64_t v20 = *(void *)(v2 + 48);
  __swift_project_boxed_opaque_existential_1(v7, v21);
  return objc_msgSend(a1, sel_setAnimating_, (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 24))(v21, v20) & 1);
}

id sub_21F196C08(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_21F1974E0(a1);
}

uint64_t type metadata accessor for PhysicalButtonContainerView()
{
  return self;
}

uint64_t PhysicalButtonView.updateUIView(_:context:)(char *a1)
{
  uint64_t v3 = sub_21F1C2500();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21F1A1050();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_21F197948(v1, (uint64_t)aBlock);
  uint64_t v8 = sub_21F1C24E0();
  os_log_type_t v9 = sub_21F1C3100();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v25 = a1;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v24 = v3;
    uint64_t v13 = v30;
    uint64_t v12 = v31;
    __swift_project_boxed_opaque_existential_1(v29, v30);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v13, v12)) {
      uint64_t v14 = 2003789907;
    }
    else {
      uint64_t v14 = 1701079368;
    }
    uint64_t v26 = sub_21F197A34(v14, 0xE400000000000000, &v27);
    sub_21F1C3140();
    swift_bridgeObjectRelease();
    sub_21F197958((uint64_t)aBlock);
    _os_log_impl(&dword_21F189000, v8, v9, "Update button view: %s", v11, 0xCu);
    uint64_t v15 = v23;
    swift_arrayDestroy();
    MEMORY[0x223C46D60](v15, -1, -1);
    uint64_t v16 = v11;
    a1 = v25;
    MEMORY[0x223C46D60](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v24);
  }
  else
  {
    sub_21F197958((uint64_t)aBlock);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_21F1969BC(*(void **)&a1[OBJC_IVAR____TtC13PaymentUIBase27PhysicalButtonContainerView_buttonView]);
  uint64_t v17 = self;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_21F1979C8;
  *(void *)(v19 + 24) = v18;
  v29[2] = sub_21F1979F4;
  uint64_t v30 = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  v29[0] = sub_21F197024;
  v29[1] = &block_descriptor;
  uint64_t v20 = _Block_copy(aBlock);
  uint64_t v21 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_performWithoutAnimation_, v20);
  _Block_release(v20);
  LOBYTE(v20) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v20) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21F197024(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t static PhysicalButtonView.physicalButtonEdge()()
{
  LAUIPhysicalButtonNormalizedFrame();
  CGFloat v1 = v0;
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v36 = v4;
  CGFloat rect = v6;
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_mainScreen);
  id v9 = objc_msgSend(v8, sel_coordinateSpace);

  id v10 = objc_msgSend(v7, sel_mainScreen);
  id v11 = objc_msgSend(v10, sel_fixedCoordinateSpace);

  objc_msgSend(v11, sel_bounds);
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;
  double MinX = CGRectGetMinX(v41);
  v42.origin.double x = v1;
  v42.origin.double y = v3;
  v42.size.double width = v5;
  v42.size.double height = rect;
  double v17 = CGRectGetMinX(v42);
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  double v39 = MinX + v17 * CGRectGetWidth(v43);
  v44.origin.double x = x;
  v44.origin.double y = y;
  v44.size.double width = width;
  v44.size.double height = height;
  double MinY = CGRectGetMinY(v44);
  v45.origin.double x = v1;
  CGFloat v35 = v1;
  v45.origin.double y = v3;
  v45.size.double width = v36;
  v45.size.double height = rect;
  double v34 = CGRectGetMinY(v45);
  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  double v38 = MinY + v34 * CGRectGetHeight(v46);
  v47.origin.double x = v1;
  v47.origin.double y = v3;
  v47.size.double width = v36;
  v47.size.double height = rect;
  double v18 = CGRectGetWidth(v47);
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  double v19 = v18 * CGRectGetWidth(v48);
  v49.origin.double x = v35;
  v49.origin.double y = v3;
  v49.size.double width = v36;
  v49.size.double height = rect;
  double v20 = CGRectGetHeight(v49);
  v50.origin.double x = x;
  v50.origin.double y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  objc_msgSend(v9, sel_convertRect_toCoordinateSpace_, v11, v39, v38, v19, v20 * CGRectGetHeight(v50));
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  objc_msgSend(v9, sel_convertRect_fromCoordinateSpace_, v11, x, y, width, height);
  if (v26 <= 0.0)
  {
    double MidY = CGRectGetMidY(*(CGRect *)&v27);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (MidY > v24) {
      return 1;
    }
    else {
      return 3;
    }
  }
  else
  {
    BOOL v31 = CGRectGetMidX(*(CGRect *)&v27) <= v22;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (2 * v31);
  }
}

id sub_21F1972EC()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F52588]), sel_initWithStyle_, 1);
  if (v0)
  {
    CGFloat v1 = v0;
    sub_21F1969BC(v0);
    id v2 = objc_allocWithZone((Class)type metadata accessor for PhysicalButtonContainerView());
    return sub_21F1974E0(v1);
  }
  else
  {
    id result = (id)sub_21F1C31F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_21F1973AC()
{
  return sub_21F1C2990();
}

uint64_t sub_21F1973F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21F198370();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_21F197454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21F198370();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_21F1974B8()
{
}

id sub_21F1974E0(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC13PaymentUIBase27PhysicalButtonContainerView_buttonView] = a1;
  id v2 = a1;
  CGFloat v3 = v1;
  double v4 = (void *)sub_21F1C3050();
  objc_msgSend(v2, sel_setAccessibilityIdentifier_, v4);

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for PhysicalButtonContainerView();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, sel_addSubview_, v2);

  return v5;
}

id PhysicalButtonContainerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void PhysicalButtonContainerView.init(frame:)()
{
}

id PhysicalButtonContainerView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhysicalButtonContainerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21F19772C@<X0>(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = sub_21F1C28A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6);
  id v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *a3 = a1;
  }
  else
  {
    sub_21F1980F0(a1, 0);
    os_log_type_t v11 = sub_21F1C30F0();
    uint64_t v12 = sub_21F1C2B50();
    os_log_type_t v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v17[1] = a3;
      uint64_t v16 = v15;
      uint64_t v18 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      v17[2] = sub_21F197A34(0xD000000000000011, 0x800000021F1CA870, &v18);
      sub_21F1C3140();
      _os_log_impl(&dword_21F189000, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C46D60](v16, -1, -1);
      MEMORY[0x223C46D60](v14, -1, -1);
    }

    sub_21F1C2890();
    swift_getAtKeyPath();
    sub_21F198130(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_21F197948(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for PhysicalButtonView(a2, a1);
}

uint64_t sub_21F197958(uint64_t a1)
{
  return a1;
}

uint64_t sub_21F197990()
{
  return swift_deallocObject();
}

id sub_21F1979C8()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC13PaymentUIBase27PhysicalButtonContainerView_buttonView), sel_updateFrame);
}

uint64_t sub_21F1979E4()
{
  return swift_deallocObject();
}

uint64_t sub_21F1979F4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_21F197A34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21F197B08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21F1983C4((uint64_t)v12, *a3);
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
      sub_21F1983C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21F197B08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21F1C3150();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21F197CC4(a5, a6);
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
  uint64_t v8 = sub_21F1C31A0();
  if (!v8)
  {
    sub_21F1C31E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21F1C3240();
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

uint64_t sub_21F197CC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21F197D5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21F197F3C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21F197F3C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21F197D5C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21F197ED4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21F1C3180();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21F1C31E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21F1C3080();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21F1C3240();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21F1C31E0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21F197ED4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3EB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21F197F3C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3EB0);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_21F1C3240();
  __break(1u);
  return result;
}

unint64_t sub_21F198090()
{
  unint64_t result = qword_267EC3EA0;
  if (!qword_267EC3EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3EA0);
  }
  return result;
}

uint64_t sub_21F1980E4()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_21F1980F0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for PhysicalButtonView(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t sub_21F198130(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for PhysicalButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_21F1980F0(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  return a1;
}

uint64_t assignWithCopy for PhysicalButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_21F1980F0(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_21F198130(v6, v7);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
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

uint64_t assignWithTake for PhysicalButtonView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_21F198130(v6, v7);
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v8 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 32) = v8;
  *(void *)(a1 + 48) = a2[6];
  return a1;
}

uint64_t getEnumTagSinglePayload for PhysicalButtonView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhysicalButtonView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhysicalButtonView()
{
  return &type metadata for PhysicalButtonView;
}

uint64_t method lookup function for PhysicalButtonContainerView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhysicalButtonContainerView);
}

unint64_t sub_21F198370()
{
  unint64_t result = qword_267EC3EA8;
  if (!qword_267EC3EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3EA8);
  }
  return result;
}

uint64_t sub_21F1983C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL static ChevronStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ChevronStyle.hash(into:)()
{
  return sub_21F1C3290();
}

uint64_t ChevronStyle.hashValue.getter()
{
  return sub_21F1C32A0();
}

void ChevronView.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ChevronView.init(style:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  uint64_t result = swift_getKeyPath();
  *(unsigned char *)a2 = v3;
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_21F1984F4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_21F1C2780();
  *a1 = v3;
  return result;
}

uint64_t ChevronView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3EB8);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  char v5 = (uint64_t *)&v44[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_21F1C2E60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3EC0);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (uint64_t *)&v44[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3EC8);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  CGRect v46 = &v44[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3ED0);
  MEMORY[0x270FA5388](v49);
  uint64_t v52 = &v44[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3ED8);
  MEMORY[0x270FA5388](v50);
  uint64_t v51 = &v44[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v45 = *v1;
  uint64_t v48 = *((void *)v1 + 1);
  int v47 = v1[16];
  uint64_t v19 = sub_21F1C2E50();
  (*(void (**)(unsigned char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B538], v6);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, unsigned char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  *char v5 = KeyPath;
  sub_21F196550((uint64_t)v5, (uint64_t)v13 + *(int *)(v11 + 44), &qword_267EC3EB8);
  *os_log_type_t v13 = v19;
  swift_retain();
  sub_21F196760((uint64_t)v5, &qword_267EC3EB8);
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v21 = (uint64_t)v46;
  swift_release();
  sub_21F1C2BE0();
  sub_21F1C2C10();
  uint64_t v22 = sub_21F1C2C30();
  swift_release();
  uint64_t v23 = swift_getKeyPath();
  sub_21F196550((uint64_t)v13, v21, &qword_267EC3EC0);
  double v24 = (uint64_t *)(v21 + *(int *)(v15 + 44));
  uint64_t *v24 = v23;
  v24[1] = v22;
  sub_21F196760((uint64_t)v13, &qword_267EC3EC0);
  if (v45 == 3)
  {
    uint64_t v26 = v48;
    char v27 = v47;
    sub_21F1980F0(v48, v47);
    uint64_t v28 = sub_21F18BFFC();
LABEL_6:
    uint64_t v25 = *v28;
    swift_retain();
    sub_21F198130(v26, v27);
    goto LABEL_7;
  }
  if (v45 != 2)
  {
    uint64_t v26 = v48;
    char v27 = v47;
    sub_21F1980F0(v48, v47);
    uint64_t v28 = sub_21F18C128();
    goto LABEL_6;
  }
  uint64_t v25 = sub_21F1C2DE0();
  uint64_t v26 = v48;
  char v27 = v47;
LABEL_7:
  uint64_t v29 = swift_getKeyPath();
  uint64_t v30 = v52;
  sub_21F196550(v21, (uint64_t)v52, &qword_267EC3EC8);
  BOOL v31 = (uint64_t *)&v30[*(int *)(v49 + 36)];
  *BOOL v31 = v29;
  v31[1] = v25;
  sub_21F196760(v21, &qword_267EC3EC8);
  char v32 = sub_21F1C2B90();
  sub_21F1980F0(v26, v27);
  sub_21F198C7C(v26, v27);
  sub_21F198130(v26, v27);
  sub_21F1C25C0();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  CGRect v41 = v51;
  sub_21F196550((uint64_t)v30, (uint64_t)v51, &qword_267EC3ED0);
  CGRect v42 = &v41[*(int *)(v50 + 36)];
  unsigned char *v42 = v32;
  *((void *)v42 + 1) = v34;
  *((void *)v42 + 2) = v36;
  *((void *)v42 + 3) = v38;
  *((void *)v42 + 4) = v40;
  v42[40] = 0;
  sub_21F196760((uint64_t)v30, &qword_267EC3ED0);
  return sub_21F198FF8((uint64_t)v41, v53);
}

uint64_t sub_21F198A30@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v3 = swift_getKeyPath();
  uint64_t v4 = swift_getKeyPath();
  uint64_t v5 = swift_getKeyPath();
  *(unsigned char *)a1 = 2;
  *(void *)(a1 + 8) = KeyPath;
  *(unsigned char *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 3;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = v5;
  *(unsigned char *)(a1 + 88) = 0;
  sub_21F1980F0(KeyPath, 0);
  sub_21F1980F0(v3, 0);
  sub_21F1980F0(v4, 0);
  sub_21F1980F0(v5, 0);
  sub_21F198130(v5, 0);
  sub_21F198130(v4, 0);
  sub_21F198130(v3, 0);
  return sub_21F198130(KeyPath, 0);
}

uint64_t sub_21F198B40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21F1C2940();
  sub_21F198A30((uint64_t)v15);
  char v3 = v15[0];
  uint64_t v4 = v16;
  char v5 = v17;
  char v6 = v18;
  uint64_t v7 = v19;
  char v8 = v20;
  char v9 = v21;
  uint64_t v10 = v22;
  char v11 = v23;
  char v12 = v24;
  uint64_t result = v25;
  char v14 = v26;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(unsigned char *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  *(unsigned char *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 88) = v11;
  *(unsigned char *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = result;
  *(unsigned char *)(a1 + 112) = v14;
  return result;
}

uint64_t sub_21F198BE4(uint64_t a1)
{
  unint64_t v2 = sub_21F199740();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_21F198C30(uint64_t a1)
{
  unint64_t v2 = sub_21F199740();
  return MEMORY[0x270F001F8](a1, v2);
}

double sub_21F198C7C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_21F1C28A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_21F1C30F0();
  char v9 = sub_21F1C2B50();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    double v14 = *(double *)&v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_21F197A34(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_21F189000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C46D60](v11, -1, -1);
    MEMORY[0x223C46D60](v10, -1, -1);
  }

  sub_21F1C2890();
  swift_getAtKeyPath();
  sub_21F198130(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_21F198E5C()
{
  return sub_21F1C2750();
}

uint64_t sub_21F198E80(uint64_t a1)
{
  uint64_t v2 = sub_21F1C2E60();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21F1C2760();
}

uint64_t sub_21F198F48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21F1C2850();
  *a1 = result;
  return result;
}

uint64_t sub_21F198F74()
{
  return sub_21F1C2860();
}

uint64_t sub_21F198FA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21F1C27B0();
  *a1 = result;
  return result;
}

uint64_t sub_21F198FCC()
{
  return sub_21F1C27C0();
}

uint64_t sub_21F198FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F199064()
{
  unint64_t result = qword_267EC3EE0;
  if (!qword_267EC3EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3EE0);
  }
  return result;
}

uint64_t sub_21F1990B8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21F1990D8()
{
  unint64_t result = qword_267EC3EE8;
  if (!qword_267EC3EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3EE8);
  }
  return result;
}

uint64_t sub_21F19912C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for ChevronStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ChevronStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21F1992A4);
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

ValueMetadata *type metadata accessor for ChevronStyle()
{
  return &type metadata for ChevronStyle;
}

uint64_t destroy for ChevronView(uint64_t a1)
{
  return sub_21F198130(*(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s13PaymentUIBase11ChevronViewVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 16);
  sub_21F1980F0(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ChevronView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 16);
  sub_21F1980F0(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  sub_21F198130(v5, v6);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ChevronView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  sub_21F198130(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChevronView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ChevronView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for ChevronView()
{
  return &type metadata for ChevronView;
}

ValueMetadata *type metadata accessor for PaymentItemChevron_Previews()
{
  return &type metadata for PaymentItemChevron_Previews;
}

unint64_t sub_21F1994A8()
{
  unint64_t result = qword_267EC3EF0;
  if (!qword_267EC3EF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3ED8);
    sub_21F199524();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3EF0);
  }
  return result;
}

unint64_t sub_21F199524()
{
  unint64_t result = qword_267EC3EF8;
  if (!qword_267EC3EF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3ED0);
    sub_21F1995C4();
    sub_21F192EE4(&qword_267EC3F28, &qword_267EC3F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3EF8);
  }
  return result;
}

unint64_t sub_21F1995C4()
{
  unint64_t result = qword_267EC3F00;
  if (!qword_267EC3F00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3EC8);
    sub_21F199664();
    sub_21F192EE4(&qword_267EC3F18, &qword_267EC3F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3F00);
  }
  return result;
}

unint64_t sub_21F199664()
{
  unint64_t result = qword_267EC3F08;
  if (!qword_267EC3F08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC3EC0);
    sub_21F192EE4(&qword_267EC3F10, &qword_267EC3EB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3F08);
  }
  return result;
}

uint64_t sub_21F199704()
{
  return sub_21F192EE4(&qword_267EC3F38, &qword_267EC3F40);
}

unint64_t sub_21F199740()
{
  unint64_t result = qword_267EC3F48;
  if (!qword_267EC3F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC3F48);
  }
  return result;
}

uint64_t AuthorizationViewHostingControllerContext.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AuthorizationViewHostingControllerContext.init()();
  return v0;
}

uint64_t AuthorizationViewHostingControllerContext.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F960);
  uint64_t v27 = *(void *)(v1 - 8);
  uint64_t v28 = v1;
  MEMORY[0x270FA5388](v1);
  char v26 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F948);
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F980);
  uint64_t v6 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  LOBYTE(v29) = 0;
  sub_21F1C2530();
  double v14 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
  v14(v13, v12, v9);
  uint64_t v15 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable;
  LOBYTE(v29) = 1;
  sub_21F1C2530();
  v14(v15, v12, v9);
  uint64_t v16 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  uint64_t v29 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3FA70);
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v16, v8, v23);
  uint64_t v17 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  LODWORD(v29) = 1;
  type metadata accessor for CGRectEdge(0);
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v17, v5, v25);
  uint64_t v18 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating;
  LOBYTE(v29) = 0;
  sub_21F1C2530();
  v14(v18, v12, v9);
  uint64_t v19 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  uint64_t v29 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA68);
  char v20 = v26;
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v19, v20, v28);
  *(void *)(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext_animationDuration) = 0x3FD3333333333333;
  *(void *)(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext_springAnimationDuration) = 0x3FE199999999999ALL;
  return v0;
}

uint64_t sub_21F199BC0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F199C10(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 160))(*a1);
}

uint64_t sub_21F199C58()
{
  return sub_21F190138();
}

uint64_t sub_21F199C6C()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F199C80(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F199D0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 176))();
}

uint64_t sub_21F199D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 184))(v6);
}

uint64_t sub_21F199E40()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented, &qword_26AD3F928);
}

uint64_t sub_21F199E54(uint64_t a1)
{
  return sub_21F19B384(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented, &qword_26AD3F928);
}

uint64_t (*sub_21F199E70(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F199F80@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F199FD0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 208))(*a1);
}

uint64_t sub_21F19A018()
{
  return sub_21F190138();
}

uint64_t sub_21F19A02C()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F19A040(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F19A0CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 224))();
}

uint64_t sub_21F19A110(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 232))(v6);
}

uint64_t sub_21F19A200()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, &qword_26AD3F928);
}

uint64_t sub_21F19A214(uint64_t a1)
{
  return sub_21F19B384(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, &qword_26AD3F928);
}

uint64_t (*sub_21F19A230(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F19A340@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 248))();
  *a2 = result;
  return result;
}

uint64_t sub_21F19A38C(id *a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))(**(void **)a2 + 256);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_21F19A3F0()
{
  return sub_21F19B08C();
}

uint64_t sub_21F19A404()
{
  return sub_21F19B10C();
}

uint64_t (*sub_21F19A418(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F19A4A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 272))();
}

uint64_t sub_21F19A4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3F58);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 280))(v6);
}

uint64_t sub_21F19A5F4()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError, (uint64_t *)&unk_26AD3F980);
}

uint64_t sub_21F19A608(uint64_t a1)
{
  return sub_21F19B384(a1, &qword_267EC3F58, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError, (uint64_t *)&unk_26AD3F980);
}

uint64_t (*sub_21F19A624(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3F58);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F980);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F19A734@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 296))();
  *a2 = result;
  return result;
}

uint64_t sub_21F19A788(unsigned int *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 304))(*a1);
}

uint64_t sub_21F19A7D8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21F19A84C()
{
  return sub_21F1C2580();
}

uint64_t (*sub_21F19A8BC(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F19A948(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 320))();
}

uint64_t sub_21F19A994(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3F60);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 328))(v6);
}

uint64_t sub_21F19AA98()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge, (uint64_t *)&unk_26AD3F948);
}

uint64_t sub_21F19AAAC(uint64_t a1)
{
  return sub_21F19B384(a1, &qword_267EC3F60, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge, (uint64_t *)&unk_26AD3F948);
}

uint64_t (*sub_21F19AAC8(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC3F60);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F948);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F19ABD8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 344))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F19AC30(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 352))(*a1);
}

uint64_t sub_21F19AC80()
{
  return sub_21F190138();
}

uint64_t sub_21F19AC94()
{
  return sub_21F1901B8();
}

uint64_t (*sub_21F19ACA8(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F19AD34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 368))();
}

uint64_t sub_21F19AD80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 376))(v6);
}

uint64_t sub_21F19AE84()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, &qword_26AD3F928);
}

uint64_t sub_21F19AE98(uint64_t a1)
{
  return sub_21F19B384(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, &qword_26AD3F928);
}

uint64_t (*sub_21F19AEB4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F19AFC4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 392))();
  *a2 = result;
  return result;
}

uint64_t sub_21F19B018(id *a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))(**(void **)a2 + 400);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_21F19B078()
{
  return sub_21F19B08C();
}

uint64_t sub_21F19B08C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21F19B0F8()
{
  return sub_21F19B10C();
}

uint64_t sub_21F19B10C()
{
  return sub_21F1C2580();
}

uint64_t (*sub_21F19B178(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F19B204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 416))();
}

uint64_t sub_21F19B250(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EC3F68);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 424))(v6);
}

uint64_t sub_21F19B354()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen, (uint64_t *)&unk_26AD3F960);
}

uint64_t sub_21F19B368(uint64_t a1)
{
  return sub_21F19B384(a1, (uint64_t *)&unk_267EC3F68, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen, (uint64_t *)&unk_26AD3F960);
}

uint64_t sub_21F19B384(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_21F1C2550();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_21F19B4B4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EC3F68);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F960);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

double AuthorizationViewHostingControllerContext.animationDuration.getter()
{
  return 0.3;
}

double AuthorizationViewHostingControllerContext.springAnimationDuration.getter()
{
  return 0.55;
}

uint64_t AuthorizationViewHostingControllerContext.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F980);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F948);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, v2);
  uint64_t v8 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F960);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return v0;
}

uint64_t AuthorizationViewHostingControllerContext.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F980);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F948);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, v2);
  uint64_t v8 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD3F960);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v11 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v10, v11);
}

uint64_t sub_21F19B934@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AuthorizationViewHostingControllerContext();
  uint64_t result = sub_21F1C2520();
  *a1 = result;
  return result;
}

id AuthorizationViewHostingController.__allocating_init(rootView:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_allocWithZone(v2);
  id v7 = sub_21F19D130(a1, a2);
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v3
                                                          + class metadata base offset for AuthorizationViewHostingController)
                                              - 8)
                                  + 8))(a1);
  return v7;
}

id AuthorizationViewHostingController.init(rootView:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x263F8EED0] & *v2;
  id v5 = sub_21F19D130(a1, a2);
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v4
                                                          + class metadata base offset for AuthorizationViewHostingController)
                                              - 8)
                                  + 8))(a1);
  return v5;
}

void sub_21F19BAB4(void *a1)
{
  userInterface()();
  sub_21F1C31F0();
  __break(1u);
}

void sub_21F19BB64(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_21F19BB80(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_21F19BBB4();

  return v2;
}

uint64_t sub_21F19BBB4()
{
  if (UserInterfaceType.isPad.getter()) {
    return 30;
  }
  else {
    return 2;
  }
}

uint64_t sub_21F19BC3C()
{
  return 1;
}

void sub_21F19BC44()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for AuthorizationViewHostingController();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);
  }
  else
  {
    __break(1u);
  }
}

void sub_21F19BD2C(void *a1)
{
  id v1 = a1;
  sub_21F19BC44();
}

id sub_21F19BD74(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)((char *)v1
                 + *(void *)(class metadata base offset for AuthorizationViewHostingController
                             + (*MEMORY[0x263F8EED0] & *v1)
                             + 24));
  id result = objc_msgSend(v2, sel_view);
  if (result)
  {
    id v6 = result;
    id v7 = objc_msgSend(result, sel_window);

    if (v7)
    {
      id v8 = objc_msgSend(v7, sel_screen);
    }
    else
    {
      id v8 = 0;
    }
    (*(void (**)(id))(*(void *)v4 + 400))(v8);
    uint64_t v9 = static PhysicalButtonView.physicalButtonEdge()();
    (*(void (**)(uint64_t))(*(void *)v4 + 304))(v9);
    v10.receiver = v2;
    v10.super_class = (Class)type metadata accessor for AuthorizationViewHostingController();
    return objc_msgSendSuper2(&v10, sel_viewDidAppear_, a1 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21F19BF08(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_21F19BD74(a3);
}

id sub_21F19BF5C(void *a1, double a2, double a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  aBlock[4] = sub_21F19D330;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_21F19C0C4;
  aBlock[3] = &block_descriptor_0;
  id v8 = _Block_copy(aBlock);
  id v9 = v3;
  swift_release();
  objc_msgSend(a1, sel_animateAlongsideTransition_completion_, 0, v8);
  _Block_release(v8);
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for AuthorizationViewHostingController();
  return objc_msgSendSuper2(&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, a1, a2, a3);
}

uint64_t sub_21F19C0C4(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_21F19C124(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  swift_unknownObjectRetain();
  id v9 = a1;
  sub_21F19BF5C(a5, a2, a3);
  swift_unknownObjectRelease();
}

uint64_t sub_21F19C1A4()
{
  sub_21F19D3EC(0);
  return swift_unknownObjectRetain();
}

void *sub_21F19C1D0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  id v6 = sub_21F19D3EC(0);
  swift_unknownObjectRetain();

  return v6;
}

uint64_t sub_21F19C234()
{
  sub_21F19D3EC(1);
  return swift_unknownObjectRetain();
}

void *sub_21F19C260(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a1;
  char v12 = sub_21F19D3EC(1);
  swift_unknownObjectRetain();

  return v12;
}

double sub_21F19C2EC()
{
  return 0.3;
}

double sub_21F19C2FC()
{
  return 0.3;
}

id sub_21F19C30C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v76 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v4 = sub_21F1C2500();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_21F1C2FE0();
  v73 = *(void (**)(char *, uint64_t))(v79 - 8);
  MEMORY[0x270FA5388](v79);
  v77 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_21F1C3000();
  v74 = *(void (**)(char *, uint64_t))(v82 - 8);
  MEMORY[0x270FA5388](v82);
  v78 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_21F1C2FD0();
  uint64_t v10 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  char v12 = (uint64_t *)((char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_21F1C3020();
  uint64_t v72 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v75 = (char *)&v59 - v17;
  id v83 = objc_msgSend(a1, sel_containerView);
  id v18 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x263F83C10]);
  if (v18)
  {
    id v80 = v18;
    id v19 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x263F83C00]);
    if (v19)
    {
      char v20 = v19;
      char v21 = (*(uint64_t (**)(void))(**(void **)((char *)v2
                                               + *(void *)(class metadata base offset for AuthorizationViewHostingController
                                                           + (*MEMORY[0x263F8EED0] & *v2)
                                                           + 24))
                                 + 152))();
      uint64_t v22 = MEMORY[0x263F8EE78];
      v70 = v2;
      id v71 = v20;
      uint64_t v69 = v13;
      if (v21)
      {
        id v23 = v80;
        id result = objc_msgSend(v80, sel_view);
        if (result)
        {
          uint64_t v25 = result;
          id v26 = v83;
          objc_msgSend(v83, sel_bounds);
          objc_msgSend(v25, sel_setFrame_);

          id result = objc_msgSend(v23, sel_view);
          if (result)
          {
            uint64_t v27 = result;
            objc_msgSend(v26, sel_addSubview_, result);

            unint64_t v68 = sub_21F19D4BC();
            uint64_t v62 = sub_21F1C3120();
            sub_21F1C3010();
            *char v12 = 300;
            unsigned int v28 = *MEMORY[0x263F8F000];
            uint64_t v29 = *(void (**)(void))(v10 + 104);
            unint64_t v65 = (v10 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
            unsigned int v67 = v28;
            uint64_t v30 = v81;
            uint64_t v66 = (void (*)(void *, void, uint64_t))v29;
            v29(v12);
            BOOL v31 = v75;
            MEMORY[0x223C464E0](v16, v12);
            char v32 = *(void (**)(void *, uint64_t))(v10 + 8);
            uint64_t v63 = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
            char v64 = v32;
            v32(v12, v30);
            uint64_t v60 = *(void (**)(char *, uint64_t))(v72 + 8);
            uint64_t v72 = (v72 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
            v60(v16, v13);
            uint64_t v33 = swift_allocObject();
            *(void *)(v33 + 16) = a1;
            v88 = sub_21F19D7FC;
            v89 = (void *)v33;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v85 = 1107296256;
            v86 = sub_21F19CE80;
            v87 = &block_descriptor_47;
            uint64_t v34 = _Block_copy(&aBlock);
            swift_unknownObjectRetain();
            swift_release();
            uint64_t v35 = v78;
            sub_21F1C2FF0();
            uint64_t aBlock = MEMORY[0x263F8EE78];
LABEL_12:
            sub_21F19D5B8();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA40);
            sub_21F19D610();
            CGRect v46 = v77;
            uint64_t v47 = v79;
            sub_21F1C3160();
            uint64_t v48 = (void *)v62;
            MEMORY[0x223C465C0](v31, v35, v46, v34);
            _Block_release(v34);

            uint64_t v49 = (void (*)(char *, uint64_t))*((void *)v73 + 1);
            uint64_t v62 = ((unint64_t)v73 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
            v73 = v49;
            v49(v46, v47);
            uint64_t v50 = (void (*)(char *, uint64_t))*((void *)v74 + 1);
            uint64_t v61 = ((unint64_t)v74 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
            v74 = v50;
            v50(v35, v82);
            uint64_t v51 = v69;
            uint64_t v52 = v60;
            ((void (*)(char *))v60)(v31);
            sub_21F19D4BC();
            uint64_t v79 = sub_21F1C3120();
            sub_21F1C3010();
            *char v12 = 550;
            uint64_t v53 = v81;
            v66(v12, v67, v81);
            MEMORY[0x223C464E0](v16, v12);
            v64(v12, v53);
            v52(v16, v51);
            uint64_t v54 = swift_allocObject();
            swift_unknownObjectWeakInit();
            uint64_t v55 = (void *)swift_allocObject();
            uint64_t v56 = v76 + class metadata base offset for AuthorizationViewHostingController;
            v55[2] = *(void *)(v76 + class metadata base offset for AuthorizationViewHostingController);
            v55[3] = *(void *)(v56 + 8);
            v55[4] = v54;
            v88 = sub_21F19D6DC;
            v89 = v55;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v85 = 1107296256;
            v86 = sub_21F19CE80;
            v87 = &block_descriptor_41;
            uint64_t v57 = _Block_copy(&aBlock);
            swift_release();
            sub_21F1C2FF0();
            uint64_t aBlock = MEMORY[0x263F8EE78];
            sub_21F19D5B8();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA40);
            sub_21F19D610();
            sub_21F1C3160();
            uint64_t v58 = (void *)v79;
            MEMORY[0x223C465C0](v31, v35, v46, v57);

            _Block_release(v57);
            v73(v46, v47);
            v74(v35, v82);
            return (id)((uint64_t (*)(char *, uint64_t))v52)(v31, v51);
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        return result;
      }
      unint64_t v68 = sub_21F19D4BC();
      uint64_t v62 = sub_21F1C3120();
      sub_21F1C3010();
      *char v12 = 300;
      unsigned int v40 = *MEMORY[0x263F8F000];
      CGRect v41 = *(void (**)(void))(v10 + 104);
      unint64_t v65 = (v10 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
      unsigned int v67 = v40;
      uint64_t v42 = v81;
      uint64_t v66 = (void (*)(void *, void, uint64_t))v41;
      v41(v12);
      BOOL v31 = v75;
      MEMORY[0x223C464E0](v16, v12);
      CGRect v43 = *(void (**)(void *, uint64_t))(v10 + 8);
      uint64_t v63 = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      char v64 = v43;
      v43(v12, v42);
      uint64_t v60 = *(void (**)(char *, uint64_t))(v72 + 8);
      uint64_t v72 = (v72 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v60(v16, v13);
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = a1;
      *(void *)(v44 + 24) = v20;
      v88 = sub_21F19D53C;
      v89 = (void *)v44;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v85 = 1107296256;
      v86 = sub_21F19CE80;
      v87 = &block_descriptor_32;
      uint64_t v34 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      id v45 = v20;
      swift_release();
      uint64_t v35 = v78;
      sub_21F1C2FF0();
      uint64_t aBlock = v22;
      goto LABEL_12;
    }
  }
  uint64_t v36 = sub_21F1A1050();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v36, v4);
  uint64_t v37 = sub_21F1C24E0();
  os_log_type_t v38 = sub_21F1C30E0();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl(&dword_21F189000, v37, v38, "No transitioning view controllers were found", v39, 2u);
    MEMORY[0x223C46D60](v39, -1, -1);
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_21F19CE80(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21F19CEC4(void *a1, uint64_t a2, void *a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  sub_21F19C30C(a3);
  swift_unknownObjectRelease();
}

void AuthorizationViewHostingController.__allocating_init(rootView:)()
{
}

void AuthorizationViewHostingController.init(rootView:)()
{
}

void AuthorizationViewHostingController.__allocating_init(coder:rootView:)()
{
}

void AuthorizationViewHostingController.init(coder:rootView:)()
{
}

uint64_t sub_21F19D01C()
{
  return swift_release();
}

id AuthorizationViewHostingController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthorizationViewHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21F19D0E4()
{
  return swift_release();
}

id sub_21F19D130(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)MEMORY[0x263F8EED0];
  uint64_t v6 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + class metadata base offset for AuthorizationViewHostingController);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = v2;
  userInterface()();
  *(void *)((char *)v10
            + *(void *)(class metadata base offset for AuthorizationViewHostingController + (*v5 & *v10) + 24)) = a2;
  swift_retain();

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v11 = (id)sub_21F1C2960();
  objc_msgSend(v11, sel_setTransitioningDelegate_, v11);
  objc_msgSend(v11, sel_setModalPresentationStyle_, 0);

  return v11;
}

uint64_t type metadata accessor for AuthorizationViewHostingController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F19D2F8()
{
  return swift_deallocObject();
}

uint64_t sub_21F19D330()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16)
                 + *(void *)(class metadata base offset for AuthorizationViewHostingController
                             + (*MEMORY[0x263F8EED0] & **(void **)(v0 + 16))
                             + 24));
  uint64_t v2 = static PhysicalButtonView.physicalButtonEdge()();
  return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 304))(v2);
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

void *sub_21F19D3EC(uint64_t a1)
{
  id v3 = v1;
  uint64_t v4 = *(void *)((char *)v1
                 + *(void *)(class metadata base offset for AuthorizationViewHostingController
                             + (*MEMORY[0x263F8EED0] & *v1)
                             + 24));
  (*(void (**)(uint64_t))(*(void *)v4 + 352))(1);
  (*(void (**)(uint64_t))(*(void *)v4 + 160))(a1);
  return v3;
}

unint64_t sub_21F19D4BC()
{
  unint64_t result = qword_26AD3FA60;
  if (!qword_26AD3FA60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD3FA60);
  }
  return result;
}

uint64_t sub_21F19D4FC()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

void sub_21F19D53C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  objc_msgSend(*(id *)(v0 + 16), sel_completeTransition_, 1);
  id v2 = objc_msgSend(v1, sel_view);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_removeFromSuperview);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_21F19D5B8()
{
  unint64_t result = qword_26AD3FA28;
  if (!qword_26AD3FA28)
  {
    sub_21F1C2FE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3FA28);
  }
  return result;
}

unint64_t sub_21F19D610()
{
  unint64_t result = qword_26AD3FA48;
  if (!qword_26AD3FA48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3FA40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3FA48);
  }
  return result;
}

uint64_t sub_21F19D66C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21F19D6A4()
{
  swift_release();
  return swift_deallocObject();
}

void *sub_21F19D6DC()
{
  uint64_t v1 = *(void *)(v0 + 32) + 16;
  swift_beginAccess();
  unint64_t result = (void *)MEMORY[0x223C46DD0](v1);
  if (result)
  {
    id v3 = result;
    uint64_t v4 = *(void *)((char *)result
                   + *(void *)(class metadata base offset for AuthorizationViewHostingController
                               + (*MEMORY[0x263F8EED0] & *result)
                               + 24));
    swift_retain();

    (*(void (**)(void))(*(void *)v4 + 352))(0);
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_21F19D7C4()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_21F19D7FC()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_completeTransition_, 1);
}

void sub_21F19D810()
{
}

void sub_21F19D840()
{
}

uint64_t sub_21F19D870()
{
  return type metadata accessor for AuthorizationViewHostingControllerContext();
}

uint64_t type metadata accessor for AuthorizationViewHostingControllerContext()
{
  uint64_t result = qword_26AD3FA80;
  if (!qword_26AD3FA80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21F19D8C4()
{
  sub_21F19E04C(319, (unint64_t *)&qword_26AD3F2D8, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F)
  {
    sub_21F192E20(319, &qword_26AD3F990, (uint64_t *)&unk_26AD3FA70);
    if (v1 <= 0x3F)
    {
      sub_21F19E098();
      if (v2 <= 0x3F)
      {
        sub_21F192E20(319, (unint64_t *)&unk_26AD3F970, &qword_26AD3FA68);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for AuthorizationViewHostingControllerContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AuthorizationViewHostingControllerContext);
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isPresented.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isPresented.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isPresented.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isPresented.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isPresented.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isPresented.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isArmable.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isArmable.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isArmable.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isArmable.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isArmable.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isArmable.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.armableObserverError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.armableObserverError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.armableObserverError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$armableObserverError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$armableObserverError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$armableObserverError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.physicalButtonEdge.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.physicalButtonEdge.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.physicalButtonEdge.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$physicalButtonEdge.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$physicalButtonEdge.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$physicalButtonEdge.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isAnimating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isAnimating.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isAnimating.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isAnimating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isAnimating.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isAnimating.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.screen.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.screen.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.screen.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$screen.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$screen.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$screen.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

void sub_21F19E04C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_21F19E098()
{
  if (!qword_26AD3F958)
  {
    type metadata accessor for CGRectEdge(255);
    unint64_t v0 = sub_21F1C2590();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD3F958);
    }
  }
}

uint64_t sub_21F19E0F4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for AuthorizationViewHostingController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AuthorizationViewHostingController);
}

uint64_t dispatch thunk of AuthorizationViewHostingController.__allocating_init(rootView:context:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController + v0 + 32))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.animationController(forDismissed:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.animationController(forPresented:presenting:source:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 48))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.transitionDuration(using:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 56))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.animateTransition(using:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 64))();
}

void sub_21F19E2DC()
{
  sub_21F19E2FC();
  qword_26AD40A38 = v0;
}

void sub_21F19E2FC()
{
  uint64_t v26 = sub_21F1C2460();
  uint64_t v0 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  unint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_21F1C24B0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v27 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v26 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  char v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - v13;
  uint64_t v15 = self;
  uint64_t v16 = (void *)sub_21F1C3050();
  uint64_t v17 = (void *)sub_21F1C3050();
  id v18 = objc_msgSend(v15, sel__bundleWithIdentifier_andLibraryName_, v16, v17);

  if (v18)
  {
    id v19 = objc_msgSend(v18, sel_bundleURL);

    sub_21F1C2490();
    sub_21F1C2480();
    char v20 = *(void (**)(char *, uint64_t))(v4 + 8);
    v20(v9, v3);
    sub_21F1C2480();
    v20(v12, v3);
    unint64_t v28 = 0xD000000000000025;
    unint64_t v29 = 0x800000021F1CABB0;
    uint64_t v21 = v26;
    (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263F06E50], v26);
    sub_21F193DA8();
    uint64_t v22 = v27;
    sub_21F1C24A0();
    (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v21);
    swift_bridgeObjectRelease();
    id v23 = objc_allocWithZone(MEMORY[0x263F086E0]);
    uint64_t v24 = (void *)sub_21F1C2470();
    id v25 = objc_msgSend(v23, sel_initWithURL_, v24);

    if (v25)
    {
      v20(v22, v3);
      v20(v14, v3);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t *sub_21F19E688()
{
  if (qword_26AD40A00 != -1) {
    swift_once();
  }
  return &qword_26AD40A38;
}

uint64_t *ItemImageView.init(symbol:foregroundColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = sub_21F18BA60();
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = 0x4042000000000000;
  return result;
}

uint64_t ItemImageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4100);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v41 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F1C2730();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (_OWORD *)((char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4108);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_21F1C2E50();
  uint64_t v13 = sub_21F1C2BF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v39 = sub_21F1C2C20();
  sub_21F196760((uint64_t)v12, &qword_267EC4108);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = swift_getKeyPath();
  swift_retain();
  sub_21F1C2F90();
  sub_21F1C2630();
  uint64_t v37 = v42;
  int v36 = v43;
  uint64_t v35 = v44;
  int v34 = v45;
  uint64_t v32 = v47;
  uint64_t v33 = v46;
  uint64_t v16 = *sub_21F18B9CC();
  swift_retain();
  char v17 = sub_21F1C2B80();
  id v18 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v19 = *MEMORY[0x263F19860];
  uint64_t v20 = sub_21F1C2900();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __asm { FMOV            V0.2D, #6.0 }
  *uint64_t v9 = _Q0;
  uint64_t v26 = v41;
  sub_21F19ED48((uint64_t)v9, v41);
  *(_WORD *)(v26 + *(int *)(v4 + 44)) = 256;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4110);
  sub_21F19EDAC(v26, a1 + *(int *)(v27 + 36));
  uint64_t v28 = v39;
  *(void *)a1 = v40;
  *(void *)(a1 + 8) = KeyPath;
  *(void *)(a1 + 16) = v28;
  *(void *)(a1 + 24) = v15;
  uint64_t v29 = v37;
  *(void *)(a1 + 32) = v38;
  *(void *)(a1 + 40) = v29;
  *(unsigned char *)(a1 + 48) = v36;
  *(void *)(a1 + 56) = v35;
  *(unsigned char *)(a1 + 64) = v34;
  uint64_t v30 = v32;
  *(void *)(a1 + 72) = v33;
  *(void *)(a1 + 80) = v30;
  *(void *)(a1 + 88) = v16;
  *(unsigned char *)(a1 + 96) = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21F196760(v26, &qword_267EC4100);
  sub_21F19EE14((uint64_t)v9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_21F19EAAC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = static Color.itemIconForeground.getter();
  sub_21F18BA60();
  uint64_t v3 = static Color.itemIconForeground.getter();
  uint64_t v4 = static Color.itemIconForeground.getter();
  uint64_t v5 = static Color.itemIconForeground.getter();
  *a1 = 0x662E6E6F73726570;
  a1[1] = 0xEB000000006C6C69;
  a1[2] = v2;
  a1[3] = 0x4042000000000000;
  a1[4] = 0xD000000000000010;
  a1[5] = 0x800000021F1CABE0;
  a1[6] = v3;
  a1[7] = 0x4042000000000000;
  a1[8] = 0x69662E6573756F68;
  a1[9] = 0xEA00000000006C6CLL;
  a1[10] = v4;
  a1[11] = 0x4042000000000000;
  a1[12] = 0xD000000000000012;
  a1[13] = 0x800000021F1CAC00;
  a1[14] = v5;
  a1[15] = 0x4042000000000000;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_21F19EBF4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21F1C2940();
  sub_21F19EAAC(v8);
  *(_OWORD *)&v9[71] = v8[4];
  *(_OWORD *)&v9[87] = v8[5];
  *(_OWORD *)&v9[103] = v8[6];
  *(_OWORD *)&v9[119] = v8[7];
  *(_OWORD *)&v9[7] = v8[0];
  *(_OWORD *)&v9[23] = v8[1];
  *(_OWORD *)&v9[39] = v8[2];
  *(_OWORD *)&v9[55] = v8[3];
  long long v3 = *(_OWORD *)&v9[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v9[80];
  long long v4 = *(_OWORD *)&v9[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v9[96];
  *(_OWORD *)(a1 + 129) = v4;
  long long v5 = *(_OWORD *)v9;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v9[16];
  double result = *(double *)&v9[32];
  long long v7 = *(_OWORD *)&v9[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v9[32];
  *(_OWORD *)(a1 + 65) = v7;
  *(_OWORD *)(a1 + 81) = v3;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 144) = *(void *)&v9[127];
  *(_OWORD *)(a1 + 17) = v5;
  return result;
}

uint64_t sub_21F19ECB0(uint64_t a1)
{
  unint64_t v2 = sub_21F19F420();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_21F19ECFC(uint64_t a1)
{
  unint64_t v2 = sub_21F19F420();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t sub_21F19ED48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F1C2730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F19EDAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F19EE14(uint64_t a1)
{
  uint64_t v2 = sub_21F1C2730();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21F19EE70()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21F19EE90()
{
  unint64_t result = qword_267EC4118;
  if (!qword_267EC4118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4118);
  }
  return result;
}

uint64_t sub_21F19EEE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for ItemImageView()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

void *initializeWithCopy for ItemImageView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ItemImageView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for ItemImageView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ItemImageView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ItemImageView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ItemImageView()
{
  return &type metadata for ItemImageView;
}

ValueMetadata *type metadata accessor for ItemImageView_Previews()
{
  return &type metadata for ItemImageView_Previews;
}

unint64_t sub_21F19F0E8()
{
  unint64_t result = qword_267EC4120;
  if (!qword_267EC4120)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4110);
    sub_21F19F188();
    sub_21F192EE4(&qword_267EC4168, &qword_267EC4100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4120);
  }
  return result;
}

unint64_t sub_21F19F188()
{
  unint64_t result = qword_267EC4128;
  if (!qword_267EC4128)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4130);
    sub_21F19F228();
    sub_21F192EE4(&qword_26AD3F9C8, &qword_26AD3F9D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4128);
  }
  return result;
}

unint64_t sub_21F19F228()
{
  unint64_t result = qword_267EC4138;
  if (!qword_267EC4138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4140);
    sub_21F19F2A4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4138);
  }
  return result;
}

unint64_t sub_21F19F2A4()
{
  unint64_t result = qword_267EC4148;
  if (!qword_267EC4148)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4150);
    sub_21F19F344();
    sub_21F192EE4(&qword_267EC3F28, &qword_267EC3F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4148);
  }
  return result;
}

unint64_t sub_21F19F344()
{
  unint64_t result = qword_267EC4158;
  if (!qword_267EC4158)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4160);
    sub_21F192EE4(&qword_267EC3F18, &qword_267EC3F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4158);
  }
  return result;
}

uint64_t sub_21F19F3E4()
{
  return sub_21F192EE4(&qword_267EC4170, &qword_267EC4178);
}

unint64_t sub_21F19F420()
{
  unint64_t result = qword_267EC4180;
  if (!qword_267EC4180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4180);
  }
  return result;
}

uint64_t PaymentSheetItemsContainer.init(items:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = KeyPath;
  *(unsigned char *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = result;
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = 0x4020000000000000;
  return result;
}

uint64_t sub_21F19F4DC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  sub_21F1980F0(v1, v2);
  char v3 = sub_21F19F534(v1, v2);
  sub_21F198130(v1, v2);
  return v3 & 1;
}

uint64_t sub_21F19F534(uint64_t a1, char a2)
{
  uint64_t v4 = sub_21F1C28A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_21F1C30F0();
  uint64_t v9 = sub_21F1C2B50();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_21F197A34(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_21F189000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C46D60](v11, -1, -1);
    MEMORY[0x223C46D60](v10, -1, -1);
  }

  sub_21F1C2890();
  swift_getAtKeyPath();
  sub_21F198130(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_21F19F70C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isCompactLayout.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21F19F73C(unsigned __int8 *a1)
{
  return EnvironmentValues.isCompactLayout.setter(*a1);
}

uint64_t sub_21F19F764()
{
  uint64_t v1 = *(void *)(v0 + 32);
  char v2 = *(unsigned char *)(v0 + 40);
  sub_21F1980F0(v1, v2);
  char v3 = sub_21F19F534(v1, v2);
  sub_21F198130(v1, v2);
  return v3 & 1;
}

uint64_t sub_21F19F7BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.shouldUseAccessibleLayout.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21F19F7EC()
{
  return EnvironmentValues.shouldUseAccessibleLayout.setter();
}

uint64_t PaymentSheetItemsContainer.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v20 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3FA00);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  sub_21F1C2F00();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2F00();
  uint64_t v6 = sub_21F1C26C0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v25 = MEMORY[0x263F18C10];
  uint64_t v7 = swift_getWitnessTable();
  *(void *)&long long v26 = v6;
  *((void *)&v26 + 1) = MEMORY[0x263F1B440];
  *(void *)&long long v27 = v7;
  *((void *)&v27 + 1) = MEMORY[0x263F1B428];
  swift_getOpaqueTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3F9E0);
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3F9A0);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  uint64_t v8 = sub_21F1C2F00();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unsigned __int8 v14 = (char *)&v19 - v13;
  long long v15 = v2[1];
  long long v26 = *v2;
  long long v27 = v15;
  long long v28 = v2[2];
  uint64_t v29 = *((void *)v2 + 6);
  uint64_t v21 = v4;
  uint64_t v22 = v5;
  id v23 = &v26;
  sub_21F1C2940();
  sub_21F1C2EF0();
  swift_getWitnessTable();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v16(v14, v12, v8);
  char v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, v8);
  v16(v20, v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v17)(v14, v8);
}

uint64_t sub_21F19FB50@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v63 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA10);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3FA00);
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  sub_21F1C2F00();
  swift_getTupleTypeMetadata2();
  uint64_t v10 = sub_21F1C2FB0();
  uint64_t WitnessTable = swift_getWitnessTable();
  v51[2] = v10;
  v51[1] = WitnessTable;
  uint64_t v12 = sub_21F1C2F00();
  uint64_t v52 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unsigned __int8 v14 = (char *)v51 - v13;
  uint64_t v15 = sub_21F1C26C0();
  uint64_t v57 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)v51 - v16;
  v51[0] = swift_getWitnessTable();
  v73[4] = v51[0];
  v73[5] = MEMORY[0x263F18C10];
  uint64_t v18 = swift_getWitnessTable();
  *(void *)&long long v68 = v15;
  *((void *)&v68 + 1) = MEMORY[0x263F1B440];
  uint64_t v56 = v18;
  *(void *)&long long v69 = v18;
  *((void *)&v69 + 1) = MEMORY[0x263F1B428];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v59 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v58 = (char *)v51 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3F9E0);
  uint64_t v60 = OpaqueTypeMetadata2;
  uint64_t v21 = sub_21F1C26C0();
  uint64_t v62 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v61 = (char *)v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v55 = (char *)v51 - v25;
  MEMORY[0x270FA5388](v24);
  char v64 = (char *)v51 - v26;
  long long v27 = a1[1];
  long long v68 = *a1;
  long long v69 = v27;
  long long v70 = a1[2];
  uint64_t v71 = *((void *)a1 + 6);
  uint64_t v28 = sub_21F19F4DC();
  if (v28)
  {
    char v29 = 1;
  }
  else
  {
    long long v30 = a1[1];
    long long v68 = *a1;
    long long v69 = v30;
    long long v70 = a1[2];
    uint64_t v71 = *((void *)a1 + 6);
    uint64_t v28 = sub_21F19F764();
    char v29 = v28;
  }
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = v54;
  v51[-4] = v53;
  v51[-3] = v31;
  LOBYTE(v51[-2]) = v29 & 1;
  v51[-1] = a1;
  sub_21F1C2940();
  sub_21F1C2EF0();
  sub_21F1C2B70();
  if (v29)
  {
    sub_21F1C2D90();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v12);
    uint64_t v32 = 0;
  }
  else
  {
    sub_21F18B608();
    sub_21F1C2D90();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v12);
    uint64_t v32 = sub_21F1C2E00();
  }
  *(void *)&long long v68 = v32;
  uint64_t v33 = v58;
  uint64_t v34 = MEMORY[0x263F1B440];
  uint64_t v35 = v56;
  uint64_t v36 = MEMORY[0x263F1B428];
  View.paymentItemBackground<A>(_:)((uint64_t)&v68, v15, MEMORY[0x263F1B440], v56);
  swift_release();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v17, v15);
  swift_getKeyPath();
  uint64_t v37 = sub_21F1C2F80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v9, 1, 1, v37);
  *(void *)&long long v68 = v15;
  *((void *)&v68 + 1) = v34;
  *(void *)&long long v69 = v35;
  *((void *)&v69 + 1) = v36;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v39 = v55;
  uint64_t v40 = v60;
  sub_21F1C2CF0();
  swift_release();
  sub_21F196760((uint64_t)v9, &qword_26AD3FA10);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v33, v40);
  unint64_t v41 = sub_21F1A0E24();
  v73[2] = OpaqueTypeConformance2;
  v73[3] = v41;
  uint64_t v60 = swift_getWitnessTable();
  uint64_t v42 = v62;
  uint64_t v59 = *(void *)(v62 + 16);
  ((void (*)(char *, char *, uint64_t))v59)(v64, v39, v21);
  uint64_t v62 = *(void *)(v42 + 8);
  ((void (*)(char *, uint64_t))v62)(v39, v21);
  sub_21F1C2F90();
  sub_21F1C2630();
  uint64_t v43 = v73[6];
  char v44 = v74;
  uint64_t v45 = v75;
  LOBYTE(v39) = v76;
  uint64_t v46 = v77;
  uint64_t v47 = v78;
  uint64_t v48 = v61;
  ((void (*)(char *, char *, uint64_t))v59)(v61, v64, v21);
  *(void *)&long long v68 = 0;
  BYTE8(v68) = 1;
  *(void *)&long long v69 = v43;
  BYTE8(v69) = v44;
  *(void *)&long long v70 = v45;
  BYTE8(v70) = (_BYTE)v39;
  uint64_t v71 = v46;
  uint64_t v72 = v47;
  v73[0] = v48;
  v73[1] = &v68;
  v67[0] = v21;
  v67[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9A0);
  uint64_t v65 = v60;
  unint64_t v66 = sub_21F1A0E80();
  sub_21F193734((uint64_t)v73, 2uLL, (uint64_t)v67);
  uint64_t v49 = (uint64_t (*)(char *, uint64_t))v62;
  ((void (*)(char *, uint64_t))v62)(v64, v21);
  return v49(v48, v21);
}

uint64_t sub_21F1A03D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21F19FB50(*(long long **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_21F1A03DC@<X0>(char a1@<W0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v7 = sub_21F1C2F00();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v32 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v30 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA00);
  uint64_t v16 = MEMORY[0x270FA5388](v30);
  uint64_t v31 = (uint64_t)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v30 - v18;
  if (a1)
  {
    sub_21F1C2F50();
    uint64_t v20 = sub_21F1C2F60();
    uint64_t v21 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    uint64_t v22 = sub_21F1C2F60();
    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
  }
  MEMORY[0x270FA5388](v21);
  *(&v30 - 4) = a2;
  *(&v30 - 3) = a3;
  *(&v30 - 2) = v23;
  sub_21F1C2940();
  sub_21F1C2EF0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v25(v15, v13, v7);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v13, v7);
  uint64_t v27 = v31;
  sub_21F196550((uint64_t)v19, v31, &qword_26AD3FA00);
  v37[0] = v27;
  uint64_t v28 = v32;
  v25(v32, v15, v7);
  v37[1] = v28;
  v36[0] = v30;
  v36[1] = v7;
  unint64_t v34 = sub_21F1A0F00();
  uint64_t v35 = WitnessTable;
  sub_21F193734((uint64_t)v37, 2uLL, (uint64_t)v36);
  v26(v15, v7);
  sub_21F196760((uint64_t)v19, &qword_26AD3FA00);
  v26(v28, v7);
  return sub_21F196760(v27, &qword_26AD3FA00);
}

uint64_t sub_21F1A0774@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void (**)(void))MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v14 - v9;
  (*v8)();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, a1);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, a1);
  v11(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, a1);
}

uint64_t sub_21F1A08B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1A08F8()
{
  return sub_21F1C2800();
}

uint64_t sub_21F1A091C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA10);
  MEMORY[0x270FA5388](v2 - 8);
  sub_21F196550(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26AD3FA10);
  return sub_21F1C2810();
}

uint64_t sub_21F1A09B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_21F1A09BC(uint64_t a1)
{
  swift_release();
  sub_21F198130(*(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  return sub_21F198130(v2, v3);
}

uint64_t sub_21F1A0A08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  swift_retain();
  sub_21F1980F0(v5, v6);
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_21F1980F0(v7, v8);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t sub_21F1A0A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_21F1980F0(v5, v6);
  uint64_t v7 = *(void *)(a1 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_21F198130(v7, v8);
  uint64_t v9 = *(void *)(a2 + 32);
  char v10 = *(unsigned char *)(a2 + 40);
  sub_21F1980F0(v9, v10);
  uint64_t v11 = *(void *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 40) = v10;
  sub_21F198130(v11, v12);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t sub_21F1A0B24(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 16);
  char v6 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v4;
  sub_21F198130(v5, v6);
  char v7 = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v7;
  sub_21F198130(v8, v9);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t sub_21F1A0B9C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21F1A0BE4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for PaymentSheetItemsContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F1A0C48()
{
  return swift_getWitnessTable();
}

uint64_t sub_21F1A0E14@<X0>(uint64_t a1@<X8>)
{
  return sub_21F1A03DC(*(unsigned char *)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_21F1A0E24()
{
  unint64_t result = qword_26AD3F9D8;
  if (!qword_26AD3F9D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3F9E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3F9D8);
  }
  return result;
}

unint64_t sub_21F1A0E80()
{
  unint64_t result = qword_26AD3F998;
  if (!qword_26AD3F998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3F9A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3F998);
  }
  return result;
}

uint64_t sub_21F1A0EF4@<X0>(char *a1@<X8>)
{
  return sub_21F1A0774(*(void *)(v1 + 16), a1);
}

unint64_t sub_21F1A0F00()
{
  unint64_t result = qword_26AD3FA08;
  if (!qword_26AD3FA08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3FA00);
    sub_21F1A0F74();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3FA08);
  }
  return result;
}

unint64_t sub_21F1A0F74()
{
  unint64_t result = qword_267EC4188;
  if (!qword_267EC4188)
  {
    sub_21F1C2F60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4188);
  }
  return result;
}

uint64_t sub_21F1A0FCC()
{
  uint64_t v0 = sub_21F1C2500();
  __swift_allocate_value_buffer(v0, qword_267EC50A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EC50A0);
  return sub_21F1C24F0();
}

uint64_t sub_21F1A1050()
{
  if (qword_267EC5098 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21F1C2500();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267EC50A0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.paymentUIBase.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267EC5098 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21F1C2500();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267EC50A0);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
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

uint64_t View.errorAlert(_:)(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(&v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], v2, a2);
  sub_21F196550(a1, (uint64_t)v9, &qword_26AD3F9F8);
  return sub_21F1C26B0();
}

uint64_t sub_21F1A12F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v34 = a2;
  uint64_t v35 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9F8);
  MEMORY[0x223C463D0](&v36);
  uint64_t v5 = *((void *)&v37 + 1);
  if (*((void *)&v37 + 1))
  {
    uint64_t v6 = v38;
    char v7 = __swift_project_boxed_opaque_existential_1(&v36, *((uint64_t *)&v37 + 1));
    uint64_t v8 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v7);
    char v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    sub_21F196760((uint64_t)&v36, &qword_26AD3F860);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
    unint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v5);
  }
  else
  {
    sub_21F196760((uint64_t)&v36, &qword_26AD3F860);
    uint64_t v11 = 0;
    unint64_t v13 = 0xE000000000000000;
  }
  *(void *)&long long v36 = v11;
  *((void *)&v36 + 1) = v13;
  sub_21F193DA8();
  uint64_t v14 = sub_21F1C2CB0();
  uint64_t v32 = v15;
  uint64_t v33 = v14;
  uint64_t v31 = v16;
  int v30 = v17 & 1;
  sub_21F1A170C(v3, (uint64_t)&v36);
  sub_21F1C30D0();
  uint64_t v18 = sub_21F1C30C0();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = v20;
  long long v21 = v37;
  *(_OWORD *)(v19 + 32) = v36;
  *(_OWORD *)(v19 + 48) = v21;
  *(_OWORD *)(v19 + 64) = v38;
  *(void *)(v19 + 80) = v39;
  sub_21F1A170C(v3, (uint64_t)&v36);
  uint64_t v22 = sub_21F1C30C0();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v22;
  *(void *)(v23 + 24) = v20;
  long long v24 = v37;
  *(_OWORD *)(v23 + 32) = v36;
  *(_OWORD *)(v23 + 48) = v24;
  *(_OWORD *)(v23 + 64) = v38;
  *(void *)(v23 + 80) = v39;
  sub_21F1C2F40();
  int v29 = v37;
  uint64_t v25 = MEMORY[0x223C463D0](&v36, v4);
  MEMORY[0x270FA5388](v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3FA20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F858);
  sub_21F192EE4(&qword_26AD3F9A8, &qword_26AD3F9B0);
  sub_21F192EE4(&qword_26AD3FA18, &qword_26AD3FA20);
  sub_21F1A2264();
  uint64_t v26 = v33;
  uint64_t v27 = v32;
  LOBYTE(v20) = v30;
  sub_21F1C2D50();
  swift_release();
  swift_release();
  sub_21F193DFC(v26, v27, v20);
  swift_bridgeObjectRelease();
  return sub_21F196760((uint64_t)&v36, &qword_26AD3F860);
}

uint64_t sub_21F1A170C(void *a1, uint64_t a2)
{
  return initializeWithCopy for ErrorAlertModifier(a2, a1);
}

uint64_t sub_21F1A1720@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9F8);
  MEMORY[0x223C463D0](v5, v2);
  BOOL v3 = v5[3] != 0;
  uint64_t result = sub_21F196760((uint64_t)v5, &qword_26AD3F860);
  *a1 = v3;
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 72)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  }
  return swift_deallocObject();
}

unsigned char *sub_21F1A17DC(unsigned char *result)
{
  if ((*result & 1) == 0)
  {
    uint64_t v3 = 0;
    memset(v2, 0, sizeof(v2));
    sub_21F196550((uint64_t)v2, (uint64_t)v1, &qword_26AD3F860);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9F8);
    sub_21F1C2F30();
    return (unsigned char *)sub_21F196760((uint64_t)v2, &qword_26AD3F860);
  }
  return result;
}

uint64_t sub_21F1A1854@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  v93 = a1;
  v87 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4198);
  MEMORY[0x270FA5388](v2 - 8);
  v88 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21F1C24B0();
  uint64_t v91 = *(void *)(v4 - 8);
  uint64_t v92 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v82 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = v6;
  MEMORY[0x270FA5388](v5);
  id v83 = (char *)&v77 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41A0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v86 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v85 = (char *)&v77 - v11;
  uint64_t v90 = sub_21F1C2720();
  uint64_t v12 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  uint64_t v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41A8);
  uint64_t v94 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41B0);
  v89 = *(void **)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  long long v21 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  long long v24 = (char *)&v77 - v23;
  uint64_t v25 = nullsub_1(v22);
  uint64_t v26 = (void *)sub_21F1B0448(v25);
  uint64_t v28 = PaymentUIBaseLocalizedString(for:table:bundle:)(0x5F544E454D594150, 0xEA00000000004B4FLL, v27, v26);
  uint64_t v30 = v29;

  *(void *)&long long v95 = v28;
  *((void *)&v95 + 1) = v30;
  unint64_t v31 = sub_21F193DA8();
  sub_21F1C2EB0();
  sub_21F1C2710();
  sub_21F192EE4(&qword_267EC41B8, &qword_267EC41A8);
  sub_21F1C2D10();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v90);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v94 + 8);
  id v80 = v17;
  uint64_t v84 = v15;
  uint64_t v33 = v15;
  uint64_t v34 = v18;
  uint64_t v35 = v89;
  v32(v17, v33);
  long long v36 = (void (*)(char *, char *, uint64_t))v35[4];
  uint64_t v90 = (uint64_t)v24;
  v36(v24, v21, v34);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9F8);
  MEMORY[0x223C463D0](&v95);
  uint64_t v38 = *((void *)&v96 + 1);
  if (!*((void *)&v96 + 1))
  {
    sub_21F196760((uint64_t)&v95, &qword_26AD3F860);
    uint64_t v46 = (uint64_t)v88;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v88, 1, 1, v92);
    goto LABEL_7;
  }
  unint64_t v79 = v31;
  uint64_t v39 = v97;
  uint64_t v40 = __swift_project_boxed_opaque_existential_1(&v95, *((uint64_t *)&v96 + 1));
  uint64_t v41 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v77 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v41 + 16))(v43);
  sub_21F196760((uint64_t)&v95, &qword_26AD3F860);
  char v44 = *(void (**)(uint64_t, uint64_t))(v39 + 88);
  uint64_t v45 = v39;
  uint64_t v46 = (uint64_t)v88;
  v44(v38, v45);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v38);
  uint64_t v48 = v91;
  uint64_t v47 = v92;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v46, 1, v92) == 1)
  {
LABEL_7:
    sub_21F196760(v46, &qword_267EC4198);
LABEL_10:
    uint64_t v69 = 1;
    uint64_t v71 = (uint64_t)v86;
    long long v70 = v87;
    uint64_t v67 = v84;
    uint64_t v68 = (uint64_t)v85;
    uint64_t v66 = v94;
    goto LABEL_11;
  }
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 32);
  v49(v83, v46, v47);
  MEMORY[0x223C463D0](&v95, v37);
  uint64_t v50 = *((void *)&v96 + 1);
  if (!*((void *)&v96 + 1))
  {
    sub_21F196760((uint64_t)&v95, &qword_26AD3F860);
    goto LABEL_9;
  }
  uint64_t v78 = (void (*)(unint64_t, char *, uint64_t))v49;
  uint64_t v51 = v97;
  uint64_t v52 = __swift_project_boxed_opaque_existential_1(&v95, *((uint64_t *)&v96 + 1));
  v88 = (char *)&v77;
  uint64_t v53 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v55 = (char *)&v77 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v53 + 16))(v55);
  sub_21F196760((uint64_t)&v95, &qword_26AD3F860);
  uint64_t v56 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 80))(v50, v51);
  uint64_t v58 = v57;
  uint64_t v59 = v55;
  uint64_t v47 = v92;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v59, v50);
  uint64_t v48 = v91;
  if (!v58)
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v48 + 8))(v83, v47);
    goto LABEL_10;
  }
  uint64_t v99 = v56;
  uint64_t v100 = v58;
  sub_21F1A170C(v93, (uint64_t)&v95);
  uint64_t v60 = v82;
  uint64_t v61 = v83;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v82, v83, v47);
  unint64_t v62 = (*(unsigned __int8 *)(v48 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  uint64_t v63 = swift_allocObject();
  long long v64 = v96;
  *(_OWORD *)(v63 + 16) = v95;
  *(_OWORD *)(v63 + 32) = v64;
  *(_OWORD *)(v63 + 48) = v97;
  *(void *)(v63 + 64) = v98;
  v78(v63 + v62, v60, v47);
  uint64_t v65 = v80;
  sub_21F1C2EB0();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v61, v47);
  uint64_t v66 = v94;
  uint64_t v67 = v84;
  uint64_t v68 = (uint64_t)v85;
  (*(void (**)(char *, char *, uint64_t))(v94 + 32))(v85, v65, v84);
  uint64_t v69 = 0;
  uint64_t v71 = (uint64_t)v86;
  long long v70 = v87;
LABEL_11:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 56))(v68, v69, 1, v67);
  uint64_t v72 = (void (*)(char *, uint64_t, uint64_t))v35[2];
  uint64_t v73 = v90;
  v72(v21, v90, v34);
  sub_21F196550(v68, v71, &qword_267EC41A0);
  v72(v70, (uint64_t)v21, v34);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41C0);
  sub_21F196550(v71, (uint64_t)&v70[*(int *)(v74 + 48)], &qword_267EC41A0);
  sub_21F196760(v68, &qword_267EC41A0);
  uint64_t v75 = (void (*)(uint64_t, uint64_t))v35[1];
  v75(v73, v34);
  sub_21F196760(v71, &qword_267EC41A0);
  return ((uint64_t (*)(char *, uint64_t))v75)(v21, v34);
}

uint64_t sub_21F1A21C4@<X0>(char *a1@<X8>)
{
  return sub_21F1A1854(*(void **)(v1 + 16), a1);
}

uint64_t sub_21F1A21CC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  if (v5)
  {
    sub_21F193DA8();
    uint64_t result = sub_21F1C2CB0();
    uint64_t v9 = v8 & 1;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v9 = 0;
    uint64_t v7 = 0;
  }
  *a2 = result;
  a2[1] = v5;
  a2[2] = v9;
  a2[3] = v7;
  return result;
}

unint64_t sub_21F1A2264()
{
  unint64_t result = qword_26AD3F9F0;
  if (!qword_26AD3F9F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3F9E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3F9F0);
  }
  return result;
}

uint64_t sub_21F1A22D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1A22F4()
{
  return sub_21F1C2620();
}

uint64_t dispatch thunk of AlertError.localizedTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AlertError.localizedDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AlertError.requiresUserAcknowledgement.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AlertError.clientFailure.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AlertError.paymentOffersError.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AlertError.init(error:localizedTitle:localizedDescription:requiresUserAcknowledgement:clientFailure:paymentOffersError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 64))();
}

uint64_t dispatch thunk of AlertError.init(displayableError:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AlertError.localizedRecoveryActionName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AlertError.recoveryActionUrl.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t destroy for ErrorAlertModifier(uint64_t a1)
{
  swift_release();
  uint64_t result = swift_release();
  if (*(void *)(a1 + 40))
  {
    return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  return result;
}

uint64_t initializeWithCopy for ErrorAlertModifier(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (_OWORD *)(a1 + 16);
  uint64_t v6 = a2 + 2;
  uint64_t v7 = a2[5];
  swift_retain();
  swift_retain();
  if (v7)
  {
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v8;
    (**(void (***)(uint64_t, void *, uint64_t))(v7 - 8))(a1 + 16, v6, v7);
  }
  else
  {
    long long v9 = *((_OWORD *)v6 + 1);
    *uint64_t v5 = *(_OWORD *)v6;
    *(_OWORD *)(a1 + 32) = v9;
    *(void *)(a1 + 48) = v6[4];
  }
  return a1;
}

uint64_t assignWithCopy for ErrorAlertModifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
      *(void *)(a1 + 40) = v4;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
      return a1;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  return a1;
}

uint64_t assignWithTake for ErrorAlertModifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ErrorAlertModifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ErrorAlertModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ErrorAlertModifier()
{
  return &type metadata for ErrorAlertModifier;
}

uint64_t sub_21F1A26D0()
{
  return swift_getWitnessTable();
}

unint64_t sub_21F1A2734()
{
  unint64_t result = qword_267EC4190;
  if (!qword_267EC4190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4190);
  }
  return result;
}

uint64_t sub_21F1A2788()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1A2888()
{
  uint64_t v1 = sub_21F1C24B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  if (*(void *)(v0 + 56)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  }
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 72) & ~v3), v1);
  return swift_deallocObject();
}

void sub_21F1A296C()
{
  sub_21F1C24B0();
  id v1 = objc_msgSend(self, sel_defaultWorkspace);
  if (v1)
  {
    uint64_t v0 = (void *)sub_21F1C2470();
    objc_msgSend(v1, sel_openSensitiveURL_withOptions_, v0, 0);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21F1A2A30()
{
  return 0;
}

uint64_t ClientViewSource.secondaryContent.getter()
{
  return 0;
}

uint64_t ClientViewSource.secondaryFooter.getter()
{
  return 0;
}

uint64_t sub_21F1A2A54()
{
  return 0;
}

uint64_t KeyPathView.init(path:source:shouldSuspendStateMachine:analyticsTag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_21F1C24D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a5 = swift_getKeyPath();
  *(unsigned char *)(a5 + 8) = 0;
  *(_OWORD *)(a5 + 48) = 0u;
  *(unsigned char *)(a5 + 64) = 0;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 88) = 0u;
  *(_OWORD *)(a5 + 72) = 0u;
  *(void *)(a5 + 16) = a1;
  *(void *)(a5 + 24) = 0;
  swift_retain();
  sub_21F1A334C(a2, a5 + 32);
  *(unsigned char *)(a5 + 64) = a3;
  sub_21F1A334C(a4, a5 + 72);
  sub_21F1C24C0();
  swift_release();
  sub_21F196760(a4, &qword_267EC41C8);
  sub_21F196760(a2, &qword_267EC41C8);
  uint64_t v14 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5 + *(int *)(v14 + 40), v13, v10);
}

uint64_t sub_21F1A2BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int v20 = a5;
  uint64_t v13 = sub_21F1C24D0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a7 = swift_getKeyPath();
  *(unsigned char *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 72) = 0u;
  *(_OWORD *)(a7 + 88) = 0u;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  a3 &= 1u;
  char v23 = a3;
  uint64_t v24 = a4;
  sub_21F1A68F8(a1, a2, a3);
  swift_bridgeObjectRetain();
  *(void *)(a7 + 24) = sub_21F1C2F10();
  *(unsigned char *)(a7 + 64) = v20;
  sub_21F1A334C(a6, a7 + 72);
  sub_21F1C24C0();
  sub_21F196760(a6, &qword_267EC41C8);
  sub_21F193DFC(a1, a2, a3);
  swift_bridgeObjectRelease();
  uint64_t v17 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a7 + *(int *)(v17 + 40), v16, v13);
}

uint64_t sub_21F1A2D90@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_21F1C24D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a4 = swift_getKeyPath();
  *(unsigned char *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  v14[1] = a1;
  swift_retain();
  *(void *)(a4 + 24) = sub_21F1C2F10();
  *(unsigned char *)(a4 + 64) = a2;
  sub_21F1A334C(a3, a4 + 72);
  sub_21F1C24C0();
  sub_21F196760(a3, &qword_267EC41C8);
  swift_release();
  uint64_t v12 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4 + *(int *)(v12 + 40), v11, v8);
}

uint64_t KeyPathView.init<A>(view:shouldSuspendStateMachine:analyticsTag:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v20 = a5;
  int v21 = a2;
  uint64_t v10 = sub_21F1C24D0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a6 = swift_getKeyPath();
  *(unsigned char *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a4);
  *(void *)(a6 + 24) = sub_21F1C2F10();
  *(unsigned char *)(a6 + 64) = v21;
  sub_21F1A334C(a3, a6 + 72);
  sub_21F1C24C0();
  sub_21F196760(a3, &qword_267EC41C8);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, a4);
  uint64_t v18 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a6 + *(int *)(v18 + 40), v14, v10);
}

uint64_t sub_21F1A310C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_21F1C28A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_21F1C30F0();
    uint64_t v9 = sub_21F1C2B50();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_21F197A34(0xD00000000000001FLL, 0x800000021F1CAC40, &v14);
      _os_log_impl(&dword_21F189000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C46D60](v11, -1, -1);
      MEMORY[0x223C46D60](v10, -1, -1);
    }

    sub_21F1C2890();
    swift_getAtKeyPath();
    sub_21F1A340C(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_21F1A32F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.availableSheetItems.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21F1A3320()
{
  return EnvironmentValues.availableSheetItems.setter();
}

uint64_t sub_21F1A334C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for KeyPathView()
{
  uint64_t result = qword_267EC52E0;
  if (!qword_267EC52E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21F1A3400(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_21F1A340C(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

uint64_t KeyPathView.source.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21F196550(v1 + 32, a1, &qword_267EC41C8);
}

uint64_t KeyPathView.source.setter(uint64_t a1)
{
  return sub_21F1A3448(a1, v1 + 32);
}

uint64_t sub_21F1A3448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*KeyPathView.source.modify())()
{
  return nullsub_1;
}

uint64_t KeyPathView.shouldSuspendStateMachine.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t KeyPathView.shouldSuspendStateMachine.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 64) = result;
  return result;
}

uint64_t (*KeyPathView.shouldSuspendStateMachine.modify())()
{
  return nullsub_1;
}

uint64_t KeyPathView.analyticsTag.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21F196550(v1 + 72, a1, &qword_267EC41C8);
}

uint64_t KeyPathView.analyticsTag.setter(uint64_t a1)
{
  return sub_21F1A3448(a1, v1 + 72);
}

uint64_t (*KeyPathView.analyticsTag.modify())()
{
  return nullsub_1;
}

uint64_t KeyPathView.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for KeyPathView() + 40);
  uint64_t v4 = sub_21F1C24D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t KeyPathView.id.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for KeyPathView() + 40);
  uint64_t v4 = sub_21F1C24D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*KeyPathView.id.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_21F1A3688()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4270);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for KeyPathView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  if (!*(void *)(v0 + 16)) {
    return 0;
  }
  memset(v22, 0, sizeof(v22));
  sub_21F196550(v0 + 32, (uint64_t)&v18, &qword_267EC41C8);
  if (v19)
  {
    sub_21F1A77B8(&v18, &v20);
    swift_retain();
    swift_getAtAnyKeyPath();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
    sub_21F196760((uint64_t)v22, &qword_267EC41C8);
    uint64_t v11 = &v18;
  }
  else
  {
    swift_retain();
    sub_21F196760((uint64_t)&v18, &qword_267EC41C8);
    uint64_t v12 = *(void *)v0;
    char v13 = *(unsigned char *)(v0 + 8);
    sub_21F1A3400(v12, v13);
    uint64_t v14 = sub_21F1A310C(v12, v13);
    sub_21F1A340C(v12, v13);
    *(void *)&long long v18 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4288);
    swift_getAtAnyKeyPath();
    swift_bridgeObjectRelease();
    sub_21F196760((uint64_t)v22, &qword_267EC41C8);
    uint64_t v11 = &v20;
  }
  sub_21F1A7750((uint64_t)v11, (uint64_t)v22);
  sub_21F196550((uint64_t)v22, (uint64_t)&v20, &qword_267EC41C8);
  if (!v21)
  {
    sub_21F196760((uint64_t)&v20, &qword_267EC41C8);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    sub_21F196550((uint64_t)v22, (uint64_t)&v20, &qword_267EC41C8);
    if (v21)
    {
      int v16 = swift_dynamicCast();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, v16 ^ 1u, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
      {
        sub_21F1A67B0((uint64_t)v3, (uint64_t)v10);
        sub_21F1A6A80((uint64_t)v10, (uint64_t)v8);
        sub_21F1A69AC((unint64_t *)&qword_267EC4280, (void (*)(uint64_t))type metadata accessor for KeyPathView);
        uint64_t v15 = sub_21F1C2F10();
        swift_release();
        sub_21F1A6AE4((uint64_t)v10);
        goto LABEL_12;
      }
    }
    else
    {
      sub_21F196760((uint64_t)&v20, &qword_267EC41C8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    }
    swift_release();
    sub_21F196760((uint64_t)v22, &qword_267EC41C8);
    sub_21F196760((uint64_t)v3, &qword_267EC4270);
    return 0;
  }
  swift_release();
  uint64_t v15 = v18;
LABEL_12:
  sub_21F196760((uint64_t)v22, &qword_267EC41C8);
  return v15;
}

uint64_t KeyPathView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21F1C2940();
  if (*(void *)(v1 + 24))
  {
    swift_retain();
  }
  else
  {
    uint64_t result = sub_21F1A3688();
    if (!result)
    {
      uint64_t v5 = 0;
      char v6 = -1;
      goto LABEL_5;
    }
  }
  uint64_t result = sub_21F1C2A50();
  uint64_t v5 = v7;
  char v6 = v8;
LABEL_5:
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_21F1A3B2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 24))
  {
    swift_retain();
  }
  else
  {
    uint64_t result = sub_21F1A3688();
    if (!result)
    {
      uint64_t v4 = 0;
      char v5 = -1;
      goto LABEL_5;
    }
  }
  uint64_t result = sub_21F1C2A50();
  uint64_t v4 = v6;
  char v5 = v7;
LABEL_5:
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_21F1A3BC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21F1C2940();
  uint64_t result = sub_21F1A3B2C(v1, (uint64_t)&v7);
  uint64_t v5 = v7;
  char v6 = v8;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_21F1A3C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_21F1C24D0();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_21F1A3C94()
{
  uint64_t v0 = sub_21F1C2940();
  sub_21F1A3D58((uint64_t)&v8);
  char v1 = v9;
  uint64_t v2 = *(void *)v10;
  char v3 = v11;
  uint64_t v4 = v12;
  long long v5 = v8;
  long long v6 = *(_OWORD *)&v10[8];
  long long v8 = (unint64_t)v0;
  char v9 = 1;
  *(_OWORD *)uint64_t v10 = v5;
  v10[16] = v1;
  uint64_t v11 = v2;
  long long v12 = v6;
  char v13 = v3;
  uint64_t v14 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41D0);
  sub_21F1A3E90();
  return sub_21F1C2F10();
}

uint64_t sub_21F1A3D58@<X0>(uint64_t a1@<X8>)
{
  sub_21F193DA8();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_21F1C2CB0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_21F1C2CB0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v12 & 1;
  *(void *)(a1 + 56) = v14;
  sub_21F1A68F8(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_21F1A68F8(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_21F193DFC(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_21F193DFC(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

unint64_t sub_21F1A3E90()
{
  unint64_t result = qword_267EC41D8;
  if (!qword_267EC41D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC41D0);
    sub_21F192EE4(&qword_267EC41E0, &qword_267EC41E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC41D8);
  }
  return result;
}

unint64_t sub_21F1A3F28()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41F8);
  uint64_t v0 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EC4200) - 8);
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21F1C4BB0;
  uint64_t v3 = (void *)(v2 + v1);
  uint64_t v4 = v2 + v1 + v0[14];
  *uint64_t v3 = 0x7473726966;
  v3[1] = 0xE500000000000000;
  sub_21F1C28F0();
  uint64_t v5 = sub_21F1C2C90();
  memset(v10, 0, 32);
  sub_21F1A2BDC(v5, v7, v6 & 1, v8, 0, (uint64_t)v10, v4);
  unint64_t result = sub_21F1A4060(v2);
  qword_267EC64E8 = result;
  return result;
}

unint64_t sub_21F1A4060(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4200);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4268);
  uint64_t v6 = sub_21F1C3230();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_21F196550(v12, (uint64_t)v5, &qword_267EC4200);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_21F1A6738(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for KeyPathView();
    unint64_t result = sub_21F1A67B0(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

uint64_t static KeyPathView_Previews.previews.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41F0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  sub_21F1A4538((uint64_t)v4);
  uint64_t KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41F8);
  uint64_t v6 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EC4200) - 8);
  uint64_t v7 = *(void *)(*(void *)v6 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21F1C4BC0;
  uint64_t v10 = (void *)(v9 + v8);
  uint64_t v11 = v9 + v8 + v6[14];
  *uint64_t v10 = 0x4977656976657270;
  v10[1] = 0xEB000000006D6574;
  uint64_t v12 = swift_getKeyPath();
  *(void *)&v28[8] = &type metadata for KeyPathView_Previews.MySource;
  uint64_t v13 = (void *)swift_allocObject();
  *(void *)&long long v27 = v13;
  v13[2] = 0x3120656C746954;
  v13[3] = 0xE700000000000000;
  v13[4] = 0x3220656C746954;
  v13[5] = 0xE700000000000000;
  memset(v33, 0, sizeof(v33));
  KeyPathView.init(path:source:shouldSuspendStateMachine:analyticsTag:)(v12, (uint64_t)&v27, 0, (uint64_t)v33, v11);
  uint64_t v14 = (void *)((char *)v10 + v7);
  uint64_t v15 = (uint64_t)v10 + v7 + v6[14];
  *uint64_t v14 = 0x3277656976657270;
  v14[1] = 0xE800000000000000;
  uint64_t v16 = sub_21F1C2940();
  sub_21F1A3D58((uint64_t)&v27);
  char v17 = v28[0];
  uint64_t v18 = *(void *)&v28[8];
  char v19 = v29;
  uint64_t v20 = v30;
  long long v21 = v27;
  long long v22 = *(_OWORD *)&v28[16];
  long long v27 = (unint64_t)v16;
  v28[0] = 1;
  *(_OWORD *)&v28[8] = v21;
  v28[24] = v17;
  uint64_t v29 = v18;
  long long v30 = v22;
  char v31 = v19;
  uint64_t v32 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41D0);
  sub_21F1A3E90();
  uint64_t v23 = sub_21F1C2F10();
  long long v27 = 0u;
  *(_OWORD *)uint64_t v28 = 0u;
  sub_21F1A2D90(v23, 0, (uint64_t)&v27, v15);
  unint64_t v24 = sub_21F1A4060(v9);
  sub_21F196550((uint64_t)v4, a1, &qword_267EC41F0);
  uint64_t v25 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EC4208) + 36));
  *uint64_t v25 = KeyPath;
  v25[1] = v24;
  return sub_21F196760((uint64_t)v4, &qword_267EC41F0);
}

uint64_t sub_21F1A4538@<X0>(uint64_t a1@<X8>)
{
  uint64_t v100 = a1;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4270);
  uint64_t v1 = MEMORY[0x270FA5388](v90);
  uint64_t v89 = (uint64_t)v87 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v91 = (uint64_t)v87 - v3;
  uint64_t v4 = sub_21F1C24D0();
  uint64_t v101 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for KeyPathView();
  uint64_t v88 = v8;
  v87[0] = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v99 = (uint64_t)v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v98 = (uint64_t)v87 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v97 = (uint64_t)v87 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v96 = (uint64_t)v87 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v95 = (uint64_t)v87 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v105 = (uint64_t)v87 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v94 = (void *)((char *)v87 - v22);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v93 = (void *)((char *)v87 - v24);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v92 = (void *)((char *)v87 - v26);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v87 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v106 = (uint64_t)v87 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)v87 - v33;
  MEMORY[0x270FA5388](v32);
  long long v36 = (char *)v87 - v35;
  uint64_t KeyPath = swift_getKeyPath();
  *((void *)&v110 + 1) = &type metadata for KeyPathView_Previews.MySource;
  uint64_t v38 = (void *)swift_allocObject();
  *(void *)&long long v109 = v38;
  v38[2] = 0x3120656C746954;
  v38[3] = 0xE700000000000000;
  v38[4] = 0x3220656C746954;
  v38[5] = 0xE700000000000000;
  long long v107 = 0u;
  long long v108 = 0u;
  *(void *)long long v36 = swift_getKeyPath();
  v36[8] = 0;
  *((_OWORD *)v36 + 3) = 0u;
  v36[64] = 0;
  *((_OWORD *)v36 + 2) = 0u;
  *(_OWORD *)(v36 + 88) = 0u;
  *(_OWORD *)(v36 + 72) = 0u;
  *((void *)v36 + 2) = KeyPath;
  *((void *)v36 + 3) = 0;
  swift_retain();
  sub_21F1A334C((uint64_t)&v109, (uint64_t)(v36 + 32));
  v36[64] = 0;
  sub_21F1A334C((uint64_t)&v107, (uint64_t)(v36 + 72));
  sub_21F1C24C0();
  swift_release();
  sub_21F196760((uint64_t)&v107, &qword_267EC41C8);
  sub_21F196760((uint64_t)&v109, &qword_267EC41C8);
  uint64_t v39 = *(int *)(v8 + 40);
  v103 = v36;
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v40(&v36[v39], v7, v4);
  sub_21F1C28F0();
  uint64_t v41 = sub_21F1C2C90();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  LOBYTE(v36) = v46 & 1;
  long long v109 = 0u;
  long long v110 = 0u;
  *(void *)uint64_t v34 = swift_getKeyPath();
  v34[8] = 0;
  *((void *)v34 + 2) = 0;
  *((_OWORD *)v34 + 2) = 0u;
  *((_OWORD *)v34 + 3) = 0u;
  *(_OWORD *)(v34 + 88) = 0u;
  *(_OWORD *)(v34 + 72) = 0u;
  *(void *)&long long v107 = v41;
  *((void *)&v107 + 1) = v43;
  LOBYTE(v108) = (_BYTE)v36;
  *((void *)&v108 + 1) = v45;
  sub_21F1A68F8(v41, v43, (char)v36);
  swift_bridgeObjectRetain();
  *((void *)v34 + 3) = sub_21F1C2F10();
  v34[64] = 0;
  sub_21F1A334C((uint64_t)&v109, (uint64_t)(v34 + 72));
  sub_21F1C24C0();
  sub_21F196760((uint64_t)&v109, &qword_267EC41C8);
  sub_21F193DFC(v41, v43, (char)v36);
  swift_bridgeObjectRelease();
  uint64_t v47 = v88;
  uint64_t v48 = *(int *)(v88 + 40);
  v104 = v34;
  uint64_t v49 = v7;
  uint64_t v50 = v7;
  uint64_t v51 = v101;
  uint64_t v52 = v5 + 32;
  v102 = v40;
  ((void (*)(char *, char *))v40)(&v34[v48], v50);
  if (qword_267EC50C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v53 = qword_267EC64E8;
  if (!*(void *)(qword_267EC64E8 + 16))
  {
    uint64_t v58 = 1;
    uint64_t v55 = v91;
LABEL_8:
    uint64_t v57 = v87[0];
    goto LABEL_9;
  }
  unint64_t v54 = sub_21F1A6738(0x7473726966, 0xE500000000000000);
  uint64_t v55 = v91;
  if ((v56 & 1) == 0)
  {
    uint64_t v58 = 1;
    goto LABEL_8;
  }
  uint64_t v57 = v87[0];
  sub_21F1A6A80(*(void *)(v53 + 56) + *(void *)(v87[0] + 72) * v54, v91);
  uint64_t v58 = 0;
LABEL_9:
  uint64_t v59 = v47;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56))(v55, v58, 1, v47);
  swift_endAccess();
  long long v109 = 0u;
  long long v110 = 0u;
  *(void *)uint64_t v29 = swift_getKeyPath();
  v29[8] = 0;
  *((void *)v29 + 2) = 0;
  *((_OWORD *)v29 + 2) = 0u;
  *((_OWORD *)v29 + 3) = 0u;
  *(_OWORD *)(v29 + 88) = 0u;
  *(_OWORD *)(v29 + 72) = 0u;
  sub_21F196550(v55, v89, &qword_267EC4270);
  sub_21F1A6908();
  *((void *)v29 + 3) = sub_21F1C2F10();
  v29[64] = 0;
  sub_21F1A334C((uint64_t)&v109, (uint64_t)(v29 + 72));
  uint64_t v60 = v49;
  sub_21F1C24C0();
  sub_21F196760((uint64_t)&v109, &qword_267EC41C8);
  sub_21F196760(v55, &qword_267EC4270);
  uint64_t v61 = &v29[*(int *)(v47 + 40)];
  v87[1] = v52;
  v102(v61, v49, v51);
  uint64_t v62 = sub_21F1A67B0((uint64_t)v29, v106);
  MEMORY[0x270FA5388](v62);
  uint64_t v63 = swift_getKeyPath();
  uint64_t v64 = qword_267EC64E8;
  *((void *)&v110 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4288);
  *(void *)&long long v109 = v64;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v65 = swift_getKeyPath();
  uint64_t v66 = (uint64_t)v92;
  *uint64_t v92 = v65;
  *(unsigned char *)(v66 + 8) = 0;
  *(_OWORD *)(v66 + 48) = 0u;
  *(unsigned char *)(v66 + 64) = 0;
  *(_OWORD *)(v66 + 32) = 0u;
  *(_OWORD *)(v66 + 88) = 0u;
  *(_OWORD *)(v66 + 72) = 0u;
  *(void *)(v66 + 16) = v63;
  *(void *)(v66 + 24) = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21F1A334C((uint64_t)&v109, v66 + 32);
  *(unsigned char *)(v66 + 64) = 0;
  sub_21F1A334C((uint64_t)&v107, v66 + 72);
  sub_21F1C24C0();
  swift_release();
  sub_21F196760((uint64_t)&v107, &qword_267EC41C8);
  sub_21F196760((uint64_t)&v109, &qword_267EC41C8);
  uint64_t v67 = v51;
  uint64_t v68 = (uint64_t (*)(uint64_t, char *, uint64_t))v102;
  uint64_t v69 = ((uint64_t (*)(uint64_t, char *, uint64_t))v102)(v66 + *(int *)(v59 + 40), v60, v51);
  MEMORY[0x270FA5388](v69);
  uint64_t v70 = swift_getKeyPath();
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v71 = swift_getKeyPath();
  uint64_t v72 = (uint64_t)v93;
  uint64_t *v93 = v71;
  *(unsigned char *)(v72 + 8) = 0;
  *(_OWORD *)(v72 + 48) = 0u;
  *(unsigned char *)(v72 + 64) = 0;
  *(_OWORD *)(v72 + 32) = 0u;
  *(_OWORD *)(v72 + 88) = 0u;
  *(_OWORD *)(v72 + 72) = 0u;
  *(void *)(v72 + 16) = v70;
  *(void *)(v72 + 24) = 0;
  swift_retain();
  sub_21F1A334C((uint64_t)&v109, v72 + 32);
  *(unsigned char *)(v72 + 64) = 0;
  sub_21F1A334C((uint64_t)&v107, v72 + 72);
  sub_21F1C24C0();
  swift_release();
  sub_21F196760((uint64_t)&v107, &qword_267EC41C8);
  sub_21F196760((uint64_t)&v109, &qword_267EC41C8);
  uint64_t v73 = v59;
  uint64_t v74 = v68(v72 + *(int *)(v59 + 40), v60, v67);
  MEMORY[0x270FA5388](v74);
  uint64_t v75 = swift_getKeyPath();
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v76 = swift_getKeyPath();
  uint64_t v77 = (uint64_t)v94;
  *uint64_t v94 = v76;
  *(unsigned char *)(v77 + 8) = 0;
  *(_OWORD *)(v77 + 48) = 0u;
  *(unsigned char *)(v77 + 64) = 0;
  *(_OWORD *)(v77 + 32) = 0u;
  *(_OWORD *)(v77 + 88) = 0u;
  *(_OWORD *)(v77 + 72) = 0u;
  *(void *)(v77 + 16) = v75;
  *(void *)(v77 + 24) = 0;
  swift_retain();
  sub_21F1A334C((uint64_t)&v109, v77 + 32);
  *(unsigned char *)(v77 + 64) = 0;
  sub_21F1A334C((uint64_t)&v107, v77 + 72);
  sub_21F1C24C0();
  swift_release();
  sub_21F196760((uint64_t)&v107, &qword_267EC41C8);
  sub_21F196760((uint64_t)&v109, &qword_267EC41C8);
  v68(v77 + *(int *)(v73 + 40), v60, v101);
  uint64_t v78 = v105;
  sub_21F1A6A80((uint64_t)v103, v105);
  uint64_t v79 = v95;
  sub_21F1A6A80((uint64_t)v104, v95);
  uint64_t v80 = v96;
  sub_21F1A6A80(v106, v96);
  uint64_t v81 = v97;
  sub_21F1A6A80(v66, v97);
  uint64_t v82 = v98;
  sub_21F1A6A80(v72, v98);
  uint64_t v83 = v99;
  sub_21F1A6A80(v77, v99);
  uint64_t v84 = v100;
  sub_21F1A6A80(v78, v100);
  uint64_t v85 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267EC4290);
  sub_21F1A6A80(v79, v84 + v85[12]);
  sub_21F1A6A80(v80, v84 + v85[16]);
  sub_21F1A6A80(v81, v84 + v85[20]);
  sub_21F1A6A80(v82, v84 + v85[24]);
  sub_21F1A6A80(v83, v84 + v85[28]);
  sub_21F1A6AE4(v77);
  sub_21F1A6AE4(v72);
  sub_21F1A6AE4(v66);
  sub_21F1A6AE4(v106);
  sub_21F1A6AE4((uint64_t)v104);
  sub_21F1A6AE4((uint64_t)v103);
  sub_21F1A6AE4(v83);
  sub_21F1A6AE4(v82);
  sub_21F1A6AE4(v81);
  sub_21F1A6AE4(v80);
  sub_21F1A6AE4(v79);
  return sub_21F1A6AE4(v105);
}

uint64_t sub_21F1A5168@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21F1C2940();
  sub_21F1A3D58((uint64_t)&v10);
  char v3 = v11;
  uint64_t v4 = *(void *)v12;
  char v5 = v13;
  uint64_t v6 = v14;
  long long v7 = v10;
  long long v8 = *(_OWORD *)&v12[8];
  long long v10 = (unint64_t)v2;
  char v11 = 1;
  *(_OWORD *)uint64_t v12 = v7;
  v12[16] = v3;
  uint64_t v13 = v4;
  long long v14 = v8;
  char v15 = v5;
  uint64_t v16 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41D0);
  sub_21F1A3E90();
  uint64_t result = sub_21F1C2F10();
  *a1 = result;
  return result;
}

uint64_t sub_21F1A522C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21F1A526C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_21F1A6738(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = type metadata accessor for KeyPathView();
    uint64_t v17 = *(void *)(v10 - 8);
    sub_21F1A6A80(v9 + *(void *)(v17 + 72) * v8, a4);
    char v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
    uint64_t v12 = a4;
    uint64_t v13 = 0;
    uint64_t v14 = v10;
  }
  else
  {
    uint64_t v15 = type metadata accessor for KeyPathView();
    char v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v14 = v15;
    uint64_t v12 = a4;
    uint64_t v13 = 1;
  }
  return v11(v12, v13, 1, v14);
}

uint64_t sub_21F1A5380(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (v3 == *a1 && v4 == a1[1]) {
    return 1;
  }
  else {
    return sub_21F1C3260();
  }
}

uint64_t sub_21F1A53A8(void *a1)
{
  return MEMORY[0x270F9D888](*a1, a1[1]);
}

uint64_t sub_21F1A53B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  swift_bridgeObjectRetain();
  sub_21F1A526C(v5, v6, v4, a3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F1A5414(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4270);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a3;
  uint64_t v8 = a3[1];
  sub_21F196550(a1, (uint64_t)v7, &qword_267EC4270);
  swift_bridgeObjectRetain();
  return sub_21F1A54C8((uint64_t)v7, v9, v8);
}

uint64_t sub_21F1A54C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4270);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for KeyPathView();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_21F196760(a1, &qword_267EC4270);
    sub_21F1A6B40(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_21F196760((uint64_t)v10, &qword_267EC4270);
  }
  else
  {
    sub_21F1A67B0(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_21F1A7284((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21F1A5684()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1A56A0()
{
  return sub_21F1A69AC(&qword_267EC4210, MEMORY[0x263F07508]);
}

unint64_t sub_21F1A56EC()
{
  unint64_t result = qword_267EC4218;
  if (!qword_267EC4218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4218);
  }
  return result;
}

uint64_t sub_21F1A5740()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1A5760(uint64_t a1)
{
  unint64_t v2 = sub_21F1A66E4();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_21F1A57AC(uint64_t a1)
{
  unint64_t v2 = sub_21F1A66E4();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t dispatch thunk of ClientViewSource.init(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ClientViewSource.header.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ClientViewSource.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ClientViewSource.footer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ClientViewSource.secondaryContent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ClientViewSource.secondaryFooter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

unint64_t initializeBufferWithCopyOfBuffer for KeyPathView(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_21F1A3400(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v9;
    uint64_t v10 = *(void *)(a2 + 56);
    swift_retain();
    swift_retain();
    if (v10)
    {
      *(void *)(a1 + 56) = v10;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8))(a1 + 32, a2 + 32, v10);
    }
    else
    {
      long long v12 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v12;
    }
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    uint64_t v13 = (_OWORD *)(a1 + 72);
    uint64_t v14 = (_OWORD *)(a2 + 72);
    uint64_t v15 = *(void *)(a2 + 96);
    if (v15)
    {
      *(void *)(a1 + 96) = v15;
      (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
    }
    else
    {
      long long v16 = *(_OWORD *)(a2 + 88);
      *uint64_t v13 = *v14;
      *(_OWORD *)(a1 + 88) = v16;
    }
    uint64_t v17 = *(int *)(a3 + 40);
    uint64_t v18 = a1 + v17;
    uint64_t v19 = a2 + v17;
    uint64_t v20 = sub_21F1C24D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for KeyPathView(uint64_t a1, uint64_t a2)
{
  sub_21F1A340C(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();
  swift_release();
  if (*(void *)(a1 + 56)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  }
  if (*(void *)(a1 + 96)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  }
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_21F1C24D0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_21F1A3400(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  uint64_t v9 = *(void *)(a2 + 56);
  swift_retain();
  swift_retain();
  if (v9)
  {
    *(void *)(a1 + 56) = v9;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(a1 + 32, a2 + 32, v9);
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v10;
  }
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v11 = (_OWORD *)(a1 + 72);
  long long v12 = (_OWORD *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 96);
  if (v13)
  {
    *(void *)(a1 + 96) = v13;
    (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
  }
  else
  {
    long long v14 = *(_OWORD *)(a2 + 88);
    _OWORD *v11 = *v12;
    *(_OWORD *)(a1 + 88) = v14;
  }
  uint64_t v15 = *(int *)(a3 + 40);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_21F1C24D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

uint64_t assignWithCopy for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_21F1A3400(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_21F1A340C(v8, v9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  }
  else if (v10)
  {
    *(void *)(a1 + 56) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 32, a2 + 32);
    goto LABEL_8;
  }
  long long v11 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v11;
LABEL_8:
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 96);
  if (!*(void *)(a1 + 96))
  {
    if (v12)
    {
      *(void *)(a1 + 96) = v12;
      (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 72, a2 + 72);
      goto LABEL_15;
    }
LABEL_14:
    long long v13 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v13;
    goto LABEL_15;
  }
  if (!v12)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
LABEL_15:
  uint64_t v14 = *(int *)(a3 + 40);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_21F1C24D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
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
          *uint64_t v3 = *a2;
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

uint64_t initializeWithTake for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v5 = *(int *)(a3 + 40);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v8 = sub_21F1C24D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for KeyPathView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_21F1A340C(v8, v9);
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  *(void *)(a1 + 24) = a2[3];
  swift_release();
  if (*(void *)(a1 + 56)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  }
  long long v10 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  if (*(void *)(a1 + 96)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  }
  long long v11 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
  *(_OWORD *)(a1 + 88) = v11;
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t)a2 + v12;
  uint64_t v15 = sub_21F1C24D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21F1A61E8);
}

uint64_t sub_21F1A61E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
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
    uint64_t v9 = sub_21F1C24D0();
    long long v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 40);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21F1A62B8);
}

uint64_t sub_21F1A62B8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = sub_21F1C24D0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_21F1A6360()
{
  uint64_t result = sub_21F1C24D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for KeyPathView_Previews()
{
  return &type metadata for KeyPathView_Previews;
}

uint64_t destroy for KeyPathView_Previews.MySource()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for KeyPathView_Previews.MySource(void *a1, void *a2)
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

void *assignWithCopy for KeyPathView_Previews.MySource(void *a1, void *a2)
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

void *assignWithTake for KeyPathView_Previews.MySource(void *a1, void *a2)
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

ValueMetadata *type metadata accessor for KeyPathView_Previews.MySource()
{
  return &type metadata for KeyPathView_Previews.MySource;
}

uint64_t sub_21F1A656C()
{
  return sub_21F192EE4(&qword_267EC4220, &qword_267EC4228);
}

unint64_t sub_21F1A65AC()
{
  unint64_t result = qword_267EC4230;
  if (!qword_267EC4230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4208);
    sub_21F1A664C();
    sub_21F192EE4(&qword_267EC4250, &qword_267EC4258);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4230);
  }
  return result;
}

unint64_t sub_21F1A664C()
{
  unint64_t result = qword_267EC4238;
  if (!qword_267EC4238)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC41F0);
    sub_21F192EE4(&qword_267EC4240, &qword_267EC4248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4238);
  }
  return result;
}

unint64_t sub_21F1A66E4()
{
  unint64_t result = qword_267EC4260;
  if (!qword_267EC4260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4260);
  }
  return result;
}

unint64_t sub_21F1A6738(uint64_t a1, uint64_t a2)
{
  sub_21F1C3280();
  sub_21F1C3070();
  uint64_t v4 = sub_21F1C32A0();
  return sub_21F1A6814(a1, a2, v4);
}

uint64_t sub_21F1A67B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F1A6814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21F1C3260() & 1) == 0)
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
      while (!v14 && (sub_21F1C3260() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21F1A68F8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_21F1A6908()
{
  unint64_t result = qword_267EC4278;
  if (!qword_267EC4278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4270);
    sub_21F1A69AC((unint64_t *)&qword_267EC4280, (void (*)(uint64_t))type metadata accessor for KeyPathView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4278);
  }
  return result;
}

uint64_t sub_21F1A69AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21F1A69F4()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_21F1A6A00()
{
  return 16;
}

uint64_t sub_21F1A6A0C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F1A6A18(uint64_t a1, uint64_t a2)
{
  return a2;
}

__n128 sub_21F1A6A74(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_21F1A6A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F1A6AE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21F1A6B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_21F1A6738(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21F1A7480();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for KeyPathView();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_21F1A67B0(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_21F1A7074(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for KeyPathView();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_21F1A6CD0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for KeyPathView();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4268);
  int v43 = a2;
  uint64_t v9 = sub_21F1C3220();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_21F1A67B0(v30, (uint64_t)v7);
    }
    else
    {
      sub_21F1A6A80(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_21F1C3280();
    sub_21F1C3070();
    uint64_t result = sub_21F1C32A0();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *uint64_t v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_21F1A67B0((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_21F1A7074(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21F1C3170();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_21F1C3280();
        swift_bridgeObjectRetain();
        sub_21F1C3070();
        uint64_t v9 = sub_21F1C32A0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for KeyPathView() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21F1A7284(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_21F1A6738(a2, a3);
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
      sub_21F1A7480();
      goto LABEL_7;
    }
    sub_21F1A6CD0(v15, a4 & 1);
    unint64_t v22 = sub_21F1A6738(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_21F1C3270();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for KeyPathView() - 8) + 72) * v12;
    return sub_21F1A76EC(a1, v20);
  }
LABEL_13:
  sub_21F1A73E8(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_21F1A73E8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for KeyPathView();
  uint64_t result = sub_21F1A67B0(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_21F1A7480()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for KeyPathView();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4268);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_21F1C3210();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_21F1A6A80(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    unint64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *unint64_t v22 = v19;
    v22[1] = v20;
    sub_21F1A67B0((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_21F1A76EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F1A7750(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_21F1A77B8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t PlaceholderActionItem.init(viewTag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_getKeyPath();
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  return result;
}

uint64_t PlaceholderActionItem.viewTag.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PlaceholderActionItem.viewTag.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*PlaceholderActionItem.viewTag.modify())()
{
  return nullsub_1;
}

uint64_t PlaceholderActionItem.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4298);
  MEMORY[0x270FA5388](v3);
  uint64_t v42 = (uint64_t)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC42A0);
  MEMORY[0x270FA5388](v45);
  uint64_t v47 = (uint64_t)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4270);
  uint64_t v6 = MEMORY[0x270FA5388](v46);
  uint64_t v41 = (uint64_t)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v43 = (uint64_t)v40 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v40 - v10;
  uint64_t v12 = *(void *)v1;
  char v13 = *(unsigned char *)(v1 + 8);
  uint64_t v14 = *(void *)(v1 + 16);
  uint64_t v15 = *(void *)(v1 + 24);
  sub_21F1A3400(*(void *)v1, v13);
  swift_bridgeObjectRetain();
  sub_21F1A3400(v12, v13);
  uint64_t v16 = sub_21F1A310C(v12, v13);
  sub_21F1A340C(v12, v13);
  sub_21F1A340C(v12, v13);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v16 + 16);
  uint64_t v44 = v14;
  if (v17)
  {
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_21F1A6738(v14, v15);
    if (v19)
    {
      unint64_t v20 = v18;
      v40[1] = v3;
      uint64_t v21 = *(void *)(v16 + 56);
      uint64_t v22 = type metadata accessor for KeyPathView();
      uint64_t v23 = *(void *)(v22 - 8);
      v40[0] = a1;
      uint64_t v24 = v23;
      sub_21F1A6A80(v21 + *(void *)(v23 + 72) * v20, (uint64_t)v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v11, 0, 1, v22);
    }
    else
    {
      uint64_t v22 = type metadata accessor for KeyPathView();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v11, 1, 1, v22);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = type metadata accessor for KeyPathView();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v11, 1, 1, v22);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for KeyPathView();
  uint64_t v25 = *(void *)(v22 - 8);
  int v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v11, 1, v22);
  uint64_t v27 = sub_21F196760((uint64_t)v11, &qword_267EC4270);
  if (v26 == 1)
  {
    MEMORY[0x270FA5388](v27);
    uint64_t v28 = MEMORY[0x263F1BA08];
    uint64_t v29 = MEMORY[0x263F1A830];
    uint64_t v30 = MEMORY[0x263F1BA00];
    uint64_t v31 = MEMORY[0x263F1A820];
    sub_21F1BFF68(&v48);
    *((void *)&v39 + 1) = v31;
    *(void *)&long long v39 = v30;
    uint64_t v32 = v42;
    PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)(nullsub_1, (uint64_t (*)(uint64_t))sub_21F1A7F90, (void (*)(uint64_t))sub_21F1A868C, &v48, v28, v42, v29, v29, v39, v31);
    unint64_t v33 = &qword_267EC4298;
    sub_21F196550(v32, v47, &qword_267EC4298);
    swift_storeEnumTagMultiPayload();
    sub_21F1A8CDC((unint64_t *)&qword_267EC4278, &qword_267EC4270, (void (*)(void))sub_21F1A86F4);
    sub_21F192EE4(&qword_267EC42A8, &qword_267EC4298);
  }
  else
  {
    sub_21F1A3400(v12, v13);
    swift_bridgeObjectRetain();
    sub_21F1A3400(v12, v13);
    uint64_t v34 = sub_21F1A310C(v12, v13);
    sub_21F1A340C(v12, v13);
    sub_21F1A340C(v12, v13);
    swift_bridgeObjectRelease();
    if (*(void *)(v34 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v35 = sub_21F1A6738(v44, v15);
      uint64_t v36 = v41;
      if (v37)
      {
        sub_21F1A6A80(*(void *)(v34 + 56) + *(void *)(v25 + 72) * v35, v41);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v36, 0, 1, v22);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v41, 1, 1, v22);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v36 = v41;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v41, 1, 1, v22);
    }
    swift_bridgeObjectRelease();
    uint64_t v32 = v43;
    sub_21F1A874C(v36, v43);
    unint64_t v33 = &qword_267EC4270;
    sub_21F196550(v32, v47, &qword_267EC4270);
    swift_storeEnumTagMultiPayload();
    sub_21F1A8CDC((unint64_t *)&qword_267EC4278, &qword_267EC4270, (void (*)(void))sub_21F1A86F4);
    sub_21F192EE4(&qword_267EC42A8, &qword_267EC4298);
  }
  sub_21F1C2A50();
  return sub_21F196760(v32, v33);
}

uint64_t sub_21F1A7F90@<X0>(uint64_t a1@<X8>)
{
  return sub_21F1A84D4(a1);
}

uint64_t static PlaceholderActionItem_Previews.previews.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC42B0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = &unk_26D0B99A8;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC42B8);
  sub_21F192EE4(&qword_267EC42C0, &qword_267EC42B8);
  sub_21F1A87B4();
  sub_21F1C2F70();
  uint64_t KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC41F8);
  uint64_t v7 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EC4200) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21F1C4BB0;
  uint64_t v10 = (void *)(v9 + v8);
  uint64_t v11 = v9 + v8 + v7[14];
  *uint64_t v10 = 0x4977656976657270;
  v10[1] = 0xEB000000006D6574;
  uint64_t v12 = swift_getKeyPath();
  v18[3] = &type metadata for PreviewItem;
  memset(v17, 0, sizeof(v17));
  char v13 = sub_21F1A2A54();
  KeyPathView.init(path:source:shouldSuspendStateMachine:analyticsTag:)(v12, (uint64_t)v18, v13 & 1, (uint64_t)v17, v11);
  unint64_t v14 = sub_21F1A4060(v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  uint64_t v15 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EC42D0) + 36));
  uint64_t *v15 = KeyPath;
  v15[1] = v14;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21F1A8274@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  *(void *)a2 = swift_getKeyPath();
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewItem.asAnyView.getter()
{
  sub_21F1A8808();
  return sub_21F1C2F10();
}

uint64_t sub_21F1A8300@<X0>(uint64_t *a1@<X8>)
{
  sub_21F1A8808();
  uint64_t result = sub_21F1C2F10();
  *a1 = result;
  return result;
}

uint64_t sub_21F1A833C(uint64_t a1)
{
  unint64_t v2 = sub_21F1A8D84();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_21F1A8388(uint64_t a1)
{
  unint64_t v2 = sub_21F1A8D84();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t PreviewItem.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F1BA08];
  uint64_t v3 = MEMORY[0x263F1A830];
  uint64_t v4 = MEMORY[0x263F1BA00];
  uint64_t v5 = MEMORY[0x263F1A820];
  sub_21F1BFF68(&v8);
  *((void *)&v7 + 1) = v5;
  *(void *)&long long v7 = v4;
  return PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)(nullsub_1, (uint64_t (*)(uint64_t))sub_21F1A84B0, (void (*)(uint64_t))sub_21F1A8534, &v8, v2, a1, v3, v3, v7, v5);
}

uint64_t sub_21F1A84B0@<X0>(uint64_t a1@<X8>)
{
  return sub_21F1A84D4(a1);
}

uint64_t sub_21F1A84D4@<X0>(uint64_t a1@<X8>)
{
  sub_21F1C28F0();
  uint64_t result = sub_21F1C2C90();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_21F1A8534@<X0>(uint64_t *a1@<X8>)
{
  sub_21F1C28F0();
  uint64_t result = sub_21F1C2C90();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4 & 1;
  a1[3] = v5;
  return result;
}

uint64_t sub_21F1A85B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F1BA08];
  uint64_t v3 = MEMORY[0x263F1A830];
  uint64_t v4 = MEMORY[0x263F1BA00];
  uint64_t v5 = MEMORY[0x263F1A820];
  sub_21F1BFF68(&v8);
  *((void *)&v7 + 1) = v5;
  *(void *)&long long v7 = v4;
  return PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)(nullsub_1, (uint64_t (*)(uint64_t))sub_21F1A84B0, (void (*)(uint64_t))sub_21F1A8534, &v8, v2, a1, v3, v3, v7, v5);
}

uint64_t sub_21F1A868C@<X0>(uint64_t *a1@<X8>)
{
  sub_21F193DA8();
  swift_bridgeObjectRetain();
  uint64_t result = sub_21F1C2CB0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4 & 1;
  a1[3] = v5;
  return result;
}

unint64_t sub_21F1A86F4()
{
  unint64_t result = qword_267EC4280;
  if (!qword_267EC4280)
  {
    type metadata accessor for KeyPathView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4280);
  }
  return result;
}

uint64_t sub_21F1A874C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F1A87B4()
{
  unint64_t result = qword_267EC42C8;
  if (!qword_267EC42C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC42C8);
  }
  return result;
}

unint64_t sub_21F1A8808()
{
  unint64_t result = qword_267EC42D8;
  if (!qword_267EC42D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC42D8);
  }
  return result;
}

uint64_t sub_21F1A885C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21F1A887C()
{
  unint64_t result = qword_267EC42E0;
  if (!qword_267EC42E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC42E0);
  }
  return result;
}

uint64_t sub_21F1A88D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1A88EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PlaceholderActionItem(uint64_t a1)
{
  sub_21F1A340C(*(void *)a1, *(unsigned char *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PlaceholderActionItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_21F1A3400(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PlaceholderActionItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_21F1A3400(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_21F1A340C(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PlaceholderActionItem(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_21F1A340C(v6, v7);
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlaceholderActionItem(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PlaceholderActionItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PlaceholderActionItem()
{
  return &type metadata for PlaceholderActionItem;
}

ValueMetadata *type metadata accessor for PlaceholderActionItem_Previews()
{
  return &type metadata for PlaceholderActionItem_Previews;
}

ValueMetadata *type metadata accessor for PreviewItem()
{
  return &type metadata for PreviewItem;
}

unint64_t sub_21F1A8B28()
{
  unint64_t result = qword_267EC42E8;
  if (!qword_267EC42E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC42F0);
    sub_21F1A8CDC((unint64_t *)&qword_267EC4278, &qword_267EC4270, (void (*)(void))sub_21F1A86F4);
    sub_21F192EE4(&qword_267EC42A8, &qword_267EC4298);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC42E8);
  }
  return result;
}

unint64_t sub_21F1A8C04()
{
  unint64_t result = qword_267EC42F8;
  if (!qword_267EC42F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC42D0);
    sub_21F1A8CDC(&qword_267EC4300, &qword_267EC42B0, (void (*)(void))sub_21F1A87B4);
    sub_21F192EE4(&qword_267EC4250, &qword_267EC4258);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC42F8);
  }
  return result;
}

uint64_t sub_21F1A8CDC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_21F1A8D48()
{
  return sub_21F192EE4(&qword_267EC42A8, &qword_267EC4298);
}

unint64_t sub_21F1A8D84()
{
  unint64_t result = qword_267EC4308;
  if (!qword_267EC4308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4308);
  }
  return result;
}

BOOL static PaymentDetailSheet.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void PaymentDetailSheet.id.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t PaymentDetailSheet.hash(into:)()
{
  return sub_21F1C3290();
}

uint64_t PaymentDetailSheet.hashValue.getter()
{
  return sub_21F1C32A0();
}

void sub_21F1A8E6C(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

BOOL PaymentDetailSheet.shouldSuspendStateMachine.getter()
{
  return *v0 != 2;
}

unint64_t sub_21F1A8E8C()
{
  unint64_t result = qword_267EC4310;
  if (!qword_267EC4310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4310);
  }
  return result;
}

unint64_t sub_21F1A8EE4()
{
  unint64_t result = qword_267EC4318;
  if (!qword_267EC4318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4318);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PaymentDetailSheet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
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
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PaymentDetailSheet(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x21F1A9094);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PaymentDetailSheet()
{
  return &type metadata for PaymentDetailSheet;
}

uint64_t sub_21F1A90CC@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  switch(*a1)
  {
    case 1:
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
      unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
      uint64_t v5 = v10;
      uint64_t v6 = a2;
      uint64_t v7 = 2;
      break;
    case 2:
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
      unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
      uint64_t v5 = v8;
      uint64_t v6 = a2;
      uint64_t v7 = 3;
      break;
    case 3:
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
      unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
      uint64_t v5 = v9;
      uint64_t v6 = a2;
      uint64_t v7 = 4;
      break;
    default:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
      unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
      uint64_t v5 = v3;
      uint64_t v6 = a2;
      uint64_t v7 = 1;
      break;
  }
  return v4(v6, v7, 6, v5);
}

uint64_t AccessoryView.init(style:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21F1AA108(a1, a2);
}

double AccessoryView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for AccessoryViewStyle(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v25 - v8;
  sub_21F1ABA9C(v2, (uint64_t)&v25 - v8, type metadata accessor for AccessoryViewStyle);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
  switch(v11(v9, 6, v10))
  {
    case 1u:
      memset(v28, 0, sizeof(v28));
      char v29 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4328);
      sub_21F1AA16C();
      goto LABEL_18;
    case 2u:
    case 3u:
    case 4u:
      sub_21F1ABA9C(v2, (uint64_t)v7, type metadata accessor for AccessoryViewStyle);
      unsigned int v12 = v11(v7, 6, v10) - 2;
      if (v12 >= 3)
      {
        sub_21F1ABB04((uint64_t)v7, type metadata accessor for AccessoryViewStyle);
        char v13 = 0;
      }
      else
      {
        char v13 = v12 + 1;
      }
      v28[0] = v13;
      ChevronView.init(style:)(v28, (uint64_t)&v30);
      uint64_t v14 = *((void *)&v30 + 1);
      char v15 = v31;
      *(void *)&long long v30 = v30;
      HIBYTE(v31) = 1;
      sub_21F1980F0(*((uint64_t *)&v30 + 1), v31);
      sub_21F1AA2D0();
      sub_21F1C2A50();
      if (v28[17]) {
        __int16 v16 = 256;
      }
      else {
        __int16 v16 = 0;
      }
      long long v30 = *(_OWORD *)v28;
      unsigned __int16 v31 = v16 | v28[16];
      unsigned __int8 v32 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4340);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4350);
      sub_21F1AA1E8();
      sub_21F1AA254();
      sub_21F1C2A50();
      *(_OWORD *)uint64_t v28 = v25;
      *(_WORD *)&v28[16] = v26;
      v28[18] = v27 != 0;
      char v29 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4328);
      sub_21F1AA16C();
      sub_21F1C2A50();
      sub_21F198130(v14, v15);
      goto LABEL_19;
    case 5u:
      v28[0] = 0;
      goto LABEL_12;
    case 6u:
      sub_21F1AA2D0();
      long long v30 = 0uLL;
      unsigned __int16 v31 = 0;
      sub_21F1C2A50();
      if (v28[17]) {
        __int16 v21 = 256;
      }
      else {
        __int16 v21 = 0;
      }
      long long v30 = *(_OWORD *)v28;
      unsigned __int16 v31 = v21 | v28[16];
      unsigned __int8 v32 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4340);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4350);
      sub_21F1AA1E8();
      sub_21F1AA254();
      sub_21F1C2A50();
      __int16 v19 = v26;
      BOOL v20 = v27 != 0;
      goto LABEL_17;
    default:
      swift_bridgeObjectRelease();
      uint64_t v17 = &v9[*(int *)(v10 + 48)];
      uint64_t v18 = sub_21F1C2C50();
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
      v28[0] = 1;
LABEL_12:
      sub_21F1C2A50();
      long long v30 = v30;
      unsigned __int16 v31 = 0;
      unsigned __int8 v32 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4340);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4350);
      sub_21F1AA1E8();
      sub_21F1AA254();
      sub_21F1C2A50();
      __int16 v19 = v26;
      BOOL v20 = v27 != 0;
LABEL_17:
      *(_OWORD *)uint64_t v28 = v25;
      *(_WORD *)&v28[16] = v19;
      v28[18] = v20;
      char v29 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4328);
      sub_21F1AA16C();
LABEL_18:
      sub_21F1C2A50();
LABEL_19:
      double result = *(double *)&v30;
      int v23 = v31 | (v32 << 16);
      char v24 = v33;
      *(_OWORD *)a1 = v30;
      *(_WORD *)(a1 + 16) = v23;
      *(unsigned char *)(a1 + 18) = BYTE2(v23);
      *(unsigned char *)(a1 + 19) = v24;
      return result;
  }
}

uint64_t sub_21F1A97E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AccessoryView(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v34 = (uint64_t)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v33 = (uint64_t)&v31 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unsigned int v12 = (char *)&v31 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  char v15 = (char *)&v31 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  __int16 v21 = (char *)&v31 - v20;
  MEMORY[0x270FA5388](v19);
  int v23 = (char *)&v31 - v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  long long v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  v25(v23, 3, 6, v24);
  v25(v21, 4, 6, v24);
  v25(v18, 2, 6, v24);
  v25(v15, 1, 6, v24);
  uint64_t v26 = (uint64_t)v12;
  unsigned __int8 v32 = v12;
  sub_21F1ABA9C((uint64_t)v23, (uint64_t)v12, type metadata accessor for AccessoryView);
  unsigned __int16 v31 = v9;
  sub_21F1ABA9C((uint64_t)v21, (uint64_t)v9, type metadata accessor for AccessoryView);
  uint64_t v27 = v33;
  sub_21F1ABA9C((uint64_t)v18, v33, type metadata accessor for AccessoryView);
  uint64_t v28 = v34;
  sub_21F1ABA9C((uint64_t)v15, v34, type metadata accessor for AccessoryView);
  sub_21F1ABA9C(v26, a1, type metadata accessor for AccessoryView);
  char v29 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267EC4398);
  sub_21F1ABA9C((uint64_t)v9, a1 + v29[12], type metadata accessor for AccessoryView);
  sub_21F1ABA9C(v27, a1 + v29[16], type metadata accessor for AccessoryView);
  sub_21F1ABA9C(v28, a1 + v29[20], type metadata accessor for AccessoryView);
  sub_21F1ABB04((uint64_t)v15, type metadata accessor for AccessoryView);
  sub_21F1ABB04((uint64_t)v18, type metadata accessor for AccessoryView);
  sub_21F1ABB04((uint64_t)v21, type metadata accessor for AccessoryView);
  sub_21F1ABB04((uint64_t)v23, type metadata accessor for AccessoryView);
  sub_21F1ABB04(v28, type metadata accessor for AccessoryView);
  sub_21F1ABB04(v27, type metadata accessor for AccessoryView);
  sub_21F1ABB04((uint64_t)v31, type metadata accessor for AccessoryView);
  return sub_21F1ABB04((uint64_t)v32, type metadata accessor for AccessoryView);
}

uint64_t sub_21F1A9B18@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_21F1C2940();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4360);
  return sub_21F1A97E0(a1 + *(int *)(v2 + 44));
}

uint64_t sub_21F1A9B60(uint64_t a1)
{
  unint64_t v2 = sub_21F1ABA48();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_21F1A9BAC(uint64_t a1)
{
  unint64_t v2 = sub_21F1ABA48();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t _s13PaymentUIBase18AccessoryViewStyleO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F1C2C50();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC43A0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_21F1ABA9C(a1, (uint64_t)v17, type metadata accessor for AccessoryViewStyle);
  sub_21F1ABA9C(a2, (uint64_t)v18, type metadata accessor for AccessoryViewStyle);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48);
  switch(v20(v17, 6, v19))
  {
    case 1u:
      if (v20(v18, 6, v19) != 1) {
        goto LABEL_15;
      }
      goto LABEL_5;
    case 2u:
      if (v20(v18, 6, v19) != 2) {
        goto LABEL_15;
      }
      goto LABEL_5;
    case 3u:
      if (v20(v18, 6, v19) != 3) {
        goto LABEL_15;
      }
      goto LABEL_5;
    case 4u:
      if (v20(v18, 6, v19) != 4) {
        goto LABEL_15;
      }
      goto LABEL_5;
    case 5u:
      if (v20(v18, 6, v19) != 5) {
        goto LABEL_15;
      }
      goto LABEL_5;
    case 6u:
      if (v20(v18, 6, v19) != 6) {
        goto LABEL_15;
      }
LABEL_5:
      sub_21F1ABB04((uint64_t)v17, type metadata accessor for AccessoryViewStyle);
      char v24 = 1;
      return v24 & 1;
    default:
      uint64_t v37 = v5;
      sub_21F1ABA9C((uint64_t)v17, (uint64_t)v13, type metadata accessor for AccessoryViewStyle);
      uint64_t v21 = v13[1];
      uint64_t v35 = *v13;
      uint64_t v36 = v21;
      uint64_t v22 = *(int *)(v19 + 48);
      int v23 = (char *)v13 + v22;
      if (v20(v18, 6, v19))
      {
        (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v4);
        swift_bridgeObjectRelease();
LABEL_15:
        sub_21F196760((uint64_t)v17, &qword_267EC43A0);
        goto LABEL_16;
      }
      uint64_t v26 = *((void *)v18 + 1);
      uint64_t v34 = *(void *)v18;
      uint64_t v27 = &v18[v22];
      uint64_t v28 = v37;
      char v29 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
      v29(v10, v23, v4);
      v29(v8, v27, v4);
      if (v35 == v34 && v36 == v26)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v31 = sub_21F1C3260();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) == 0)
        {
          unsigned __int8 v32 = *(void (**)(char *, uint64_t))(v28 + 8);
          v32(v8, v4);
          v32(v10, v4);
          sub_21F1ABB04((uint64_t)v17, type metadata accessor for AccessoryViewStyle);
LABEL_16:
          char v24 = 0;
          return v24 & 1;
        }
      }
      char v24 = MEMORY[0x223C460F0](v10, v8);
      uint64_t v33 = *(void (**)(char *, uint64_t))(v28 + 8);
      v33(v8, v4);
      v33(v10, v4);
      sub_21F1ABB04((uint64_t)v17, type metadata accessor for AccessoryViewStyle);
      return v24 & 1;
  }
}

uint64_t type metadata accessor for AccessoryViewStyle(uint64_t a1)
{
  return sub_21F1AB894(a1, (uint64_t *)&unk_267EC5890);
}

uint64_t sub_21F1AA108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccessoryViewStyle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F1AA16C()
{
  unint64_t result = qword_267EC4330;
  if (!qword_267EC4330)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4328);
    sub_21F1AA1E8();
    sub_21F1AA254();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4330);
  }
  return result;
}

unint64_t sub_21F1AA1E8()
{
  unint64_t result = qword_267EC4338;
  if (!qword_267EC4338)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4340);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4338);
  }
  return result;
}

unint64_t sub_21F1AA254()
{
  unint64_t result = qword_267EC4348;
  if (!qword_267EC4348)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4350);
    sub_21F1AA2D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4348);
  }
  return result;
}

unint64_t sub_21F1AA2D0()
{
  unint64_t result = qword_267EC4358;
  if (!qword_267EC4358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4358);
  }
  return result;
}

uint64_t sub_21F1AA324()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21F1AA344()
{
  unint64_t result = qword_267EC4368;
  if (!qword_267EC4368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4368);
  }
  return result;
}

uint64_t sub_21F1AA398()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessoryViewStyle(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 6, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = *(int *)(v7 + 48);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_21F1C2C50();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 6, v7);
    }
  }
  return a1;
}

uint64_t destroy for AccessoryViewStyle(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 6, v2);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(v2 + 48);
    uint64_t v5 = sub_21F1C2C50();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  return result;
}

void *initializeWithCopy for AccessoryViewStyle(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 6, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    uint64_t v9 = *(int *)(v6 + 48);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_21F1C2C50();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  }
  return a1;
}

void *assignWithCopy for AccessoryViewStyle(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 6, v6);
  int v10 = v8(a2, 6, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v17 = *(int *)(v6 + 48);
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = sub_21F1C2C50();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
      return a1;
    }
    sub_21F196760((uint64_t)a1, &qword_267EC4320);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v11 = *(int *)(v6 + 48);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_21F1C2C50();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  return a1;
}

_OWORD *initializeWithTake for AccessoryViewStyle(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 6, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v8 = *(int *)(v6 + 48);
    int v9 = (char *)a1 + v8;
    int v10 = (char *)a2 + v8;
    uint64_t v11 = sub_21F1C2C50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  }
  return a1;
}

void *assignWithTake for AccessoryViewStyle(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 6, v6);
  int v10 = v8(a2, 6, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v16 = a2[1];
      *a1 = *a2;
      a1[1] = v16;
      swift_bridgeObjectRelease();
      uint64_t v17 = *(int *)(v6 + 48);
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = sub_21F1C2C50();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
      return a1;
    }
    sub_21F196760((uint64_t)a1, &qword_267EC4320);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v11 = *(int *)(v6 + 48);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_21F1C2C50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessoryViewStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21F1AACB4);
}

uint64_t sub_21F1AACB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 7) {
    return v5 - 6;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AccessoryViewStyle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21F1AAD38);
}

uint64_t sub_21F1AAD38(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 6);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_21F1AADC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 6, v2);
}

uint64_t sub_21F1AAE2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 6, v4);
}

uint64_t sub_21F1AAEA0()
{
  uint64_t result = sub_21F1C2C50();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessoryView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(type metadata accessor for AccessoryViewStyle(0) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 6, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = *(int *)(v7 + 48);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_21F1C2C50();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 6, v7);
    }
  }
  return a1;
}

void *initializeWithCopy for AccessoryView(void *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 6, v4))
  {
    uint64_t v6 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(v4 + 48);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_21F1C2C50();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  }
  return a1;
}

void *assignWithCopy for AccessoryView(void *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 6, v4);
  int v8 = v6(a2, 6, v4);
  if (!v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v16 = *(int *)(v4 + 48);
      uint64_t v17 = (char *)a1 + v16;
      uint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = sub_21F1C2C50();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
      return a1;
    }
    sub_21F196760((uint64_t)a1, &qword_267EC4320);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v14 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v9 = *(int *)(v4 + 48);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_21F1C2C50();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  return a1;
}

_OWORD *initializeWithTake for AccessoryView(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v5 + 48))(a2, 6, v4))
  {
    uint64_t v6 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(v4 + 48);
    int v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_21F1C2C50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  }
  return a1;
}

void *assignWithTake for AccessoryView(void *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 6, v4);
  int v8 = v6(a2, 6, v4);
  if (!v7)
  {
    if (!v8)
    {
      uint64_t v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      swift_bridgeObjectRelease();
      uint64_t v16 = *(int *)(v4 + 48);
      uint64_t v17 = (char *)a1 + v16;
      uint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = sub_21F1C2C50();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
      return a1;
    }
    sub_21F196760((uint64_t)a1, &qword_267EC4320);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v13 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v9 = *(int *)(v4 + 48);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_21F1C2C50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessoryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21F1AB784);
}

uint64_t sub_21F1AB784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccessoryViewStyle(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AccessoryView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21F1AB804);
}

uint64_t sub_21F1AB804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AccessoryViewStyle(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AccessoryView(uint64_t a1)
{
  return sub_21F1AB894(a1, (uint64_t *)&unk_267EC58A0);
}

uint64_t sub_21F1AB894(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21F1AB8CC()
{
  uint64_t result = type metadata accessor for AccessoryViewStyle(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryView_Previews()
{
  return &type metadata for AccessoryView_Previews;
}

unint64_t sub_21F1AB96C()
{
  unint64_t result = qword_267EC4370;
  if (!qword_267EC4370)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4378);
    sub_21F1AA16C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4370);
  }
  return result;
}

unint64_t sub_21F1AB9EC()
{
  unint64_t result = qword_267EC4380;
  if (!qword_267EC4380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4380);
  }
  return result;
}

unint64_t sub_21F1ABA48()
{
  unint64_t result = qword_267EC4390;
  if (!qword_267EC4390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4390);
  }
  return result;
}

uint64_t sub_21F1ABA9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21F1ABB04(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21F1ABB64()
{
  uint64_t result = sub_21F1C2BD0();
  qword_267EC58B8 = result;
  return result;
}

uint64_t *sub_21F1ABB84()
{
  if (qword_267EC58B0 != -1) {
    swift_once();
  }
  return &qword_267EC58B8;
}

uint64_t static Font.paymentItemSecondary.getter()
{
  return sub_21F18C5A4(&qword_267EC58B0);
}

uint64_t sub_21F1ABBF4()
{
  uint64_t result = sub_21F1C2BD0();
  qword_267EC58C8 = result;
  return result;
}

uint64_t static Font.paymentItemSecondaryError.getter()
{
  return sub_21F18C5A4(&qword_267EC58C0);
}

uint64_t sub_21F1ABC38()
{
  uint64_t result = sub_21F1C2BD0();
  qword_267EC58D8 = result;
  return result;
}

uint64_t static Font.chinItemSecondary.getter()
{
  return sub_21F18C5A4(&qword_267EC58D0);
}

uint64_t sub_21F1ABC7C()
{
  uint64_t result = sub_21F1C2BD0();
  qword_267EC58E8 = result;
  return result;
}

uint64_t static Font.detailSheetRowSecondary.getter()
{
  return sub_21F18C5A4(&qword_267EC58E0);
}

uint64_t sub_21F1ABCC0()
{
  sub_21F1C2BE0();
  sub_21F1C2C00();
  uint64_t v0 = sub_21F1C2C30();
  uint64_t result = swift_release();
  qword_267EC58F8 = v0;
  return result;
}

uint64_t static Font.detailSheetRowAccessory.getter()
{
  return sub_21F18C5A4(&qword_267EC58F0);
}

BOOL static CheckmarkStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CheckmarkStyle.hash(into:)()
{
  return sub_21F1C3290();
}

uint64_t CheckmarkStyle.hashValue.getter()
{
  return sub_21F1C32A0();
}

uint64_t MenuContainerView.init(limitWidth:selection:icon:content:)@<X0>(char a1@<W0>, char *a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t)@<X2>, uint64_t (*a4)(uint64_t)@<X4>, uint64_t a5@<X8>)
{
  char v9 = *a2;
  if (a1) {
    uint64_t v10 = 0x4069000000000000;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = type metadata accessor for MenuContainerView();
  uint64_t v12 = a5 + *(int *)(v11 + 60);
  *(void *)uint64_t v12 = v10;
  *(unsigned char *)(v12 + 8) = (a1 & 1) == 0;
  uint64_t v16 = a3(v11, v13, v14, v15);
  uint64_t result = a4(v16);
  *(unsigned char *)(a5 + *(int *)(v11 + 56)) = v9;
  return result;
}

uint64_t type metadata accessor for MenuContainerView()
{
  return swift_getGenericMetadata();
}

uint64_t MenuContainerView.body.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = sub_21F1C2AA0();
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v41 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC43A8);
  uint64_t v5 = a1[2];
  uint64_t v33 = a1[3];
  uint64_t v39 = v5;
  uint64_t v38 = a1;
  sub_21F1C26C0();
  uint64_t v37 = a1[4];
  uint64_t v56 = v37;
  uint64_t v57 = MEMORY[0x263F18860];
  swift_getWitnessTable();
  sub_21F1C2F00();
  swift_getTupleTypeMetadata3();
  uint64_t v32 = sub_21F1C2FB0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v6 = sub_21F1C2EE0();
  uint64_t v34 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v27 - v7;
  uint64_t v9 = sub_21F1C26C0();
  uint64_t v35 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t v12 = sub_21F1C26C0();
  uint64_t v36 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v27 - v13;
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v54 = v28;
  uint64_t v55 = MEMORY[0x263F18C10];
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v52 = v29;
  uint64_t v53 = MEMORY[0x263F19100];
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v50 = v12;
  uint64_t v51 = v30;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v16 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v27 - v20;
  uint64_t v45 = v39;
  uint64_t v46 = v33;
  uint64_t v22 = v38[5];
  uint64_t v47 = v37;
  uint64_t v48 = v22;
  uint64_t v49 = v40;
  sub_21F1C28E0();
  sub_21F1C2ED0();
  sub_21F1C2B80();
  sub_21F1C2D90();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v6);
  sub_21F1C2FA0();
  sub_21F1C2D70();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v9);
  int v23 = v41;
  sub_21F1C2A90();
  sub_21F1C2D20();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v43);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v14, v12);
  char v24 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v24(v21, v19, OpaqueTypeMetadata2);
  long long v25 = *(void (**)(char *, uint64_t))(v16 + 8);
  v25(v19, OpaqueTypeMetadata2);
  v24(v44, v21, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v25)(v21, OpaqueTypeMetadata2);
}

uint64_t sub_21F1AC4D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v47 = a6;
  uint64_t v46 = sub_21F1C26C0();
  uint64_t v64 = a4;
  uint64_t v65 = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = sub_21F1C2F00();
  uint64_t v50 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v42 = (char *)&v37 - v16;
  uint64_t v41 = *((void *)a3 - 1);
  uint64_t v17 = v41;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v44 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v37 - v20;
  uint64_t v39 = (char *)&v37 - v20;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC43A8);
  uint64_t v22 = MEMORY[0x270FA5388](v43);
  uint64_t v48 = (uint64_t)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  long long v25 = (char *)&v37 - v24;
  uint64_t v49 = (uint64_t)&v37 - v24;
  uint64_t v60 = a2;
  uint64_t v61 = a3;
  uint64_t v62 = a4;
  uint64_t v63 = a5;
  uint64_t v40 = a5;
  uint64_t v26 = type metadata accessor for MenuContainerView();
  sub_21F1AC9AC(v26, (uint64_t)v25);
  uint64_t v38 = *(void (**)(char *, uint64_t, char *))(v17 + 16);
  uint64_t v27 = a3;
  v38(v21, a1, a3);
  sub_21F1C2950();
  uint64_t v51 = a2;
  uint64_t v52 = a3;
  uint64_t v53 = a4;
  uint64_t v54 = a5;
  uint64_t v55 = a1;
  sub_21F1C2EF0();
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v28 = v50;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  uint64_t v30 = v42;
  v29(v42, v14, v11);
  char v31 = *(void (**)(char *, uint64_t))(v28 + 8);
  uint64_t v50 = v28 + 8;
  v31(v14, v11);
  uint64_t v32 = v48;
  sub_21F196550(v49, v48, &qword_267EC43A8);
  uint64_t v60 = v32;
  uint64_t v33 = v44;
  uint64_t v34 = v39;
  v38(v44, (uint64_t)v39, v27);
  uint64_t v61 = v33;
  v29(v14, v30, v11);
  uint64_t v62 = v14;
  v59[0] = v43;
  v59[1] = v27;
  v59[2] = v11;
  unint64_t v56 = sub_21F1ADE98();
  uint64_t v57 = v40;
  uint64_t v58 = v46;
  sub_21F193734((uint64_t)&v60, 3uLL, (uint64_t)v59);
  v31(v30, v11);
  uint64_t v35 = *(void (**)(char *, char *))(v41 + 8);
  v35(v34, v27);
  sub_21F196760(v49, &qword_267EC43A8);
  v31(v14, v11);
  v35(v33, v27);
  return sub_21F196760(v48, &qword_267EC43A8);
}

uint64_t sub_21F1AC994()
{
  return sub_21F1ADE80((uint64_t (*)(void, void, void, void, void))sub_21F1AC4D4);
}

uint64_t sub_21F1AC9AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_21F1C2920();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC43D8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC43C8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v19 = (char *)&v34 - v18;
  uint64_t v20 = *(int *)(a1 + 56);
  if (*(unsigned char *)(v2 + v20))
  {
    uint64_t v39 = v16;
    uint64_t v40 = v17;
    uint64_t v37 = v20;
    uint64_t v21 = sub_21F1C2E50();
    uint64_t v35 = v5;
    uint64_t v22 = v21;
    sub_21F1C2BE0();
    sub_21F1C2C00();
    uint64_t v23 = sub_21F1C2C30();
    uint64_t v38 = a2;
    uint64_t v24 = v23;
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v26 = sub_21F1C2DE0();
    uint64_t v36 = v2;
    uint64_t v27 = v26;
    uint64_t v28 = swift_getKeyPath();
    uint64_t v41 = v22;
    uint64_t v42 = KeyPath;
    uint64_t v43 = v24;
    uint64_t v44 = v28;
    uint64_t v45 = v27;
    sub_21F1C2910();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4150);
    sub_21F19F2A4();
    sub_21F1C2D30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v35);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v36 + v37) == 2) {
      double v29 = 1.0;
    }
    else {
      double v29 = 0.0;
    }
    sub_21F196550((uint64_t)v11, (uint64_t)v15, &qword_267EC43D8);
    uint64_t v30 = v39;
    *(double *)&v15[*(int *)(v39 + 36)] = v29;
    sub_21F196760((uint64_t)v11, &qword_267EC43D8);
    sub_21F1AE004((uint64_t)v15, (uint64_t)v19);
    uint64_t v31 = v38;
    sub_21F1AE004((uint64_t)v19, v38);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v31, 0, 1, v30);
  }
  else
  {
    uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 56);
    return v33(a2, 1, 1);
  }
}

uint64_t sub_21F1ACD34@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, char *a5@<X8>)
{
  uint64_t v20 = a5;
  uint64_t v9 = sub_21F1C26C0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v19 - v14;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  type metadata accessor for MenuContainerView();
  sub_21F1C2F90();
  sub_21F1C2D60();
  uint64_t v21 = a3;
  uint64_t v22 = MEMORY[0x263F18860];
  swift_getWitnessTable();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v16(v15, v13, v9);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v16(v20, v15, v9);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, v9);
}

uint64_t MenuContainerView<>.init(limitWidth:selection:content:)@<X0>(char a1@<W0>, char *a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  char v6 = *a2;
  a3();
  uint64_t result = type metadata accessor for MenuContainerView();
  *(unsigned char *)(a4 + *(int *)(result + 56)) = v6;
  uint64_t v8 = 0x4069000000000000;
  if ((a1 & 1) == 0) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = a4 + *(int *)(result + 60);
  *(void *)uint64_t v9 = v8;
  *(unsigned char *)(v9 + 8) = (a1 & 1) == 0;
  return result;
}

unint64_t sub_21F1ACFC4()
{
  unint64_t result = qword_267EC43B0;
  if (!qword_267EC43B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC43B0);
  }
  return result;
}

uint64_t sub_21F1AD018()
{
  return swift_getOpaqueTypeConformance2();
}

unsigned char *storeEnumTagSinglePayload for CheckmarkStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21F1AD128);
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

ValueMetadata *type metadata accessor for CheckmarkStyle()
{
  return &type metadata for CheckmarkStyle;
}

uint64_t sub_21F1AD160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_21F1AD168()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_21F1AD24C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = *(void *)(v8 + 64);
  unint64_t v12 = ((((v6 + v9) & ~v9) + v11) & 0xFFFFFFFFFFFFFFF8) + 17;
  unsigned int v13 = v9 | *(_DWORD *)(v5 + 80) & 0xF8;
  if (v13 > 7 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v12 > 0x18)
  {
    uint64_t v16 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v16 + (((v13 | 7) + 16) & ~(unint64_t)(v13 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v18 = ((unint64_t)v4 + v10) & v17;
    unint64_t v19 = ((unint64_t)a2 + v10) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(v18, v19, v7);
    *(unsigned char *)(v18 + v11) = *(unsigned char *)(v19 + v11);
    unint64_t v20 = (v18 + v11) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v21 = (v19 + v11) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v22 = *(void *)(v21 + 8);
    *(unsigned char *)(v20 + 16) = *(unsigned char *)(v21 + 16);
    *(void *)(v20 + 8) = v22;
  }
  return v4;
}

uint64_t sub_21F1AD3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 24) - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v6 = *(uint64_t (**)(unint64_t))(v5 + 8);
  unint64_t v7 = (*(void *)(v4 + 56) + a1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return v6(v7);
}

uint64_t sub_21F1AD494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 48);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  char v17 = *(unsigned char *)(v16 + 16);
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(unsigned char *)(v15 + 16) = v17;
  return a1;
}

uint64_t sub_21F1AD570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 40);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 40);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  char v17 = *(unsigned char *)(v16 + 16);
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(unsigned char *)(v15 + 16) = v17;
  return a1;
}

uint64_t sub_21F1AD64C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 32);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  char v17 = *(unsigned char *)(v16 + 16);
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(unsigned char *)(v15 + 16) = v17;
  return a1;
}

uint64_t sub_21F1AD728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 24);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 &= 0xFFFFFFFFFFFFFFF8;
  char v17 = *(unsigned char *)(v16 + 16);
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  *(unsigned char *)(v15 + 16) = v17;
  return a1;
}

uint64_t sub_21F1AD804(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v5 = *(unsigned int *)(v4 + 84);
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v6 + 64);
  if (v7 <= v5) {
    unsigned int v10 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v6 + 84);
  }
  if (v10 <= 0xFD) {
    unsigned int v10 = 253;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) + v8;
  if (v10 < a2)
  {
    unint64_t v12 = (((v11 & ~v8) + v9) & 0xFFFFFFFFFFFFFFF8) + 17;
    unsigned int v13 = (a2 - v10 + 255) >> (8 * v12);
    if (v12 < 4) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      LODWORD(v15) = 4;
    }
    else {
      LODWORD(v15) = 2;
    }
    if (v14 < 0x100) {
      LODWORD(v15) = 1;
    }
    if (v14 >= 2) {
      uint64_t v15 = v15;
    }
    else {
      uint64_t v15 = 0;
    }
    switch(v15)
    {
      case 1:
        int v16 = a1[v12];
        if (!a1[v12]) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v16 = *(unsigned __int16 *)&a1[v12];
        if (*(_WORD *)&a1[v12]) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x21F1AD9E0);
      case 4:
        int v16 = *(_DWORD *)&a1[v12];
        if (!v16) {
          break;
        }
LABEL_24:
        int v18 = (v16 - 1) << (8 * v12);
        if (v12 >= 4) {
          int v18 = 0;
        }
        if ((((v11 & ~v8) + v9) & 0xFFFFFFF8) == 0xFFFFFFF0) {
          int v19 = *a1;
        }
        else {
          int v19 = *(_DWORD *)a1;
        }
        return v10 + (v19 | v18) + 1;
      default:
        break;
    }
  }
  if (v5 == v10) {
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, void))(v4 + 48))(a1, v5, *(void *)(a3 + 24));
  }
  unint64_t v20 = (unint64_t)&a1[v11] & ~v8;
  if (v7 == v10) {
    return (*(uint64_t (**)(unint64_t))(v6 + 48))(v20);
  }
  unsigned int v21 = *(unsigned __int8 *)(v20 + v9);
  if (v21 >= 3) {
    return v21 - 2;
  }
  else {
    return 0;
  }
}

void sub_21F1AD9F4(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v8 + 64);
  if (v9 <= v7) {
    unsigned int v12 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v8 + 84);
  }
  if (v12 <= 0xFD) {
    unsigned int v12 = 253;
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) + v10;
  size_t v14 = (((v13 & ~v10) + v11) & 0xFFFFFFFFFFFFFFF8) + 17;
  char v15 = 8 * v14;
  if (v12 >= a3)
  {
    int v19 = 0;
    if (v12 >= a2)
    {
LABEL_19:
      switch(v19)
      {
        case 1:
          a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_36;
        case 2:
          *(_WORD *)&a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_36;
        case 3:
          goto LABEL_50;
        case 4:
          *(_DWORD *)&a1[v14] = 0;
          goto LABEL_35;
        default:
LABEL_35:
          if (a2)
          {
LABEL_36:
            if (v7 == v12)
            {
              uint64_t v22 = *(void (**)(void))(v6 + 56);
              v22();
            }
            else
            {
              unint64_t v23 = (unint64_t)&a1[v13] & ~v10;
              if (v9 == v12)
              {
                uint64_t v24 = *(void (**)(unint64_t))(v8 + 56);
                v24(v23);
              }
              else
              {
                *(unsigned char *)(v23 + v11) = a2 + 2;
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v16 = (a3 - v12 + 255) >> v15;
    if (v14 <= 3) {
      unsigned int v17 = v16 + 1;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v17 >= 0x10000) {
      int v18 = 4;
    }
    else {
      int v18 = 2;
    }
    if (v17 < 0x100) {
      int v18 = 1;
    }
    if (v17 >= 2) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    if (v12 >= a2) {
      goto LABEL_19;
    }
  }
  if (v14 < 4) {
    unsigned int v20 = ((~v12 + a2) >> v15) + 1;
  }
  else {
    unsigned int v20 = 1;
  }
  if (v14 >= 4) {
    unsigned int v21 = ~v12 + a2;
  }
  else {
    unsigned int v21 = (~(_BYTE)v12 + a2);
  }
  bzero(a1, v14);
  if (v14 == 1) {
    *a1 = v21;
  }
  else {
    *(_DWORD *)a1 = v21;
  }
  switch(v19)
  {
    case 1:
      a1[v14] = v20;
      break;
    case 2:
      *(_WORD *)&a1[v14] = v20;
      break;
    case 3:
LABEL_50:
      __break(1u);
      JUMPOUT(0x21F1ADC98);
    case 4:
      *(_DWORD *)&a1[v14] = v20;
      break;
    default:
      return;
  }
}

uint64_t sub_21F1ADCC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1ADE68()
{
  return sub_21F1ADE80((uint64_t (*)(void, void, void, void, void))sub_21F1ACD34);
}

uint64_t sub_21F1ADE80(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

unint64_t sub_21F1ADE98()
{
  unint64_t result = qword_267EC43B8;
  if (!qword_267EC43B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC43A8);
    sub_21F1ADF0C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC43B8);
  }
  return result;
}

unint64_t sub_21F1ADF0C()
{
  unint64_t result = qword_267EC43C0;
  if (!qword_267EC43C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC43C8);
    sub_21F1ADF88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC43C0);
  }
  return result;
}

unint64_t sub_21F1ADF88()
{
  unint64_t result = qword_267EC43D0;
  if (!qword_267EC43D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC43D8);
    sub_21F19F2A4();
    sub_21F193D50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC43D0);
  }
  return result;
}

uint64_t sub_21F1AE004(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC43C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t BaseAuthenticatorModel.ExternalPasswordEntry.id.getter()
{
  return 0x4449656C707061;
}

BOOL static BaseAuthenticatorModel.ExternalPasswordEntry.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return static AppleIDSignInView.== infix(_:_:)(&v5, &v4);
}

uint64_t sub_21F1AE0BC()
{
  return MEMORY[0x263F8D320];
}

void sub_21F1AE0C8(void *a1@<X8>)
{
  *a1 = 0x4449656C707061;
  a1[1] = 0xE700000000000000;
}

BOOL sub_21F1AE0E4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = v2;
  return static AppleIDSignInView.== infix(_:_:)(&v5, &v4);
}

void **_s21ExternalPasswordEntryOwCP(void **a1, void **a2)
{
  int v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void _s21ExternalPasswordEntryOwxx(id *a1)
{
}

void **_s21ExternalPasswordEntryOwca(void **a1, void **a2)
{
  int v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **_s21ExternalPasswordEntryOwta(void **a1, void **a2)
{
  int v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t _s21ExternalPasswordEntryOwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s21ExternalPasswordEntryOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseAuthenticatorModel.ExternalPasswordEntry()
{
  return &type metadata for BaseAuthenticatorModel.ExternalPasswordEntry;
}

uint64_t PaymentItemBackground.body.getter@<X0>(uint64_t *a1@<X8>)
{
  *a1 = *sub_21F18BD80();
  return swift_retain();
}

uint64_t sub_21F1AE2A4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = *sub_21F18BD80();
  return swift_retain();
}

uint64_t sub_21F1AE2E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *sub_21F18BD80();
  swift_retain();
  char v5 = sub_21F1C2B80();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC43E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC43E8);
  uint64_t v8 = a2 + *(int *)(result + 36);
  *(void *)uint64_t v8 = v4;
  *(unsigned char *)(v8 + 8) = v5;
  return result;
}

uint64_t sub_21F1AE380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v64 = a3;
  swift_getWitnessTable();
  uint64_t v4 = sub_21F1C2A70();
  uint64_t v5 = sub_21F1C26C0();
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v55 = (char *)&v50 - v9;
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v52 = *(void *)(a2 + 24);
  uint64_t v66 = sub_21F1C2A30();
  uint64_t v11 = sub_21F1C26C0();
  uint64_t v54 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  size_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v53 = (char *)&v50 - v15;
  uint64_t v16 = sub_21F1C3130();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unsigned int v20 = (char *)&v50 - v19;
  uint64_t v21 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v58 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = v5;
  uint64_t v23 = sub_21F1C2A60();
  uint64_t v61 = *(void *)(v23 - 8);
  uint64_t v62 = v23;
  MEMORY[0x270FA5388](v23);
  uint64_t v65 = (char *)&v50 - v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v57, v16);
  int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v20, 1, v10);
  uint64_t v63 = v4;
  if (v25 == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    uint64_t WitnessTable = swift_getWitnessTable();
    MEMORY[0x223C46250](WitnessTable, v4, &type metadata for PaymentItemDefaultBackgroundModifier, WitnessTable);
    unint64_t v27 = sub_21F1AEC34();
    uint64_t v79 = WitnessTable;
    unint64_t v80 = v27;
    uint64_t v28 = v59;
    uint64_t v60 = swift_getWitnessTable();
    uint64_t v29 = v56;
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
    uint64_t v31 = v55;
    v30(v55, v8, v28);
    uint64_t v32 = *(void (**)(char *, uint64_t))(v29 + 8);
    v32(v8, v28);
    v30(v8, v31, v28);
    uint64_t v33 = swift_getWitnessTable();
    uint64_t v77 = WitnessTable;
    uint64_t v78 = v33;
    swift_getWitnessTable();
    sub_21F1AEC88((uint64_t)v8, v11, v28);
    v32(v8, v28);
    v32(v31, v28);
  }
  else
  {
    uint64_t v51 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v58, v20, v10);
    sub_21F1C2F90();
    uint64_t v34 = swift_getWitnessTable();
    sub_21F1C2CE0();
    uint64_t v35 = swift_getWitnessTable();
    uint64_t v69 = v34;
    uint64_t v70 = v35;
    uint64_t v60 = swift_getWitnessTable();
    uint64_t v36 = v54;
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
    uint64_t v38 = v53;
    v37(v53, v14, v11);
    uint64_t v39 = *(void (**)(char *, uint64_t))(v36 + 8);
    v39(v14, v11);
    v37(v14, v38, v11);
    unint64_t v40 = sub_21F1AEC34();
    uint64_t v67 = v34;
    unint64_t v68 = v40;
    swift_getWitnessTable();
    sub_21F1AEB3C((uint64_t)v14, v11);
    v39(v14, v11);
    v39(v38, v11);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v58, v10);
  }
  uint64_t v41 = swift_getWitnessTable();
  uint64_t v42 = swift_getWitnessTable();
  uint64_t v75 = v41;
  uint64_t v76 = v42;
  uint64_t v43 = swift_getWitnessTable();
  unint64_t v44 = sub_21F1AEC34();
  uint64_t v73 = v41;
  unint64_t v74 = v44;
  uint64_t v45 = swift_getWitnessTable();
  uint64_t v71 = v43;
  uint64_t v72 = v45;
  uint64_t v46 = v62;
  swift_getWitnessTable();
  uint64_t v47 = v61;
  uint64_t v48 = v65;
  (*(void (**)(uint64_t, char *, uint64_t))(v61 + 16))(v64, v65, v46);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v48, v46);
}

uint64_t sub_21F1AEB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F1C2A40();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_21F1C2A50();
}

unint64_t sub_21F1AEC34()
{
  unint64_t result = qword_267EC43F0;
  if (!qword_267EC43F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC43F0);
  }
  return result;
}

uint64_t sub_21F1AEC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21F1C2A40();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_21F1C2A50();
}

void View.paymentItemBackground()()
{
}

uint64_t View.paymentItemBackground<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_21F1C3130();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = type metadata accessor for PaymentItemViewBackgroundModifier();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  size_t v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v10, v7);
  MEMORY[0x223C46250](v14, a2, v11, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t type metadata accessor for PaymentItemViewBackgroundModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F1AEF74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1AEF90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1AEFAC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for PaymentItemBackground()
{
  return &type metadata for PaymentItemBackground;
}

ValueMetadata *type metadata accessor for PaymentItemDefaultBackgroundModifier()
{
  return &type metadata for PaymentItemDefaultBackgroundModifier;
}

uint64_t sub_21F1AF010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_21F1AF018()
{
  uint64_t result = sub_21F1C3130();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21F1AF0A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_21F1AF1E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_21F1AF2A8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_21F1AF3A0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *sub_21F1AF50C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_21F1AF604(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t sub_21F1AF770(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
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
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void sub_21F1AF910(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
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
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x21F1AFB4CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          uint64_t v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_21F1AFB74()
{
  return MEMORY[0x263F1B428];
}

unint64_t sub_21F1AFB84()
{
  unint64_t result = qword_267EC43F8;
  if (!qword_267EC43F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC43E8);
    sub_21F192EE4(&qword_267EC4400, &qword_267EC43E0);
    sub_21F192EE4(&qword_26AD3F9C8, &qword_26AD3F9D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC43F8);
  }
  return result;
}

uint64_t sub_21F1AFC48()
{
  return swift_getWitnessTable();
}

uint64_t sub_21F1AFDBC()
{
  return swift_getWitnessTable();
}

uint64_t sub_21F1AFE20()
{
  return swift_getWitnessTable();
}

void *BaseAuthenticatorModel.PasscodeEntry.init(view:completion:viewPresented:)@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = *result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

id BaseAuthenticatorModel.PasscodeEntry.view.getter@<X0>(void **a1@<X8>)
{
  uint64_t v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t BaseAuthenticatorModel.PasscodeEntry.completion.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t BaseAuthenticatorModel.PasscodeEntry.viewPresented.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_21F192F84(v1);
  return v1;
}

uint64_t BaseAuthenticatorModel.PasscodeEntry.id.getter()
{
  return *(void *)v0;
}

void sub_21F1AFF44(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t BaseAuthenticatorModel.PasscodeView.init(controller:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id BaseAuthenticatorModel.PasscodeView.makeUIViewController(context:)()
{
  return *v0;
}

uint64_t sub_21F1AFF64()
{
  return MEMORY[0x263F8D1F8];
}

unint64_t sub_21F1AFF74()
{
  unint64_t result = qword_267EC4408;
  if (!qword_267EC4408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4408);
  }
  return result;
}

id sub_21F1AFFC8()
{
  return *v0;
}

uint64_t sub_21F1AFFDC()
{
  return sub_21F1C2AD0();
}

uint64_t sub_21F1B0018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21F1B03F4();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_21F1B007C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21F1B03F4();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_21F1B00E0()
{
}

uint64_t _s13PasscodeEntryVwxx(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 24))
  {
    return swift_release();
  }
  return result;
}

uint64_t _s13PasscodeEntryVwcp(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 2);
  long long v5 = *a2;
  *(_OWORD *)a1 = *a2;
  *(void *)(a1 + 16) = v4;
  uint64_t v7 = (long long *)((char *)a2 + 24);
  uint64_t v6 = *((void *)a2 + 3);
  id v8 = (id)v5;
  swift_retain();
  if (v6)
  {
    uint64_t v9 = *((void *)a2 + 4);
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *v7;
  }
  return a1;
}

uint64_t _s13PasscodeEntryVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a2 + 24);
  if (!*(void *)(a1 + 24))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v8;
      *(void *)(a1 + 32) = v10;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  swift_retain();
  swift_release();
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

uint64_t _s13PasscodeEntryVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  uint64_t v5 = *(void *)(a2 + 24);
  if (!*(void *)(a1 + 24))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  swift_release();
  return a1;
}

uint64_t _s13PasscodeEntryVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13PasscodeEntryVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseAuthenticatorModel.PasscodeEntry()
{
  return &type metadata for BaseAuthenticatorModel.PasscodeEntry;
}

ValueMetadata *type metadata accessor for BaseAuthenticatorModel.PasscodeView()
{
  return &type metadata for BaseAuthenticatorModel.PasscodeView;
}

unint64_t sub_21F1B03F4()
{
  unint64_t result = qword_267EC4410;
  if (!qword_267EC4410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4410);
  }
  return result;
}

id static NSBundle.PaymentUIBaseBundle.getter()
{
  if (qword_267EC5E10 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267EC5E18;
  return v0;
}

uint64_t PaymentUIBaseLocalizedString(for:table:bundle:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (void *)sub_21F1C3050();
  uint64_t v6 = (void *)sub_21F1C3050();
  uint64_t v7 = (void *)sub_21F1C3050();
  id v8 = objc_msgSend(a4, sel_localizedStringForKey_value_table_, v5, v6, v7);

  uint64_t v9 = sub_21F1C3060();
  return v9;
}

unint64_t LocalizedStringTable.rawValue.getter()
{
  return 0xD00000000000001FLL;
}

id sub_21F1B0574()
{
  if (qword_267EC5E10 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267EC5E18;
  return v0;
}

uint64_t PaymentUIBaseLocalizedString(for:table:bundle:localization:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (void *)sub_21F1C3050();
  uint64_t v6 = (void *)sub_21F1C3050();
  uint64_t v7 = (void *)sub_21F1C3050();
  id v8 = (void *)sub_21F1C3050();
  id v9 = objc_msgSend(a4, sel_localizedStringForKey_value_table_localization_, v5, v6, v7, v8);

  uint64_t v10 = sub_21F1C3060();
  return v10;
}

void sub_21F1B06A8()
{
  uint64_t v0 = (void *)sub_21F1C3050();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (v1) {
    qword_267EC5E18 = (uint64_t)v1;
  }
  else {
    __break(1u);
  }
}

char *PaymentUIBaseLocalizedString(formatKey:table:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_21F1B091C(a4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t LocalizedStringTable.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_21F1C3250();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_21F1B07D8()
{
  return 1;
}

uint64_t sub_21F1B07E0()
{
  return sub_21F1C32A0();
}

uint64_t sub_21F1B0838()
{
  return sub_21F1C3070();
}

uint64_t sub_21F1B0854()
{
  return sub_21F1C32A0();
}

uint64_t sub_21F1B08A8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_21F1C3250();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_21F1B08FC(void *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x800000021F1CAC80;
}

char *sub_21F1B091C(uint64_t a1)
{
  sub_21F1C31D0();
  uint64_t v2 = (void *)swift_allocObject();
  _OWORD v2[2] = 8;
  v2[3] = 0;
  long long v3 = v2 + 3;
  v2[4] = 0;
  v2[5] = 0;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      sub_21F1B0D98(v6 + 40 * v5, (uint64_t)v30);
      uint64_t v7 = (uint64_t)__swift_project_boxed_opaque_existential_1(v30, v30[3]);
      uint64_t v8 = sub_21F1C32B0();
      uint64_t v9 = *v3;
      uint64_t v10 = *(void *)(v8 + 16);
      BOOL v11 = __OFADD__(*v3, v10);
      uint64_t v12 = *v3 + v10;
      if (v11) {
        goto LABEL_28;
      }
      uint64_t v13 = v8;
      uint64_t v7 = v2[4];
      if (v7 >= v12) {
        goto LABEL_18;
      }
      if (v7 + 0x4000000000000000 < 0) {
        goto LABEL_29;
      }
      unsigned int v14 = (char *)v2[5];
      if (2 * v7 > v12) {
        uint64_t v12 = 2 * v7;
      }
      v2[4] = v12;
      if ((unint64_t)(v12 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_30;
      }
      uint64_t result = (char *)swift_slowAlloc();
      v2[5] = result;
      if (v14) {
        break;
      }
LABEL_19:
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v17 = *(void *)(v13 + 16);
      if (v17)
      {
        uint64_t v18 = (uint64_t *)(v13 + 32);
        uint64_t v19 = *v3;
        while (1)
        {
          uint64_t v20 = *v18++;
          *(void *)&result[8 * v19] = v20;
          uint64_t v19 = *v3 + 1;
          if (__OFADD__(*v3, 1)) {
            break;
          }
          *long long v3 = v19;
          if (!--v17) {
            goto LABEL_3;
          }
        }
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
LABEL_3:
      ++v5;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      if (v5 == v4) {
        goto LABEL_25;
      }
    }
    if (result != v14 || result >= &v14[8 * v9]) {
      memmove(result, v14, 8 * v9);
    }
    uint64_t v7 = (uint64_t)v2;
    sub_21F1C31B0();
LABEL_18:
    uint64_t result = (char *)v2[5];
    goto LABEL_19;
  }
LABEL_25:
  uint64_t v7 = sub_21F1C31C0();
  if (qword_267EC5E10 != -1) {
LABEL_31:
  }
    swift_once();
  id v21 = (id)qword_267EC5E18;
  uint64_t v22 = (void *)sub_21F1C3050();
  uint64_t v23 = (void *)sub_21F1C3050();
  uint64_t v24 = (void *)sub_21F1C3050();
  id v25 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, v24);

  sub_21F1C3060();
  id v26 = objc_allocWithZone(NSString);
  unint64_t v27 = (void *)sub_21F1C3050();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v26, sel_initWithFormat_arguments_, v27, v7);

  uint64_t v29 = sub_21F1C3060();
  swift_release();

  return (char *)v29;
}

unint64_t sub_21F1B0C1C()
{
  unint64_t result = qword_267EC4418;
  if (!qword_267EC4418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4418);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LocalizedStringTable(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for LocalizedStringTable(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21F1B0D60);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizedStringTable()
{
  return &type metadata for LocalizedStringTable;
}

uint64_t sub_21F1B0D98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL UserInterfaceType.isPad.getter()
{
  return *v0 == 4;
}

PaymentUIBase::UserInterfaceType_optional __swiftcall UserInterfaceType.init(rawValue:)(Swift::UInt rawValue)
{
  char v2 = 7;
  if (rawValue < 7) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (PaymentUIBase::UserInterfaceType_optional)rawValue;
}

uint64_t UserInterfaceType.rawValue.getter()
{
  return *v0;
}

PaymentUIBase::UserInterfaceType_optional sub_21F1B0E28(Swift::UInt *a1)
{
  return UserInterfaceType.init(rawValue:)(*a1);
}

void sub_21F1B0E30(void *a1@<X8>)
{
  *a1 = *v1;
}

PaymentUIBase::UserInterfaceType __swiftcall userInterface()()
{
  id v1 = v0;
  id v2 = objc_msgSend(self, sel_currentDevice);
  id v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

  unint64_t v5 = 0x10000020403uLL >> (8 * v3);
  if ((unint64_t)v3 >= 6) {
    LOBYTE(v5) = 0;
  }
  unsigned char *v1 = v5;
  return result;
}

uint64_t sub_21F1B0EBC()
{
  return userInterface()();
}

uint64_t sub_21F1B0EC8@<X0>(unsigned char *a1@<X8>)
{
  if (qword_26AD3FE10 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = byte_26AD3FE08;
  return result;
}

uint64_t sub_21F1B0F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_21F1B235C();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

Swift::Bool __swiftcall forceUserInterfaceIdiomPad()()
{
  return 0;
}

void sub_21F1B0F90()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  byte_267EC5FA8 = v1 == (id)1;
}

uint64_t sub_21F1B0FF4@<X0>(unsigned char *a1@<X8>)
{
  return sub_21F1B1E4C(qword_26AD3FD30, byte_267EC5FA8, a1);
}

uint64_t sub_21F1B1018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D510]);
}

void sub_21F1B1024()
{
  id v0 = self;
  id v1 = objc_msgSend(v0, sel_currentDevice);
  id v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  if (v2 == (id)1)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = objc_msgSend(v0, sel_currentDevice);
    id v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

    BOOL v3 = v5 == (id)5;
  }
  byte_267EC5FB8 = v3;
}

uint64_t sub_21F1B10D4@<X0>(unsigned char *a1@<X8>)
{
  return sub_21F1B1E4C(qword_26AD3FC90, byte_267EC5FB8, a1);
}

uint64_t EnvironmentValues.userInterfaceType.getter()
{
  sub_21F1B1140();
  return sub_21F1C28B0();
}

unint64_t sub_21F1B1140()
{
  unint64_t result = qword_26AD3FEA0[0];
  if (!qword_26AD3FEA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26AD3FEA0);
  }
  return result;
}

uint64_t EnvironmentValues.userInterfaceType.setter()
{
  return sub_21F1C28C0();
}

uint64_t (*EnvironmentValues.userInterfaceType.modify(void *a1))(uint64_t a1)
{
  *a1 = v1;
  a1[1] = sub_21F1B1140();
  sub_21F1C28B0();
  return sub_21F1B1240;
}

uint64_t sub_21F1B1240(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_21F1C28C0();
}

uint64_t EnvironmentValues.isPadIdiom.getter()
{
  return sub_21F1B1EB4((void (*)(void))sub_21F1B1298);
}

unint64_t sub_21F1B1298()
{
  unint64_t result = qword_26AD3FDC8;
  if (!qword_26AD3FDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3FDC8);
  }
  return result;
}

uint64_t sub_21F1B12EC@<X0>(unsigned char *a1@<X8>)
{
  return sub_21F1B1F50((void (*)(void))sub_21F1B1298, a1);
}

uint64_t sub_21F1B130C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F1B1FAC(a1, a2, a3, a4, (void (*)(void))sub_21F1B1298);
}

uint64_t EnvironmentValues.isPadIdiom.setter(uint64_t a1)
{
  return sub_21F1B201C(a1, (void (*)(void))sub_21F1B1298);
}

uint64_t (*EnvironmentValues.isPadIdiom.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_21F1B1298();
  sub_21F1C28B0();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_21F1B13C0;
}

uint64_t sub_21F1B13C0(uint64_t a1)
{
  return sub_21F1B20E4(a1);
}

uint64_t EnvironmentValues.isLargeUI.getter()
{
  return sub_21F1B1EB4((void (*)(void))sub_21F1B13EC);
}

unint64_t sub_21F1B13EC()
{
  unint64_t result = qword_26AD3FD20;
  if (!qword_26AD3FD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3FD20);
  }
  return result;
}

uint64_t sub_21F1B1440@<X0>(unsigned char *a1@<X8>)
{
  return sub_21F1B1F50((void (*)(void))sub_21F1B13EC, a1);
}

uint64_t sub_21F1B1460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F1B1FAC(a1, a2, a3, a4, (void (*)(void))sub_21F1B13EC);
}

uint64_t EnvironmentValues.isLargeUI.setter(uint64_t a1)
{
  return sub_21F1B201C(a1, (void (*)(void))sub_21F1B13EC);
}

uint64_t (*EnvironmentValues.isLargeUI.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_21F1B13EC();
  sub_21F1C28B0();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_21F1B1514;
}

uint64_t sub_21F1B1514(uint64_t a1)
{
  return sub_21F1B20E4(a1);
}

void sub_21F1B1520(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21F1B152C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_21F1B25A4();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t EnvironmentValues.shouldUseAccessibleLayout.getter()
{
  uint64_t v49 = sub_21F1C2A80();
  uint64_t v46 = *(char **)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  unint64_t v44 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9C0);
  MEMORY[0x270FA5388](v45);
  uint64_t v48 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9B8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v39 - v8;
  MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)&v39 - v10;
  uint64_t v12 = sub_21F1C28A0();
  uint64_t v47 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unsigned int v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21F1C2690();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F1B1B58();
  uint64_t v19 = v0;
  sub_21F1C28B0();
  if (v50 != 2)
  {
    char v31 = v50 & 1;
    return v31 & 1;
  }
  uint64_t v42 = v9;
  uint64_t v43 = v11;
  uint64_t v41 = v6;
  uint64_t v20 = (uint64_t)v48;
  uint64_t v21 = v49;
  sub_21F1C27A0();
  char v22 = sub_21F1C2680();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v23 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v14, v19, v12);
  if ((v22 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
LABEL_11:
    char v31 = 0;
    return v31 & 1;
  }
  uint64_t v40 = v12;
  uint64_t v24 = (uint64_t)v43;
  sub_21F1C2820();
  id v25 = v46;
  uint64_t v26 = (uint64_t)v42;
  uint64_t v27 = v21;
  (*((void (**)(char *, void, uint64_t))v46 + 13))(v42, *MEMORY[0x263F19F00], v21);
  (*((void (**)(uint64_t, void, uint64_t, uint64_t))v25 + 7))(v26, 0, 1, v21);
  uint64_t v28 = v20;
  uint64_t v29 = v20 + *(int *)(v45 + 48);
  sub_21F1B1BAC(v24, v20);
  sub_21F1B1BAC(v26, v29);
  uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))*((void *)v25 + 6);
  if (v30(v20, 1, v27) != 1)
  {
    uint64_t v32 = (uint64_t)v41;
    sub_21F1B1BAC(v28, (uint64_t)v41);
    int v33 = v30(v29, 1, v27);
    uint64_t v34 = v40;
    if (v33 != 1)
    {
      uint64_t v36 = (void (*)(char *, uint64_t, uint64_t))*((void *)v25 + 4);
      uint64_t v46 = v14;
      uint64_t v37 = v44;
      v36(v44, v29, v27);
      sub_21F1B1C14();
      char v31 = sub_21F1C3040();
      uint64_t v38 = (void (*)(char *, uint64_t))*((void *)v25 + 1);
      v38(v37, v27);
      sub_21F196760((uint64_t)v42, &qword_26AD3F9B8);
      sub_21F196760((uint64_t)v43, &qword_26AD3F9B8);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v46, v34);
      v38((char *)v32, v27);
      sub_21F196760(v28, &qword_26AD3F9B8);
      return v31 & 1;
    }
    sub_21F196760((uint64_t)v42, &qword_26AD3F9B8);
    sub_21F196760((uint64_t)v43, &qword_26AD3F9B8);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v34);
    (*((void (**)(uint64_t, uint64_t))v25 + 1))(v32, v27);
    goto LABEL_10;
  }
  sub_21F196760(v26, &qword_26AD3F9B8);
  sub_21F196760(v24, &qword_26AD3F9B8);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v40);
  if (v30(v29, 1, v27) != 1)
  {
LABEL_10:
    sub_21F196760(v28, &qword_26AD3F9C0);
    goto LABEL_11;
  }
  sub_21F196760(v20, &qword_26AD3F9B8);
  char v31 = 1;
  return v31 & 1;
}

unint64_t sub_21F1B1B58()
{
  unint64_t result = qword_26AD40858[0];
  if (!qword_26AD40858[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26AD40858);
  }
  return result;
}

uint64_t sub_21F1B1BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F9B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F1B1C14()
{
  unint64_t result = qword_267EC4420;
  if (!qword_267EC4420)
  {
    sub_21F1C2A80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4420);
  }
  return result;
}

uint64_t EnvironmentValues.shouldUseAccessibleLayout.setter()
{
  return sub_21F1C28C0();
}

uint64_t (*EnvironmentValues.shouldUseAccessibleLayout.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = EnvironmentValues.shouldUseAccessibleLayout.getter() & 1;
  return sub_21F1B1CF4;
}

uint64_t sub_21F1B1CF4(uint64_t a1)
{
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a1 + 8);
  sub_21F1B1B58();
  return sub_21F1C28C0();
}

uint64_t sub_21F1B1D3C()
{
  id v0 = objc_msgSend(self, sel_mainScreen);
  id v1 = objc_msgSend(v0, sel_fixedCoordinateSpace);

  objc_msgSend(v1, sel_bounds);
  uint64_t v3 = v2;
  uint64_t result = swift_unknownObjectRelease();
  qword_26AD40258 = v3;
  return result;
}

uint64_t sub_21F1B1DC4()
{
  if (qword_26AD40260 != -1) {
    uint64_t result = swift_once();
  }
  byte_267EC5FC8 = *(double *)&qword_26AD40258 <= 320.0;
  return result;
}

uint64_t sub_21F1B1E28@<X0>(unsigned char *a1@<X8>)
{
  return sub_21F1B1E4C(&qword_26AD40250, &byte_267EC5FC8, a1);
}

uint64_t sub_21F1B1E4C@<X0>(void *a1@<X2>, unsigned char *a2@<X3>, unsigned char *a3@<X8>)
{
  if (*a1 != -1) {
    uint64_t result = swift_once();
  }
  *a3 = *a2;
  return result;
}

uint64_t EnvironmentValues.isCompactLayout.getter()
{
  return sub_21F1B1EB4((void (*)(void))sub_21F1B1EFC);
}

uint64_t sub_21F1B1EB4(void (*a1)(void))
{
  a1();
  sub_21F1C28B0();
  return v2;
}

unint64_t sub_21F1B1EFC()
{
  unint64_t result = qword_26AD402F0[0];
  if (!qword_26AD402F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26AD402F0);
  }
  return result;
}

uint64_t sub_21F1B1F50@<X0>(void (*a1)(void)@<X3>, unsigned char *a2@<X8>)
{
  a1();
  uint64_t result = sub_21F1C28B0();
  *a2 = v4;
  return result;
}

uint64_t sub_21F1B1FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_21F1C28C0();
}

uint64_t EnvironmentValues.isCompactLayout.setter(uint64_t a1)
{
  return sub_21F1B201C(a1, (void (*)(void))sub_21F1B1EFC);
}

uint64_t sub_21F1B201C(uint64_t a1, void (*a2)(void))
{
  return sub_21F1C28C0();
}

uint64_t (*EnvironmentValues.isCompactLayout.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_21F1B1EFC();
  sub_21F1C28B0();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_21F1B20D8;
}

uint64_t sub_21F1B20D8(uint64_t a1)
{
  return sub_21F1B20E4(a1);
}

uint64_t sub_21F1B20E4(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_21F1C28C0();
}

void sub_21F1B2114()
{
  qword_267EC5FD8 = MEMORY[0x263F8EE80];
}

uint64_t sub_21F1B2128@<X0>(void *a1@<X8>)
{
  if (qword_267EC5FD0 != -1) {
    swift_once();
  }
  *a1 = qword_267EC5FD8;
  return swift_bridgeObjectRetain();
}

uint64_t EnvironmentValues.availableSheetItems.getter()
{
  sub_21F1B21D4();
  sub_21F1C28B0();
  return v1;
}

unint64_t sub_21F1B21D4()
{
  unint64_t result = qword_267EC5FE8[0];
  if (!qword_267EC5FE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267EC5FE8);
  }
  return result;
}

uint64_t EnvironmentValues.availableSheetItems.setter()
{
  return sub_21F1C28C0();
}

uint64_t (*EnvironmentValues.availableSheetItems.modify(uint64_t a1))(void *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_21F1B21D4();
  sub_21F1C28B0();
  return sub_21F1B22C4;
}

uint64_t sub_21F1B22C4(void *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0) {
    return sub_21F1C28C0();
  }
  swift_bridgeObjectRetain();
  sub_21F1C28C0();
  return swift_bridgeObjectRelease();
}

unint64_t sub_21F1B235C()
{
  unint64_t result = qword_267EC4428;
  if (!qword_267EC4428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4428);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for UserInterfaceType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UserInterfaceType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21F1B250CLL);
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

ValueMetadata *type metadata accessor for UserInterfaceType()
{
  return &type metadata for UserInterfaceType;
}

ValueMetadata *type metadata accessor for AvailableSheetItems()
{
  return &type metadata for AvailableSheetItems;
}

ValueMetadata *type metadata accessor for IsCompactLayoutKey()
{
  return &type metadata for IsCompactLayoutKey;
}

ValueMetadata *type metadata accessor for ShouldUseAccessibleLayoutKey()
{
  return &type metadata for ShouldUseAccessibleLayoutKey;
}

ValueMetadata *type metadata accessor for IsLargeUIKey()
{
  return &type metadata for IsLargeUIKey;
}

ValueMetadata *type metadata accessor for IsPadIdiomKey()
{
  return &type metadata for IsPadIdiomKey;
}

ValueMetadata *type metadata accessor for UserInterfaceKey()
{
  return &type metadata for UserInterfaceKey;
}

unint64_t sub_21F1B25A4()
{
  unint64_t result = qword_267EC4430;
  if (!qword_267EC4430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3FA50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4430);
  }
  return result;
}

uint64_t dispatch thunk of AuthorizationStateProtocol.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.stop()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.pause()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.resume()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.didBecomeActive()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.didResignActive()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.sidecarDidBecomeActive()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.cancel(withCallback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.startAuthenticatorEvaluation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.didEncounterAuthenticationEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.authenticatorModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t sub_21F1B26EC()
{
  return sub_21F1C2E90();
}

uint64_t sub_21F1B2744(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 116);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_21F1980F0(*(void *)v2, v4);
  char v5 = sub_21F19F534(v3, v4);
  sub_21F198130(v3, v4);
  return v5 & 1;
}

uint64_t sub_21F1B27A4(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 120);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_21F1980F0(*(void *)v2, v4);
  char v5 = sub_21F19F534(v3, v4);
  sub_21F198130(v3, v4);
  return v5 & 1;
}

uint64_t sub_21F1B2804()
{
  return sub_21F1C2770();
}

uint64_t sub_21F1B2828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F1BACE0(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t PaymentItem.init(icon:primaryLabel:secondaryLabel:chevronStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t (*a2)(uint64_t)@<X2>, void (*a3)(uint64_t)@<X4>, char *a4@<X6>, uint64_t (*a5)(uint64_t)@<X7>, uint64_t a6@<X8>, uint64_t a7, char *a8, char a9, uint64_t a10, uint64_t a11, long long a12, long long a13, long long a14, uint64_t a15, uint64_t a16)
{
  char v20 = *a4;
  char v32 = *a8;
  v34[0] = a12;
  v34[1] = a13;
  v34[2] = a14;
  uint64_t v35 = a15;
  uint64_t v36 = a16;
  uint64_t v21 = (int *)type metadata accessor for PaymentItem();
  char v22 = (_OWORD *)(a6 + v21[28]);
  uint64_t v37 = 0;
  sub_21F1C2E70();
  *char v22 = a12;
  uint64_t v23 = a6 + v21[29];
  *(void *)uint64_t v23 = swift_getKeyPath();
  *(unsigned char *)(v23 + 8) = 0;
  uint64_t v24 = a6 + v21[30];
  *(void *)uint64_t v24 = swift_getKeyPath();
  *(unsigned char *)(v24 + 8) = 0;
  id v25 = (uint64_t *)(a6 + v21[31]);
  *id v25 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4438);
  uint64_t v26 = swift_storeEnumTagMultiPayload();
  *(void *)(a6 + v21[32]) = 0x4052800000000000;
  *(void *)(a6 + v21[33]) = 0x402C000000000000;
  *(void *)(a6 + v21[34]) = 0x4044000000000000;
  uint64_t v27 = a1(v26);
  uint64_t v28 = a2(v27);
  a3(v28);
  LOBYTE(v34[0]) = v20;
  uint64_t v29 = sub_21F1A90CC(v34, a6 + v21[23]);
  uint64_t result = a5(v29);
  *(unsigned char *)(a6 + v21[25]) = v32;
  *(unsigned char *)(a6 + v21[26]) = a9;
  char v31 = (void *)(a6 + v21[27]);
  *char v31 = a10;
  v31[1] = a11;
  return result;
}

uint64_t type metadata accessor for PaymentItem()
{
  return swift_getGenericMetadata();
}

uint64_t PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void (*a8)(uint64_t)@<X7>, uint64_t a9@<X8>, uint64_t a10, unsigned __int8 *a11, unsigned __int8 a12, uint64_t a13, uint64_t a14, long long a15, uint64_t a16, uint64_t a17, long long a18, uint64_t a19, uint64_t a20)
{
  uint64_t v47 = a5;
  uint64_t v48 = a8;
  uint64_t v46 = a6;
  uint64_t v42 = a4;
  uint64_t v43 = a3;
  uint64_t v40 = a2;
  uint64_t v41 = a1;
  uint64_t v50 = a13;
  uint64_t v51 = a14;
  int v49 = a12;
  v39[1] = a18;
  v39[0] = a15;
  uint64_t v45 = a10;
  uint64_t v22 = sub_21F1C3130();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  id v25 = (char *)v39 - v24;
  int v44 = *a11;
  long long v52 = a15;
  uint64_t v53 = a16;
  uint64_t v54 = a17;
  long long v55 = a18;
  uint64_t v56 = a19;
  uint64_t v57 = a20;
  uint64_t v26 = (int *)type metadata accessor for PaymentItem();
  uint64_t v27 = (void *)(a9 + v26[28]);
  uint64_t v58 = 0;
  sub_21F1C2E70();
  uint64_t v28 = *((void *)&v52 + 1);
  void *v27 = v52;
  v27[1] = v28;
  uint64_t v29 = a9 + v26[29];
  *(void *)uint64_t v29 = swift_getKeyPath();
  *(unsigned char *)(v29 + 8) = 0;
  uint64_t v30 = a9 + v26[30];
  *(void *)uint64_t v30 = swift_getKeyPath();
  *(unsigned char *)(v30 + 8) = 0;
  char v31 = (uint64_t *)(a9 + v26[31]);
  *char v31 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4438);
  uint64_t v32 = swift_storeEnumTagMultiPayload();
  *(void *)(a9 + v26[32]) = 0x4052800000000000;
  *(void *)(a9 + v26[33]) = 0x402C000000000000;
  *(void *)(a9 + v26[34]) = 0x4044000000000000;
  uint64_t v33 = v41(v32);
  uint64_t v34 = v43(v33);
  v47(v34);
  uint64_t v35 = sub_21F1ABA9C(a7, a9 + v26[23], type metadata accessor for AccessoryViewStyle);
  v48(v35);
  sub_21F1BFF04(a7, type metadata accessor for AccessoryViewStyle);
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(a9 + v26[24], v25, v22);
  *(unsigned char *)(a9 + v26[25]) = v44;
  *(unsigned char *)(a9 + v26[26]) = v49;
  uint64_t v37 = (void *)(a9 + v26[27]);
  uint64_t v38 = v51;
  *uint64_t v37 = v50;
  v37[1] = v38;
  return result;
}

uint64_t sub_21F1B2D60@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v54 = a1[2];
  sub_21F1C26C0();
  sub_21F1C2B40();
  sub_21F1C26C0();
  uint64_t v53 = a1[3];
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  uint64_t v52 = a1[4];
  sub_21F1C3130();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4440);
  uint64_t v58 = a1;
  uint64_t v51 = a1[5];
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  uint64_t v50 = a1[9];
  uint64_t v79 = v50;
  uint64_t v80 = MEMORY[0x263F19100];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v4 = MEMORY[0x263F18C10];
  uint64_t v77 = WitnessTable;
  uint64_t v78 = MEMORY[0x263F18C10];
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v76 = v4;
  uint64_t v73 = swift_getWitnessTable();
  uint64_t v74 = v4;
  swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  uint64_t v5 = sub_21F1C2F00();
  uint64_t v6 = swift_getWitnessTable();
  uint64_t v71 = v5;
  uint64_t v72 = v6;
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4448);
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4100);
  uint64_t v7 = sub_21F1C26C0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  int v49 = (uint64_t *)((char *)&v48 - v12);
  uint64_t v71 = v5;
  uint64_t v72 = v6;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_21F1BFEBC((unint64_t *)&qword_267EC3E08, MEMORY[0x263F1A470]);
  uint64_t v69 = OpaqueTypeConformance2;
  uint64_t v70 = v14;
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v68 = MEMORY[0x263F19100];
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v16 = sub_21F192EE4(&qword_267EC4450, &qword_267EC4448);
  uint64_t v65 = v15;
  uint64_t v66 = v16;
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v18 = sub_21F192EE4(&qword_267EC4168, &qword_267EC4100);
  uint64_t v63 = v17;
  uint64_t v64 = v18;
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v20 = sub_21F1C2EC0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v48 - v25;
  uint64_t v27 = sub_21F1C2A60();
  uint64_t v28 = v59;
  uint64_t v57 = v27;
  uint64_t v56 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v58);
  long long v55 = (char *)&v48 - v30;
  char v31 = (uint64_t *)(v28 + *(int *)(v29 + 108));
  uint64_t v32 = *v31;
  if (*v31)
  {
    int v49 = &v48;
    uint64_t v48 = v31[1];
    uint64_t v33 = MEMORY[0x270FA5388](v29);
    uint64_t v34 = v53;
    *(&v48 - 10) = v54;
    *(&v48 - 9) = v34;
    uint64_t v35 = v51;
    *(&v48 - 8) = v52;
    *(&v48 - 7) = v35;
    *((_OWORD *)&v48 - 3) = *(_OWORD *)(v33 + 48);
    uint64_t v36 = v50;
    *(&v48 - 4) = *(void *)(v33 + 64);
    *(&v48 - 3) = v36;
    *(&v48 - 2) = v28;
    swift_retain_n();
    sub_21F1C2EA0();
    uint64_t v59 = swift_getWitnessTable();
    uint64_t v37 = v26;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
    v38(v37, v24, v20);
    uint64_t v39 = *(void (**)(char *, uint64_t))(v21 + 8);
    v39(v24, v20);
    v38(v24, v37, v20);
    uint64_t v40 = v55;
    sub_21F1AEB3C((uint64_t)v24, v20);
    sub_21F1B4D18(v32);
    v39(v24, v20);
    v39(v37, v20);
  }
  else
  {
    sub_21F1B3E38((void *)v29, v11);
    uint64_t v41 = *(void (**)(uint64_t *, char *, uint64_t))(v8 + 16);
    uint64_t v42 = (char *)v49;
    v41(v49, v11, v7);
    uint64_t v43 = *(void (**)(char *, uint64_t))(v8 + 8);
    v43(v11, v7);
    v41((uint64_t *)v11, v42, v7);
    swift_getWitnessTable();
    int v44 = v55;
    sub_21F1AEC88((uint64_t)v11, v20, v7);
    v43(v11, v7);
    v43(v42, v7);
    uint64_t v40 = v44;
  }
  uint64_t v61 = swift_getWitnessTable();
  uint64_t v62 = v19;
  uint64_t v45 = v57;
  swift_getWitnessTable();
  uint64_t v46 = v56;
  (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v60, v40, v45);
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v40, v45);
}

uint64_t sub_21F1B376C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  uint64_t v39 = a8;
  uint64_t v38 = a7;
  uint64_t v37 = a6;
  uint64_t v33 = a5;
  uint64_t v34 = a4;
  uint64_t v35 = a3;
  uint64_t v36 = a2;
  uint64_t v40 = a1;
  uint64_t v41 = a9;
  uint64_t v32 = a10;
  sub_21F1C26C0();
  sub_21F1C2B40();
  sub_21F1C26C0();
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4440);
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  uint64_t v64 = a10;
  uint64_t v65 = MEMORY[0x263F19100];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = MEMORY[0x263F18C10];
  uint64_t v62 = WitnessTable;
  uint64_t v63 = MEMORY[0x263F18C10];
  uint64_t v60 = swift_getWitnessTable();
  uint64_t v61 = v11;
  uint64_t v58 = swift_getWitnessTable();
  uint64_t v59 = v11;
  swift_getWitnessTable();
  v31[1] = MEMORY[0x263F1AE68];
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  uint64_t v12 = sub_21F1C2F00();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v50 = v12;
  uint64_t v51 = v13;
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4448);
  v31[2] = sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4100);
  uint64_t v14 = sub_21F1C26C0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v31 - v19;
  uint64_t v50 = v36;
  uint64_t v51 = v35;
  uint64_t v52 = v34;
  uint64_t v53 = v33;
  uint64_t v54 = v37;
  uint64_t v55 = v38;
  uint64_t v56 = v39;
  uint64_t v57 = v32;
  uint64_t v21 = (void *)type metadata accessor for PaymentItem();
  sub_21F1B3E38(v21, v18);
  uint64_t v50 = v12;
  uint64_t v51 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = sub_21F1BFEBC((unint64_t *)&qword_267EC3E08, MEMORY[0x263F1A470]);
  uint64_t v48 = OpaqueTypeConformance2;
  uint64_t v49 = v23;
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v47 = MEMORY[0x263F19100];
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = sub_21F192EE4(&qword_267EC4450, &qword_267EC4448);
  uint64_t v44 = v24;
  uint64_t v45 = v25;
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v27 = sub_21F192EE4(&qword_267EC4168, &qword_267EC4100);
  uint64_t v42 = v26;
  uint64_t v43 = v27;
  swift_getWitnessTable();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v28(v20, v18, v14);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v15 + 8);
  v29(v18, v14);
  v28(v41, v20, v14);
  return ((uint64_t (*)(char *, uint64_t))v29)(v20, v14);
}

uint64_t sub_21F1B3E38@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v88 = a2;
  uint64_t v87 = sub_21F1C2730();
  uint64_t v3 = MEMORY[0x270FA5388](v87);
  v86 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = *(a1 - 1);
  uint64_t v85 = *(void *)(v84 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v83 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_21F1C2AA0();
  uint64_t v80 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v79 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = a1[2];
  sub_21F1C26C0();
  sub_21F1C2B40();
  sub_21F1C26C0();
  uint64_t v93 = a1[3];
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  uint64_t v92 = a1[4];
  sub_21F1C3130();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4440);
  uint64_t v91 = a1[5];
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  uint64_t v7 = sub_21F1C26C0();
  uint64_t v90 = a1[9];
  uint64_t v120 = v90;
  uint64_t v121 = MEMORY[0x263F19100];
  uint64_t v74 = MEMORY[0x263F18E48];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v9 = MEMORY[0x263F18C10];
  uint64_t v118 = WitnessTable;
  uint64_t v119 = MEMORY[0x263F18C10];
  uint64_t v116 = swift_getWitnessTable();
  uint64_t v117 = v9;
  uint64_t v114 = swift_getWitnessTable();
  uint64_t v115 = v9;
  uint64_t v10 = swift_getWitnessTable();
  v112 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  v113 = (void *)v10;
  uint64_t v65 = MEMORY[0x263F1AE68];
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  uint64_t v64 = swift_getWitnessTable();
  uint64_t v11 = sub_21F1C2F00();
  uint64_t v67 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v61 - v12;
  uint64_t v14 = swift_getWitnessTable();
  v112 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v11;
  v113 = (void *)v14;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v66 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v17 = (char *)&v61 - v16;
  uint64_t v18 = sub_21F1C26C0();
  uint64_t v68 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v61 - v19;
  uint64_t v70 = sub_21F1C26C0();
  uint64_t v72 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v89 = (char *)&v61 - v21;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4448);
  uint64_t v73 = sub_21F1C26C0();
  uint64_t v78 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v69 = (char *)&v61 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4100);
  uint64_t v77 = sub_21F1C26C0();
  uint64_t v76 = *(void *)(v77 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v77);
  uint64_t v71 = (char *)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v75 = (char *)&v61 - v25;
  sub_21F1C2950();
  uint64_t v95 = v94;
  uint64_t v96 = v93;
  uint64_t v97 = v92;
  uint64_t v98 = v91;
  uint64_t v62 = a1[6];
  uint64_t v63 = a1[7];
  uint64_t v99 = v62;
  uint64_t v100 = v63;
  uint64_t v61 = a1[8];
  uint64_t v101 = v61;
  uint64_t v102 = v90;
  uint64_t v26 = v82;
  uint64_t v103 = v82;
  sub_21F1C2EF0();
  uint64_t v27 = v79;
  sub_21F1C2A90();
  sub_21F1C2D20();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v27, v81);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v13, v11);
  v112 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v11;
  v113 = (void *)v14;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_21F1C2D40();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v17, OpaqueTypeMetadata2);
  sub_21F1C2F90();
  uint64_t v29 = sub_21F1BFEBC((unint64_t *)&qword_267EC3E08, MEMORY[0x263F1A470]);
  uint64_t v110 = OpaqueTypeConformance2;
  uint64_t v111 = v29;
  uint64_t v60 = swift_getWitnessTable();
  sub_21F1C2D70();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v20, v18);
  uint64_t v30 = v84;
  char v31 = v83;
  (*(void (**)(char *, uint64_t, void *))(v84 + 16))(v83, v26, a1);
  uint64_t v32 = v30;
  unint64_t v33 = (*(unsigned __int8 *)(v30 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v34 = (char *)swift_allocObject();
  uint64_t v35 = v93;
  *((void *)v34 + 2) = v94;
  *((void *)v34 + 3) = v35;
  uint64_t v36 = v91;
  *((void *)v34 + 4) = v92;
  *((void *)v34 + 5) = v36;
  uint64_t v37 = v63;
  *((void *)v34 + 6) = v62;
  *((void *)v34 + 7) = v37;
  uint64_t v38 = v90;
  *((void *)v34 + 8) = v61;
  *((void *)v34 + 9) = v38;
  (*(void (**)(char *, char *, void *))(v32 + 32))(&v34[v33], v31, a1);
  v112 = sub_21F1B7980;
  v113 = v34;
  sub_21F1C2F90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4458);
  uint64_t v108 = v60;
  uint64_t v109 = MEMORY[0x263F19100];
  uint64_t v39 = v70;
  uint64_t v40 = swift_getWitnessTable();
  sub_21F192EE4(&qword_267EC4460, &qword_267EC4458);
  uint64_t v41 = v69;
  uint64_t v42 = v89;
  sub_21F1C2CE0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v42, v39);
  uint64_t v43 = *(void *)sub_21F18B72C();
  uint64_t v44 = v86;
  uint64_t v45 = &v86[*(int *)(v87 + 20)];
  uint64_t v46 = *MEMORY[0x263F19860];
  uint64_t v47 = sub_21F1C2900();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v45, v46, v47);
  uint64_t v48 = (uint64_t)v44;
  *uint64_t v44 = v43;
  v44[1] = v43;
  uint64_t v49 = sub_21F192EE4(&qword_267EC4450, &qword_267EC4448);
  uint64_t v106 = v40;
  uint64_t v107 = v49;
  uint64_t v50 = v73;
  uint64_t v51 = swift_getWitnessTable();
  sub_21F1BFEBC(&qword_267EC4468, MEMORY[0x263F19048]);
  uint64_t v52 = v71;
  sub_21F1C2DC0();
  sub_21F1BFF04(v48, MEMORY[0x263F19048]);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v41, v50);
  uint64_t v53 = sub_21F192EE4(&qword_267EC4168, &qword_267EC4100);
  uint64_t v104 = v51;
  uint64_t v105 = v53;
  uint64_t v54 = v77;
  swift_getWitnessTable();
  uint64_t v55 = v76;
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  uint64_t v57 = v75;
  v56(v75, v52, v54);
  uint64_t v58 = *(void (**)(char *, uint64_t))(v55 + 8);
  v58(v52, v54);
  v56(v88, v57, v54);
  return ((uint64_t (*)(char *, uint64_t))v58)(v57, v54);
}

uint64_t sub_21F1B4D00()
{
  return sub_21F1BFE7C((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_21F1B376C);
}

uint64_t sub_21F1B4D18(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21F1B4D28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(void, void, void)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v173 = a8;
  uint64_t v174 = a7;
  uint64_t v175 = a6;
  uint64_t v172 = a2;
  uint64_t v156 = a1;
  uint64_t v168 = a9;
  uint64_t v170 = a10;
  uint64_t v13 = sub_21F1C2AA0();
  uint64_t v147 = *(void *)(v13 - 8);
  uint64_t v148 = v13;
  MEMORY[0x270FA5388](v13);
  v146 = (char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21F1C26C0();
  uint64_t v139 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  v134 = (char *)&v119 - v16;
  uint64_t v17 = sub_21F1C26C0();
  uint64_t v136 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  v131 = (char *)&v119 - v18;
  uint64_t v19 = sub_21F1C26C0();
  uint64_t v135 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  v130 = (char *)&v119 - v20;
  uint64_t v21 = sub_21F1C26C0();
  uint64_t v137 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  v133 = (char *)&v119 - v22;
  uint64_t v211 = a10;
  uint64_t v212 = MEMORY[0x263F19100];
  uint64_t v161 = MEMORY[0x263F18E48];
  uint64_t v141 = v15;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v209 = WitnessTable;
  uint64_t v210 = MEMORY[0x263F18C10];
  uint64_t v23 = MEMORY[0x263F18C10];
  uint64_t v140 = v17;
  uint64_t v124 = swift_getWitnessTable();
  uint64_t v207 = v124;
  uint64_t v208 = v23;
  uint64_t v138 = v19;
  uint64_t v125 = swift_getWitnessTable();
  uint64_t v205 = v125;
  uint64_t v206 = v23;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v142 = v21;
  uint64_t v195 = v21;
  uint64_t v127 = v24;
  uint64_t v196 = v24;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v128 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  v126 = (char *)&v119 - v26;
  sub_21F1C2B40();
  uint64_t v129 = OpaqueTypeMetadata2;
  uint64_t v27 = sub_21F1C26C0();
  uint64_t v144 = *(void *)(v27 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  v143 = (char *)&v119 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  v132 = (char *)&v119 - v30;
  uint64_t v31 = sub_21F1C2F60();
  uint64_t v121 = *(void *)(v31 - 8);
  uint64_t v122 = v31;
  MEMORY[0x270FA5388](v31);
  uint64_t v120 = (char *)&v119 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4440);
  uint64_t v34 = MEMORY[0x270FA5388](v33);
  uint64_t v171 = (uint64_t)&v119 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  uint64_t v164 = (uint64_t)&v119 - v36;
  v178 = a5;
  uint64_t v37 = sub_21F1C3130();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v152 = v37;
  uint64_t v153 = v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v151 = (char *)&v119 - v40;
  uint64_t v169 = *((void *)a5 - 1);
  MEMORY[0x270FA5388](v39);
  v162 = (char *)&v119 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = v33;
  uint64_t v145 = v27;
  swift_getTupleTypeMetadata2();
  uint64_t v177 = sub_21F1C2FB0();
  uint64_t v167 = sub_21F1C3130();
  uint64_t v165 = *(void *)(v167 - 8);
  uint64_t v42 = MEMORY[0x270FA5388](v167);
  v166 = (char *)&v119 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  v176 = (char *)&v119 - v44;
  sub_21F1C26C0();
  sub_21F1C26C0();
  uint64_t v45 = a3;
  uint64_t v149 = a3;
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  uint64_t v46 = a4;
  uint64_t v150 = a4;
  sub_21F1C3130();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  uint64_t v158 = swift_getWitnessTable();
  uint64_t v47 = sub_21F1C2EE0();
  uint64_t v160 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v49 = (char *)&v119 - v48;
  uint64_t v50 = sub_21F1C26C0();
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v159 = (char *)&v119 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  uint64_t v56 = (char *)&v119 - v55;
  MEMORY[0x270FA5388](v54);
  uint64_t v58 = (char *)&v119 - v57;
  uint64_t v179 = v172;
  uint64_t v180 = v45;
  uint64_t v181 = v46;
  v182 = v178;
  uint64_t v183 = v175;
  uint64_t v184 = v174;
  uint64_t v185 = v173;
  uint64_t v59 = v170;
  uint64_t v186 = v170;
  uint64_t v60 = v156;
  uint64_t v187 = v156;
  sub_21F1C28E0();
  sub_21F1C2ED0();
  uint64_t v61 = swift_getWitnessTable();
  sub_21F1C2D80();
  (*(void (**)(char *, uint64_t))(v160 + 8))(v49, v47);
  uint64_t v203 = v61;
  uint64_t v62 = v59;
  uint64_t v204 = MEMORY[0x263F18C10];
  uint64_t v155 = swift_getWitnessTable();
  uint64_t v64 = v51 + 16;
  uint64_t v63 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  uint64_t v158 = (uint64_t)v58;
  v154 = v63;
  v63(v58, (uint64_t)v56, v50);
  uint64_t v65 = *(uint64_t (**)(char *, uint64_t))(v51 + 8);
  uint64_t v160 = v51 + 8;
  uint64_t v161 = v50;
  uint64_t v66 = v50;
  uint64_t v67 = v152;
  v157 = v65;
  v65(v56, v66);
  uint64_t v195 = v172;
  uint64_t v196 = v149;
  uint64_t v68 = v151;
  uint64_t v197 = v150;
  uint64_t v69 = v178;
  v198 = v178;
  uint64_t v199 = v175;
  uint64_t v200 = v174;
  uint64_t v201 = v173;
  uint64_t v202 = v62;
  uint64_t v70 = type metadata accessor for PaymentItem();
  uint64_t v71 = v153;
  (*(void (**)(char *, uint64_t, uint64_t))(v153 + 16))(v68, v60 + *(int *)(v70 + 96), v67);
  uint64_t v72 = v169;
  if ((*(unsigned int (**)(char *, uint64_t, void))(v169 + 48))(v68, 1, v69) == 1)
  {
    (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v67);
    uint64_t v73 = v166;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v177 - 8) + 56))(v166, 1, 1, v177);
  }
  else
  {
    (*(void (**)(void))(v72 + 32))();
    uint64_t v175 = qword_21F1C5F08[*(char *)(v60 + *(int *)(v70 + 100))];
    uint64_t v74 = v120;
    sub_21F1C2F50();
    char v75 = sub_21F1C2BA0();
    sub_21F1C25C0();
    uint64_t v77 = v76;
    uint64_t v79 = v78;
    uint64_t v81 = v80;
    uint64_t v83 = v82;
    uint64_t v85 = v121;
    uint64_t v84 = v122;
    uint64_t v86 = v171;
    (*(void (**)(uint64_t, char *, uint64_t))(v121 + 16))(v171, v74, v122);
    uint64_t v87 = v86 + *(int *)(v163 + 36);
    *(unsigned char *)uint64_t v87 = v75;
    *(void *)(v87 + 8) = v77;
    *(void *)(v87 + 16) = v79;
    *(void *)(v87 + 24) = v81;
    *(void *)(v87 + 32) = v83;
    *(unsigned char *)(v87 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v74, v84);
    sub_21F1BFD3C(v86, v164, &qword_267EC4440);
    sub_21F1C2FA0();
    uint64_t v88 = v134;
    sub_21F1C2D70();
    sub_21F1C2BC0();
    uint64_t v89 = v131;
    uint64_t v90 = v141;
    sub_21F1C2D90();
    (*(void (**)(char *, uint64_t))(v139 + 8))(v88, v90);
    sub_21F1C2BA0();
    uint64_t v91 = v130;
    uint64_t v92 = v140;
    sub_21F1C2D90();
    (*(void (**)(char *, uint64_t))(v136 + 8))(v89, v92);
    sub_21F1C2BB0();
    uint64_t v93 = v133;
    uint64_t v94 = v138;
    sub_21F1C2D90();
    (*(void (**)(char *, uint64_t))(v135 + 8))(v91, v94);
    uint64_t v95 = v146;
    sub_21F1C2A90();
    uint64_t v97 = v126;
    uint64_t v96 = v127;
    uint64_t v98 = v142;
    sub_21F1C2D20();
    (*(void (**)(char *, uint64_t))(v147 + 8))(v95, v148);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v93, v98);
    uint64_t v195 = v98;
    uint64_t v196 = v96;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v175 = v64;
    uint64_t v100 = v143;
    uint64_t v101 = v129;
    sub_21F1C2D40();
    (*(void (**)(char *, uint64_t))(v128 + 8))(v97, v101);
    uint64_t v102 = sub_21F1BFEBC((unint64_t *)&qword_267EC3E08, MEMORY[0x263F1A470]);
    uint64_t v188 = OpaqueTypeConformance2;
    uint64_t v189 = v102;
    uint64_t v103 = v145;
    uint64_t v174 = swift_getWitnessTable();
    uint64_t v104 = v144;
    uint64_t v105 = *(void (**)(char *, char *, uint64_t))(v144 + 16);
    uint64_t v106 = v132;
    v105(v132, v100, v103);
    uint64_t v107 = *(void (**)(char *, uint64_t))(v104 + 8);
    v107(v100, v103);
    uint64_t v108 = v164;
    uint64_t v109 = v171;
    sub_21F196550(v164, v171, &qword_267EC4440);
    uint64_t v195 = v109;
    v105(v100, v106, v103);
    uint64_t v196 = (uint64_t)v100;
    uint64_t v193 = v163;
    uint64_t v194 = v103;
    unint64_t v191 = sub_21F1BFDA0();
    uint64_t v192 = v174;
    uint64_t v73 = v166;
    sub_21F193734((uint64_t)&v195, 2uLL, (uint64_t)&v193);
    v107(v106, v103);
    sub_21F196760(v108, &qword_267EC4440);
    (*(void (**)(char *, void (*)(void, void, void)))(v169 + 8))(v162, v178);
    v107(v100, v103);
    sub_21F196760(v171, &qword_267EC4440);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v177 - 8) + 56))(v73, 0, 1, v177);
  }
  swift_getWitnessTable();
  uint64_t v110 = v165;
  uint64_t v111 = v167;
  v178 = *(void (**)(void, void, void))(v165 + 16);
  v178(v176, v73, v167);
  v112 = *(void (**)(char *, uint64_t))(v110 + 8);
  v112(v73, v111);
  uint64_t v113 = v158;
  uint64_t v114 = v159;
  uint64_t v115 = v161;
  v154(v159, v158, v161);
  uint64_t v195 = (uint64_t)v114;
  uint64_t v116 = v176;
  v178(v73, v176, v111);
  uint64_t v196 = (uint64_t)v73;
  uint64_t v193 = v115;
  uint64_t v194 = v111;
  unint64_t v191 = v155;
  uint64_t v190 = swift_getWitnessTable();
  uint64_t v192 = swift_getWitnessTable();
  sub_21F193734((uint64_t)&v195, 2uLL, (uint64_t)&v193);
  v112(v116, v111);
  uint64_t v117 = v157;
  v157((char *)v113, v115);
  v112(v73, v111);
  return v117(v114, v115);
}

uint64_t sub_21F1B5FA4()
{
  return sub_21F1BFE7C((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_21F1B4D28);
}

uint64_t sub_21F1B5FBC@<X0>(char *a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  v130 = a1;
  uint64_t v118 = a9;
  uint64_t v17 = sub_21F1C3130();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  uint64_t v18 = sub_21F1C2FB0();
  uint64_t v129 = MEMORY[0x263F1BAD0];
  uint64_t v99 = v18;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v19 = sub_21F1C2EE0();
  uint64_t v102 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v97 = (char *)&v93 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v98 = (char *)&v93 - v22;
  uint64_t v95 = type metadata accessor for AccessoryViewStyle(0);
  uint64_t v23 = MEMORY[0x270FA5388](v95);
  uint64_t v94 = (char *)&v93 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = v17;
  uint64_t v112 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v109 = (char *)&v93 - v25;
  uint64_t v104 = v19;
  uint64_t v117 = sub_21F1C3130();
  uint64_t v116 = *(void *)(v117 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v117);
  uint64_t v103 = (char *)&v93 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v127 = (char *)&v93 - v28;
  uint64_t v135 = a2;
  uint64_t v136 = a3;
  uint64_t v122 = a4;
  uint64_t v137 = a4;
  uint64_t v138 = a5;
  uint64_t v123 = a5;
  uint64_t v124 = a6;
  uint64_t v139 = a6;
  uint64_t v140 = a7;
  uint64_t v125 = a7;
  uint64_t v126 = a8;
  uint64_t v141 = a8;
  uint64_t v142 = a10;
  uint64_t v121 = a10;
  uint64_t v29 = (int *)type metadata accessor for PaymentItem();
  uint64_t v30 = *((void *)v29 - 1);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v111 = (char *)&v93 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v93 - v33;
  uint64_t v119 = a2;
  sub_21F1C26C0();
  sub_21F1C2B40();
  sub_21F1C26C0();
  uint64_t v120 = a3;
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  uint64_t v129 = sub_21F1C2EE0();
  uint64_t v35 = *(void *)(v129 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v129);
  uint64_t v114 = (char *)&v93 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)&v93 - v39;
  MEMORY[0x270FA5388](v38);
  uint64_t v128 = (char *)&v93 - v41;
  uint64_t v42 = v130;
  uint64_t v43 = &v130[v29[28]];
  uint64_t v44 = *(char **)v43;
  uint64_t v45 = (char *)*((void *)v43 + 1);
  uint64_t v135 = v44;
  uint64_t v136 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4568);
  sub_21F1C2E80();
  double v46 = *(double *)v134;
  uint64_t v47 = *(void (**)(char *, char *, int *))(v30 + 16);
  v47(v34, v42, v29);
  uint64_t v101 = v30;
  uint64_t v105 = v47;
  if (v46 <= 74.0)
  {
    uint64_t v100 = *(void (**)(char *, int *))(v30 + 8);
    v100(v34, v29);
    uint64_t v49 = v35;
    uint64_t v50 = sub_21F1C28E0();
  }
  else
  {
    int v48 = v34[v29[26]];
    uint64_t v100 = *(void (**)(char *, int *))(v30 + 8);
    v100(v34, v29);
    uint64_t v49 = v35;
    if (v48 == 1) {
      uint64_t v50 = sub_21F1C28E0();
    }
    else {
      uint64_t v50 = sub_21F1C28D0();
    }
  }
  uint64_t v51 = v130;
  MEMORY[0x270FA5388](v50);
  uint64_t v52 = (uint64_t)v120;
  *(&v93 - 10) = (uint64_t)v119;
  *(&v93 - 9) = v52;
  uint64_t v53 = v122;
  uint64_t v54 = v123;
  *(&v93 - 8) = v122;
  *(&v93 - 7) = v54;
  uint64_t v55 = v125;
  *(&v93 - 6) = v124;
  *(&v93 - 5) = v55;
  uint64_t v56 = v121;
  *(&v93 - 4) = v126;
  *(&v93 - 3) = v56;
  *(&v93 - 2) = (uint64_t)v51;
  sub_21F1C2ED0();
  uint64_t v57 = v129;
  uint64_t v108 = swift_getWitnessTable();
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  uint64_t v107 = v49 + 16;
  uint64_t v106 = v58;
  v58(v128, v40, v57);
  uint64_t v59 = *(void (**)(char *, uint64_t))(v49 + 8);
  v59(v40, v57);
  uint64_t v60 = v112;
  uint64_t v61 = v109;
  uint64_t v62 = v113;
  (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v109, &v51[v29[22]], v113);
  int v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 48))(v61, 1, v53);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
  uint64_t v64 = v111;
  v105(v111, v51, v29);
  uint64_t v115 = v49 + 8;
  uint64_t v110 = v59;
  if (v63 != 1)
  {
    uint64_t v68 = ((uint64_t (*)(char *, int *))v100)(v64, v29);
    uint64_t v69 = v104;
    uint64_t v70 = v103;
    uint64_t v71 = v127;
    uint64_t v72 = v102;
    goto LABEL_10;
  }
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v66 = (uint64_t)v94;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v94, 1, 6, v65);
  sub_21F1BFEBC(&qword_267EC4578, (void (*)(uint64_t))type metadata accessor for AccessoryViewStyle);
  char v67 = sub_21F1C3040();
  sub_21F1BFF04(v66, type metadata accessor for AccessoryViewStyle);
  uint64_t v68 = ((uint64_t (*)(char *, int *))v100)(v64, v29);
  uint64_t v69 = v104;
  uint64_t v70 = v103;
  uint64_t v71 = v127;
  uint64_t v72 = v102;
  if ((v67 & 1) == 0)
  {
LABEL_10:
    MEMORY[0x270FA5388](v68);
    uint64_t v73 = (uint64_t)v120;
    *(&v93 - 10) = (uint64_t)v119;
    *(&v93 - 9) = v73;
    uint64_t v74 = v123;
    *(&v93 - 8) = v122;
    *(&v93 - 7) = v74;
    uint64_t v75 = v125;
    *(&v93 - 6) = v124;
    *(&v93 - 5) = v75;
    uint64_t v76 = v121;
    *(&v93 - 4) = v126;
    *(&v93 - 3) = v76;
    *(&v93 - 2) = (uint64_t)v130;
    sub_21F1C28E0();
    uint64_t v77 = v97;
    sub_21F1C2ED0();
    swift_getWitnessTable();
    uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v72 + 16);
    uint64_t v79 = v98;
    v78(v98, v77, v69);
    uint64_t v80 = *(void (**)(char *, uint64_t))(v72 + 8);
    v80(v77, v69);
    v78(v70, v79, v69);
    v80(v79, v69);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v70, 0, 1, v69);
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v102 + 56))(v103, 1, 1, v104);
  swift_getWitnessTable();
LABEL_11:
  uint64_t v81 = v116;
  uint64_t v82 = v71;
  uint64_t v83 = v70;
  uint64_t v84 = v70;
  uint64_t v85 = v117;
  v130 = *(char **)(v116 + 16);
  ((void (*)(char *, char *, uint64_t))v130)(v82, v83, v117);
  uint64_t v86 = *(void (**)(char *, uint64_t))(v81 + 8);
  v86(v84, v85);
  uint64_t v87 = v114;
  uint64_t v88 = v128;
  uint64_t v89 = v129;
  v106(v114, v128, v129);
  uint64_t v135 = v87;
  uint64_t v90 = v127;
  ((void (*)(char *, char *, uint64_t))v130)(v84, v127, v85);
  uint64_t v136 = v84;
  v134[0] = v89;
  v134[1] = v85;
  uint64_t v132 = v108;
  uint64_t v131 = swift_getWitnessTable();
  uint64_t v133 = swift_getWitnessTable();
  sub_21F193734((uint64_t)&v135, 2uLL, (uint64_t)v134);
  v86(v90, v85);
  uint64_t v91 = (uint64_t (*)(char *, uint64_t))v110;
  v110(v88, v89);
  v86(v84, v85);
  return v91(v87, v89);
}

uint64_t sub_21F1B6C54@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void (*a8)(void, void)@<X7>, uint64_t a9@<X8>, void (*a10)(void, void, void))
{
  int v48 = a8;
  uint64_t v47 = a7;
  uint64_t v46 = a5;
  uint64_t v45 = a4;
  uint64_t v49 = a1;
  uint64_t v54 = a9;
  uint64_t v44 = a10;
  uint64_t v50 = a3;
  uint64_t v53 = sub_21F1C26C0();
  uint64_t v56 = *(void *)(v53 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v53);
  uint64_t v51 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v52 = (char *)&v42 - v16;
  uint64_t v17 = sub_21F1C26C0();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v42 - v19;
  sub_21F1C2B40();
  uint64_t v21 = sub_21F1C26C0();
  uint64_t v55 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v42 - v25;
  uint64_t v43 = (char *)&v42 - v25;
  uint64_t v60 = a2;
  uint64_t v61 = (char *)a3;
  uint64_t v62 = v45;
  uint64_t v63 = v46;
  uint64_t v64 = a6;
  uint64_t v65 = a7;
  uint64_t v66 = v48;
  char v67 = v44;
  uint64_t v46 = type metadata accessor for PaymentItem();
  sub_21F1C2F90();
  sub_21F1C2D60();
  v59[6] = a6;
  v59[7] = MEMORY[0x263F18860];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v42 = v24;
  sub_21F1C2D40();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v28 = sub_21F1BFEBC((unint64_t *)&qword_267EC3E08, MEMORY[0x263F1A470]);
  v59[4] = WitnessTable;
  v59[5] = v28;
  uint64_t v45 = swift_getWitnessTable();
  uint64_t v29 = v55;
  uint64_t v44 = *(void (**)(void, void, void))(v55 + 16);
  v44(v26, v24, v21);
  uint64_t v30 = *(void (**)(void, void))(v29 + 8);
  uint64_t v55 = v29 + 8;
  int v48 = v30;
  v30(v24, v21);
  sub_21F1C2FA0();
  uint64_t v31 = v47;
  uint64_t v32 = v51;
  sub_21F1C2D70();
  v59[2] = v31;
  void v59[3] = MEMORY[0x263F19100];
  uint64_t v33 = v53;
  uint64_t v50 = swift_getWitnessTable();
  uint64_t v34 = v56;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  uint64_t v36 = v52;
  v35(v52, v32, v33);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v34 + 8);
  uint64_t v56 = v34 + 8;
  v37(v32, v33);
  uint64_t v38 = v42;
  uint64_t v39 = v43;
  v44(v42, v43, v21);
  uint64_t v60 = v38;
  v35(v32, v36, v33);
  uint64_t v61 = v32;
  v59[0] = v21;
  v59[1] = v33;
  uint64_t v57 = v45;
  uint64_t v58 = v50;
  sub_21F193734((uint64_t)&v60, 2uLL, (uint64_t)v59);
  v37(v36, v33);
  uint64_t v40 = (uint64_t (*)(char *, uint64_t))v48;
  v48(v39, v21);
  v37(v32, v33);
  return v40(v38, v21);
}

uint64_t sub_21F1B723C@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v37 = a5;
  uint64_t WitnessTable = a6;
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v42 = a9;
  uint64_t v14 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v39 = (uint64_t)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for AccessoryView(0);
  uint64_t v16 = MEMORY[0x270FA5388](v41);
  uint64_t v40 = (uint64_t)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v35 - v18;
  uint64_t v20 = sub_21F1C3130();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v35 - v25;
  uint64_t v46 = v35;
  uint64_t v47 = v36;
  uint64_t v48 = a4;
  uint64_t v49 = v37;
  uint64_t v50 = WitnessTable;
  uint64_t v51 = a7;
  uint64_t v52 = a8;
  uint64_t v53 = a10;
  uint64_t v27 = type metadata accessor for PaymentItem();
  uint64_t v28 = a1 + *(int *)(v27 + 88);
  v45[2] = a8;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v29(v26, v28, v20);
  uint64_t v30 = a1 + *(int *)(v27 + 92);
  uint64_t v31 = v39;
  sub_21F1ABA9C(v30, v39, type metadata accessor for AccessoryViewStyle);
  AccessoryView.init(style:)(v31, (uint64_t)v19);
  v29(v24, (uint64_t)v26, v20);
  uint64_t v46 = v24;
  uint64_t v32 = v40;
  sub_21F1ABA9C((uint64_t)v19, v40, type metadata accessor for AccessoryView);
  uint64_t v47 = v32;
  v45[0] = v20;
  v45[1] = v41;
  uint64_t v43 = WitnessTable;
  uint64_t v44 = sub_21F1BFEBC(&qword_267EC4580, (void (*)(uint64_t))type metadata accessor for AccessoryView);
  sub_21F193734((uint64_t)&v46, 2uLL, (uint64_t)v45);
  sub_21F1BFF04((uint64_t)v19, type metadata accessor for AccessoryView);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v21 + 8);
  v33(v26, v20);
  sub_21F1BFF04(v32, type metadata accessor for AccessoryView);
  return ((uint64_t (*)(char *, uint64_t))v33)(v24, v20);
}

uint64_t sub_21F1B75A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)()@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v50 = a8;
  uint64_t v51 = a7;
  uint64_t v49 = a6;
  uint64_t v53 = a4;
  uint64_t v54 = a5;
  uint64_t v52 = a3;
  uint64_t v47 = a9;
  uint64_t v55 = a1;
  uint64_t v56 = a11;
  uint64_t v57 = a10;
  uint64_t v58 = a2;
  uint64_t v45 = sub_21F1C2650();
  uint64_t v17 = *(void *)(v45 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v45);
  uint64_t v48 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = a3;
  uint64_t v61 = a4;
  uint64_t v62 = (char *)a5;
  uint64_t v63 = a6;
  uint64_t v64 = a7;
  uint64_t v65 = a8;
  uint64_t v66 = a10;
  uint64_t v67 = a11;
  uint64_t v19 = type metadata accessor for PaymentItem();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v42 - v22;
  uint64_t v44 = *sub_21F18BD80();
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v24 = v46;
  swift_retain();
  v24(v23, v58, v19);
  uint64_t v25 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v48, v55, v45);
  uint64_t v26 = *(unsigned __int8 *)(v20 + 80);
  uint64_t v43 = ((v26 + 80) & ~v26) + v21;
  uint64_t v27 = (v26 + 80) & ~v26;
  v42[1] = v26 | 7;
  unint64_t v28 = (v43 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v29 = (char *)swift_allocObject();
  uint64_t v30 = v53;
  *((void *)v29 + 2) = v52;
  *((void *)v29 + 3) = v30;
  uint64_t v31 = v49;
  *((void *)v29 + 4) = v54;
  *((void *)v29 + 5) = v31;
  uint64_t v32 = v50;
  *((void *)v29 + 6) = v51;
  *((void *)v29 + 7) = v32;
  uint64_t v33 = v56;
  *((void *)v29 + 8) = v57;
  *((void *)v29 + 9) = v33;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  v34(&v29[v27], v23, v19);
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v29[v28], v48, v25);
  uint64_t v60 = v44;
  uint64_t v61 = sub_21F1BF6A8;
  uint64_t v62 = v29;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  sub_21F1C2640();
  uint64_t v59 = v35;
  v46(v23, v58, v19);
  uint64_t v36 = (char *)swift_allocObject();
  uint64_t v37 = v53;
  *((void *)v36 + 2) = v52;
  *((void *)v36 + 3) = v37;
  uint64_t v38 = v49;
  *((void *)v36 + 4) = v54;
  *((void *)v36 + 5) = v38;
  uint64_t v39 = v50;
  *((void *)v36 + 6) = v51;
  *((void *)v36 + 7) = v39;
  uint64_t v40 = v56;
  *((void *)v36 + 8) = v57;
  *((void *)v36 + 9) = v40;
  v34(&v36[v27], v23, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4550);
  sub_21F1BFC5C();
  sub_21F1BFCD0();
  sub_21F1C2DB0();
  swift_release();
  swift_release();
  sub_21F1B4D18((uint64_t)v61);
  return sub_21F1B4D18(v63);
}

uint64_t sub_21F1B7980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = (uint64_t (*)())v2[3];
  uint64_t v6 = (void *)v2[4];
  uint64_t v7 = v2[5];
  uint64_t v8 = v2[6];
  uint64_t v9 = v2[7];
  uint64_t v11 = v2[8];
  uint64_t v10 = v2[9];
  uint64_t v12 = *(void *)(type metadata accessor for PaymentItem() - 8);
  return sub_21F1B75A8(a1, (uint64_t)v2 + ((*(unsigned __int8 *)(v12 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v4, v5, v6, v7, v8, v9, a2, v11, v10);
}

uint64_t PaymentItem.body.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v58 = (char *)a1[2];
  sub_21F1C26C0();
  sub_21F1C2B40();
  sub_21F1C26C0();
  uint64_t v57 = (char *)a1[3];
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  uint64_t v56 = (char *)a1[4];
  sub_21F1C3130();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4440);
  uint64_t v62 = a1;
  uint64_t v55 = (char *)a1[5];
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  uint64_t v54 = (char *)a1[9];
  uint64_t v91 = v54;
  uint64_t v92 = MEMORY[0x263F19100];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v4 = MEMORY[0x263F18C10];
  uint64_t v89 = WitnessTable;
  uint64_t v90 = MEMORY[0x263F18C10];
  uint64_t v87 = swift_getWitnessTable();
  uint64_t v88 = v4;
  uint64_t v85 = swift_getWitnessTable();
  uint64_t v86 = v4;
  swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  uint64_t v5 = sub_21F1C2F00();
  uint64_t v6 = swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4448);
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4100);
  sub_21F1C26C0();
  uint64_t v83 = v5;
  uint64_t v84 = v6;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v82 = sub_21F1BFEBC((unint64_t *)&qword_267EC3E08, MEMORY[0x263F1A470]);
  uint64_t v79 = swift_getWitnessTable();
  uint64_t v80 = MEMORY[0x263F19100];
  uint64_t v77 = swift_getWitnessTable();
  uint64_t v78 = sub_21F192EE4(&qword_267EC4450, &qword_267EC4448);
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v76 = sub_21F192EE4(&qword_267EC4168, &qword_267EC4100);
  uint64_t v64 = swift_getWitnessTable();
  uint64_t v63 = sub_21F1C2EC0();
  uint64_t v7 = sub_21F1C2A60();
  uint64_t v50 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v49 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v48 = (char *)&v48 - v10;
  sub_21F1C2F60();
  swift_getTupleTypeMetadata2();
  uint64_t v11 = sub_21F1C2FB0();
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v52 = v11;
  uint64_t v51 = v12;
  uint64_t v13 = sub_21F1C2F00();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v53 = (char *)&v48 - v19;
  uint64_t v20 = (uint64_t)v62;
  uint64_t v21 = *(v62 - 1);
  MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_21F1C2A60();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v59 = (char *)&v48 - v24;
  uint64_t v25 = (char *)v65;
  LOBYTE(v5) = sub_21F1B2744(v20);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v23, v25, v20);
  if (v5)
  {
    uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }
  else
  {
    char v27 = sub_21F1B27A4(v20);
    uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    if ((v27 & 1) == 0)
    {
      uint64_t v36 = v49;
      sub_21F1B2D60((void *)v20, v49);
      uint64_t v37 = swift_getWitnessTable();
      uint64_t v34 = v64;
      uint64_t v73 = v37;
      uint64_t v74 = v64;
      uint64_t v65 = swift_getWitnessTable();
      uint64_t v38 = v50;
      uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
      uint64_t v40 = v48;
      v39(v48, v36, v7);
      uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
      v41(v36, v7);
      v39((char *)v36, (uint64_t)v40, v7);
      swift_getWitnessTable();
      uint64_t v42 = v59;
      sub_21F1AEC88(v36, v13, v7);
      v41(v36, v7);
      v41((uint64_t)v40, v7);
      uint64_t v35 = v42;
      goto LABEL_6;
    }
  }
  MEMORY[0x270FA5388](v26);
  unint64_t v28 = v57;
  *(&v48 - 10) = v58;
  *(&v48 - 9) = v28;
  uint64_t v29 = v55;
  *(&v48 - 8) = v56;
  *(&v48 - 7) = v29;
  *((_OWORD *)&v48 - 3) = *(_OWORD *)(v20 + 48);
  uint64_t v30 = v54;
  *(&v48 - 4) = *(char **)(v20 + 64);
  *(&v48 - 3) = v30;
  *(&v48 - 2) = v25;
  sub_21F1C2940();
  sub_21F1C2EF0();
  swift_getWitnessTable();
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v32 = v53;
  v31(v53, v17, v13);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v14 + 8);
  v33(v17, v13);
  v31(v17, v32, v13);
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v34 = v64;
  uint64_t v68 = v64;
  swift_getWitnessTable();
  uint64_t v35 = v59;
  sub_21F1AEB3C((uint64_t)v17, v13);
  v33(v17, v13);
  v33(v32, v13);
LABEL_6:
  uint64_t v43 = swift_getWitnessTable();
  uint64_t v71 = swift_getWitnessTable();
  uint64_t v72 = v34;
  uint64_t v44 = swift_getWitnessTable();
  uint64_t v69 = v43;
  uint64_t v70 = v44;
  uint64_t v45 = v61;
  swift_getWitnessTable();
  uint64_t v46 = v60;
  (*(void (**)(uint64_t, char *, uint64_t))(v60 + 16))(v66, v35, v45);
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v35, v45);
}

uint64_t sub_21F1B86C0@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v51 = a8;
  uint64_t v50 = a7;
  uint64_t v49 = a6;
  uint64_t v45 = a5;
  uint64_t v46 = a4;
  uint64_t v47 = a3;
  uint64_t v48 = a2;
  uint64_t v52 = a1;
  uint64_t v56 = a9;
  uint64_t v44 = a10;
  uint64_t v55 = sub_21F1C2F60();
  uint64_t v54 = *(void *)(v55 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v55);
  uint64_t v57 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v53 = (char *)&v43 - v12;
  sub_21F1C26C0();
  sub_21F1C2B40();
  sub_21F1C26C0();
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  sub_21F1C2EE0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4440);
  sub_21F1C26C0();
  sub_21F1C26C0();
  sub_21F1C26C0();
  uint64_t v13 = sub_21F1C26C0();
  uint64_t v83 = a10;
  uint64_t v84 = MEMORY[0x263F19100];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = MEMORY[0x263F18C10];
  uint64_t v81 = WitnessTable;
  uint64_t v82 = MEMORY[0x263F18C10];
  uint64_t v79 = swift_getWitnessTable();
  uint64_t v80 = v15;
  uint64_t v77 = swift_getWitnessTable();
  uint64_t v78 = v15;
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v61 = (char *)v13;
  uint64_t v62 = v16;
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  sub_21F1C3130();
  swift_getTupleTypeMetadata2();
  sub_21F1C2FB0();
  swift_getWitnessTable();
  uint64_t v17 = sub_21F1C2F00();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v61 = (char *)v17;
  uint64_t v62 = v18;
  swift_getOpaqueTypeMetadata2();
  sub_21F1C26C0();
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4448);
  sub_21F1C26C0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4100);
  sub_21F1C26C0();
  uint64_t v61 = (char *)v17;
  uint64_t v62 = v18;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = sub_21F1BFEBC((unint64_t *)&qword_267EC3E08, MEMORY[0x263F1A470]);
  uint64_t v75 = OpaqueTypeConformance2;
  uint64_t v76 = v20;
  uint64_t v73 = swift_getWitnessTable();
  uint64_t v74 = MEMORY[0x263F19100];
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v22 = sub_21F192EE4(&qword_267EC4450, &qword_267EC4448);
  uint64_t v71 = v21;
  uint64_t v72 = v22;
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v24 = sub_21F192EE4(&qword_267EC4168, &qword_267EC4100);
  uint64_t v69 = v23;
  uint64_t v70 = v24;
  uint64_t v25 = swift_getWitnessTable();
  sub_21F1C2EC0();
  uint64_t v26 = sub_21F1C2A60();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v43 - v31;
  uint64_t v61 = v48;
  uint64_t v62 = v47;
  uint64_t v63 = v46;
  uint64_t v64 = v45;
  uint64_t v65 = v49;
  uint64_t v66 = v50;
  uint64_t v67 = v51;
  uint64_t v68 = v44;
  uint64_t v33 = (void *)type metadata accessor for PaymentItem();
  sub_21F1B2D60(v33, (uint64_t)v30);
  v60[2] = swift_getWitnessTable();
  v60[3] = v25;
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v35(v32, v30, v26);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v27 + 8);
  v36(v30, v26);
  uint64_t v37 = v53;
  sub_21F1C2F50();
  v35(v30, v32, v26);
  uint64_t v61 = v30;
  uint64_t v38 = v54;
  uint64_t v39 = v57;
  uint64_t v40 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v57, v37, v55);
  uint64_t v62 = (uint64_t)v39;
  v60[0] = v26;
  v60[1] = v40;
  uint64_t v58 = v34;
  uint64_t v59 = sub_21F1BFEBC((unint64_t *)&qword_267EC4188, MEMORY[0x263F1B7B8]);
  sub_21F193734((uint64_t)&v61, 2uLL, (uint64_t)v60);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v38 + 8);
  v41(v37, v40);
  v36(v32, v26);
  v41(v57, v40);
  return ((uint64_t (*)(char *, uint64_t))v36)(v30, v26);
}

uint64_t sub_21F1B8FD8()
{
  return sub_21F1BFE7C((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_21F1B86C0);
}

BOOL static PaymentItemContentStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PaymentItemContentStyle.hash(into:)()
{
  return sub_21F1C3290();
}

uint64_t PaymentItemContentStyle.hashValue.getter()
{
  return sub_21F1C32A0();
}

uint64_t PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t (*a2)(uint64_t)@<X2>, void (*a3)(uint64_t)@<X4>, char *a4@<X6>, uint64_t a5@<X7>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  char v14 = *a4;
  char v13 = 0;
  *(void *)&long long v12 = a8;
  *((void *)&v12 + 1) = MEMORY[0x263F1BA08];
  *(void *)&long long v11 = a5;
  *((void *)&v11 + 1) = a7;
  return PaymentItem.init(icon:primaryLabel:secondaryLabel:chevronStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)(a1, a2, a3, &v14, (uint64_t (*)(uint64_t))sub_21F1BFF64, a6, 0, &v13, 0, 0, 0, v11, v12, a9, a10, MEMORY[0x263F1BA00]);
}

uint64_t PaymentItem<>.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, long long a12, uint64_t a13)
{
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v25 = a4;
  long long v24 = a12;
  uint64_t v19 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F1ABA9C(a7, (uint64_t)v21, type metadata accessor for AccessoryViewStyle);
  unsigned __int8 v28 = 0;
  *(void *)&long long v23 = a8;
  *((void *)&v23 + 1) = a10;
  PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)(a1, a2, a3, v25, v26, v27, (uint64_t)v21, (void (*)(uint64_t))sub_21F1BFF64, a9, 0, &v28, 0, 0, 0, v23, a11, MEMORY[0x263F1BA08], v24, a13,
    MEMORY[0x263F1BA00]);
  return sub_21F1BFF04(a7, type metadata accessor for AccessoryViewStyle);
}

uint64_t PaymentItem<>.init(icon:primaryLabel:chevronStyle:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t (*a2)(uint64_t)@<X2>, char *a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8)
{
  char v13 = *a3;
  char v12 = 0;
  *(void *)&long long v11 = a6;
  *((void *)&v11 + 1) = a8;
  *(void *)&long long v10 = MEMORY[0x263F1BA08];
  *((void *)&v10 + 1) = MEMORY[0x263F1BA08];
  *(void *)&long long v9 = a4;
  *((void *)&v9 + 1) = a5;
  return PaymentItem.init(icon:primaryLabel:secondaryLabel:chevronStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)(a1, a2, (void (*)(uint64_t))sub_21F1BFF64, &v13, (uint64_t (*)(uint64_t))sub_21F1B92F4, a7, 0, &v12, 0, 0, 0, v9, v10, v11, MEMORY[0x263F1BA00], MEMORY[0x263F1BA00]);
}

void sub_21F1B92F4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t PaymentItem<>.init(icon:primaryLabel:accessoryStyle:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v24 = a4;
  uint64_t v18 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F1ABA9C(a5, (uint64_t)v20, type metadata accessor for AccessoryViewStyle);
  unsigned __int8 v25 = 0;
  *(void *)&long long v23 = a8;
  *((void *)&v23 + 1) = a10;
  *(void *)&long long v22 = a6;
  *((void *)&v22 + 1) = a7;
  PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)(a1, a2, a3, v24, (void (*)(uint64_t))sub_21F1BFF64, 0, (uint64_t)v20, (void (*)(uint64_t))sub_21F1BFF64, a9, 0, &v25, 0, 0, 0, v22, MEMORY[0x263F1BA08], MEMORY[0x263F1BA08], v23, MEMORY[0x263F1BA00],
    MEMORY[0x263F1BA00]);
  return sub_21F1BFF04(a5, type metadata accessor for AccessoryViewStyle);
}

void sub_21F1B9470(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t PaymentItem<>.init(icon:primaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(uint64_t)@<X5>, uint64_t a7@<X6>, unsigned char *a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, long long a11, long long a12, uint64_t a13, uint64_t a14)
{
  uint64_t v24 = a7;
  uint64_t v25 = a2;
  uint64_t v27 = a4;
  unsigned __int8 v28 = a6;
  uint64_t v26 = a3;
  long long v23 = a12;
  uint64_t v18 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a8) = *a8;
  sub_21F1ABA9C(a5, (uint64_t)v20, type metadata accessor for AccessoryViewStyle);
  unsigned __int8 v29 = a8;
  *((void *)&v22 + 1) = a13;
  *(void *)&long long v22 = *((void *)&v23 + 1);
  PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)(a1, v25, v26, v27, (void (*)(uint64_t))sub_21F1BFF64, 0, (uint64_t)v20, v28, a9, v24, &v29, a10, 0, 0, a11, MEMORY[0x263F1BA08], v23, v22, MEMORY[0x263F1BA00],
    a14);
  return sub_21F1BFF04(a5, type metadata accessor for AccessoryViewStyle);
}

uint64_t sub_21F1B95EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v121 = a1;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4530) - 8;
  uint64_t v1 = MEMORY[0x270FA5388](v118);
  uint64_t v117 = (char *)&v114 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v119 = (uint64_t)&v114 - v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v120 = (uint64_t)&v114 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4538);
  uint64_t v7 = (int *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  long long v10 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v126 = (uint64_t)&v114 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v127 = (uint64_t)&v114 - v13;
  uint64_t v14 = type metadata accessor for AccessoryViewStyle(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v114 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4540);
  uint64_t v21 = (int *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v114 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v114 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v131 = (uint64_t)&v114 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v132 = (uint64_t)&v114 - v30;
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  uint64_t v31 = *(void *)(v124 - 8);
  uint64_t v129 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v130 = v31 + 56;
  v129(v19, 1, 6, v124);
  uint64_t v123 = type metadata accessor for AccessoryViewStyle;
  sub_21F1ABA9C((uint64_t)v19, (uint64_t)v17, type metadata accessor for AccessoryViewStyle);
  uint64_t v32 = &v27[v21[30]];
  uint64_t v136 = 0;
  sub_21F1C2E70();
  uint64_t v33 = v134;
  *(void *)uint64_t v32 = v133;
  *((void *)v32 + 1) = v33;
  uint64_t v34 = &v27[v21[31]];
  *(void *)uint64_t v34 = swift_getKeyPath();
  v34[8] = 0;
  uint64_t v35 = &v27[v21[32]];
  *(void *)uint64_t v35 = swift_getKeyPath();
  v35[8] = 0;
  uint64_t v36 = (uint64_t *)&v27[v21[33]];
  uint64_t *v36 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4438);
  swift_storeEnumTagMultiPayload();
  *(void *)&v27[v21[34]] = 0x4052800000000000;
  *(void *)&v27[v21[35]] = 0x402C000000000000;
  *(void *)&v27[v21[36]] = 0x4044000000000000;
  uint64_t v37 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  ItemImageView.init(symbol:foregroundColor:)(0xD000000000000010, 0x800000021F1CABE0, v37, &v133);
  uint64_t v38 = v135;
  long long v39 = v134;
  *(void *)uint64_t v27 = v133;
  *(_OWORD *)(v27 + 8) = v39;
  *((void *)v27 + 3) = v38;
  uint64_t v40 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0x6F742070696853, 0xE700000000000000, 0xD000000000000030, 0x800000021F1CACC0, v40, (uint64_t)(v27 + 32));
  v27[144] = 1;
  uint64_t v41 = (uint64_t)&v27[v21[25]];
  uint64_t v114 = v17;
  sub_21F1AA108((uint64_t)v17, v41);
  v27[v21[26]] = 1;
  v27[v21[27]] = 0;
  v27[v21[28]] = 0;
  uint64_t v42 = &v27[v21[29]];
  *(void *)uint64_t v42 = 0;
  *((void *)v42 + 1) = 0;
  uint64_t v43 = v131;
  sub_21F1BFD3C((uint64_t)v27, v131, &qword_267EC4540);
  uint64_t v122 = type metadata accessor for AccessoryViewStyle;
  sub_21F1BFF04((uint64_t)v19, type metadata accessor for AccessoryViewStyle);
  sub_21F1BFD3C(v43, v132, &qword_267EC4540);
  uint64_t v128 = v19;
  uint64_t v44 = v124;
  v129(v19, 1, 6, v124);
  uint64_t v45 = (uint64_t)v17;
  uint64_t v46 = v123;
  sub_21F1ABA9C((uint64_t)v19, v45, v123);
  uint64_t v47 = &v24[v21[30]];
  uint64_t v136 = 0;
  sub_21F1C2E70();
  uint64_t v48 = v134;
  *(void *)uint64_t v47 = v133;
  *((void *)v47 + 1) = v48;
  uint64_t v49 = &v24[v21[31]];
  *(void *)uint64_t v49 = swift_getKeyPath();
  v49[8] = 0;
  uint64_t v50 = &v24[v21[32]];
  *(void *)uint64_t v50 = swift_getKeyPath();
  v50[8] = 0;
  uint64_t v51 = (uint64_t *)&v24[v21[33]];
  *uint64_t v51 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *(void *)&v24[v21[34]] = 0x4052800000000000;
  *(void *)&v24[v21[35]] = 0x402C000000000000;
  *(void *)&v24[v21[36]] = 0x4044000000000000;
  uint64_t v52 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  ItemImageView.init(symbol:foregroundColor:)(0x662E6E6F73726570, 0xEB000000006C6C69, v52, &v133);
  uint64_t v53 = v135;
  long long v54 = v134;
  *(void *)uint64_t v24 = v133;
  *(_OWORD *)(v24 + 8) = v54;
  *((void *)v24 + 3) = v53;
  uint64_t v55 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0x746361746E6F43, 0xE700000000000000, 0xD000000000000016, 0x800000021F1CAD00, v55, (uint64_t)(v24 + 32));
  v24[144] = 1;
  uint64_t v56 = (uint64_t)v114;
  sub_21F1AA108((uint64_t)v114, (uint64_t)&v24[v21[25]]);
  uint64_t v57 = v21[26];
  uint64_t v125 = v24;
  v24[v57] = 1;
  v24[v21[27]] = 0;
  v24[v21[28]] = 0;
  uint64_t v58 = &v24[v21[29]];
  *(void *)uint64_t v58 = 0;
  *((void *)v58 + 1) = 0;
  sub_21F1BFD3C((uint64_t)v24, (uint64_t)v27, &qword_267EC4540);
  uint64_t v59 = (uint64_t)v128;
  uint64_t v60 = v122;
  sub_21F1BFF04((uint64_t)v128, v122);
  sub_21F1BFD3C((uint64_t)v27, v131, &qword_267EC4540);
  v129((char *)v59, 1, 6, v44);
  sub_21F1ABA9C(v59, v56, v46);
  uint64_t v61 = &v10[v7[30]];
  uint64_t v136 = 0;
  sub_21F1C2E70();
  uint64_t v62 = v134;
  *(void *)uint64_t v61 = v133;
  *((void *)v61 + 1) = v62;
  uint64_t v63 = &v10[v7[31]];
  *(void *)uint64_t v63 = swift_getKeyPath();
  v63[8] = 0;
  uint64_t v64 = &v10[v7[32]];
  *(void *)uint64_t v64 = swift_getKeyPath();
  v64[8] = 0;
  uint64_t v65 = (uint64_t *)&v10[v7[33]];
  *uint64_t v65 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *(void *)&v10[v7[34]] = 0x4052800000000000;
  *(void *)&v10[v7[35]] = 0x402C000000000000;
  *(void *)&v10[v7[36]] = 0x4044000000000000;
  uint64_t v66 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  uint64_t v116 = 0xD000000000000012;
  ItemImageView.init(symbol:foregroundColor:)(0xD000000000000012, 0x800000021F1CAC00, v66, &v133);
  uint64_t v67 = v135;
  long long v68 = v134;
  *(void *)long long v10 = v133;
  *(_OWORD *)(v10 + 8) = v68;
  *((void *)v10 + 3) = v67;
  uint64_t v69 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  uint64_t v115 = 0x800000021F1CAD20;
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0xD000000000000011, 0x800000021F1CAD20, 0x78696C6674654ELL, 0xE700000000000000, v69, (uint64_t)(v10 + 32));
  v10[144] = 1;
  sub_21F1AA108(v56, (uint64_t)&v10[v7[25]]);
  uint64_t v70 = &v10[v7[26]];
  *(void *)uint64_t v70 = 0xD00000000000001BLL;
  *((void *)v70 + 1) = 0x800000021F1CAD40;
  uint64_t v71 = MEMORY[0x263F8EE78];
  *((void *)v70 + 2) = 0;
  *((void *)v70 + 3) = v71;
  v10[v7[27]] = 0;
  v10[v7[28]] = 0;
  uint64_t v72 = &v10[v7[29]];
  *(void *)uint64_t v72 = 0;
  *((void *)v72 + 1) = 0;
  uint64_t v73 = v126;
  sub_21F1BFD3C((uint64_t)v10, v126, &qword_267EC4538);
  uint64_t v74 = (uint64_t)v128;
  sub_21F1BFF04((uint64_t)v128, v60);
  sub_21F1BFD3C(v73, v127, &qword_267EC4538);
  v129((char *)v74, 1, 6, v124);
  uint64_t v75 = v56;
  uint64_t v76 = v123;
  sub_21F1ABA9C(v74, v56, v123);
  uint64_t v77 = (int *)v118;
  uint64_t v78 = v117;
  uint64_t v79 = &v117[*(int *)(v118 + 120)];
  uint64_t v136 = 0;
  sub_21F1C2E70();
  uint64_t v80 = v134;
  *(void *)uint64_t v79 = v133;
  *((void *)v79 + 1) = v80;
  uint64_t v81 = &v78[v77[31]];
  *(void *)uint64_t v81 = swift_getKeyPath();
  v81[8] = 0;
  uint64_t v82 = &v78[v77[32]];
  *(void *)uint64_t v82 = swift_getKeyPath();
  v82[8] = 0;
  uint64_t v83 = (uint64_t *)&v78[v77[33]];
  *uint64_t v83 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v84 = v77;
  uint64_t v85 = (uint64_t)v78;
  *(void *)&v78[v77[34]] = 0x4052800000000000;
  *(void *)&v78[v77[35]] = 0x402C000000000000;
  *(void *)&v78[v77[36]] = 0x4044000000000000;
  uint64_t v86 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  ItemImageView.init(symbol:foregroundColor:)(v116, 0x800000021F1CAC00, v86, &v133);
  uint64_t v87 = v135;
  long long v88 = v134;
  *(void *)uint64_t v78 = v133;
  *(_OWORD *)(v78 + 8) = v88;
  *((void *)v78 + 3) = v87;
  uint64_t v89 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0xD000000000000011, v115, 0x78696C6674654ELL, 0xE700000000000000, v89, (uint64_t)(v78 + 32));
  v78[144] = 1;
  sub_21F1ABA9C(v75, (uint64_t)&v78[v77[25]], v76);
  sub_21F1C2BD0();
  uint64_t v90 = sub_21F1C2C80();
  uint64_t v129 = v91;
  uint64_t v130 = v90;
  LOBYTE(v76) = v92;
  uint64_t v94 = v93;
  swift_release();
  uint64_t v95 = v76 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v97 = *sub_21F18BED8();
  uint64_t v98 = swift_getKeyPath();
  uint64_t v99 = swift_getKeyPath();
  swift_retain();
  uint64_t v100 = v75;
  uint64_t v101 = v122;
  sub_21F1BFF04(v100, v122);
  uint64_t v102 = v85 + v84[26];
  uint64_t v103 = v129;
  *(void *)uint64_t v102 = v130;
  *(void *)(v102 + 8) = v103;
  *(void *)(v102 + 16) = v95;
  *(void *)(v102 + 24) = v94;
  *(void *)(v102 + 32) = KeyPath;
  *(void *)(v102 + 40) = 0;
  *(void *)(v102 + 48) = v98;
  *(void *)(v102 + 56) = v97;
  *(void *)(v102 + 64) = v99;
  *(void *)(v102 + 72) = 4;
  *(unsigned char *)(v102 + 80) = 0;
  *(unsigned char *)(v85 + v84[27]) = 1;
  *(unsigned char *)(v85 + v84[28]) = 0;
  uint64_t v104 = (void *)(v85 + v84[29]);
  void *v104 = 0;
  v104[1] = 0;
  uint64_t v105 = v119;
  sub_21F1BFD3C(v85, v119, &qword_267EC4530);
  sub_21F1BFF04((uint64_t)v128, v101);
  uint64_t v106 = v120;
  sub_21F1BFD3C(v105, v120, &qword_267EC4530);
  sub_21F196550(v132, (uint64_t)v27, &qword_267EC4540);
  uint64_t v107 = v131;
  uint64_t v108 = (uint64_t)v125;
  sub_21F196550(v131, (uint64_t)v125, &qword_267EC4540);
  uint64_t v110 = v126;
  uint64_t v109 = v127;
  sub_21F196550(v127, v126, &qword_267EC4538);
  sub_21F196550(v106, v105, &qword_267EC4530);
  uint64_t v111 = v121;
  sub_21F196550((uint64_t)v27, v121, &qword_267EC4540);
  uint64_t v112 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267EC4548);
  sub_21F196550(v108, v111 + v112[12], &qword_267EC4540);
  sub_21F196550(v110, v111 + v112[16], &qword_267EC4538);
  sub_21F196550(v105, v111 + v112[20], &qword_267EC4530);
  sub_21F196760(v106, &qword_267EC4530);
  sub_21F196760(v109, &qword_267EC4538);
  sub_21F196760(v107, &qword_267EC4540);
  sub_21F196760(v132, &qword_267EC4540);
  sub_21F196760(v105, &qword_267EC4530);
  sub_21F196760(v110, &qword_267EC4538);
  sub_21F196760((uint64_t)v125, &qword_267EC4540);
  return sub_21F196760((uint64_t)v27, &qword_267EC4540);
}

uint64_t sub_21F1BA2CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4478);
  uint64_t v1 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4480);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4488);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4490) - 8;
  MEMORY[0x270FA5388](v29);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F1C2B60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4498);
  sub_21F192EE4(&qword_267EC44A0, &qword_267EC4498);
  sub_21F1C25D0();
  char v14 = sub_21F1C2B80();
  uint64_t v15 = v28;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v7, v3, v28);
  uint64_t v16 = &v7[*(int *)(v5 + 44)];
  *uint64_t v16 = v14;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  v16[40] = 1;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v15);
  sub_21F1C2F90();
  sub_21F1C2740();
  sub_21F196550((uint64_t)v7, (uint64_t)v11, &qword_267EC4480);
  uint64_t v17 = &v11[*(int *)(v9 + 44)];
  long long v18 = v36;
  *((_OWORD *)v17 + 4) = v35;
  *((_OWORD *)v17 + 5) = v18;
  *((_OWORD *)v17 + 6) = v37;
  long long v19 = v32;
  *(_OWORD *)uint64_t v17 = v31;
  *((_OWORD *)v17 + 1) = v19;
  long long v20 = v34;
  *((_OWORD *)v17 + 2) = v33;
  *((_OWORD *)v17 + 3) = v20;
  sub_21F196760((uint64_t)v7, &qword_267EC4480);
  uint64_t v21 = *sub_21F18BB3C();
  swift_retain();
  LOBYTE(v3) = sub_21F1C2B80();
  sub_21F196550((uint64_t)v11, (uint64_t)v13, &qword_267EC4488);
  uint64_t v22 = &v13[*(int *)(v29 + 44)];
  *(void *)uint64_t v22 = v21;
  v22[8] = (char)v3;
  sub_21F196760((uint64_t)v11, &qword_267EC4488);
  uint64_t v23 = sub_21F1C2700();
  LOBYTE(v3) = sub_21F1C2B80();
  uint64_t v24 = v30;
  sub_21F196550((uint64_t)v13, v30, &qword_267EC4490);
  uint64_t v25 = v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EC44A8) + 36);
  *(void *)uint64_t v25 = v23;
  *(unsigned char *)(v25 + 8) = (_BYTE)v3;
  return sub_21F196760((uint64_t)v13, &qword_267EC4490);
}

uint64_t sub_21F1BA684@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_21F1C2940();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4500);
  return sub_21F1BA6CC(a1 + *(int *)(v2 + 44));
}

uint64_t sub_21F1BA6CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v1 = sub_21F1C2930();
  uint64_t v48 = *(void *)(v1 - 8);
  uint64_t v49 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v47 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4508) - 8;
  uint64_t v3 = MEMORY[0x270FA5388](v46);
  uint64_t v44 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v50 = (uint64_t)&v42 - v5;
  uint64_t v6 = sub_21F1C26A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4510);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v45 = (uint64_t)&v42 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC44C8);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  long long v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v42 - v20;
  *(void *)uint64_t v21 = sub_21F1C2940();
  *((void *)v21 + 1) = 0;
  v21[16] = 1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4470);
  sub_21F1B95EC((uint64_t)&v21[*(int *)(v22 + 44)]);
  *(void *)long long v19 = sub_21F1C2940();
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  sub_21F1B95EC((uint64_t)&v19[*(int *)(v22 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F18DD0], v6);
  uint64_t v24 = (uint64_t *)&v14[*(int *)(v11 + 44)];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4518);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v24 + *(int *)(v25 + 28), v9, v6);
  uint64_t *v24 = KeyPath;
  uint64_t v43 = v14;
  sub_21F196550((uint64_t)v19, (uint64_t)v14, &qword_267EC44C8);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_21F196760((uint64_t)v19, &qword_267EC44C8);
  uint64_t v26 = (uint64_t)v14;
  uint64_t v27 = v45;
  sub_21F1BFD3C(v26, v45, &qword_267EC4510);
  *(void *)long long v19 = sub_21F1C2940();
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  sub_21F1B95EC((uint64_t)&v19[*(int *)(v22 + 44)]);
  uint64_t v28 = swift_getKeyPath();
  uint64_t v30 = v47;
  uint64_t v29 = v48;
  uint64_t v31 = v49;
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v47, *MEMORY[0x263F199A0], v49);
  uint64_t v32 = (uint64_t)v44;
  long long v33 = (uint64_t *)&v44[*(int *)(v46 + 44)];
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4520);
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))((char *)v33 + *(int *)(v34 + 28), v30, v31);
  *long long v33 = v28;
  sub_21F196550((uint64_t)v19, v32, &qword_267EC44C8);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  sub_21F196760((uint64_t)v19, &qword_267EC44C8);
  uint64_t v35 = v50;
  sub_21F1BFD3C(v32, v50, &qword_267EC4508);
  sub_21F196550((uint64_t)v21, (uint64_t)v19, &qword_267EC44C8);
  uint64_t v36 = v27;
  uint64_t v37 = v27;
  uint64_t v38 = (uint64_t)v43;
  sub_21F196550(v37, (uint64_t)v43, &qword_267EC4510);
  sub_21F196550(v35, v32, &qword_267EC4508);
  uint64_t v39 = v51;
  sub_21F196550((uint64_t)v19, v51, &qword_267EC44C8);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4528);
  sub_21F196550(v38, v39 + *(int *)(v40 + 48), &qword_267EC4510);
  sub_21F196550(v32, v39 + *(int *)(v40 + 64), &qword_267EC4508);
  sub_21F196760(v35, &qword_267EC4508);
  sub_21F196760(v36, &qword_267EC4510);
  sub_21F196760((uint64_t)v21, &qword_267EC44C8);
  sub_21F196760(v32, &qword_267EC4508);
  sub_21F196760(v38, &qword_267EC4510);
  return sub_21F196760((uint64_t)v19, &qword_267EC44C8);
}

uint64_t sub_21F1BAC40()
{
  return sub_21F1C27D0();
}

uint64_t sub_21F1BAC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F1BACE0(a1, a2, a3, a4, MEMORY[0x263F18DD8], MEMORY[0x263F19340]);
}

uint64_t sub_21F1BAC90()
{
  return sub_21F1C2790();
}

uint64_t sub_21F1BACB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F1BACE0(a1, a2, a3, a4, MEMORY[0x263F19A00], MEMORY[0x263F192B8]);
}

uint64_t sub_21F1BACE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(char *))
{
  uint64_t v8 = a5(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_21F1BADB0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21F1BAE00()
{
  unint64_t result = qword_267EC44B0;
  if (!qword_267EC44B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC44B0);
  }
  return result;
}

unint64_t sub_21F1BAE58()
{
  unint64_t result = qword_267EC44B8;
  if (!qword_267EC44B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC44B8);
  }
  return result;
}

uint64_t sub_21F1BAEAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F1BAECC(uint64_t a1)
{
  unint64_t v2 = sub_21F1BF1C0();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_21F1BAF18(uint64_t a1)
{
  unint64_t v2 = sub_21F1BF1C0();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t sub_21F1BAF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 128);
}

void sub_21F1BAF6C()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
    {
      sub_21F1C3130();
      if (v2 <= 0x3F)
      {
        type metadata accessor for AccessoryViewStyle(319);
        if (v3 <= 0x3F)
        {
          sub_21F1C3130();
          if (v4 <= 0x3F)
          {
            sub_21F1BE770();
            if (v5 <= 0x3F) {
              swift_initStructMetadata();
            }
          }
        }
      }
    }
  }
}

uint64_t *sub_21F1BB170(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v82 = a3[2];
  uint64_t v4 = *(void *)(v82 - 8);
  uint64_t v90 = *(void *)(v4 + 64);
  uint64_t v83 = a3[3];
  uint64_t v81 = *(void *)(v83 - 8);
  int v5 = *(_DWORD *)(v81 + 80);
  uint64_t v6 = v5;
  uint64_t v93 = *(void *)(v81 + 64);
  uint64_t v84 = a3[4];
  uint64_t v7 = *(void *)(v84 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = v8;
  size_t v10 = *(void *)(v7 + 64);
  if (!*(_DWORD *)(v7 + 84)) {
    ++v10;
  }
  size_t v94 = v10;
  uint64_t v11 = sub_21F1C2C50();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(_DWORD *)(v12 + 80);
  uint64_t v79 = v12;
  uint64_t v80 = v11;
  int v85 = *(_DWORD *)(v12 + 84);
  uint64_t v14 = v13;
  uint64_t v87 = a3[5];
  size_t __n = *(void *)(v12 + 64);
  uint64_t v15 = *(void *)(v87 - 8);
  int v16 = *(_DWORD *)(v15 + 80);
  uint64_t v86 = v15;
  size_t v17 = *(void *)(v15 + 64);
  if (!*(_DWORD *)(v15 + 84)) {
    ++v17;
  }
  size_t v95 = v17;
  uint64_t v18 = sub_21F1C25E0();
  int v19 = *(_DWORD *)(*(void *)(v18 - 8) + 80);
  uint64_t v20 = v19 & 0xF8;
  if (*(void *)(*(void *)(v18 - 8) + 64) <= 8uLL) {
    uint64_t v21 = 8;
  }
  else {
    uint64_t v21 = *(void *)(*(void *)(v18 - 8) + 64);
  }
  uint64_t v97 = v16;
  unsigned int v22 = v5 | *(_DWORD *)(v4 + 80) & 0xF8 | v20 | v8 | v13 | v16;
  if (v22 <= 7 && ((v8 | v5 | v13 | v16 | v19 | *(_DWORD *)(v4 + 80)) & 0x100000) == 0)
  {
    uint64_t v23 = v90 + v5;
    uint64_t v24 = v14 | 7;
    uint64_t v74 = v14 + 16;
    size_t __na = ((v14 + 16) & ~v14) + __n;
    if (((((((v21
             + 8
             + ((v20
               + 16
               + ((((((((__na
                       + v16
                       + (((v14 | 7)
                         + v94
                         + ((v93 + v8 + ((v90 + v6) & ~v6)) & ~(unint64_t)v8)) & ~(v14 | 7))) & ~(unint64_t)v16)
                     + v95
                     + 9) & 0xFFFFFFFFFFFFFFF8)
                   + 23) & 0xFFFFFFFFFFFFFFF8)
                 + 39) & 0xFFFFFFFFFFFFFFF8)) & ~v20 & 0xFFFFFFFFFFFFFFF8)) & 0xFFFFFFFFFFFFFFF8)
           + 15) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 8 <= 0x18)
    {
      uint64_t v75 = v20 + 16;
      unint64_t v76 = ~v20 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v77 = v21 + 8;
      uint64_t v78 = *(void *)(v18 - 8);
      uint64_t v91 = v21;
      uint64_t v72 = v18;
      uint64_t v73 = ~v24;
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 + 16))(a1, a2, v82);
      unint64_t v25 = ((unint64_t)a1 + v23) & ~v6;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v81 + 16))(v25, ((unint64_t)a2 + v23) & ~v6, v83);
      uint64_t v26 = (void *)((v25 + v93 + v9) & ~v9);
      uint64_t v27 = (char *)(((((unint64_t)a2 + v23) & ~v6) + v93 + v9) & ~v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v27, 1, v84))
      {
        size_t v28 = v94;
        memcpy(v26, v27, v94);
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(v7 + 16))(v26, v27, v84);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v84);
        size_t v28 = v94;
      }
      uint64_t v31 = ~v14;
      uint64_t v32 = (void *)(((unint64_t)v26 + v28 + v24) & v73);
      unint64_t v33 = (unint64_t)&v27[v28 + v24];
      uint64_t v34 = (void *)(v33 & v73);
      if (v85 < 0)
      {
        int v36 = (*(uint64_t (**)(unint64_t))(v79 + 48))(((unint64_t)v34 + v74) & v31);
      }
      else
      {
        unint64_t v35 = *(void *)((v33 & v73) + 8);
        if (v35 >= 0xFFFFFFFF) {
          LODWORD(v35) = -1;
        }
        int v36 = v35 + 1;
      }
      uint64_t v37 = ~v97;
      if (v36)
      {
        size_t v38 = __na;
        memcpy(v32, v34, __na);
      }
      else
      {
        *uint64_t v32 = *v34;
        v32[1] = v34[1];
        unint64_t v39 = ((unint64_t)v32 + v74) & v31;
        unint64_t v40 = ((unint64_t)v34 + v74) & v31;
        uint64_t v41 = *(void (**)(unint64_t, unint64_t, uint64_t))(v79 + 16);
        swift_bridgeObjectRetain();
        v41(v39, v40, v80);
        size_t v38 = __na;
      }
      uint64_t v42 = (char *)(((unint64_t)v32 + v38 + v97) & v37);
      uint64_t v43 = (const void *)(((unint64_t)v34 + v38 + v97) & v37);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v86 + 48))(v43, 1, v87))
      {
        size_t v44 = v95;
        memcpy(v42, v43, v95);
      }
      else
      {
        (*(void (**)(char *, const void *, uint64_t))(v86 + 16))(v42, v43, v87);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v86 + 56))(v42, 0, 1, v87);
        size_t v44 = v95;
      }
      uint64_t v45 = &v42[v44];
      *uint64_t v45 = *((unsigned char *)v43 + v44);
      v45[1] = *((unsigned char *)v43 + v44 + 1);
      unint64_t v46 = (unint64_t)&v42[v44 + 9] & 0xFFFFFFFFFFFFFFF8;
      unint64_t v47 = ((unint64_t)v43 + v44 + 9) & 0xFFFFFFFFFFFFFFF8;
      if (*(void *)v47 < 0xFFFFFFFFuLL)
      {
        *(_OWORD *)unint64_t v46 = *(_OWORD *)v47;
      }
      else
      {
        uint64_t v48 = *(void *)(v47 + 8);
        *(void *)unint64_t v46 = *(void *)v47;
        *(void *)(v46 + 8) = v48;
        swift_retain();
      }
      uint64_t v49 = (void *)((v46 + 23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v50 = (void *)((v47 + 23) & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v49 = *v50;
      v49[1] = v50[1];
      unint64_t v51 = ((unint64_t)v49 + 23) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v52 = ((unint64_t)v50 + 23) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v53 = *(void *)v52;
      char v54 = *(unsigned char *)(v52 + 8);
      swift_retain();
      sub_21F1980F0(v53, v54);
      *(void *)unint64_t v51 = v53;
      *(unsigned char *)(v51 + 8) = v54;
      unint64_t v55 = ((unint64_t)v49 + 39) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v56 = ((unint64_t)v50 + 39) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v57 = *(void *)v56;
      char v58 = *(unsigned char *)(v56 + 8);
      sub_21F1980F0(*(void *)v56, v58);
      *(void *)unint64_t v55 = v57;
      *(unsigned char *)(v55 + 8) = v58;
      uint64_t v59 = (void *)((v75 + v55) & v76);
      uint64_t v60 = (void *)((v75 + v56) & v76);
      unsigned int v61 = *((unsigned __int8 *)v60 + v91);
      unsigned int v62 = v61 - 2;
      if (v61 < 2)
      {
        uint64_t v64 = v78;
        if (v61 != 1)
        {
LABEL_46:
          *uint64_t v59 = *v60;
          swift_retain();
          char v66 = 0;
          goto LABEL_47;
        }
      }
      else
      {
        if (v91 <= 3) {
          uint64_t v63 = v91;
        }
        else {
          uint64_t v63 = 4;
        }
        uint64_t v64 = v78;
        switch(v63)
        {
          case 1:
            int v65 = *(unsigned __int8 *)v60;
            if (v91 < 4) {
              goto LABEL_41;
            }
            goto LABEL_45;
          case 2:
            int v65 = *(unsigned __int16 *)v60;
            if (v91 >= 4) {
              goto LABEL_45;
            }
            goto LABEL_41;
          case 3:
            int v65 = *(unsigned __int16 *)((v75 + v56) & v76) | (*(unsigned __int8 *)(((v75 + v56) & v76) + 2) << 16);
            if (v91 < 4) {
              goto LABEL_41;
            }
            goto LABEL_45;
          case 4:
            int v65 = *(_DWORD *)v60;
            if (v91 >= 4)
            {
LABEL_45:
              if (v65 == -1) {
                break;
              }
              goto LABEL_46;
            }
LABEL_41:
            unsigned int v61 = (v65 | (v62 << (8 * v91))) + 2;
LABEL_42:
            if (v61 != 1) {
              goto LABEL_46;
            }
            break;
          default:
            goto LABEL_42;
        }
      }
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v64 + 16))((v75 + v55) & v76, (v75 + v56) & v76, v72);
      char v66 = 1;
LABEL_47:
      *((unsigned char *)v59 + v91) = v66;
      uint64_t v67 = (void *)(((unint64_t)v59 + v77) & 0xFFFFFFFFFFFFFFF8);
      long long v68 = (void *)(((unint64_t)v60 + v77) & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v67 = *v68;
      uint64_t v69 = (void *)(((unint64_t)v67 + 15) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v70 = (void *)(((unint64_t)v68 + 15) & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v69 = *v70;
      *(void *)(((unint64_t)v69 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v70 + 15) & 0xFFFFFFFFFFFFFFF8);
      return a1;
    }
  }
  uint64_t v29 = *a2;
  *a1 = *a2;
  uint64_t v30 = v29 + (((v22 | 7) + 16) & ~(unint64_t)(v22 | 7));
  swift_retain();
  return (uint64_t *)v30;
}

uint64_t sub_21F1BB994(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = a2[4];
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10)) {
    (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v12, v10);
  }
  int v13 = *(_DWORD *)(v11 + 84);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v15 = sub_21F1C2C50();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = v16;
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = v18 | 7;
  uint64_t v20 = v14 + v12;
  if (!v13) {
    ++v20;
  }
  uint64_t v21 = v20 + v19;
  uint64_t v22 = v21 & ~v19;
  uint64_t v23 = ~v18;
  uint64_t v24 = v18 + 16;
  uint64_t v25 = (v18 + 16) & ~v18;
  uint64_t v26 = *(void *)(*(void *)(v15 - 8) + 64);
  if ((*(_DWORD *)(v16 + 84) & 0x80000000) != 0)
  {
    uint64_t v28 = v25 + v26;
    if (!(*(unsigned int (**)(uint64_t))(v16 + 48))((v24 + v22) & v23))
    {
LABEL_9:
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))((v24 + v22) & v23, v15);
    }
  }
  else
  {
    unint64_t v27 = *(void *)((v21 & ~v19) + 8);
    if (v27 >= 0xFFFFFFFF) {
      LODWORD(v27) = -1;
    }
    uint64_t v28 = v25 + v26;
    if (v27 == -1) {
      goto LABEL_9;
    }
  }
  uint64_t v29 = a2[5];
  uint64_t v30 = *(void *)(v29 - 8);
  unint64_t v31 = (v28 + v22 + *(unsigned __int8 *)(v30 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v30 + 48))(v31, 1, v29)) {
    (*(void (**)(unint64_t, uint64_t))(v30 + 8))(v31, v29);
  }
  unint64_t v32 = v31 + *(void *)(v30 + 64);
  if (!*(_DWORD *)(v30 + 84)) {
    ++v32;
  }
  unint64_t v33 = (void *)((v32 + 9) & 0xFFFFFFFFFFFFFFF8);
  if (*v33 >= 0xFFFFFFFFuLL) {
    swift_release();
  }
  unint64_t v34 = ((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  sub_21F198130(*(void *)((v34 + 23) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v34 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  unint64_t v35 = (v34 + 39) & 0xFFFFFFFFFFFFFFF8;
  sub_21F198130(*(void *)v35, *(unsigned char *)(v35 + 8));
  uint64_t v36 = *(void *)(sub_21F1C25E0() - 8);
  uint64_t v37 = *(_DWORD *)(v36 + 80) & 0xF8 | 7;
  size_t v38 = (unsigned __int8 *)((v35 + v37 + 9) & ~v37);
  unint64_t v39 = *(void *)(v36 + 64);
  if (v39 <= 8) {
    unint64_t v39 = 8;
  }
  unsigned int v40 = v38[v39];
  unsigned int v41 = v40 - 2;
  if (v40 >= 2)
  {
    if (v39 <= 3) {
      uint64_t v42 = v39;
    }
    else {
      uint64_t v42 = 4;
    }
    switch(v42)
    {
      case 1:
        int v43 = *v38;
        goto LABEL_29;
      case 2:
        int v43 = *(unsigned __int16 *)v38;
        goto LABEL_29;
      case 3:
        int v43 = *(unsigned __int16 *)v38 | (v38[2] << 16);
        goto LABEL_29;
      case 4:
        int v43 = *(_DWORD *)v38;
LABEL_29:
        int v44 = (v43 | (v41 << (8 * v39))) + 2;
        unsigned int v40 = v43 + 2;
        if (v39 < 4) {
          unsigned int v40 = v44;
        }
        break;
      default:
        break;
    }
  }
  if (v40 == 1)
  {
    uint64_t v45 = *(uint64_t (**)(void))(v36 + 8);
    return v45();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_21F1BBE08(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = a3[4];
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (void *)((v17 + v11) & ~v16);
  uint64_t v19 = (char *)((v17 + v12) & ~v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
  {
    int v20 = *(_DWORD *)(v15 + 84);
    uint64_t v21 = *(void *)(v15 + 64);
    if (v20) {
      size_t v22 = *(void *)(v15 + 64);
    }
    else {
      size_t v22 = v21 + 1;
    }
    memcpy(v18, v19, v22);
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v18, v19, v14);
    uint64_t v24 = *(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56);
    uint64_t v23 = v15 + 56;
    v24(v18, 0, 1, v14);
    int v20 = *(_DWORD *)(v23 + 28);
    uint64_t v21 = *(void *)(v23 + 8);
  }
  if (!v20) {
    ++v21;
  }
  uint64_t v25 = sub_21F1C2C50();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned __int8 *)(v26 + 80);
  uint64_t v28 = (v27 | 7) + v21;
  uint64_t v29 = (void *)(((unint64_t)v18 + v28) & ~(v27 | 7));
  unint64_t v30 = (unint64_t)&v19[v28];
  unint64_t v31 = (void *)(v30 & ~(v27 | 7));
  uint64_t v32 = ~v27;
  uint64_t v33 = v27 + 16;
  uint64_t v34 = (v27 + 16) & ~v27;
  uint64_t v35 = *(void *)(v26 + 64);
  if ((*(_DWORD *)(v26 + 84) & 0x80000000) != 0)
  {
    size_t v37 = v34 + v35;
    if ((*(unsigned int (**)(unint64_t))(v26 + 48))(((unint64_t)v31 + v33) & v32))
    {
LABEL_13:
      memcpy(v29, v31, v37);
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v36 = *(void *)((v30 & ~(v27 | 7)) + 8);
    if (v36 >= 0xFFFFFFFF) {
      LODWORD(v36) = -1;
    }
    size_t v37 = v34 + v35;
    if (v36 != -1) {
      goto LABEL_13;
    }
  }
  void *v29 = *v31;
  v29[1] = v31[1];
  size_t v38 = *(void (**)(unint64_t, unint64_t, uint64_t))(v26 + 16);
  swift_bridgeObjectRetain();
  v38(((unint64_t)v29 + v33) & v32, ((unint64_t)v31 + v33) & v32, v25);
LABEL_16:
  uint64_t v39 = a3[5];
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(unsigned __int8 *)(v40 + 80);
  uint64_t v42 = (char *)(((unint64_t)v29 + v37 + v41) & ~v41);
  int v43 = (char *)(((unint64_t)v31 + v37 + v41) & ~v41);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v43, 1, v39))
  {
    int v44 = *(_DWORD *)(v40 + 84);
    size_t v45 = *(void *)(v40 + 64);
    if (v44) {
      size_t v46 = v45;
    }
    else {
      size_t v46 = v45 + 1;
    }
    memcpy(v42, v43, v46);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v42, v43, v39);
    uint64_t v48 = *(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56);
    uint64_t v47 = v40 + 56;
    v48(v42, 0, 1, v39);
    int v44 = *(_DWORD *)(v47 + 28);
    size_t v45 = *(void *)(v47 + 8);
  }
  if (v44) {
    size_t v49 = v45;
  }
  else {
    size_t v49 = v45 + 1;
  }
  uint64_t v50 = &v42[v49];
  unint64_t v51 = &v43[v49];
  *uint64_t v50 = *v51;
  v50[1] = v51[1];
  unint64_t v52 = (unint64_t)(v50 + 9) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v53 = (unint64_t)(v51 + 9) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v53 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v52 = *(_OWORD *)v53;
  }
  else
  {
    uint64_t v54 = *(void *)(v53 + 8);
    *(void *)unint64_t v52 = *(void *)v53;
    *(void *)(v52 + 8) = v54;
    swift_retain();
  }
  unint64_t v55 = (void *)((v52 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v56 = (void *)((v53 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v55 = *v56;
  v55[1] = v56[1];
  unint64_t v57 = ((unint64_t)v55 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v58 = ((unint64_t)v56 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v59 = *(void *)v58;
  char v60 = *(unsigned char *)(v58 + 8);
  swift_retain();
  sub_21F1980F0(v59, v60);
  *(void *)unint64_t v57 = v59;
  *(unsigned char *)(v57 + 8) = v60;
  unint64_t v61 = ((unint64_t)v55 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v62 = ((unint64_t)v56 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v63 = *(void *)v62;
  char v64 = *(unsigned char *)(v62 + 8);
  sub_21F1980F0(*(void *)v62, v64);
  *(void *)unint64_t v61 = v63;
  *(unsigned char *)(v61 + 8) = v64;
  uint64_t v65 = sub_21F1C25E0();
  uint64_t v66 = *(void *)(v65 - 8);
  uint64_t v67 = *(_DWORD *)(v66 + 80) & 0xF8;
  uint64_t v68 = v67 + 16;
  unint64_t v69 = v67 + 16 + v61;
  unint64_t v70 = ~v67 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v71 = (void *)(v69 & v70);
  uint64_t v72 = (unsigned __int8 *)((v68 + v62) & v70);
  if (*(void *)(v66 + 64) <= 8uLL) {
    uint64_t v73 = 8;
  }
  else {
    uint64_t v73 = *(void *)(*(void *)(v65 - 8) + 64);
  }
  unsigned int v74 = v72[v73];
  unsigned int v75 = v74 - 2;
  if (v74 >= 2)
  {
    if (v73 <= 3) {
      uint64_t v76 = v73;
    }
    else {
      uint64_t v76 = 4;
    }
    switch(v76)
    {
      case 1:
        int v77 = *v72;
        goto LABEL_40;
      case 2:
        int v77 = *(unsigned __int16 *)v72;
        goto LABEL_40;
      case 3:
        int v77 = *(unsigned __int16 *)((v68 + v62) & v70) | (*(unsigned __int8 *)(((v68 + v62) & v70) + 2) << 16);
        goto LABEL_40;
      case 4:
        int v77 = *(_DWORD *)v72;
LABEL_40:
        int v78 = (v77 | (v75 << (8 * v73))) + 2;
        unsigned int v74 = v77 + 2;
        if (v73 < 4) {
          unsigned int v74 = v78;
        }
        break;
      default:
        break;
    }
  }
  if (v74 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v66 + 16))(v71, v72, v65);
    char v79 = 1;
  }
  else
  {
    *uint64_t v71 = *(void *)v72;
    swift_retain();
    char v79 = 0;
  }
  *((unsigned char *)v71 + v73) = v79;
  uint64_t v80 = (void *)(((unint64_t)v71 + v73 + 8) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v81 = (void *)((unint64_t)&v72[v73 + 8] & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v80 = *v81;
  uint64_t v82 = (void *)(((unint64_t)v80 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v83 = (void *)(((unint64_t)v81 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v82 = *v83;
  *(void *)(((unint64_t)v82 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v83 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21F1BC40C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 40);
  uint64_t v8 = *(void *)(a3[3] - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v12, v13);
  uint64_t v100 = a3;
  uint64_t v14 = a3[4];
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = *(void *)(v9 + 40) + v16;
  uint64_t v18 = (void *)((v17 + v12) & ~v16);
  uint64_t v19 = (void *)((v17 + v13) & ~v16);
  int v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v13) = v20(v18, 1, v14);
  int v21 = v20(v19, 1, v14);
  if (v13)
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v18, v19, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
      goto LABEL_12;
    }
    int v22 = *(_DWORD *)(v15 + 84);
    size_t v23 = *(void *)(v15 + 64);
  }
  else
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v18, v19, v14);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v18, v14);
    int v22 = *(_DWORD *)(v15 + 84);
    size_t v23 = *(void *)(v15 + 64);
  }
  if (v22) {
    size_t v24 = v23;
  }
  else {
    size_t v24 = v23 + 1;
  }
  memcpy(v18, v19, v24);
LABEL_12:
  if (*(_DWORD *)(v15 + 84)) {
    uint64_t v25 = *(void *)(v15 + 64);
  }
  else {
    uint64_t v25 = *(void *)(v15 + 64) + 1;
  }
  uint64_t v26 = sub_21F1C2C50();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v29 = (v28 | 7) + v25;
  unint64_t v30 = (void *)(((unint64_t)v18 + v29) & ~(v28 | 7));
  unint64_t v31 = (void *)(((unint64_t)v19 + v29) & ~(v28 | 7));
  uint64_t v32 = *(unsigned int *)(v27 + 84);
  uint64_t v33 = ~v28;
  uint64_t v34 = v28 + 16;
  size_t v35 = ((v28 + 16) & ~v28) + *(void *)(v27 + 64);
  if ((v32 & 0x80000000) == 0)
  {
    unint64_t v36 = v31[1];
    if (v36 >= 0xFFFFFFFF) {
      LODWORD(v36) = -1;
    }
    int v37 = v36 + 1;
    if (v30[1] > 0xFFFFFFFEuLL) {
      goto LABEL_19;
    }
LABEL_22:
    if (v37) {
      goto LABEL_23;
    }
    *unint64_t v30 = *v31;
    v30[1] = v31[1];
    uint64_t v39 = *(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 16);
    swift_bridgeObjectRetain();
    v39(((unint64_t)v30 + v34) & v33, ((unint64_t)v31 + v34) & v33, v26);
    goto LABEL_26;
  }
  size_t v38 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v27 + 48);
  int v99 = v38(((unint64_t)v30 + v34) & v33, v32, v26);
  int v37 = v38(((unint64_t)v31 + v34) & v33, v32, v26);
  if (v99) {
    goto LABEL_22;
  }
LABEL_19:
  if (v37)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v27 + 8))(((unint64_t)v30 + v34) & v33, v26);
LABEL_23:
    memcpy(v30, v31, v35);
    goto LABEL_26;
  }
  *unint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 24))(((unint64_t)v30 + v34) & v33, ((unint64_t)v31 + v34) & v33, v26);
LABEL_26:
  uint64_t v40 = v100[5];
  uint64_t v41 = (char *)v31 + v35;
  uint64_t v42 = *(void *)(v40 - 8);
  uint64_t v43 = *(unsigned __int8 *)(v42 + 80);
  int v44 = (char *)(((unint64_t)v30 + v35 + v43) & ~v43);
  size_t v45 = (char *)((unint64_t)&v41[v43] & ~v43);
  size_t v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  int v47 = v46(v44, 1, v40);
  int v48 = v46(v45, 1, v40);
  if (v47)
  {
    if (!v48)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v44, v45, v40);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v44, 0, 1, v40);
      goto LABEL_37;
    }
    int v49 = *(_DWORD *)(v42 + 84);
    size_t v50 = *(void *)(v42 + 64);
  }
  else
  {
    if (!v48)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 24))(v44, v45, v40);
      goto LABEL_37;
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v40);
    int v49 = *(_DWORD *)(v42 + 84);
    size_t v50 = *(void *)(v42 + 64);
  }
  if (v49) {
    size_t v51 = v50;
  }
  else {
    size_t v51 = v50 + 1;
  }
  memcpy(v44, v45, v51);
LABEL_37:
  if (*(_DWORD *)(v42 + 84)) {
    uint64_t v52 = *(void *)(v42 + 64);
  }
  else {
    uint64_t v52 = *(void *)(v42 + 64) + 1;
  }
  unint64_t v53 = &v44[v52];
  uint64_t v54 = &v45[v52];
  *unint64_t v53 = *v54;
  v53[1] = v54[1];
  unint64_t v55 = (void *)((unint64_t)(v53 + 9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v56 = (unint64_t *)((unint64_t)(v54 + 9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v57 = *v56;
  if (*v55 < 0xFFFFFFFFuLL)
  {
    if (v57 >= 0xFFFFFFFF)
    {
      unint64_t v59 = v56[1];
      *unint64_t v55 = v57;
      v55[1] = v59;
      swift_retain();
      goto LABEL_47;
    }
  }
  else
  {
    if (v57 >= 0xFFFFFFFF)
    {
      unint64_t v58 = v56[1];
      *unint64_t v55 = v57;
      v55[1] = v58;
      swift_retain();
      swift_release();
      goto LABEL_47;
    }
    swift_release();
  }
  *(_OWORD *)unint64_t v55 = *(_OWORD *)v56;
LABEL_47:
  char v60 = (void *)(((unint64_t)v55 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v61 = (void *)(((unint64_t)v56 + 23) & 0xFFFFFFFFFFFFFFF8);
  *char v60 = *v61;
  v60[1] = v61[1];
  swift_retain();
  swift_release();
  unint64_t v62 = ((unint64_t)v60 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v63 = ((unint64_t)v61 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v64 = *(void *)v63;
  char v65 = *(unsigned char *)(v63 + 8);
  sub_21F1980F0(*(void *)v63, v65);
  uint64_t v66 = *(void *)v62;
  char v67 = *(unsigned char *)(v62 + 8);
  *(void *)unint64_t v62 = v64;
  *(unsigned char *)(v62 + 8) = v65;
  sub_21F198130(v66, v67);
  unint64_t v68 = ((unint64_t)v60 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v69 = ((unint64_t)v61 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v70 = *(void *)v69;
  char v71 = *(unsigned char *)(v69 + 8);
  sub_21F1980F0(*(void *)v69, v71);
  uint64_t v72 = *(void *)v68;
  char v73 = *(unsigned char *)(v68 + 8);
  *(void *)unint64_t v68 = v70;
  *(unsigned char *)(v68 + 8) = v71;
  sub_21F198130(v72, v73);
  uint64_t v74 = sub_21F1C25E0();
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = *(_DWORD *)(v75 + 80) & 0xF8;
  uint64_t v77 = v76 + 16;
  unint64_t v78 = v76 + 16 + v68;
  unint64_t v79 = ~v76 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v80 = v78 & v79;
  unint64_t v81 = (v77 + v69) & v79;
  if (*(void *)(v75 + 64) <= 8uLL) {
    uint64_t v82 = 8;
  }
  else {
    uint64_t v82 = *(void *)(*(void *)(v74 - 8) + 64);
  }
  if (v80 != v81)
  {
    uint64_t v83 = v74;
    unsigned int v84 = *(unsigned __int8 *)(v80 + v82);
    unsigned int v85 = v84 - 2;
    if (v84 >= 2)
    {
      if (v82 <= 3) {
        uint64_t v86 = v82;
      }
      else {
        uint64_t v86 = 4;
      }
      switch(v86)
      {
        case 1:
          int v87 = *(unsigned __int8 *)v80;
          goto LABEL_60;
        case 2:
          int v87 = *(unsigned __int16 *)v80;
          goto LABEL_60;
        case 3:
          int v87 = *(unsigned __int16 *)(v78 & v79) | (*(unsigned __int8 *)((v78 & v79) + 2) << 16);
          goto LABEL_60;
        case 4:
          int v87 = *(_DWORD *)v80;
LABEL_60:
          int v88 = (v87 | (v85 << (8 * v82))) + 2;
          unsigned int v84 = v87 + 2;
          if (v82 < 4) {
            unsigned int v84 = v88;
          }
          break;
        default:
          break;
      }
    }
    if (v84 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v75 + 8))(v80, v74);
    }
    else {
      swift_release();
    }
    unsigned int v89 = *(unsigned __int8 *)(v81 + v82);
    unsigned int v90 = v89 - 2;
    if (v89 >= 2)
    {
      if (v82 <= 3) {
        uint64_t v91 = v82;
      }
      else {
        uint64_t v91 = 4;
      }
      switch(v91)
      {
        case 1:
          int v92 = *(unsigned __int8 *)v81;
          goto LABEL_74;
        case 2:
          int v92 = *(unsigned __int16 *)v81;
          goto LABEL_74;
        case 3:
          int v92 = *(unsigned __int16 *)v81 | (*(unsigned __int8 *)(v81 + 2) << 16);
          goto LABEL_74;
        case 4:
          int v92 = *(_DWORD *)v81;
LABEL_74:
          int v93 = (v92 | (v90 << (8 * v82))) + 2;
          unsigned int v89 = v92 + 2;
          if (v82 < 4) {
            unsigned int v89 = v93;
          }
          break;
        default:
          break;
      }
    }
    if (v89 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v75 + 16))(v80, v81, v83);
      *(unsigned char *)(v80 + v82) = 1;
    }
    else
    {
      *(void *)unint64_t v80 = *(void *)v81;
      *(unsigned char *)(v80 + v82) = 0;
      swift_retain();
    }
  }
  size_t v94 = (void *)(((v80 | 7) + v82 + 1) & 0xFFFFFFFFFFFFFFF8);
  size_t v95 = (void *)(((v81 | 7) + v82 + 1) & 0xFFFFFFFFFFFFFFF8);
  *size_t v94 = *v95;
  uint64_t v96 = (void *)(((unint64_t)v94 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v97 = (void *)(((unint64_t)v95 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v96 = *v97;
  *(void *)(((unint64_t)v96 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v97 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21F1BCCEC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = a3[4];
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (void *)((v17 + v11) & ~v16);
  uint64_t v19 = (char *)((v17 + v12) & ~v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
  {
    int v20 = *(_DWORD *)(v15 + 84);
    uint64_t v21 = *(void *)(v15 + 64);
    if (v20) {
      size_t v22 = *(void *)(v15 + 64);
    }
    else {
      size_t v22 = v21 + 1;
    }
    memcpy(v18, v19, v22);
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v15 + 32))(v18, v19, v14);
    size_t v24 = *(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56);
    uint64_t v23 = v15 + 56;
    v24(v18, 0, 1, v14);
    int v20 = *(_DWORD *)(v23 + 28);
    uint64_t v21 = *(void *)(v23 + 8);
  }
  if (!v20) {
    ++v21;
  }
  uint64_t v25 = sub_21F1C2C50();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned __int8 *)(v26 + 80);
  uint64_t v28 = (v27 | 7) + v21;
  uint64_t v29 = (_OWORD *)(((unint64_t)v18 + v28) & ~(v27 | 7));
  unint64_t v30 = (unint64_t)&v19[v28];
  unint64_t v31 = (_OWORD *)(v30 & ~(v27 | 7));
  uint64_t v32 = ~v27;
  uint64_t v33 = v27 + 16;
  uint64_t v34 = (v27 + 16) & ~v27;
  uint64_t v35 = *(void *)(v26 + 64);
  if ((*(_DWORD *)(v26 + 84) & 0x80000000) != 0)
  {
    size_t v37 = v34 + v35;
    if ((*(unsigned int (**)(unint64_t))(v26 + 48))(((unint64_t)v31 + v33) & v32))
    {
LABEL_13:
      memcpy(v29, v31, v37);
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v36 = *(void *)((v30 & ~(v27 | 7)) + 8);
    if (v36 >= 0xFFFFFFFF) {
      LODWORD(v36) = -1;
    }
    size_t v37 = v34 + v35;
    if (v36 != -1) {
      goto LABEL_13;
    }
  }
  _OWORD *v29 = *v31;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v26 + 32))(((unint64_t)v29 + v33) & v32, ((unint64_t)v31 + v33) & v32, v25);
LABEL_16:
  uint64_t v38 = a3[5];
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = *(unsigned __int8 *)(v39 + 80);
  uint64_t v41 = (char *)(((unint64_t)v29 + v37 + v40) & ~v40);
  uint64_t v42 = (char *)(((unint64_t)v31 + v37 + v40) & ~v40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v42, 1, v38))
  {
    int v43 = *(_DWORD *)(v39 + 84);
    size_t v44 = *(void *)(v39 + 64);
    if (v43) {
      size_t v45 = v44;
    }
    else {
      size_t v45 = v44 + 1;
    }
    memcpy(v41, v42, v45);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v41, v42, v38);
    int v47 = *(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56);
    uint64_t v46 = v39 + 56;
    v47(v41, 0, 1, v38);
    int v43 = *(_DWORD *)(v46 + 28);
    size_t v44 = *(void *)(v46 + 8);
  }
  if (v43) {
    size_t v48 = v44;
  }
  else {
    size_t v48 = v44 + 1;
  }
  int v49 = &v41[v48];
  size_t v50 = &v42[v48];
  *int v49 = v42[v48];
  v49[1] = v42[v48 + 1];
  unint64_t v51 = (unint64_t)&v41[v48 + 9] & 0xFFFFFFFFFFFFFFF8;
  unint64_t v52 = (unint64_t)(v50 + 9) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v52 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v51 = *(_OWORD *)v52;
  }
  else
  {
    uint64_t v53 = *(void *)(v52 + 8);
    *(void *)unint64_t v51 = *(void *)v52;
    *(void *)(v51 + 8) = v53;
  }
  uint64_t v54 = (_OWORD *)((v51 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v55 = (_OWORD *)((v52 + 23) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v54 = *v55;
  unint64_t v56 = ((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v57 = ((unint64_t)v55 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v58 = *(void *)v57;
  *(unsigned char *)(v56 + 8) = *(unsigned char *)(v57 + 8);
  *(void *)unint64_t v56 = v58;
  unint64_t v59 = ((unint64_t)v54 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v60 = ((unint64_t)v55 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v61 = *(void *)v60;
  *(unsigned char *)(v59 + 8) = *(unsigned char *)(v60 + 8);
  *(void *)unint64_t v59 = v61;
  uint64_t v62 = sub_21F1C25E0();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v64 = *(_DWORD *)(v63 + 80) & 0xF8;
  uint64_t v65 = v64 + 16;
  unint64_t v66 = v64 + 16 + v59;
  unint64_t v67 = ~v64 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v68 = (void *)(v66 & v67);
  unint64_t v69 = (unsigned __int8 *)((v65 + v60) & v67);
  if (*(void *)(v63 + 64) <= 8uLL) {
    uint64_t v70 = 8;
  }
  else {
    uint64_t v70 = *(void *)(*(void *)(v62 - 8) + 64);
  }
  unsigned int v71 = v69[v70];
  unsigned int v72 = v71 - 2;
  if (v71 >= 2)
  {
    if (v70 <= 3) {
      uint64_t v73 = v70;
    }
    else {
      uint64_t v73 = 4;
    }
    switch(v73)
    {
      case 1:
        int v74 = *v69;
        goto LABEL_40;
      case 2:
        int v74 = *(unsigned __int16 *)v69;
        goto LABEL_40;
      case 3:
        int v74 = *(unsigned __int16 *)v69 | (v69[2] << 16);
        goto LABEL_40;
      case 4:
        int v74 = *(_DWORD *)v69;
LABEL_40:
        int v75 = (v74 | (v72 << (8 * v70))) + 2;
        unsigned int v71 = v74 + 2;
        if (v70 < 4) {
          unsigned int v71 = v75;
        }
        break;
      default:
        break;
    }
  }
  if (v71 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v63 + 32))(v68, v69, v62);
    char v76 = 1;
  }
  else
  {
    char v76 = 0;
    *unint64_t v68 = *(void *)v69;
  }
  *((unsigned char *)v68 + v70) = v76;
  uint64_t v77 = (void *)(((unint64_t)v68 + v70 + 8) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v78 = (void *)((unint64_t)&v69[v70 + 8] & 0xFFFFFFFFFFFFFFF8);
  void *v77 = *v78;
  unint64_t v79 = (void *)(((unint64_t)v77 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v80 = (void *)(((unint64_t)v78 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v79 = *v80;
  *(void *)(((unint64_t)v79 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v80 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21F1BD2B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(a3[3] - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v12, v13);
  uint64_t v98 = a3;
  uint64_t v14 = a3[4];
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = *(void *)(v9 + 24) + v16;
  uint64_t v18 = (void *)((v17 + v12) & ~v16);
  uint64_t v19 = (void *)((v17 + v13) & ~v16);
  int v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v13) = v20(v18, 1, v14);
  int v21 = v20(v19, 1, v14);
  if (v13)
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v18, v19, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
      goto LABEL_12;
    }
    int v22 = *(_DWORD *)(v15 + 84);
    size_t v23 = *(void *)(v15 + 64);
  }
  else
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v18, v19, v14);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v18, v14);
    int v22 = *(_DWORD *)(v15 + 84);
    size_t v23 = *(void *)(v15 + 64);
  }
  if (v22) {
    size_t v24 = v23;
  }
  else {
    size_t v24 = v23 + 1;
  }
  memcpy(v18, v19, v24);
LABEL_12:
  if (*(_DWORD *)(v15 + 84)) {
    uint64_t v25 = *(void *)(v15 + 64);
  }
  else {
    uint64_t v25 = *(void *)(v15 + 64) + 1;
  }
  uint64_t v26 = sub_21F1C2C50();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v29 = (v28 | 7) + v25;
  unint64_t v30 = (void *)(((unint64_t)v18 + v29) & ~(v28 | 7));
  unint64_t v31 = (void *)(((unint64_t)v19 + v29) & ~(v28 | 7));
  uint64_t v32 = *(unsigned int *)(v27 + 84);
  uint64_t v33 = ~v28;
  uint64_t v34 = v28 + 16;
  size_t v35 = ((v28 + 16) & ~v28) + *(void *)(v27 + 64);
  if ((v32 & 0x80000000) == 0)
  {
    unint64_t v36 = v31[1];
    if (v36 >= 0xFFFFFFFF) {
      LODWORD(v36) = -1;
    }
    int v37 = v36 + 1;
    if (v30[1] > 0xFFFFFFFEuLL) {
      goto LABEL_19;
    }
LABEL_22:
    if (v37) {
      goto LABEL_23;
    }
    *(_OWORD *)unint64_t v30 = *(_OWORD *)v31;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 32))(((unint64_t)v30 + v34) & v33, ((unint64_t)v31 + v34) & v33, v26);
    goto LABEL_26;
  }
  uint64_t v38 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v27 + 48);
  int v97 = v38(((unint64_t)v30 + v34) & v33, v32, v26);
  int v37 = v38(((unint64_t)v31 + v34) & v33, v32, v26);
  if (v97) {
    goto LABEL_22;
  }
LABEL_19:
  if (v37)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v27 + 8))(((unint64_t)v30 + v34) & v33, v26);
LABEL_23:
    memcpy(v30, v31, v35);
    goto LABEL_26;
  }
  *unint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 40))(((unint64_t)v30 + v34) & v33, ((unint64_t)v31 + v34) & v33, v26);
LABEL_26:
  uint64_t v39 = v98[5];
  uint64_t v40 = (char *)v31 + v35;
  uint64_t v41 = *(void *)(v39 - 8);
  uint64_t v42 = *(unsigned __int8 *)(v41 + 80);
  int v43 = (char *)(((unint64_t)v30 + v35 + v42) & ~v42);
  size_t v44 = (char *)((unint64_t)&v40[v42] & ~v42);
  size_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
  int v46 = v45(v43, 1, v39);
  int v47 = v45(v44, 1, v39);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v43, v44, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v43, 0, 1, v39);
      goto LABEL_37;
    }
    int v48 = *(_DWORD *)(v41 + 84);
    size_t v49 = *(void *)(v41 + 64);
  }
  else
  {
    if (!v47)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v43, v44, v39);
      goto LABEL_37;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v39);
    int v48 = *(_DWORD *)(v41 + 84);
    size_t v49 = *(void *)(v41 + 64);
  }
  if (v48) {
    size_t v50 = v49;
  }
  else {
    size_t v50 = v49 + 1;
  }
  memcpy(v43, v44, v50);
LABEL_37:
  if (*(_DWORD *)(v41 + 84)) {
    uint64_t v51 = *(void *)(v41 + 64);
  }
  else {
    uint64_t v51 = *(void *)(v41 + 64) + 1;
  }
  unint64_t v52 = &v43[v51];
  uint64_t v53 = &v44[v51];
  *unint64_t v52 = *v53;
  v52[1] = v53[1];
  uint64_t v54 = (void *)((unint64_t)(v52 + 9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v55 = (unint64_t *)((unint64_t)(v53 + 9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v56 = *v55;
  if (*v54 < 0xFFFFFFFFuLL)
  {
    if (v56 >= 0xFFFFFFFF)
    {
      unint64_t v58 = v55[1];
      void *v54 = v56;
      v54[1] = v58;
      goto LABEL_47;
    }
  }
  else
  {
    if (v56 >= 0xFFFFFFFF)
    {
      unint64_t v57 = v55[1];
      void *v54 = v56;
      v54[1] = v57;
      swift_release();
      goto LABEL_47;
    }
    swift_release();
  }
  *(_OWORD *)uint64_t v54 = *(_OWORD *)v55;
LABEL_47:
  unint64_t v59 = (void *)(((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v60 = (void *)(((unint64_t)v55 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v59 = *v60;
  v59[1] = v60[1];
  swift_release();
  unint64_t v61 = ((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v62 = ((unint64_t)v60 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v63 = *(void *)v62;
  LOBYTE(v62) = *(unsigned char *)(v62 + 8);
  uint64_t v64 = *(void *)v61;
  char v65 = *(unsigned char *)(v61 + 8);
  *(void *)unint64_t v61 = v63;
  *(unsigned char *)(v61 + 8) = v62;
  sub_21F198130(v64, v65);
  unint64_t v66 = ((unint64_t)v59 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v67 = ((unint64_t)v60 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v68 = *(unsigned char *)(v67 + 8);
  uint64_t v69 = *(void *)v66;
  char v70 = *(unsigned char *)(v66 + 8);
  *(void *)unint64_t v66 = *(void *)v67;
  *(unsigned char *)(v66 + 8) = v68;
  sub_21F198130(v69, v70);
  uint64_t v71 = sub_21F1C25E0();
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(_DWORD *)(v72 + 80) & 0xF8;
  uint64_t v74 = v73 + 16;
  unint64_t v75 = v73 + 16 + v66;
  unint64_t v76 = ~v73 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v77 = v75 & v76;
  unint64_t v78 = (v74 + v67) & v76;
  if (*(void *)(v72 + 64) <= 8uLL) {
    uint64_t v79 = 8;
  }
  else {
    uint64_t v79 = *(void *)(*(void *)(v71 - 8) + 64);
  }
  if (v77 != v78)
  {
    uint64_t v80 = v71;
    unsigned int v81 = *(unsigned __int8 *)(v77 + v79);
    unsigned int v82 = v81 - 2;
    if (v81 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v83 = v79;
      }
      else {
        uint64_t v83 = 4;
      }
      switch(v83)
      {
        case 1:
          int v84 = *(unsigned __int8 *)v77;
          goto LABEL_60;
        case 2:
          int v84 = *(unsigned __int16 *)v77;
          goto LABEL_60;
        case 3:
          int v84 = *(unsigned __int16 *)(v75 & v76) | (*(unsigned __int8 *)((v75 & v76) + 2) << 16);
          goto LABEL_60;
        case 4:
          int v84 = *(_DWORD *)v77;
LABEL_60:
          int v85 = (v84 | (v82 << (8 * v79))) + 2;
          unsigned int v81 = v84 + 2;
          if (v79 < 4) {
            unsigned int v81 = v85;
          }
          break;
        default:
          break;
      }
    }
    if (v81 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v72 + 8))(v77, v71);
    }
    else {
      swift_release();
    }
    unsigned int v86 = *(unsigned __int8 *)(v78 + v79);
    unsigned int v87 = v86 - 2;
    if (v86 >= 2)
    {
      if (v79 <= 3) {
        uint64_t v88 = v79;
      }
      else {
        uint64_t v88 = 4;
      }
      switch(v88)
      {
        case 1:
          int v89 = *(unsigned __int8 *)v78;
          goto LABEL_74;
        case 2:
          int v89 = *(unsigned __int16 *)v78;
          goto LABEL_74;
        case 3:
          int v89 = *(unsigned __int16 *)v78 | (*(unsigned __int8 *)(v78 + 2) << 16);
          goto LABEL_74;
        case 4:
          int v89 = *(_DWORD *)v78;
LABEL_74:
          int v90 = (v89 | (v87 << (8 * v79))) + 2;
          unsigned int v86 = v89 + 2;
          if (v79 < 4) {
            unsigned int v86 = v90;
          }
          break;
        default:
          break;
      }
    }
    if (v86 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v72 + 32))(v77, v78, v80);
      char v91 = 1;
    }
    else
    {
      char v91 = 0;
      *(void *)unint64_t v77 = *(void *)v78;
    }
    *(unsigned char *)(v77 + v79) = v91;
  }
  int v92 = (void *)(((v77 | 7) + v79 + 1) & 0xFFFFFFFFFFFFFFF8);
  int v93 = (void *)(((v78 | 7) + v79 + 1) & 0xFFFFFFFFFFFFFFF8);
  *int v92 = *v93;
  size_t v94 = (void *)(((unint64_t)v92 + 15) & 0xFFFFFFFFFFFFFFF8);
  size_t v95 = (void *)(((unint64_t)v93 + 15) & 0xFFFFFFFFFFFFFFF8);
  *size_t v94 = *v95;
  *(void *)(((unint64_t)v94 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v95 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21F1BDB44(_DWORD *a1, unsigned int a2, void *a3)
{
  uint64_t v57 = a3[2];
  uint64_t v65 = *(void *)(v57 - 8);
  uint64_t v55 = a3[3];
  uint64_t v64 = *(void *)(v55 - 8);
  unsigned int v4 = *(_DWORD *)(v64 + 84);
  unsigned int v56 = v4;
  unsigned int v58 = *(_DWORD *)(v65 + 84);
  if (v4 <= v58) {
    unsigned int v4 = *(_DWORD *)(v65 + 84);
  }
  uint64_t v52 = a3[4];
  uint64_t v62 = *(void *)(v52 - 8);
  uint64_t v5 = *(unsigned int *)(v62 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  unsigned int v54 = v6;
  if (v6 <= v4) {
    unsigned int v7 = v4;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v61 = *(void *)(sub_21F1C2C50() - 8);
  unsigned int v51 = *(_DWORD *)(v61 + 84);
  if (v51 <= 0x7FFFFFFF) {
    int v8 = 0x7FFFFFFF;
  }
  else {
    int v8 = *(_DWORD *)(v61 + 84);
  }
  unsigned int v9 = v8 - 6;
  uint64_t v49 = a3[5];
  uint64_t v60 = *(void *)(v49 - 8);
  unsigned int v53 = v9;
  if (v9 <= v7) {
    unsigned int v9 = v7;
  }
  uint64_t v10 = *(void *)(v49 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  unsigned int v12 = v11 - 1;
  if (!v11) {
    unsigned int v12 = 0;
  }
  unsigned int v50 = v12;
  if (v12 > v9) {
    unsigned int v9 = v12;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v13 = 2147483646;
  }
  else {
    unsigned int v13 = v9;
  }
  uint64_t v14 = *(void *)(sub_21F1C25E0() - 8);
  if (*(void *)(v14 + 64) <= 8uLL) {
    uint64_t v15 = 8;
  }
  else {
    uint64_t v15 = *(void *)(v14 + 64);
  }
  if (v5) {
    uint64_t v16 = *(void *)(v62 + 64);
  }
  else {
    uint64_t v16 = *(void *)(v62 + 64) + 1;
  }
  uint64_t v17 = *(unsigned __int8 *)(v64 + 80);
  uint64_t v18 = *(void *)(v64 + 64);
  uint64_t v19 = *(unsigned __int8 *)(v62 + 80);
  uint64_t v20 = *(unsigned __int8 *)(v61 + 80);
  uint64_t v21 = *(unsigned __int8 *)(v10 + 80);
  if (v11) {
    uint64_t v22 = *(void *)(v60 + 64);
  }
  else {
    uint64_t v22 = *(void *)(v60 + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v23 = *(void *)(v65 + 64) + v17;
  uint64_t v24 = v20 | 7;
  uint64_t v25 = ((v20 + 16) & ~v20) + *(void *)(v61 + 64) + v21;
  uint64_t v26 = v22 + 9;
  uint64_t v27 = a1;
  if (v13 < a2)
  {
    uint64_t v28 = *(_DWORD *)(v14 + 80) & 0xF8 | 7;
    unint64_t v29 = ((((((v15
              + ((v28
                + ((((((v26 + ((v25 + ((v24 + v16 + ((v18 + v19 + (v23 & ~v17)) & ~v19)) & ~v24)) & ~v21)) & 0xFFFFFFFFFFFFFFF8)
                    + 23) & 0xFFFFFFFFFFFFFFF8)
                  + 39) & 0xFFFFFFFFFFFFFFF8)
                + 9) & ~v28)
              + 8) & 0xFFFFFFFFFFFFFFF8)
            + 15) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    int v30 = v29 & 0xFFFFFFF8;
    if ((v29 & 0xFFFFFFF8) != 0) {
      unsigned int v31 = 2;
    }
    else {
      unsigned int v31 = a2 - v13 + 1;
    }
    if (v31 >= 0x10000) {
      unsigned int v32 = 4;
    }
    else {
      unsigned int v32 = 2;
    }
    if (v31 < 0x100) {
      unsigned int v32 = 1;
    }
    if (v31 >= 2) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0;
    }
    switch(v33)
    {
      case 1:
        int v34 = *((unsigned __int8 *)a1 + v29);
        if (!*((unsigned char *)a1 + v29)) {
          break;
        }
        goto LABEL_46;
      case 2:
        int v34 = *(unsigned __int16 *)((char *)a1 + v29);
        if (*(_WORD *)((char *)a1 + v29)) {
          goto LABEL_46;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x21F1BE0BCLL);
      case 4:
        int v34 = *(_DWORD *)((char *)a1 + v29);
        if (!v34) {
          break;
        }
LABEL_46:
        int v35 = v34 - 1;
        if ((v29 & 0xFFFFFFF8) != 0)
        {
          int v35 = 0;
          int v30 = *a1;
        }
        return v13 + (v30 | v35) + 1;
      default:
        break;
    }
  }
  if (v58 == v13)
  {
    uint64_t v37 = v57;
    uint64_t v38 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v65 + 48);
    uint64_t v39 = v58;
LABEL_54:
    return v38(v27, v39, v37);
  }
  uint64_t v27 = (_DWORD *)(((unint64_t)a1 + v23) & ~v17);
  if (v56 == v13)
  {
    uint64_t v38 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v64 + 48);
    uint64_t v39 = v56;
    uint64_t v37 = v55;
    goto LABEL_54;
  }
  unint64_t v40 = ((unint64_t)v27 + v18 + v19) & ~v19;
  if (v54 == v13)
  {
    if (v5 < 2) {
      return 0;
    }
    unsigned int v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v62 + 48))(v40, v5, v52);
    goto LABEL_66;
  }
  uint64_t v41 = (v40 + v16 + v24) & ~v24;
  if (v53 == v13)
  {
    if ((v51 & 0x80000000) != 0)
    {
      unsigned int v43 = (*(uint64_t (**)(uint64_t))(v61 + 48))((v20 + 16 + v41) & ~v20);
    }
    else
    {
      unint64_t v42 = *(void *)(((v40 + v16 + v24) & ~v24) + 8);
      if (v42 >= 0xFFFFFFFF) {
        LODWORD(v42) = -1;
      }
      unsigned int v43 = v42 + 1;
    }
    unsigned int v45 = v43 - 6;
    BOOL v46 = v43 >= 7;
    goto LABEL_77;
  }
  uint64_t v47 = (v25 + v41) & ~v21;
  if (v50 == v13)
  {
    if (v11 < 2) {
      return 0;
    }
    unsigned int v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v47, v11, v49);
LABEL_66:
    unsigned int v45 = v44 - 1;
    BOOL v46 = v44 >= 2;
LABEL_77:
    if (v46) {
      return v45;
    }
    else {
      return 0;
    }
  }
  unint64_t v48 = *(void *)((v26 + v47) & 0xFFFFFFFFFFFFFFF8);
  if (v48 >= 0xFFFFFFFF) {
    LODWORD(v48) = -1;
  }
  if ((v48 + 1) >= 2) {
    return v48;
  }
  else {
    return 0;
  }
}

void sub_21F1BE0D0(_DWORD *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v57 = *(void *)(a4[2] - 8);
  unsigned int v5 = *(_DWORD *)(v57 + 84);
  uint64_t v56 = *(void *)(a4[3] - 8);
  unsigned int v54 = v5;
  unsigned int v53 = *(_DWORD *)(v56 + 84);
  if (v53 > v5) {
    unsigned int v5 = *(_DWORD *)(v56 + 84);
  }
  uint64_t v6 = *(void *)(a4[4] - 8);
  int v7 = *(_DWORD *)(v6 + 84);
  unsigned int v8 = v7 - 1;
  if (!v7) {
    unsigned int v8 = 0;
  }
  unsigned int v52 = v8;
  if (v8 <= v5) {
    unsigned int v9 = v5;
  }
  else {
    unsigned int v9 = v8;
  }
  uint64_t v55 = *(void *)(sub_21F1C2C50() - 8);
  unsigned int v48 = *(_DWORD *)(v55 + 84);
  if (v48 <= 0x7FFFFFFF) {
    int v10 = 0x7FFFFFFF;
  }
  else {
    int v10 = *(_DWORD *)(v55 + 84);
  }
  unsigned int v50 = v10;
  unsigned int v11 = v10 - 6;
  uint64_t v12 = *(void *)(a4[5] - 8);
  unsigned int v51 = v11;
  if (v11 <= v9) {
    unsigned int v11 = v9;
  }
  uint64_t v61 = v12;
  int v13 = *(_DWORD *)(v12 + 84);
  unsigned int v14 = v13 - 1;
  if (!v13) {
    unsigned int v14 = 0;
  }
  unsigned int v49 = v14;
  if (v14 > v11) {
    unsigned int v11 = v14;
  }
  if (v11 <= 0x7FFFFFFE) {
    unsigned int v15 = 2147483646;
  }
  else {
    unsigned int v15 = v11;
  }
  uint64_t v16 = sub_21F1C25E0();
  int v17 = 0;
  uint64_t v18 = *(void *)(v16 - 8);
  if (*(void *)(v18 + 64) <= 8uLL) {
    uint64_t v19 = 8;
  }
  else {
    uint64_t v19 = *(void *)(v18 + 64);
  }
  uint64_t v20 = *(void *)(v6 + 64);
  if (!v7) {
    ++v20;
  }
  unsigned int v21 = v15;
  uint64_t v22 = *(unsigned __int8 *)(v56 + 80);
  uint64_t v23 = *(void *)(v57 + 64) + v22;
  uint64_t v24 = *(void *)(v56 + 64);
  uint64_t v25 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v26 = *(unsigned __int8 *)(v55 + 80);
  uint64_t v27 = v26 | 7;
  size_t v28 = ((v26 + 16) & ~v26) + *(void *)(v55 + 64);
  uint64_t v29 = *(unsigned __int8 *)(v12 + 80);
  if (v13) {
    uint64_t v30 = *(void *)(v12 + 64);
  }
  else {
    uint64_t v30 = *(void *)(v12 + 64) + 1;
  }
  uint64_t v31 = v30 + 9;
  uint64_t v32 = *(_DWORD *)(v18 + 80) & 0xF8 | 7;
  size_t v33 = ((((((v19
            + ((v32
              + ((((((v30
                    + 9
                    + ((v28 + v29 + (((v26 | 7) + v20 + ((v24 + v25 + (v23 & ~v22)) & ~v25)) & ~(v26 | 7))) & ~v29)) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)
                + 39) & 0xFFFFFFFFFFFFFFF8)
              + 9) & ~v32)
            + 8) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v15 < a3)
  {
    if (((((((v19
             + ((v32
               + ((((((v30
                     + 9
                     + ((v28
                       + v29
                       + (((v26 | 7)
                         + v20
                         + ((v24 + v25 + (v23 & ~v22)) & ~v25)) & ~(v26 | 7))) & ~v29)) & 0xFFFFFFF8)
                   + 23) & 0xFFFFFFF8)
                 + 39) & 0xFFFFFFF8)
               + 9) & ~v32)
             + 8) & 0xFFFFFFF8)
           + 15) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v34 = a3 - v15 + 1;
    else {
      unsigned int v34 = 2;
    }
    if (v34 >= 0x10000) {
      int v35 = 4;
    }
    else {
      int v35 = 2;
    }
    if (v34 < 0x100) {
      int v35 = 1;
    }
    if (v34 >= 2) {
      int v17 = v35;
    }
    else {
      int v17 = 0;
    }
  }
  int v36 = v17;
  if (a2 > v15)
  {
    if (v33) {
      int v37 = 1;
    }
    else {
      int v37 = a2 - v15;
    }
    if (v33)
    {
      bzero(a1, v33);
      *a1 = ~v21 + a2;
    }
    switch(v36)
    {
      case 1:
        *((unsigned char *)a1 + v33) = v37;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v33) = v37;
        return;
      case 3:
        goto LABEL_91;
      case 4:
        *(_DWORD *)((char *)a1 + v33) = v37;
        return;
      default:
        return;
    }
  }
  uint64_t v38 = ~v22;
  uint64_t v39 = ~v27;
  uint64_t v40 = (uint64_t)a1;
  switch(v17)
  {
    case 1:
      *((unsigned char *)a1 + v33) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_55;
    case 2:
      *(_WORD *)((char *)a1 + v33) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_55;
    case 3:
LABEL_91:
      __break(1u);
      JUMPOUT(0x21F1BE738);
    case 4:
      *(_DWORD *)((char *)a1 + v33) = 0;
      goto LABEL_54;
    default:
LABEL_54:
      if (!a2) {
        return;
      }
LABEL_55:
      if (v54 == v21)
      {
        uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v57 + 56);
        uint64_t v42 = a2;
LABEL_76:
        v41(v40, v42);
        return;
      }
      uint64_t v40 = ((unint64_t)a1 + v23) & v38;
      if (v53 == v21)
      {
        uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v56 + 56);
        uint64_t v42 = a2;
        goto LABEL_76;
      }
      uint64_t v40 = (v40 + v24 + v25) & ~v25;
      if (v52 == v21)
      {
        uint64_t v42 = a2 + 1;
        uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v6 + 56);
        goto LABEL_76;
      }
      unsigned int v43 = (unsigned char *)((v40 + v20 + v27) & v39);
      if (v51 != v21)
      {
        uint64_t v40 = (unint64_t)&v43[v28 + v29] & ~v29;
        if (v49 != v21)
        {
          uint64_t v47 = (void *)((v31 + v40) & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *uint64_t v47 = 0;
            v47[1] = 0;
            *(_DWORD *)uint64_t v47 = a2 - 0x7FFFFFFF;
          }
          else
          {
            *uint64_t v47 = a2;
          }
          return;
        }
        uint64_t v42 = a2 + 1;
        uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v61 + 56);
        goto LABEL_76;
      }
      if (a2 + 6 <= v50)
      {
        if (a2 == -6) {
          return;
        }
        if ((v48 & 0x80000000) == 0)
        {
          if (((a2 + 6) & 0x80000000) != 0)
          {
            *(void *)unsigned int v43 = a2 - 2147483642;
            *(void *)(((v40 + v20 + v27) & v39) + 8) = 0;
          }
          else
          {
            *(void *)(((v40 + v20 + v27) & v39) + 8) = a2 + 5;
          }
          return;
        }
        uint64_t v40 = (unint64_t)&v43[v26 + 16] & ~v26;
        uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v55 + 56);
        uint64_t v42 = a2 + 6;
        goto LABEL_76;
      }
      if (v28 <= 3) {
        int v44 = ~(-1 << (8 * v28));
      }
      else {
        int v44 = -1;
      }
      if (v28)
      {
        int v45 = v44 & (a2 - v50 + 5);
        if (v28 <= 3) {
          int v46 = v28;
        }
        else {
          int v46 = 4;
        }
        bzero(v43, v28);
        switch(v46)
        {
          case 2:
            *(_WORD *)unsigned int v43 = v45;
            break;
          case 3:
            *(_WORD *)unsigned int v43 = v45;
            v43[2] = BYTE2(v45);
            break;
          case 4:
            *(_DWORD *)unsigned int v43 = v45;
            break;
          default:
            *unsigned int v43 = v45;
            break;
        }
      }
      return;
  }
}

void sub_21F1BE770()
{
  if (!qword_267EC44C0)
  {
    sub_21F1C25E0();
    unint64_t v0 = sub_21F1C25F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267EC44C0);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for PaymentItemContentStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21F1BE894);
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

ValueMetadata *type metadata accessor for PaymentItemContentStyle()
{
  return &type metadata for PaymentItemContentStyle;
}

ValueMetadata *type metadata accessor for PaymentItem_Previews()
{
  return &type metadata for PaymentItem_Previews;
}

uint64_t sub_21F1BE8DC()
{
  return swift_getWitnessTable();
}

uint64_t sub_21F1BEDCC()
{
  return swift_getWitnessTable();
}

uint64_t sub_21F1BEF94()
{
  return sub_21F1BF0A4(&qword_267EC44D0, &qword_267EC44A8, (void (*)(void))sub_21F1BEFD8);
}

unint64_t sub_21F1BEFD8()
{
  unint64_t result = qword_267EC44D8;
  if (!qword_267EC44D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4490);
    sub_21F1BF0A4(&qword_267EC44E0, &qword_267EC4488, (void (*)(void))sub_21F1BF120);
    sub_21F192EE4(&qword_26AD3F9C8, &qword_26AD3F9D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC44D8);
  }
  return result;
}

uint64_t sub_21F1BF0A4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_21F1BF120()
{
  unint64_t result = qword_267EC44E8;
  if (!qword_267EC44E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4480);
    sub_21F192EE4(&qword_267EC44F0, &qword_267EC4478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC44E8);
  }
  return result;
}

unint64_t sub_21F1BF1C0()
{
  unint64_t result = qword_267EC44F8;
  if (!qword_267EC44F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC44F8);
  }
  return result;
}

uint64_t sub_21F1BF214@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_21F1C2870();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_21F1BF248()
{
  return sub_21F1C2880();
}

uint64_t sub_21F1BF278()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  long long v22 = *(_OWORD *)(v0 + 40);
  unsigned int v4 = (int *)type metadata accessor for PaymentItem();
  uint64_t v5 = *(unsigned __int8 *)(*((void *)v4 - 1) + 80);
  uint64_t v21 = *(void *)(*((void *)v4 - 1) + 64);
  uint64_t v6 = sub_21F1C2650();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v0 + ((v5 + 80) & ~v5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v9, v2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9 + v4[21], v1);
  uint64_t v10 = v9 + v4[22];
  uint64_t v11 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v10, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v3);
  }
  uint64_t v12 = v9 + v4[23];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 6, v13))
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = v12 + *(int *)(v13 + 48);
    uint64_t v15 = sub_21F1C2C50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  uint64_t v16 = v9 + v4[24];
  uint64_t v17 = *(void *)(v22 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v17 + 48))(v16, 1, v22)) {
    (*(void (**)(uint64_t, void))(v17 + 8))(v16, v22);
  }
  if (*(void *)(v9 + v4[27])) {
    swift_release();
  }
  swift_release();
  sub_21F198130(*(void *)(v9 + v4[29]), *(unsigned char *)(v9 + v4[29] + 8));
  sub_21F198130(*(void *)(v9 + v4[30]), *(unsigned char *)(v9 + v4[30] + 8));
  uint64_t v18 = v9 + v4[31];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4438);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_21F1C25E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + ((((v5 + 80) & ~v5) + v21 + v8) & ~v8), v6);
  return swift_deallocObject();
}

uint64_t sub_21F1BF6A8()
{
  return sub_21F1B26EC();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  long long v17 = *(_OWORD *)(v0 + 40);
  unsigned int v4 = (int *)type metadata accessor for PaymentItem();
  uint64_t v5 = v0
     + ((*(unsigned __int8 *)(*((void *)v4 - 1) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v4 - 1) + 80));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v5, v1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v5 + v4[21], v2);
  uint64_t v6 = v5 + v4[22];
  uint64_t v7 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v3);
  }
  uint64_t v8 = v5 + v4[23];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4320);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 6, v9))
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = v8 + *(int *)(v9 + 48);
    uint64_t v11 = sub_21F1C2C50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  uint64_t v12 = v5 + v4[24];
  uint64_t v13 = *(void *)(v17 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v13 + 48))(v12, 1, v17)) {
    (*(void (**)(uint64_t, void))(v13 + 8))(v12, v17);
  }
  if (*(void *)(v5 + v4[27])) {
    swift_release();
  }
  swift_release();
  sub_21F198130(*(void *)(v5 + v4[29]), *(unsigned char *)(v5 + v4[29] + 8));
  sub_21F198130(*(void *)(v5 + v4[30]), *(unsigned char *)(v5 + v4[30] + 8));
  uint64_t v14 = v5 + v4[31];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EC4438);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_21F1C25E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_21F1BFB84()
{
  return sub_21F1B26EC();
}

unint64_t sub_21F1BFC5C()
{
  unint64_t result = qword_267EC4558;
  if (!qword_267EC4558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4558);
  }
  return result;
}

unint64_t sub_21F1BFCD0()
{
  unint64_t result = qword_267EC4560;
  if (!qword_267EC4560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4560);
  }
  return result;
}

uint64_t sub_21F1BFD24()
{
  return sub_21F1BFE7C((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_21F1B5FBC);
}

uint64_t sub_21F1BFD3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_21F1BFDA0()
{
  unint64_t result = qword_267EC4570;
  if (!qword_267EC4570)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EC4440);
    sub_21F1BFEBC((unint64_t *)&qword_267EC4188, MEMORY[0x263F1B7B8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4570);
  }
  return result;
}

uint64_t sub_21F1BFE4C()
{
  return sub_21F1BFE7C((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_21F1B6C54);
}

uint64_t sub_21F1BFE64()
{
  return sub_21F1BFE7C((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_21F1B723C);
}

uint64_t sub_21F1BFE7C(uint64_t (*a1)(void, void, void, void, void, void, void, void, void))
{
  return a1(v1[10], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_21F1BFEBC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21F1BFF04(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

PaymentUIBase::AuthenticationEvent_optional __swiftcall AuthenticationEvent.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_21F1C3250();
  result.value = swift_bridgeObjectRelease();
  char v5 = 12;
  if (v3 < 0xC) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t AuthenticationEvent.rawValue.getter()
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
    case 2:
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0x64726F7773736170;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0xD000000000000016;
      break;
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 0xA:
      unint64_t result = 0x4370556570697773;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21F1C0144()
{
  return sub_21F1C01A8();
}

unint64_t sub_21F1C0154()
{
  unint64_t result = qword_26AD3F870;
  if (!qword_26AD3F870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD3F870);
  }
  return result;
}

uint64_t sub_21F1C01A8()
{
  unint64_t v0 = AuthenticationEvent.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == AuthenticationEvent.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21F1C3260();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21F1C0240()
{
  return sub_21F1C32A0();
}

uint64_t sub_21F1C02A8()
{
  AuthenticationEvent.rawValue.getter();
  sub_21F1C3070();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F1C030C()
{
  return sub_21F1C32A0();
}

PaymentUIBase::AuthenticationEvent_optional sub_21F1C0370(Swift::String *a1)
{
  return AuthenticationEvent.init(rawValue:)(*a1);
}

unint64_t sub_21F1C037C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AuthenticationEvent.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationEvent(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AuthenticationEvent(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x21F1C0500);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationEvent()
{
  return &type metadata for AuthenticationEvent;
}

void AppleIDSignInView.init(inAppContext:delegate:)(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F292F8]), sel_init);
  objc_msgSend(a1, sel_setPresentingViewController_, v6);
  objc_msgSend(v6, sel_setContext_, a1);
  objc_msgSend(v6, sel_setDelegate_, a2);

  swift_unknownObjectRelease();
  *a3 = v6;
}

id AppleIDSignInView.makeUIViewController(context:)()
{
  return *v0;
}

void AppleIDSignInView.updateUIViewController(_:context:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_view);
  if (v1)
  {
    int v2 = v1;
    id v3 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);
  }
  else
  {
    __break(1u);
  }
}

void AppleIDSignInView.sizeThatFits(_:uiViewController:context:)(uint64_t a1, char a2, uint64_t a3, char a4, id a5)
{
  id v9 = objc_msgSend(a5, sel_view);
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_subviews);

  sub_21F1C07F0();
  unint64_t v12 = sub_21F1C30B0();

  if (!(v12 >> 62))
  {
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_21F1C3200();
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_13;
  }
LABEL_4:
  if ((v12 & 0xC000000000000001) != 0)
  {
LABEL_14:
    id v13 = (id)MEMORY[0x223C46640](0, v12);
    goto LABEL_7;
  }
  if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  id v13 = *(id *)(v12 + 32);
LABEL_7:
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  double v16 = *(double *)&a1;
  double v17 = 10.0;
  if (a2) {
    double v16 = 10.0;
  }
  HIDWORD(v18) = HIDWORD(a3);
  if ((a4 & 1) == 0) {
    double v17 = *(double *)&a3;
  }
  LODWORD(v18) = 1148846080;
  LODWORD(v15) = 1112014848;
  objc_msgSend(v14, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v16, v17, v18, v15);
}

unint64_t sub_21F1C07F0()
{
  unint64_t result = qword_267EC4588;
  if (!qword_267EC4588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EC4588);
  }
  return result;
}

BOOL static AppleIDSignInView.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_21F1C0848()
{
  unint64_t result = qword_267EC4590;
  if (!qword_267EC4590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4590);
  }
  return result;
}

void sub_21F1C089C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_view);
  if (v1)
  {
    int v2 = v1;
    id v3 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);
  }
  else
  {
    __break(1u);
  }
}

void sub_21F1C0930(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
}

BOOL sub_21F1C0964(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21F1C0978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21F1C0A78();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_21F1C09DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_21F1C0A78();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_21F1C0A40()
{
}

ValueMetadata *type metadata accessor for AppleIDSignInView()
{
  return &type metadata for AppleIDSignInView;
}

unint64_t sub_21F1C0A78()
{
  unint64_t result = qword_267EC4598;
  if (!qword_267EC4598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EC4598);
  }
  return result;
}

uint64_t AuthorizationModel.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AuthorizationModel.init()();
  return v0;
}

uint64_t AuthorizationModel.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned int v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  uint64_t v9 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_21F1C0CE8((uint64_t)v14, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F860);
  sub_21F1C2530();
  sub_21F1C0D50((uint64_t)v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  uint64_t v10 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  LOBYTE(v14[0]) = 1;
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v10, v4, v1);
  return v0;
}

uint64_t sub_21F1C0CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F860);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F1C0D50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F860);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AuthorizationModel.__allocating_init(headerTitle:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 16) = 0;
  uint64_t v9 = v8 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  sub_21F1C0CE8((uint64_t)v13, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F860);
  sub_21F1C2530();
  sub_21F1C0D50((uint64_t)v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9, v7, v4);
  LOBYTE(v13[0]) = 1;
  sub_21F1C2530();
  swift_beginAccess();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t AuthorizationModel.init(headerTitle:)(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 16) = 0;
  uint64_t v12 = v2 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_21F1C0CE8((uint64_t)v17, (uint64_t)v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F860);
  sub_21F1C2530();
  sub_21F1C0D50((uint64_t)v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  uint64_t v13 = v2 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  LOBYTE(v17[0]) = 1;
  sub_21F1C2530();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v15;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_21F1C1168@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 120))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21F1C11B4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 128);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_21F1C121C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21F1C1268(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21F1C12BC())()
{
  return j__swift_endAccess;
}

uint64_t sub_21F1C1310(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 160))();
}

uint64_t sub_21F1C1354(uint64_t a1, uint64_t a2)
{
  sub_21F1C0CE8(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 168))(v4);
}

uint64_t sub_21F1C13B0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  return swift_release();
}

uint64_t sub_21F1C1428(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C0CE8(a1, (uint64_t)v3);
  swift_retain();
  sub_21F1C2580();
  return sub_21F1C0D50(a1);
}

uint64_t (*sub_21F1C14A8(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F1C1534(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 184))();
}

uint64_t sub_21F1C1578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EC45A0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 192))(v6);
}

uint64_t sub_21F1C1668()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError, &qword_26AD3F8E8);
}

uint64_t sub_21F1C167C(uint64_t a1)
{
  return sub_21F1C1B14(a1, (uint64_t *)&unk_267EC45A0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError, &qword_26AD3F8E8);
}

uint64_t (*sub_21F1C1698(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EC45A0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E8);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t sub_21F1C17A8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 208))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21F1C17F8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 216))(*a1);
}

uint64_t sub_21F1C1840()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21F1C2570();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21F1C18B4()
{
  return sub_21F1C2580();
}

uint64_t (*sub_21F1C1924(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_21F1C2560();
  return sub_21F18C8AC;
}

uint64_t sub_21F1C19B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 232))();
}

uint64_t sub_21F1C19F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  MEMORY[0x270FA5388](v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 240))(v6);
}

uint64_t sub_21F1C1AE4()
{
  return sub_21F19047C((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet, &qword_26AD3F928);
}

uint64_t sub_21F1C1AF8(uint64_t a1)
{
  return sub_21F1C1B14(a1, &qword_26AD3F8E0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet, &qword_26AD3F928);
}

uint64_t sub_21F1C1B14(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_21F1C2550();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_21F1C1C44(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  sub_21F1C2540();
  swift_endAccess();
  return sub_21F18CB68;
}

uint64_t AuthorizationModel.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t AuthorizationModel.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F8E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD3F928);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_21F1C1F00@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AuthorizationModel();
  uint64_t result = sub_21F1C2520();
  *a1 = result;
  return result;
}

uint64_t sub_21F1C1F40()
{
  return type metadata accessor for AuthorizationModel();
}

uint64_t type metadata accessor for AuthorizationModel()
{
  uint64_t result = qword_26AD401C0;
  if (!qword_26AD401C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21F1C1F94()
{
  sub_21F1C2310();
  if (v0 <= 0x3F)
  {
    sub_21F1C236C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AuthorizationModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AuthorizationModel);
}

uint64_t dispatch thunk of AuthorizationModel.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AuthorizationModel.__allocating_init(headerTitle:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AuthorizationModel.headerTitle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of AuthorizationModel.headerTitle.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of AuthorizationModel.headerTitle.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of AuthorizationModel.showPaymentSheetFooter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of AuthorizationModel.showPaymentSheetFooterAmount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of AuthorizationModel.authorizationError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of AuthorizationModel.authorizationError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of AuthorizationModel.authorizationError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AuthorizationModel.$authorizationError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AuthorizationModel.$authorizationError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of AuthorizationModel.$authorizationError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AuthorizationModel.canShowDetailSheet.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AuthorizationModel.canShowDetailSheet.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of AuthorizationModel.canShowDetailSheet.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AuthorizationModel.$canShowDetailSheet.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AuthorizationModel.$canShowDetailSheet.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AuthorizationModel.$canShowDetailSheet.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

void sub_21F1C2310()
{
  if (!qword_26AD3F8F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD3F860);
    unint64_t v0 = sub_21F1C2590();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD3F8F0);
    }
  }
}

void sub_21F1C236C()
{
  if (!qword_26AD3F2D8)
  {
    unint64_t v0 = sub_21F1C2590();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD3F2D8);
    }
  }
}

uint64_t dispatch thunk of AuthenticatorGlyph.localizedTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.symbol.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.showsPhysicalButtonHint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.physicalButtonConfirmationTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.physicalButtonEdge.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.stateTransitionCompletionHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.needUserIntent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_21F1C2450()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_21F1C2460()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_21F1C2470()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21F1C2480()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_21F1C2490()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21F1C24A0()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_21F1C24B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21F1C24C0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21F1C24D0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21F1C24E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21F1C24F0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21F1C2500()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21F1C2510()
{
  return MEMORY[0x270EE3868]();
}

uint64_t sub_21F1C2520()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21F1C2530()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_21F1C2540()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_21F1C2550()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_21F1C2560()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_21F1C2570()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_21F1C2580()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_21F1C2590()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_21F1C25A0()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_21F1C25B0()
{
  return MEMORY[0x270EE4018]();
}

uint64_t sub_21F1C25C0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_21F1C25D0()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_21F1C25E0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_21F1C25F0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_21F1C2600()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_21F1C2610()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_21F1C2620()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_21F1C2630()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_21F1C2640()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_21F1C2650()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_21F1C2660()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_21F1C2680()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_21F1C2690()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_21F1C26A0()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_21F1C26B0()
{
  return MEMORY[0x270F00078]();
}

uint64_t sub_21F1C26C0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_21F1C26D0()
{
  return MEMORY[0x270F001F0]();
}

uint64_t sub_21F1C2700()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_21F1C2710()
{
  return MEMORY[0x270F003C0]();
}

uint64_t sub_21F1C2720()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_21F1C2730()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_21F1C2740()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_21F1C2750()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_21F1C2760()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_21F1C2770()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_21F1C2780()
{
  return MEMORY[0x270F00918]();
}

uint64_t sub_21F1C2790()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_21F1C27A0()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_21F1C27B0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_21F1C27C0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_21F1C27D0()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_21F1C27E0()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_21F1C27F0()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_21F1C2800()
{
  return MEMORY[0x270F00B38]();
}

uint64_t sub_21F1C2810()
{
  return MEMORY[0x270F00B40]();
}

uint64_t sub_21F1C2820()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_21F1C2830()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_21F1C2840()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_21F1C2850()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_21F1C2860()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_21F1C2870()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_21F1C2880()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_21F1C2890()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_21F1C28A0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_21F1C28B0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_21F1C28C0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_21F1C28D0()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_21F1C28E0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_21F1C28F0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_21F1C2900()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_21F1C2910()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_21F1C2920()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_21F1C2930()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_21F1C2940()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_21F1C2950()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_21F1C2960()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_21F1C2970()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_21F1C2980()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_21F1C2990()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_21F1C29B0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_21F1C29C0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_21F1C29D0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_21F1C29E0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_21F1C29F0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_21F1C2A00()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_21F1C2A20()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_21F1C2A30()
{
  return MEMORY[0x270F017E8]();
}

uint64_t sub_21F1C2A40()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_21F1C2A50()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_21F1C2A60()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_21F1C2A70()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_21F1C2A80()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_21F1C2A90()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_21F1C2AA0()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_21F1C2AB0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_21F1C2AC0()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_21F1C2AD0()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_21F1C2AF0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_21F1C2B00()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_21F1C2B10()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_21F1C2B30()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_21F1C2B40()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_21F1C2B50()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_21F1C2B60()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_21F1C2B70()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_21F1C2B80()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_21F1C2B90()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_21F1C2BA0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_21F1C2BB0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_21F1C2BC0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_21F1C2BD0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_21F1C2BE0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_21F1C2BF0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_21F1C2C00()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_21F1C2C10()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_21F1C2C20()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_21F1C2C30()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_21F1C2C40()
{
  return MEMORY[0x270F02D20]();
}

uint64_t sub_21F1C2C50()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_21F1C2C60()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_21F1C2C70()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_21F1C2C80()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_21F1C2C90()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_21F1C2CA0()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_21F1C2CB0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_21F1C2CC0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_21F1C2CD0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_21F1C2CE0()
{
  return MEMORY[0x270F03340]();
}

uint64_t sub_21F1C2CF0()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_21F1C2D00()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_21F1C2D10()
{
  return MEMORY[0x270F03880]();
}

uint64_t sub_21F1C2D20()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_21F1C2D30()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_21F1C2D40()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_21F1C2D50()
{
  return MEMORY[0x270F03F78]();
}

uint64_t sub_21F1C2D60()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_21F1C2D70()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_21F1C2D80()
{
  return MEMORY[0x270F04108]();
}

uint64_t sub_21F1C2D90()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_21F1C2DA0()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_21F1C2DB0()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_21F1C2DC0()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_21F1C2DD0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_21F1C2DE0()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_21F1C2DF0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_21F1C2E00()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_21F1C2E10()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_21F1C2E20()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_21F1C2E30()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_21F1C2E40()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_21F1C2E50()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_21F1C2E60()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_21F1C2E70()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_21F1C2E80()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_21F1C2E90()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_21F1C2EA0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_21F1C2EB0()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_21F1C2EC0()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_21F1C2ED0()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_21F1C2EE0()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_21F1C2EF0()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_21F1C2F00()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_21F1C2F10()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_21F1C2F20()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_21F1C2F30()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_21F1C2F40()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_21F1C2F50()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_21F1C2F60()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_21F1C2F70()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_21F1C2F80()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_21F1C2F90()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_21F1C2FA0()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_21F1C2FB0()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_21F1C2FC0()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_21F1C2FD0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_21F1C2FE0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21F1C2FF0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21F1C3000()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21F1C3010()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21F1C3020()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21F1C3030()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_21F1C3040()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21F1C3050()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21F1C3060()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21F1C3070()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21F1C3080()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21F1C30A0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_21F1C30B0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21F1C30C0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21F1C30D0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21F1C30E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21F1C30F0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21F1C3100()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21F1C3110()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_21F1C3120()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21F1C3130()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21F1C3140()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21F1C3150()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21F1C3160()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21F1C3170()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21F1C3180()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21F1C3190()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21F1C31A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21F1C31B0()
{
  return MEMORY[0x270F9ED50]();
}

uint64_t sub_21F1C31C0()
{
  return MEMORY[0x270F9ED58]();
}

uint64_t sub_21F1C31D0()
{
  return MEMORY[0x270F9ED60]();
}

uint64_t sub_21F1C31E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21F1C31F0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21F1C3200()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21F1C3210()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21F1C3220()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21F1C3230()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21F1C3240()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21F1C3250()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21F1C3260()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21F1C3270()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21F1C3280()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21F1C3290()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21F1C32A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21F1C32B0()
{
  return MEMORY[0x270F9FD48]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t LAUIPhysicalButtonNormalizedFrame()
{
  return MEMORY[0x270F47930]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_homeButtonType()
{
  return MEMORY[0x270F96138]();
}

uint64_t MobileGestalt_get_pearlIDCapability()
{
  return MEMORY[0x270F96188]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtAnyKeyPath()
{
  return MEMORY[0x270FA0308]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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