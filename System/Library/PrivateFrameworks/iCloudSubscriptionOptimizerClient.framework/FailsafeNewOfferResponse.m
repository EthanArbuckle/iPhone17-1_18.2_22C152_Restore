@interface FailsafeNewOfferResponse
- (BOOL)shouldDisplayOfferNow;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC33iCloudSubscriptionOptimizerClient24FailsafeNewOfferResponse)init;
- (id)error;
- (id)toContext;
@end

@implementation FailsafeNewOfferResponse

- (id)toContext
{
  uint64_t v2 = qword_268290A20;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();

  v4 = (void *)sub_228AAD610();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)error
{
  return 0;
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_228A99648();

  v3 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  v3 = [(FailsafeNewOfferResponse *)v2 description];
  sub_228AAD660();

  v4 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)shouldDisplayOfferNow
{
  return 1;
}

- (_TtC33iCloudSubscriptionOptimizerClient24FailsafeNewOfferResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FailsafeNewOfferResponse();
  return [(FailsafeNewOfferResponse *)&v3 init];
}

@end