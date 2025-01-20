@interface AppleBalanceEnterAmountView.Coordinator
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (_TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator)init;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
@end

@implementation AppleBalanceEnterAmountView.Coordinator

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_19FA3EC5C((uint64_t)a4, (uint64_t)a5);
  LOBYTE(a5) = v12;

  return a5 & 1;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_19FA3D728(a3);
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_19FA3ED9C(a4);
}

- (_TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator)init
{
  result = (_TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator_accountModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator_configuration));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator_view);
}

@end