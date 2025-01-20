@interface FailsafeDelayedOffer
- (NSString)debugDescription;
- (NSString)description;
- (_TtC33iCloudSubscriptionOptimizerClient20FailsafeDelayedOffer)init;
- (id)newOfferResponse;
@end

@implementation FailsafeDelayedOffer

- (_TtC33iCloudSubscriptionOptimizerClient20FailsafeDelayedOffer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FailsafeDelayedOffer();
  return [(FailsafeDelayedOffer *)&v3 init];
}

- (id)newOfferResponse
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for FailsafeNewOfferResponse());
  return objc_msgSend(v2, sel_init);
}

- (NSString)description
{
  id v2 = self;
  sub_228A992C4();

  objc_super v3 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v2 = self;
  objc_super v3 = [(FailsafeDelayedOffer *)v2 description];
  sub_228AAD660();

  v4 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

@end