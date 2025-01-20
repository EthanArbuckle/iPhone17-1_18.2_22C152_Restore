@interface FundingSourcesModel
- (_TtC9PassKitUI19FundingSourcesModel)init;
- (void)dealloc;
- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4;
@end

@implementation FundingSourcesModel

- (_TtC9PassKitUI19FundingSourcesModel)init
{
  return (_TtC9PassKitUI19FundingSourcesModel *)sub_19FA22D2C();
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel_accountService);
  if (v3) {
    objc_msgSend(v3, sel_unregisterObserver_, self);
  }
  else {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FundingSourcesModel(0);
  [(FundingSourcesModel *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__fetchedSources;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AF5D8);
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__availableSources, v4);
  v5((char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__unavailableSources, v4);
  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__loadingSources;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__loaded, v7);
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__error;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A59A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  v11 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel_accountService);
}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  if (a3)
  {
    sub_19F48BAC4(0, (unint64_t *)&qword_1E94AF5D0);
    uint64_t v5 = sub_1A03B4C58();
  }
  if (a4)
  {
    a4 = (id)sub_1A03B4988();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = self;
  sub_19FA245E8(v5, (uint64_t)a4, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end