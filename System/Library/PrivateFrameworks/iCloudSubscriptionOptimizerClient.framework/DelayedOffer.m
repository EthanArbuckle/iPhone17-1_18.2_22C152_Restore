@interface DelayedOffer
- (NSString)debugDescription;
- (NSString)description;
- (_TtC33iCloudSubscriptionOptimizerClient12DelayedOffer)init;
- (id)newOfferResponse;
@end

@implementation DelayedOffer

- (id)newOfferResponse
{
  uint64_t v3 = sub_228AAD440();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228A98ED4((uint64_t)self + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient12DelayedOffer_context, (uint64_t)v6);
  v7 = (objc_class *)type metadata accessor for NewOfferResponse();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context];
  sub_228A98ED4((uint64_t)v6, (uint64_t)&v8[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context]);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
  *(void *)&v8[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError] = 0;
  v13.receiver = v8;
  v13.super_class = v7;
  v10 = self;
  v11 = [(DelayedOffer *)&v13 init];
  sub_228A98F38((uint64_t)v6);

  return v11;
}

- (NSString)description
{
  v2 = self;
  sub_228AAD7A0();
  sub_228AAD6C0();
  sub_228AAD440();
  sub_228AAD7C0();
  sub_228AAD6C0();

  uint64_t v3 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = [(DelayedOffer *)v2 description];
  sub_228AAD660();

  uint64_t v4 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC33iCloudSubscriptionOptimizerClient12DelayedOffer)init
{
  result = (_TtC33iCloudSubscriptionOptimizerClient12DelayedOffer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end