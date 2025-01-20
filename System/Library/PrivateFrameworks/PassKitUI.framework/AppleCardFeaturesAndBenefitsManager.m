@interface AppleCardFeaturesAndBenefitsManager
- (_TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager)init;
- (void)accountChanged:(id)a3;
- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)dealloc;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3;
@end

@implementation AppleCardFeaturesAndBenefitsManager

- (_TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager)init
{
  return (_TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager *)sub_19F6EFCD8();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_unregisterObserver_, v4);

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for AppleCardFeaturesAndBenefitsManager();
    [(AppleCardFeaturesAndBenefitsManager *)&v7 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager__sectionItems;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A5C28);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_paymentDataProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_cardController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_accountUserCollection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_checkmarkColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_accountCardNumbersPresenter));
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager____lazy_storage___percentFormatter);
}

- (void)accountChanged:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_19F6F9638(a3);
}

- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1A03B4988();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  objc_super v7 = self;
  sub_19F6FBC00(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
}

@end