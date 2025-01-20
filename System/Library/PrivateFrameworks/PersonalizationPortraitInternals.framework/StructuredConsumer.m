@interface StructuredConsumer
- (id)consumeInteractionWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
@end

@implementation StructuredConsumer

- (id)consumeInteractionWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1CA9DE7D8(v4);

  return v6;
}

- (id)consumerName
{
  sub_1CA9DEAEC();
  v2 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_1CA9CB71C(v4);

  return v6;
}

@end