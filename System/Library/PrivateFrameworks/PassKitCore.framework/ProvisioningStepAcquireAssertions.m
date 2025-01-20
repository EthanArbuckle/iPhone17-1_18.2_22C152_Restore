@interface ProvisioningStepAcquireAssertions
- (_TtC11PassKitCore33ProvisioningStepAcquireAssertions)init;
- (void)dealloc;
@end

@implementation ProvisioningStepAcquireAssertions

- (void)dealloc
{
  v2 = self;
  ProvisioningStepAcquireAssertions.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  sub_190E7E498(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential), *(void *)&self->context[OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential], *(void *)&self->credential[OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential], self->credential[OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential + 8]);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_sharedState);
}

- (_TtC11PassKitCore33ProvisioningStepAcquireAssertions)init
{
  result = (_TtC11PassKitCore33ProvisioningStepAcquireAssertions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end