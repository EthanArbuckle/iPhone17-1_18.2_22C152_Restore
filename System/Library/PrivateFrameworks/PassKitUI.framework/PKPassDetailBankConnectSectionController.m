@interface PKPassDetailBankConnectSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (FKInstitution)connectedInstitution;
- (NSArray)allSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (_TtC9PassKitUI40PKPassDetailBankConnectSectionController)init;
- (_TtC9PassKitUI40PKPassDetailBankConnectSectionController)initWithPass:(id)a3 delegate:(id)a4 throwsError:(id *)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (id)titleForHeaderInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)bankConnectAccountDidChange:(id)a3;
- (void)bankConnectConsentStatusDidChange:(unint64_t)a3;
- (void)preflight:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (void)updatePass:(id)a3;
@end

@implementation PKPassDetailBankConnectSectionController

- (NSArray)allSectionIdentifiers
{
  v2 = (void *)sub_1A03B4C38();

  return (NSArray *)v2;
}

- (NSArray)sectionIdentifiers
{
  v2 = self;
  PKPassDetailBankConnectSectionController.sectionIdentifiers.getter();

  v3 = (void *)sub_1A03B4C38();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC9PassKitUI40PKPassDetailBankConnectSectionController)initWithPass:(id)a3 delegate:(id)a4 throwsError:(id *)a5
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC9PassKitUI40PKPassDetailBankConnectSectionController *)PKPassDetailBankConnectSectionController.init(pass:delegate:)(v5);
}

- (void)preflight:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A4920);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_1A03B4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E94B6DA8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E94A4950;
  v13[5] = v12;
  v14 = self;
  sub_19FCC1A38((uint64_t)v8, (uint64_t)&unk_1E94AC6A0, (uint64_t)v13);
  swift_release();
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return PKBankConnectAvailableForPass();
}

- (void)updatePass:(id)a3
{
  id pass = a3;
  v4 = self;
  PKPassDetailBankConnectSectionController.update(pass:)((PKPaymentPass)pass);
}

- (FKInstitution)connectedInstitution
{
  v2 = self;
  v3 = PKPassDetailBankConnectSectionController.connectedInstitution.getter();

  return (FKInstitution *)v3;
}

- (_TtC9PassKitUI40PKPassDetailBankConnectSectionController)init
{
  result = (_TtC9PassKitUI40PKPassDetailBankConnectSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_pass));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_accountProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_institutionMatcher));
  sub_19FCC1E7C(*(void **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState), *(unint64_t *)((char *)&self->super._currentSegment+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState), *(void **)((char *)&self->super._detailViewStyle+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState), *((unsigned char *)&self->super._primaryTextColor+ OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_connectionState));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI40PKPassDetailBankConnectSectionController_delegate;

  sub_19F482DB0((uint64_t)v3);
}

- (void)bankConnectAccountDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  PKPassDetailBankConnectSectionController.accountDidChange(to:)(a3);
}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  v4 = self;
  PKPassDetailBankConnectSectionController.consentStatusDidChange(to:)(a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1A03AF498();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  uint64_t v12 = sub_1A03B4988();
  uint64_t v14 = v13;
  id v15 = a3;
  v16 = self;
  PKPassDetailBankConnectSectionController.tableView(_:cellForRowAt:sectionIdentifier:)((uint64_t)v15, (uint64_t)v11, v12, v14);
  v18 = v17;

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v18;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  uint64_t v4 = sub_1A03B4988();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  _s9PassKitUI40PKPassDetailBankConnectSectionControllerC14titleForHeader02inH10IdentifierSSSgSS_tF_0(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v10 = (void *)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  uint64_t v4 = sub_1A03B4988();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = PKPassDetailBankConnectSectionController.titleForFooter(inSectionIdentifier:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v10 = (void *)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1A03AF498();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  uint64_t v12 = sub_1A03B4988();
  uint64_t v14 = v13;
  id v15 = a3;
  v16 = self;
  PKPassDetailBankConnectSectionController.tableView(_:didSelectRowAt:sectionIdentifier:)(v15, (uint64_t)v11, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  uint64_t v6 = sub_1A03B4988();
  uint64_t v8 = v7;
  id v9 = a3;
  uint64_t v10 = self;
  int64_t v11 = sub_19FCC28D0(v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

@end