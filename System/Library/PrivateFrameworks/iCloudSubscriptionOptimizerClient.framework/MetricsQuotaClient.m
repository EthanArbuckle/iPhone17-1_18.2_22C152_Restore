@interface MetricsQuotaClient
- (_TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient)init;
- (id)failsafeDelayedOfferJsonContext;
- (id)parseDelayedOffer:(id)a3;
- (id)parseDelayedOfferFromJson:(id)a3;
- (id)parseNotification:(id)a3;
- (void)clearNotificationState:(id)a3;
- (void)isNotificationPending:(id)a3;
- (void)logFailsafeEvent:(id)a3;
- (void)newOffer:(id)a3 andCallback:(id)a4;
@end

@implementation MetricsQuotaClient

- (void)newOffer:(id)a3 andCallback:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_228A9A914(v8, (uint64_t)sub_228A9D2E4, v7);

  swift_release();
}

- (void)isNotificationPending:(id)a3
{
}

- (void)clearNotificationState:(id)a3
{
}

- (id)parseDelayedOffer:(id)a3
{
  sub_228AAD620();
  v4 = self;
  id v5 = sub_228A9C15C(3, (uint64_t)v4, (uint64_t)v4);

  swift_bridgeObjectRelease();
  return v5;
}

- (id)parseDelayedOfferFromJson:(id)a3
{
  sub_228AAD660();
  v4 = self;
  id v5 = sub_228A9C4D0(4, (uint64_t)v4, (uint64_t)v4);

  swift_bridgeObjectRelease();
  return v5;
}

- (id)parseNotification:(id)a3
{
  swift_getObjectType();
  sub_228AAD620();
  v4 = self;
  swift_bridgeObjectRetain();
  id v5 = (void *)sub_228A9C044(5, (uint64_t)v4, v4);

  swift_bridgeObjectRelease();
  return v5;
}

- (id)failsafeDelayedOfferJsonContext
{
  v2 = self;
  sub_228A9CBC0(6, (uint64_t)v2, (uint64_t)v2);
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_228AAD650();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)logFailsafeEvent:(id)a3
{
  sub_228AAD660();
  uint64_t v4 = self;
  sub_228A9CF20(7, (uint64_t)v4, (uint64_t)v4);

  swift_bridgeObjectRelease();
}

- (_TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient)init
{
  result = (_TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient));
  swift_release();
}

@end