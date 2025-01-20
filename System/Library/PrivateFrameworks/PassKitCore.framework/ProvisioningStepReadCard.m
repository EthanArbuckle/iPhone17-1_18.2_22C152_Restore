@interface ProvisioningStepReadCard
- (_TtC11PassKitCore24ProvisioningStepReadCard)init;
- (void)tapToProvisionReader:(id)a3 didUpdateWithEvent:(int64_t)a4;
@end

@implementation ProvisioningStepReadCard

- (_TtC11PassKitCore24ProvisioningStepReadCard)init
{
  result = (_TtC11PassKitCore24ProvisioningStepReadCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_190E7E498(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential), *(void *)&self->context[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential], *(void *)&self->credential[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential], self->credential[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential + 8]);

  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_commonCompletion));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_readFailureTimeoutTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_eventCooldownTimer));
  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_onDidStartPolling));
  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_onDidFindCard));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_onFailedToReadCard);
  sub_190EF6480(v3);
}

- (void)tapToProvisionReader:(id)a3 didUpdateWithEvent:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_190FAEF84(a4);
}

@end