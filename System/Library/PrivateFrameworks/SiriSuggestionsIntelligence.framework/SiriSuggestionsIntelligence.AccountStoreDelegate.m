@interface SiriSuggestionsIntelligence.AccountStoreDelegate
- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C20AccountStoreDelegate)init;
- (id)accountsForAccountManager:(id)a3;
@end

@implementation SiriSuggestionsIntelligence.AccountStoreDelegate

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25DB8DB14();

  type metadata accessor for AIDAServiceType(0);
  sub_25DB91534(0, &qword_26B378060);
  sub_25DB91814((unint64_t *)&unk_26B377FF0, type metadata accessor for AIDAServiceType);
  v6 = (void *)sub_25DC161E0();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C20AccountStoreDelegate)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C20AccountStoreDelegate_servicesOwnerManager));
}

@end