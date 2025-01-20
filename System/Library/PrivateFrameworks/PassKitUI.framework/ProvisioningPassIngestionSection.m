@interface ProvisioningPassIngestionSection
- (_TtC9PassKitUI32ProvisioningPassIngestionSection)init;
@end

@implementation ProvisioningPassIngestionSection

- (_TtC9PassKitUI32ProvisioningPassIngestionSection)init
{
  result = (_TtC9PassKitUI32ProvisioningPassIngestionSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI32ProvisioningPassIngestionSection_provisionedPasses));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI32ProvisioningPassIngestionSection_delegate);

  swift_bridgeObjectRelease();
}

@end