@interface EnterCurrencyAmountView.Coordinator
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (_TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator)init;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
@end

@implementation EnterCurrencyAmountView.Coordinator

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  LOBYTE(a5) = sub_19FD7E700(a3, (uint64_t)a4, (uint64_t)a5);

  return a5 & 1;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_19FD7EAA4(a3);
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19FD7FFA0(a4);
}

- (_TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator)init
{
  result = (_TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator_keypadSuggestionSelected);

  sub_19F48BB68(v3);
}

@end