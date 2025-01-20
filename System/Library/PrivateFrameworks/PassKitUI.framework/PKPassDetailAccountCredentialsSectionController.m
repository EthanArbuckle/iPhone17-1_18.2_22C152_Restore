@interface PKPassDetailAccountCredentialsSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (NSArray)allSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController)init;
- (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController)initWithPass:(id)a3 delegate:(id)a4 throwsError:(id *)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)bankConnectAccountDidChange:(id)a3;
- (void)bankConnectConsentStatusDidChange:(unint64_t)a3;
- (void)fetchPaymentInformationWithCompletion:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (void)updatePass:(id)a3;
@end

@implementation PKPassDetailAccountCredentialsSectionController

- (NSArray)allSectionIdentifiers
{
  v2 = (void *)sub_1A03B4C38();

  return (NSArray *)v2;
}

- (NSArray)sectionIdentifiers
{
  v2 = self;
  PKPassDetailAccountCredentialsSectionController.sectionIdentifiers.getter();

  v3 = (void *)sub_1A03B4C38();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController)initWithPass:(id)a3 delegate:(id)a4 throwsError:(id *)a5
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *)PKPassDetailAccountCredentialsSectionController.init(pass:delegate:)(v5);
}

- (void)fetchPaymentInformationWithCompletion:(id)a3
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
  v12[4] = &unk_1E94A4948;
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
  id v4 = a3;
  uint64_t v5 = self;
  PKPassDetailAccountCredentialsSectionController.update(pass:)((PKPaymentPass)v4);
}

- (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController)init
{
  result = (_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_delegate);
  sub_19F68A8C8(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_connectionState), *(void **)((char *)&self->super._currentSegment+ OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_connectionState));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_pass));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController_accountProvider);
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
  id v18 = PKPassDetailAccountCredentialsSectionController.tableView(_:cellForRowAt:sectionIdentifier:)((uint64_t)v15, v17, v12, v14);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v18;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  if (sub_1A03B4988() == 0xD000000000000019 && v4 == 0x80000001A0446080)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1A03B5CC8();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1A03AF498();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  id v12 = a3;
  uint64_t v13 = self;
  _s9PassKitUI47PKPassDetailAccountCredentialsSectionControllerC9tableView_14didSelectRowAt17sectionIdentifierySo07UITableK0C_10Foundation9IndexPathVSStF_0(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)bankConnectAccountDidChange:(id)a3
{
  id v5 = a3;
  char v6 = self;
  PKPassDetailAccountCredentialsSectionController.accountDidChange(to:)(a3);
}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  uint64_t v4 = self;
  PKPassDetailAccountCredentialsSectionController.consentStatusDidChange(to:)(a3);
}

@end