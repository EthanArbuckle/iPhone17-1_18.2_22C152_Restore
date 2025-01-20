@interface OfferUpsellScenarioProvider
- (_TtC12NewsArticles27OfferUpsellScenarioProvider)init;
- (int64_t)offerUpsellScenario;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation OfferUpsellScenarioProvider

- (_TtC12NewsArticles27OfferUpsellScenarioProvider)init
{
  uint64_t v3 = OBJC_IVAR____TtC12NewsArticles27OfferUpsellScenarioProvider_observers;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(self, sel_weakObjectsHashTable);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles27OfferUpsellScenarioProvider_didProcessInitialOffer) = 0;

  result = (_TtC12NewsArticles27OfferUpsellScenarioProvider *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (int64_t)offerUpsellScenario
{
  v2 = self;
  int64_t v3 = sub_1BF5CD864();

  return v3;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

@end