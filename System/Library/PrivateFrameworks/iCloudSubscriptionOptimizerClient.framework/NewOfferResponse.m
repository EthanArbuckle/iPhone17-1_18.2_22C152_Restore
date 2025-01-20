@interface NewOfferResponse
- (BOOL)shouldDisplayOfferNow;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse)init;
- (id)error;
- (id)toContext;
@end

@implementation NewOfferResponse

- (id)toContext
{
  v2 = self;
  sub_228A9D7DC();

  v3 = (void *)sub_228AAD610();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)error
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError);
  if (v2)
  {
    id v3 = v2;
    v4 = (void *)sub_228AACF30();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)description
{
  v2 = self;
  sub_228A9DAB4();

  id v3 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v2 = self;
  id v3 = [(NewOfferResponse *)v2 description];
  sub_228AAD660();

  v4 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)shouldDisplayOfferNow
{
  v2 = self;
  char v3 = sub_228A9DCCC();

  return v3 & 1;
}

- (_TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse)init
{
  result = (_TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_228A9D3AC((uint64_t)self + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context);
  char v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError);
}

@end