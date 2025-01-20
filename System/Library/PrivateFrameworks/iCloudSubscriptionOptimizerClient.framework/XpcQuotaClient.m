@interface XpcQuotaClient
- (_TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient)init;
- (id)failsafeDelayedOfferJsonContext;
- (id)parseDelayedOffer:(id)a3;
- (id)parseDelayedOfferFromJson:(id)a3;
- (id)parseNotification:(id)a3;
- (void)clearNotificationState:(id)a3;
- (void)isNotificationPending:(id)a3;
- (void)logFailsafeEvent:(id)a3;
- (void)newOffer:(id)a3 andCallback:(id)a4;
@end

@implementation XpcQuotaClient

- (_TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient)init
{
  uint64_t v2 = sub_228AACF70();
  swift_allocObject();
  uint64_t v3 = sub_228AACF60();
  v9[3] = v2;
  v9[4] = MEMORY[0x263F88AA8];
  v9[0] = v3;
  v4 = (objc_class *)type metadata accessor for XpcQuotaClient();
  id v5 = objc_allocWithZone(v4);
  sub_228A98864((uint64_t)v9, (uint64_t)v5 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient);
  v8.receiver = v5;
  v8.super_class = v4;
  swift_retain();
  v6 = [(XpcQuotaClient *)&v8 init];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (id)parseNotification:(id)a3
{
  uint64_t v4 = sub_228AAD620();
  id v5 = self;
  id v6 = sub_228AAC07C(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)newOffer:(id)a3 andCallback:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_228AAA118(v8, (void (*)(void))sub_228AACCB4, v7);

  swift_release();
}

- (void)isNotificationPending:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_228AACFB0();
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = qword_26AF0C500;
  v12 = self;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_228AAD5C0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26AF0C4E8);
  sub_228AAD590();
  v14 = (void *)swift_allocObject();
  v14[2] = sub_228AACED8;
  v14[3] = v10;
  v14[4] = ObjectType;
  sub_228AACD60(&qword_26AF0C378, MEMORY[0x263F88AC0]);
  swift_retain();
  sub_228AACF50();
  uint64_t v15 = *(void *)&v12->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 16];
  uint64_t v16 = *(void *)&v12->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v12->super.super.isa+ OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient), v15);
  (*(void (**)(char *, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v16 + 8))(v8, sub_228AACCA8, v14, v15, v16);
  swift_release();
  sub_228AACE78((uint64_t)v8, MEMORY[0x263F88AC0]);

  swift_release();
}

- (void)clearNotificationState:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_228AACFB0();
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  sub_228AACD60(&qword_26AF0C378, MEMORY[0x263F88AC0]);
  uint64_t v11 = self;
  sub_228AACF50();
  uint64_t v12 = *(void *)&v11->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 16];
  uint64_t v13 = *(void *)&v11->protoClient[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient
                                   + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v11->super.super.isa+ OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient), v12);
  v14 = (void *)swift_allocObject();
  v14[2] = sub_228A9D29C;
  v14[3] = v10;
  v14[4] = ObjectType;
  uint64_t v15 = *(void (**)(char *, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v13 + 8);
  swift_retain();
  v15(v8, sub_228AACC34, v14, v12, v13);
  swift_release();
  sub_228AACE78((uint64_t)v8, MEMORY[0x263F88AC0]);

  swift_release();
}

- (id)parseDelayedOffer:(id)a3
{
  uint64_t v3 = qword_26AF0C500;
  uint64_t v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_228AAD5C0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26AF0C4E8);
  sub_228AAD5B0();

  return 0;
}

- (id)parseDelayedOfferFromJson:(id)a3
{
  uint64_t v4 = sub_228AAD660();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = sub_228AAC560(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)failsafeDelayedOfferJsonContext
{
  sub_228AAD3A0();
  uint64_t v2 = (void *)sub_228AAD650();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)logFailsafeEvent:(id)a3
{
  uint64_t v4 = sub_228AAD660();
  uint64_t v6 = v5;
  uint64_t v7 = qword_26AF0C518;
  id v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  sub_228A98864(qword_26AF0C510 + 16, (uint64_t)v10);
  type metadata accessor for FailsafeClientLibEvent();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v9 = FailsafeClientLibEvent.init(withSink:failsafeEvent:)((uint64_t)v10, v4, v6);
  (*(void (**)(uint64_t))(*(void *)v9 + 200))(v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void).cxx_destruct
{
}

@end