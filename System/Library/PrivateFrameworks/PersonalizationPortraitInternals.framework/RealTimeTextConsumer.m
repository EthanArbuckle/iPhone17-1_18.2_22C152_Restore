@interface RealTimeTextConsumer
- (id)consumeInteractionWithContext:(id)a3;
- (id)consumeMessagesContentWithContext:(id)a3;
- (id)consumeRemindersContentWithContext:(id)a3;
- (id)consumeSafariContentWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
@end

@implementation RealTimeTextConsumer

- (id)consumeInteractionWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CA9CB2BC(v4);

  return v6;
}

- (id)consumeSafariContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CA9CB354(v4);

  return v6;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CA9CB4C0(v4);

  return v6;
}

- (id)consumeRemindersContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CA9CB61C(v4);

  return v6;
}

- (id)consumerName
{
  sub_1CA9CB6B0();
  v2 = (void *)sub_1CAB4E2A0();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CA9CB71C(v4);

  return v6;
}

@end