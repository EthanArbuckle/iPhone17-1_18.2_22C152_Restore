@interface ProvisioningStepLostMode
- (_TtC11PassKitCore24ProvisioningStepLostMode)init;
@end

@implementation ProvisioningStepLostMode

- (_TtC11PassKitCore24ProvisioningStepLostMode)init
{
  result = (_TtC11PassKitCore24ProvisioningStepLostMode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_190E7E498(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepLostMode_credential), *(void *)&self->context[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepLostMode_credential], *(void *)&self->credential[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepLostMode_credential], self->credential[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepLostMode_credential + 8]);

  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepLostMode_completion));
  swift_unknownObjectRelease();
}

@end